Return-Path: <linux-media+bounces-36215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B52AED11C
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED1261704C5
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D029723E329;
	Sun, 29 Jun 2025 20:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6YjxDQT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB6322F74A
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230607; cv=none; b=aHkoh/MjdyWLMCE15froSvK7rrcrolE9THa7DDNXcxJvCCJgEqXkwmRWRrhmykQuaduBxJkKAF1NuNTR6BXeKXHhDNhbFBprSc5Oq7Dg3qDDoRiiMKmLBqC521zu7UjYocgyTWwK/sT6SSUjqYXXgS+kfb26s/k2IyofUc4lNA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230607; c=relaxed/simple;
	bh=3SdnXMpixAd+TT4g+aHBFF87CSdoLbufYDQXaFRyn90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Io2FQVuC7zzQ49VQad1eVD50bjCXRjjZMRFAeiCQU+zbNOiqwCdvHPMxk59UrhAx+Jt491QVP7DTcwUkJPzlzK6wZiY1wF5R/oQssBCWB0HGRLUR8Qx/Db28iq+Jo/c0TfG/lOUuahjLRcHJJX23Fhrc01jrtIn5JAm3jrqFutU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6YjxDQT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89027C4CEF0;
	Sun, 29 Jun 2025 20:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230606;
	bh=3SdnXMpixAd+TT4g+aHBFF87CSdoLbufYDQXaFRyn90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O6YjxDQTOl1n9Q7TGKo91j//j12kPaus40d9gvLQieKhqlm+qU0YhecItnolCvQI7
	 x/OtM0RIX5IZHze8n/9LEDZkZC/vcXWo+gjXA2Vy5kHg2uqYpmu8LX16/zkL0Vnmy+
	 BI8t5RNdGxnYqx513Hih1w9X0M/bNctNB7rXCS3VMiYwc1DBJpGAmLft3zL+fzuuke
	 N5HbJY2D4v2uDKRtWsGQqQdwUPLXHGIff9ycBLluIN/hxzLZ18+JcI/AB54Xy2UZoR
	 XT2O7l4ZzZDU8ejenRfTCbN04TYWpNtXmGl5DrRVN4Uf9BOQjNU61p65F+qtbj5+qG
	 hVrxbnp8i1xMA==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 07/15] media: mt9m114: Avoid a reset low spike during probe()
Date: Sun, 29 Jun 2025 22:56:17 +0200
Message-ID: <20250629205626.68341-8-hansg@kernel.org>
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

mt9m114_probe() requests the reset GPIO in output low state:

	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);

and then almost immediately afterwards calls mt9m114_power_on() which does:

		gpiod_set_value(sensor->reset, 1);
		fsleep(duration);
		gpiod_set_value(sensor->reset, 0);

which means that if the reset pin was high before this code runs that
it will very briefly be driven low because of passing GPIOD_OUT_LOW when
requesting the GPIO only to be driven high again possibly directly after
that. Such a very brief driving low of the reset pin may put the chip in
a confused state.

Request the GPIO in high (reset the chip) state instead to avoid this,
turning the initial gpiod_set_value() in mt9m114_power_on() into a no-op.
and the fsleep() ensures that it will stay high long enough to properly
reset the chip.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/mt9m114.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 06f835b08f8e..c10100d8fd4a 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2440,7 +2440,7 @@ static int mt9m114_probe(struct i2c_client *client)
 		}
 	}
 
-	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	sensor->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(sensor->reset)) {
 		ret = PTR_ERR(sensor->reset);
 		dev_err_probe(dev, ret, "Failed to get reset GPIO\n");
-- 
2.49.0


