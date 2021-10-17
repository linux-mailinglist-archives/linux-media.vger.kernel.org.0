Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1D3430A97
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241513AbhJQQXw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237973AbhJQQXw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:23:52 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66512C06161C;
        Sun, 17 Oct 2021 09:21:42 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id 21so9590717plo.13;
        Sun, 17 Oct 2021 09:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fbsa0URnWzuJi7XOxccO2sQBebKEz+NX/dFiG0zgGO4=;
        b=B83xL/3VlstQPjKHZYywePGzZAFglGVAulnqpe8h9HcDp/OVfERjQ7AjrqD5ePJpUZ
         w46mp5JpHU8Hk7nkb6n+5XMchFgMewXILl8WFu1TaFVYe4VBUyZK2hDELxznRIRyFckj
         MMlLIZoVektaUwB/DYnAg2sW8y5iLhTX+qfkazCIciFGJM/vUCfUDJ4H/goLRnkasydR
         GXoVxcB2DrEV0jn6hhxfrdfgnBT7/gSAjoJP3HcBvG/GiGvCtLTfLgK+pNnBcYWpvLWt
         7rq1wqSp/EL1WTFXkocTV3jIg82P1L2yyioEtzPZ/yBCY4uoJCXZJ6l1mAKStZPsO3KN
         JuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fbsa0URnWzuJi7XOxccO2sQBebKEz+NX/dFiG0zgGO4=;
        b=lk+za+27WHpdWcM116nuNfTh0bV2xSYJqRuQuTGixbICaNpBEotBtWWWFogPH+RhDX
         ZBVtZW5jn+ujEXKhYlkOT0wXNWosZHcNcjHusQey4A1IAu9HmMfD2WIJBJ4h8DeTObOH
         ucvPfyZUwYhuYgEWImAWrJ8LIWdUJBoXzht3nF0nrbtN9GDQNUo0Oumc1HNuSgTDlqYA
         cI037eayRRF1OgDKPRmTlSrGS6netVN/3QOSnsYSkTkuBBVk0nGpl9+CTUq37LT+B4rg
         p0gcFudCbqv7GQQ8cGGfGDTlMTiLUMRlFB+uBSh1qrgqgantPXxApsxQc8SNCMuCyyF3
         wCfg==
X-Gm-Message-State: AOAM530UEVl+VvF8IxTHKdQ56QSq2ThScmGCA7oWYoKHAFdwoyN3uteT
        3eqYxeTVObxtgmMCDgMrYBw=
X-Google-Smtp-Source: ABdhPJyDxSgHdoKNLuVky5RuouHPbiwrV9Olz1FhJAGIAUC6OLT9o5GL3aHduvxkILuTx+9qQCVDCQ==
X-Received: by 2002:a17:902:7001:b0:13d:d5b7:d06e with SMTP id y1-20020a170902700100b0013dd5b7d06emr22612233plk.61.1634487701795;
        Sun, 17 Oct 2021 09:21:41 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:21:41 -0700 (PDT)
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
        Alan <alan@linux.intel.com>, Deepak R Varma <drv@mailo.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/17] media: atomisp: pci: make fw ver irci_stable_candrpv_0415_20150521_0458 work - 2/5
Date:   Mon, 18 Oct 2021 01:19:49 +0900
Message-Id: <20211017161958.44351-10-kitakar@gmail.com>
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

This patch removes `struct ia_css_isp_parameter sc` from
`struct ia_css_config_memory_offsets` as well as its usage [1].

[1] added on updating css version to irci_master_20150701_0213
    https://raw.githubusercontent.com/intel/ProductionKernelQuilts/cht-m1stable-2016_ww31/uefi/cht-m1stable/patches/cam-0439-atomisp2-css2401-and-2401_legacy-irci_master_2015070.patch
    ("atomisp2: css2401 and 2401_legacy-irci_master_20150701_0213")

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 .../media/atomisp/pci/ia_css_isp_configs.h    |  8 ---
 .../isp/kernels/sc/sc_1.0/ia_css_sc.host.c    | 68 -------------------
 .../isp/kernels/sc/sc_1.0/ia_css_sc.host.h    | 33 ---------
 .../isp/kernels/sc/sc_1.0/ia_css_sc_types.h   | 14 ----
 drivers/staging/media/atomisp/pci/sh_css_sp.c |  4 --
 5 files changed, 127 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.h b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.h
