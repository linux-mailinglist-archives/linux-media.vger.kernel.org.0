Return-Path: <linux-media+bounces-54474-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCt9GypDqGmRrwAAu9opvQ
	(envelope-from <linux-media+bounces-54474-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 15:35:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9852019D6
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 15:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 075B6320FE79
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 14:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C7B3C2782;
	Wed,  4 Mar 2026 14:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gaOWW30m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308623BED31
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 14:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633129; cv=none; b=ho4t8Oy8Cd6Tur6WGHeZWu73PI6G8LSBvLkdf79emFUXDRqYDuvoo6AsatU4ITFzxLc+FXbjwW00plC8utltfBi6ZgWqX6kl20cYOb7g4vy2qej0JSWVt0KPdmp+5FPBzFmyf2Q2qG4mGnp0R9leFvN2vOVitFDErTbWnZFUkZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633129; c=relaxed/simple;
	bh=GcWcCkh/S2QN6rJM8DB8/+xpSep1ONSspIJ5ZvkbTxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oO0q14AW2yCqrQniqVqcmL74IKyr8YwIUQVXol+opuBYvREgkbHzAK4PCc3uK7wB/jcX2HN4E/28uDSh6EndK3zaE2fJFyvNnHq0jhCTpovsCNQo0OxYTc+HpVompDeEOiIfZUMZwSgty/iyn/Yonn55mkKj1mTaotbmw3kFzp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=gaOWW30m; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-482f454be5bso72393135e9.0
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 06:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772633125; x=1773237925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QzYqP/o/j5AHYZ8QSUfI4d0IlFeXxdlgP7OAfF3TxxQ=;
        b=gaOWW30mF+epNza+e3J8wmiUzPT5ZiVkaxKMsgD9dXRn6WrbqvLCv9OgVwTJYFX+jP
         yaIvjKaxg0WuSAzkgKGi+kxkaAQ72LzjzYA9HkUc+kH3utTc8QRLu8klBL1FDmujLfXr
         XmFaHeDjow1Ozx78ZSoU2uqHOuyxHmdq/18HtpA0k3KkQOrdsBE+93Wj/hTjPSr5eZGz
         ILbeRf7EvBWi9ibEJ9SJF0ada1/v1q86fMfcQykJ8Q79IrXqaykP4o8CZw/2Rg72MUqs
         pvXxEl3DV7nS8o/Qs+Ssq2ddVcdcdkznJzx0YlaZ/oLLyySQoNNGe3H1JZFnXlXZ7AFL
         Fetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633125; x=1773237925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QzYqP/o/j5AHYZ8QSUfI4d0IlFeXxdlgP7OAfF3TxxQ=;
        b=caJq3JRv0aW/DMDiEeM6gSdgmroS8osw4AHakRK6kSHxTzcMZ4iuz/n8vkSKMUq3ip
         cJuu6auWkvHKt2xctxYs90iC2XZyPUsx2M62K3nHZQI4EaLymwoiuQBump/+ehXUpjJj
         +Gcy0wNMWqCWIEO5ATPeYovIbkuSUf3DelLB40gWVMPnquWFnyNnsiQw13W339Q52CCT
         aFwQmNZqP2dxZcbrV/9DKZpWFrRHJno2zkESKUJgoJO17m6Fj8XZ0gMvXiVGZxTI3njd
         BxlBtyAYY4hOQfpcxyQ+fZRvAw3jvT30anxm1IVHobvljlkaXN9VBivCZ50RORmAe2eS
         xl6A==
X-Forwarded-Encrypted: i=1; AJvYcCXWgjHJU/GTYAjRlnHJAERFU4VSUI/+h/sZyAnJrwyb5rh5L/fqpQ37zcq8Kz1zyBOQRBv/RPMD3CpPaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw50WNKtGkJF789vVpMEjMtXLRyFKZNWcYaF+c43iKvVJY3d6iv
	551fWk4GZdhbQ2Z1UVZdCyDN+ynAPPaWHvPNhgrlxCNdRixXA+AXp8Etwfpc+ZAWL/4=
X-Gm-Gg: ATEYQzx4/LL6in3SY9nd07hDgP8HFCzV4Vt3cuilTmgAcsYsFW+7SCVeaCNQm1sQocQ
	Omfbwts3aveLDHjbRA1UOKAJUUIzbofSoRDoX+KTdMvwpgaGnYuiHzrbGBhCZ1TN8LiFSSFLPhQ
	vD/1Wx+sx3nvVITTXZ0rKQ4G8uM6Js924eFcsJ6RbYFJ5u4LuhU/FdJPgHbQSswCRx8qX9sxXoX
	kz4vEpMJMr3AOkK1e9oAoXrxwnhoB3LYproenePz0EmVblqfL8fqeUGrcUEOOYjBLIQS+FjQ3Hi
	FZfP7Qpx10EjBVbfqHrHNWPtCsBqiHI/gnNucLAxJ6Kz6myMPn95i6RbR9MpKk6nOksbFDy3rMt
	eFnOue8XIHv+imQXYAhsthlfFGz1Jrous1dJAszGwg8gN3I6ubuPW8uaa3glYVwoCWd9tbrSJck
	o0Yl66gdhYgZxCMMxef4L5s0d9
X-Received: by 2002:a05:600c:529b:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-485198843e3mr31062255e9.8.1772633125462;
        Wed, 04 Mar 2026 06:05:25 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-485187b6ffbsm59296165e9.2.2026.03.04.06.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:05:24 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 04 Mar 2026 14:05:19 +0000
Subject: [PATCH v6 6/6] arm: dts: bcm2711-rpi: Add HEVC decoder node
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-media-rpi-hevc-dec-v6-6-93868ae6dff8@raspberrypi.com>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
In-Reply-To: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
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
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Queue-Id: CA9852019D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,kynesim.co.uk,gmx.net,vger.kernel.org,lists.infradead.org,raspberrypi.com];
	TAGGED_FROM(0.00)[bounces-54474-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:dkim,raspberrypi.com:email,raspberrypi.com:mid,7e9c0000:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,7eb00000:email,7ec00000:email]
X-Rspamd-Action: no action

Add the configuration information for the HEVC decoder.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 4 ++++
 arch/arm/boot/dts/broadcom/bcm2711.dtsi     | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
index 1eb6406449d1..aef5ff7b2a53 100644
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
index 5e3b4bb39396..7b2081ef0413 100644
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


