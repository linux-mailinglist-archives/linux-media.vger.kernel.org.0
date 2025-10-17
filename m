Return-Path: <linux-media+bounces-44782-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04538BE6316
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 05:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5473219A6CE4
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 03:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B8325A320;
	Fri, 17 Oct 2025 03:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XNv8Kt4Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C162494FE
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 03:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760670711; cv=none; b=WI9yoB6PmQtUFqdeqB/2HCUA8i3Q/ZKycLBQ2onRnjR8BUmVCTdug5IVIxF3onX5KzXUxpbjbga6UFE1AmW+BUo2ARmfOyUOqeAgRKtsSyg3vygKbKQcrc+3tI/GcsFX12M+Hybw833nNKn6+MT9QK4T2ChbMW31RNBlBZPESKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760670711; c=relaxed/simple;
	bh=YUDMHULVUsOxFib7C6LTLIogpVOHt02lg6ulsXG2Qng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AmqLPhWMpMy2EqLdGc3pNFA6y+HKaBoux7ZTmM2qxNOjPfGxXrUJc6XJvuCDIsEkFG1Mszzdl8QX8eaF4e7RpnyURL2adJiFBnBUQ0Wfw5eEC00VUCTX/pzjsoDyrKpdEGhCjMRH18nLGmvoao8/PvNI5ixDbxQSFwDfHcc3Wm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XNv8Kt4Q; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-591b99cb0c4so225853e87.2
        for <linux-media@vger.kernel.org>; Thu, 16 Oct 2025 20:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760670707; x=1761275507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5gXLrtQdT0lhUXSBK7BJhBhznyBhJxh9ehLZNa6wU0=;
        b=XNv8Kt4QPP80Lf/n0GOy4okVBiHEpiiDYH8/BCkIMrG7N1baY7Wd+VtxpiNECgRTYD
         MiSbUz2w6Lx+j9Eh4/K9oeuzIUfzYrPa+i+Vzg1cqEBOO1ojwkdMpkHl+qQcjowgg1sX
         tc2CwFYuLf8xPb1qYB/6S3+DrQbXOZ8x96+BwthXXqFKAtnjZKbLDRHSUFksTsUVdWGA
         Cv4PHMHHlLJ7pigQt5nG5r46EtVZUoq2aIQ7SEf0YjS+Kp4e795R2U6DqbOJ3HvoPu1p
         TuPVWIJpt4C1ZGonJrzTliudiFqmtoDxWdGl+lklFI5w9MHzngaeN3B0GOifB8ZDJpk8
         Ei4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760670707; x=1761275507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5gXLrtQdT0lhUXSBK7BJhBhznyBhJxh9ehLZNa6wU0=;
        b=Sf5nIDFyHVVIgMCees+6F2j/33JWf3QADbvD1M0Tef5ehtPGfBRIiZwfG8dCIRTy1e
         gxarno7YrO1BFdJUkF9vCXzyerVeOAn1QVNYRhkiEA/GC4gvA2+AcwZ8xkNQbLwQypms
         yMPKs1P94zGXZlKsG2TTocJXAwzkj9KitOsVC51gpDM9VY+swxGkBFfNmsLFMBiD0fHj
         MLw948D/L1KKjfvkS8xKbT3xLKRkWRbX7unED0EqdqLfcjCEauUIRdESPyIk6PmEVC3i
         j5VFP2+XNBj2Y3Cx6L3NUQo0qODhhc1r7Uyw8hcwecO4e2l5klV8s2l4zJPgQrY6tQfH
         Ay6w==
X-Forwarded-Encrypted: i=1; AJvYcCX2NsjRWJo2inqxLhvlGrJARtKNY/LjH48JuCX1q+WfVUrgP8XjdDFfOfaFMAdgeTGL7e+qqB2xFt7/Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJFEzsUbbvwQqO2D9InwG+wj36aXXo+mYIOvWGbFHImHwvErtK
	VUp5ukE80TLFz+stOTc9TnhPsO6K/uaAn+urITGBkdPV3FSGBrXu9ePuMybZqafVvRo=
