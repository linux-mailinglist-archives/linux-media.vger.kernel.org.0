Return-Path: <linux-media+bounces-542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8CF7EFF7A
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 13:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E2431C20860
	for <lists+linux-media@lfdr.de>; Sat, 18 Nov 2023 12:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1645513AEB;
	Sat, 18 Nov 2023 12:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tN0P0I0a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E5FC10DC
	for <linux-media@vger.kernel.org>; Sat, 18 Nov 2023 04:11:48 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40859c464daso3153225e9.1
        for <linux-media@vger.kernel.org>; Sat, 18 Nov 2023 04:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700309507; x=1700914307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xu+JYx8icucaIqQ1fUySlxpdArvO80SStdFxBS/48ZU=;
        b=tN0P0I0ajzH+FpA6sEAFEkOQE840WQdlEotvVawPjVXFKE/AH2GLQNdYM1um9olVmB
         3g7USf0pl8/LUxZf1LNmQioQhN5T4D9fNw56dCIlQQ6CAc0NtwZ1vQyIyZt/fJa3BAh0
         qUU79cHWfyYKP1YaAuih5XDvqlIBUaxfjs9g5TvWC0rF3YyZtobxlVr76yn+6SN1PZcm
         NENwouNqdo8eK9bNFOrjIyRxAtOenbi9CgNEvW3/dfKtVdZH3zMZ0Z48ffYsPy/pNr7/
         6P4XgrqPvVOxrcwf8M4/+lQmP6q2mPf465jF03jD3r9yfQsT0j8ioL7n+8cnQAf4tnLL
         jD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700309507; x=1700914307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xu+JYx8icucaIqQ1fUySlxpdArvO80SStdFxBS/48ZU=;
        b=R+6ExnGNFnECJF8jXpVtn42SyVT1+6Mt/q0ZiyuHY9Ia9bmbzFNNqpsV7nVxCM848i
         jCfIidxDV7v3OLjh+rCzGMDzY8unHxHSu3P0M0L9jeNsAZ/DYelu87ai1RWIc5zVdggu
         7vUlvpcXg3qaobIjHtwE9XExG3Au8KqmrwG9HW+3IMP7FEzmAdE4aAvScKw3t2ZSnAIe
         7JnixJNTasAXw5+I4fbnXIItKwJyLAYd8GZORb8JlMNfBx7RUwaGEfQRoCj/scJLr/Yo
         vVSJF90cmFNJu8fWfCAID2gym72PBiK08hKqxiQRIxfzzJRL2DuYcHZYquIHPESSkWW6
         34Tg==
X-Gm-Message-State: AOJu0Yzh1Q03zIKS3LcyHKc+jSXvww99jyEVIjImQrTJOU3uriEV2dG7
	xGpvptb+IPHyOLXDKCEqL4mdhA==
X-Google-Smtp-Source: AGHT+IFYBfKwJt2N+ASUp2VZ4PXtbMA59QMxRSgctNyhG7/98onzEoFWZ1gSuOAUiib1oRgrjklmgQ==
X-Received: by 2002:a7b:c8d6:0:b0:409:7900:f3d0 with SMTP id f22-20020a7bc8d6000000b004097900f3d0mr1711062wml.34.1700309506748;
        Sat, 18 Nov 2023 04:11:46 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c3b9200b00407efbc4361sm10955775wms.9.2023.11.18.04.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 04:11:46 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 18 Nov 2023 12:11:40 +0000
Subject: [PATCH v5 6/7] media: qcom: camss: Flag VFE-lites to support more
 VFEs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231118-b4-camss-named-power-domains-v5-6-55eb0f35a30a@linaro.org>
