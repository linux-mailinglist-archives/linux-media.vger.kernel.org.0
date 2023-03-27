Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5C26C9F14
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 11:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232993AbjC0JM2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 05:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232951AbjC0JMU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 05:12:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B65044B3
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679908294;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=+Mwhhk8fBwlRtaARpmqQx2fmC56yDNxCNbzZ+8kUfQw=;
        b=Q50ysWg1KloAaUZ+I7/4r7ibpl83tDX8HYlkVK4/D9c4/lAQDjog5htNOnM+5aD8GUzLPE
        EN3EB332td9+zAOVLNfVTQ8QrMyTIrlgBo+43Fu5RjpI2kXiqbALDhYay44v4xpvoE3pkP
        Xbuu3BU20x0cUoqSm2i0DTTcAXaN0kE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-5YI91a9sNZqGjvZpWgWf_w-1; Mon, 27 Mar 2023 05:11:30 -0400
X-MC-Unique: 5YI91a9sNZqGjvZpWgWf_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7AF285A5A3;
        Mon, 27 Mar 2023 09:11:29 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.7])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2258D1121330;
        Mon, 27 Mar 2023 09:11:24 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Xiu Jianfeng <xiujianfeng@huawei.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH] media: v4l2-core: v4l2-ioctl: Printing log with dev_warn() when the pixelformat is unknown
Date:   Mon, 27 Mar 2023 17:10:51 +0800
Message-Id: <20230327091051.404184-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The original implementation used WARN() to notify the user of the "unknown
pixelformat" error. If fmt->description can be found, the function will
simply return without warnings. Recently, the description had removed from
uvc since v4l_fill_fmtdesc() can provide such kind of information. However,
for some of the USB cameras, such as Intel Realsense F200 returns unknown
format when probe(). Thus, the WARN() message shows and confuses the user.
This work changed WARN() to dev_warn() to reduce the severity of the
message.

The returned video format of Intel RealSense F200 is shown as follows.
kernel: uvcvideo 2-7:1.3: Unknown video format 52564e49-2d90-4a58-920b-773f1f2c556b
kernel: uvcvideo 2-7:1.3: Unknown video format 49524e49-2d90-4a58-920b-773f1f2c556b
kernel: uvcvideo 2-7:1.3: Unknown video format 494c4552-1314-f943-a75a-ee6bbf012e23
kernel: usb 2-7: Found UVC 1.10 device Intel(R) RealSense(TM) 3D Camera (Front F200) (8086:0a66)

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2180107
Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 87f163a89c80..aae987243a5b 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1246,7 +1246,7 @@ static int v4l_enumoutput(const struct v4l2_ioctl_ops *ops,
 	return ops->vidioc_enum_output(file, fh, p);
 }
 
-static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
+static void v4l_fill_fmtdesc(struct video_device *vdev, struct v4l2_fmtdesc *fmt)
 {
 	const unsigned sz = sizeof(fmt->description);
 	const char *descr = NULL;
@@ -1504,7 +1504,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 		default:
 			if (fmt->description[0])
 				return;
-			WARN(1, "Unknown pixelformat 0x%08x\n", fmt->pixelformat);
+			dev_warn(&vdev->dev, "Unknown pixelformat 0x%08x\n", fmt->pixelformat);
 			flags = 0;
 			snprintf(fmt->description, sz, "%p4cc",
 				 &fmt->pixelformat);
@@ -1589,7 +1589,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl_ops *ops,
 		break;
 	}
 	if (ret == 0)
-		v4l_fill_fmtdesc(p);
+		v4l_fill_fmtdesc(vdev, p);
 	return ret;
 }
 
-- 
2.39.2

