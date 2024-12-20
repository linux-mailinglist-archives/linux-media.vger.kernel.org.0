Return-Path: <linux-media+bounces-23953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1F09F966B
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 17:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B961D1893135
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 16:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8495E21E082;
	Fri, 20 Dec 2024 16:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Jk/K4z8/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE40321D00D
	for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 16:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734711704; cv=none; b=iOEWUf2jLaidlx8yKTKB1G1uDY95G/oda4ohG6eMUTYgvQ5x8iYkSi+RxkL051ID3Kd9nmFnMTyP12DT/finS253j7whK0PV+SEk1eod1bebS3S1H0RldWSTnIH52aywNUk5HCXsURK+kmH3QNw48fXBqe8dyVnQdEMFRspidYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734711704; c=relaxed/simple;
	bh=lP5fUIxnwfA9TrVj9PxAP3nMhg0Xse1CCwTK/R9Ub5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJfW0RQNeAU1rnCeTRKf92quck6iSydEPhTUNug0Yh1gp2loP5LSZ6oN3U/m8e9YyKt8MeNHrTvNTde7uDEEzPdo63ERfHG9RFPqNdw82du9/2G7/j+V2dYI7KR4wqkGBhXPl8qQ6OAiasgUDL7q2MLmg2WdCe8BRdPhupf+nIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Jk/K4z8/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso21101915e9.2
        for <linux-media@vger.kernel.org>; Fri, 20 Dec 2024 08:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734711701; x=1735316501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=av9B4J24iSkn+3gVD9YhMsMCbMdNI6QkecYKJAVC1Bg=;
        b=Jk/K4z8/VO6btyAfWwYJhGJCeLrSB8ZzvmSYN7b8BdnaGH/lQI4LgumXcEQSjUoE1S
         gP62wQTcNrJRAV0Js3cXRAhGZgmJU6sbHsg/pNmvJfvi/3CKftvy894bIfk6BGae2r65
         jdsDp6O6DCDIq+4N9qOaOd5JkdhSyQoVbYIJY8Je2HJi+0+dFHBeGJRXagZlYe86bWrg
         9LzFCwkC+I8ZOoDCUOiVUrLrMiBsYkwPWHMUOzAFUfFH4TQjoSNlAe54AQQgyf8SreKs
         j8yEcKPXHYJ+LYAwvyw+gcisYeUMSpqr2w0kcBYgqGnO0XieCCQECQVmnWFfhBdyyKtf
         iFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734711701; x=1735316501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=av9B4J24iSkn+3gVD9YhMsMCbMdNI6QkecYKJAVC1Bg=;
        b=nIhkYK7djuhc/JDrXyrJkzv1MHIOcHis5C5yUY/tyXld5sXIxA5y8V2uEbEtXbudNT
         BpNtozR4zMyShiE3UT72+q9xCiLi9xvnIFqHNDkLiy0GFP58TtDxpeukR0uUZsyVFpy6
         koCxk5ktWuhQnr3cmuUK86nrRs7LJjNwNDQ3wLtemBy+5AHpaoSwCHeQG7BodeopQOHs
         J2zOQdn84VGDxkg9C4UhAVt2sMqBSruTi25BPA9/ja+AHjFiHyalFr5Dany9sBmpZhtG
         gz9hyBfBtb7fF7LBvnynt3R2ihQkNwOR/JOkh6iLchJL4if7+MUzejmXOjt1z8YcWhXM
         KU/w==
X-Forwarded-Encrypted: i=1; AJvYcCVURIFkRm72S6SxeGsIHWEXdhxGLRpcXY4vH3+fileXg3aSbhp03taq305hjnnFinuNb54nbMaLwydx9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfHoPoARUUJ3hZbyHKZjLPc3PEEIk2nxOGaeURoGrwCGJR/ABC
	BPA2MulH3LdC2MGZ7bv3TDg5liS32KT6G5ez9uk0EPUJt9YUFye6/OpFcCyxESg=
X-Gm-Gg: ASbGnctQ8DSv4n5tlC2lh52A1BQfZBK8OuLvakf5ru+njOAhWR+Simwm/E6e1VQ6CwN
	QcqmbimdooGPHDZ6qNf8mG0Ohkn/FWwKJ4eJY/bfw/scsg/BiW/Pdjmm6A1Hv9h2JBVGpjO2bHX
	01jrOVqfXRE26bUFvWYF07P9sI7S6N1dTPIp/H/oLNj0W4B8KTBPMYXkDex06kpIgq7lllTV98C
	jOYKgKVSHm+sJR93QL25ALJSdNG8xgTwzAwL6tRIDO31ta2
X-Google-Smtp-Source: AGHT+IHg6VTmT54UYl9JM2Jsfkok9cq3oZeEbcD5pJ5HR0oeS3QenygH1VZpwXBGmdab27CtHTitYQ==
X-Received: by 2002:a05:600c:35c1:b0:434:a94f:f8a9 with SMTP id 5b1f17b1804b1-43668b7873emr26854825e9.28.1734711700897;
        Fri, 20 Dec 2024 08:21:40 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm82824045e9.12.2024.12.20.08.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:21:40 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 16:21:18 +0000
Subject: [PATCH 7/7] arm: dts: bcm2711-rpi: Add HEVC decoder node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-media-rpi-hevc-dec-v1-7-0ebcc04ed42e@raspberrypi.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Add the configuration information for the HEVC decoder.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 5 +++++
 arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
index 6bf4241fe3b7..43fa2d82cedc 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -105,3 +105,8 @@ &vchiq {
 &xhci {
 	power-domains = <&power RPI_POWER_DOMAIN_USB>;
 };
+
+&hevc_dec {
+	clocks = <&firmware_clocks 11>;
+	clock-names = "hevc";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index e4e42af21ef3..0a1f05a26a6a 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -628,6 +628,15 @@ v3d: gpu@7ec00000 {
 			resets = <&pm BCM2835_RESET_V3D>;
 			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		hevc_dec: codec@7eb10000 {
+			compatible = "raspberrypi,hevc-dec";
+			reg = <0x0 0x7eb10000  0x1000>,  /* INTC */
+			      <0x0 0x7eb00000  0x10000>; /* HEVC */
+			reg-names = "intc",
+				    "hevc";
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };
 

-- 
2.34.1


