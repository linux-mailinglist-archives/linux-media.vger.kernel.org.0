Return-Path: <linux-media+bounces-58477-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCJuD7WW2GkgfggAu9opvQ
	(envelope-from <linux-media+bounces-58477-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:20:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB383D2AE2
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 08:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81323302FEAD
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 06:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661DA33ADB3;
	Fri, 10 Apr 2026 06:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pe2RaEBY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3938335AC2D
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 06:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775802000; cv=none; b=QPbv58GoC0upsrGKkU+uL1HkRM6fWfizswhxCpIL4eRtha2CyMFMtdIF4EMLOBI5fjBhLhBe4S3suj7g0wD4HpoD+50lB6Tg3OaIUNeLkQ/DtEG9s9J96rr3FmdmyxxtQ6EebXEtjBqF3CzfBBlaFvvUZTwvllUqRJyhoJTURIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775802000; c=relaxed/simple;
	bh=xV9HR+NL97Lct0j0bHnqjxLl4sAaQwvRV4pND3397Ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdP0BEHu/qouIlzWXI2qQRKLP0YVWYgdGpZzq9iPtoBvFA8l7ee9lqadW0qCdawQOw/qr1/vlt82e1DGPbxOglgTQ33jG/hl05gzwkmx5Z0kEyRXDmCuqgL7cjariXtONvk4sedNbjewi+rHlmRvZscvQtnhV/ZcS+eiVDIDPP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pe2RaEBY; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a2c500750dso1738750e87.1
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 23:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775801997; x=1776406797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWh3Im7BCAuqsri2rOlfskxJIpzoIz+GaVwYFIOHw9g=;
        b=pe2RaEBYBAn68rnm783WTfzvGZwihM0rfPA7DlXEzQgePXAKbGxKYCBPF6K52X8Wz5
         2uWEmhG8NOFR8qjlZsgsRLXXnMTg0IsBCy8NfYY0l3ys2ix9NmB28ZXHMVHU/b0TfcSI
         yep2LPVtkCbMZ0Fw+0u/FHAodCzl1hc/AU7YTtXLOOo64hW8zfjC9W7A+dw7z5hNJG/M
         iHL3+DB6Qadk/ee28Da0Niz0YVnveonRbGOjLNAgRkn7xfXgkcdaHZLjtC6zD1DjvFbi
         9txL7/E+aBK8BG3Xp3oW6sdF5yUyFEeQvmm954ypxIa8T+8HMUekrk9zW+wAt8VglIaK
         bLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775801997; x=1776406797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tWh3Im7BCAuqsri2rOlfskxJIpzoIz+GaVwYFIOHw9g=;
        b=UVg5mem5NJfDXYXaCmbGU4s5Xq/Y0+z/qTzKFKXC+1BRk8zfkg/qq8uGWQh6oIa5iS
         RhjRf1XAz0OPdnQta3iQq+vYuWW8lmtV8X/yuX61JncWAHCrK/IxlDvEQyvPJf1/J/lv
         dgcMa0CDWW8r8fesHOUcTEmUXK604jHkYkq3fNzO/cmPe6PYpuqetqt2H/tdwEvRowsz
         pKjShvoOPtou+VvlX9RGcBPUIkvobUNL0SF9DpBU8ng4xhB4xvd30RTOTjfzuZKezNuq
         nSmParDABCbFExnLORNaP33gBSljs+ssYhPsKY55i40B6nS2ElQSwLsfbXC4kuzdGx2M
         QH/w==
X-Gm-Message-State: AOJu0YyD/7dl8FpHCCvN6nYR5oLdMGCAp6Caao1Um8gRkyhfZgySPpVE
	V4FXDcpemQY0owFNgDVcurIVcD+WvSJn9YI8xcj1grMMFLN67xCv4IeE3lHV4C0+nrdUVg==
X-Gm-Gg: AeBDiesRLE7UJLxb+8uCzVpAk6YH1AWZkI3E5vHkE7iXnu6ZIYqyrneVBU2mqW0Kwb5
	yPpbJ8HJHqB0RIDNzL4v+SEl3DbZ5P4JCnWwWAM/Seyio4odlhXekIa61Vuy/PYhxeB5JaGxN0C
	t373q+pbLCkZni62u2L7yqBwKUXVuyZ0jRCY1QCCqvnCaRpPntW9+nyhoHUdRbHheZfVW5nU0YB
	9rA8xzGa9vo7y8Tfc7EabXT7xKKTVJUpGvotkErs7LA0/Uq80ZHe04WMlYVREk9SZ4PScbngpPQ
	kBiBdMRd6cn67DpsA5hebE2uEr/7fBhstV1Bg5i1Gayya9CkYZu6wm9yaLoZWMyfGmoDPWGA6xQ
	W8KwDNkWsmvUSCuXMRGxqWdNXrtc3fXYf9PQMq7gXHYiPBOLqwfamF/QwKYQrc1Klv9sWq1IL34
	DUPEctDmWO9z4ri6mzbjXLVte6PUoNm+rT+lwBSCU=
X-Received: by 2002:a05:6512:3e18:b0:5a2:bc66:b4a5 with SMTP id 2adb3069b0e04-5a3ef70688cmr626889e87.9.1775801996758;
        Thu, 09 Apr 2026 23:19:56 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8673dsm490506e87.15.2026.04.09.23.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:19:56 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Michael Riesch <michael.riesch@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH v2 2/5] media: i2c: imx415: Add missing CSI-2 timing configurations for all lane rates
