Return-Path: <linux-media+bounces-44101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A1015BC98A2
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 16:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8FB7D4F3DE6
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 14:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A502EC0AF;
	Thu,  9 Oct 2025 14:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VM/FMDKA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BF32EACE1
	for <linux-media@vger.kernel.org>; Thu,  9 Oct 2025 14:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020531; cv=none; b=KwTlaHVwNck/yRUCSQBclk3OKiswN7Y3/vpLb8a/iOV5GBMJghfbJ4WKzzlLu+NTimFYAOOw+YpGbb99JDgbM+CM1g/ktYQy82rS/IRsIFG3uHV9ZjQ+K67WM4WMYRIOMb6HHMDm/yozWa2W/J+LzPYTsfPUDSki/jOxFhLxqCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020531; c=relaxed/simple;
	bh=Jy71v+0d6B2d6GEOh/dwMzbOK+DdGqIZvEENLkmwzE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ge8vjTdtl904OuvqwZ4RbvQOOBqF2v+r1XVyE7kD2fn5oGOE/zNM8L+1dT5EtvNOywo14z4QzK9+UV/aZ9Ns/U56a0paXXBAmZzsc3QzcNg1sJWcWoTOMjXnPPUkyE+he/8MdY689OfxUnIaLEC83MihUGY5wZsTJQjCtC1i5Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=VM/FMDKA; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-63a0375d7b6so1148545a12.2
        for <linux-media@vger.kernel.org>; Thu, 09 Oct 2025 07:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760020527; x=1760625327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QB2QRRZuQ5A6a96wgJEcHWWoFDLiNw+AQa4nUZlLV88=;
        b=VM/FMDKAS68ARpBSkZCEyilYKythke2eYmYsQG+HjhdvrmfOz4Iwa85OFBIRq597Zk
         tbnjI25RYzZJuftHjJunBHmttKxgLz1VQXIhMyjjgK0lyxfta0zqHSeHVVz1Npw6GTy/
         aLsNDmiDVocOfxg1d87+II1jyg2lGgm/Jiyh+1ycE/qG4XUCjZf36A5op6pp+uxiV6aT
         QkBsDpxKpDaZyyVzgaHXj+FbuyJ/Ww5x4Ar8j+2lxNhxiML8ywhK3WPMhe5gSsT49KOh
         L+Q7ktgS9lhiELcQPXiZJmFr6PgkFn4vHdiJ0ZOHyVxGx2hMkNY6xjvn4P3kkh5vYzmt
         Amig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760020527; x=1760625327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QB2QRRZuQ5A6a96wgJEcHWWoFDLiNw+AQa4nUZlLV88=;
        b=tPS7x5dLGjPYF6QHz0W95qviWoOSxH7L8oydXLPmVfmIL3FTP6s6Q4b3eXuBsMjaE4
         m2r4EEmN/h/fqcVgH7SdPspVJNg9kEqXyYJrTk8OUmunzTuKrgFVjot33sAe8KCQFR5Q
         B6RqDCgSjDpMf/ZWFmeU+Fk6xfJbP8gQgFvf1v4b7/Zh1Kn2DSdAKBsPu9LMzct9i4Bw
         yYYQN6ZlzeYDONnGBILnvM0MoMo+FwmISJbum05tyUNM85k2x2mKORRDKX72IQ8/9Rqc
         WHtnReZIHacHLeCq01ByyoFqUcD6/WjZ4khTG0RQAPwbvtiipmj5Fon0339zLtVt43jL
         LBEg==
X-Gm-Message-State: AOJu0YyZ4wYsvqnZ82CdlUoHXe+Huze8xY6hWyHXmYOwuuBW/i2a3yVw
	pkTGTTrvoG+DdIZmKHThhgGA6UukcsChBk9XWdFRetHsNNcfinM+AykKuuhU1R+w4+GUcNhfzjJ
	ui2ru
X-Gm-Gg: ASbGncuhqvQz7hPCqCeZvoyDRU37AXtZgFCiF+GqWXJgT1HjEmY+eG4rFJJ+UNAkJ60
	zeqZfG36oxxM94n/Xdp92Ub0CjA5yoGkf0NQGwG8bqMtxO/9GVaPInHzX/n+pSJ/fIe04e8yktM
	OK9ex947UQiFu4UIYJAcq2B2fT82pfklWuf+SoMlgr7VxdkgpWXo4EmFxF0Seia/b7DfTBBP09a
	Yy7R29VMc0Pw3i/JowqaHeODVZpzqxRqx/89M+Sb4KRIT+bosc1Iws10GQvXPZwYnUjUkF6jf8E
	8/M6DbCgiini+hCWjRrjgN34B8o8qC4AspdYU9wkZkwiwOWqozf5xj/70wWi2II9nSJ/pEpjjwP
	p7Os7qn7JEJicQ1UB7ok3HFB0BqYXMKAb9YWghmsCdVn5q4hs+oSOi8m7qsEeDgEc515uNVJF8S
	HBZ381TZxgkQfm1jo+ehlGe0LSloLH
X-Google-Smtp-Source: AGHT+IGx5wNpD8caYwaIatPc3xH78PwlqMe1Cfb9o3uO4sNphikE37aFxo8LiJSszoImSUjRwe+rWA==
X-Received: by 2002:a17:907:c02:b0:b2b:5b40:1cb1 with SMTP id a640c23a62f3a-b50a6eae24amr768399566b.0.1760020527267;
        Thu, 09 Oct 2025 07:35:27 -0700 (PDT)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486606dc84sm1885797166b.45.2025.10.09.07.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 07:35:26 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 09 Oct 2025 16:35:10 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add UW cam
 actuator
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-dw9800-driver-v2-4-3c33ccd1d741@fairphone.com>
References: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
In-Reply-To: <20251009-dw9800-driver-v2-0-3c33ccd1d741@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760020524; l=971;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=Jy71v+0d6B2d6GEOh/dwMzbOK+DdGqIZvEENLkmwzE8=;
 b=wDpwODh4KULf0bqeFOvreRjzZlpizQmCgQ8rWWy+MoqVG+AQaJAeJuz8sjgNKDeRBXMfdUBVL
 1go8fz1bjdFAR5eszs8SFlVfEJcUl/rJ8keRqbVEEq7goOo8jyf1dk5
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add a node for the Dongwoon DW9800K actuator, used for focus of the
ultra-wide camera sensor.

Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 2dd2c452592aa6b0ac826f19eb9cb1a8b90cee47..0e86cd5ff527925c7dba15c4e0ee5fc409fe4ce6 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -627,6 +627,15 @@ eeprom@50 {
 };
 
 &cci0_i2c1 {
+	camera_imx858_dw9800k: actuator@e {
+		compatible = "dongwoon,dw9800k";
+		reg = <0x0e>;
+		vdd-supply = <&vreg_afvdd_2p8>;
+
+		dongwoon,sac-mode = <1>;
+		dongwoon,vcm-prescale = <16>;
+	};
+
 	/* IMX858 @ 29 */
 
 	eeprom@54 {

-- 
2.43.0


