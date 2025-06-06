Return-Path: <linux-media+bounces-34194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B42ACFCBD
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 08:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DB4D3B1067
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 06:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D377250C06;
	Fri,  6 Jun 2025 06:29:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4523D254B1F;
	Fri,  6 Jun 2025 06:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749191352; cv=none; b=oFtERWOUut7nJTPWbGd43xvv1D4XYBIpBaWtYI7PKT+gstR0dIME81W3mejFvcbSMQLdGJyDuBhUTVXSftpyBSIhhyXEZezvQKBTmsNiImXnWedH1LIhUIJIHfifAzaa/SNtvCOulX8IzHD9ihNRCmaUtCShvsnqzSxnLYc9uPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749191352; c=relaxed/simple;
	bh=TmoAbqsQqwSunMhwJnAOWBqRMbYrESws50rgrEbT780=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U0c0NQQ1LN9gVn39q84Jt7rLwFZbmt19cBgY6kn7nLOPK2zQmvfXH7K5XNQSEWNRXFSjMkwxcH9tmgeMtoPxdwjonRRQJI4KaMXKbCwdAhL0HRMvXBgxDVWyOTk6xBSt7lZO/TDBWBq3rtd1rdIPag7OKq8hrQmKak84PbOcPLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad89333d603so313443766b.2;
        Thu, 05 Jun 2025 23:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191348; x=1749796148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJr+6I0y8wgx5+GjQkoroOueGabTjocLtcws9SVOMk8=;
        b=GmCXF3Nvj1oCWrLimwKpjWa8gza5OKKHfmG0pZvriFDwZm5YGbXZK+o49J4+LNtyLZ
         1eBJadME4nWo1Miclzvb0Wtdt+QulYktzU8l8RGx6bzjf9mWQ2LzOsjAxGRSZfW2RP5g
         hYLliwpAwMTrPX2yfsivrGn/S7QqTSdysbhpKICR08wapvkjPTUHxxS0sjmKsOzFTTyH
         ExA5eejWF4J/jNJ+f9O4INVAHMFv8xrHXxWG8RaylB0hLyt21RyV/+U/pO4tkKNsYwgj
         dAtZqnb5XpBjVoU97xuY99JnWQHGsDEN307QqMzuC9YOOJwC5lxxsi1lbwHnePNjluRK
         sIMw==
X-Forwarded-Encrypted: i=1; AJvYcCVDjgi29+6SD4BMWYy2G9usXPYV5gBdq6L1aSrxGz92vGuUf5r3GTQhGRrLuUxy+rtA+3hXajYpNnE=@vger.kernel.org, AJvYcCVRO3j+THHXFVeU3VvlLlCY0a07sF9lBNrb/cE6qrBMvcKVRLrXR3gThY4yqSsRfla7dIzpmmTNqAQfSog=@vger.kernel.org, AJvYcCX5mugL/JiWFPS32lf3YKPhiwnFu8DuPzDcF16f9/pWCvjTQvJP7C++jBmz8JMhRYd+kO4ocx+1qMgRnKi9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbldu92kyFQsPm8MxSalriSaB9imxeH8pYqdWzEXe+OODo9A5J
	hWdKyn/Vd/iyO0cDbKBtCeB4QSCvMa0C61qjGgOI/0aGiq5xtKQbzhtf
X-Gm-Gg: ASbGncscbblmrnvtIZP2wvcwyFwgSCafrgNx7eigvAztlojTw5ObMIFD4ZFBLNqk8Mt
	jgSrUM2t+24JLv4H0rCvuvWAahTnYFRKb2KTA20mDBSIuoWhsRLzesJKv5ZjRIm3Jy7GF7Y3hZV
	FQ3UcJY++uOmpxWnbQeC2zUkHl1ZgozysSKrxM+NVtpNFGpw/NzOUzwZ1VtY/F3V7q1/dw1wYmw
	LXUeR5DGWXKP7YtCxlzaRXxtUnQHQrWAZdIj9qjoqx8gg++uL47+TJZ3Z1Yimoaus1+1rzxfM6c
	iyekP88jSKtrcc1a2iGS9lmD7itJ+qtvCLgir4TK7Qo+BnA/cv3fP1HgFOyKLv9qaYXlxprA153
	xNqLdQCrsKfQjtqiep862
X-Google-Smtp-Source: AGHT+IHnyqurZxzafHeloJvbM/ETAgSyRUe/eH/yNdQk8BARF2W2S6z0ut2EY9GgmVYWL9DWoqgdpw==
X-Received: by 2002:a17:907:9694:b0:ad8:a9fc:8146 with SMTP id a640c23a62f3a-ade1a9e82c8mr145557166b.44.1749191348270;
        Thu, 05 Jun 2025 23:29:08 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 23:29:07 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 06 Jun 2025 08:28:27 +0200
Subject: [PATCH v7 07/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-6-10-rocket-v7-7-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The NPU of the RK3588 has an external supply. This supply also affects
the power domain of the NPU, not just the NPU device nodes themselves.
Since correctly modelled boards will want the power domain to be aware
of the regulator so that it doesn't always have to be on, add a label to
the NPU power domain node so board files can reference it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 1e18ad93ba0ebdad31642b88ff0f90ef4e8dc76f..335b4489691b6299c4fe28342e827f07c920c665 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -837,7 +837,7 @@ power: power-controller {
 			status = "okay";
 
 			/* These power domains are grouped by VD_NPU */
-			power-domain@RK3588_PD_NPU {
+			pd_npu: power-domain@RK3588_PD_NPU {
 				reg = <RK3588_PD_NPU>;
 				#power-domain-cells = <0>;
 				#address-cells = <1>;

-- 
2.49.0