References: <20231118-b4-camss-named-power-domains-v5-0-55eb0f35a30a@linaro.org>
In-Reply-To: <20231118-b4-camss-named-power-domains-v5-0-55eb0f35a30a@linaro.org>
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com, 
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13-dev-26615

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Some platforms such as SC7280 have three VFEs and two VFE-lites. Current
code has hard-coded two as the maximum number of VFEs. Remove the
hard-coded maximum number of VFEs to handle all possible combinations of
VFEs and VFE-lites.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-480.c | 33 +++++++++++------------
 drivers/media/platform/qcom/camss/camss-vfe.c     |  5 ++++
 drivers/media/platform/qcom/camss/camss-vfe.h     | 10 +++++++
 drivers/media/platform/qcom/camss/camss.c         | 26 +++++++++---------
 drivers/media/platform/qcom/camss/camss.h         |  3 +--
 5 files changed, 44 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 4652e8b4cff58..dc2735476c823 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -15,31 +15,28 @@
 #include "camss.h"
 #include "camss-vfe.h"
 
-/* VFE 2/3 are lite and have a different register layout */
-#define IS_LITE		(vfe->id >= 2 ? 1 : 0)
-
 #define VFE_HW_VERSION			(0x00)
 
-#define VFE_GLOBAL_RESET_CMD		(IS_LITE ? 0x0c : 0x1c)
-#define	    GLOBAL_RESET_HW_AND_REG	(IS_LITE ? BIT(1) : BIT(0))
+#define VFE_GLOBAL_RESET_CMD		(vfe_is_lite(vfe) ? 0x0c : 0x1c)
+#define	    GLOBAL_RESET_HW_AND_REG	(vfe_is_lite(vfe) ? BIT(1) : BIT(0))
 
-#define VFE_REG_UPDATE_CMD		(IS_LITE ? 0x20 : 0x34)
+#define VFE_REG_UPDATE_CMD		(vfe_is_lite(vfe) ? 0x20 : 0x34)
 static inline int reg_update_rdi(struct vfe_device *vfe, int n)
 {
-	return IS_LITE ? BIT(n) : BIT(1 + (n));
+	return vfe_is_lite(vfe) ? BIT(n) : BIT(1 + (n));
 }
 
 #define	    REG_UPDATE_RDI		reg_update_rdi
-#define VFE_IRQ_CMD			(IS_LITE ? 0x24 : 0x38)
+#define VFE_IRQ_CMD			(vfe_is_lite(vfe) ? 0x24 : 0x38)
 #define     IRQ_CMD_GLOBAL_CLEAR	BIT(0)
 
-#define VFE_IRQ_MASK(n)			((IS_LITE ? 0x28 : 0x3c) + (n) * 4)
-#define	    IRQ_MASK_0_RESET_ACK	(IS_LITE ? BIT(17) : BIT(0))
-#define	    IRQ_MASK_0_BUS_TOP_IRQ	(IS_LITE ? BIT(4) : BIT(7))
-#define VFE_IRQ_CLEAR(n)		((IS_LITE ? 0x34 : 0x48) + (n) * 4)
-#define VFE_IRQ_STATUS(n)		((IS_LITE ? 0x40 : 0x54) + (n) * 4)
+#define VFE_IRQ_MASK(n)			((vfe_is_lite(vfe) ? 0x28 : 0x3c) + (n) * 4)
+#define	    IRQ_MASK_0_RESET_ACK	(vfe_is_lite(vfe) ? BIT(17) : BIT(0))
+#define	    IRQ_MASK_0_BUS_TOP_IRQ	(vfe_is_lite(vfe) ? BIT(4) : BIT(7))
+#define VFE_IRQ_CLEAR(n)		((vfe_is_lite(vfe) ? 0x34 : 0x48) + (n) * 4)
+#define VFE_IRQ_STATUS(n)		((vfe_is_lite(vfe) ? 0x40 : 0x54) + (n) * 4)
 
-#define BUS_REG_BASE			(IS_LITE ? 0x1a00 : 0xaa00)
+#define BUS_REG_BASE			(vfe_is_lite(vfe) ? 0x1a00 : 0xaa00)
 
 #define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + 0x08)
 #define		WM_CGC_OVERRIDE_ALL	(0x3FFFFFF)
