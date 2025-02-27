Return-Path: <linux-media+bounces-27119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 887D2A47583
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 06:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D76D3B1DD5
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 05:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D639021CFEE;
	Thu, 27 Feb 2025 05:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Nk/AA9Mz"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A65021C189;
	Thu, 27 Feb 2025 05:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740635580; cv=pass; b=csLZHKVIwqK3ZZ5kL2qngYb127PfqzFZWIBzpQKQ/l/8c/oIJZKtRGA9DXEAXC+Werf+xAC+N5p3SAOLJ8osTMjScbfNHlupf7UpxN32IMonWotKLLBz0KR5570Z4ljsGbGFmtCKICmuxwjXAPPXU/9j/CoPQH+SGoG49oYofvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740635580; c=relaxed/simple;
	bh=8F66nSttOlsQP03vnEfihLm5ICcMwT66a6odkCxM1MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQ2sGhHMOrKa+oWaFR2kc2Z0xqXseHAtTocFaLQpFQPluit3ufMbO9kSaw8Bk6fWYrjgn7XneMHY1caW/18LnEmdWYYTbFzljNH72t5WCI33msA3rgLpljqlBgMJXZDgF4kgnqBbZKO7MOxr20C86nod1+T2Ia9Z+UxfQ72zfm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Nk/AA9Mz; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740635517; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YoQrY2jJXdi0enWYwfObzk+TuGIE90Pef0UhW0UTu7FXPYiqPclPUW11WifToXd5b0HizSq/ZfS/HigWWawqwxqI+PjWnY8EyEH2krGh647K48oenoDVS7PNSsVZQz9BsSU+RSnZKmZJKJhVIRgQ7UgmhnpjxaZytJwiWzMc+rA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740635517; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v6XdBeWdF3ROCU+Lkd505Ci9024pYHmhBHgplZExxHU=; 
	b=jGnLyROSPJZ6k++3w8Sp2hgp0l1uW5VcafAkjnKrF1sHzmf32Pxud7UByUGVP11ERIcqwZuLKWlhcHMYKJ5f2tlIzs3d4YQgWimkzy01BZwFC2DXtiNP3gH4RG7aSLviiZobugrpqx7w0O8dvsRcOIZZnOJa5GQy4MjdCTb3lPk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740635516;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=v6XdBeWdF3ROCU+Lkd505Ci9024pYHmhBHgplZExxHU=;
	b=Nk/AA9MzRtpTOmVJPIv6ZYeeM3VkX+OhI7nfUNdbi8/sSU3Udr/Lv1tY4CTioGaj
	qNMy543jC0YJ4otuSR2v60Hdvi3unr/2W3k6iUgYI0pFjl2vN1/Y0VE5owgTYWcqwBc
	VyZbC7iFF1dMcfxiOqHkkK9aGvhOLPdDOudDLSgM=
Received: by mx.zohomail.com with SMTPS id 174063551581345.48698581088945;
	Wed, 26 Feb 2025 21:51:55 -0800 (PST)
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
	Tim Surber <me@timsurber.de>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v12 6/6] arm64: defconfig: Enable Synopsys HDMI receiver
Date: Thu, 27 Feb 2025 08:50:25 +0300
Message-ID: <20250227055025.766018-7-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227055025.766018-1-dmitry.osipenko@collabora.com>
References: <20250227055025.766018-1-dmitry.osipenko@collabora.com>
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


