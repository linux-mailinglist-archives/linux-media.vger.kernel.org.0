Return-Path: <linux-media+bounces-23084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F5B9EBA3C
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 20:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00CBF164B8D
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 19:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC5C226867;
	Tue, 10 Dec 2024 19:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EAJpdy7Z"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC25214229;
	Tue, 10 Dec 2024 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733859643; cv=none; b=IpRQfWxbf3v/+CnQWscQ1dCLkrDrKdWTvM/LKIgYL0sQtSgLaBwpx+8oUGPhVX56SDMSmP4pGTWAojBGW1dbRtuIG4vN4hIVuRvT9QVxWzQ1G/2qPaw0wqjJL/rY3AKSEE7ZNoc8ge8H4z8CebnSbgmC1OcGys3pAqXWifWAShs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733859643; c=relaxed/simple;
	bh=/4RZbyvnAxjSwIetXPV5ahVyR7xjhkpwwsXpSPAIkEE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q7+QDy6Ayi0+HEUl3UWb7QTRFIleM1JCSM6rVJvSHPIR++1aPK/ZG1oUEW+aDLKLOpb5JZwBgIs45kpVXSxo3DN/Uy0kMXGyBOGLTSvGvHOweqkGCrf83lQAc0VT9tJyuKYTqxKmxGKpg8sMwdpat+AUEnp+D5SwDf/+EMjz2X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EAJpdy7Z; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733859639;
	bh=/4RZbyvnAxjSwIetXPV5ahVyR7xjhkpwwsXpSPAIkEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EAJpdy7ZKyFsUzWj4TqXBOoMD73civK+JSFUj41MBVuJE3TACUTpcmKpRktQNmdmU
	 xcvYDsbKVgcLi8fJryVvf6XsA5MM4OjzBNzbXXG4eXghNRw6oLwV5ow1uDVkwgEqPc
	 pQjE9935rxiSJYqRDUIQSv0r8LGvz+s3GoUK0kQf49CY8t4qcXquiyZHVNiKJricY3
	 TVBO66JobiEdc2hTJdjsBCUkhZQIBseaSEHPxsFlEQm9gO+81Jk35RO+54nO72Vbyn
	 2tsHlSaMNPoqZQRbgeFz/nrEEQzAqjupVeekOQ7XUGH6OBSbm5PnyMP+aqIMvImVYs
	 AbCTgdzZgYzyg==
Received: from shreeya.shreeya (unknown [110.226.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: shreeya)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 317F917E37EB;
	Tue, 10 Dec 2024 20:40:10 +0100 (CET)
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
	shreeya.patel@collabora.com,
	dmitry.osipenko@collabora.com,
	Christopher Obbard <chris.obbard@collabora.com>
Subject: [RESEND PATCH v5 1/4] MAINTAINERS: Add entry for Synopsys DesignWare HDMI RX Driver
Date: Wed, 11 Dec 2024 01:09:01 +0530
Message-Id: <20241210193904.883225-2-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210193904.883225-1-shreeya.patel@collabora.com>
References: <20241210193904.883225-1-shreeya.patel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for Synopsys DesignWare HDMI Receiver Controller
Driver.

Reviewed-by: Christopher Obbard <chris.obbard@collabora.com>
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
---

Changes in v5 :-
- Added a missing closing bracket for the email

Changes in v4 :-
- No change

Changes in v3 :-
- No change

Changes in v2 :-
- Add a patch for MAINTAINERS file changes

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7700208f6ccf..3960c3ca1849 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22768,6 +22768,14 @@ F:	drivers/net/pcs/pcs-xpcs.c
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
2.39.2


