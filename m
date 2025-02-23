Return-Path: <linux-media+bounces-26717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6ABA410E4
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39839172A2D
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 18:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE30A18DF81;
	Sun, 23 Feb 2025 18:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="VGCj4Bjt"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9693F16CD33;
	Sun, 23 Feb 2025 18:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740335362; cv=pass; b=hIX2Hoo2cyMB8lrhpjtR+PHi2d+Lw0loX7Gj7WVumqJ7UC3C4y2fN8/zypZ74tv2yjNMBCltZLZvnSEZQHd4bTWQIGZaDpOtijc1m1rUxXAPHH4Ylngc8Yzl7/g7rao+nwsMi6/ZKp7r6Zcy6pUnqOSPl4Hprf1u/VKcxe0Zf1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740335362; c=relaxed/simple;
	bh=8F66nSttOlsQP03vnEfihLm5ICcMwT66a6odkCxM1MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AX92h8WACGbLUPyS7Z5bZ3RZgBsau8PfXU06d8DRhD9lffD2Xn40rreERHzmB3zD4fL+oEJAjE1jofDjsUYBgf6SW7Ca2pnkm1lQVnVAgQ+MMh7Emck/q4xUY4cTboDdUbKL7tTJu+IvEqi+UZLYKohfyM9Nnca+Sy/lo5D2kfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=VGCj4Bjt; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740335302; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=biT/I4H1u948hZNfzl5xa9iDupUKtD44INk4tZkatE4NH9QzClX+Yc80by+6DYrh63DuOShUatKAF++wpGtw5ik2ZGXT3RhlaJgxOa34EyJwa3MN4276sb1ekkY7NnW3tu5I7evED36KCz3U6Lwq0ZI1qRJiyg/wihVLIzdQhE0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740335302; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=v6XdBeWdF3ROCU+Lkd505Ci9024pYHmhBHgplZExxHU=; 
	b=ZfVRV3nJ8wY8RywQjUP5mk0bXBQHp0alPMUenqR9Ofceqp8PQkDKhFWbkUTwi1U0Wjyco5xs2mm9fsdyGMCAB+PJcC+yZjyYret17x7W3JGOlCv9BFxFHLuraSmkmgTMHBSNzujr2o+Q+QujftWHWFflx745dyWXqDZdQUh2P2U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740335302;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=v6XdBeWdF3ROCU+Lkd505Ci9024pYHmhBHgplZExxHU=;
	b=VGCj4BjtNMr+8gtlwBo2n/aNaYDswdmEoZvdectognH5EJki7TenX3VZGok7i4YO
	cnXqewKNqi9pyWu8W1YohZlcwWn3Yz1rVyL6ykjFASepSbWYAAADgzEnZBeWfyFAHOY
	PIG1+8OVetJjsYN1FJvOoQFpPa0+XmMfsan7i7QE=
Received: by mx.zohomail.com with SMTPS id 1740335299626319.34476851460374;
	Sun, 23 Feb 2025 10:28:19 -0800 (PST)
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
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v9 5/6] arm64: defconfig: Enable Synopsys HDMI receiver
Date: Sun, 23 Feb 2025 21:27:09 +0300
Message-ID: <20250223182710.314587-6-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250223182710.314587-1-dmitry.osipenko@collabora.com>
References: <20250223182710.314587-1-dmitry.osipenko@collabora.com>
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


