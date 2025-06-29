Return-Path: <linux-media+bounces-36216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A91CAED11D
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 743597A219E
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E2D23ED75;
	Sun, 29 Jun 2025 20:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q59paoJX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978773D6F
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230608; cv=none; b=czJBJ5qHORCHXHk9LKHY7WfGN5YP44nQA8JAaQyayrY6TdIR3pYivMvaGDST3ralKDp0b/zcqnCHC/ybsD8yEuyrxSqGe4qKix2fr94EzfyDtQjphHYy2JA2rEwr8vF8dSS6dE1bsIZ1Ut7sG/XsshqI0FctO2UMt19hBICP3bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230608; c=relaxed/simple;
	bh=jOQ0ydVCXQtW08ekoEKwPCNyvlUp6Lasj7+Rless9zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXwjdteo8Y9o9ITEz9QfCYndbvIDzuxwDvp/PmWh3i5DdBtwQ8vu/cqaWT9gFqAJ6VVrZieTx2LVA/sbPlOo0kRnf/o4y8hCzPe9Kle1hBklCz1+MlmdlVifD+lGZOzB/39tA68oKm+nRcDpJ0F2tFoz0gPSb4F3DcA0v5D35CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q59paoJX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D64DC4CEEF;
	Sun, 29 Jun 2025 20:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230608;
	bh=jOQ0ydVCXQtW08ekoEKwPCNyvlUp6Lasj7+Rless9zw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q59paoJXg2Zd1TuusVEK/IJ6uLqKZK5x/eDxcBbW5SvlWADu5G68mqBO9P8BgPKU0
	 ifcWgWK8bQMP/jJacEkuZRFC5McR4Agot8lE3vEMoZLOlupT1Z3B1qERR5N+j6vqEJ
	 pZNx3VZck6jIY6d3lgwstXjEdc2TI3TW+2CJP9vJAhzAemeymoHuzp9jwQmy70clb9
	 bbWp2ZhU9Hd/OymHL4htDqGbHwwLgtLpS+GfGjY3c2gAUn+p1128G2CABHRiaukAMB
	 aPC1mwU8/k/dm4eNFxdK137K+MIRE1AFKy6lP7AzCdSmYK3PhLcWV8Wn8OmfbCmD8W
	 Y6JGJf2foVKdA==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 08/15] media: mt9m114: Put sensor in reset on power down
Date: Sun, 29 Jun 2025 22:56:18 +0200
Message-ID: <20250629205626.68341-9-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250629205626.68341-1-hansg@kernel.org>
References: <20250629205626.68341-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Put the sensor back in reset on power down. Putting the sensor in reset
reduces power-consumption by putting all the data / ctrl pins in High-Z
mode. This helps save power on designs where the regulators may need to
stay on while the sensor is powered down.

This also ensures that the sensor is properly reset on power up,
since now the sensor will see a reset high to low transition after
the regulators have been turned on.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Changes in v3:
- Improve commit message

Changes in v2
- After setting reset high wait 20 clk cycles before disabling
  the clk and regulators
---
 drivers/media/i2c/mt9m114.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index c10100d8fd4a..d4aad77b095b 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2207,6 +2207,13 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
 
 static void mt9m114_power_off(struct mt9m114 *sensor)
 {
+	unsigned int duration;
+
+	gpiod_set_value(sensor->reset, 1);
+	/* Power off takes 10 clock cycles. Double it to be safe. */
+	duration = DIV_ROUND_UP(2 * 10 * 1000000, sensor->clk_freq);
+	fsleep(duration);
+
 	clk_disable_unprepare(sensor->clk);
 	regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
 }
-- 
2.49.0


