Return-Path: <linux-media+bounces-58478-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIrdOLOW2GkgfggAu9opvQ
	(envelope-from <linux-media+bounces-58478-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:20:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7A33D2AD9
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61579301BD9C
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 06:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C02635C19B;
	Fri, 10 Apr 2026 06:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXm6FrkZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E60035F161
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 06:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775802001; cv=none; b=oljDvpj+odgUGaZ4OySDEJJGQz3IHI8DA3eV7JnVloIr//g0ICPq12zjmSZKzegcau5Z7EzQUAQ/OZKMowx6OqpEMXqukegmlVnBgNhVacvQaL5+tJ/XRiJgZlHHLIu/7oKGp/vift8w6Vv0WtKeiPc/X0PAuI3I3ApRcu7af4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775802001; c=relaxed/simple;
	bh=E5GGs5TuY5QODhx72daIuN+YishRsQCyO7eiEZtBQBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gbzbBRfexIw3v3wX0vdOaDg4d7HSq2R/j48lTEZJDkGAT/+9DhHWwCvgws49VsnzKOwKTGuYU2v28AYn9zQ8j4Iiy7aPX9wMINODqy6bF+x4z01JwwGxC16uqtdr/A6oXruHOfF0FIv3akGRqPbNRYet2i38qZEmjy2MfdBYX3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXm6FrkZ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a2beddab48so1602767e87.1
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 23:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775801998; x=1776406798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpL+NVqjAOt6Sh+B603uRTFpfACOENDvTWBLV6kz7zY=;
        b=OXm6FrkZDuYc5qjswWYSFYbu+VN6B9hUKP0q2yLXAAotx2VxyRwRyGi7YgsWU+qDrI
         +7WtvBwA8fJcNKnV8yUJ+6rjOB7YzP5FaP81kvsxBcrChxuose2sfyt5LQtmp23WUS8+
         i4dKO+3D2elCc5qVIyTygePzGBSTGO3otQTmh0X77cNwg4K5xyGeRRKAL71k16BP/Ehr
         nT0X+kbdPcE/a7G7sezeHhJJNbWVq+rbVkPzJb//hPWXqsZg5/AX+ltsqxGzGjllFfrV
         pHNRR9dNWZtO8O3coqFousLV/7YAW5+XF+nZNCL4MXqgQQbwRVdy+tjrSDqAS5aJbe5U
         QkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775801998; x=1776406798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OpL+NVqjAOt6Sh+B603uRTFpfACOENDvTWBLV6kz7zY=;
        b=ndYwBrZhqmOTpeqMu6vLfDq7eVTEbV1rUHzQqizhh8wUzTBsnscs4BCr0FPagwH8vd
         sc02+tMOWOsb+oiJbIG1Nme14f6AiUswTD+VAMsTYRdi7CIiV5P13mcyoCFfuctzPTN+
         vjIX7wDQKkT3Zo+/5a7TQUXBjR+VD4RHw+8yh26iWH7dRr1vPcrFlr4KKka8ckHPM5YO
         EPAmWTNMUcd7S8I5icKd59NOXCVnGvmPVVAA0MVfEALms7OcY858feSjR9UjPfdThjFg
         eDBJzh2wz4o7W4oUorwJwRibzGZcUxhYZXM7hnOAx3fO7ZflHsg89TySWPCy2aTRm7Mx
         fv2Q==
X-Gm-Message-State: AOJu0Yw6NjIxAnHotv2ouxZeFSuBVYM1QB51ljxzBQ9WIx+D/tEvJC7F
	QyTJ0X4LkUEh1KMdhMfngEzFJRcK1YMA/OwVMy+MKH1bMzBt/Xr4V7bzkKuDCWDVd6uDyw==
X-Gm-Gg: AeBDiet3hNap2M4ZNJcB6bnMw1lxy4kD1ui5dm0gWBgBTFLj+ezvPgNmAbbRreuxSl0
	5D+dk3OAo2pZDWAKgzl06mpYY9pKUqsKO01oTSpBP4rQzVbwGMd7+zLg9cNe52X4/hwPrsmT3uU
	cM72sxBV52omKCPXafRMHSDHnBSSdCZRIiWe2WhmG7TgzMtDZg80L2szF2v9WBa3rZuyirJVP/3
	ffL+BLeh2Kn7mjNK1dFzavGWLktTNYdYYRYWa8EDEQfzZTSbhIKbZK+9zT3gMN8m9mzNf9WaVud
	Jymqj+pcBWxsBaJ9s0lTcGwl0o5USW11LzKqDDMu87nDjlQUPOCK/wknpnkivKnhYBLi8Oax+Ht
	bvvjFq0acLeRof1q2aDFREbMaGYc4cJKy6olXSd7YMDbZEX6l0RVjyHltUcddp9tjmWWSwaL292
	lMxCfgWIQo8Uk3/osd9uxR5PJF/mxpH5dJxs+8Pr4=
X-Received: by 2002:a05:6512:3d1d:b0:5a2:c05c:118e with SMTP id 2adb3069b0e04-5a3efb5604bmr781309e87.11.1775801997719;
        Thu, 09 Apr 2026 23:19:57 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8673dsm490506e87.15.2026.04.09.23.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:19:57 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH v2 3/5] media: i2c: imx415: Add missing 4-lane CSI-2 timing configurations