Date: Fri, 10 Apr 2026 09:19:41 +0300
Message-ID: <20260410061944.241480-3-eagle.alexander923@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-58477-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[raspberrypi.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AFB383D2AE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add CSI-2 timing register configurations for lane rates 594 Mbps,
891 Mbps, 1782 Mbps, and 2079 Mbps.
Extend link_freq_menu_items to include these rates.
Reorder the existing mode entries in supported_modes[] to follow
ascending lane rate order.
These configurations are valid for both 2-lane and 4-lane operation
according to the datasheet.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/i2c/imx415.c | 97 +++++++++++++++++++++++++++++++-------
 1 file changed, 80 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 507a8c557ff1..b44d685360c1 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -109,8 +109,8 @@ static const char *const imx415_supply_names[] = {
  * and converts them to link frequencies by a factor of two when needed.
  */
 static const s64 link_freq_menu_items[] = {
-	594000000 / 2,	720000000 / 2,	891000000 / 2,
-	1440000000 / 2, 1485000000 / 2,
+	594000000 / 2,	720000000 / 2,	891000000 / 2,	1440000000 / 2,
+	1485000000 / 2,	1782000000 / 2,	2079000000 / 2,	2376000000 / 2,
 };
 
 struct imx415_clk_params {
@@ -453,6 +453,19 @@ static const struct imx415_clk_params imx415_clk_params[] = {
 	},
 };
 
+/* 594 Mbps CSI configuration */
+static const struct cci_reg_sequence imx415_linkrate_594mbps[] = {
+	{ IMX415_TCLKPOST, 0x0067 },
+	{ IMX415_TCLKPREPARE, 0x0027 },
+	{ IMX415_TCLKTRAIL, 0x0027 },
+	{ IMX415_TCLKZERO, 0x00B7 },
+	{ IMX415_THSPREPARE, 0x002F },
+	{ IMX415_THSZERO, 0x004F },
+	{ IMX415_THSTRAIL, 0x002F },
+	{ IMX415_THSEXIT, 0x0047 },
+	{ IMX415_TLPX, 0x0027 },
+};
+
 /* 720 Mbps CSI configuration */
 static const struct cci_reg_sequence imx415_linkrate_720mbps[] = {
 	{ IMX415_TCLKPOST, 0x006F },
@@ -466,6 +479,19 @@ static const struct cci_reg_sequence imx415_linkrate_720mbps[] = {
 	{ IMX415_TLPX, 0x0027 },
 };
 
+/* 891 Mbps CSI configuration */
+static const struct cci_reg_sequence imx415_linkrate_891mbps[] = {
+	{ IMX415_TCLKPOST, 0x007F },
+	{ IMX415_TCLKPREPARE, 0x0037 },
+	{ IMX415_TCLKTRAIL, 0x0037 },
+	{ IMX415_TCLKZERO, 0x00F7 },
+	{ IMX415_THSPREPARE, 0x003F },
+	{ IMX415_THSZERO, 0x006F },
+	{ IMX415_THSTRAIL, 0x003F },
+	{ IMX415_THSEXIT, 0x005F },
+	{ IMX415_TLPX, 0x002F },
+};
+
 /* 1440 Mbps CSI configuration */
 static const struct cci_reg_sequence imx415_linkrate_1440mbps[] = {
 	{ IMX415_TCLKPOST, 0x009F },
@@ -479,17 +505,30 @@ static const struct cci_reg_sequence imx415_linkrate_1440mbps[] = {
 	{ IMX415_TLPX, 0x004F },
 };
 
-/* 891 Mbps CSI configuration */
-static const struct cci_reg_sequence imx415_linkrate_891mbps[] = {
-	{ IMX415_TCLKPOST, 0x007F },
-	{ IMX415_TCLKPREPARE, 0x0037 },
-	{ IMX415_TCLKTRAIL, 0x0037 },
-	{ IMX415_TCLKZERO, 0x00F7 },
-	{ IMX415_THSPREPARE, 0x003F },
-	{ IMX415_THSZERO, 0x006F },
-	{ IMX415_THSTRAIL, 0x003F },
-	{ IMX415_THSEXIT, 0x005F },
-	{ IMX415_TLPX, 0x002F },
+/* 1782 Mbps CSI configuration */
+static const struct cci_reg_sequence imx415_linkrate_1782mbps[] = {
+	{ IMX415_TCLKPOST, 0x00B7 },
+	{ IMX415_TCLKPREPARE, 0x0067 },
+	{ IMX415_TCLKTRAIL, 0x006F },
+	{ IMX415_TCLKZERO, 0x01DF },
+	{ IMX415_THSPREPARE, 0x006F },
+	{ IMX415_THSZERO, 0x00CF },
+	{ IMX415_THSTRAIL, 0x006F },
+	{ IMX415_THSEXIT, 0x00B7 },
+	{ IMX415_TLPX, 0x005F },
+};
+
+/* 2079 Mbps CSI configuration */
+static const struct cci_reg_sequence imx415_linkrate_2079mbps[] = {
+	{ IMX415_TCLKPOST, 0x00D7 },
+	{ IMX415_TCLKPREPARE, 0x007F },
+	{ IMX415_TCLKTRAIL, 0x007F },
+	{ IMX415_TCLKZERO, 0x0237 },
+	{ IMX415_THSPREPARE, 0x0087 },
+	{ IMX415_THSZERO, 0x00EF },
+	{ IMX415_THSTRAIL, 0x0087 },
+	{ IMX415_THSEXIT, 0x00DF },
+	{ IMX415_TLPX, 0x006F },
 };
 
 struct imx415_mode_reg_list {
@@ -505,6 +544,14 @@ struct imx415_mode {
 
 /* mode configs */
 static const struct imx415_mode supported_modes[] = {
+	{
+		.lane_rate = 594000000,
+		.hmax_min = { 3300, 1320 },
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_linkrate_594mbps),
+			.regs = imx415_linkrate_594mbps,
+		},
+	},
 	{
 		.lane_rate = 720000000,
 		.hmax_min = { 2032, 1066 },
@@ -513,6 +560,14 @@ static const struct imx415_mode supported_modes[] = {
 			.regs = imx415_linkrate_720mbps,
 		},
 	},
+	{
+		.lane_rate = 891000000,
+		.hmax_min = { 2200, 1100 },
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_linkrate_891mbps),
+			.regs = imx415_linkrate_891mbps,
+		},
+	},
 	{
 		.lane_rate = 1440000000,
 		.hmax_min = { 1066, 533 },
@@ -522,11 +577,19 @@ static const struct imx415_mode supported_modes[] = {
 		},
 	},
 	{
-		.lane_rate = 891000000,
-		.hmax_min = { 2200, 1100 },
+		.lane_rate = 1782000000,
+		.hmax_min = { 1100, 550 },
 		.reg_list = {
-			.num_of_regs = ARRAY_SIZE(imx415_linkrate_891mbps),
-			.regs = imx415_linkrate_891mbps,
+			.num_of_regs = ARRAY_SIZE(imx415_linkrate_1782mbps),
+			.regs = imx415_linkrate_1782mbps,
+		},
+	},
+	{
+		.lane_rate = 2079000000,
+		.hmax_min = { 1100, 550 },
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(imx415_linkrate_2079mbps),
+			.regs = imx415_linkrate_2079mbps,
 		},
 	},
 };
-- 
2.52.0


