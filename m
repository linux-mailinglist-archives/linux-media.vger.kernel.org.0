Return-Path: <linux-media+bounces-15442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9961093F388
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 13:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 528C5281524
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 11:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937171459E6;
	Mon, 29 Jul 2024 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hTq6Llmt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B40145330;
	Mon, 29 Jul 2024 11:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722251095; cv=none; b=GokZvqbssqXKxW6I4zFsLKqrlzO869UkJhUjffnG+DB6dueIl1PlcjBs/1Xzs8ZH+EUQUy1JjqsOMqYkNNGQ0FB7HaPeMvXaKFlgL2Iw9EYh+P573k7m5C8736neE/gjolWTDgHtrvQ0+r2rkEKnyVpzgs7BAfJLczQXNVF+tzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722251095; c=relaxed/simple;
	bh=vCTnby+eSIVqYW3W/63JaNKMfr69tywndCVyZSA1SVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I7IhOQCYgRO8lPM7F9ivuckSiIxu2cSJBgE81rsJ/w06aB2/2pHktejJosa8YEuPs31Q4RAciF2dFapGU4Ji5KfESE0HvHVzo0/4bdBiaWLDTqOWK0FSCtqgrX8KV3pl/ve+K2Ed3EjmF/tujFLkZA2OVN6F87ARvrgYLnpgu2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hTq6Llmt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (unknown [IPv6:2405:201:2015:f873:55f8:639e:8e9f:12ec])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 17CB745A;
	Mon, 29 Jul 2024 13:04:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722251046;
	bh=vCTnby+eSIVqYW3W/63JaNKMfr69tywndCVyZSA1SVs=;
	h=From:To:Cc:Subject:Date:From;
	b=hTq6LlmtICxa/WlqX6/E8fbBBQh95mAdrmG/AlaiLIeMnOmlW79Zg5bZ3TvZNhxaF
	 yq8powpfyg6X8Wk5+DFpcG06zVLYNWnbow3Y7O6rHjrsU8UuIh+GG3Ky9qZRhoA2Mf
	 zr84ySp9Zz03xObgqAmKiHcSSkGgFuwAUrDjmRV8=
From: Umang Jain <umang.jain@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: stable@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH v2 0/2] media: imx335: Fix reset-gpio handling
Date: Mon, 29 Jul 2024 16:34:35 +0530
Message-ID: <20240729110437.199428-1-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These couple of patches intends to fix the reset-gpio handling
for imx335 driver.

Patch 1/2 mentions reset-gpio polarity in DT binding example.
It is ACTIVE_LOW according to the data sheet.

Patch 2/2 fixes the logical value of reset-gpio during
power-on/power-off sequence.

--
Changes in v2:
- Also include reset-gpio polarity, mention in DT binding
- Add Fixes tag in 2/2
- Set the reset line to high during init time in 2/2

Link to v1:
https://lore.kernel.org/linux-media/tyo5etjwsfznuk6vzwqmcphbu4pz4lskrg3fjieojq5qc3mg6s@6jbwavmapwmf/T/#m189ccfa77ddceda6c3b29be3306f1a27ed0934d6

Umang Jain (2):
  dt-bindings: imx335: Mention reset-gpio polarity
  media: imx335: Fix reset-gpio handling

 .../devicetree/bindings/media/i2c/sony,imx335.yaml        | 2 ++
 drivers/media/i2c/imx335.c                                | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.45.0


