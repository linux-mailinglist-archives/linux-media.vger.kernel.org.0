Return-Path: <linux-media+bounces-26181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C2FA370BD
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 22:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C419B3ACC1D
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2025 21:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E761FC0FC;
	Sat, 15 Feb 2025 21:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="AEaq5FSn"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8179119CC39;
	Sat, 15 Feb 2025 21:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739653570; cv=pass; b=XfWvvAMvNmEFOL3rSK4Tm/cRWfz86C/lO8E6VM/aMNsd4F0G001EEMnuDUbUDVWivX14FM68bAT5YAXMZD3W8jTWdn4OV5peoXJmcqIMpxP76Bumh4WItO5UKSh5HprAxnBMyevJ4xN94OoAu+KTgoB5gk/CNQ9i8m9/BORsvpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739653570; c=relaxed/simple;
	bh=WxxWe/SRgjLbSzh+/BpmkeZlFI7ldA0Gj/w3eci1ER8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMKprjoEnV3DftWQq/6xEQfEzSRMDxlLQfw1o00PN4ShEUU+vrrNJ0qrEJ0KsnUjYaWW28RNTqAWwQj90WiboimJN+H4wT1bPjOcTtnoJPupEZeLihi9Gi3XmKoJO83kSsdiEyV4nKp1dTMioK5Cs/mTiO+oXH6M1NMe4TEqzzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=AEaq5FSn; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739653517; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QWrP/ZC1d8mTFvMH9RtFF3QyidBtyY5qrqzsI2DcLmT74IpueygYnhWJnYhFkoGUX4sXFBd5279m3rOcLuRHwf5H7AE6zCDnSnCqlsmRci1EBvVY4sFnpU9tIHRTuond07GzUPEHNBncf1NRn2M8z62/p/aYGRGu+IdoWJiFg3g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739653517; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/EEGxG3a0Mq8W+NTwKBGr/iFZzT32KAE3KrCrz4Dud0=; 
	b=Czcgob59KBUv60CB5IjYDFeN1z+cID5lzF4YGnmsy8qpdwhgAfk+NxfyT90C/vYUT9HOV6YwsZ6LzClrYPL5+iwIcb+vdTAfSWT3TDDHyaW6rAqHBGMcLxgDwb65EKyTVl0r2MHild2vNh6TQCdf8mmgJm+JzrH/y2qRnRYxR/k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739653517;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/EEGxG3a0Mq8W+NTwKBGr/iFZzT32KAE3KrCrz4Dud0=;
	b=AEaq5FSnGJ1jIyGTZQQORKZpbTtbQf+z+mHlrvRn9HPn5M/MmqN2VE3Eh4jn/zy6
	bfmRmUQrzhgfrKk4fKQvxaj53CuBA99xWjRH0E/XUi/bzpSWOzGc55BGcnXnHML7uef
	T2Rlqu3lKuM4s3wgCcwnxFvf8stjlOIgMrSt7RF4=
Received: by mx.zohomail.com with SMTPS id 1739653515821555.1433002311484;
	Sat, 15 Feb 2025 13:05:15 -0800 (PST)
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
Subject: [PATCH v6 1/6] MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
Date: Sun, 16 Feb 2025 00:04:12 +0300
Message-ID: <20250215210417.60074-2-dmitry.osipenko@collabora.com>
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

From: Shreeya Patel <shreeya.patel@collabora.com>

Add an entry for Synopsys DesignWare HDMI Receiver Controller
Driver.

Reviewed-by: Christopher Obbard <chris.obbard@collabora.com>
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..d73ddb317b11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22942,6 +22942,14 @@ F:	drivers/net/pcs/pcs-xpcs.c
 F:	drivers/net/pcs/pcs-xpcs.h
 F:	include/linux/pcs/pcs-xpcs.h
 
+SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER
+M:	Shreeya Patel <shreeya.patel@collabora.com>
+L:	linux-media@vger.kernel.org
+L:	kernel@collabora.com
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
+F:	drivers/media/platform/synopsys/hdmirx/*
+
 SYNOPSYS DESIGNWARE I2C DRIVER
 M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
-- 
2.48.1