X-Gm-Gg: ASbGnctKh2bSeqvgB6/2AVbRLJQF64g5GxN8DBpdNiODi3OTHMM1Cm6hmq3J6/Rfi/O
	eRL3thwuU0bvYqdF5saG6JUxqcist/QsV9KMAjPXed6IfLRiQVXKBaUr6sG9lxhCoeQJvjoucKh
	w2iZoQoPXjFkA8/uMN16sAP+B7VDZ/rihVuhwzpJKY3N2AFi+Sf0rmxT7/A5yuRMBRHmA5n3vlC
	7YbcRYCDw8NCwccAX01km8tv4l8VhEwkUlEuRrrTicTSRUrO7uG15lbPmWREVQEV0rqrRQcemyg
	oDPVt51uBkvWvMQDFjLzzu5/PWxUQ2r3ee2LX0fuw2DvQxbedFYFO4Fw6CbibWfCS7x/bgrnvhZ
	iG9D6H1CAZTnfGby4py0dGpouk1UFxMAWLDDlKGKeKlXs1DBN3YchpQPYfgL1k330o1kGNP0s6S
	6Y4kv3tBfrHfYvq6vAN3aF+6egOUDV34zQCGwCwnhdZz6EA9BqfUq50Q==
X-Google-Smtp-Source: AGHT+IFb3VJnFO2Abw5KoDKRn/BNtJbyNq2liVh2u9hmz6Mfh6gKlPgWomiBROKBpZufK/RmwgpdkA==
X-Received: by 2002:a05:6512:6181:b0:591:c553:e0a2 with SMTP id 2adb3069b0e04-591d850a656mr439950e87.1.1760670707194;
        Thu, 16 Oct 2025 20:11:47 -0700 (PDT)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563844sm7496077e87.69.2025.10.16.20.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 20:11:45 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 3/4] media: qcom: camss: Add CSIPHY 2.2.0 lane configuration for SM8650
Date: Fri, 17 Oct 2025 06:11:30 +0300
Message-ID: <20251017031131.2232687-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251017031131.2232687-1-vladimir.zapolskiy@linaro.org>
References: <20251017031131.2232687-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a configuration for all CSI lanes into D-PHY bus mode on Qualcomm
SM8650 CAMSS CSIPHY IPs.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index a229ba04b158..619abbf60781 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -587,6 +587,102 @@ csiphy_lane_regs lane_regs_sm8550[] = {
 	{0x0C64, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* GEN2 2.2.0 2PH 4 lane DPHY mode */
+static const struct
+csiphy_lane_regs lane_regs_sm8650[] = {
+	{0x0e94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0ea0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0e90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0e98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0e94, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
+	{0x0e30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0e28, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0e00, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0e0c, 0xff, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0e38, 0x1f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0e2c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0e34, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0e1c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0e14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0e3c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0e04, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0e20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0e08, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0e10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0094, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x00a0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0090, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0098, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0094, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
+	{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x8e, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0xfe, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x003c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0494, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x04a0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0490, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0498, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0494, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
+	{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0x8e, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0xfe, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x043c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0894, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x08a0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0890, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0898, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0894, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
+	{0x0830, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0800, 0x8e, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0838, 0xfe, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x082c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0834, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x081c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0814, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x083c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0804, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0820, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0808, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0810, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0c94, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0ca0, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c90, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c98, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c94, 0x07, 0xd1, CSIPHY_DEFAULT_PARAMS},
+	{0x0c30, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c00, 0x8e, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c38, 0xfe, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c2c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c34, 0x0f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c1c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c14, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c3c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c04, 0x0c, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c20, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0c08, 0x19, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0c10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
 /* 4nm 2PH v 2.1.2 2p5Gbps 4 lane DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_x1e80100[] = {
@@ -914,6 +1010,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_8300:
 	case CAMSS_845:
 	case CAMSS_8550:
+	case CAMSS_8650:
 	case CAMSS_8775P:
 	case CAMSS_X1E80100:
 		ret = true;
@@ -1018,6 +1115,11 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
 		regs->offset = 0x1000;
 		break;
+	case CAMSS_8650:
+		regs->lane_regs = &lane_regs_sm8650[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
+		regs->offset = 0x1000;
+		break;
 	case CAMSS_8300:
 	case CAMSS_8775P:
 		regs->lane_regs = &lane_regs_sa8775p[0];
-- 
2.49.0


