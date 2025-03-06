Return-Path: <linux-media+bounces-27678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DECBA543C0
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 08:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7449C170598
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 07:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A201FCCE5;
	Thu,  6 Mar 2025 07:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="GnP20AHn"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4E21DF97E;
	Thu,  6 Mar 2025 07:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741246202; cv=pass; b=COvHTWMrMJSBzS5jInUNLN2N+WS0tOGYwZ7Gaex8CuCVGNxODS7QwuDlWahPF59k+PDyTxWlIzb4iMELyhVyLsYfkLlbLvPYgCoH3ysAerTM5/jDvRU+zoQoQdf7lbXuYmgrjZj0mro+4elrezae40qT08XXrYZbgwNdGe36VZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741246202; c=relaxed/simple;
	bh=7LPbExDWyowlZ0Qkzu0B8AZ6SrMtlvAg1HWrlw1qvDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iGiRwXyQD2XOrnYzbRSXx9NFGfYk54fDr/7BprPCxOEmArejh5f5pUCHHhFOzeJwuR6wWnPn1TqyyklYDcRQsMXOmdmtnzIKEEll+EzY2ygAQjiHsBQrBJSh7+SvY4b3L3nHXnN/sHNXXZhswMWnoNNeZ2mmN6Zyxbw7VJHeTUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=GnP20AHn; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741246158; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S6RPMVYmy/Qw9F6UGyDXSs/VMOOB/K+eF2TOecjgEf0Qk7Ups7EeAjSZ4JbCgBnUEob4vkz4rIyz+uiIdinO4pEIg7R1yNlRmyXtXuG1VSEFlJ2OjhkSwjdfWbpaP4A0APJXu0AkCwKHgnsvcYX5AF+PEsXN75h1rSf6BFR/eB8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741246158; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iI9QyKLTcC52KVJngweEmRM9LcClnJU3duGST99I7gM=; 
	b=TosL55wKSQxg4oAlbVSh46gsp/BnEqQbC8REx9BQDsze7hu/vmrU4/iXccTsRr9B6rSLfgBPaj7ZRueaxowTifvMH3bzUPe27pe7fmD4XPNGATdo81I0zM3CAOtMWsN/RJLp+6SluNFz7F1MntrAf64ADD0PjuQ+hyju8BZQAKc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741246158;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=iI9QyKLTcC52KVJngweEmRM9LcClnJU3duGST99I7gM=;
	b=GnP20AHnYP+YMkKJdagDWx1uwzLhRmiXWWkFVk8xIZPoUxCH9hOIUHxvn0SJEO1G
	2Kt8J0pjrhBYYkNOdZ6NKtt2M4ihv7R/g1MgjWi5BKwmPI99D1Sd+AMRT0fRU4rvnAv
	HquINqF/6L7ygDwKkPIN1uW3S6g0uGZzUsnelBmw=
Received: by mx.zohomail.com with SMTPS id 1741246156773280.09310322361534;
	Wed, 5 Mar 2025 23:29:16 -0800 (PST)
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
Subject: [PATCH v14 3/3] arm64: defconfig: Enable Synopsys HDMI receiver
Date: Thu,  6 Mar 2025 10:28:42 +0300
Message-ID: <20250306072842.287142-4-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306072842.287142-1-dmitry.osipenko@collabora.com>
References: <20250306072842.287142-1-dmitry.osipenko@collabora.com>
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

Acked-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..3dccc9e1c4aa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -859,6 +859,8 @@ CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
 CONFIG_VIDEO_SUN6I_CSI=m
+CONFIG_VIDEO_SYNOPSYS_HDMIRX=m
+CONFIG_VIDEO_SYNOPSYS_HDMIRX_LOAD_DEFAULT_EDID=y
 CONFIG_VIDEO_TI_J721E_CSI2RX=m
 CONFIG_VIDEO_HANTRO=m
 CONFIG_VIDEO_IMX219=m
-- 
2.48.1


