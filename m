Return-Path: <linux-media+bounces-11833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E639D8CDA47
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 20:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A3531F22016
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 18:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94EA683CD8;
	Thu, 23 May 2024 18:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWNwGILx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F2D7E586;
	Thu, 23 May 2024 18:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716490601; cv=none; b=OkCL/qtSem9L3T8iZSRfv0jupMw6kek/NtH4IKt+xklsXaSvXyBkyOIER6vdD6RH+dxsqpGyBWMHPX6kvP3/YaanPpuG9u8MELeuYkCJav8v4IXf564IhgKLmm+DdYFRl7MHSYmIHK0kOTSIHkOPNBqrsgJUuCyxmSxrYohBWOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716490601; c=relaxed/simple;
	bh=tI0E7Dp017J/wkhL/fLQZthCDzEc0DhMbGd+Ufabcho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AP7Hmp8G7wi43q7z2x9DRCnPZRVBaVkUDyXatcE8OwT3nNRiijBFQ9bP/qlD1Ju7kzoAw+D670jVlBjR4UDJSQ8pwco5aCKMCey5WghwGfpb8A6vjjDS7+pYF7Fc2xkLfnaJsGd8IB8XuXtonZJCNKCOqjRrVl+RIQSgExiXWMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWNwGILx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42011507a54so14103715e9.0;
        Thu, 23 May 2024 11:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716490598; x=1717095398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vGSPeiqToBwb/4U9wuLT4Lc5GeDuH/YmWaUfRoLwoY=;
        b=ZWNwGILxO+dSqO6hKGGJvyvBQUbJLZ6nE+nfR3P4jHuXty7a90dQY9OZNucX4VPQUH
         abro9ixPauWkucWqSQ6NNN3tT17e2POLTlXdjYvYtfrSjmvspfjAqTfULFUVHSYQpyum
         qMIWkpvFweJxiV5iZ8NbdptzIBUKPStmF5zqSW96vCn392OEzehvP81oQ0qMwAVe+7Nx
         alo60FdWiwVZE7bT+1IW7id9FcwulSHNYkkxPaaHsc+dxoA0PHqGUqP5UAcyVO+G6cVD
         VDk83dgH1FEWr5dMN0CnJHpRCuvVpKRf4lwYGZ1JOG3EzhOQItaMAMHDVyu1Hkto4821
         55OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716490598; x=1717095398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vGSPeiqToBwb/4U9wuLT4Lc5GeDuH/YmWaUfRoLwoY=;
        b=mVgRk040JtJLvrK4fO6Fgou/jRuvnQCCnfcW+AXO/RwJtf9oF+FG2l2DzA6eU0tFvD
         zuK6egwcmYlhe9Og3VfhPB31EqP1hQFGL08bxnFVNiBJXBzH8gsWpxcLJFnYvmGzBd3a
         NfgR3F9ysq4AaqUuUswyBAAieNQXoqJPbqEAV8im8mY2JoQTJvLEshONu+DletnZWp0T
         lnBpFQ3jFWy7Pwwa/6mMK0N+1v1TNXzJPSuKhFppoSI5damk8HG1t/5yDds2ocAQLCgi
         xo5EW0jLlvNcu3GOOYgAK7Sdt8wlAAJGRCNAa2NGPKwgl/IoDLB6RStpRvURJiGlBJBd
         fA9g==
X-Forwarded-Encrypted: i=1; AJvYcCWPWbD0AkBbCPsdvTxMcquzKgSOXz/DL0hptd4co1JW9yjsE5/UiSdm/SYnRyP53lAK9H+zPKquXCAp4YCDBQCYLz/n6yR+gxLYIGu+6V8rEveC4C7e/Q7cWRoXKzqMAR2Sdd4jIG7rTA==
X-Gm-Message-State: AOJu0YwM7gwvFyWp3rdrodw8fNuHCyJD49uWttFtMHEcNsyOyxnPWc2t
	dc7bPbeiS8/2cjOHvscucF2m8XPRzwCALnBbo+HFLmg6mzt6JsQ=
X-Google-Smtp-Source: AGHT+IEUZra0IuLte/TUh4lf+7J7uFOqJNB0+Y3jfsjskFSS7GiJogn1Iw72XUCIBYcdCBior5phsA==
X-Received: by 2002:a05:600c:3150:b0:41b:f24a:b590 with SMTP id 5b1f17b1804b1-421015a62ffmr28810115e9.3.1716490597736;
        Thu, 23 May 2024 11:56:37 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:a453:b45b:e52a:2302])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3550c675581sm3965f8f.13.2024.05.23.11.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 11:56:37 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alex Bee <knaerzche@gmail.com>
Subject: [PATCH 2/3] soc: rockchip: grf: Set RK3128's vpu main clock
Date: Thu, 23 May 2024 20:56:32 +0200
Message-ID: <20240523185633.71355-3-knaerzche@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240523185633.71355-1-knaerzche@gmail.com>
References: <20240523185633.71355-1-knaerzche@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RK3128 has a setting in GRF which selects whether the vpu attached iommu
uses the AXI clock of the decoder (vdpu) or the encoder (vepu). The
default is vepu but some part of the vendor firmware sets it to vdpu.

In order to be independent on whether any of those vendor firmware blobs is
used to boot the SoC reset "vpu main clock" setting to it's default value.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/soc/rockchip/grf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/rockchip/grf.c b/drivers/soc/rockchip/grf.c
index 5fd62046b28a..df64de3d3040 100644
--- a/drivers/soc/rockchip/grf.c
+++ b/drivers/soc/rockchip/grf.c
@@ -41,9 +41,11 @@ static const struct rockchip_grf_info rk3036_grf __initconst = {
 };
 
 #define RK3128_GRF_SOC_CON0		0x140
+#define RK3128_GRF_SOC_CON1		0x144
 
 static const struct rockchip_grf_value rk3128_defaults[] __initconst = {
 	{ "jtag switching", RK3128_GRF_SOC_CON0, HIWORD_UPDATE(0, 1, 8) },
+	{ "vpu main clock", RK3128_GRF_SOC_CON1, HIWORD_UPDATE(0, 1, 10) },
 };
 
 static const struct rockchip_grf_info rk3128_grf __initconst = {
-- 
2.45.0


