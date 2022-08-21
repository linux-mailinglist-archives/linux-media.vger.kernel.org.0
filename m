Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55B7B59B688
	for <lists+linux-media@lfdr.de>; Sun, 21 Aug 2022 23:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbiHUVvB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Aug 2022 17:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231822AbiHUVvA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Aug 2022 17:51:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A18E205E4
        for <linux-media@vger.kernel.org>; Sun, 21 Aug 2022 14:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661118656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t7dC7NDfGX7Y/cZVoS4u5giB9bv/f9bDCicbc12GB1M=;
        b=Bl8GWtgX0E+OHO1z91CRR43zrsofXtaNoK2YBjCEpVd/ZswxuAZZLxczbdeO7g9uNJ2D5C
        hG2wU3F9DBRNPzTsyYINPIs5GDMZvlC8XoykdfC1EDH4a48NI6R+liyCEoS03COyyfWZ6e
        I95/W2T1mouo/cWzSo+B3+0Zjocs70Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-xX9kyP1fOyiPVQjCSVO4iw-1; Sun, 21 Aug 2022 17:50:50 -0400
X-MC-Unique: xX9kyP1fOyiPVQjCSVO4iw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE9F6185A79C;
        Sun, 21 Aug 2022 21:50:49 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6746140CF8EB;
        Sun, 21 Aug 2022 21:50:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 13/13] media: atomisp: Ensure that USERPTR pointers are page aligned
Date:   Sun, 21 Aug 2022 23:50:27 +0200
Message-Id: <20220821215027.461344-13-hdegoede@redhat.com>
In-Reply-To: <20220821215027.461344-1-hdegoede@redhat.com>
References: <20220821215027.461344-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The atomisp code needs USERPTR pointers to be page aligned,
otherwise bad things (scribbling over other parts of the
process' RAM) happen.

Add a check to ensure this and exit VIDIOC_QBUF calls with
unaligned pointers with -EINVAL.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 7ecee39ef5a4..c8c6f9f8f0b8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1345,6 +1345,12 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	 * address and reprograme out page table properly
 	 */
 	if (buf->memory == V4L2_MEMORY_USERPTR) {
+		if (buf->m.userptr & ~PAGE_MASK) {
+			dev_err(isp->dev, "Error userptr is not page aligned.\n");
+			ret = -EINVAL;
+			goto error;
+		}
+
 		vb = pipe->capq.bufs[buf->index];
 		vm_mem = vb->priv;
 		if (!vm_mem) {
-- 
2.37.2

