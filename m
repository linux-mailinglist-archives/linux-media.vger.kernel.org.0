Return-Path: <linux-media+bounces-54610-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBcZKF1ZqWkL6AAAu9opvQ
	(envelope-from <linux-media+bounces-54610-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:22:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6F720FA24
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E31C301DEDD
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 10:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557623803EB;
	Thu,  5 Mar 2026 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5efC91G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206FB37F73B
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 10:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772706110; cv=none; b=V7inizuKqviEj2PfEmCmO4zHxzK4exUv9Aw5s9L/pZB9JerEPxe9BT63nKFNKIwQDN0qdQ/dxUCP+BeOJSViJRI8q4TiDGEBP/P5MF/Ox5sWbg+FFQ6aKYVf8s0mgVvP0zcNQC6UrCUY5GBES2naHvL6YPDsKLI3Neu1nYzvICU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772706110; c=relaxed/simple;
	bh=2+U/ZONee4dT26Jw5gWNEb8dK26/hW7z5aXQpBzS04Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pI/kjaFD0EPW6pW+szWf2VMR5DxqG2L8xy9QxXMwwOmlh+ddz/8cAC0fTUOmMKAkH1vEv54gI751oahMyC6ZrHtZyNJ/VjUohvPIcTSL5nSeYMQKkuVBMqifnzqQlaoIBlqVHMsg+fY3QHZhUYms7IAJ9TsDENFM2CQsxSXGKDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5efC91G; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b9b190easo2850041f8f.2
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 02:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772706107; x=1773310907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cx7lcE//ZT+Yr/4kAurpDNP3t7qSzC1pEGhI2wYTnFk=;
        b=O5efC91GcGdFmdzXiYREL7pqXJHcRK1THkjj3P4RuEF6FbwSUWAllnndaWHtkh0hhS
         Eha9+nLieN17Q7q0bhzOyPcSZAwvcvizNsUBGp6k4ly6I4qxutg7o3TKPmkV/zF161tn
         PB8vqrV7If9Hh0401+QgPt93rDCT91pZThZ+xEIw61dqHPd/uihV/pGwx5wXWkSBRxbL
         F9NgB2Hf3/FxVg29u8pZe7tPSPqbRgomdzCj6pOXE91MKFOBNWJG1aGAFF+LyIYVfLib
         Z3RU6NAcmuMIFosO+A9WKcRGJ1B7PllhYex2m/CWD0DpsHNrGTlMSRTxJWycdlJzNIYf
         AsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772706107; x=1773310907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cx7lcE//ZT+Yr/4kAurpDNP3t7qSzC1pEGhI2wYTnFk=;
        b=mnVTnQEVC3sWbv62q/NgNaTp+YlecltYetRUSWBzkGz++SJa71LnP5A5UEyTKsSgfX
         gDI+7QVGaEOO3RarYQ6ni1SbZYVHvoX9bo9Rcc2zA+OyXqNx2V+goWgtDW1jlFARw4Op
         7kf7fwhrnCxFabw1MtJi+JmGwywOcL+qjZ0lSFqEkFATo+8JUyvhm7h54EUoqHS3w/Kn
         b71DP/pfbxaN7Vh4NARqwywJgkoJ1xEHD9yQE00JUeRfZc5YFmJ2ts5MsqHCFhBev+FG
         oVz1nL93CLWZ9pNlnRf4QT2Z69Qr82xiBLAfT6fe6CnUsRfBOLqR6TpUPjSi3+tLej3Q
         yrIw==
X-Gm-Message-State: AOJu0YyQ584R5qP3vcUINARskd3lDgHN7jQjLcnofyFaio72qO6lYZhr
	ihRy9Gjov1WDGQgCPWhQVnsn/u8nmdjukpVvp4dk6oVH6agVYwoiA0b9oF/Hxg==
X-Gm-Gg: ATEYQzy2TExU9aY5KM/2dbMyrTmvgAGcOHx0YX+PpZv/6oZEM61aaNRZAvZnECyW8p1
	N/ju2T/Hs3qhO3DyelveSFPHI6KokpfUzF8Ypmd6IstyDqiF6xZ0SCqUsVo6UG9TIGGs3eaPN9y
	/wmuPjP+OroX9bFVckbiPe7w9y2YpntB1e096tpZe8HqII3FSY5AqBX/qPnjp+CN/R5ZHP/zYNK
	ffwEFF33dXjaQf1fUUpuw16FPkWX1MiYpwmzBAfVYRZ9MwbdMvcfeQRep2NpiL5YOxSwjHZPgnR
	211hEbT1MfX5yzpRjKBPyno6fw8Wro8dgr8mkPgakRpQ9Jx2NsqjKd3Wm4adAsCMw5uTEvG0flu
	QczaaXatL4rZCsAuSURQIo3JneFcvVOWXkgHoba4jpcXCVPJkLnz9tYkgpgt61ZG/8aVqx3wPkX
	DPLu1VdFtSGHey
X-Received: by 2002:a05:6000:4312:b0:439:c4fb:27f6 with SMTP id ffacd0b85a97d-439c7f79e1cmr10500857f8f.19.1772706107351;
        Thu, 05 Mar 2026 02:21:47 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b503425asm32625444f8f.25.2026.03.05.02.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:21:46 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] media: i2c: mt9m114: add support for Aptina MI1040
Date: Thu,  5 Mar 2026 12:21:22 +0200
Message-ID: <20260305102123.17216-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305102123.17216-1-clamor95@gmail.com>
References: <20260305102123.17216-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4A6F720FA24
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-54610-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,linux.intel.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Slightly different version of MT9M114 camera module is used in a several
devices like ASUS Nexus 7 (2012) or ASUS Transformer Prime TF201 and is
called Aptina MI1040. The only difference found so far is lacking ability
to poll STATE register during power on sequence, which causes driver to
fail with time out error. Add state_standby_polling flag to diverge models
and address quirk found in MI1040.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/mt9m114.c | 35 ++++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 16b0ace15813..e395e2d14e97 100644
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
@@ -2646,15 +2658,24 @@ static void mt9m114_remove(struct i2c_client *client)
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
 
 static const struct acpi_device_id mt9m114_acpi_ids[] = {
-	{ "INT33F0" },
-	{ /* sentinel */ },
+	{ "INT33F0", (kernel_ulong_t)&mt9m114_models_default },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(acpi, mt9m114_acpi_ids);
 
-- 
2.51.0


