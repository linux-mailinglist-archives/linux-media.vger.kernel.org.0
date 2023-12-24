Return-Path: <linux-media+bounces-2983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF4E81DB31
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 16:46:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12E7D1F21829
	for <lists+linux-media@lfdr.de>; Sun, 24 Dec 2023 15:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EE810A15;
	Sun, 24 Dec 2023 15:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WO0jspmp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AFA101C5
	for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a2698cff486so397511266b.0
        for <linux-media@vger.kernel.org>; Sun, 24 Dec 2023 07:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703432677; x=1704037477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1jw5Pl/l7koZ4WxO994EDqCfyQrw/Sp0GtB+qrS8sM=;
        b=WO0jspmpLfxm+jEXSp467n3LbnZfs1OHxM6X4Q6Ut5KjmEQE96WNgX8I26RiNxT9z5
         R9f7rcjdhaI26bMV7uNilYgXYYxixVA0EDZmpz55cn/PPa1zEjPt9394G35wvoeb1Uqv
         1lFvZe4fF+tqZDygZlBHgAD7WSa8U/BVw82tBOjeyutdKIfdVWr8ZpOeVzKtO91po32R
         fthuLMrfjNmmmOg3V3rnL6LOf5o8t1X9C0YMRT2RS7ntyblaYWwwkI0t95GO8CMsihMc
         e9WdRgZzgsFartNQX8LPuTw7LRc+eGFbzkADOoovfFMG6cHJvkPNAFISEZCfJUsA9InL
         vtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703432677; x=1704037477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1jw5Pl/l7koZ4WxO994EDqCfyQrw/Sp0GtB+qrS8sM=;
        b=U1rvNDwjJrPk3btuufL1OXrLLAafEV9AxdxPPkCCVqGm5bH/kXlfjp6EchgFywZi1u
         13RBFQWKOOXgZu+rSaMts1kvEta09tJqvxL/el4ctVgU052vUJyNaTrE+nKuYdsC/nYj
         IU1Aa1ulAkxcV7opI//GdpJEDGhTW2ONRXAbaOWceyiHO+kto+8B1fWI5ScbPvabYC5G
         Pj0tULetjDnRpeziXbmF5DxeqNIelRmAnLPGRQHlrTa55/i5GGUYeAK8IEc0FyRO6A2M
         0GI1k8+6V5aivz8pVLJHFYF+b7gN6NmLjUEBcxz8QvDI3918UBbx5zXwh0ChMigNAaiy
         W4Wg==
X-Gm-Message-State: AOJu0Yz+2LTdbU904Wdalr0aNbL0MKVI/f1mGP+xFBjqrYlsbPotdFQo
	sx1r8DcAmgm4t493K6oPaXbXSaRrV5wOnA==
X-Google-Smtp-Source: AGHT+IGEZuRTW9lR28kyRWxFyvxDVysVplZ4MC3jv1gqpwB+nQ5N4lvYN4ureL64S8WJoFh2wnm0cg==
X-Received: by 2002:a17:906:704:b0:a23:7175:30b4 with SMTP id y4-20020a170906070400b00a23717530b4mr1066672ejb.99.1703432677136;
        Sun, 24 Dec 2023 07:44:37 -0800 (PST)
Received: from [127.0.1.1] ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id ge12-20020a170907908c00b00a26ac403032sm3325901ejb.65.2023.12.24.07.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 07:44:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 24 Dec 2023 16:44:05 +0100
Subject: [PATCH 06/15] media: s5p-mfc: constify s5p_mfc_variant structures
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231224-n-s5p-mfc-const-v1-6-a3b246470fe4@linaro.org>
References: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
In-Reply-To: <20231224-n-s5p-mfc-const-v1-0-a3b246470fe4@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Aakarsh Jain <aakarsh.jain@samsung.com>, linux-fsd@tesla.coma, 
 linux-samsung-soc@vger.kernel.org, 
 Smitha T Murthy <smithatmurthy@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2821;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VD48s/FZBGnruY4hNL+cZT1tYdqrtcBQSYEZMzctcmA=;
 b=owEBfgKB/ZANAwAKAcE3ZuaGi4PXAcsmYgBliFHTpKrlORLm6EMBe/5Niv6kNveFGfvGQVija
 oIoiG3SlTSJAkQEAAEKAC4WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZYhR0xAca3J6a0BrZXJu
 ZWwub3JnAAoJEME3ZuaGi4PXqQoQAINBCZEQEkwebideTGctzDGqaI0X/nEm94f2eYrj2ZMHOKw
 Nm+IkB2SIMPr8GLFBXgAsNA3bGe2uxkrp6yxcZY8xGadPODmLJzcDJwlrJhSC0Br3rDk1X+BOd0
 srAugnCJZF7WtoQY23TGJKebKDQF/AKWLtKGFCNuXyDvQRL9Ortqi2EjCsnjKHRHxAd0HcAo1V+
 Wdzcjv+94JITLoJqI+OD5HisRDvtrprzp5EJfZslyKugnCjBGQmqhG3H+qVLMGiq3gQamrVWgXd
 ygKAdd2+L+IHZpyf7EAdtxp+pjq3YqMW8++KMjqzwmbaW1lLUiz/84QC+zxTI8GIomF6SOUWzqR
 UVFU+EedkeTszKxWpEXmPZ3WWP+/c3CaxTHPODI9M+MY3HO2CnpjbFLIZWZIWfnUS688WS/3vZ1
 jvvma+Exnwi1jrNznhuBLDVPJj1fRmNMhjQjbqXzyrR08PKNNpAkFagTHxxSAdJ81yOyq6HUbFB
 h6crBEuA2wtSS0zfZKHD9v5I0c4LAMRXuk5dAW73q0jHyYM16G+CtZMwjop/2ZF6+IBCJD6yUiq
 +hP9f2ZTbDUbQqdmueVl7d47ouXuYRCP98ZBftK5tUrxqDJydlWGorYqeDgOT0dfK7lw/4gNOdH
 uTAlmZuEH0AVv4rWC3A23PcvwNP4SVrHFyQBk
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Static "s5p_mfc_variant" structures are not modified by the driver, so
they can be made const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index 6af7b812c5df..5d10c1cb8b92 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -1529,7 +1529,7 @@ static const struct s5p_mfc_buf_size buf_size_v5 = {
 	.priv	= &mfc_buf_size_v5,
 };
 
