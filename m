Return-Path: <linux-media+bounces-40453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB13B2E14A
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 17:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F31FAA2AD8
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 15:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8184322A3C;
	Wed, 20 Aug 2025 15:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rAmeFBig"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2A1322A1B
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 15:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755703013; cv=none; b=oGGxZ5Wb7HUAGXTS6WuEjSbgelg19aMdT8mzMPlDRAG7yY4As0HEYmEbKbCwWTGNOHx6I18dCRbNABP2IFqDAu1hkKs+MYjQrl7/mPEo0MQha2r1+ZpcWeLPYRcEpS3WxzduUztTL5DJ3TgcHH8KmsSVZFxL1Znt1UkLCfnq034=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755703013; c=relaxed/simple;
	bh=VjOmDxlM9r0Y6X4IU3of2mGjZhM94NUpcZEcYyk0u4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UGrD8kMcFp1gGyRLibxmEPz3pL5GKbJaPRQBC9YrzsqaI8bzL0TLb2kziJx5Nm3gLWI0IxFU9l8nsQVoE5lO2RbW/+ZTQO5lGPjqHNprzeuml5TaNb4QhPil1G/AEj+gwEqlirNR5VbMv579oUTXJRYkwibmK9cZNTIzFXUoNEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rAmeFBig; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b0b2d21so34851895e9.2
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 08:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755703009; x=1756307809; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IxdnfGgNmB1UdOb/2h1cFQtiPBBv3GhVp3aMiI+P4k8=;
        b=rAmeFBigGkL8vHCofymweGuvT+NNel7pnE5dkar0TGQnVg4C2dsX5lewogMAOPvjB1
         1XeZucGiJEVSbMpYWdhKFUNgENwmvJtELmxebTMmeq52NUd1GCuzow++U9A12gjVS8GI
         RiVberpFdcm3PO020bxXTrX5wYVYN0deLVaWIhK0QG/nD7g3w5Cc3MB6TR8bK6rpP89g
         ulVWXaqh3BzFnU0K2amQuav09SE5k+sbDTBxfH/dT6Ud6coknXQL91Dt6+0sBtAocgeM
         qTdn/mWqluLUXerFCUVBWF4CdyMA1T/HTrnoEC/NW4KdQlbegHlC39poulPTrdpR6Nq5
         uUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755703009; x=1756307809;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxdnfGgNmB1UdOb/2h1cFQtiPBBv3GhVp3aMiI+P4k8=;
        b=qq4oOxFyFYThKqajwiC8aJu9vi5MZpQ70D0oElzP2nvbixPUpbsSRkdPjEK4+/inBB
         iX0rwDovyycVkGoWL0U45vuhZCVr9RgeXmCBPa64gIguYtQfMr9c+cE34klgAYV2XgrC
         BroWISKe1nkK9daS1UAE4j7CWOLTFsG0NQbhRu6xGcXVQyQvhVceRjAUq9lAge7t8FmW
         qkolVrG+hywCwTZdG338yTgFNYldkAC5h3zcyXGb+R3NgpImh3PSoH25F8yUp+jofo8R
         ti4vrR7i9a9UJnH8Oj7eZlsUOvawbJFG357MjNvwmL92lAf22P6FebRsMd3GpTvFi9yy
         6K8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdBo65ombJARbkDJpWsW7A5l6fqZ+j4v38cvaImBMbsHMLU4/Lb+obI33NGBtq35txJEtGMya5y/WgCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/zTWEkZ+87IiNSWykd1djMoqltmdEh7rNGHddPCZnwMtnY/Fb
	h0uK1V0arRGrH7Vw8iTBCxQUyhtjoSKIxHU9iCc7iHNGdwzzTu3NtnhlvXSKnpB6Pco=