index 1abb2fd6a913..0364b932e79b 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_isp_configs.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_isp_configs.h
@@ -23,10 +23,6 @@
 #include "isp/kernels/raw/raw_1.0/ia_css_raw.host.h"
 #include "isp/kernels/ref/ref_1.0/ia_css_ref.host.h"
 #include "isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.h"
-
-/* ISP2401 */
-#include "isp/kernels/sc/sc_1.0/ia_css_sc.host.h"
-
 #include "isp/kernels/tnr/tnr_1.0/ia_css_tnr.host.h"
 #include "isp/kernels/vf/vf_1.0/ia_css_vf.host.h"
 #include "isp/kernels/iterator/iterator_1.0/ia_css_iterator.host.h"
@@ -73,10 +69,6 @@ struct ia_css_config_memory_offsets {
 		struct ia_css_isp_parameter output0;
 		struct ia_css_isp_parameter output1;
 		struct ia_css_isp_parameter output;
-
-		/* ISP2401 */
-		struct ia_css_isp_parameter sc;
-
 		struct ia_css_isp_parameter raw;
 		struct ia_css_isp_parameter tnr;
 		struct ia_css_isp_parameter ref;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.c
index f3fb4b9b3c82..6974b3424d91 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.c
@@ -23,35 +23,6 @@
 
 #include "ia_css_sc.host.h"
 
-/* Code generated by genparam/genconfig.c:gen_configure_function() */
-
-/* ISP2401 */
-static void
-ia_css_configure_sc(
-    const struct ia_css_binary *binary,
-    const struct ia_css_sc_configuration *config_dmem)
-{
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_sc() enter:\n");
-
-	{
-		unsigned int offset = 0;
-		unsigned int size   = 0;
-
-		if (binary->info->mem_offsets.offsets.config) {
-			size   = binary->info->mem_offsets.offsets.config->dmem.sc.size;
-			offset = binary->info->mem_offsets.offsets.config->dmem.sc.offset;
-		}
-		if (size) {
-			ia_css_sc_config((struct sh_css_isp_sc_isp_config *)
-					 &binary->mem_params.params[IA_CSS_PARAM_CLASS_CONFIG][IA_CSS_ISP_DMEM].address[offset],
-					 config_dmem, size);
-		}
-	}
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-			    "ia_css_configure_sc() leave:\n");
-}
-
 void
 ia_css_sc_encode(
     struct sh_css_isp_sc_params *to,
@@ -73,45 +44,6 @@ ia_css_sc_dump(
 			    "sc_gain_shift", sc->gain_shift);
 }
 
