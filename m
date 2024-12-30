Return-Path: <linux-media+bounces-24181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D14D9FE945
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 18:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E4F03A23C8
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 17:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DC11AE877;
	Mon, 30 Dec 2024 17:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yo5RjMaz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8586B199938
	for <linux-media@vger.kernel.org>; Mon, 30 Dec 2024 17:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735578045; cv=none; b=j1O9EX6Sh/yVlROawoUtEbLdHq1YBlKmUYq8pY4AYOHv2xxpJk2tFQbiFAUzRGxW3dq2i4oSDgSmoKsh1A/GoWTGQCW88VmO2peC5dUoCszRcfPPdE4EObNM9Ug7gIuTmRz+ElikaypA3nL5wdEh9ir6/asN1PEx8Ts4Yebvv+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735578045; c=relaxed/simple;
	bh=P/EB0Q5IX1CPZrLEQsUh/79qF0MN9BkQ9e3xHArYHKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h9m+rqTsBy9kHZWwGBynR0dikEYx6jTblnMr3t2zbExUMpiUctZmGs7vj0xK991RMtJsr6U3WG2B0iFLujo/ZahchDxtieimv9smLT0vlA3OKjEUuu6yA1C8jr6GraDJDFb+ZttBjPw9RWxHfTD0EhtbiMMXHtHddP+fr+aCJ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yo5RjMaz; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-386329da1d9so4301000f8f.1
        for <linux-media@vger.kernel.org>; Mon, 30 Dec 2024 09:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735578042; x=1736182842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHfi+dI4OPKFx8z20qLrvZitpcJJyqgdl8C+OLayePk=;
        b=Yo5RjMaz522v6KWJUdiz+GDakFt72/IfQSVgHdU0GFtOd3oNa9xsgafGTcCIhB9F2K
         PPy2tNLXT04CTOcpqxDlc6CmUy0MqE8aaLfy1+x31wUUSH4SOGqbhztmDV4U+hscB1MP
         uEIO/2h3nQO5V3MBYJodLLRX+Y6+TdGHFSGgHWRy78z/fAQ8b6lk0k9CmOygMSkLSEK+
         0kSUBs36s67oJB3yb++94jtsn4GSYHXmH3sQFhF7zgDX5V2AH0dx9hqS8S99P+ZqU7Le
         GM3pzGVQV4pADc4UoKnRnTypeVbrVEWDxCjf8ZIMCiUHGjoK31hy8PliBNWaB2q7uLLj
         RPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735578042; x=1736182842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHfi+dI4OPKFx8z20qLrvZitpcJJyqgdl8C+OLayePk=;
        b=r7+y3j8yx6WMYmJo7AZAipSxgLv1lyksOQA6UBTGZsduYhYoU0FAlbmpCekem/Z6cg
         JG25WxY/64mKVyF/fQAPfdgXg0LYlyi/plFmDRD+BNerGLJVPhXhCBKyFd2WhVG2XYBy
         rdcEjFD1YvhzYoZlUTmGJnSiCrz/lkAPgDa5h85GMbfzB82ovBAgkVa59ZVKp2dbBdmU
         AREy1VAfW1bKDPE+wZBfYIkCVDkBDPCo9NlRZhvruWXd9YyKuYT53L16om917xG1nB3z
         6UTzyKswR0Orj3qyLk9Qr+8tBBUGhedPjIxDgqoV5v7Pep6rJM0dPLS2ZqOTnMcI5Sp/
         e3+w==
X-Forwarded-Encrypted: i=1; AJvYcCVb+RuHWxy6Ji8VbBFtEX4M5DGNgdVgiPHjy9c9XlKtERfSHCuAIL2HlnQuBJX9lTO+LUisPiPr59wriA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYoW5u0lmf58eOmZNf+u8wG+Rtk/KTT0K3oW81WR1Zo8Y1w4f+
	4aI4VWCz9MFnTT8VrJwNvOS3eaAiE5dmCOqr6Om5FS6072w57r0mAPuL19XBUvU=