X-Gm-Gg: ASbGncupESyWIUTgLfc5LK3C1BmKcgw8Pxy6FsiGhmlJS46zxU2VtbMdTYJPchwWd0z
	eft5hN0xElUIEeH2jRtAGhg4IvN73RqHvTAs2H8tHqMKtyI4M8mjZU5RYP60WniCqqut1qOA/CG
	5/JJRPegn8VQ0nkHPDeJVkyL7M4VSKNR+eneaeVfny3UswlbMgD4vVp7NnsTvevmzmrjgUxk7Xy
	A5sMsp7qNv+gWx4agSx7QMixIVFEnU0gHUVroIsPD1W29zNA8Hf9O21CIjNxd6O8gA0BdZJKN7p
	lSabZcj6c/8WOsDBW3+zmOMlX3GCeGbqa1Jnhv2Gl/i5sYTU/CHao9d8L3Z9C+HnPzM5wfuBDRa
	6ULVT8DJLYF8sSYr+i5MACZR4T8CMOdEWYDwp
X-Google-Smtp-Source: AGHT+IHdC6Kupzga2JlY9sSe8Fe3nGx/liiHMx6CxPwughaFpp+PojchSdWmF9yi6UA4bt62PUy9/g==
X-Received: by 2002:a05:600c:4705:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-45b47d90d97mr19274705e9.1.1755703009449;
        Wed, 20 Aug 2025 08:16:49 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:f5f2:96b:fcb7:af4b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c310efsm39758195e9.7.2025.08.20.08.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:16:49 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 20 Aug 2025 17:16:39 +0200
Subject: [PATCH] media: venus: firmware: Use correct reset sequence for
 IRIS2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-venus-iris2-no-tz-v1-1-9ebcc343195a@linaro.org>
X-B4-Tracking: v=1; b=H4sIANbmpWgC/x3MQQ5AMBBA0avIrE1SpQmuIhbUlNmUdGhE4+4ay
 7f4P4FQYBLoiwSBIgvvPqMqC7Db5FdCXrJBK21UWxmM5C9BDiwa/Y7ng66bjXZ1bZtFQe6OQI7
 v/zmM7/sBQwLpWWMAAAA=
X-Change-ID: 20250815-venus-iris2-no-tz-f9b52f33c4d0
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

When starting venus with the "no_tz" code path, IRIS2 needs the same
boot/reset sequence as IRIS2_1. This is because most of the registers were
moved to the "wrapper_tz_base", which is already defined for both IRIS2 and
IRIS2_1 inside core.c. Add IRIS2 to the checks inside firmware.c as well to
make sure that it uses the correct reset sequence.

Both IRIS and IRIS2_1 are HFI v6 variants, so the correct sequence was used
before commit c38610f8981e ("media: venus: firmware: Sanitize
per-VPU-version").

Fixes: c38610f8981e ("media: venus: firmware: Sanitize per-VPU-version")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/media/platform/qcom/venus/firmware.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 66a18830e66dac2acbe11751a8c250876e20d795..4e2636b0536693a86dc51503d01dc2bca40b532a 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -30,7 +30,7 @@ static void venus_reset_cpu(struct venus_core *core)
 	u32 fw_size = core->fw.mapped_mem_size;
 	void __iomem *wrapper_base;
 
-	if (IS_IRIS2_1(core))
+	if (IS_IRIS2(core) || IS_IRIS2_1(core))
 		wrapper_base = core->wrapper_tz_base;
 	else
 		wrapper_base = core->wrapper_base;
@@ -42,7 +42,7 @@ static void venus_reset_cpu(struct venus_core *core)
 	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
 	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
 
-	if (IS_IRIS2_1(core)) {
+	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
 		/* Bring XTSS out of reset */
 		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
 	} else {
@@ -68,7 +68,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
 	if (resume) {
 		venus_reset_cpu(core);
 	} else {
-		if (IS_IRIS2_1(core))
+		if (IS_IRIS2(core) || IS_IRIS2_1(core))
 			writel(WRAPPER_XTSS_SW_RESET_BIT,
 			       core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
 		else
@@ -181,7 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
 	void __iomem *wrapper_base = core->wrapper_base;
 	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
 
-	if (IS_IRIS2_1(core)) {
+	if (IS_IRIS2(core) || IS_IRIS2_1(core)) {
 		/* Assert the reset to XTSS */
 		reg = readl(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
 		reg |= WRAPPER_XTSS_SW_RESET_BIT;

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250815-venus-iris2-no-tz-f9b52f33c4d0

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


