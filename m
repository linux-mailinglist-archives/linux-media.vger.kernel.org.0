Return-Path: <linux-media+bounces-35617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A0BAE3DAF
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41B231896427
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 11:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D8223E331;
	Mon, 23 Jun 2025 11:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ishjNmrC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC021F2BAD
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 11:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676999; cv=none; b=q3KEmtJK/UCEpFTElkJTbrYOGjUQ0opA989RBwGX986mfb/RSBUtshYBbdYCFdKxjZLc818pipAUMdBcpT6I3XGaHMrA0GZ3V3n4j8114N1WiRANx7lI6w26PdJy23RI13+V+iZFp62v03vamXy2m5HYOGR4mvTVwQsLWov4P0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676999; c=relaxed/simple;
	bh=mSBAhJxeu89XLNBchwkzYP5thhZmRPWWyIbxx8w1Ioo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXDIrCqFyi5E7ToskFeTbkq4MTUSlJctQOA6sDd1ryqJWR/79PnBgDdQB61Aq75tgmpSzXk6gadX+QY4nwu9yD1c4XTBhw7ntD9pU8QeI5FMaY1aB4n6Gqwi97OOXywR16BAXYm3b+6N88NrlkqApZ4388BwOquVfYDwy8H+3bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ishjNmrC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F54AC4CEEA;
	Mon, 23 Jun 2025 11:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750676998;
	bh=mSBAhJxeu89XLNBchwkzYP5thhZmRPWWyIbxx8w1Ioo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ishjNmrChqroChkYNdNUoZ0WOG+omdYL7V4RpybmK9bJnKiIacvWbuuH7BQlYExg1
	 CXfuuCCTCUl7KQQkiUmZf3u3le9CCrGjAxiK0Lt5zxWxSo9+sm19dnWd5jFqz2IDxe
	 p6yXWiDM1sOb6W5a+vluslKsexNJQllI6EivclnfWp7Z4Xw/3ryltMakTs4nsv1aZA
	 yqvktAY7qZIY32HG36+4EgfnnKx9JkZW5AKjg5fLftjhgO50Lk/Fx3t3MBxNzs/rJZ
	 LAlT3WaGtA9zDDeoeyKb3801fb/v5T9Ap8XEjZEiOcOjwqbF6lVoAZTa24VqfUO9pP
	 xpU6KRtcT+qFg==
From: Hans de Goede <hansg@kernel.org>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] media: ipu-bridge: Add Onsemi MT9M114 HID to list of supported sensors
Date: Mon, 23 Jun 2025 13:09:51 +0200
Message-ID: <20250623110951.18649-3-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623110951.18649-1-hansg@kernel.org>
References: <20250623110951.18649-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

Add INT33F0 ACPI HID for the Onsemi MT9M114 sensor to the list of supported
sensors. This sensor is found on the Asus T100TA using this HID.

Tested-by: Hans de Goede <hdegoede@redhat.com> # Asus T100TA with MT9M114
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index b0f65aa220f9..4e579352ab2c 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -58,6 +58,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT0310", 1, 55692000),
 	/* Omnivision OV5693 */
 	IPU_SENSOR_CONFIG("INT33BE", 1, 419200000),
+	/* Onsemi MT9M114 */
+	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
 	/* Omnivision OV5670 */
-- 
2.49.0


