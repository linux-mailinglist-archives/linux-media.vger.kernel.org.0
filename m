Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFF0D430A94
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344088AbhJQQXn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242595AbhJQQXl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:23:41 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23C9C06161C;
        Sun, 17 Oct 2021 09:21:31 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d9so5629182pfl.6;
        Sun, 17 Oct 2021 09:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yJ7RPoYM8/I+NZHSQR8UmWgQfVFixTVHBNdgrJkw95k=;
        b=U3tJgQMoXAE33E/JvCK22bipL0xtOHHPqumA6FZo4zR4KJuY0QMvo02EAjwM/H1zd0
         lcmGN9sL8lfshqo/jFj6wswo9WHYgQ6yaltp4CPN8WguGmVTCTqneNHZg+EVwVGqIreN
         SQuhjFFqCFoYdb1QmUUYIHgqi66RDF62G1o9cGJUl6A96z53k7PnOETVKMq4dsqb4wt2
         nEaAwrysAqXrE72aacuw3nqeVIU0mrc08fgYjywGmLpa7Cb+47ppZQE3NdnEzJOaCrCc
         9+uWhkDXTg9LNK8bOrG8tQxJnQC8PiC8S3bLyJMJo/5cgzU8eJoTYeHtwWxtYeEThsU+
         W9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yJ7RPoYM8/I+NZHSQR8UmWgQfVFixTVHBNdgrJkw95k=;
        b=O8hKtOmZIEAfEqju+V14vtTboer47s3vGOMiRzuXG7JFDoQlHzsuL59107L3wXXi3W
         fydqikorU44aYWpJr9aQuvMuImw8Mq55fU8oZ1aWqXCr1Xyo1JpZgCEnJTc0wlxtSVKB
         efyqJ04S5FSX5QNvnS4tvDaYV7U4JriN4xzDS1mDyfNSVisMNasyYdheBmyypE2P3lqk
         AOGnh/oGDmq6/+bhMPdDx/WccANHQ2U2t37ZBeUaZZzuRzOmgJCkNxEm85eBc3WIvzlU
         x0oYchObRRh2KLt5TVmK7civJPYVcJ+7d7v9mtV1K3LsbaLBASdZSG15Df6d3Z6JV1v0
         pnhg==
X-Gm-Message-State: AOAM530yvjwIdE6LHlQTjRCTOhkaFAUsj0ZZGumE/++CIAcgFGrMkdRq
        HXSnH6vgNf33hPXkwzfFlkw=
X-Google-Smtp-Source: ABdhPJzEQyHvgI0Aj078jLZ7CkzGrKCHytcEawZvkTiP+iJgowuNBtEyBZCp+3Xk/A5w9P8bB5zixg==
X-Received: by 2002:a63:cd09:: with SMTP id i9mr19329832pgg.129.1634487691141;
        Sun, 17 Oct 2021 09:21:31 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:21:30 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Alan <alan@linux.intel.com>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/17] media: atomisp: pci: make fw ver irci_stable_candrpv_0415_20150521_0458 work - 1/5
Date:   Mon, 18 Oct 2021 01:19:48 +0900
Message-Id: <20211017161958.44351-9-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is one of the patches which partially revert incompatible changes
in the current css version for ISP2401 (irci_ecr-master_20150911_0724)
back to irci_stable_candrpv_0415_20150521_0458.

Some `struct`s are `sizeof()`ed in sh_css_firmware.c file. So, I guess
issues will happen if these sizes are changed. Therefore, keep them the
same as css version irci_stable_candrpv_0415_20150521_0458 to make atomisp
work for firmware made for such css version since we don't have firmware
made for the current css version.

This patch removes luma_only, input_yuv and input_raw from
`struct ia_css_binary_info` as well as its usage [1]. Note that for
input_yuv and input_raw, only the definitions were removed because these
were not used anywhere.

[1] added on updating css version to irci_master_20150701_0213
    https://raw.githubusercontent.com/intel/ProductionKernelQuilts/cht-m1stable-2016_ww31/uefi/cht-m1stable/patches/cam-0439-atomisp2-css2401-and-2401_legacy-irci_master_2015070.patch
    ("atomisp2: css2401 and 2401_legacy-irci_master_20150701_0213")

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 .../atomisp/pci/camera/pipe/src/pipe_binarydesc.c  |  5 -----
 .../staging/media/atomisp/pci/ia_css_acc_types.h   |  5 -----
 .../staging/media/atomisp/pci/ia_css_pipe_public.h |  3 ---
 .../pci/runtime/binary/interface/ia_css_binary.h   |  1 -
 .../media/atomisp/pci/runtime/binary/src/binary.c  | 14 --------------
 5 files changed, 28 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
