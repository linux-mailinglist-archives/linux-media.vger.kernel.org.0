Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6543867C
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2019 10:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfFGIpi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jun 2019 04:45:38 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:44185 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726671AbfFGIpi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 7 Jun 2019 04:45:38 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ZAV9hB52E3qlsZAVDhrQ7K; Fri, 07 Jun 2019 10:45:35 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.2] videobuf2-core.c: always reacquire USERPTR memory
Message-ID: <69e87f9a-a5ce-8c85-3862-de552f83f13e@xs4all.nl>
Date:   Fri, 7 Jun 2019 10:45:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfD+pgd2BE83ipP+V7C7A639opi5ZIPAU+C9FWVnTCZUfapWP6rsjfwqbpnM4/E4WOL0WHhLQG1+vB7ZlTWJEVRyumXP6Nyvbt5H4BXKTdzIqqCE7z8XC
 WLrQkEANFFOc3nRvbr0ciJjz99bYVS6kYjEE0YrrtcosduOORpsxMwLyBz5ggwYmLruGun3mqYoLF9fK9NBtfa3+LqAn92JmhqVzQlvtJ/kgJ0jZeAzEdD4R
 jlPk/fexrCemOrjTXbYnmhbJpqcyDmtFnUh99X8t0m4OdY1qCbQRrelyau1MBZWXMmQw+wumsIBh5d0eWh9oKYQ71hqG6PU3c1k/89PM6m8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The __prepare_userptr() function made the incorrect assumption that if the
same user pointer was used as the last one for which memory was acquired, then
there was no need to re-acquire the memory. This assumption was never properly
tested, and after doing that it became clear that this was in fact wrong.

Change the behavior to always reacquire memory.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: Tomasz Figa <tfiga@chromium.org>
Cc: <stable@vger.kernel.org>      # for v5.1 and up
---
This should be backported to all stable kernels, unfortunately this patch only
applies cleanly to 5.1, so this has to be backported manually.
---
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 4489744fbbd9..a6400391117f 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -1013,7 +1013,7 @@ static int __prepare_userptr(struct vb2_buffer *vb)
 	void *mem_priv;
 	unsigned int plane;
 	int ret = 0;
-	bool reacquired = vb->planes[0].mem_priv == NULL;
+	bool called_cleanup = false;

 	memset(planes, 0, sizeof(planes[0]) * vb->num_planes);
 	/* Copy relevant information provided by the userspace */
@@ -1023,15 +1023,6 @@ static int __prepare_userptr(struct vb2_buffer *vb)
 		return ret;

 	for (plane = 0; plane < vb->num_planes; ++plane) {
-		/* Skip the plane if already verified */
-		if (vb->planes[plane].m.userptr &&
-			vb->planes[plane].m.userptr == planes[plane].m.userptr
-			&& vb->planes[plane].length == planes[plane].length)
-			continue;
-
-		dprintk(3, "userspace address for plane %d changed, reacquiring memory\n",
-			plane);
-
 		/* Check if the provided plane buffer is large enough */
 		if (planes[plane].length < vb->planes[plane].min_length) {
 			dprintk(1, "provided buffer size %u is less than setup size %u for plane %d\n",
@@ -1044,8 +1035,8 @@ static int __prepare_userptr(struct vb2_buffer *vb)

 		/* Release previously acquired memory if present */
 		if (vb->planes[plane].mem_priv) {
-			if (!reacquired) {
-				reacquired = true;
+			if (!called_cleanup) {
+				called_cleanup = true;
 				vb->copied_timestamp = 0;
 				call_void_vb_qop(vb, buf_cleanup, vb);
 			}
@@ -1083,17 +1074,14 @@ static int __prepare_userptr(struct vb2_buffer *vb)
 		vb->planes[plane].data_offset = planes[plane].data_offset;
 	}

-	if (reacquired) {
-		/*
-		 * One or more planes changed, so we must call buf_init to do
-		 * the driver-specific initialization on the newly acquired
-		 * buffer, if provided.
-		 */
-		ret = call_vb_qop(vb, buf_init, vb);
-		if (ret) {
-			dprintk(1, "buffer initialization failed\n");
-			goto err;
-		}
+	/*
+	 * Call buf_init to do the driver-specific initialization on
+	 * the newly acquired buffer.
+	 */
+	ret = call_vb_qop(vb, buf_init, vb);
+	if (ret) {
+		dprintk(1, "buffer initialization failed\n");
+		goto err;
 	}

 	ret = call_vb_qop(vb, buf_prepare, vb);
