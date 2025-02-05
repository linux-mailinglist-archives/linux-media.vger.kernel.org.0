Return-Path: <linux-media+bounces-25677-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65236A28F86
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 15:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C0433AAA60
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 14:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B831D14A088;
	Wed,  5 Feb 2025 14:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="11cEKcK9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0488634E;
	Wed,  5 Feb 2025 14:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765470; cv=none; b=GAEg2A2ZjI5dp4Kl+asv8BeTgCmBeymqU049xBgxmAhUTvIQQbixzqZWSbLu7A/iqrXPOcEZ85V9i9q+9aIF7eo9K/JD8a0lloQQvcpUtkMJQb1bt72SmUdHXqJ6sul3HhEDpgct/MKsmwqXw3mg94vErsxb1W9DhBnhz3fCq4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765470; c=relaxed/simple;
	bh=77hd6zPQM0xfe8ZJQK/a0hoYl+21UUDNPA0+xPBqbTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=edPrK92EBRAc6R/01UghV+cb8EY4YBiiX+WSaJ8kOfWA9CHLIqHHKFoqPyILn+p7J3NE1LqKcD1JSfUplk3msw82us2fnqSlvV5F2LwFUkZZfZlCNdVLeIOKH4saISLjkLKkLUq60yF0hTPinPdi1IqH8P7rvkwSFeDiSiPa5Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=11cEKcK9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E74AC4CED1;
	Wed,  5 Feb 2025 14:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738765470;
	bh=77hd6zPQM0xfe8ZJQK/a0hoYl+21UUDNPA0+xPBqbTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=11cEKcK9KqtYNEFE3N2Y8qxat0i3iEqhYiIBqWocMwUd4JliJ02nsvgEeEIghSp5d
	 0Kdmz4JK6mF4wWJP1hR8BpUB0yOOo/BA4XJgeg9+NOqeFp2xQySjdElrsUSUyYaDTY
	 IhDtpgwetKzBghd3OS6SXi0zPC//4DlhrS2WHjpA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	linux-media@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.6 270/393] ARM: dts: mediatek: mt7623: fix IR nodename
Date: Wed,  5 Feb 2025 14:43:09 +0100
Message-ID: <20250205134430.641368827@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250205134420.279368572@linuxfoundation.org>
References: <20250205134420.279368572@linuxfoundation.org>
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

6.6-stable review patch.  If anyone has any objections, please let me know.

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
 arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index f0b4a09004b31..9c5a52ce9351a 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -308,7 +308,7 @@
 		clock-names = "spi", "wrap";
 	};
 
-	cir: cir@10013000 {
+	cir: ir-receiver@10013000 {
 		compatible = "mediatek,mt7623-cir";
 		reg = <0 0x10013000 0 0x1000>;
 		interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
-- 
2.39.5