@@ -49,13 +46,13 @@ static inline int reg_update_rdi(struct vfe_device *vfe, int n)
 #define VFE_BUS_IRQ_MASK(n)		(BUS_REG_BASE + 0x18 + (n) * 4)
 static inline int bus_irq_mask_0_rdi_rup(struct vfe_device *vfe, int n)
 {
-	return IS_LITE ? BIT(n) : BIT(3 + (n));
+	return vfe_is_lite(vfe) ? BIT(n) : BIT(3 + (n));
 }
 
 #define     BUS_IRQ_MASK_0_RDI_RUP	bus_irq_mask_0_rdi_rup
 static inline int bus_irq_mask_0_comp_done(struct vfe_device *vfe, int n)
 {
-	return IS_LITE ? BIT(4 + (n)) : BIT(6 + (n));
+	return vfe_is_lite(vfe) ? BIT(4 + (n)) : BIT(6 + (n));
 }
 
 #define     BUS_IRQ_MASK_0_COMP_DONE	bus_irq_mask_0_comp_done
@@ -90,8 +87,8 @@ static inline int bus_irq_mask_0_comp_done(struct vfe_device *vfe, int n)
 /* for titan 480, each bus client is hardcoded to a specific path
  * and each bus client is part of a hardcoded "comp group"
  */
-#define RDI_WM(n)			((IS_LITE ? 0 : 23) + (n))
-#define RDI_COMP_GROUP(n)		((IS_LITE ? 0 : 11) + (n))
+#define RDI_WM(n)			((vfe_is_lite(vfe) ? 0 : 23) + (n))
+#define RDI_COMP_GROUP(n)		((vfe_is_lite(vfe) ? 0 : 11) + (n))
 
 #define MAX_VFE_OUTPUT_LINES	4
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 123e5ead7602d..50929c3cbb831 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1742,3 +1742,8 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe)
 		media_entity_cleanup(&sd->entity);
 	}
 }
+
+inline bool vfe_is_lite(struct vfe_device *vfe)
+{
+	return vfe->camss->res->vfe_res[vfe->id].is_lite;
+}
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index cdbe59d8d437e..e75d5cc0bf47a 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -226,4 +226,14 @@ extern const struct vfe_hw_ops vfe_ops_480;
 int vfe_get(struct vfe_device *vfe);
 void vfe_put(struct vfe_device *vfe);
 
+/*
+ * vfe_is_lite - Return if VFE is VFE lite.
+ * @vfe: VFE Device
+ *
+ * Some VFE lites have a different register layout.
+ *
+ * Return whether VFE is VFE lite
+ */
+inline bool vfe_is_lite(struct vfe_device *vfe);
+
 #endif /* QC_MSM_CAMSS_VFE_H */
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ee3e8cefa9b1f..ea0038f62b807 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -706,6 +706,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 				{ 384000000 } },
 		.reg = { "vfe_lite" },
 		.interrupt = { "vfe_lite" },
+		.is_lite = true,
 		.line_num = 4,
 		.ops = &vfe_ops_170
 	}
@@ -886,6 +887,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 0 } },
 		.reg = { "vfe_lite0" },
 		.interrupt = { "vfe_lite0" },
+		.is_lite = true,
 		.line_num = 4,
 		.ops = &vfe_ops_480
 	},
@@ -905,6 +907,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 				{ 0 } },
 		.reg = { "vfe_lite1" },
 		.interrupt = { "vfe_lite1" },
+		.is_lite = true,
 		.line_num = 4,
 		.ops = &vfe_ops_480
 	},
@@ -1204,7 +1207,7 @@ static int camss_init_subdevices(struct camss *camss)
 	}
 
 	/* note: SM8250 requires VFE to be initialized before CSID */