-static struct s5p_mfc_variant mfc_drvdata_v5 = {
+static const struct s5p_mfc_variant mfc_drvdata_v5 = {
 	.version	= MFC_VERSION,
 	.version_bit	= MFC_V5_BIT,
 	.port_num	= MFC_NUM_PORTS,
@@ -1554,7 +1554,7 @@ static const struct s5p_mfc_buf_size buf_size_v6 = {
 	.priv	= &mfc_buf_size_v6,
 };
 
-static struct s5p_mfc_variant mfc_drvdata_v6 = {
+static const struct s5p_mfc_variant mfc_drvdata_v6 = {
 	.version	= MFC_VERSION_V6,
 	.version_bit	= MFC_V6_BIT,
 	.port_num	= MFC_NUM_PORTS_V6,
@@ -1583,7 +1583,7 @@ static const struct s5p_mfc_buf_size buf_size_v7 = {
 	.priv	= &mfc_buf_size_v7,
 };
 
-static struct s5p_mfc_variant mfc_drvdata_v7 = {
+static const struct s5p_mfc_variant mfc_drvdata_v7 = {
 	.version	= MFC_VERSION_V7,
 	.version_bit	= MFC_V7_BIT,
 	.port_num	= MFC_NUM_PORTS_V7,
@@ -1593,7 +1593,7 @@ static struct s5p_mfc_variant mfc_drvdata_v7 = {
 	.num_clocks	= 1,
 };
 
-static struct s5p_mfc_variant mfc_drvdata_v7_3250 = {
+static const struct s5p_mfc_variant mfc_drvdata_v7_3250 = {
 	.version        = MFC_VERSION_V7,
 	.version_bit    = MFC_V7_BIT,
 	.port_num       = MFC_NUM_PORTS_V7,
@@ -1617,7 +1617,7 @@ static const struct s5p_mfc_buf_size buf_size_v8 = {
 	.priv	= &mfc_buf_size_v8,
 };
 
-static struct s5p_mfc_variant mfc_drvdata_v8 = {
+static const struct s5p_mfc_variant mfc_drvdata_v8 = {
 	.version	= MFC_VERSION_V8,
 	.version_bit	= MFC_V8_BIT,
 	.port_num	= MFC_NUM_PORTS_V8,
@@ -1627,7 +1627,7 @@ static struct s5p_mfc_variant mfc_drvdata_v8 = {
 	.num_clocks	= 1,
 };
 
-static struct s5p_mfc_variant mfc_drvdata_v8_5433 = {
+static const struct s5p_mfc_variant mfc_drvdata_v8_5433 = {
 	.version	= MFC_VERSION_V8,
 	.version_bit	= MFC_V8_BIT,
 	.port_num	= MFC_NUM_PORTS_V8,
@@ -1652,7 +1652,7 @@ static const struct s5p_mfc_buf_size buf_size_v10 = {
 	.priv   = &mfc_buf_size_v10,
 };
 
-static struct s5p_mfc_variant mfc_drvdata_v10 = {
+static const struct s5p_mfc_variant mfc_drvdata_v10 = {
 	.version        = MFC_VERSION_V10,
 	.version_bit    = MFC_V10_BIT,
 	.port_num       = MFC_NUM_PORTS_V10,

-- 
2.34.1


