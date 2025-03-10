Return-Path: <linux-media+bounces-27975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7ACA5A064
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 18:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDF15188E7C1
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 17:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761392327AE;
	Mon, 10 Mar 2025 17:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JF+KWOnF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3D517CA12;
	Mon, 10 Mar 2025 17:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741628953; cv=none; b=KUX3tPjlYl2qk81vrYEnXT3yyZCaGHqVyRYlZCmdg5jBN1iNLdD3RRyAeFdKM/C5lQUeFrdG5YxuOwFJzcZl4gtIcY7KyO9ufEF5r9r3wIttpUfXHXYE5D9tPBHforbj0AICp9j/UzgkJWacoKkPYlhQOEhn7/0OFqpke+875jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741628953; c=relaxed/simple;
	bh=eorEADAoLiM1mfw0R59okj0tCbLtySU1ct0ID5XU28M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ONkvWlB/CnRCTz/ne3Aivh++oY076PplzxqrfSOGZsoM9qgozRS9uTDbOaOSvzXck4rlE/r2Q6cdt/EduYsP5mEqywnVSYXJ9cw0Qk3B1xm4mceWHIJD187/DWqijyiO2ZDglfYTDYiCSEiFqM+MZ53VSePd3ca2Qw6vlcSRH6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JF+KWOnF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAA4C4CEE5;
	Mon, 10 Mar 2025 17:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741628953;
	bh=eorEADAoLiM1mfw0R59okj0tCbLtySU1ct0ID5XU28M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JF+KWOnFF1s9Bs/W/Eu2QjQomJWKCBHCsEmaRhwjflfbg7/zrjLSCO9dZOALdxH4H
	 fa/3A8SaWiUJ/JnSjzYY88yq6JR4cV06kll1Fy0NfPZKNE/5X83JNTh99BZ3+L3mUn
	 pK5zhAHj+hKq8TphZ2F88BwJBKPKFega8UTFpbWw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	linux-media@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 127/620] ARM: dts: mediatek: mt7623: fix IR nodename
Date: Mon, 10 Mar 2025 17:59:33 +0100
Message-ID: <20250310170550.611160205@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310170545.553361750@linuxfoundation.org>
References: <20250310170545.553361750@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Rafał Miłecki <rafal@milecki.pl>

[ Upstream commit 90234cf9b37c57201a24b78c217a91a8af774109 ]

Fix following validation error:
arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: cir@10013000: $nodename:0: 'cir@10013000' does not match '^ir(-receiver)?(@[a-f0-9]+)?$'
        from schema $id: http://devicetree.org/schemas/media/mediatek,mt7622-cir.yaml#

Fixes: 91044f38dae7 ("arm: dts: mt7623: add ir nodes to the mt7623.dtsi file")
Cc: linux-media@vger.kernel.org
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Link: https://lore.kernel.org/r/20240617094634.23173-1-zajec5@gmail.com
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/mt7623.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index a7d62dbad6026..64756888fd0d1 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -309,7 +309,7 @@
 		clock-names = "spi", "wrap";
 	};
 
-	cir: cir@10013000 {
+	cir: ir-receiver@10013000 {
 		compatible = "mediatek,mt7623-cir";
 		reg = <0 0x10013000 0 0x1000>;
 		interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
-- 
2.39.5