Date: Fri, 10 Apr 2026 09:19:42 +0300
Message-ID: <20260410061944.241480-4-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260410061944.241480-1-eagle.alexander923@gmail.com>
References: <20260410061944.241480-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58478-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,wolfvision.net,raspberrypi.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,raspberrypi.com:email]
X-Rspamd-Queue-Id: EF7A33D2AD9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add CSI-2 timing configurations for lane rates 1485 Mbps and 2376 Mbps.
Mark configurations that are valid only for 4-lane mode by setting the
first element of hmax_min[] to zero.
Use the zero value in hmax_min[0] together with
sensor->num_data_lanes == 2 to skip unsuitable configurations during
mode selection.
This change enables proper operation for all supported lane rates in
both 2-lane and 4-lane modes.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/i2c/imx415.c | 45 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index b44d685360c1..b305adec30ce 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -505,6 +505,19 @@ static const struct cci_reg_sequence imx415_linkrate_1440mbps[] = {
 	{ IMX415_TLPX, 0x004F },
 };
 
+/* 1485 Mbps CSI configuration */
+static const struct cci_reg_sequence imx415_linkrate_1485mbps[] = {
+	{ IMX415_TCLKPOST, 0x00A7 },
+	{ IMX415_TCLKPREPARE, 0x0057 },
+	{ IMX415_TCLKTRAIL, 0x005F },
+	{ IMX415_TCLKZERO, 0x0197 },
+	{ IMX415_THSPREPARE, 0x005F },
+	{ IMX415_THSZERO, 0x00AF },
+	{ IMX415_THSTRAIL, 0x005F },
+	{ IMX415_THSEXIT, 0x009F },
+	{ IMX415_TLPX, 0x004F },
+};
+
 /* 1782 Mbps CSI configuration */
 static const struct cci_reg_sequence imx415_linkrate_1782mbps[] = {
 	{ IMX415_TCLKPOST, 0x00B7 },
@@ -531,6 +544,19 @@ static const struct cci_reg_sequence imx415_linkrate_2079mbps[] = {
 	{ IMX415_TLPX, 0x006F },
 };
 
+/* 2376 Mbps CSI configuration */
+static const struct cci_reg_sequence imx415_linkrate_2376mbps[] = {
+	{ IMX415_TCLKPOST, 0x00E7 },
+	{ IMX415_TCLKPREPARE, 0x008F },
+	{ IMX415_TCLKTRAIL, 0x008F },
+	{ IMX415_TCLKZERO, 0x027F },
+	{ IMX415_THSPREPARE, 0x0097 },
+	{ IMX415_THSZERO, 0x010F },
+	{ IMX415_THSTRAIL, 0x0097 },
+	{ IMX415_THSEXIT, 0x00F7 },
+	{ IMX415_TLPX, 0x007F },
+};
+
 struct imx415_mode_reg_list {
 	u32 num_of_regs;
 	const struct cci_reg_sequence *regs;
@@ -576,6 +602,14 @@ static const struct imx415_mode supported_modes[] = {
 			.regs = imx415_linkrate_1440mbps,
 		},
 	},
+	{
+		.lane_rate = 1485000000,
+		.hmax_min = { 0, 550 },
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_linkrate_1485mbps),
+			.regs = imx415_linkrate_1485mbps,
+		},
+	},
 	{
 		.lane_rate = 1782000000,
 		.hmax_min = { 1100, 550 },
@@ -592,6 +626,14 @@ static const struct imx415_mode supported_modes[] = {
 			.regs = imx415_linkrate_2079mbps,
 		},
 	},
+	{
+		.lane_rate = 2376000000,
+		.hmax_min = { 0, 366 },
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_linkrate_2376mbps),
+			.regs = imx415_linkrate_2376mbps,
+		},
+	},
 };
 
 static const char *const imx415_test_pattern_menu[] = {
@@ -1364,6 +1406,9 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
 			if (bus_cfg.link_frequencies[i] * 2 !=
 			    supported_modes[j].lane_rate)
 				continue;
+			if (!supported_modes[j].hmax_min[0] &&
+			    sensor->num_data_lanes == 2)
+				continue;
 			sensor->cur_mode = j;
 			break;
 		}
-- 
2.52.0


