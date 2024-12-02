Return-Path: <linux-media+bounces-22473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E0D9E07E2
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 17:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1920161354
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 15:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0731F1304BA;
	Mon,  2 Dec 2024 15:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OEhgyWGc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6073747A5C
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 15:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154444; cv=none; b=qxJfz1p0fIa7C69hUD/wle/tlduTENYVDpDXB4+qkmTaQguHACGnwemO6YYixfjsvGL6fJWJlJ7U7GFjTG4g2gptnhAn+rsf8ET3tHcBPrf0EPa7PCPzQgVlud+6EXxp14LkS+BhddE7cAUsXbrfp2gga15Hm6P82rIjNuwVFvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154444; c=relaxed/simple;
	bh=mtiQtlXyI3b6sJIsjA4TwpaNavz3zj9aF+MIz5P2kic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jYSJ/i9whFZU+JwKKo2n0wyELKAEYeKmotu9mqpjc0V5w5NnE5Hm56duyxpCfMWAaYCRrXsPEH05+jERCtx5WmKhv2q6n0CLckT6lPGUuJwDCO91HV9S/HPGCmywFliMY875risOGNYIM9SaU4XkdK2stWm9d+WwCBkY5PL1RGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OEhgyWGc; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85bc6a1a48cso750533241.0
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 07:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733154441; x=1733759241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkEW/0Y6zT4/Atf/d+puMl0WcNDtT8U8UDsIe65uvgE=;
        b=OEhgyWGcKXzsgFxQ5qCx3Qve3IiYC8Tcdya5BUHVAlcLvExGxT4hLwlBAA53vHG+fc
         ICMI1w4R6nH4/27DtxQZEHDyqGmuS5/JEMHTy9w6Tvl4m5shGwUWY1X7Yf3LW+gN59dT
         F+gcfmO4Q2sBal5m7xgJ2aAo7b22Y1Y+itZuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154441; x=1733759241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkEW/0Y6zT4/Atf/d+puMl0WcNDtT8U8UDsIe65uvgE=;
        b=i+nlIQU5Q4Q+5yqV54CJ9EfsreolC7pvz3GF0Ss3P3bdOfPw8/Z9KyCtvldQbtCGdX
         SvmGEClgozoG7n45QIpaHtQFCwu8EJzCYyJ+Nk2V36V+0wE+uc+au0d+fUU2jIZDQpbn
         XihgS2PqvuE/BTrUa8ZctD9pQwhNUJQXm3OuxsxrLV3CYAGlOzt5q/IEYd2u0vo7l70q
         OivhB+CqEteeLAxD8DcLQ8lvBq06rpYk6KHDpNYegnQZWSbN7NYNbjbquLDhUIr9M3nG
         3QOMA2pwGxhKl8DljH9zyAQ9QF0kw4F55yEYA/EibgFecN3ClHDsbxYu8Aop1EMfJhcb
         ifQg==
X-Gm-Message-State: AOJu0YytatvEnMeg/lsazLywQ0hfBew1TJIFRwxiSQWn2EhGE1Rd0Xk2
	HhyedisSTXkcHT8Rw3zQcWdemrOpdMsrC9hHzp9bYw7b9abP1x1LTuwGzE/ZaA==
X-Gm-Gg: ASbGncuPQEGx4Bjv0yb6XfVHGANpvBknqwI1j05Z48PMUVbxSp7YMIzVHWktFQKxXVB
	fc3VHfNcGjUByU+3zZfR1NP5aIOMwktViy3BkWxJ3+321gbefgKg6uzi07wNH10l+yiWFmK1TWB
	WG+pu2WD2RTKML49DANlnqp6MsOfCQofjJwSCdLk17FVG05UY3CFlWWH1mb08brlzqFPSymhM2f
	F5QbiTbdVnd/N1zGSoPsNRp7Voer4XighIebFgTmkwMTy+SSpdt47lzSCJDG701Ivyj/KAVuNGi
	zsmcAkPfwvMXtDvMggHTAyP9
X-Google-Smtp-Source: AGHT+IGBHPCXG9TwBD4LE/oxUh/BqCKafbDdQlV9UV4NbH/ohrUS+/WPS+6wYQbT3toO5YK2KCH6Sw==
X-Received: by 2002:a05:6122:500e:10b0:515:20e6:7861 with SMTP id 71dfb90a1353d-5156a8069d4mr18897232e0c.2.1733154441340;
        Mon, 02 Dec 2024 07:47:21 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0f8ad6sm1159729e0c.49.2024.12.02.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:47:20 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Dec 2024 15:47:15 +0000
Subject: [PATCH 1/3] media: cx231xx: Convert enum into a define
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fix-llvm9-v1-1-2a50f5acfd0b@chromium.org>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
In-Reply-To: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The code is running arithmentics with the enum, which when not done with
care makes the compiler a bit nervous.

Because those enums are only used as defines (no argument or variable
from that enumeration type), convert it into a define and move on.

It is required to build with llvm 9 without these warnings:
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:673:17: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:680:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:687:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:702:17: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:709:21: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:718:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:727:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:737:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:749:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
index 5bc44f194d0a..62ffa16bb82c 100644
--- a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
+++ b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
@@ -57,19 +57,17 @@ enum USB_SPEED{
 };
 
 #define TS_MASK         0x6
-enum TS_PORT{
-	NO_TS_PORT = 0x0,	/* 2'b00: Neither port used. PCB not a Hybrid,
+#define NO_TS_PORT	0x0	/* 2'b00: Neither port used. PCB not a Hybrid,
 				   only offers Analog TV or Video */
-	TS1_PORT = 0x4,		/* 2'b10: TS1 Input (Hybrid mode :
+#define TS1_PORT	0x4	/* 2'b10: TS1 Input (Hybrid mode :
 				Digital or External Analog/Compressed source) */
-	TS1_TS2_PORT = 0x6,	/* 2'b11: TS1 & TS2 Inputs
+#define TS1_TS2_PORT	0x6	/* 2'b11: TS1 & TS2 Inputs
 				(Dual inputs from Digital and/or
 				External Analog/Compressed sources) */
-	TS1_EXT_CLOCK = 0x6,	/* 2'b11: TS1 & TS2 as selector
+#define TS1_EXT_CLOCK	0x6	/* 2'b11: TS1 & TS2 as selector
 						to external clock */
-	TS1VIP_TS2_PORT = 0x2	/* 2'b01: TS1 used as 656/VIP Output,
+#define TS1VIP_TS2_PORT 0x2	/* 2'b01: TS1 used as 656/VIP Output,
 				   TS2 Input (from Compressor) */
-};
 
 #define EAVP_MASK       0x8
 enum EAV_PRESENT{
@@ -89,10 +87,8 @@ enum AT_MODE{
 };
 
 #define PWR_SEL_MASK    0x40
-enum POWE_TYPE{
-	SELF_POWER = 0x0,	/* 0: self power */
-	BUS_POWER = 0x40	/* 1: bus power */
-};
+#define SELF_POWER	0x0	/* 0: self power */
+#define BUS_POWER	0x40	/* 1: bus power */
 
 enum USB_POWE_TYPE{
 	USB_SELF_POWER = 0,

-- 
2.47.0.338.g60cca15819-goog


