Return-Path: <linux-media+bounces-54531-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI4cB+5/qGmYvAAAu9opvQ
	(envelope-from <linux-media+bounces-54531-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 19:54:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ECE206ADE
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 19:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32A6730FE002
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 18:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750B83DA5A0;
	Wed,  4 Mar 2026 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ixl5CFZI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741EA3D75BC
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 18:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772650229; cv=none; b=GnygEhSqLal9C1tlZLXErU+YEOATPSp6aE48NB9zVfzezG7TrTHKuYpvb/G2GuKVBv/+tem3LehW0rElqlFY+ImThV/q9YUoYMczT95eXu03WauBz5PAZw+Ih+/NdtZV9ZV0+0yTQYysqnZdwa5L1PXwqoXIA9n3K11GSuqXLlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772650229; c=relaxed/simple;
	bh=b5sg8UdiED+J1eixEpdPFv3QH4TXbgcQlHN5Nil/vQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LxbhLF4m/QpdsANPICul7e4TzeQRqIHy8cfWb+C2AXMdAmN9+Fz5H532vLgdYuYjz1AckMHz5+X/vJ+2MPXCumUVRNq8LIH5w/AQQJQFrYAuqVzXIfU2UrgCLRPGlaL7IvhWyc7JbG3PQuZxVtgHuxnPT1H09nLV4eD/XfdGll8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ixl5CFZI; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38a33a542aeso2822971fa.3
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 10:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772650227; x=1773255027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZ0k0KuXTsc1BE5vPZGWauEJN+TnRKw9hy7+Z/cTVX4=;
        b=Ixl5CFZINf40KMTDkATzJIN3dJDqVbdrNF1t/hXhA/K9hnYZPrd8Q6xXERe3aqiKiE
         9KGdEWMl87HPA1kI/RcyAfJiPdSffcD1n/avuw1C2wOdg0o/MKUXATvfTLMBtdXmVqKK
         SQ1Tsi6vR+2xjOJi/jFsQqMhuBVaJXl7HzVolXit0+5lWiqzPCTdIvC0fjqiz9meN5E/
         Dg6xXN0n2hz7GifJ6ecAj3sG6cVHTKWsZfD7WrFN4GIhoPFI0aqnaWZMDdtbIdCD37+w
         56hBflnu0CSfo8uXxGgMKAxqNVwz4R1322Dgk7fHt1UtiaVa10SpJLuXQMUB5+5Sc4sS
         CAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772650227; x=1773255027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WZ0k0KuXTsc1BE5vPZGWauEJN+TnRKw9hy7+Z/cTVX4=;
        b=qvcAl6RN67bG4fz4Mg3oivG6A/ag7RbKFhqRDYJMbWKuAUPeMWlHr8Vt33/3ibstx7
         64S79KouC68vEoc9xOxMu5UhRHzbcUwHcEJCh2s+KlQIjEEfRV/aosVGjCfSUpQ555jX
         ZVS2ScpWyfBBCZk5z2epsyoLUfHAJQAh5nYMS3jlJzFukcl5E0DaByZ+PicY1nK7iF7I
         edjOI2mQlObjZ3CwACN4Us/K1WPc2lnDfekdovpC6b0TtmQVfKoQ+m2JcqqiK6Jk87bJ
         wpJvcrui2YnxskiJ4rxgqqVhM08sCBwX1Dq+SQ45CaNJKXNB31UgnAWI5w+RTRkMPNhb
         /qMQ==
X-Gm-Message-State: AOJu0YwKcEzUF8YxFkx2PVhlZNCC2YAngx4+02DFBKG2fGm3VMyagEHR
	0BQracu2G9Rd1HxcZF67V22Di9XlocYYgddY0iX41xIz5DOTIhn/aOoD
X-Gm-Gg: ATEYQzytopwrEx6A5/yzOtEcMU+db5AI4kR7kCoeaPfu7OpdaSdZ5eMi/BYEG9Jr2BW
	lscw4SG9eDxqpKcGy0pO/s+9gPqw9X99HZ4FoerF1qIyzvAMzWid8Zg7GLiweU8rnCa5qRGwXSD
	yqYCy4ESYIjv3I5roBtyrBTJ/Dmo399qVki5MVqjq5QBvgaLHqHLJR51svybXvOXuU1UtCS2AbG
	+K4MrwUcItvUg48CVu7OakSnWGs3U5SdKVmbJD3oZ6f9L+LES/f++rcQJKaCqspMC0FAl/Ex1CM
	RKchwIuDIUmw+he5qXwKa1STBXFmps3mf6gpRiEmjw0pHcNfdxmvzYxFJO3YXMto3h6C9/aQJLD
	+A1IumGKkY9zUkAeancRgKK9YOwmp5DAhVnOGHzHFt5TWlIabFKF3cWZZ4/rfT1vhJPWsXoYMx+
	+l43ii8hfeaQrg
X-Received: by 2002:a2e:bc05:0:b0:38a:519:f788 with SMTP id 38308e7fff4ca-38a2c58db91mr23750691fa.2.1772650226373;
        Wed, 04 Mar 2026 10:50:26 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f30179e9sm36636101fa.33.2026.03.04.10.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:50:25 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] media: i2c: mt9m114: add support for Aptina MI1040