index f20c9b02fbe0..3e3e5a4f8117 100644
--- a/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
+++ b/drivers/staging/media/atomisp/pci/camera/pipe/src/pipe_binarydesc.c
@@ -58,7 +58,6 @@ static void pipe_binarydesc_get_offline(
 	descr->enable_dz = true;
 	descr->enable_xnr = false;
 	descr->enable_dpc = false;
-	descr->enable_luma_only = false;
 	descr->enable_tnr = false;
 	descr->enable_capture_pp_bli = false;
 	descr->enable_fractional_ds = false;
@@ -390,8 +389,6 @@ int ia_css_pipe_get_video_binarydesc(
 		    pipe->extra_config.enable_fractional_ds;
 		video_descr->enable_dpc =
 		    pipe->config.enable_dpc;
-		video_descr->enable_luma_only =
-		    pipe->config.enable_luma_only;
 		video_descr->enable_tnr =
 		    pipe->config.enable_tnr;
 
@@ -600,8 +597,6 @@ void ia_css_pipe_get_primary_binarydesc(
 		prim_descr->isp_pipe_version = pipe->config.isp_pipe_version;
 		prim_descr->enable_fractional_ds =
 		    pipe->extra_config.enable_fractional_ds;
-		prim_descr->enable_luma_only =
-		    pipe->config.enable_luma_only;
 		/* We have both striped and non-striped primary binaries,
 		 * if continuous viewfinder is required, then we must select
 		 * a striped one. Otherwise we prefer to use a non-striped
diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
index 36583ab12e3f..d0ce2f8ba653 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
@@ -222,11 +222,6 @@ struct ia_css_binary_info {
 	struct ia_css_isp_param_isp_segments	mem_initializers;
 	/* MW: Packing (related) bools in an integer ?? */
 	struct {
-		/* ISP2401 */
-		u8	luma_only;
-		u8	input_yuv;
-		u8	input_raw;
-
 		u8	reduced_pipe;
 		u8	vf_veceven;
 		u8	dis;
diff --git a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
index 4affd21f9e3f..45e8fe36cb74 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_pipe_public.h
@@ -123,9 +123,6 @@ struct ia_css_pipe_config {
 	     processing stages. */
 
 /* ISP2401 */
-	bool enable_luma_only;
-	/** Enabling of monochrome mode for a pipeline. If enabled only luma processing
-	     will be done. */
 	bool enable_tnr;
 	/** Enabling of TNR (temporal noise reduction). This is only applicable to video
 	     pipes. Non video-pipes should always set this parameter to false. */
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h b/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
index b44099dbdacd..6f110d241836 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
@@ -94,7 +94,6 @@ struct ia_css_binary_descr {
 	bool enable_dpc;
 
 	/* ISP2401 */
-	bool enable_luma_only;
 	bool enable_tnr;
 
 	bool enable_capture_pp_bli;
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 060d38749570..8c0e02e4e1af 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -1394,9 +1394,6 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 	bool enable_dvs_6axis;
 	bool enable_reduced_pipe;
 	bool enable_capture_pp_bli;
-#ifdef ISP2401
-	bool enable_luma_only;
-#endif
 	int err = -EINVAL;
 	bool continuous;
 	unsigned int isp_pipe_version;
@@ -1450,9 +1447,6 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 	enable_dvs_6axis  = descr->enable_dvs_6axis;
 	enable_reduced_pipe = descr->enable_reduced_pipe;
 	enable_capture_pp_bli = descr->enable_capture_pp_bli;
-#ifdef ISP2401
-	enable_luma_only = descr->enable_luma_only;
-#endif
 	continuous = descr->continuous;
 	striped = descr->striped;
 	isp_pipe_version = descr->isp_pipe_version;
@@ -1748,14 +1742,6 @@ static int __ia_css_binary_find(struct ia_css_binary_descr *descr,
 		}
 
 #ifdef ISP2401
-		if (candidate->enable.luma_only != enable_luma_only) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-					    "ia_css_binary_find() [%d] continue: %d != %d\n",
-					    __LINE__, candidate->enable.luma_only,
-					    descr->enable_luma_only);
-			continue;
-		}
-
 		if (!candidate->enable.tnr && need_tnr) {
 			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 					    "ia_css_binary_find() [%d] continue: !%d && %d\n",
-- 
2.33.1

