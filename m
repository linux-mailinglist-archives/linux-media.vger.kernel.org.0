Return-Path: <linux-media+bounces-13045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14525905456
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 15:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AABCB287AB4
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 13:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447EC17FAAB;
	Wed, 12 Jun 2024 13:53:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5136C17F39F;
	Wed, 12 Jun 2024 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718200395; cv=none; b=dQdeKBkNYsZgnAB4yMPnefd3QTvOSQ41GVqoxmB3f8VVKmz8tqv1ic4X8ETFwGaLZN2AicB9fu8BOXk6Rt9vV8KPDKOKCmfEXdqCX8apOtwwtr3E+c5IF+ILYkeslvKqPPXhBD8biwHEVhjFv92/a6KarNKeBUAjp280P6Kx7Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718200395; c=relaxed/simple;
	bh=ETeqjYikvQUmV+JBY0OUQbNcQiW4jGVDEl9xk5l13Cg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dHtZ4KMk6bR6HhgP+7Z6P4liFxWwfGuJFEhJBOcN2U1oFd7uSbpT/VLHEof3V01MmHoWRKvu5056bQvXMhVq8LRQxsHMVtSeVZmU3G6B3xNU0BE3SBQ6KVjzGEkiySooLDo1MLiqCg/C7IwCMUhs8N2JbFhwe2N5m+oTGJJ44+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso6219925e9.0;
        Wed, 12 Jun 2024 06:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718200393; x=1718805193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gvlL/3Hh6Rvkzj8HeRV4KajZ/sjiz7m+L1scRmwe5k=;
        b=rTGMymNtlUuauES3FizoQTNFlFSJ04N7xlxlMB7pmbCAE/Aqyg+/ZI4DOc4se1PRM2
         Pjg+dxd5lwNaj1xt7HsFpj5t+dckdPBet1wi/Fq65A0pNcVDObkj0mgnodFdEWFwtxps
         Liq3ij6DHvN7R/kNkzl29an4grdcUxxljqlQ9AQWQdfECgYSKB/78niSh08hkHe9wcrw
         JQriN4H7UiskxpKQE039vIezllYr9jdjYcBN1pLPJDDwW9j/CuhbHyEqot9+Bb9aoPP3
         wbx/5HXSBEuDEt0XXXUdHdmfQalkEAbF9R3dpFgg3jHVnYoKOdS0gHJpNwLR+P8gD+nm
         2dRA==
X-Forwarded-Encrypted: i=1; AJvYcCUVDio1NDrqchiTojAjHnwit3RsiWrPpILpFaQxKKlIpFB6vfWhECZXNpYBgy3Js6Wxw7Su0jbEuVaOovN6QX8RnLX5b5RmJkWRtiP3qgi1ubAXbmMUSQcwCemNAtYrnDbMcn/TEnR/y0xQxTPdvpex8DJNnw479qdQij7/nvpu0QCxjcyK
X-Gm-Message-State: AOJu0YypMXutyX5LejHrotJwpjSIWbqpcj0M1PbuWWucR0+I0tz2d8FC
	ZpWAfG6H2x0a52KnFTXxn44X+o+xY31iHJesDcYoemjMKY9MfU+4
X-Google-Smtp-Source: AGHT+IE2T90QH80rrQ35HgVVqB20gHNtrUAWASa/gbvajU+K3eKydM1CK3LNiNDzGaMzR19vk4V0bw==
X-Received: by 2002:a05:600c:3b23:b0:421:3249:557e with SMTP id 5b1f17b1804b1-4223c531cf9mr51588135e9.8.1718200392753;
        Wed, 12 Jun 2024 06:53:12 -0700 (PDT)
Received: from ramallet.home (cst-prg-45-36.cust.vodafone.cz. [46.135.45.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422871ec9e6sm28201695e9.38.2024.06.12.06.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 06:53:12 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 12 Jun 2024 15:52:58 +0200
Subject: [PATCH 5/9] arm64: dts: rockchip: Enable the NPU on quartzpro64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-6-10-rocket-v1-5-060e48eea250@tomeuvizoso.net>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
In-Reply-To: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.13.0

Enable the nodes added in a previous commit to the rk3588s device tree.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
index b4f22d95ac0e..9afb7efebace 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
@@ -291,6 +291,14 @@ &gpu {
 	status = "okay";
 };
 
+&rknn {
+	status = "okay";
+};
+
+&rknn_mmu {
+	status = "okay";
+};
+
 &i2c2 {
 	status = "okay";
 

-- 
2.45.2