Date: Wed,  4 Mar 2026 20:50:01 +0200
Message-ID: <20260304185001.82988-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304185001.82988-1-clamor95@gmail.com>
References: <20260304185001.82988-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 35ECE206ADE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,linux.intel.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54531-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Slightly different version of MT9M114 camera module is used in a several
devices like ASUS Nexus 7 (2012) or ASUS Transformer Prime TF201 and is
called Aptina MI1040. The only difference found so far is lacking ability
to poll STATE register during power on sequence, which causes driver to
fail with time out error. Add state_standby_polling flag to diverge models
and address quirk found in MI1040.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/mt9m114.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 16b0ace15813..e8f74bd11cd7 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -368,6 +368,10 @@
  * Data Structures
  */
 
+struct mt9m114_model_info {
+	bool state_standby_polling;
+};
+
 enum mt9m114_format_flag {
 	MT9M114_FMT_FLAG_PARALLEL = BIT(0),
 	MT9M114_FMT_FLAG_CSI2 = BIT(1),
@@ -417,6 +421,8 @@ struct mt9m114 {
 
 		struct v4l2_ctrl *tpg[4];
 	} ifp;
+
+	const struct mt9m114_model_info *info;
 };
 
 /* -----------------------------------------------------------------------------
@@ -2284,9 +2290,11 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
 	 * reaches the standby mode (either initiated manually above in
 	 * parallel mode, or automatically after reset in MIPI mode).
 	 */
-	ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
-	if (ret < 0)
-		goto error_clock;
+	if (sensor->info->state_standby_polling) {
+		ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
+		if (ret < 0)
+			goto error_clock;
+	}
 
 	return 0;
 
@@ -2532,6 +2540,10 @@ static int mt9m114_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	sensor->info = device_get_match_data(dev);
+	if (!sensor->info)
+		return -ENODEV;
+
 	/* Acquire clocks, GPIOs and regulators. */
 	sensor->clk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(sensor->clk)) {
@@ -2646,9 +2658,18 @@ static void mt9m114_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(dev);
 }
 
+static const struct mt9m114_model_info mt9m114_models_default = {
+	.state_standby_polling = true,
+};
+
+static const struct mt9m114_model_info mt9m114_models_aptina = {
+	.state_standby_polling = false,
+};
+
 static const struct of_device_id mt9m114_of_ids[] = {
-	{ .compatible = "onnn,mt9m114" },
-	{ /* sentinel */ },
+	{ .compatible = "onnn,mt9m114", .data = &mt9m114_models_default },
+	{ .compatible = "aptina,mi1040", .data = &mt9m114_models_aptina },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mt9m114_of_ids);
 
-- 
2.51.0


