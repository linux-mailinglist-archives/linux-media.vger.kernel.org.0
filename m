Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E0196DF28C
	for <lists+linux-media@lfdr.de>; Wed, 12 Apr 2023 13:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjDLLIi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Apr 2023 07:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjDLLIh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Apr 2023 07:08:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA635241
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 04:08:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA40E62C1C
        for <linux-media@vger.kernel.org>; Wed, 12 Apr 2023 11:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB2CC4339E;
        Wed, 12 Apr 2023 11:08:33 +0000 (UTC)
Message-ID: <a5dff340-ab8a-46e0-1f0c-25ceaf9fe5ca@xs4all.nl>
Date:   Wed, 12 Apr 2023 13:08:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] tvtime: support drivers that always select a pixfmt in S_FMT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers can either reject an unsupported pixelformat in VIDIOC_S_FMT,
or replace it with a supported one. Either option is allowed.

tvtime assumes that it is rejected, but instead it should check if it
chose something else, and then retry with UYVY.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/src/videoinput.c b/src/videoinput.c
index 5c147c8..12763dd 100644
--- a/src/videoinput.c
+++ b/src/videoinput.c
@@ -516,13 +516,19 @@ retry:
     memset( &(imgformat.fmt.pix), 0, sizeof( struct v4l2_pix_format ) );
     imgformat.fmt.pix.width = capwidth;
     imgformat.fmt.pix.height = vidin->height;
-    imgformat.fmt.pix.pixelformat = V4L2_PIX_FMT_YUYV;
     imgformat.fmt.pix.field = V4L2_FIELD_INTERLACED;
+    imgformat.fmt.pix.pixelformat = V4L2_PIX_FMT_YUYV;

-    if( ioctl( vidin->grab_fd, VIDIOC_S_FMT, &imgformat ) < 0 ) {
+    if( ioctl( vidin->grab_fd, VIDIOC_S_FMT, &imgformat ) < 0 ||
+        imgformat.fmt.pix.pixelformat != V4L2_PIX_FMT_YUYV ) {
 	/* Try for UYVY instead. */
+	memset( &(imgformat.fmt.pix), 0, sizeof( struct v4l2_pix_format ) );
+	imgformat.fmt.pix.width = capwidth;
+	imgformat.fmt.pix.height = vidin->height;
+	imgformat.fmt.pix.field = V4L2_FIELD_INTERLACED;
 	imgformat.fmt.pix.pixelformat = V4L2_PIX_FMT_UYVY;
-	if( ioctl( vidin->grab_fd, VIDIOC_S_FMT, &imgformat ) < 0 ) {
+	if( ioctl( vidin->grab_fd, VIDIOC_S_FMT, &imgformat ) < 0 ||
+	    imgformat.fmt.pix.pixelformat != V4L2_PIX_FMT_UYVY ) {

 	    fprintf( stderr, "\n"
      "    Your capture card driver: %s\n"
