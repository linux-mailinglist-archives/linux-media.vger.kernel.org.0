Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7792963FC
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 19:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369265AbgJVRrU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 13:47:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2900872AbgJVRrT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 13:47:19 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13FE7C0613CF;
        Thu, 22 Oct 2020 10:47:19 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id k18so3292784wmj.5;
        Thu, 22 Oct 2020 10:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yYEa2a9CVGr9wjgFN7lgPeKzRz9yF1W40yk9TsgtuR0=;
        b=hexcNgLWNQDy/fFF0nuPCPzqj7s2f+JmYUZabeknSjzHQ+zUMGg0J9nn/2t6EZuUwT
         J27BHGCeIVHZ+45t60fje/exkwb/bgJdytBSJLIqlLaq5Jsszovmj1kNSSyE+sawdGDS
         rkJTOc4uVktCxzYDVf7sCJuvn2FMR9hD9Gwna6hM2iqKzW4ZunNWO4iAsNvNhSQFuTQQ
         CJkbmXbSc/GIBx8YnMAjKJdZUTrmegdFOvqrISblU1GBC98G5W3Zcvc6HvH6TNUwrnZB
         iihFUu3Tw5ejULD3D5tKJddIhUhcVP1MQGAyScLsIWP3lCCuW0hSymyUmf3jRVTik8UG
         JLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yYEa2a9CVGr9wjgFN7lgPeKzRz9yF1W40yk9TsgtuR0=;
        b=KESO0zz7VQq+EdRQaBaYIgrec1kDghxbhlZtWiy7/Q9rqHGYoE7qA/wJSOJ+bRpOhM
         QiCpzFpHbFmJKLZjpvrm5E6+JMWCx5tzojcGObwes59AzVseglMTrZ2CBZXhHsF15aEY
         j4Sxh+Dh3aD/JDRI2e5uf97WT45RTsCJ+MkKPEXDD609ZJFzHP4PK/2sQpnOmAdxJaNo
         nw+UfMrT45jL7DKl9wZqOeYDL2ulcXvPy7fiqH6GwQYWywlsOHIauNhEMiogc8ey5uJi
         jP6V0zp2hK1sKxTIQkBARWtlvPZSWIMP31ATWvyOSEiU2d83Iqgf00P7iWQRRid/XFcJ
         7EbA==
X-Gm-Message-State: AOAM530Z2guYajXHM5vF1BSwhxHJIQcouDuW78IA6PDSva2vc2t7t/5a
        BegcSW9AW+SSNxtwmJQWw+o=
X-Google-Smtp-Source: ABdhPJx2oQLksN2auE8cXSY3/A4ckS3hELIvY2X2NSxI7XgzuWXEXalIR/gP8fSwSZjcE8mNcnKCDw==
X-Received: by 2002:a1c:ddc4:: with SMTP id u187mr3564726wmg.156.1603388837698;
        Thu, 22 Oct 2020 10:47:17 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u202sm5368355wmu.23.2020.10.22.10.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 10:47:17 -0700 (PDT)
From:   kholk11@gmail.com
To:     todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robert.foss@linaro.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 2/7] media: camss: vfe-4-7: Rename get_ub_size, set_qos, set_ds, wm_enable
Date:   Thu, 22 Oct 2020 19:47:01 +0200
Message-Id: <20201022174706.8813-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022174706.8813-1-kholk11@gmail.com>
References: <20201022174706.8813-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

In preparation to add support for VFE 4.8, rename these functions
by adding the vfe version that they are referred to (for example,
vfe_get_ub_size -> vfe47_get_ub_size), as these are the only ones
that will be different for the VFE version 4.8.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../media/platform/qcom/camss/camss-vfe-4-7.c    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 0dca8bf9281e..6f380a450ca1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -246,7 +246,7 @@ static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
 	dev_err(dev, "VFE HW Version = 0x%08x\n", hw_version);
 }
 
-static u16 vfe_get_ub_size(u8 vfe_id)
+static u16 vfe47_get_ub_size(u8 vfe_id)
 {
 	if (vfe_id == 0)
 		return MSM_VFE_VFE0_UB_SIZE_RDI;
@@ -299,7 +299,7 @@ static void vfe_halt_clear(struct vfe_device *vfe)
 	writel_relaxed(0x0, vfe->base + VFE_0_BUS_BDG_CMD);
 }
 
-static void vfe_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
+static void vfe47_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
 {
 	if (enable)
 		vfe_reg_set(vfe, VFE_0_BUS_IMAGE_MASTER_n_WR_CFG(wm),
@@ -883,7 +883,7 @@ static void vfe_set_clamp_cfg(struct vfe_device *vfe)
 	writel_relaxed(val, vfe->base + VFE_0_CLAMP_ENC_MIN_CFG);
 }
 
-static void vfe_set_qos(struct vfe_device *vfe)
+static void vfe47_set_qos(struct vfe_device *vfe)
 {
 	u32 val = VFE_0_BUS_BDG_QOS_CFG_0_CFG;
 	u32 val7 = VFE_0_BUS_BDG_QOS_CFG_7_CFG;
@@ -898,7 +898,7 @@ static void vfe_set_qos(struct vfe_device *vfe)
 	writel_relaxed(val7, vfe->base + VFE_0_BUS_BDG_QOS_CFG_7);
 }
 
-static void vfe_set_ds(struct vfe_device *vfe)
+static void vfe47_set_ds(struct vfe_device *vfe)
 {
 	u32 val = VFE_0_BUS_BDG_DS_CFG_0_CFG;
 	u32 val16 = VFE_0_BUS_BDG_DS_CFG_16_CFG;
@@ -1098,11 +1098,11 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 
 const struct vfe_hw_ops vfe_ops_4_7 = {
 	.hw_version_read = vfe_hw_version_read,
-	.get_ub_size = vfe_get_ub_size,
+	.get_ub_size = vfe47_get_ub_size,
 	.global_reset = vfe_global_reset,
 	.halt_request = vfe_halt_request,
 	.halt_clear = vfe_halt_clear,
-	.wm_enable = vfe_wm_enable,
+	.wm_enable = vfe47_wm_enable,
 	.wm_frame_based = vfe_wm_frame_based,
 	.wm_line_based = vfe_wm_line_based,
 	.wm_set_framedrop_period = vfe_wm_set_framedrop_period,
@@ -1128,8 +1128,8 @@ const struct vfe_hw_ops vfe_ops_4_7 = {
 	.set_scale_cfg = vfe_set_scale_cfg,
 	.set_crop_cfg = vfe_set_crop_cfg,
 	.set_clamp_cfg = vfe_set_clamp_cfg,
-	.set_qos = vfe_set_qos,
-	.set_ds = vfe_set_ds,
+	.set_qos = vfe47_set_qos,
+	.set_ds = vfe47_set_ds,
 	.set_cgc_override = vfe_set_cgc_override,
 	.set_camif_cfg = vfe_set_camif_cfg,
 	.set_camif_cmd = vfe_set_camif_cmd,
-- 
2.28.0