X-Gm-Gg: ASbGnctkCJjA0vv7nFxE4EZ35vCG2u4I+FJ/xzXw54kimuiLKm5lMAAogq2D/FA2QVu
	FS4Dar9dEjDW2KOtDVx/wnSeOPHMlL+7okb2Nz6NLA0jZfy+JYSf62nRlK19klmIE20Qkvk1+7n
	1ggKpuB9tKn2j6EWKcSFHgtLlV/oXGOxcBG+eN8QNdfHUSQa5HVafTl88DjxSzLVnXMa1CfLMG5
	vbBmzXPaVda1irG9FDq6V5xqZfOOSCJAFxfKbTrivGoWUmsUcZ8q3g0evPZVJc/xA==
X-Google-Smtp-Source: AGHT+IEsG97d/RhUSfJQzw24meZ7Pau3MdD65rar1RKMzi1P53mS1+qA7rUXH7J5lmAuUv3T7NSCdw==
X-Received: by 2002:a05:6000:3cd:b0:386:33e8:20f4 with SMTP id ffacd0b85a97d-38a2240f11fmr30572628f8f.59.1735578041905;
        Mon, 30 Dec 2024 09:00:41 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611fc161sm359757955e9.10.2024.12.30.09.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 09:00:41 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 30 Dec 2024 17:00:33 +0000
Subject: [PATCH v6 1/3] media: venus: Add support for static video
 encoder/decoder declarations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-media-staging-24-11-25-rb3-hw-compat-string-v6-1-a4d5070d3aaa@linaro.org>
References: <20241230-media-staging-24-11-25-rb3-hw-compat-string-v6-0-a4d5070d3aaa@linaro.org>
In-Reply-To: <20241230-media-staging-24-11-25-rb3-hw-compat-string-v6-0-a4d5070d3aaa@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com, 
 quic_dikshita@quicinc.com, konradybcio@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

Add resource structure data and probe() logic to support static
declarations of encoder and decoder.

Right now we rely on video encoder/decoder selection happening in the dtb
but, this goes against the remit of device tree which is supposed to
describe hardware, not select functional logic in Linux drivers.

Provide two strings in the venus resource structure enc_nodename and
dec_nodename.

When set the venus driver will create an OF entry in-memory consistent
with:

dec_nodename {
    compat = "video-decoder";
};

and/or

enc_nodename {
    compat = "video-encoder";
};

This will allow us to reuse the existing driver scheme of relying on compat
names maintaining compatibility with old dtb files.

dec_nodename can be "video-decoder" or "video0"
enc_nodename can be "video-encoder" or "video1"

This change relies on of_changeset() API as a result select OF_DYNAMIC will
be added to venus/Kconfig

Tested-by: Renjiang Han <quic_renjiang@quicinc.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/Kconfig |  1 +
 drivers/media/platform/qcom/venus/core.c  | 95 ++++++++++++++++++++++++++++++-
 drivers/media/platform/qcom/venus/core.h  |  4 ++
 3 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/Kconfig b/drivers/media/platform/qcom/venus/Kconfig
index bfd50e8f34219db8a1de7960d7ea93b20db2982a..bc2e410b29cb415a36540a4f98709eae44f4ec35 100644
--- a/drivers/media/platform/qcom/venus/Kconfig
+++ b/drivers/media/platform/qcom/venus/Kconfig
@@ -3,6 +3,7 @@ config VIDEO_QCOM_VENUS
 	depends on V4L_MEM2MEM_DRIVERS
 	depends on VIDEO_DEV && QCOM_SMEM
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
+	select OF_DYNAMIC if ARCH_QCOM
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select QCOM_SCM
 	select VIDEOBUF2_DMA_CONTIG
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 4e26b18790537885a77d66c1917a4e7a146eaf57..fe24bccff08aed1ebdfe00f75e1aa5b67ae7826e 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -286,6 +286,89 @@ static irqreturn_t venus_isr_thread(int irq, void *dev_id)
 	return ret;
 }
 