-	for (i = 0; i < camss->vfe_total_num; i++) {
+	for (i = 0; i < camss->res->vfe_num; i++) {
 		ret = msm_vfe_subdev_init(camss, &camss->vfe[i],
 					  &res->vfe_res[i], i);
 		if (ret < 0) {
@@ -1276,7 +1279,7 @@ static int camss_register_entities(struct camss *camss)
 		goto err_reg_ispif;
 	}
 
-	for (i = 0; i < camss->vfe_total_num; i++) {
+	for (i = 0; i < camss->res->vfe_num; i++) {
 		ret = msm_vfe_register_entities(&camss->vfe[i],
 						&camss->v4l2_dev);
 		if (ret < 0) {
@@ -1348,7 +1351,7 @@ static int camss_register_entities(struct camss *camss)
 				}
 	} else {
 		for (i = 0; i < camss->res->csid_num; i++)
-			for (k = 0; k < camss->vfe_total_num; k++)
+			for (k = 0; k < camss->res->vfe_num; k++)
 				for (j = 0; j < camss->vfe[k].line_num; j++) {
 					struct v4l2_subdev *csid = &camss->csid[i].subdev;
 					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
@@ -1372,7 +1375,7 @@ static int camss_register_entities(struct camss *camss)
 	return 0;
 
 err_link:
-	i = camss->vfe_total_num;
+	i = camss->res->vfe_num;
 err_reg_vfe:
 	for (i--; i >= 0; i--)
 		msm_vfe_unregister_entities(&camss->vfe[i]);
@@ -1411,7 +1414,7 @@ static void camss_unregister_entities(struct camss *camss)
 
 	msm_ispif_unregister_entities(camss->ispif);
 
-	for (i = 0; i < camss->vfe_total_num; i++)
+	for (i = 0; i < camss->res->vfe_num; i++)
 		msm_vfe_unregister_entities(&camss->vfe[i]);
 }
 
@@ -1509,7 +1512,7 @@ static int camss_configure_pd(struct camss *camss)
 		return 0;
 
 	/* count the # of VFEs which have flagged power-domain */
-	for (vfepd_num = i = 0; i < camss->vfe_total_num; i++) {
+	for (vfepd_num = i = 0; i < camss->res->vfe_num; i++) {
 		if (res->vfe_res[i].has_pd)
 			vfepd_num++;
 	}
@@ -1584,7 +1587,7 @@ static void camss_genpd_subdevice_cleanup(struct camss *camss)
 {
 	int i;
 
-	for (i = 0; i < camss->vfe_total_num; i++)
+	for (i = 0; i < camss->res->vfe_num; i++)
 		msm_vfe_genpd_cleanup(&camss->vfe[i]);
 }
 
@@ -1641,8 +1644,7 @@ static int camss_probe(struct platform_device *pdev)
 			return -ENOMEM;
 	}
 
-	camss->vfe_total_num = camss->res->vfe_num + camss->res->vfe_lite_num;
-	camss->vfe = devm_kcalloc(dev, camss->vfe_total_num,
+	camss->vfe = devm_kcalloc(dev, camss->res->vfe_num,
 				  sizeof(*camss->vfe), GFP_KERNEL);
 	if (!camss->vfe)
 		return -ENOMEM;
@@ -1800,8 +1802,7 @@ static const struct camss_resources sdm845_resources = {
 	.vfe_res = vfe_res_845,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_845),
 	.csid_num = ARRAY_SIZE(csid_res_845),
-	.vfe_num = 2,
-	.vfe_lite_num = 1,
+	.vfe_num = ARRAY_SIZE(vfe_res_845),
 };
 
 static const struct camss_resources sm8250_resources = {
@@ -1813,8 +1814,7 @@ static const struct camss_resources sm8250_resources = {
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8250),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
 	.csid_num = ARRAY_SIZE(csid_res_8250),
-	.vfe_num = 2,
-	.vfe_lite_num = 2,
+	.vfe_num = ARRAY_SIZE(vfe_res_8250),
 };
 
 static const struct of_device_id camss_dt_match[] = {
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index cd8186fe1797b..a0c2dcc779f05 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -51,6 +51,7 @@ struct camss_subdev_resources {
 	char *pd_name;
 	u8 line_num;
 	bool has_pd;
+	bool is_lite;
 	const void *ops;
 };
 
@@ -95,7 +96,6 @@ struct camss_resources {
 	const unsigned int csiphy_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
-	const unsigned int vfe_lite_num;
 };
 
 struct camss {
@@ -113,7 +113,6 @@ struct camss {
 	struct device_link *genpd_link;
 	struct icc_path *icc_path[ICC_SM8250_COUNT];
 	const struct camss_resources *res;
-	unsigned int vfe_total_num;
 };
 
 struct camss_camera_interface {

-- 
2.42.0


