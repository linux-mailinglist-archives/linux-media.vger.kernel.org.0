Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76594332568
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 13:23:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhCIMXJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 07:23:09 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:50235 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229553AbhCIMWl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 9 Mar 2021 07:22:41 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id JbNll7kcLqY4WJbNoleIef; Tue, 09 Mar 2021 13:22:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615292560; bh=2GoJ/2w+1uDUpgJbkAamV9AgHeP4Stu9FB+c4l0tS2w=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=veojZLXpl9Q0pAZ8P0JMnNeLxzrc/Nfy+x30eB0PwnvBf8WKtjsPpQLCwSHoFhABL
         1n5v7MnfkItlwfIUlMTvv8jYV6zg8wbjCXlqhO+VIqYbr1BDv9eMHwhd4HfprXTnEZ
         dJ50mSivYPSlaAzzgLaCXgKvzEK98KRnIsF8//nm3bDIyHGAztOQ3bM/ajRjdZfl03
         OpHVdITmNNlLoLtlFkU4d/k4gnh7BLYYrUrid+bV5KGnte48rHYUpKB5yw+q7MKJNg
         nHGJGpAnSkBGo63JLmGggIY8HW6quGzrsGmQ57pSKQTDEm+yX7aY9D4Nv2DU2dkshv
         YXRDKMR+miG0A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] vpbe_osd.h/uvcvideo.h includes: fix trivial kernel-doc
 warnings
Message-ID: <e184e57d-3739-98c6-6d64-adfc8f7c5777@xs4all.nl>
Date:   Tue, 9 Mar 2021 13:22:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfO0aA5Z6kDZEtxV0vcz0dsLhjxXrWB6e0h5QZENXx2ETBTuwOhoM3oA3g/z438/G6uGVd2NtxpYevdhdUK7Dsas1/ySX5aIQD5503Dj1LsasIpyxSpab
 Szyrg5AGi7MDwBZ7FML9A5qvg2oRCXDkCORKvaiFXoKIn2zZbwwhHsjwnbDl2cCsRg/b1bc2fr3etYQ0ywhokJtMNKPLX8lpGtRrL3d8FiLT0DGCQsxdo+xM
 Hal9bSv+EH+jOBsZGZ7+a6ziXpxUIwRXmaHOC+aSd2zSlaZ7yLkIMYlu86tqCXNI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix these kernel-doc warnings:

include/media/davinci/vpbe_osd.h:77: warning: Enum value 'PIXFMT_YCBCRI' not described in enum 'osd_pix_format'
include/media/davinci/vpbe_osd.h:77: warning: Enum value 'PIXFMT_YCRCBI' not described in enum 'osd_pix_format'
include/media/davinci/vpbe_osd.h:77: warning: Excess enum value 'PIXFMT_YCrCbI' description in 'osd_pix_format'
include/media/davinci/vpbe_osd.h:77: warning: Excess enum value 'PIXFMT_YCbCrI' description in 'osd_pix_format'
include/media/davinci/vpbe_osd.h:232: warning: expecting prototype for enum davinci_cursor_v_width. Prototype was for enum
osd_cursor_v_width instead
include/uapi/linux/uvcvideo.h:98: warning: Function parameter or member 'ns' not described in 'uvc_meta_buf'
include/uapi/linux/uvcvideo.h:98: warning: Function parameter or member 'sof' not described in 'uvc_meta_buf'
include/uapi/linux/uvcvideo.h:98: warning: Function parameter or member 'length' not described in 'uvc_meta_buf'
include/uapi/linux/uvcvideo.h:98: warning: Function parameter or member 'flags' not described in 'uvc_meta_buf'
include/uapi/linux/uvcvideo.h:98: warning: Function parameter or member 'buf' not described in 'uvc_meta_buf'

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/include/media/davinci/vpbe_osd.h b/include/media/davinci/vpbe_osd.h
index e1b1c76aa50f..a4fc4f2a56fb 100644
--- a/include/media/davinci/vpbe_osd.h
+++ b/include/media/davinci/vpbe_osd.h
@@ -54,9 +54,9 @@ enum osd_win_layer {
  * @PIXFMT_4BPP: 4-bits-per-pixel bitmap
  * @PIXFMT_8BPP: 8-bits-per-pixel bitmap
  * @PIXFMT_RGB565: 16-bits-per-pixel RGB565
- * @PIXFMT_YCbCrI: YUV 4:2:2
+ * @PIXFMT_YCBCRI: YUV 4:2:2
  * @PIXFMT_RGB888: 24-bits-per-pixel RGB888
- * @PIXFMT_YCrCbI: YUV 4:2:2 with chroma swap
+ * @PIXFMT_YCRCBI: YUV 4:2:2 with chroma swap
  * @PIXFMT_NV12: YUV 4:2:0 planar
  * @PIXFMT_OSD_ATTR: OSD Attribute Window pixel format (4bpp)
  *
@@ -210,7 +210,7 @@ enum osd_cursor_h_width {
 };

 /**
- * enum davinci_cursor_v_width
+ * enum osd_cursor_v_width
  * @V_WIDTH_1: vertical line width is 1 line
  * @V_WIDTH_2: vertical line width is 2 lines
  * @V_WIDTH_4: vertical line width is 4 lines
diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.h
index f80f05b3c423..8288137387c0 100644
--- a/include/uapi/linux/uvcvideo.h
+++ b/include/uapi/linux/uvcvideo.h
@@ -76,11 +76,11 @@ struct uvc_xu_control_query {

 /**
  * struct uvc_meta_buf - metadata buffer building block
- * @ns		- system timestamp of the payload in nanoseconds
- * @sof		- USB Frame Number
- * @length	- length of the payload header
- * @flags	- payload header flags
- * @buf		- optional device-specific header data
+ * @ns: system timestamp of the payload in nanoseconds
+ * @sof: USB Frame Number
+ * @length: length of the payload header
+ * @flags: payload header flags
+ * @buf: optional device-specific header data
  *
  * UVC metadata nodes fill buffers with possibly multiple instances of this
  * struct. The first two fields are added by the driver, they can be used for
