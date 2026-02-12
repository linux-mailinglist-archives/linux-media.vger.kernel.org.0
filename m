Return-Path: <linux-media+bounces-52653-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCcoGVDGjWnT6gAAu9opvQ
	(envelope-from <linux-media+bounces-52653-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 13:23:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB76C12D6BE
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 13:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6CA4E30117FF
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 12:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01704358D3D;
	Thu, 12 Feb 2026 12:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFohFSa7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B71835771F
	for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 12:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770899014; cv=none; b=XeadNJPzzxKkoFNnIWVJz++4gBKLNVq7wzr915+GPdu9qe+M7SPRa5fseVcG5mMTOMtwN84NsYoCcEz5vESCtL2x9c03CObF+pOwYVdMuJ3jjx7hMnb4gnRwHpQAZajMzr9zFHLUY17b6AAF4JOvEwmw9gB2SddN0ZGex2LdINY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770899014; c=relaxed/simple;
	bh=pW74V5cFkrxHAUpolR7r8O1D0nnf5KOsjp09vfB2x7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L9ztI+UHyyu6OKRg9y3PtdAMedgUAbjFwHHVVoEqSfSyY3QzXLyrQVxDN5cDRPFNNiwZhQvDn+tw04cR6eqETzTGDsHo4tdkT7mnOU4MJ5C1qPjMbJzx5BurC2ldD7Nh2dNDbCt4kL2rm9btp0GRHuQadlwR9+IhmhWdYr3WA7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFohFSa7; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b8f96f6956aso66611966b.3
        for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 04:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770899011; x=1771503811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcC35f9Jziu32RgFmxZhKjABLtU2XS673ijWTDginX0=;
        b=aFohFSa7ThyqqB9TT+qEDboTtcQn9e2qAE0f4TvJTpn6/MI1D5ug6QXW3cLxoASn+j
         4OooAeDe4C7sfyAXyt0rmJqa8g33iSciOriIn07V5qIwD2IWOSsETklj19ocQDnMS49T
         lDAGYXnr8mLXEaIkTAdKkdd4iihbldeYrOWfVp7iBaUkUGqZayhwcgK9bGakz0B0OU8S
         5vfMkIVZF8E2t1bwBlWw5yXpF76kPLqWSR7zWZCMWjTOtZUMjXVn9MimKMtxPtVeOtk4
         5u2Icydj7j1eDDIsTjAm6Xfe4NyrtM1cmHbPjuLkgbiDFzowBMfoB2oPVnOtQFPiWo/X
         YJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770899011; x=1771503811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mcC35f9Jziu32RgFmxZhKjABLtU2XS673ijWTDginX0=;
        b=cPDjgxEk6HcDruk1JKaSKYxL5hYNcd9XLvX2/eep8L6KkOGIJP01d3K95MLjaG2854
         ScsnZ/hJuEE99EpdsyPd6XLcCUgA6fsjwUrQRM+isZVPBhsMrYwTu13uorAqHfBnX5Dz
         TX78tP3mmu8ljFjKw7Em0rOtT/45IcAG7JXYJ+ZqJ4xjpD6uFEFp54mpIDzRTZxEOTyn
         XKZH8IobTTKD/Gn7GxC6eHoI+sqmHdK1AFkCKWGVHwGdc/ZzocwhrTprnuZk/z5Z/rpG
         0VVKGELZL4YFQFxxVTVeRxnkCWHxjzNW5KdWb39VCQmvnEdGlQz3TUyhT8rSGjVOA4QV
         tigg==
X-Gm-Message-State: AOJu0YyUtcNoLrde1eKCjiWfwqe8nNhaOG9zJ+UtXjILImkKDL+rjS2Z
	AfGb1ShFwS1LKFKxBY5WYfXVmOE/+ClKeW2s6HQyH3+Er18NQyDyZoUM
X-Gm-Gg: AZuq6aL6P4CJia91hqR5X4SbSNuAjr+AIMBXyOEIGwLYv6I7pYpisSuIwTgM4+xCCcG
	T9a9HvQCvzDTwI06z2Zida9lVKuNUkCjn+IghBPtKlrqXYQar8fqJVZbQJ5esfXStZvKAOoU0f3
	9AJi5HxQ4O5ke1vEB5rNWitYxAo05AKhAWEP84w2rZ2xpDiHuYK+kDzEx41qN88sfuZh3PTSXdw
	Mp+QwI7uQdHVyCYVgRiXcDFlN7pRoTNRN3vDsNzMCmP2L1012iCL+ZwMRIn/LzcEba/AmgyN4NU
	xDA5edyc0e8heSa9vpP4AQJl8xQZeeF3XU+zM2i64LXwi/CD92EeRd6M6LydBR5Ezx08BGQKhgA
	8zS9zbo42cr2+knVXEN+l6UuU2GOVM1otba1BGqLxfy6zbqBoCkXzRFSV7vpriVHWz7qNf7u/V2
	ZHzAHlWTH3a8yTkyN7QqxucR4=
X-Received: by 2002:a17:907:1c81:b0:b8f:7a08:9e43 with SMTP id a640c23a62f3a-b8f92cbf524mr107164766b.59.1770899010619;
        Thu, 12 Feb 2026 04:23:30 -0800 (PST)
Received: from xeon ([188.163.112.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec1c753sm155603466b.45.2026.02.12.04.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 04:23:30 -0800 (PST)
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
Subject: [PATCH v2 2/2] media: i2c: mt9m114: add support for Aptina MI1040
Date: Thu, 12 Feb 2026 14:23:02 +0200
Message-ID: <20260212122302.29211-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260212122302.29211-1-clamor95@gmail.com>
References: <20260212122302.29211-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,linux.intel.com,gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52653-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB76C12D6BE
X-Rspamd-Action: no action

Slightly different version of MT9M114 camera module is used in a several
devices like ASUS Nexus 7 (2012) or ASUS Transformer Prime TF201 and is
called Aptina MI1040. The only difference found so far is lacking ability
to poll STATE register during power on sequence, which causes driver to
fail with time out error. Add state_polling flag to diverge models and
address quirk found in MI1040.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/mt9m114.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index d5b142fe68a9..a4b021702a1f 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -373,6 +373,10 @@ enum {
  * Data Structures
  */
 
+struct mt9m114_model_info {
+	bool state_polling;
+};
+
 enum mt9m114_format_flag {
 	MT9M114_FMT_FLAG_PARALLEL = BIT(0),
 	MT9M114_FMT_FLAG_CSI2 = BIT(1),
@@ -422,6 +426,8 @@ struct mt9m114 {
 
 		struct v4l2_ctrl *tpg[4];
 	} ifp;
+
+	const struct mt9m114_model_info *info;
 };
 
 /* -----------------------------------------------------------------------------
@@ -2279,9 +2285,11 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
 	 * reaches the standby mode (either initiated manually above in
 	 * parallel mode, or automatically after reset in MIPI mode).
 	 */
-	ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
-	if (ret < 0)
-		goto error_clock;
+	if (sensor->info->state_polling) {
+		ret = mt9m114_poll_state(sensor, MT9M114_SYS_STATE_STANDBY);
+		if (ret < 0)
+			goto error_clock;
+	}
 
 	return 0;
 
@@ -2527,6 +2535,8 @@ static int mt9m114_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	sensor->info = device_get_match_data(dev);
+
 	/* Acquire clocks, GPIOs and regulators. */
 	sensor->clk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(sensor->clk)) {
@@ -2641,9 +2651,18 @@ static void mt9m114_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(dev);
 }
 
+static const struct mt9m114_model_info mt9m114_models_default = {
+	.state_polling = true,
+};
+
+static const struct mt9m114_model_info mt9m114_models_aptina = {
+	.state_polling = false,
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


