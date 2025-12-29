Return-Path: <linux-media+bounces-49632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA23CCE62B0
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 08:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02E0A3008FBC
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 07:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393BD2701B1;
	Mon, 29 Dec 2025 07:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BC1vgVry"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253041A4F3C
	for <linux-media@vger.kernel.org>; Mon, 29 Dec 2025 07:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766994751; cv=none; b=m42keDIdxypIt/LIEOwc9W68p7dMGVXYfKsKQLMpUxxF/0uSS3SMYnVgtisWW8upHQ2Pn6ehvch83qWAEjq0qqvKoA3P69ooYztRropfPU7zK4WFv5cJtDZvPTAtdvsu+zUvE7UsamC8eiHEbHQxJ8hH+K/FBbDZr5SEAs4H1O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766994751; c=relaxed/simple;
	bh=uJDU7774F/XHA0B0XTRONQLG1mBUzool/kLyuvfVWYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gqiVOxZUfQIBt8MItyqzQfF6Ziu1+iqrnX202Zsbdx4pOcgC/dZuAC6b0gZGaxy2yoQB2Fg4cHcLhrUnyV/rprzPxWnj0PniaaqTiHXODbNiUyQOrEPvr1YuWaynTZWOvSeZyswL1kqTfnJQk0tzZMmC6EtXH3/CdE8A3SI+ZtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BC1vgVry; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37fcec29834so74316851fa.0
        for <linux-media@vger.kernel.org>; Sun, 28 Dec 2025 23:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766994748; x=1767599548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9rs18lnfFY/HykoHJUbNuPfbr0n92mG5VNAEHVdWKA=;
        b=BC1vgVryNW8/YK2PLm9waay29X1ECg7IYlH/GftvFDPbXLn1cmUxRxJ5tDBhvLAXD5
         tRbbicNmOd6zHj+c0sIslfaXzZMNNKefNHBljxshAySzl+0127Cv5TC22MC5TYrnUKBy
         NS+aR+U92QGyILOR5eZcJm3fq4efkeUiHKYBccMr8arMzgs+KILIPrUiCSsnlhUn1U0V
         E8knvOpbcEKrySDHcNESvGPSJIBYdVbyyPW5OWyey7A1Zi9XwVwj907+jREdXhklCBLR
         Vg4UfdEUUNDTPBXsk+VmbCuHsg0Az8MBizD24hPUi3W5DQT7TxR0fcV7GDXVU5CkoQz1
         +38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766994748; x=1767599548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W9rs18lnfFY/HykoHJUbNuPfbr0n92mG5VNAEHVdWKA=;
        b=eAjcVuv9N+GG3dqivCtf4yilB9lUrFza/Nqgp2csgWVg9+O6bWVl2pfj9Ru0rZEh8Q
         PgXjr+x7GfCMp+NYnyaTTxg9l70iFg5gQNq3ETFVeODPEekO4jgBQ2C99jHXwusQgcHZ
         cshAXrbl/1qdZCr/dvjRiYuPJddEhEiEVlzO2IvI1zhhJbsfjDYSA9SJ8KXek1c5d9Ll
         8gPd0NUIWbzoUNqkg//0ekSANxxJSMzotPyr51Y1+63L5sO+spf8vsP7gLjZLahTCPC5
         HO8iqLVpDeh/0aTy8Bh5wAJkVQhf/p0Jax675zlJQ0YesKcjvHT/L7HvFRxqfhbwygsX
         tHuw==
X-Forwarded-Encrypted: i=1; AJvYcCWHlT2uTJws0BECF0TDXrLHmdZArCncHJi7T5WzRW/jonWLkww/HqWiBy5QNjarPbVTFVlpZZ/pJQreKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyknrQHMouOtVJL5kz4DVacOIAFfyvTDf/4vTauS9Q0njMiqvjW
	PVUEtG9gt98qnZlKpZcg2Bj3nbgPRoTJNfNutnXUMHgLnsZtX3XS47sR
X-Gm-Gg: AY/fxX7FMmAinQyGirsQ1nD1KP5005a4TbwuXXbl80hlUsEFCMy9yD6jUKG9JNbndvN
	oJlZjsPEMXxsoLDq8L5lOHaObUNYFGIY/YrXbhiYme2wASUvhGxtjKsWBviMzogew5HX90TtKYK
	9QHWwZNhsoNI49zTKiSDDZ672hHnd4KzGL0tnNLmqPgzkN7cEPSdPAhlPYqslNxaUMQh8BWbJfz
	XH7AXwKB1jAt/HZEvM2omMAOpKc1H9dGJ1CNeXHO+6WybzKuYwbEna//umRFl6wVOvWIV7MGDM8
	oouhyVpAGNsSiCfzI/na8IxrPOWpZpx8kexAPuZLYItDPh92xWeleoJOLejTOgIjyrGIZbSGYF3
	+6utJ8S3lx422Py0IYryW4qWlwi9+Zir17gHTLS8uJH55VItdzRyfuNHuOxPwA2rauXrnBc4Ysr
	JctEZpv3WrQzncnwLzQvceneTUzWU=
X-Google-Smtp-Source: AGHT+IFBqmjeNgh+c60lum29DrLVr2dbfNlizQapILb6hM0WEBpPRqHwp9gGkFB2ObIIJ9QEFgNRww==
X-Received: by 2002:a2e:a595:0:b0:37b:9e0b:e0d8 with SMTP id 38308e7fff4ca-3812159c5cemr81261581fa.14.1766994748017;
        Sun, 28 Dec 2025 23:52:28 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.121])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382861ef4ccsm13496141fa.23.2025.12.28.23.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 23:52:27 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: bryan.odonoghue@linaro.org
Cc: alperyasinak1@gmail.com,
	hverkuil@kernel.org,
	jonathan@marek.ca,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	rfoss@kernel.org,
	todor.too@gmail.com,
	vladimir.zapolskiy@linaro.org
Subject: [PATCH v2] media: qcom: camss: vfe: Fix out-of-bounds access in vfe_isr_reg_update()
Date: Mon, 29 Dec 2025 10:52:17 +0300
Message-ID: <20251229075217.24679-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8d260d93-38cc-459d-b8f5-40bec5497277@linaro.org>
References: <8d260d93-38cc-459d-b8f5-40bec5497277@linaro.org>
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

Fix this by using separate loops for output lines and write masters.

Fixes: 4edc8eae715c ("media: camss: Add initial support for VFE hardware version Titan 480")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-480.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 4feea590a47b..d73f733fde04 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -202,11 +202,13 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 		writel_relaxed(status, vfe->base + VFE_BUS_IRQ_CLEAR(0));
 		writel_relaxed(1, vfe->base + VFE_BUS_IRQ_CLEAR_GLOBAL);
 
-		/* Loop through all WMs IRQs */
-		for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++) {
+		for (i = 0; i < MAX_VFE_OUTPUT_LINES; i++) {
 			if (status & BUS_IRQ_MASK_0_RDI_RUP(vfe, i))
 				vfe_isr_reg_update(vfe, i);
+		}
 
+		/* Loop through all WMs IRQs */
+		for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++) {
 			if (status & BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(i)))
 				vfe_buf_done(vfe, i);
 		}
-- 
2.43.0