-/* ISP2401 */
-void
-ia_css_sc_config(
-    struct sh_css_isp_sc_isp_config *to,
-    const struct ia_css_sc_configuration *from,
-    unsigned int size)
-{
-	u32 internal_org_x_bqs = from->internal_frame_origin_x_bqs_on_sctbl;
-	u32 internal_org_y_bqs = from->internal_frame_origin_y_bqs_on_sctbl;
-	u32 slice, rest, i;
-
-	(void)size;
-
-	/* The internal_frame_origin_x_bqs_on_sctbl is separated to 8 times of slice_vec. */
-	rest = internal_org_x_bqs;
-	for (i = 0; i < SH_CSS_SC_INTERPED_GAIN_HOR_SLICE_TIMES; i++) {
-		slice = min(rest, ((uint32_t)ISP_SLICE_NELEMS));
-		rest = rest - slice;
-		to->interped_gain_hor_slice_bqs[i] = slice;
-	}
-
-	to->internal_frame_origin_y_bqs_on_sctbl = internal_org_y_bqs;
-}
-
-/* ISP2401 */
-void
-ia_css_sc_configure(
-    const struct ia_css_binary *binary,
-    u32 internal_frame_origin_x_bqs_on_sctbl,
-    uint32_t internal_frame_origin_y_bqs_on_sctbl)
-{
-	const struct ia_css_sc_configuration config = {
-		internal_frame_origin_x_bqs_on_sctbl,
-		internal_frame_origin_y_bqs_on_sctbl
-	};
-
-	ia_css_configure_sc(binary, &config);
-}
-
 /* ------ deprecated(bz675) : from ------ */
 /* It looks like @parameter{} (in *.pipe) is used to generate the process/get/set functions,
    for parameters which should be used in the isp kernels.
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.h
index f1eb568f23d4..d103103c9a87 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc.host.h
@@ -32,39 +32,6 @@ ia_css_sc_dump(
     const struct sh_css_isp_sc_params *sc,
     unsigned int level);
 
-/* @brief Configure the shading correction.
- * @param[out]	to	Parameters used in the shading correction kernel in the isp.
- * @param[in]	from	Parameters passed from the host.
- * @param[in]	size	Size of the sh_css_isp_sc_isp_config structure.
- *
- * This function passes the parameters for the shading correction from the host to the isp.
- */
-/* ISP2401 */
-void
-ia_css_sc_config(
-    struct sh_css_isp_sc_isp_config *to,
-    const struct ia_css_sc_configuration *from,
-    unsigned int size);
-
-/* @brief Configure the shading correction.
- * @param[in]	binary	The binary, which has the shading correction.
- * @param[in]	internal_frame_origin_x_bqs_on_sctbl
- *			X coordinate (in bqs) of the origin of the internal frame on the shading table.
- * @param[in]	internal_frame_origin_y_bqs_on_sctbl
- *			Y coordinate (in bqs) of the origin of the internal frame on the shading table.
- *
- * This function calls the ia_css_configure_sc() function.
- * (The ia_css_configure_sc() function is automatically generated in ia_css_isp.configs.c.)
- * The ia_css_configure_sc() function calls the ia_css_sc_config() function
- * to pass the parameters for the shading correction from the host to the isp.
- */
-/* ISP2401 */
-void
-ia_css_sc_configure(
-    const struct ia_css_binary *binary,
-    u32 internal_frame_origin_x_bqs_on_sctbl,
-    uint32_t internal_frame_origin_y_bqs_on_sctbl);
-
 /* ------ deprecated(bz675) : from ------ */
 void
 sh_css_get_shading_settings(const struct ia_css_isp_parameters *params,
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h
index aae534521b7b..1d70f6b9a0ec 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h
@@ -118,18 +118,4 @@ struct ia_css_shading_settings {
 
 /* ------ deprecated(bz675) : to ------ */
 
-/* Shading Correction configuration.
- *
- *  NOTE: The shading table size is larger than or equal to the internal frame size.
- */
-/* ISP2401 */
-struct ia_css_sc_configuration {
-	u32 internal_frame_origin_x_bqs_on_sctbl; /** Origin X (in bqs) of internal frame on shading table. */
-	u32 internal_frame_origin_y_bqs_on_sctbl; /** Origin Y (in bqs) of internal frame on shading table. */
-	/** NOTE: bqs = size in BQ(Bayer Quad) unit.
-		1BQ means {Gr,R,B,Gb}(2x2 pixels).
-		Horizontal 1 bqs corresponds to horizontal 2 pixels.
-		Vertical 1 bqs corresponds to vertical 2 pixels. */
-};
-
 #endif /* __IA_CSS_SC_TYPES_H */
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index a73e8ca1e225..13b15a5a33bc 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -827,10 +827,6 @@ configure_isp_from_args(
 	ia_css_output1_configure(binary, &args->out_vf_frame->info);
 	ia_css_copy_output_configure(binary, args->copy_output);
 	ia_css_output0_configure(binary, &args->out_frame[0]->info);
-#ifdef ISP2401
-	ia_css_sc_configure(binary, pipeline->shading.internal_frame_origin_x_bqs_on_sctbl,
-			    pipeline->shading.internal_frame_origin_y_bqs_on_sctbl);
-#endif
 	ia_css_iterator_configure(binary, &args->in_frame->info);
 	ia_css_dvs_configure(binary, &args->out_frame[0]->info);
 	ia_css_output_configure(binary, &args->out_frame[0]->info);
-- 
2.33.1

