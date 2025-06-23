Return-Path: <linux-media+bounces-35678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B466AE4A7B
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 18:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAB6C188DB02
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FE62D2383;
	Mon, 23 Jun 2025 16:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oNoRSzib"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D448D29C337;
	Mon, 23 Jun 2025 16:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694892; cv=none; b=tFCieP7PxPJbErTegVcFmcaPoCEZ7m/ibArEJMmnBxxktzbUzZcG17jCWEyb7kfeUZY1Eo1A7eNQw9QIpt/k7x0PHeQHkY6KJIWSK4HcJDiZ6WgNmqRbMxV4CaeWEBEZCMAOdkpXXF+xAXe26U6V17Xsc2YUy3BKixsZK+WMRLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694892; c=relaxed/simple;
	bh=xDvkLdk8hMUQqSvQi1R6ZixD6fEY6eb3RFzWM6baH4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pLRwlEM0Un5dKtadAcOsqZMzR1eCd59vpbnnNZvlTTFrXBIPzmaM4GIsh2TrMiTeqz2M86sdiQCuIyOdSQYmeGU6cmBpUUdd7Da3zWqnbTayltE/J5b03pu57bvki8zt+BwWLoOGKjy024IJGGJis3NdZoJeN6r7NsbEyM2PwzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oNoRSzib; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750694889;
	bh=xDvkLdk8hMUQqSvQi1R6ZixD6fEY6eb3RFzWM6baH4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oNoRSzib+zbMQPDZnMpSIymSkOk5vbP2+kE4B+QLlBlmB2nWX22ZzU2G76VfViNKM
	 KQJ8IqahXEvsP4i4F3Wgg0hhMmsLKQtQzi/J5AAvVMTkXrOctj1vFrokZQY2mBtfIb
	 9hGF32pz7VLt4p2bqpWF+/LnSNOEucTIFkoRlqonHewBS9WrtFUSeDSo7xmD96nDUd
	 Hu69tPCHe3pdg9fG1XeHaj+npraAnyGCeOVqPtExWSUZW5gzxrsKx+cHAv7bqqYzWS
	 z06/VySIHr7ETpczvNE3H8MYUnUMZwiYW4SjVUg0OemLCd+KgyvRZ5pwvbMd2fJHpg
	 NC4tNIyZb9CjA==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E065E17E3700;
	Mon, 23 Jun 2025 18:08:05 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 7/8] media: rkvdec: Remove TODO file
Date: Mon, 23 Jun 2025 12:07:21 -0400
Message-ID: <20250623160722.55938-8-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623160722.55938-1-detlev.casanova@collabora.com>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

2 items are present in the TODO file:
 - HEVC support
 - Evaluate adding helper for rkvdec_request_validate

Missing HEVC support is not a reason for a driver to be in staging,
support for different features of the hardware can be added in drivers
in the main tree.

The rkvdec_request_validate function was simplified in
commit 54676d5f5630 ("media: rkvdec: Do not require all controls to be present in every request")
by not setting controls that have not changed.
As it now basically just calls vb2_request_validate(), there is no need
for a helper.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/staging/media/rkvdec/TODO | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 drivers/staging/media/rkvdec/TODO

diff --git a/drivers/staging/media/rkvdec/TODO b/drivers/staging/media/rkvdec/TODO
deleted file mode 100644
index 2c0779383276e..0000000000000
--- a/drivers/staging/media/rkvdec/TODO
+++ /dev/null
@@ -1,11 +0,0 @@
-* Support for HEVC is planned for this driver.
-
-  Given the V4L controls for that CODEC will be part of
-  the uABI, it will be required to have the driver in staging.
-
-  For this reason, we are keeping this driver in staging for now.
-
-* Evaluate introducing a helper to consolidate duplicated
-  code in rkvdec_request_validate and cedrus_request_validate.
-  The helper needs to the driver private data associated with
-  the videobuf2 queue, from a media request.
-- 
2.50.0


