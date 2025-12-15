Return-Path: <linux-media+bounces-48806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82393CBE0C7
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 14:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD3C93060F0C
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 13:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB273164C2;
	Mon, 15 Dec 2025 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JKkvN60j"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865E431329B;
	Mon, 15 Dec 2025 13:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765804839; cv=none; b=qqH9aEsmo3X08/cGUUtdhiFLyHyizdXA27GlxsLEpUKZT+XsYCALnKezwH7UFXLPnUQ+vK7t3n0WKuYZlwtSfRupqFxOTY96HxI3dX/3HNDYV2Tmo9U0IQwEai6ob7qDnusJSnS4nSNKcb+V2wkA+UbIPLsLCPa6AVh6hgqk8T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765804839; c=relaxed/simple;
	bh=3f8P051Kwqfh3Rw8bHrdgnkSchtDA0pl/SLGM1fl5KQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KX+R6VhItwWhkKP+JyAENgkWTf6RCI27vegg4yZYmeByNfJbIzVU6uGgQ22K2TqBJ10Ny7DBpTWV8EAKYfV36wQj3Gc+hC4pz3TDyXOhOzY1BWT+HbScBSDp2BZRaq8INYcFh7jIBNRXUclQMAemj+iqIrKROkNnjfw4TiW4FZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JKkvN60j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-49-39.net.vodafone.it [5.90.49.39])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7318C66;
	Mon, 15 Dec 2025 14:20:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765804825;
	bh=3f8P051Kwqfh3Rw8bHrdgnkSchtDA0pl/SLGM1fl5KQ=;
	h=From:Subject:Date:To:Cc:From;
	b=JKkvN60jdOCvsPk6XqqvB6AizFOZIEv8CKIxsRqG5j92bCohu3h3RxyIfp3wuGK+C
	 ugjp3J4Se9FyVkil3QbUoSA4RxojPfDVq/nouM5NvwOnsenqsE6OnTtV3vcviUdx5C
	 8FQr2dSmtM9rC7FwohbbuB29i2TrI21Q1kokcax4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 0/3] media: mali-c55: Update uAPI headers for v6.19-rc1
Date: Mon, 15 Dec 2025 14:20:20 +0100
Message-Id: <20251215-mali-c55-header-update-for-v6-19-rc1-v1-0-69f56dee3c71@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABQLQGkC/x3NQQrCQAxG4auUrP1hMjJavYq4iDOpDWhb0lqE0
 rs7uPw27200q5vOdG02cl1ttnGo4ENDuZfhqbBSTTHExJET3vIy5JTQqxR1fKYii6IbHesJfIF
 nBnN7bIOE/DgL1dTk2tn3v7nd9/0HryyzdnYAAAA=
X-Change-ID: 20251215-mali-c55-header-update-for-v6-19-rc1-118380a0cb7a
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=3f8P051Kwqfh3Rw8bHrdgnkSchtDA0pl/SLGM1fl5KQ=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBpQAscfgk2ssj9UYEN7vbk5JS/QOWfv9PBW//96
 obk2CCGgLCJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaUALHAAKCRByNAaPFqFW
 PMTgD/43e0X+ynLviVysTskXePFvEj46UTKm1kVNmez8cogscE50icui7SuRaOYOQcQHvfx5EBv
 2JRHJrExfLCAbmA1j6aYUvmsO0efFBjOoEsehdzzIzDM3vO0lfYsjDnoTSUJjv6okF2jshA6Z8L
 G2tCv7RiHvbzgCFw7QPqoTZHd8fdYEP4ubqvxutd/7jQobl0W5bhqEpg+UashA3Rg1ytoMFmbV+
 N7tSuhdCj32/Y/2GDyI+KQ/EBUuE7POu0UHKB03DTZiyUjCV+xrjxKn9g4e0WPT4tj6T0+HePYk
 9Ykd/mAxCO6jrFauev5WfLh0pNwaRJSZbbx4HnB2jp5Fr1OKHyJDMbojnve0CmTchnBVS5a4a+M
 wCdFMQDbFh8Tl6k7sJbuB6lnoggwIwhKJBLMX+Hkm0Ve3wMxsV0KfRWtdTp9+uCUa2dawnAL6U7
 mIWubNTyHr5km7Dg2cuVIJrc4X+2GnH10FM71BoXOFds88GzWwjsdLX07WE5tOVCOJC5EgUrJZ3
 sRXnQXnUInA38T2/JeYCdawMpvGTP98FlVi1l5mC1+DZ/va3hRGhUp9uQaU9n4olKep7dqCceoa
 79XB9afo2bhG7RPO9UDZ4Fa8z0iE0yMaOmcFG6PXe8PiXefXcqqLTN1T911VpAuoIY3GHL+iOWX
 kxdS4Ae+NZtz7iw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The Mali C55 uAPI header has been accepted in the v6.19 merge window
with the definition of the MALI_C55_PARAM_BUFFER_V1 versioning number.

However, the driver uses the v4l2-isp framework, which defines its own
versioning symbols.

Remove the Mali C55 specific version identifiers and use the one defined
by the v4l2-isp framework.

Mauro, Hans: could you collect this for your next pull requests to Linus
for v6.19 please ?

Thanks
  j

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Jacopo Mondi (3):
      Documentation: media: mali-c55: Use v4l2-isp version identifier
      media: mali-c55: Remove duplicated version check
      uapi: media: mali-c55-config: Remove version identifier

 Documentation/userspace-api/media/v4l/metafmt-arm-mali-c55.rst | 2 +-
 drivers/media/platform/arm/mali-c55/mali-c55-params.c          | 7 -------
 include/uapi/linux/media/arm/mali-c55-config.h                 | 9 ---------
 3 files changed, 1 insertion(+), 17 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251215-mali-c55-header-update-for-v6-19-rc1-118380a0cb7a

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


