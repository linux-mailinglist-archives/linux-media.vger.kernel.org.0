Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4B974530B2
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235249AbhKPLcs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:32:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:35200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235030AbhKPLc3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8282261BD3;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=paX1NcGqaRuZDTYMaz3hJFdjIFsWmOGpcYD5MKo09HI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DqecrIVKX3gkKt6kTP4R84IdkNIBRer3dQhmc02t/pdBq/L1PkLCOi/vO4CCW6I2D
         Vv+a4SnWQ2vWo3TqZ56cMQgsRlm9oU7/XqaAlcL3/Ox8Sgh3wiN2yasqy00fPB/Ovh
         D9F6TR6kqbxlcpBHl0bz82ukfdDNzxcbbVB/FjY7zHRogoicGskBAivc+vBHsC7jvW
         VH/oDW1NjcyMC8S1VQMYc6Qn3ySXaaV6GOK6xpcQKyNKKHMvNDkcQ4nIToQft5lOtP
         GMXTDx1KDaSE9eiF4hfWuzpjlFIKp0x4M+fF+Lw1muAk3szKbn6QjV5hGSSfoekfIg
         DjpPsktr4sV9A==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008QfC-BS; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 02/23] media: atomisp: get rid of if CONFIG_ON_FRAME_ENQUEUE
Date:   Tue, 16 Nov 2021 11:28:43 +0000
Message-Id: <ef712e076740f5f47ac2c58d384f9ac5ce809604.1637061474.git.mchehab+huawei@kernel.org>
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

This is not used with supported firmwares, so get rid of such code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c    | 38 -------------------
 .../media/atomisp/pci/sh_css_internal.h       | 12 ------
 2 files changed, 50 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index c714c15c49d2..bd3f96bd7d6d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -384,10 +384,6 @@ ia_css_get_acc_configs(
     struct ia_css_pipe *pipe,
     struct ia_css_isp_config *config);
 
-#if CONFIG_ON_FRAME_ENQUEUE()
-static int set_config_on_frame_enqueue(struct ia_css_frame_info
-	*info, struct frame_data_wrapper *frame);
-#endif
 
 #ifdef ISP2401
 static unsigned int get_crop_lines_for_bayer_order(const struct
@@ -4071,15 +4067,6 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 				    "ia_css_pipe_enqueue_buffer() buf_type=%d, data(DDR address)=0x%x\n",
 				    buf_type, buffer->data.frame->data);
 
-#if CONFIG_ON_FRAME_ENQUEUE()
-		return_err = set_config_on_frame_enqueue(
-				 &buffer->data.frame->info,
-				 &ddr_buffer.payload.frame);
-		if (return_err) {
-			IA_CSS_LEAVE_ERR(return_err);
-			return return_err;
-		}
-#endif
 	}
 
 	/* start of test for using rmgr for acq/rel memory */
@@ -10311,31 +10298,6 @@ void ia_css_pipe_map_queue(struct ia_css_pipe *pipe, bool map)
 	IA_CSS_LEAVE("");
 }
 
-#if CONFIG_ON_FRAME_ENQUEUE()
-static int set_config_on_frame_enqueue(struct ia_css_frame_info
-	*info, struct frame_data_wrapper *frame)
-{
-	frame->config_on_frame_enqueue.padded_width = 0;
-
-	/* currently we support configuration on frame enqueue only on YUV formats */
-	/* on other formats the padded_width is zeroed for no configuration override */
-	switch (info->format) {
-	case IA_CSS_FRAME_FORMAT_YUV420:
-	case IA_CSS_FRAME_FORMAT_NV12:
-		if (info->padded_width > info->res.width)
-			frame->config_on_frame_enqueue.padded_width = info->padded_width;
-		else if ((info->padded_width < info->res.width) && (info->padded_width > 0))
-			return -EINVAL;
-
-		/* nothing to do if width == padded width or padded width is zeroed (the same) */
-		break;
-	default:
-		break;
-	}
-
-	return 0;
-}
-#endif
 
 int
 ia_css_unlock_raw_frame(struct ia_css_stream *stream, uint32_t exp_id)
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 92fb7e67610c..f26df3f44a7a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -687,8 +687,6 @@ struct sh_css_sp_output {
 	unsigned int		sw_interrupt_value[SH_CSS_NUM_SDW_IRQS];
 };
 
-#define CONFIG_ON_FRAME_ENQUEUE() 0
-
 /**
  * @brief Data structure for the circular buffer.
  * The circular buffer is empty if "start == end". The
@@ -726,9 +724,6 @@ struct sh_css_hmm_buffer {
 			u32	exp_id;
 			u32	isp_parameters_id; /** Unique ID to track which config was
 								actually applied to a particular frame */
-#if CONFIG_ON_FRAME_ENQUEUE()
-			struct sh_css_config_on_frame_enqueue config_on_frame_enqueue;
-#endif
 		} frame;
 		ia_css_ptr ddr_ptrs;
 	} payload;
@@ -744,16 +739,9 @@ struct sh_css_hmm_buffer {
 	clock_value_t isys_eof_clock_tick;
 };
 
-#if CONFIG_ON_FRAME_ENQUEUE()
-#define SIZE_OF_FRAME_STRUCT						\
-	(SIZE_OF_HRT_VADDRESS +						\
-	(3 * sizeof(uint32_t)) +					\
-	sizeof(uint32_t))
-#else
 #define SIZE_OF_FRAME_STRUCT						\
 	(SIZE_OF_HRT_VADDRESS +						\
 	(3 * sizeof(uint32_t)))
-#endif
 
 #define SIZE_OF_PAYLOAD_UNION						\
 	(MAX(MAX(MAX(MAX(						\
-- 
2.33.1

