Return-Path: <linux-media+bounces-26310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AF3A3A644
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 19:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36F5A1755D0
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 18:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADB1272911;
	Tue, 18 Feb 2025 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="TDVRJOHa"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A5F1F5844;
	Tue, 18 Feb 2025 18:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904580; cv=pass; b=V40hhiMQCfRaAzNDXKfH5DQEwVA+SOAYdh1Ari26tAqlYDZgWec+8F1vQijV9LHoA33vacfJICGaQgpGMn7me+vyQwcWb2rhNYJY6XEjdAKviohXozSeOd7HWV6HNyKMJwKE1y0K1owah28KGAZMeWFW+gHU+5dNYH9yQiyKcWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904580; c=relaxed/simple;
	bh=8F66nSttOlsQP03vnEfihLm5ICcMwT66a6odkCxM1MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fg59d8qItWyq2dzZ/4V3OuLas1R9a5QGBVTQzSpKnzxB4utL5rBFl40nw/0NZdjoSeYGPOp5spOntlmD4KpiWaq0PtxqhDUBf2et4fDLjQ8QVnMF+QwO0F0LsnK/am0YXk050+DcgUrXZKxfzcFX/kie++Aba2OWN/mxhCdA4q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=TDVRJOHa; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739904464; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mnHiR0SZkqITy+78cqwlZLGhArHWE2e2rjxdXGIE+S4MfQLxP7q9l50eeH6I7aCZYntXACoXPN2V0xRS7lNjaYVOUCH84IfD4Y78TTZcCbF9m1UmVgKRsL7xhtib8jUFA1UUzOQPMistPL48h7L+EkpQTBsMCoz6wwZSXi71y7Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739904464; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v6XdBeWdF3ROCU+Lkd505Ci9024pYHmhBHgplZExxHU=; 
	b=UXNPyCk1P7XNuelrus3JbF44sEA4rlXXckY8ZUKabpehiPjSTuKgDQm2UkNGCjU3YeE0L8lg14Fpk8lVLw1NCHcj9sSCxKfpT20Edb50z1i2A93TnanJ4+Ni7o6H85j1wmCfyoEBqb5p/xpTPnf+JGL29ZYc/Swv3Y0recnoVuQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739904464;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=v6XdBeWdF3ROCU+Lkd505Ci9024pYHmhBHgplZExxHU=;
	b=TDVRJOHaH1SUpi9mfeRBli/oEYZPfwWd035q40gTzjr4//yqsYlLNZ7WEJ95WhEK
	qWmxbrmFYqnuR30iUmmIQCZt80ubpodC+v3P93D50XGcpnP+qizxdivXCVS1pOrLlmN
	j5iyX1AAqGO4Ifw9HfDX3sf2JuHujgruibw4MWT8=
Received: by mx.zohomail.com with SMTPS id 1739904463582147.30821636385554;
	Tue, 18 Feb 2025 10:47:43 -0800 (PST)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Tim Surber <me@timsurber.de>
Subject: [PATCH v7 5/6] arm64: defconfig: Enable Synopsys HDMI receiver
Date: Tue, 18 Feb 2025 21:44:38 +0300
Message-ID: <20250218184439.28648-6-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218184439.28648-1-dmitry.osipenko@collabora.com>
References: <20250218184439.28648-1-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Sebastian Reichel <sebastian.reichel@collabora.com>

The Rockchip RK3588 has a built-in HDMI receiver block from
Synopsys. Let's enable the driver for it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..6ed1ad3c0055 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -859,6 +859,7 @@ CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
 CONFIG_VIDEO_SUN6I_CSI=m
+CONFIG_VIDEO_SYNOPSYS_HDMIRX=m
 CONFIG_VIDEO_TI_J721E_CSI2RX=m
 CONFIG_VIDEO_HANTRO=m
 CONFIG_VIDEO_IMX219=m
-- 
2.48.1


