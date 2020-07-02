Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD1B212530
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 15:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbgGBNuK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 09:50:10 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:45295 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728989AbgGBNuJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Jul 2020 09:50:09 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qzbIjmxbE40yDqzbLjemRL; Thu, 02 Jul 2020 15:50:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593697808; bh=fhnfRmxRo48K67ZdP5NuPoGqn1111+gJoTApUUrQObY=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pX+2fYDAet1kCN+7hZ6ynzHcIUNsNie/G51YZ0BmmV1+1CnCIvcC4d5KVxxcakxN/
         n4K7DUBAVvVa0CY7Mv5u2YyAtZu4xkI3DMySJpFLk5nDmigV9+KgRBcnzQGZ9t5Iv/
         PykO5omPgOw3A/dbeFyiS6x5kZNwBZSrQYdW7A45LUOFuYQ4o/VXU/KE414bgeqs3y
         SNffLdhRtj2preGhTYVWB2HRoQ5cLkJZtvxKxLT88tZZ7+RWKasMsFgizN+2gDjczO
         WVDhtvSwFejKZXQGrEKxaIuro0kl7k6WBEYmNbC+AUKMQ1MHarkgeJUkT4ImRMqVcl
         /D2XtxRimeIiQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] imx219: selection compliance fixes
Message-ID: <b580ac9d-5ae4-29ce-c81a-a1f98b1d953b@xs4all.nl>
Date:   Thu, 2 Jul 2020 15:50:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfO8nSic5GLBurVuEtqJFhnTOyVRkJNU12oR2x+GT7FymoQFs/HrXruVatJR00jdS8ErUOAwt8vUUIv+xYQjtdYOm6Utr5SEvX1LE7RQxzfLdk5VnGN2Q
 lFxUYfdU/uqa43S9vn98Ep9OyXhYO8RimgcrEk5MRhASzpbbfvIoBXxGUSyx2oNfTZ8MkrUoF1PHsugrKWnlNfdBYilj6lg5Acs=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The top/left crop coordinates were 0, 0 instead of 8, 8 in the
supported_modes array. This was a mismatch with the default values,
so this is corrected. Found with v4l2-compliance.

Also add V4L2_SEL_TGT_CROP_BOUNDS support: CROP_DEFAULT and CROP_BOUNDS
always go together. Found with v4l2-compliance.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/i2c/imx219.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 0a546b8e466c..935e2a258ce5 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -473,8 +473,8 @@ static const struct imx219_mode supported_modes[] = {
 		.width = 3280,
 		.height = 2464,
 		.crop = {
-			.left = 0,
-			.top = 0,
+			.left = 8,
+			.top = 8,
 			.width = 3280,
 			.height = 2464
 		},
@@ -489,8 +489,8 @@ static const struct imx219_mode supported_modes[] = {
 		.width = 1920,
 		.height = 1080,
 		.crop = {
-			.left = 680,
-			.top = 692,
+			.left = 8 + 680,
+			.top = 8 + 692,
 			.width = 1920,
 			.height = 1080
 		},
@@ -505,8 +505,8 @@ static const struct imx219_mode supported_modes[] = {
 		.width = 1640,
 		.height = 1232,
 		.crop = {
-			.left = 0,
-			.top = 0,
+			.left = 8,
+			.top = 8,
 			.width = 3280,
 			.height = 2464
 		},
@@ -521,8 +521,8 @@ static const struct imx219_mode supported_modes[] = {
 		.width = 640,
 		.height = 480,
 		.crop = {
-			.left = 1000,
-			.top = 752,
+			.left = 8 + 1000,
+			.top = 8 + 752,
 			.width = 1280,
 			.height = 960
 		},
@@ -1014,6 +1014,7 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 		return 0;

 	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
 		sel->r.top = IMX219_PIXEL_ARRAY_TOP;
 		sel->r.left = IMX219_PIXEL_ARRAY_LEFT;
 		sel->r.width = IMX219_PIXEL_ARRAY_WIDTH;
-- 
2.27.0

