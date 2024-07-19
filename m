Return-Path: <linux-media+bounces-15149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0800F9377DC
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 14:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A39B91F2231B
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 12:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D5213DDCC;
	Fri, 19 Jul 2024 12:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="E+RzyYNS"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1BC2E419;
	Fri, 19 Jul 2024 12:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721392878; cv=none; b=oZJE4gqfVDomf7D3mG3P2K4mtc3f8S8OTd9j4H+Nh3hceqIDtDqdqPQoWO2wwJ/LcoA+di7tU3c4DjNjJ1l6JVP7MLxpevtYXjIYsqvux93raSqso5YRtKytlQ3lzI3V8h7yq4cU6Uc1uoQxFtJWc2dVuFOwgD6RcJYY97ysc0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721392878; c=relaxed/simple;
	bh=nSjpH+2FTX7vA0HzX+iLQciUFE/mclraJcSs9Fxc3hw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Uqi/GBBenD5sas32IBO3guiNym5OKruQr/mfBVWX/gMTgxsRKlEYmy/3u85oMjF66qhGEvHC9KspaJdT7FubiubaxJ36T0PRIaFok0hGuSQcE1JBX/j97eD4fQ0lJlK2T29lCjWIg/tKniJDLhxgFRotN/A/nm6tmixToltwlRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=E+RzyYNS; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721392875;
	bh=nSjpH+2FTX7vA0HzX+iLQciUFE/mclraJcSs9Fxc3hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E+RzyYNSCOTZZZQ57X8OclNBqrsJTYamXetE6ZNGZcTLodGsNqs0G06G7+Ox+BcJ3
	 ABofdmBAeSgafCU8TxLJk9oPwx72wWXH3SfE6IRsKiM99TyKJY87gHWyST892kUWOO
	 DdpvvM3C2VsDSG90vVho9EYKoyrLyUq6SeGTbo0J6T0o51DpXQrEs/g6yGW76WEfyA
	 WJB1vnHwv0th8ip98dxSM3408RKw391NJ3782NQwahQDDK68m/J1CBDrInElKAgS3k
	 PbM/Kvnxbr/uchPeC3rvPLGz4+pzIrJvQrns3dQOWNvRk2vnFoyr5zcS3u1eXQkebO
	 SD6HMhdy6thBQ==
Received: from shreeya.shreeya (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: shreeya)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F195B37821B5;
	Fri, 19 Jul 2024 12:41:10 +0000 (UTC)
From: Shreeya Patel <shreeya.patel@collabora.com>
To: heiko@sntech.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	hverkuil@xs4all.nl,
	hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Shreeya Patel <shreeya.patel@collabora.com>
Subject: [PATCH v4 1/4] MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
Date: Fri, 19 Jul 2024 18:10:29 +0530
Message-Id: <20240719124032.26852-2-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240719124032.26852-1-shreeya.patel@collabora.com>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for Synopsys DesignWare HDMI Receiver Controller
Driver.

Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
---

Changes in v4 :-
  - No change

Changes in v3 :-
  - No change

Changes in v2 :-
  - Add a patch for MAINTAINERS file changes

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1c87b471941c..0f0e1d58abff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22138,6 +22138,14 @@ F:	drivers/net/pcs/pcs-xpcs.c
 F:	drivers/net/pcs/pcs-xpcs.h
 F:	include/linux/pcs/pcs-xpcs.h
 
+SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER
+M:	Shreeya Patel <shreeya.patel@collabora.com
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
2.39.2


