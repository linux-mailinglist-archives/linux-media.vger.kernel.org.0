Return-Path: <linux-media+bounces-67394-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G7GeGFCAU2q/bQMAu9opvQ
	(envelope-from <linux-media+bounces-67394-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 13:53:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A51A07448B4
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 13:53:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=h8hoPcSw;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67394-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67394-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0605302EEAD
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 11:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1715F3A4267;
	Sun, 12 Jul 2026 11:52:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3766E399013
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 11:52:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857140; cv=none; b=J5YeRyBDmX2M68JJr9HZsKyhTl2OMJM84hVokgWijzFxrM0wyWVb3uVBTk6BXG+KANpSxW3D9gFcZA7epzyBZHdxHlP9ZZ92fGNBdDnHva//Z7DlgActbJBzLiTA+LO/qlQfvQFe/i0xpNJZiE6kSKVEYE2t/eXbrxNIha1yCHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857140; c=relaxed/simple;
	bh=ELSJMQXL8Zru1De6Jbuvh+FbhtE/z4ZYFGJkBObEBrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CCYosVqjd+sG5hlYMzddAezoQhihOYc4ZadhBkWbsQu1H8HqCZn9ar/2UdNowI66e0SUKGdu3jiVnLmCmGDTnIdhJq3MCioS7hbSyAXcCmJwKP4RbUD2gonF6dX+qatRSVor8QFLNfOxsOrnKPQeMhXcLZGNobP2tatrXWxzJIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8hoPcSw; arc=none smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ce7d2adef4so30416025ad.3
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 04:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857139; x=1784461939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1McK7dycxu+dxlJjQrMq0eguudKjuI/eVOvUi+pvIE=;
        b=h8hoPcSwk4ysL9Patlmx28a2XN5Hn27V0AJpthK+LOZLj+fGt/sBHnfcjEREyVH2jE
         vOkHjTy8uFW0MJ5eu+b2UMFSsIQiU7/pAKbZIy6xUFsJV7KYzb+s17UOtelUNxm67Att
         ZMorQB5cvjFJEXGRUOIJkuybNlLHNjTvgsWZi4BXSwGRigs3vOyQ1h7C171Pi6+xCRWF
         kOpFoO5+wxj9+cEyfBZoUV2WuyqwMDN563O2RtYB7WXEMu8zJGUUtxH6ZmXxkuRtwqe7
         F7dsWU/MBtIZzrEW/DXRPhixyAvp4NRO+scSEaQcWBpWfN+RjYEUl6y9UUd32V8XTHNA
         bUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857139; x=1784461939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1McK7dycxu+dxlJjQrMq0eguudKjuI/eVOvUi+pvIE=;
        b=EcF8NskodxYu5kr0McM6JbJZNZyPdrxn7YKhj8leWuqqfSMTKfOIpaR01DijqgGP/N
         fPZq221bgX6ltCCX4VEXylfeAnJqgvHYtqX95SAlCJTksBpaDOCtxL2y4eTxGoFiTHeR
         aqNLsOMA4u38z0cB7ky40t3Ebt4W6lBkPleLRmJF88SsfLjoj6uPWsKz3zffXGLO8GZp
         MJKKjEErU9/u8vKuW3+8MmQuSqys+XoEz7otkszxBwG9Qk80443+WWFCus469e03boaf
         n+x46tCNup3FEGvXdrBJHG79vaSbFEAudBnYfOWn5jg/wCHDdGrQa5nhYOTSnaU8Frvj
         2vDA==
X-Forwarded-Encrypted: i=1; AHgh+RrGyOHAf1YUtn/aS1mLlwKwMhKbbXb4j3TG2RVE2bYakwP6zAQfRslLa0bCTfYkA52N6qTQUmv4lxp+lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVI4bbTvzNCJKZOeRrFisMcCLhfjtDHneSTg/PdRu1qJxkLj7A
	xrTZGszNN0Wf2mxtwLeRU2nk36QsxQMimmRdtOv1uvCap2tSvqVfU2Ui
X-Gm-Gg: AfdE7cn9rEClEyKaHrvDf+Rx3coz3RWatNr5KWWky6PzUWX8CJ+dl09bzHQEHR789KI
	X+60kWSHUegX5cLWWkatgmungza/wNDhWl1sVHMYOf6waFEAVkMu4g7aif3YiVwnEhDc8WPHMna
	f/P6uajFk74ZYjTp8Ek5fHe11Q07ez1ZkUP7kt4bBwxTGGC7IRvZaJlSOhAA9Mf82t0dD6wfLTc
	80OFHdHMoIIdBo3Q0YGxEFJCmAwKxTbEiMRVD31pKuJezshbK2OB85plMYYfXm85NBkB+6sp7pO
	38zHuxrNTPFnHA0NeZ5ChLiz2x/gvQbYEknlhmtz2Ni9kVpGYjtdzE8t26SaWjX5yUU8rzpQRBx
	Sj93BL8p5VdwfNu/x+SZGEDfDxii13yAaLWTrbzffnr9OYm0O4SjHa4HbzJj8JDfNCm1MS4l4d5
	bI8EOZiuuuvhy+wJyw49rbZ+I+aLx7JZVdHBnswDs=
X-Received: by 2002:a17:902:ef0a:b0:2ca:9ab:e725 with SMTP id d9443c01a7336-2ce9e59d62cmr57706585ad.1.1783857138522;
        Sun, 12 Jul 2026 04:52:18 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfe040sm84538295ad.31.2026.07.12.04.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:52:18 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v5 3/5] media: hi846: Fix modes handling for different lane cases
