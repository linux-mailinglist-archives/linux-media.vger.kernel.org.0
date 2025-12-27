Return-Path: <linux-media+bounces-49585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5ABCDF7DC
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 11:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98285300EE7E
	for <lists+linux-media@lfdr.de>; Sat, 27 Dec 2025 10:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CE1274B53;
	Sat, 27 Dec 2025 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVXl27R/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC4F23D7D4
	for <linux-media@vger.kernel.org>; Sat, 27 Dec 2025 10:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766831324; cv=none; b=j0Z7bluU6CCpMk6q4zklQ+SQHZiIXKWZpTdL7DaLi/FlihAvtvXiGzygXJ1fSIMEXA98Ok5IPj9iFhJUMrHYgrGe6k2sQdL9k33SuCQuloq/t4MtyiRvjvd7Kdpr5YzWkpbkLUrjftpas6l+vYGU8ZCgfFCxGMHbcDGo2j0adnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766831324; c=relaxed/simple;
	bh=7ifwGnwU2gSMG4rlAGg9IHam02eL0qNZQeZmcuAb10A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B0jM02QhzKQg9Q+GFy3mL4GmtPoUCUFMN0gfmHHkyCyAi3p8NP+iVa9jAT3JS1lYOCrrVrt/autegzEq1v7pt5ed+J3v/lrCWkFljHEqHdAUAwcznBEWgJ5yzdbNTuX4tFhQwezXQkcOPE5cEGALoT8mI/s5Ldq65FjfA9F+gZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVXl27R/; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59911cb8c3cso8617353e87.2
        for <linux-media@vger.kernel.org>; Sat, 27 Dec 2025 02:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766831321; x=1767436121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dyV3/IfGZSZhz5jBAppPai6Eu+WvUPDRdhge/3Q6vjo=;
        b=NVXl27R/inmgaXapaDqKU5H1P0FV30pOP9pBvSNUU4FiKLuPeTUwsve9kdk/B987Sa
         TQdi8NgexOawYNtyV9SNVHAYT0aiVga27AcBJZZxwndinmhslZtk8EOp6CrSuoItsjq1
         8cm/LiC4O6gXQcsyalj94r1Zz7vKUQb44ov3rCWUHEdvdxpPf4Xuf/IurOiiPwNdrM/3
         zANeLdukFXwnYLBEFSkqpvIiA3eEKd33ZfOlzEDtmo2d/5VK9CaK1AVkWo6YI5J73BK2
         on1cnhrzVaGsPZAObOfia8PLgD0AI1UlOcebPqGpXLV/LkFH4GGKzJ+xYPKVARWfl7pz
         9fiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766831321; x=1767436121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyV3/IfGZSZhz5jBAppPai6Eu+WvUPDRdhge/3Q6vjo=;
        b=IcnmRh5P9dByyMDavLRZ0s2HpZUiNYEVouaSwi1EVkOygHFlKoR59M0HjsOk9+HpdV
         zmsBr7c179VIbvfx/114t/sfXK/6Jho9gmJxFCUlHaG1wfjBoPHevMZChUQt+GH0I6po
         9jIj9XdnTOozu/SzaOuipVUNTroUyliTul3WNPMp8+PMQjri9WPbSBCPOUlYsZUp1fHH
         5LtZHqk8JuRdSWNQ86jTTF8DlW03UIuFGjSF7tAnV4kaWaR1ck0nY2BIJr04iYTy/5/U
         IEjUIorrUmXBBg57gCUTltgN2pvdjDgcDHkR/Dqzo4qcHY9bEw0a04NfD0/DNFItL6RF
         2dRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuEAVXHbKdH97l4AaheD6NyvQHwbRPUyobPwM0ONGTSQFktmIDfmfi83UXNov67y+/7BTZ9n6a4zUzTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxyRf3uqCS/v6EVHmcyiJC1rySEQ7oaFBxyoyjB236U+m0nhVC
	nBLFwUje1iKKBBCLaT7VwltnBFsYdL3UTjnVNXU8T3RSStcQ0Mb7ak3h
X-Gm-Gg: AY/fxX7GJg69+O3S6Kkbof03CIZjs/MR0LA7HO8ixsHpiXDMNg+xu/Dk9SsiIiqMFTl
	OcViC5VKrlnFjvXHOkXnsd1FdSZyKFmlRS05v2dotNWjI+DhvwRGlHZ+46bpiJtYYCZ4exiFdNZ
	j52K3jt9NYCI77F0HZDkZN2x45+SrVzAi6mlzJ2CN6XerbWZkUXbE+Eok1z0hFKkDQI1xGuAPeA
	2mkdNdOVOJRutEsdNHcMm29nRihGr2GvQEp3jIlo7zyYRE6WvRl7p4k5d9lIht0s+Vo8oygaqvB
	JTgnJo4lW36naGykjz0moVIUWyLg/KHB3QI9VPVvkFr4FIsLmJWmoQjcpMK3YmX7NSn4QUa6aKh
	diRuX/Gpqnr/xY+Ej/dSdDixzptErPeRDiV+F83nrbtTNDg7M9TgXCA6zVreFQtc1rtfziVW52F
	2xHfj7V4bUF+LR6oj2fl5SkXMpnEg=
X-Google-Smtp-Source: AGHT+IE90WFoUZjrTLGRhe0P8f2Vkr/jZhcbkZMYy7AeoSZMCzqYFaNAxbgBLHqiUPw8Nc2EhLIzFA==
X-Received: by 2002:a05:6512:3b0a:b0:591:ec0f:fa92 with SMTP id 2adb3069b0e04-59a17d18184mr9594424e87.3.1766831320381;
        Sat, 27 Dec 2025 02:28:40 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.121])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b2958aae1sm3054055e87.41.2025.12.27.02.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 02:28:38 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: hverkuil@kernel.org,
	mchehab@kernel.org
Cc: Alper Ak <alperyasinak1@gmail.com>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: qcom: camss: vfe: Fix out-of-bounds access in vfe_isr_reg_update()
Date: Sat, 27 Dec 2025 13:24:41 +0300
Message-ID: <20251227102442.44989-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vfe_isr() iterates using MSM_VFE_IMAGE_MASTERS_NUM(7) as the loop
bound and passes the index to vfe_isr_reg_update(). However,
vfe->line[] array is defined with VFE_LINE_NUM_MAX(4):

    struct vfe_line line[VFE_LINE_NUM_MAX];

When index is 4, 5, 6, the access to vfe->line[line_id] exceeds
the array bounds and resulting in out-of-bounds memory access.

Add a bounds check to ensure line_id is within valid range before
accessing the array.

Fixes: 4edc8eae715c ("media: camss: Add initial support for VFE hardware version Titan 480")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-480.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 4feea590a47b..fac111135c78 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -237,6 +237,9 @@ static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
 	struct vfe_output *output;
 	unsigned long flags;
 
+	if (line_id >= VFE_LINE_NUM_MAX)
+		return;
+
 	spin_lock_irqsave(&vfe->output_lock, flags);
 	vfe_reg_update_clear(vfe, line_id);
 
-- 
2.43.0


