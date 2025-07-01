Return-Path: <linux-media+bounces-36454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3472AEFEF3
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 18:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DC98480F10
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 16:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF84F280332;
	Tue,  1 Jul 2025 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Pkg1bxiJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DB127EFF1
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 16:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751385732; cv=none; b=XnlhGGPAVrfBmx6TL6519Jynlu3ayzrWeiz9Se+0WvbTuI9zAGLljUURE0JumMZojXS75Cs0Tk+RwCGfptL7e4jypD8MgQUCaLrkIdvVYhYXfn05gpj16r60NdGZuy7wO5HXl06P0SDjBtsOIROq1hPK/kVKP1aJB+fSSwhfQzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751385732; c=relaxed/simple;
	bh=ZzzOGhRrHbafmgbWIr1+aT+e1/OEhZNOVAq9U/HcCko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gsEStbAVvWx1QyINiX1SSx+AjVv9IIWgKfa0S757OxOypMKe/Z6CEH9AfHWFsgljvLXSTqsEam2KsYUtgRCGoO3pEpQ9g9wPDtX8l/0t1MOmDjEoAXK4FZ9tyyglQJuY8WCRkxR1VZ0XfKjHBLJB+DH/LwwfOp9TmYkA8eUCpHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Pkg1bxiJ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453634d8609so41894215e9.3
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 09:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1751385726; x=1751990526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9BTfUEfVu4iQsAWGFaKjgq6s8Puv8SU/d82R6XNX1w=;
        b=Pkg1bxiJuS3aLUqwx1b1TlOfq4v73tiyKc6Uorq9cZ3U1RrE1NlVLG18M3N1LAsMJS
         zHQdteD3Q9sc2lSK1r2d+x3JC1ZOMeFcAawgvHDMfWJ5GLUlw6qACExgR2xKwqfCi9Uy
         gVoOMFQ5V/8yIKcxsuOaAyYtm7WNMxLih8yL/9OobYhSnOiKArr2xm2VrT9j00DBx4ii
         MDO60wev+geFpHOZahP4k14FgrYAVWYZNxMXHO/Tdvk0s8xHbBcRwbgWtI9GYhd0R28p
         GxFh/xle+rwjLASJ9lcikqNqO7RunyEYsAqAvI65jDlt55SKAhRv+e2Iw0/lNpDRx1DQ
         48Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751385726; x=1751990526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9BTfUEfVu4iQsAWGFaKjgq6s8Puv8SU/d82R6XNX1w=;
        b=eRN5ngM7teAfVrG98Cia0POcIPVRSKOUUE9XrKbzGlUWi3z0LumixwmoG/si6Tb8Rz
         odShHmlEh/BUBvNtRxg019CwnTs8SItUkK6Iw4Q1u5nLNNxQEewTNPdn24Yh/lg2vXxv
         8O+s9M4GEh1uSau0yv76iJIRnpHK74ObioUsnnQV59WgD5ipxQUyHlz0BYdlMZSyyPLL
         HVB1fzf2YU7X8Yuu4dnnuxbNDk5TW0xAbNmZZk2ugSWw0xRKKIwp1RLj2xZD90XDpjR6
         mrX1K97FUrWSK631Qif6noe3tfFMQ1Ev/KxyzveHoAjIcIWANwe29LQjxBBXZALusp2X
         GHlg==
X-Forwarded-Encrypted: i=1; AJvYcCUOEq/h3CKDL4ik2bP33h+4Qyy9BPH36du7h1nStq769ShLtwp7lwb04e6/bqRvb2NKNXMHFeGnPVDnBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyAkj4/noLGsf8YNdtqXJaiVvLLVF332lWYFIr0yTkFc0UBc3n
	IItZYOKZtMaBv/6EkcbRbWxoNHeJzGcQEnFxrVy/CSbGvTRqGfv4Thxu6dGZIdwXLGOthoPV7WA
	4utWk
X-Gm-Gg: ASbGncsZTETSlrix1CwLrdCBnBgjvl/XrVmeGgYcNdObeCRNQjwVOPWSYNolukR8cIK
	IsahzlNv3eVmm1gTewtlebA6S0dBSgWQqkO6WK4652aq0ximr+bufDTRzbg16PN4McMr8Esd10f
	+tXMWcwNF8zd8dy+sZuWCbk6AKVzEWsL/7Khpma1lD6hDoouXZpr2e/uCmkbiIngOjh/Aw79fw7
	YhHQVnvUzIWjUsAPUg9mcn+aQ80QOnl65T2Atcy4nIXLSqLInQGTK2rOmywGbFg39vz9R6BsEuS
	B6C/LHzMHpO7/OiDwggLo7WIUkLzrJp/UYILLnkNqFO1ULFIAdlWzg==
X-Google-Smtp-Source: AGHT+IHNr5gKLLJ5dI/LXYzeaaajt8CK6iLWqWjb6+EEC5MHBgr73n33/C9RKxWuy86u708WLprggA==
X-Received: by 2002:a05:600c:4fce:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-45390259d15mr159248665e9.6.1751385726126;
        Tue, 01 Jul 2025 09:02:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45388888533sm182500995e9.21.2025.07.01.09.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:02:05 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 01 Jul 2025 17:01:40 +0100
Subject: [PATCH v4 5/5] arm: dts: bcm2711-rpi: Add HEVC decoder node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-media-rpi-hevc-dec-v4-5-057cfa541177@raspberrypi.com>
References: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
In-Reply-To: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
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
Cc: John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Add the configuration information for the HEVC decoder.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
index c78ed064d166..7984caa861e6 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -68,6 +68,10 @@ &hdmi1 {
 	wifi-2.4ghz-coexistence;
 };
 
+&hevc_dec {
+	clocks = <&firmware_clocks 11>;
+};
+
 &hvs {
 	clocks = <&firmware_clocks 4>;
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index c06d9f5e53c8..35b673e9ab28 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -617,6 +617,15 @@ xhci: usb@7e9c0000 {
 			status = "disabled";
 		};
 
+		hevc_dec: codec@7eb00000 {
+			compatible = "brcm,bcm2711-hevc-dec";
+			reg = <0x0 0x7eb00000  0x10000>,
+			      <0x0 0x7eb10000  0x1000>;
+			reg-names = "hevc",
+				    "intc";
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		v3d: gpu@7ec00000 {
 			compatible = "brcm,2711-v3d";
 			reg = <0x0 0x7ec00000 0x4000>,

-- 
2.34.1


