Return-Path: <linux-media+bounces-33727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E43AC9BBC
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 18:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FCB517D17D
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 16:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CF618FC84;
	Sat, 31 May 2025 16:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9IQNxKx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A7013CA97
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 16:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748709133; cv=none; b=IXT6bpOcGVU/Wm1GaLh2hWJGgOl2HcUfd9dycAk8A04hEBdqHzjDGAAL7WCTXvuvZDBpnoz9o1CO0YbtzQH9Uts7G/ac3kkkH0fuSBZitEo+USF6fm+mJylOJCznQiDbZ+UuaEcrJxNGtNKeYSMunq4slC2lBD5amEqjOksSVQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748709133; c=relaxed/simple;
	bh=guj1U9Lcnm3RCJhfeQST+5Y4xbLrf2V8aiIW+Ts8LdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HW6YkeqGjAJIJFDr/gf59ykDb9EORK8Of3ZAqz31tawRXGz2g4flSCxmz+M0vbT8RcXWRv9hhLkYeUAGYcJoYSIDc/Tgel5Qgd1/ZGI1DkJybY4GQAGdb+fg9BueDEreJEKZBxMEIMq6M+whkRPpdEuzR/U9waFzTeSR6ioR4+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9IQNxKx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF241C4CEE3;
	Sat, 31 May 2025 16:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748709133;
	bh=guj1U9Lcnm3RCJhfeQST+5Y4xbLrf2V8aiIW+Ts8LdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T9IQNxKxqcj08L6mFFjwBXl7ZL85UregU0MpZ10Ly11wkIXgWU8dRZ436E0LuWXdr
	 6/3bgSYtXjcIWn8zk+hAT/G4f4hs3eYNIzEEvnUYfjN7Bb0m+/Xu2zlIkVpQ+NISQI
	 UDHcjFhK2pLH+3gBWWKalLNHyiSoVYD1JifTEsjwcq7jO9ILkgGGNYsVpd1wLsJMHA
	 PSDw8iF9BN2Nam6T6NVEJHaj3gCSW2sdKsW4Ml0bPhNhNHZz/APn6bNrr9pP5fgg7z
	 9qqsuDu+FBWbCZDYZK4AE7anKlTQAlRHfqtI4C7EqGxgMkBrxtF9Q/R/pXVEkCVvUu
	 BaaCJylBHoT9g==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 08/12] media: mt9m114: Put sensor in reset on power-down
Date: Sat, 31 May 2025 18:31:43 +0200
Message-ID: <20250531163148.83497-9-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531163148.83497-1-hansg@kernel.org>
References: <20250531163148.83497-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Put sensor back in reset on power-down.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Changes in v2
- After setting reset high wait 20 clk cycles before disabling
  the clk and regulators
---
 drivers/media/i2c/mt9m114.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index fe30b9ff84ad..7a1451006cfe 100644
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


