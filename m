Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF6D6535C
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 10:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbfGKIx2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jul 2019 04:53:28 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:45071 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727595AbfGKIx2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jul 2019 04:53:28 -0400
Received: from [IPv6:2001:983:e9a7:1:8d1:5ef:6c45:bece] ([IPv6:2001:983:e9a7:1:8d1:5ef:6c45:bece])
        by smtp-cloud9.xs4all.net with ESMTPA
        id lUpRhC5wCuEBxlUpShAaHn; Thu, 11 Jul 2019 10:53:27 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for 5.3] videodev2.h: change V4L2_PIX_FMT_BGRA444 define:
 fourcc was already in use
Message-ID: <27374021-a714-f49f-5ea2-9ebfd1992e54@xs4all.nl>
Date:   Thu, 11 Jul 2019 10:53:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA1OxVU+YGMgrcz+7xqYv5y44NOw5XOysBO0g2OFLDf+hhANC1YQQpodJEufX1hS/Oa4JDCOASgil0P4gxGsGJ6MWfPvIkNfG6gnrg5IrSlbT1G/z+lf
 N2klF/QMZ6qauJpscOihxT5HKAo4UhsOk8MQ5l9Uk0XVnLJHl3a3N5GF+058azgkgM/ZEXfA498ZFF0eWe/ys3X1GC61tGcdK1r8YX/eXG1DphpyJgmnUq0U
 7M1rIFL+BNYAK+JEBsf/qYA39KlGZXvcg7w4UpA14eVsAGjcmAT4+kGJu67sBg9r7+DTayJcGVrrNT2QCxv8ibQf2G6x6crBn+bHAOS2Vi6LLSfQNlyDFEuA
 DCc9cchz
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2_PIX_FMT_BGRA444 define clashed with the pre-existing V4L2_PIX_FMT_SGRBG12
which strangely enough used the same fourcc, even though that fourcc made no sense
for a Bayer format. In any case, you can't have duplicates, so change the fourcc of
V4L2_PIX_FMT_BGRA444.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: <stable@vger.kernel.org>      # for v5.2 and up
---
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9d9705ceda76..2427bc4d8eba 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -518,7 +518,13 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_RGBX444 v4l2_fourcc('R', 'X', '1', '2') /* 16  rrrrgggg bbbbxxxx */
 #define V4L2_PIX_FMT_ABGR444 v4l2_fourcc('A', 'B', '1', '2') /* 16  aaaabbbb ggggrrrr */
 #define V4L2_PIX_FMT_XBGR444 v4l2_fourcc('X', 'B', '1', '2') /* 16  xxxxbbbb ggggrrrr */
-#define V4L2_PIX_FMT_BGRA444 v4l2_fourcc('B', 'A', '1', '2') /* 16  bbbbgggg rrrraaaa */
+
+/*
+ * Originally this had 'BA12' as fourcc, but this clashed with the older
+ * V4L2_PIX_FMT_SGRBG12 which inexplicably used that same fourcc.
+ * So use 'GA12' instead for V4L2_PIX_FMT_BGRA444.
+ */
+#define V4L2_PIX_FMT_BGRA444 v4l2_fourcc('G', 'A', '1', '2') /* 16  bbbbgggg rrrraaaa */
 #define V4L2_PIX_FMT_BGRX444 v4l2_fourcc('B', 'X', '1', '2') /* 16  bbbbgggg rrrrxxxx */
 #define V4L2_PIX_FMT_RGB555  v4l2_fourcc('R', 'G', 'B', 'O') /* 16  RGB-5-5-5     */
 #define V4L2_PIX_FMT_ARGB555 v4l2_fourcc('A', 'R', '1', '5') /* 16  ARGB-1-5-5-5  */
