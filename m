Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474414530C5
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234935AbhKPLeB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:34:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:35170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234884AbhKPLcl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B95FD63232;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=menI95x5IdjWbxFqv3AQTXuw0js/aALj+ISdXmSa8T0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BPdZNm/cwtFe+SzE50y/aKx45E5qbZCB4udIjem16LD49s3clbpE18n4EnFLI00le
         OMPmq3fuiJgJlNGnUep7N8g3y4TdNYT9JK4sPHVJJMTDw1CGGBa3jsTORCzfFdeFbr
         4JPrQi6k+NaneplxYlmHZo1VuDTrxAEpiXvLI3BH+Kmf7PhJ2H8lFx1y5c33kptUzr
         NmBWQcPqkRUrVoElX6557fx9XCBR/v19X7XIt58qWGLbwbOR6iAGb78w79fnp9pq7d
         UZfWXm3gn+Pl5PGXwi81LjjAHBn+BAslsWtfqfnkAxLbdxRokjfwGskngomX+OIk1S
         2hPXOrQhyPOXQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008Qfv-L8; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 17/23] media: atomisp: drop ia_css_pipe_update_qos_ext_mapped_arg
Date:   Tue, 16 Nov 2021 11:28:58 +0000
Message-Id: <902ee0e5229f44b90ce3a67abf49b7ac85788494.1637061474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637061474.git.mchehab+huawei@kernel.org>
References: <cover.1637061474.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This function is not used. Drop it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 .../media/atomisp/pci/ia_css_pipe_public.h    | 23 ------
 drivers/staging/media/atomisp/pci/sh_css.c    | 82 -------------------
 2 files changed, 105 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
index 45e8fe36cb74..7352cbf779fb 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
@@ -479,29 +479,6 @@ ia_css_pipe_get_qos_ext_state(struct ia_css_pipe *pipe,
 			      u32 fw_handle,
 			      bool *enable);
 
-/* ISP2401  */
-/* @brief  Update mapped CSS and ISP arguments for QoS pipe during SP runtime.
- * @param[in] pipe	Pipe handle.
- * @param[in] fw_handle	Extension firmware Handle (ia_css_fw_info.handle).
- * @param[in] css_seg	Parameter memory descriptors for CSS segments.
- * @param[in] isp_seg	Parameter memory descriptors for ISP segments.
- *
- * @return
- * 0			: Success
- * -EINVAL		: Invalid Parameters
- * -EBUSY	: Inactive QOS Pipe
- *					(No active stream with this pipe)
- *
- * \deprecated{This interface is used to temporarily support a late-developed,
- * specific use-case on a specific IPU2 platform. It will not be supported or
- * maintained on IPU3 or further.}
- */
-int
-ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
-				      u32 fw_handle,
-				      struct ia_css_isp_param_css_segments *css_seg,
-				      struct ia_css_isp_param_isp_segments *isp_seg);
-
 /* @brief Get selected configuration settings
  * @param[in]	pipe	The pipe.
  * @param[out]	config	Configuration settings.
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index adec184c8536..766d92a4c2eb 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -10089,88 +10089,6 @@ ia_css_pipe_get_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
 	return err;
 }
 
-/* ISP2401 */
-int
-ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
-				      u32 fw_handle,
-				      struct ia_css_isp_param_css_segments *css_seg,
-				      struct ia_css_isp_param_isp_segments *isp_seg)
-{
-	unsigned int HIVE_ADDR_sp_group;
-	static struct sh_css_sp_group sp_group;
-	static struct sh_css_sp_stage sp_stage;
-	static struct sh_css_isp_stage isp_stage;
-	const struct ia_css_fw_info *fw;
-	unsigned int thread_id;
-	struct ia_css_pipeline_stage *stage;
-	int err = 0;
-	int stage_num = 0;
-	enum ia_css_isp_memories mem;
-	bool enabled;
-
-	IA_CSS_ENTER("");
-
-	fw = &sh_css_sp_fw;
-
-	/* Parameter Check */
-	if (!pipe || !pipe->stream) {
-		IA_CSS_ERROR("Invalid Pipe.");
-		err = -EINVAL;
-	} else if (!(pipe->config.acc_extension)) {
-		IA_CSS_ERROR("Invalid Pipe (No Extension Firmware).");
-		err = -EINVAL;
-	} else if (!sh_css_sp_is_running()) {
-		IA_CSS_ERROR("Leaving: queue unavailable.");
-		err = -EBUSY;
-	} else {
-		/* Query the thread_id and stage_num corresponding to the Extension firmware */
-		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
-		err = ia_css_pipeline_get_stage_from_fw(&pipe->pipeline, fw_handle, &stage);
-		if (!err) {
-			/* Get the Extension State */
-			enabled = (SH_CSS_QOS_STAGE_IS_ENABLED(&sh_css_sp_group.pipe[thread_id],
-							       stage->stage_num)) ? true : false;
-			/* Update mapped arg only when extension stage is not enabled */
-			if (enabled) {
-				IA_CSS_ERROR("Leaving: cannot update when stage is enabled.");
-				err = -EBUSY;
-			} else {
-				stage_num = stage->stage_num;
-
-				HIVE_ADDR_sp_group = fw->info.sp.group;
-				sp_dmem_load(SP0_ID,
-					     (unsigned int)sp_address_of(sp_group),
-					     &sp_group,
-					     sizeof(struct sh_css_sp_group));
-				hmm_load(sp_group.pipe[thread_id].sp_stage_addr[stage_num],
-					 &sp_stage, sizeof(struct sh_css_sp_stage));
-
-				hmm_load(sp_stage.isp_stage_addr,
-					 &isp_stage, sizeof(struct sh_css_isp_stage));
-
-				for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++) {
-					isp_stage.mem_initializers.params[IA_CSS_PARAM_CLASS_PARAM][mem].address =
-					    css_seg->params[IA_CSS_PARAM_CLASS_PARAM][mem].address;
-					isp_stage.mem_initializers.params[IA_CSS_PARAM_CLASS_PARAM][mem].size =
-					    css_seg->params[IA_CSS_PARAM_CLASS_PARAM][mem].size;
-					isp_stage.binary_info.mem_initializers.params[IA_CSS_PARAM_CLASS_PARAM][mem].address
-					    =
-						isp_seg->params[IA_CSS_PARAM_CLASS_PARAM][mem].address;
-					isp_stage.binary_info.mem_initializers.params[IA_CSS_PARAM_CLASS_PARAM][mem].size
-					    =
-						isp_seg->params[IA_CSS_PARAM_CLASS_PARAM][mem].size;
-				}
-
-				hmm_store(sp_stage.isp_stage_addr,
-					  &isp_stage,
-					  sizeof(struct sh_css_isp_stage));
-			}
-		}
-	}
-	IA_CSS_LEAVE("err:%d handle:%u", err, fw_handle);
-	return err;
-}
-
 static void
 sh_css_hmm_buffer_record_init(void)
 {
-- 
2.33.1

