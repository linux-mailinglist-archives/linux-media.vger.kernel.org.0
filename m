Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2860600947
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 10:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbiJQIxK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 04:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbiJQIwy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 04:52:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EF31EC77
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 01:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665996749;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YgyPtG2D7KJgGVVAPTOg/f4XZbzbpdj3TrZEbxLCmGA=;
        b=C8pvmutnQkG2G/jMTM5vPQEWSBLLL8OcvwmS6jcppP71CedLqDrr16H5lKOpeb/ZCK7o6H
        vJY6+N0P6OyAOyQcbaZMje0G17+sUvkEWBsT8ctAdu3v+IwpYj6mLuvHbQyWGAywb4onV/
        y/L0Zqe1wZztNqyQF0zpTwAmJUlYcEU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-eQRZTa12NNWaQNG54L042A-1; Mon, 17 Oct 2022 04:52:25 -0400
X-MC-Unique: eQRZTa12NNWaQNG54L042A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 014AD29A8AEB;
        Mon, 17 Oct 2022 08:51:50 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.44])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5D8BD10A58CE;
        Mon, 17 Oct 2022 08:51:41 +0000 (UTC)
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
Subject: [PATCH 14/17] media: atomisp: Fix atomisp_try_fmt_cap() always returning YUV420 pixelformat
Date:   Mon, 17 Oct 2022 10:50:54 +0200
Message-Id: <20221017085057.7483-15-hdegoede@redhat.com>
In-Reply-To: <20221017085057.7483-1-hdegoede@redhat.com>
References: <20221017085057.7483-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The atomisp_try_fmt() call in atomisp_try_fmt_cap() replaces
the pixelformat passed by userspace with the sensors native pixelformat.

Which always gets replaced by V4L2_PIX_FMT_YUV420 by atomisp_adjust_fmt()
because raw sensor formats are not supported.

This needs to be fixed so that userspace which does a try_fmt call before
s_fmt does not end up always getting YUV420 even if it passed something
else into the try_fmt call.

To fix this restore the userspace requested pixelformat before
the atomisp_adjust_fmt() call. atomisp_adjust_fmt() will replace this
with V4L2_PIX_FMT_YUV420 in case an unsupported format is requested.

Note this relies on the "media: atomisp: Refactor atomisp_adjust_fmt()"
change, before that atomisp_adjust_fmt() would return -EINVAL for
unsupported pixelformats.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index fbcd377fcb08..149f7ebafb36 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -922,6 +922,7 @@ static int atomisp_try_fmt_cap(struct file *file, void *fh,
 			       struct v4l2_format *f)
 {
 	struct video_device *vdev = video_devdata(file);
+	u32 pixfmt = f->fmt.pix.pixelformat;
 	int ret;
 
 	/*
@@ -935,6 +936,12 @@ static int atomisp_try_fmt_cap(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
+	/*
+	 * atomisp_try_fmt() replaces pixelformat with the sensors native
+	 * format, restore the actual format requested by userspace.
+	 */
+	f->fmt.pix.pixelformat = pixfmt;
+
 	return atomisp_adjust_fmt(f);
 }
 
-- 
2.37.3

