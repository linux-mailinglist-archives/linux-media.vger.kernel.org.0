Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C84B144681D
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 18:48:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232041AbhKERvK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 13:51:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:35264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234496AbhKERvE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Nov 2021 13:51:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE6106125F;
        Fri,  5 Nov 2021 17:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636134503;
        bh=nLdqNgjvZNYqkrDeJl3wT8Lm+V+O4cWqrnmRjff8ulY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GLS/N7C5fe9RTOeoNe1L8xq9ideWE/XJjpm9VlQRTER/lrEhgqbsVeWrvTW0WpYW0
         2REnZPVZhHdqJSpfUPAjylvAhEOZLFjOzO+EbN+kuh0Z5LnJrIAGA5RMEe2qFTX+tS
         dXt6+jT3ebG1t3CMNwpVgun/kAzINY0R06kSe5vC31poukCESNBGbXY4yoK+y5XfF/
         DXPr65rhx0icbopnq4g7dJkXuEWbenXiINnpUdOtQ2/ly3S+BScv8bOB1I23JQyPft
         ecC8cvdpd9ixQwQPFwaNCiM5Kv0fwbKtTsxuZYR8wWCwGq0wYGnxGzn+fZ8/XuZkCE
         eqPDqOGpAZcjA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mj3K4-007eNo-Eo; Fri, 05 Nov 2021 17:48:16 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 6/8] media: atomisp: sh_css_sp: better handle pipeline config errors
Date:   Fri,  5 Nov 2021 17:48:13 +0000
Message-Id: <1a656b0ae4d245375c8c1af9a01e3bf1b8618f5f.1636134411.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <286ba3e4f25e9ba2ab78de4cbf010f18167b2604.1636134411.git.mchehab+huawei@kernel.org>
References: <286ba3e4f25e9ba2ab78de4cbf010f18167b2604.1636134411.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If something gets wrong while setup a pipeline, return an
error code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 66 +++++++++++++------
 1 file changed, 46 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index fa74ac172f94..f36f44b5e5b2 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -812,25 +812,47 @@ is_sp_stage(struct ia_css_pipeline_stage *stage)
 	return stage->sp_func != IA_CSS_PIPELINE_NO_FUNC;
 }
 
-static int
-configure_isp_from_args(
-    const struct sh_css_sp_pipeline *pipeline,
-    const struct ia_css_binary      *binary,
-    const struct sh_css_binary_args *args,
-    bool two_ppc,
-    bool deinterleaved)
+static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
+				   const struct ia_css_binary      *binary,
+				   const struct sh_css_binary_args *args,
+				   bool				   two_ppc,
+				   bool				   deinterleaved)
 {
-	ia_css_fpn_configure(binary,  &binary->in_frame_info);
-	ia_css_crop_configure(binary, &args->delay_frames[0]->info);
-	ia_css_qplane_configure(pipeline, binary, &binary->in_frame_info);
-	ia_css_output0_configure(binary, &args->out_frame[0]->info);
-	ia_css_output1_configure(binary, &args->out_vf_frame->info);
-	ia_css_copy_output_configure(binary, args->copy_output);
-	ia_css_output0_configure(binary, &args->out_frame[0]->info);
-	ia_css_iterator_configure(binary, &args->in_frame->info);
-	ia_css_dvs_configure(binary, &args->out_frame[0]->info);
-	ia_css_output_configure(binary, &args->out_frame[0]->info);
-	ia_css_raw_configure(pipeline, binary, &args->in_frame->info, &binary->in_frame_info, two_ppc, deinterleaved);
+	int ret;
+
+	ret = ia_css_fpn_configure(binary,  &binary->in_frame_info);
+	if (ret)
+		return ret;
+	ret = ia_css_crop_configure(binary, &args->delay_frames[0]->info);
+	if (ret)
+		return ret;
+	ret = ia_css_qplane_configure(pipeline, binary, &binary->in_frame_info);
+	if (ret)
+		return ret;
+	ret = ia_css_output0_configure(binary, &args->out_frame[0]->info);
+	if (ret)
+		return ret;
+	ret = ia_css_output1_configure(binary, &args->out_vf_frame->info);
+	if (ret)
+		return ret;
+	ret = ia_css_copy_output_configure(binary, args->copy_output);
+	if (ret)
+		return ret;
+	ret = ia_css_output0_configure(binary, &args->out_frame[0]->info);
+	if (ret)
+		return ret;
+	ret = ia_css_iterator_configure(binary, &args->in_frame->info);
+	if (ret)
+		return ret;
+	ret = ia_css_dvs_configure(binary, &args->out_frame[0]->info);
+	if (ret)
+		return ret;
+	ret = ia_css_output_configure(binary, &args->out_frame[0]->info);
+	if (ret)
+		return ret;
+	ret = ia_css_raw_configure(pipeline, binary, &args->in_frame->info, &binary->in_frame_info, two_ppc, deinterleaved);
+	if (ret)
+		return ret;
 
 	/*
 	 * FIXME: args->delay_frames can be NULL here
@@ -842,8 +864,12 @@ configure_isp_from_args(
 	 * without crashing, but the pipeline should likely be built without
 	 * adding it at the first place (or there are a hidden bug somewhere)
 	 */
-	ia_css_ref_configure(binary, args->delay_frames, pipeline->dvs_frame_delay);
-	ia_css_tnr_configure(binary, args->tnr_frames);
+	ret = ia_css_ref_configure(binary, args->delay_frames, pipeline->dvs_frame_delay);
+	if (ret)
+		return ret;
+	ret = ia_css_tnr_configure(binary, args->tnr_frames);
+	if (ret)
+		return ret;
 	ia_css_bayer_io_config(binary, args);
 	return 0;
 }
-- 
2.31.1

