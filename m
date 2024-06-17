Return-Path: <linux-media+bounces-13408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C6D90AA4C
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 11:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C33E51F20FA4
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 09:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AF3196C92;
	Mon, 17 Jun 2024 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlpdwIUc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3194195FE2;
	Mon, 17 Jun 2024 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718617612; cv=none; b=u70Y7gsGnntYe6FVv7q905L+DO5kF6TA/JlqPH37rwMQibUabV+WCDRLKFKaqi+1ZOv9u3Ir4f+KXDoxPMZVM9qljenl6ldbCaRkiEph6kn+wyaHPJe/8T6x0R8QYkTMJcB1IX85/i6TY5+0nZirSefLyhwETU/tusNUL8dw3EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718617612; c=relaxed/simple;
	bh=200rAfAzRy+STZSBANqXeDNoLGwsi5SU29OnGXdNjtg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=EcDI3yC60xoRzxJ1nJ/wcyrhl7RYiv3c22LfEBI88dWC6KbMRpFGnoGjOq1OwAsKGU1FstfycfIzjB4PRHkBUqRplWbSMTpjXp9aUAQLFqSV47rZFUyAYpoouYknsUqTd2nmcNNjcQc9EG3HdWaNe5RI1LgjF7ajQqw1QVky0So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlpdwIUc; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57c714a1e24so4615929a12.2;
        Mon, 17 Jun 2024 02:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718617609; x=1719222409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NyP9XShbHHAL/4NU3Mfcaign9e+kGEJMKFWD0UA/5Ic=;
        b=mlpdwIUcr0p9Li86bTv+U1fo3sVhjDAEKjtCnThTVz9gAKYvoS4+tAwxmIdoxgHRtO
         HvoJosY0C8wJ2eAudsw2yWy6IbIFKm4FVI03k6TbYo6seY/IR2DZ3dCOWM+n+17iboxO
         j/u/kJLD0lCLCrh27iEfM+j88dkPS/8Gcqgm5DNuKVo2QDofCk7JjwNc8JGnvUmTSmp1
         J/X9XMxXJbGMiDTPGEwuyWalfebk2NvM7soZRow5vd6LZxBRc8bzz4Oj84vTYtihyVqo
         1wv/RhZMStUinfe3RGqN9IX/PD8iODNKV9G63AITopn25o4s6292oLu4jUSwV7TmrcgJ
         OW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718617609; x=1719222409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NyP9XShbHHAL/4NU3Mfcaign9e+kGEJMKFWD0UA/5Ic=;
        b=LKrNlt5mpUQ2pBts6Qn/UBAgx655FqlO+APfoR1EKP0X3AkcO2r77zUBuEioi5ItjY
         EiHRgiFXDpidOTRKAAU4OKOY1r2olrxQAXKFDUuoNnDWacFIaOGZcj/NbSLeozGDPc/w
         tzqTHSQcFuNfO3qGkhF9MhmOC2zu7DRxc2n8gl5gTcqW5E1UX7p/urzMwKhIyC79lloG
         vGEbOEDrRjO0x/wKMjukiPeCu3lhmrZTAysYSZa6DesCzEtu2GkoZvl/S6eWs1aRTYy1
         wQP7gaqUjmzsmdZ7LioGLTzQlzPbkhSe9e4RlGmU9rlxRLKc/233uhTjreCRjqigHzeF
         r0FA==
X-Forwarded-Encrypted: i=1; AJvYcCUPo4CZOObFiG4RSywdzyr/2aS8aRwxNa5heOUT4dZA/lBabFHUn8IxFkyi5mDzUI70c+wx1GV7K0gNnZJhg5ph6msj8vs1Ysr8drCh1Yy8hyCrXtMlDnHLBNvEahAMK2SuQ73eNyfC
X-Gm-Message-State: AOJu0YwtCUfQFxZGhMNiy90flISxrVf4QJQoZT552t/5ufG3GnIog4nY
	S0kPhY/oN2U6QLPUSZqdbQed5IKmFxqpY/AfypC6zszH+CTO7o6h
X-Google-Smtp-Source: AGHT+IHuEqticHK3dZxHG99692oY49qS0FvfDLBUXP4QW2Jls7nMHWex5KYvXNwoKK/dpz50MOgzag==
X-Received: by 2002:a50:d596:0:b0:57c:6bd6:d8e2 with SMTP id 4fb4d7f45d1cf-57cbd4f6b9bmr6374154a12.0.1718617608759;
        Mon, 17 Jun 2024 02:46:48 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72da790sm6141318a12.35.2024.06.17.02.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:46:48 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: mediatek: mt7623: fix IR nodename
Date: Mon, 17 Jun 2024 11:46:33 +0200
Message-Id: <20240617094634.23173-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

Fix following validation error:
arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: cir@10013000: $nodename:0: 'cir@10013000' does not match '^ir(-receiver)?(@[a-f0-9]+)?$'
        from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#

Fixes: 91044f38dae7 ("arm: dts: mt7623: add ir nodes to the mt7623.dtsi file")
Cc: linux-media@vger.kernel.org
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index f0b4a09004b3..9c5a52ce9351 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -308,7 +308,7 @@ pwrap: pwrap@1000d000 {
 		clock-names = "spi", "wrap";
 	};
 
-	cir: cir@10013000 {
+	cir: ir-receiver@10013000 {
 		compatible = "mediatek,mt7623-cir";
 		reg = <0 0x10013000 0 0x1000>;
 		interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
-- 
2.35.3