Date: Sun, 12 Jul 2026 19:50:10 +0800
Message-ID: <20260712115012.91600-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712115012.91600-1-mitltlatltl@gmail.com>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67394-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:sakari.ailus@linux.intel.com,m:martink@posteo.de,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:sebastian.krzyszkowiak@puri.sm,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linux.intel.com,posteo.de,puri.sm];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A51A07448B4

When using 4-lane, v4l2_find_nearest_size may return an unsupported
mode, 640x480 mode, use v4l2_find_nearest_size_conditional() to fix
it.

Reported-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Closes: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm
Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v5:
- Use v4l2_find_nearest_size_conditional() to filter for different lane cases. (Sakari)
---
 drivers/media/i2c/hi846.c | 58 +++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 6bcd862aee30..1223567641c4 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1688,6 +1688,16 @@ static int __maybe_unused hi846_resume(struct device *dev)
 	return hi846_power_on(hi846);
 }
 
+static bool filter_by_mipi_lanes(const void *array, size_t index,
+				 const void *context)
+{
+	const struct hi846_mode *mode = array;
+	const struct hi846 *hi846 = context;
+
+	return (hi846->nr_lanes == 2 && mode->reg_list_2lane.num_of_regs) ||
+	       (hi846->nr_lanes == 4 && mode->reg_list_4lane.num_of_regs);
+}
+
 static int hi846_set_format(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *format)
@@ -1710,20 +1720,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 		return 0;
 	}
 
-	if (hi846->nr_lanes == 2) {
-		if (!hi846->cur_mode->reg_list_2lane.num_of_regs) {
-			dev_err(&client->dev,
-				"this mode is not supported for 2 lanes\n");
-			return -EINVAL;
-		}
-	} else {
-		if (!hi846->cur_mode->reg_list_4lane.num_of_regs) {
-			dev_err(&client->dev,
-				"this mode is not supported for 4 lanes\n");
-			return -EINVAL;
-		}
-	}
-
 	mutex_lock(&hi846->mutex);
 
 	if (hi846->streaming) {
@@ -1734,9 +1730,12 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	hi846->fmt = fmt;
 
 	hi846->cur_mode =
-		v4l2_find_nearest_size(supported_modes,
-				       ARRAY_SIZE(supported_modes),
-				       width, height, mf->width, mf->height);
+		v4l2_find_nearest_size_conditional(supported_modes,
+						   ARRAY_SIZE(supported_modes),
+						   width, height,
+						   mf->width, mf->height,
+						   filter_by_mipi_lanes, hi846);
+
 	dev_dbg(&client->dev, "%s: found mode: %dx%d\n", __func__,
 		hi846->cur_mode->width, hi846->cur_mode->height);
 
@@ -1819,6 +1818,8 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct hi846 *hi846 = to_hi846(sd);
+	int i, count;
 
 	if (fse->pad || fse->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
@@ -1828,15 +1829,24 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 		return -EINVAL;
 	}
 
-	fse->min_width = supported_modes[fse->index].width;
-	fse->max_width = supported_modes[fse->index].width;
-	fse->min_height = supported_modes[fse->index].height;
-	fse->max_height = supported_modes[fse->index].height;
+	for (count = i = 0; i < ARRAY_SIZE(supported_modes); i++) {
+		if (!filter_by_mipi_lanes(&supported_modes[i], i, hi846))
+			continue;
+
+		if (count == fse->index) {
+			fse->min_width = supported_modes[i].width;
+			fse->max_width = fse->min_width;
+			fse->min_height = supported_modes[i].height;
+			fse->max_height = fse->min_height;
+			dev_dbg(&client->dev, "%s: max width: %d max height: %d\n", __func__,
+				fse->max_width, fse->max_height);
+			return 0;
+		}
 
-	dev_dbg(&client->dev, "%s: max width: %d max height: %d\n", __func__,
-		fse->max_width, fse->max_height);
+		count++;
+	}
 
-	return 0;
+	return -EINVAL;
 }
 
 static int hi846_get_selection(struct v4l2_subdev *sd,
-- 
2.54.0


