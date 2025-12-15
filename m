Return-Path: <linux-media+bounces-48769-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 146E9CBCEA2
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 09:06:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B7EE3021E6E
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F211132B9B9;
	Mon, 15 Dec 2025 08:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJlq8Ycg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691DF32AABF
	for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 08:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765785608; cv=none; b=IUk8uLQZUkzUxXtzeRMWJ4pmTBqVk/8mNdS0DxAIjq77OohFg50uIpVcumA+Lxl5T2P2Q25Y/eneg0R44dTWo4Era/NgcGdnSQlMPNy/mjgXzLBN+XCewkwXb8giWGCjC73B94hYW4bE/iSYoEj9JZShB+lT3OGIODuUdykS2mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765785608; c=relaxed/simple;
	bh=HPtm98uKiMslXOH21fQlQh3p66ZVT1qfIbtBz84LhxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3kIrQ7cpODeQyJj8a1jyKTUWdsri/08j/clbf5oxXmObG2k25fH3B/Uzjb8331tU8DZcMB864oIOllyeAW/1TAaK3r1vhmdQfJz9kL3eB3crH7r47P5/NJlvJe+lM3maNEk+xW2IskxB8A+fg0ue19gg5wx807q1c+w4wQeaM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJlq8Ycg; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0b4320665so16027305ad.1
        for <linux-media@vger.kernel.org>; Mon, 15 Dec 2025 00:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765785606; x=1766390406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mn+zeiFRKpp0z4XzuVGxMSjaFqAtsY1VIsxWUC+ubCI=;
        b=hJlq8YcgwhVul+Od3n3QEU1EID2gYQG4bIuogMDswZe6MO3UC0XbHEdUxK4Oov/m6Z
         E+oFFI/Q6rXwXqXEcJjLTBbkOrMsNycGNkbQvsn135NLLLsCZV0KIT1sVSRADORAaLmU
         NKtchW+CjZFoh4HvJT3b4PiKdYgkjCrOwgbhaDMFpMRQmJTRJ30FTXC6Kgu3t8qgOTiu
         cPOTCCjJ58Y2N8ZWoMcCGwTB2skRWUogiLyQruUABGgsCrX2GdNtsrKEJz0G5Dp0pg1/
         R49cWPha7BCbt/BLpzNtsJcGFMi79ieDQhkKsB9Dhg1VgEU6nfSCqu+lPNxRjZ+WpiSO
         rm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765785606; x=1766390406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mn+zeiFRKpp0z4XzuVGxMSjaFqAtsY1VIsxWUC+ubCI=;
        b=m5w2NcWD/wfTrEV3XBJipOiJ+H/xgdeGxOZbGciAnX0eZlNBJM/T3WiaCF0CwUw9xr
         /05U+u71V0RIYS6eUkZxiucSRhFoe9lF7eSenanna+Nk46vgZPfHAujRFnvmOf8vBNVO
         2w8pxx5ge10EtPsUKdYbbmNSVPVK9Ayfa03cH9Y9B6tL4Q4sRmcM3VdADJabjmen0enN
         OHIMQAujBMn2vcfzgRBMp6tnjUrRnazt3meKSE/87qcgRTkCJ/VEJ9K+qsKDeWUWETZM
         3SRnTTpZ/lUigYxXE8dfglyF5Y4RYlOJtELy1nWYF3e19g4aC53sUmIlwgIZI1nCJ3AG
         Nq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZ7chWmwjSkHYhF3a0LRKNqfafs2JDzv0fI/nlXT3UnKJ8dXDfCod1LtchKFtaYOxkl2UJDHmLLCLefg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDCgCOksKGZ9tccCP5XhH6+3nPRzyRWKIPsFCRQW0jwJMmo2A6
	Dkb8wo0XqOziHQ+Apf+SX9NQBzscuO0P9LvfnabJbm84/4qIaHCHlGTe+cWOwoq3
X-Gm-Gg: AY/fxX6fhdBIC457IDEM8HkLuPY/M4FwBQS9lqSZKs7neLtJ1x9heLLiULQt4k0uAau
	IiBaSwpalC8WuKup3NQWOzdXH75SnlE2RnEVaPOkkNQJHj7OiAM7t4L+ZJLNXIho2yvBAwOHDuA
	cUCNXt1MQdhz4FvsHzCvP1Xu2ZLKmlUosEeHNsHfvv/PAHXHECwpTTQZpaQRHVVWypRd+/3DHgy
	ix++fQJ/uobje4SLZ8ThKUzQl36CyitzilGO7+bBAZgOGTaP4JfRoRmGjp9Bnk8yQmMVAbzMAoa
	Q5lQpRXlZCsmMdXYhuMcSUn+0UPIP7JU6HLKq97tH8CjPaDMik/Sx2f301vqJlNi0mWGAQlolZt
	xObIP3m9zYFJaBf+BBQTy/4zBfbE/qq4ZBWg3qnSQ4njuuezMs/BAzXe0D6vY02P4BOphDBcDNJ
	EXVlK6LOa1g9M=
X-Google-Smtp-Source: AGHT+IEq2Sf+p9p2X7o3MuL0JatpUn4zPBXWnM3wP3V5EAP3Px6RiLHWn2wyvNZb/sW0cyMzORYkFQ==
X-Received: by 2002:a05:7022:ec4:b0:11b:a8e3:8468 with SMTP id a92af1059eb24-11f34c30240mr7883689c88.33.1765785605501;
        Mon, 15 Dec 2025 00:00:05 -0800 (PST)
Received: from fedora ([172.59.162.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff624sm43637473c88.12.2025.12.15.00.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:00:05 -0800 (PST)
From: Alex Tran <alex.t.tran@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alex Tran <alex.t.tran@gmail.com>
Subject: [PATCH v2 3/4] media: platform: ti: omap3isp: isp: read crc configuration from device tree for CCP2
Date: Sun, 14 Dec 2025 23:58:34 -0800
Message-ID: <8b91902b1aea867a67aa5679710812650fa2987a.1765782992.git.alex.t.tran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1765782992.git.alex.t.tran@gmail.com>
References: <cover.1765782992.git.alex.t.tran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow CCP2 receiver to read the crc configuration from the device tree.
Default value of 1 is used to maintain backward compatibility with
existing device trees that don't specify the crc property.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 drivers/media/platform/ti/omap3isp/isp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index 8ac2bdcdf..cd10589ed 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -2102,7 +2102,10 @@ static void isp_parse_of_csi1_endpoint(struct device *dev,
 	buscfg->bus.ccp2.ccp2_mode = vep->bus_type == V4L2_MBUS_CCP2;
 	buscfg->bus.ccp2.vp_clk_pol = 1;
 
-	buscfg->bus.ccp2.crc = 1;
+	u32 use_crc = 1;
+
+	fwnode_property_read_u32(vep->base.local_fwnode, "crc", &use_crc);
+	buscfg->bus.ccp2.crc = use_crc;
 }
 
 static struct {
-- 
2.51.0


