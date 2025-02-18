Return-Path: <linux-media+bounces-26306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4954BA3A60C
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 19:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91F233B1A55
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 18:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0EC1EB5F5;
	Tue, 18 Feb 2025 18:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Vht+SBE1"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C261C1ACEB0;
	Tue, 18 Feb 2025 18:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904496; cv=pass; b=BuybBi//Fx0kcvaXViOeWKvsyvty2BTkEopEchGvD5CFG1C56di7byeo02Z1DQHdOjrccJqoyzEbLuAnLVlwOVcmPn8yXRfnt36HkfUrtWoHirnty1tUy/0UFEWefg7kK/faUH/GuDY1gbtRvrvWSVNH2dJEtk98h0daH2n5C0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904496; c=relaxed/simple;
	bh=WxxWe/SRgjLbSzh+/BpmkeZlFI7ldA0Gj/w3eci1ER8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=piXBruJ3RrWzXl5CHYrOMWES70f1INu87xdDt3eT9syI22jjO8wE2dVKCRwkUgB6DjfsNKVJDYESOMRjVHJ7N6xQYPX7GLkjVyQy2iYFoz9A2PpYAAX3lkH/bTtwkDUsssmQUADGLuQA3ddCXarqp9NdFIoJC2veKiUt8Uysbqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Vht+SBE1; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739904446; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RN74za/4lskP274Ucw0gMqVYpcBxnFDgLVHKc1oXFVq/MBhC4ElkJaGzWums0WqWyQa/Igo0HljG80oS/y+RbGM3Qr4d204NFCsITHzl1a/UK3DnRkgGMSKYxIZvdXgLLOJAsk2ZtmwmvhBOKnhLkkenjo7AL33ED69Q4nPghwE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739904446; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/EEGxG3a0Mq8W+NTwKBGr/iFZzT32KAE3KrCrz4Dud0=; 
	b=YDFMxW+++axipzrlxn8r11uXORogk3CI1hRhLKF02dxFCHZg1idc/LxkZFJmFVhLNVPhPTt0TmLchsA9I9Ts5BY03J5nb2L6oId45kxfitr9yf30CRcAQHgQ7xH/N7VAdYPkxHzDctcTwLG9oAOET9TIHWgNllAaOwlGi+IuwJw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739904446;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/EEGxG3a0Mq8W+NTwKBGr/iFZzT32KAE3KrCrz4Dud0=;
	b=Vht+SBE1hy8yaapcnywCwDGqYeOkCf4ykAUDfUEoKO9aPPBnc7ZOC7NZsMlzrbup
	q02muUi8DCSps8ueYEZXw99vD/WdCAh3ZK1FbiSU+WFeqnIfi54ODJmnyiCVAnaCK4C
	NxrY1qUG4JVqs3vp35qquGPk7GmBP0GkrMSssVvM=
Received: by mx.zohomail.com with SMTPS id 1739904444113537.1827373653718;
	Tue, 18 Feb 2025 10:47:24 -0800 (PST)
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
Subject: [PATCH v7 1/6] MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
Date: Tue, 18 Feb 2025 21:44:34 +0300
Message-ID: <20250218184439.28648-2-dmitry.osipenko@collabora.com>
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


