Return-Path: <linux-media+bounces-40382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5985B2DA20
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 12:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76BB41C46294
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 10:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C082E2EFD;
	Wed, 20 Aug 2025 10:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="GAiESyXk"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37C42DA77F;
	Wed, 20 Aug 2025 10:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755685994; cv=pass; b=kdQ5958F8MS2w9yZZkCsE2KS+wwjkF4HyLvWPrscqYlmQRq0C9wJBe0q9ihKtgW7aTfke/u0oj7R++AhyXyNPSmO48oy4UbFy3gvrCjQTV90hWUh1U4wElVXb6RpRbcIm0vM2r9gamDRCnWQwNP9p7H51BiVOjqSytsj8LhR0JY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755685994; c=relaxed/simple;
	bh=rrskv1JmlyRnC+Gj2D6YwvlKmMG7APvxEaIBKzMAY10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POgekaUmhN4CkNT+aqCt0busZbGsL51GSO1/e1dzC1DZyGHLocbzzwVHz31JnIg78za2Kx70RkESEYngXczlQTTR6Q0DqqpoDNYEsti28i85ytCDHxv/HXCamn5Qc1IswZXMqmzraRpcbVJ1F0fdX7+1yw0vTVmXclTsT40exsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=GAiESyXk; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755685964; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aWtPItNJt0nBMeetRrPmmjbxyGSVF9bGO0kIpyRp3SGnwaVSpsLKB5UIFjHEfbBA/03TYt+2QuWmECEG8jJsdtkYNjCQH7Yz0yJofoXWROQUjGyThHFBZg9x5bhopb+/Uv2n4Z1BMEXY/yrjVLpenwCxtZGjm68Z6m7EZqrwEts=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755685964; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UHE4xv6IMWn9xVuYe/yB5BmyxtdoVIMDD7/BwcD/9QY=; 
	b=mMbhjEyDw5wcmyZWq3YIRNEM42wf46sfs5Qe/r9jrG3dUJuqUoA8kZh0M/uIv1Wr1ezAf54WLVnX36L0P5e9mMkEcgWAtE8jU7d7r5OuUjdWynBRgkpjvnaM7mPxwBqPiqm6to7UbroaGJb/JQ//gHkQimF8YeAf+VLL3kVT5pc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755685964;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UHE4xv6IMWn9xVuYe/yB5BmyxtdoVIMDD7/BwcD/9QY=;
	b=GAiESyXkzIFmcFn5sOzZnfcvsq5I2Dtus47a5JDxac+sv8IopOguCtuS4zsbZrVp
	bURPLN896N/2/asKPJnqZJypBZMhLxwArh/pZDM7ibzFvz3zglC6Lx54nCvy3pylsP8
	HvPPyu9rYLrwiImNgpExvI7tcsVh4VJjXN0Yqk/I=
Received: by mx.zohomail.com with SMTPS id 175568596154683.63382003069205;
	Wed, 20 Aug 2025 03:32:41 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 2/2] media: dt-bindings: snps,dw-hdmi-rx.yaml: Updated maintainers entry
Date: Wed, 20 Aug 2025 13:30:59 +0300
Message-ID: <20250820103059.342850-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820103059.342850-1-dmitry.osipenko@collabora.com>
References: <20250820103059.342850-1-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Shreeya no longer works at Collabora, set Dmitry as maintainer of
the Synopsys HDMI RX binding.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
index 510e94e9ca3a..b7f6c87d0e06 100644
--- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
@@ -8,7 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Synopsys DesignWare HDMI RX Controller
 
 maintainers:
-  - Shreeya Patel <shreeya.patel@collabora.com>
+  - Dmitry Osipenko <dmitry.osipenko@collabora.com>
 
 description:
   Synopsys DesignWare HDMI Input Controller preset on RK3588 SoCs
-- 
2.50.1


