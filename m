Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2898643F939
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 10:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbhJ2IwK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Oct 2021 04:52:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:49086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229692AbhJ2IwJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Oct 2021 04:52:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D98D861165;
        Fri, 29 Oct 2021 08:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635497380;
        bh=uCWXb8MoeOqsDEr7CtzkTLPhqtbKubeuYpeFJQuqaY4=;
        h=From:To:Cc:Subject:Date:From;
        b=uzQB6GYwAWNi5KvnUo25wsO3RSnDYfmdusB5kX2Rs+Y1Ga10F2X0o9vHVhjy4NIa2
         Gr5AKrSZJLzYHK+PgS5bqc64qTc3YEfcKSLMgbcc30sYL+potVPLGKjCDRw7AMv2iK
         +G216+JwmyVGXJb4g/W28EEo5B+oaK1+aP04BzzNErRKK5cENAjIHZ0igw6/btlNXN
         mLxxDRxjFW2Wn4XlhsYJsmBz1FEbK2xwkel3UeAsAfKNx8aiC5THqJOJkgJdFZvSxP
         JU0WW9WdF8e3u8EED46BNu5NJdsGXQC+pR3imXcVvYcjVKYfpqteQK2LmWHM0bN2zc
         ZiwX13Pil5WEQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mgNZx-002sAJ-QZ; Fri, 29 Oct 2021 09:49:37 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Baokun Li <libaokun1@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 1/2] media: atomisp: better describe get_frame_info issues
Date:   Fri, 29 Oct 2021 09:49:35 +0100
Message-Id: <750e50daa3ed65a7eb060cb0eb5cfc60dc9386be.1635497370.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When atomisp is used by a normal client, it fails to get
frame info. However, the information is confusing and misleading,
as there are several wrappers for such function, and the error
could be on different places.

So, improve the error log in order to allow narrowing down
where the error is actually occuring.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  4 +-
 .../media/atomisp/pci/atomisp_compat_css20.c  | 67 ++++++++++---------
 2 files changed, 39 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index a30dfcce54dd..32cae6908465 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -5444,9 +5444,9 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	else
 		ret = get_frame_info(asd, output_info);
 	if (ret) {
-		dev_err(isp->dev, "get_frame_info %ux%u (padded to %u) returned %d\n",
+		dev_err(isp->dev, "__get_frame_info %ux%u (padded to %u) returned %d\n",
 			pix->width, pix->height, pix->bytesperline, ret);
-		return -EINVAL;
+		return ret;
 	}
 
 	atomisp_update_grid_info(asd, pipe_id, source_pad);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 99a632f33d2d..1309855bb6c8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -2657,41 +2657,48 @@ static int __get_frame_info(struct atomisp_sub_device *asd,
 	if (__destroy_pipes(asd, true))
 		dev_warn(isp->dev, "destroy pipe failed.\n");
 
-	if (__create_pipes(asd))
+	if (__create_pipes(asd)) {
+		dev_err(isp->dev, "can't create pipes\n");
 		return -EINVAL;
+	}
+
+	if (__create_streams(asd)) {
+		dev_err(isp->dev, "can't create streams\n");
+		goto stream_err;
+	}
 
-	if (__create_streams(asd))
+	ret = ia_css_pipe_get_info(asd->stream_env[stream_index].pipes[pipe_id],
+				   &p_info);
+	if (ret) {
+		dev_err(isp->dev, "can't get info from pipe\n");
 		goto stream_err;
+	}
 
-	ret = ia_css_pipe_get_info(
-		  asd->stream_env[stream_index]
-		  .pipes[pipe_id], &p_info);
-	if (!ret) {
-		switch (type) {
-		case ATOMISP_CSS_VF_FRAME:
-			*info = p_info.vf_output_info[0];
-			dev_dbg(isp->dev, "getting vf frame info.\n");
-			break;
-		case ATOMISP_CSS_SECOND_VF_FRAME:
-			*info = p_info.vf_output_info[1];
-			dev_dbg(isp->dev, "getting second vf frame info.\n");
-			break;
-		case ATOMISP_CSS_OUTPUT_FRAME:
-			*info = p_info.output_info[0];
-			dev_dbg(isp->dev, "getting main frame info.\n");
-			break;
-		case ATOMISP_CSS_SECOND_OUTPUT_FRAME:
-			*info = p_info.output_info[1];
-			dev_dbg(isp->dev, "getting second main frame info.\n");
-			break;
-		case ATOMISP_CSS_RAW_FRAME:
-			*info = p_info.raw_output_info;
-			dev_dbg(isp->dev, "getting raw frame info.\n");
-		}
-		dev_dbg(isp->dev, "get frame info: w=%d, h=%d, num_invalid_frames %d.\n",
-			info->res.width, info->res.height, p_info.num_invalid_frames);
-		return 0;
+	switch (type) {
+	case ATOMISP_CSS_VF_FRAME:
+		*info = p_info.vf_output_info[0];
+		dev_dbg(isp->dev, "getting vf frame info.\n");
+		break;
+	case ATOMISP_CSS_SECOND_VF_FRAME:
+		*info = p_info.vf_output_info[1];
+		dev_dbg(isp->dev, "getting second vf frame info.\n");
+		break;
+	case ATOMISP_CSS_OUTPUT_FRAME:
+		*info = p_info.output_info[0];
+		dev_dbg(isp->dev, "getting main frame info.\n");
+		break;
+	case ATOMISP_CSS_SECOND_OUTPUT_FRAME:
+		*info = p_info.output_info[1];
+		dev_dbg(isp->dev, "getting second main frame info.\n");
+		break;
+	case ATOMISP_CSS_RAW_FRAME:
+		*info = p_info.raw_output_info;
+		dev_dbg(isp->dev, "getting raw frame info.\n");
 	}
+	dev_dbg(isp->dev, "get frame info: w=%d, h=%d, num_invalid_frames %d.\n",
+		info->res.width, info->res.height, p_info.num_invalid_frames);
+
+	return 0;
 
 stream_err:
 	__destroy_pipes(asd, true);
-- 
2.31.1

