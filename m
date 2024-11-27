Return-Path: <linux-media+bounces-22120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 372B99DA051
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 02:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93CC6165C25
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 01:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB54C288D1;
	Wed, 27 Nov 2024 01:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S3CYCJao"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0F28479
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 01:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732671254; cv=none; b=u4A2/q1ExsNrrqAgG/j/xVbyYwadqZcOgUGnKarHn3PXxjjs6UPoyjIueqYQd+XjENZa8TlodkxkPvJOCABAEkeeYZW0IJWyr84w5sTsrzLSNxaEPH4eSTORf1DAqQYG+yTy83lVblq76vRtW15UHhj/A5PU/Whl9E1IdwAbc1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732671254; c=relaxed/simple;
	bh=Z8h8lMP+jocQ/4896xfrl/HHCJ5l7Pe1DjlV+Cd0zUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MNrbYyvM6oDk/+/P8aA+UfsT2CTuNWYcpmcgzIAmrJrHgHQPY371FYws8dDKjOSQkqoETkPrI6C2WwqllmA3Ic2dL5/NUgW/5uVSzVnPa38TVSYsId0uFVspD9qPp6uUpxPR7KszpsosMyk0GVedRn9mwYGUTH3GYqOxsEXDKq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S3CYCJao; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434a2033562so18687845e9.1
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 17:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732671250; x=1733276050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHdydKppx4W4aIGz3r9c82fCfdszdFjhSOTKkQbOLtU=;
        b=S3CYCJaoZg0+8FVYUla7Uc6W0y2zgQZA57wZpYDnrIrDXyK/VTTwvGHNeflhq7/err
         de9ico2432B5agLMECEwgiitgTtusI0LIT9s0N7dCLaxe213D433qLGyX6rblPAGkIs0
         Ck8AqM6Ust4ip4jjY+I4vuvZFy5pZgl/QxrM6Xf0GpaZBblazxb4HFTIb6W6R22MB9rd
         FAcZazsulVcjKyCFa6lysCqx3+MhlRdxir3D/JYGPDUudtLUF1521BQQ+VGIeXno5a/f
         bNpyqd02xTU8P/eZqOG6R0NAklJk5yAyUPq7+uTv5nwZJpZJ+81SjIC/EtORxFA8xgd9
         mBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732671250; x=1733276050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHdydKppx4W4aIGz3r9c82fCfdszdFjhSOTKkQbOLtU=;
        b=qktvknst9GhUw2y8NuNhB6+n/dESg0ikTshmVgPupJpaUopQdruSidPA8Y85XL9fDH
         skJ/RNGutJeUvBldt8M3iiZT1zf64bmiKOc02Yf6YAiY7x+h0dA6QhM4h6XMeR0auBrw
         zaq4Tde/paLi1Yuyx6kEmdm2AtEHCWxYsfnLCqitqNT/qrB+nbNd++hedd0C0wzOJld3
         ekDtx2DK82Xyl6/7Crdj4tGNzqvNUuP8t3p4HgHrVQ9Avr3aXjx8CWpy7QsXjxOLyNjY
         kplAogHyG5qzWtCkxMMmZv8K4pQhAjPH2cmC3Sowf0wi/myV7kvsByNMfzuKM5bWsRFz
         t/Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVdP6nRME7YZszy1VciqNp7N8FQBuyA2VJaQwnRoOjx+fLPnhpx8l85p1FFyZaFz5YtAhVHmFxHpnQAcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/qKrnaQbzPOl/kqMlzJ6TNqR7xtCVMkdLWK7ptECK+BoTpLsd
	cK7hB3dVezXnV5B0P9KqquC/cP5JNqqqAfcddlDumJxMJsxUJFbfY+EfAWG+GI0=
X-Gm-Gg: ASbGncsv0jHfW16XMRSxGYsIGd4md99BDW4/cijtlCJK+CM1TMSt1U1qKe1S+mK8RS0
	Q9nDPLL9pYOBhcXTO5DHwOxhWqU1a+P5h6gFxK8cFjSX3erGUUMc2mQWkl24VbtVBP/2yCTR/5G
	LDf2gG8TKZcG6uXdEGe4jyzopD/rx4VCct+PQJVcXzK9nwhX9zEpF0MvAPSpGz2Ay5ESj3fkIrR
	nNSsQOIpKe+2Meb813zq/VciEzBkFTR/dalIEsJBSaYvsSDSUkKU51gb8M=
X-Google-Smtp-Source: AGHT+IGQCLX2eoxNmjh0DXZKWZwFh9j+uGNXeg8HR2swrT28GWPAYiFC1KOywH0ttvdYmjR06JEboA==
X-Received: by 2002:a05:600c:458b:b0:434:a924:44e9 with SMTP id 5b1f17b1804b1-434a9dcfedfmr10774915e9.15.1732671250557;
        Tue, 26 Nov 2024 17:34:10 -0800 (PST)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc42b3sm14848641f8f.68.2024.11.26.17.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 17:34:09 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 27 Nov 2024 01:34:04 +0000
Subject: [PATCH 1/3] media: venus: Add support for static video
 encoder/decoder declarations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-1-99c16f266b46@linaro.org>
References: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-0-99c16f266b46@linaro.org>
In-Reply-To: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-0-99c16f266b46@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com, 
 quic_dikshita@quicinc.com, konradybcio@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 devicetree@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 57 ++++++++++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h |  2 ++
 2 files changed, 59 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 4e26b18790537885a77d66c1917a4e7a146eaf57..28fe31b8251cc0efacf43d63cb2296cf8a9c052e 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -286,6 +286,37 @@ static irqreturn_t venus_isr_thread(int irq, void *dev_id)
 	return ret;
 }
 
+static int venus_add_video_core(struct device *dev, struct of_changeset *ocs,
+				const char *node_name, const char *compat)
+{
+	struct device_node *np, *enp;
+	int ret;
+
+	if (!node_name)
+		return 0;
+
+	enp = of_find_node_by_name(dev->of_node, node_name);
+	if (enp) {
+		of_node_put(enp);
+		dev_info(dev, "Node %s exists won't create new\n", node_name);
+		return 0;
+	}
+	np = of_changeset_create_node(ocs, dev->of_node, node_name);
+
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
 static int venus_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -365,6 +396,32 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_runtime_disable;
 
+	if (core->res->dec_nodename || core->res->enc_nodename) {
+		struct of_changeset *ocs;
+
+		ocs = devm_kmalloc(dev, sizeof(*ocs), GFP_KERNEL);
+		if (!ocs) {
+			ret = -ENOMEM;
+			return ret;
+		}
+
+		of_changeset_init(ocs);
+
+		ret = venus_add_video_core(dev, ocs, core->res->dec_nodename, "venus-decoder");
+		if (ret)
+			goto err_runtime_disable;
+
+		ret = venus_add_video_core(dev, ocs, core->res->enc_nodename, "venus-encoder");
+		if (ret)
+			goto err_runtime_disable;
+
+		ret = of_changeset_apply(ocs);
+		if (ret) {
+			dev_err(dev, "applying changeset fail ret %d\n", ret);
+			goto err_runtime_disable;
+		}
+	}
+
 	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 	if (ret)
 		goto err_runtime_disable;
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 27784fd7082c321222b23ca4b2902a04c49e19ca..4ce98a3ef186823a57ac40e2e8e42b08fafed575 100644
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

-- 
2.47.0