+#if defined(CONFIG_OF_DYNAMIC)
+static int venus_add_video_core(struct venus_core *core, const char *node_name,
+				const char *compat)
+{
+	struct of_changeset *ocs = core->ocs;
+	struct device *dev = core->dev;
+	struct device_node *np, *enp;
+	int ret;
+
+	if (!node_name)
+		return 0;
+
+	enp = of_find_node_by_name(dev->of_node, node_name);
+	if (enp) {
+		of_node_put(enp);
+		return 0;
+	}
+
+	np = of_changeset_create_node(ocs, dev->of_node, node_name);
+	if (!np) {
+		dev_err(dev, "Unable to create new node\n");
+		return -ENODEV;
+	}
+
+	ret = of_changeset_add_prop_string(ocs, np, "compatible", compat);
+	if (ret)
+		dev_err(dev, "unable to add %s\n", compat);
+
+	of_node_put(np);
+
+	return ret;
+}
+
+static int venus_add_dynamic_nodes(struct venus_core *core)
+{
+	struct device *dev = core->dev;
+	int ret;
+
+	core->ocs = kmalloc(sizeof(*core->ocs), GFP_KERNEL);
+	if (!core->ocs)
+		return -ENOMEM;
+
+	of_changeset_init(core->ocs);
+
+	ret = venus_add_video_core(core, core->res->dec_nodename, "venus-decoder");
+	if (ret)
+		goto err;
+
+	ret = venus_add_video_core(core, core->res->enc_nodename, "venus-encoder");
+	if (ret)
+		goto err;
+
+	ret = of_changeset_apply(core->ocs);
+	if (ret) {
+		dev_err(dev, "applying changeset fail ret %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+err:
+	of_changeset_destroy(core->ocs);
+	kfree(core->ocs);
+	core->ocs = NULL;
+	return ret;
+}
+
+static void venus_remove_dynamic_nodes(struct venus_core *core)
+{
+	if (core->ocs) {
+		of_changeset_revert(core->ocs);
+		of_changeset_destroy(core->ocs);
+		kfree(core->ocs);
+	}
+}
+#else
+static int venus_add_dynamic_nodes(struct venus_core *core)
+{
+	return 0;
+}
+
+static void venus_remove_dynamic_nodes(struct venus_core *core) {}
+#endif
+
 static int venus_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -365,9 +448,15 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_runtime_disable;
 
+	if (core->res->dec_nodename || core->res->enc_nodename) {
+		ret = venus_add_dynamic_nodes(core);
+		if (ret)
+			goto err_runtime_disable;
+	}
+
 	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 	if (ret)
-		goto err_runtime_disable;
+		goto err_remove_dynamic_nodes;
 
 	ret = venus_firmware_init(core);
 	if (ret)
@@ -411,6 +500,8 @@ static int venus_probe(struct platform_device *pdev)
 	venus_firmware_deinit(core);
 err_of_depopulate:
 	of_platform_depopulate(dev);
+err_remove_dynamic_nodes:
+	venus_remove_dynamic_nodes(core);
 err_runtime_disable:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
@@ -443,6 +534,8 @@ static void venus_remove(struct platform_device *pdev)
 
 	venus_firmware_deinit(core);
 
+	venus_remove_dynamic_nodes(core);
+
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 27784fd7082c321222b23ca4b2902a04c49e19ca..306231b4f7d0201175974b4a42574f30d23e08f0 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -90,6 +90,8 @@ struct venus_resources {
 	u32 cp_nonpixel_start;
 	u32 cp_nonpixel_size;
 	const char *fwname;
+	const char *enc_nodename;
+	const char *dec_nodename;
 };
 
 enum venus_fmt {
@@ -171,6 +173,7 @@ struct venus_format {
  * @root:	debugfs root directory
  * @venus_ver:	the venus firmware version
  * @dump_core:	a flag indicating that a core dump is required
+ * @ocs:	OF changeset pointer
  */
 struct venus_core {
 	void __iomem *base;
@@ -235,6 +238,7 @@ struct venus_core {
 		u32 rev;
 	} venus_ver;
 	unsigned long dump_core;
+	struct of_changeset *ocs;
 };
 
 struct vdec_controls {

-- 
2.47.1


