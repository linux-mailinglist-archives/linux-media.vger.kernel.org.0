Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 606906CD95B
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 14:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbjC2M3D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 08:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbjC2M3C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 08:29:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BEE4229
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 05:28:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9DC80B822EF
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 12:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 786CAC433D2;
        Wed, 29 Mar 2023 12:28:54 +0000 (UTC)
Message-ID: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
Date:   Wed, 29 Mar 2023 14:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     regressions@lists.linux.dev,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] media: usb: uvc: fill in description for unknown pixelformats
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the fcc is 0 (indicating an unknown GUID format), then fill in the
description field in ENUM_FMT. Otherwise the V4L2 core will WARN.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")
---
diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 7aefa76a42b3..2f1ced1212cd 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -256,6 +256,9 @@ static int uvc_parse_format(struct uvc_device *dev,
 		} else {
 			dev_info(&streaming->intf->dev,
 				 "Unknown video format %pUl\n", &buffer[5]);
+			snprintf(format->name, sizeof(format->name), "%pUl\n",
+				 &buffer[5]);
+
 			format->fcc = 0;
 		}

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 35453f81c1d9..fc6f9e7d8506 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -713,6 +713,10 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
 	if (format->flags & UVC_FMT_FLAG_COMPRESSED)
 		fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
 	fmt->pixelformat = format->fcc;
+	if (format->name[0])
+		strscpy(fmt->description, format->name,
+			sizeof(fmt->description));
+
 	return 0;
 }

diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 9a596c8d894a..22656755a801 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -264,6 +264,8 @@ struct uvc_format {
 	u32 fcc;
 	u32 flags;

+	char name[32];
+
 	unsigned int nframes;
 	struct uvc_frame *frame;
 };

