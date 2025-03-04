Return-Path: <linux-media+bounces-27525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A40A4ED61
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 20:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A610B16E498
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 19:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AB625F976;
	Tue,  4 Mar 2025 19:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="SfAgB7Kb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE04C2E3371;
	Tue,  4 Mar 2025 19:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741116746; cv=none; b=ais/eDrYGHm4V5gY3w/zsbIolDwhu9hs9QmjazSmaU+yzlBPoz61hbm7n0Y566LP5iQzZnSaN5aJ1CpYHKVDzJ3uz2MnL/LaP5PMwXT0WZrkPRYo4RNjW41EamxLkksCpZFLj13QJDuJO6gLMZ4o98q3oqMnrDpornyEXxBL+nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741116746; c=relaxed/simple;
	bh=eqLoiRddp8EsPvEYF6OWcXzyp3WGdUM4H+6GYoWqG7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=edXu8P75K0wRxgn+0TXisC5rFkEklLaGdLvMN3jnc1062AL+un+hk0M6naAdOGKMZdj54mA1XODvcxJM6DhQTIwkQJtGSi5V95auWlLe+ARhoTGAyOhjzNY81Z9umypzdVhabWfGsMqaAFVOdyPUM9x7M+eyzQbu2abVK2Vb9V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=SfAgB7Kb; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.1.78] (unknown [45.136.247.92])
	by mail.mainlining.org (Postfix) with ESMTPSA id 1B6A8BBEE5;
	Tue,  4 Mar 2025 19:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1741116742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=31/oCz2a/ONrfFM9ai3Wh69nx3m5R0ju7JO40am2Iqo=;
	b=SfAgB7Kbv1Vk8GQ8xcmhnZ0O0X+sAoEoa7ZByrmFW4wCredaX0AF+12/oBowQGm/mv1QRy
	U7CK/MuGDqpVW2w3j9nl7i5Y05j+qospkzM4fmtwGcGmePzJyAVMyT3DBBV1mv/rTddm3v
	eaaSY3lvAG+tFHhGBj5UseIEyaW9sfm5o2pQGXW19C9sPqwasSQeDB6mYcD4KcKWiutYBM
	GVRY1yVbyw8HkaPEHqQ6hm/GcAtuozlv3IB10HfKf38JQH8izKxFMAGX/ObZsn4Gmz7efO
	UvysLwO+Akuf8UKGBN34X+nqk4m0R/F8uX/nrWqSPnSIdoadBcVZGiIjnyoaMA==
From: Vasiliy Doylov <nekocwd@mainlining.org>
Date: Tue, 04 Mar 2025 22:32:18 +0300
Subject: [PATCH v2 1/3] MAINTAINERS: Add entry for Onsemi LC898217XC lens
 voice coil driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-media-i2c-lc898217xc-initial-driver-v2-1-6a463cef3ea8@mainlining.org>
References: <20250304-media-i2c-lc898217xc-initial-driver-v2-0-6a463cef3ea8@mainlining.org>
In-Reply-To: <20250304-media-i2c-lc898217xc-initial-driver-v2-0-6a463cef3ea8@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux@mainlining.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Vitalii Skorkin <nikroks@mainlining.org>, 
 Antonio Rische <nt8r@protonmail.com>, 
 Vasiliy Doylov <nekocwd@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=852; i=nekocwd@mainlining.org;
 h=from:subject:message-id; bh=eqLoiRddp8EsPvEYF6OWcXzyp3WGdUM4H+6GYoWqG7g=;
 b=owGbwMvMwCW2fZ/SFZeSpU2Mp9WSGNKPh7r4+NlGbmSfIvTkixN73a1uKcvbWqXrpggGXWvnF
 ovfuaW3o5SFQYyLQVZMkcVmo8dssfxwyUnTnirAzGFlAhnCwMUpABMpyGFk6Azb8fli2rsS8x0/
 8+WMX5/5Xbrr2ZQ1GxZNdBOYktsyTZ6RoUF1wsOY2KvyfK9fMFQU2PfY3Vju46xysUtpmrv++T3
 SLAA=
X-Developer-Key: i=nekocwd@mainlining.org; a=openpgp;
 fpr=3CB1489B166F57199296E520B7BE22D44474A582

Add entry for Onsemi LC898217XC lens voice coil driver

Signed-off-by: Vasiliy Doylov <nekocwd@mainlining.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 29e1a423eee5bcf9df7938aaffe5bd3e2f6a2bbe..c15223f063357a8f89cf12f46ebcb7bd062903f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17781,6 +17781,14 @@ S:	Supported
 W:	http://www.onsemi.com
 F:	drivers/net/phy/ncn*
 
+ONSEMI LC898217XC LENS VOICE COIL DRIVER
+M:	Vasiliy Doylov <nekocwd@mainlining.org>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/i2c/onnn,lc898217xc.yaml
+F:	drivers/media/i2c/lc898217xc.c
+
 OP-TEE DRIVER
 M:	Jens Wiklander <jens.wiklander@linaro.org>
 L:	op-tee@lists.trustedfirmware.org

-- 
2.48.1


