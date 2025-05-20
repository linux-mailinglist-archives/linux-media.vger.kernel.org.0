Return-Path: <linux-media+bounces-32910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FA2ABD4CF
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 12:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D3507A9A55
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD252701D4;
	Tue, 20 May 2025 10:27:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF3F26FDA1;
	Tue, 20 May 2025 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736865; cv=none; b=KexSUB/AwXJ+0VIta/7fBj2C9qc6odqk34pSU3yvyCxPs/Uw+p0jgHyAevq2U2CRwrAOxliVwHlc2jBZhFdESqQAuAYg+It7tMN0aixhHrIghdPC9wkQjTkNCeAPsmizvVoDrcqofN8FQHXBUJaUoaeJ7E46QMVSGgYw2CBRzmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736865; c=relaxed/simple;
	bh=EarcetOghNjOL95ZSELTWeu9KU3GK/KWmT1wlFXLQds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e0VIwrq9Bg+iGQ76NFma8BhIKykwuhMPAMoTPk97mrIG+OKKHrStgD8A0Cc+FSWIjfnjQJvbPOZHqr4FEee7x3+hfbiJLTmmFWR/7EKBI6BhrVALDePy6h0PMbgWnPkcJUd3WucJ81R7HUer98ddq6OMSw90BMbZ+yv4N5YVksM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442ea95f738so44516265e9.3;
        Tue, 20 May 2025 03:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747736862; x=1748341662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3P/6sXdHxvAwZQAHntU3mNeria1ZXDx/pMQJAoXfL1Y=;
        b=dNzbuM5K4cO26wHiMwAsuz35bBspzWYR7RHn9dbTyREdfCGbCAAUa4Dn18YrI6yNxu
         /SymRbNhitTopHHEmBJFECoGe8kWvdLltB3NBh/Wq3zXbISh9vCLt+GCj8VXxRheC1v2
         K+sdDWxlsUw1P/oM2pHVxHeJSPWL5KwowNkn/P9jL4DG032WLppyNV2HW/P6OKOo/CGj
         eu7VywdxS9LqxKT8BLMU9NiqlwXcdLFRAeSRxJkkN8qp8eY7N6HOlfO4sgUJLb7CtDdq
         Rrv7DBuq4mjqBZHOV9qe7HfrGoCJ0VzTDobOAVNlwykfF6qlLEDcJcbDljzlPB6A2gA8
         y5hw==
X-Forwarded-Encrypted: i=1; AJvYcCV5TV6QLAgIUwQa02h5hiiLFFbLdzJ21Zh3dwdOS+TSvCs3wNOMZd3ytd0Sh/lGNvBByErAT3ZlfbZvSLY3@vger.kernel.org, AJvYcCVMw5JerWAr/2f1Xa+KYBsYBDvtUtVoe755HFZpQLbT2/+b8x39qyatwpNXNiDkgnvPeKVYI5J9Kqk=@vger.kernel.org, AJvYcCWc4hNLb9T9A7EbXC3Ez6l87fd7sXCryDI3M4566ctRNEJTBjNL+HxxQiA/vFtIoWd9qQz9VN1d8jay1DI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxhXxEGIPeJAWvzG/v4tMYuRwjOAfzkL2LlQbBhqjmMIjiJsB4
	VUfCmrAE1cQUW4TYGrErDZgQZUsE/1Y4dsp5gcXAVryo1GET8hFnTBZTYLlbuB18
X-Gm-Gg: ASbGncuSTfQCs/dltLvHCWscpbARsdyRXyWWUrxFof6BcTRT6iJI9taZG8xtxsCgDqm
	0ZpCPy9OmhkCIDE20Z5GQNbGsr98L4yJs3EstaRawBW8JtifMH/tES3FO1KfmXcdWOquBhRlzAT
	9t5GcyuoHIDx2Noha8BrkkUbQswzWmtjLVgWKpYcOtGXXyH+GIifCIA6AidRHm5mvKyRkuCRbDN
	tXvZya3ZCB3jKpl9SvpDF/vpFnbdGTKnaotY8cX+tKpfVAEcoy8upG8C5ZOudNi2wcCvZ/maD3l
	swJrPZEvrLzg9RjatnulUtDEfwpYJGU3JGfDM7S7VtpvJJb0HRnlWjFbO86jm6L1lZnKYJA11aG
	XWyNaXugS6w==
X-Google-Smtp-Source: AGHT+IFbD69ouNWbuKJZpSGTH3v03JlXJ229ltd7Mw22fHICsMaT68q/bZfYb368nvB7oqZdaUKILg==
X-Received: by 2002:a5d:598e:0:b0:3a3:7734:729f with SMTP id ffacd0b85a97d-3a37734746cmr3469916f8f.13.1747736861662;
        Tue, 20 May 2025 03:27:41 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3defsm24680025e9.18.2025.05.20.03.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:27:40 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 20 May 2025 12:27:02 +0200
Subject: [PATCH v5 09/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-6-10-rocket-v5-9-18c9ca0fcb3c@tomeuvizoso.net>
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
In-Reply-To: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
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
index f5e58851047e80b23f9ff3244692ad868ddc1ff6..3e5199355a12f5c9ed8b6aea1dd95dcf8cbf1846 100644
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


