Return-Path: <linux-media+bounces-26185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E69AA370D1
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 22:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 138F73B1818
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 21:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18C01FC7F7;
	Sat, 15 Feb 2025 21:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="K6h45jE2"
X-Original-To: linux-media@vger.kernel.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A580F1F4192;
	Sat, 15 Feb 2025 21:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739653583; cv=pass; b=tLuUkhZbgPDIrI4o+JZo6UcJWnztnJymmVLFaXT81wgnYyQreVEBatIedlvLvuN+Sb3dWguTmibNuZWcmf+ky1bYQ5uXr2qguHz436sXNqnVotyboH9arAPdEi326vwFUsDhdkT3qiAQYlAVDN9saN7PwQfNS1fBTCb0+ie5Ghs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739653583; c=relaxed/simple;
	bh=8F66nSttOlsQP03vnEfihLm5ICcMwT66a6odkCxM1MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dV3wNBRlX7p6PZEW2PSzNl+04l59qtW/jW5wVUMFF/mQRZjKk/hVJ3DxEgFwo+82KkFNhAFzZDY9wHZPTnXqpZXNfR9qwHXSIQkv6wzqTeakodFVnb15QbTS9iD14z7Q2ArhQDmoMMeDTGBp6xIezk/pTN1xkXzYYaUVPtU3lGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=K6h45jE2; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739653537; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TK31rQlDQcvJ+gCBMtaFWixiwKEqNPhHfhwlShpcdPAHDdkfe6J8GlALL1XBsKUUxc1/aHxXmIbwtRxLDAY6Av6DjLl0Ajx/eVFtWW12WUT0h4RZB+8iRk7xSag6ab/SYnXJlqMuiQ+7iomoKVuHoRd66fw/SDB3gv6m0fDo2Qg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739653537; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v6XdBeWdF3ROCU+Lkd505Ci9024pYHmhBHgplZExxHU=; 
	b=ICBxfWfA0y6u/OzIVrqbedtr7Mx48wTz/G+WxpoGy5QzSrd3953WKDuWl3SFpgDM9uo+ExMmPzmywcwxF22YGh8kx6y9P7P1IkqXGcgzR/vsSAC9Hv9j+mMMVFsVLZv+fqWAxpGIQxvsD9nL8LY1AHt0vjXoZmHaHt3xN3ZAHZk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739653537;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=v6XdBeWdF3ROCU+Lkd505Ci9024pYHmhBHgplZExxHU=;
	b=K6h45jE2roxt0u1qD1BYZ4KQvs/SV93g1V1kVwg7Z/j/ObWaxMUVErytjlglHF3n
	WOEVIBwhiXdcSL6PFU0f9OI+Zr9gIwAp4sW9J/2H1KwcQ90yGOc3JnUvrjcc8dr6nMl
	IW6ZFjVGDFV1Pp66o9+62IhxoxcmtwTGV6gnta2o=
Received: by mx.zohomail.com with SMTPS id 1739653536055263.24103824599933;
	Sat, 15 Feb 2025 13:05:36 -0800 (PST)
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
Subject: [PATCH v6 5/6] arm64: defconfig: Enable Synopsys HDMI receiver
Date: Sun, 16 Feb 2025 00:04:16 +0300
Message-ID: <20250215210417.60074-6-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250215210417.60074-1-dmitry.osipenko@collabora.com>
References: <20250215210417.60074-1-dmitry.osipenko@collabora.com>
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


