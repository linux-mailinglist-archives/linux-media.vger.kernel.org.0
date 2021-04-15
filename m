Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E9136107D
	for <lists+linux-media@lfdr.de>; Thu, 15 Apr 2021 18:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233829AbhDOQyu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Apr 2021 12:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbhDOQyu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Apr 2021 12:54:50 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA39C061574;
        Thu, 15 Apr 2021 09:54:27 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id 18so9028675qkl.3;
        Thu, 15 Apr 2021 09:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dx1/r/N68A6cT3i6PlmlaAahaUCvbfGXrjCcPAhDBzw=;
        b=YgHNKnOsdv0YMHXZW8RrF1EPzF/UsNnC5njhIrZcZTbUN0jevFraJl6ifAxPsgKZjH
         ZCAV0uJCXeFnk5xyFdC7DYU164c7z/sU8pqN6lMflO6OQihEMJsIuR+oJ8ffhKvgBXDj
         FvjbVgdBAV8rotE0N6UyQVy6/K0m4U5J3ktzAi9lY2f6L/9p4xjkOp9eeu1ME50WeefW
         r6IqTFdMyDsrithLZWyTKicveeH24ji1HFeofN5lPWL7oOkK6W5VvB+tXwfiWC2LlZ2w
         gyGxmw7LgYqXHpGiK44NpJ0VJ7NixccMrA0nAc9oUZQumH6BZZf/QKYz9XGGoTuh9En0
         mulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dx1/r/N68A6cT3i6PlmlaAahaUCvbfGXrjCcPAhDBzw=;
        b=gOODYehXCU25N+X52QI7rVIo8anjfrQTzoFHigYO12kgfJH4cJCbeQA77/8c7E4Ytz
         xIJW5SX0mH3Ow6ykQAZXinJKR3Te/BNIxqFlZIvxEgygNOKj45bAAhtbMJFx2NvmyUYH
         sQ8IPvgaOdtPyMt5hRYuFZihKKbh7IrnrucvXuTNQgwBAAtxM1e9Sj2NFvrmqr+UnkkF
         WH1cXiPB2qeSu6YCElB6hbat9zxLAuCkTRwMznD8uyhn1T/MjPKOyaTVM8RVqPcuCrcS
         ecBdcJwtZqs9zF2nkD8tSbUkj9/lzlHwjAPVVN18iheTNDll1aeIHHChOuS5kSc+wB1l
         bVYg==
X-Gm-Message-State: AOAM532pPQqfPjFaW5x7uaBcm7eARZncW2MgJ1o8EiV/0m6ECsEf0tna
        0kEVXfLyRurpAnX0kfMoMft4zpB/XQMLYZO1
X-Google-Smtp-Source: ABdhPJzESx6Ae1ersyawFYdb9u/Qx2IzcBGRiCY8/MVLLoXmx+Fnv11A4g1FnfXWZsXN3Sl8+cPq+g==
X-Received: by 2002:a05:620a:1432:: with SMTP id k18mr4316365qkj.151.1618505666414;
        Thu, 15 Apr 2021 09:54:26 -0700 (PDT)
Received: from focaruja ([138.204.24.234])
        by smtp.gmail.com with ESMTPSA id 7sm2416170qkl.107.2021.04.15.09.54.25
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 15 Apr 2021 09:54:26 -0700 (PDT)
Date:   Thu, 15 Apr 2021 13:54:23 -0300
From:   Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 1/4] staging: media: atomisp: pci: Balance braces around
 conditional statements in file atomisp_cmd.c
Message-ID: <2e1b53962aab474ab092b1cf09afeb05de7eeabc.1618505476.git.alinesantanacordeiro@gmail.com>
References: <cover.1618505476.git.alinesantanacordeiro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618505476.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Balance braces around conditional statements.
Issue detected by checkpatch.pl.
It happens in if-else statements where one of the commands
uses braces around a block of code and the other command
does not since it has just a single line of code.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index abc17ec..8a5796e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1132,9 +1132,10 @@ void atomisp_buf_done(struct atomisp_sub_device *asd, int error,
 					asd->frame_status[vb->i] =
 					    ATOMISP_FRAME_STATUS_OK;
 				}
-			} else
+			} else {
 				asd->frame_status[vb->i] =
 				    ATOMISP_FRAME_STATUS_OK;
+			}
 		} else {
 			asd->frame_status[vb->i] = ATOMISP_FRAME_STATUS_OK;
 		}
@@ -4898,9 +4899,9 @@ atomisp_try_fmt_file(struct atomisp_device *isp, struct v4l2_format *f)
 
 	depth = get_pixel_depth(pixelformat);
 
-	if (field == V4L2_FIELD_ANY)
+	if (field == V4L2_FIELD_ANY) {
 		field = V4L2_FIELD_NONE;
-	else if (field != V4L2_FIELD_NONE) {
+	} else if (field != V4L2_FIELD_NONE) {
 		dev_err(isp->dev, "Wrong output field\n");
 		return -EINVAL;
 	}
@@ -6548,17 +6549,17 @@ static int atomisp_get_pipe_id(struct atomisp_video_pipe *pipe)
 {
 	struct atomisp_sub_device *asd = pipe->asd;
 
-	if (ATOMISP_USE_YUVPP(asd))
+	if (ATOMISP_USE_YUVPP(asd)) {
 		return IA_CSS_PIPE_ID_YUVPP;
-	else if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER)
+	} else if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER) {
 		return IA_CSS_PIPE_ID_VIDEO;
-	else if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_LOWLAT)
+	} else if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_LOWLAT) {
 		return IA_CSS_PIPE_ID_CAPTURE;
-	else if (pipe == &asd->video_out_video_capture)
+	} else if (pipe == &asd->video_out_video_capture) {
 		return IA_CSS_PIPE_ID_VIDEO;
-	else if (pipe == &asd->video_out_vf)
+	} else if (pipe == &asd->video_out_vf) {
 		return IA_CSS_PIPE_ID_CAPTURE;
-	else if (pipe == &asd->video_out_preview) {
+	} else if (pipe == &asd->video_out_preview) {
 		if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO)
 			return IA_CSS_PIPE_ID_VIDEO;
 		else
-- 
2.7.4

