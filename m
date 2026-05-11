Return-Path: <linux-media+bounces-61085-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id awltNWm0AWo2iwEAu9opvQ
	(envelope-from <linux-media+bounces-61085-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:50:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 762CC50C369
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69168309C5EE
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 10:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5713DA7F9;
	Mon, 11 May 2026 10:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTribr/m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B193D9DCD
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496202; cv=none; b=josbFwLC3nbjjtLP8biJcUSMWsXZjJSXHv6Qh8Ac/TcfsqcJ4NJKoDGXqYVYrPHr9PDHv3vY3fJbbVNKIsYa/lxqFYqm+ToilNvD5cRxcieFwSWaQaOZqu+jazVS1zi1aqZeKPw1Ml9dKqLIXDcTlU8lDDs9Qbo/ripKAs7MhKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496202; c=relaxed/simple;
	bh=Arh65FwgpuoQyK0HMQPAmmIpzCVfFvZU3gN/HmExq5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FpDhwulw4otB8IPnNm0nSAFl0ZszuxW6jkrAoJiZyI8D1GJrwX52qzwhLPyWuFDYLXy68BlhFtPMBlRjMZ0q9bXHaHjB6wVRuRks3Us9zj342sxydmTNTdvR7FW02qK46LFGEe41ktmznRrM9WX7Q5140CIbD2Xk7BiCKaU0dYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTribr/m; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3667cf0136fso2336037a91.2
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 03:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496200; x=1779101000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRXDOC53itDbvSH3E3HyxAV1yZ2/7SesuEGqqAx3Huo=;
        b=GTribr/mh2Ti4TE9bjSPs5RsdDpXreue5rGGMRR1P1ZMU1ZFvxd/TC5rileFOBOlUZ
         kggNLzORFR0NgyhBWFZiVH+XHO79bZHPLpvNiYi59gC6jWng6hMYw/mHEWj6t1wMPTGX
         PROPxdSpGnqTBBgPtqWNMOgR3FKdsJG8NeqamqsI+5txPgvNxVypDQ2Y50gi9Q68qY2q
         HhZ4tkEbo6oIFsdwkE/F5Mbj62NNsl0Q6vn3NLaYxb+cBe68GTLtN9D8gg4AmXyS2vvi
         QxufEjeT7ljXeHv97ITsh+EP7yLbVdHoKcpWEOWbriPauJQos3tPyAYwQeKDl51YlDBw
         V62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496200; x=1779101000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DRXDOC53itDbvSH3E3HyxAV1yZ2/7SesuEGqqAx3Huo=;
        b=YUw3gGy4Lxa56qUofxSJLdGBAKPd1XaBkkRJV/t81w2LcLObXeEwklFVMx0sSEnA+n
         ObcHIHGJWfb9wTVdyyKcQOoTvz5/2tbPK+R5iNUt7v4uI2pF9wM/DZ863PZeIlj2bhHj
         pwthqxZcvZ8foQrqrLysZ0EVenPvx1IPOeGkIzg+Xa4P0ObVcL4w8gzoUjfJtXoefC1d
         7vE78injHpM2oNV3iCL9IqClJ8JbIhCVDWeuSZEoC9zxP5lZaVsvR/JNbzGTx86FOYyK
         pMuaOHcQSTiMY9JcR6sCz2TdJanl8yArC6iGzUobG3PAFF2M2m7atF85lEQMMjTfib85
         gIfA==
X-Forwarded-Encrypted: i=1; AFNElJ//N48FGY2slVsjWOjFT/6u987+M/OWg9Ha2oNAm7a9d5UVZZ++20ld0sGFnILGA/KGBnTQMqQBm1l0ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE/rMoERYtGAKaetGqG+LlNzA43zjuDH9nlHVQg105WYqW+Oi1
	c0g7/oPjl2YpfmN2aveuURHl3uQtzmS0O6DwW6ZbvyjZ2Yu91j5PWXc1
X-Gm-Gg: Acq92OH9xmYmcvhtB4JGlzsZFHlKXSJAlvVUDj7V+lkG6MMKoovKsmU8YFOrO1EfZ0s
	11C6c8y9Hz3Y42GYxTpMYIVgLYiPYjd7yw7dFD09pndpI8bequ71XNOaoftc3/lPHqJAatOTyvH
	ok/ududbeVNOPsdQR1O+Jaq0czYo3KIP3LUBMNqrL6z9qPz5tdCFMJdHuwZSeyUNTlecc9xZ4VY
	thUD9RA3qPhScDgF1Bk5AcBMN8n1VLqhtZXBGDpv99bWfkUq7hYQK7C6EAVwrmTQdxLxus0IOe0
	eJ7osjJ1vX3D7tP2u6YcKj0eLiDte4NDxEGYHEYmjrOhl6uD+0rZnG4PzfE2pGyoITAe12KNqcX
	q5fXqNj8Yg5KZYQciTlnlFBdiDcO7AxxdCxG16U1g2n6RzZslosqz+KflBIkeLtUvpp1om+mTca
	ijQ1+pnZzZuP4I/xM5khFWhsLVwQrM
X-Received: by 2002:a17:90b:3903:b0:367:f9f1:af78 with SMTP id 98e67ed59e1d1-367f9f1b66amr8598826a91.7.1778496200549;
        Mon, 11 May 2026 03:43:20 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:43:20 -0700 (PDT)
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
Subject: [PATCH v4 3/5] media: hi846: fix modes handling for different lane cases
Date: Mon, 11 May 2026 18:39:25 +0800
Message-ID: <20260511103927.279550-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511103927.279550-1-mitltlatltl@gmail.com>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 762CC50C369
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61085-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linux.intel.com,posteo.de,puri.sm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.938];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,puri.sm:email]
X-Rspamd-Action: no action

When using 4-lane, v4l2_find_nearest_size may return an unsupported
mode, 640x480 mode, and it is set to the default mode.

To fix it, specifying the supported modes for different lane cases,
once the lane count is determined.

Reported-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Closes: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm/
Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 61297ef66a0e..c77b34a5e166 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1130,6 +1130,8 @@ static const struct hi846_mode supported_modes[] = {
 		},
 	}
 };
+#define NUM_MODES_2LANE		ARRAY_SIZE(supported_modes)
+#define NUM_MODES_4LANE		(ARRAY_SIZE(supported_modes) - 1)
 
 struct hi846_datafmt {
 	u32 code;
@@ -1162,6 +1164,8 @@ struct hi846 {
 
 	struct mutex mutex; /* protect cur_mode, streaming and chip access */
 	const struct hi846_mode *cur_mode;
+	const struct hi846_mode *supported_modes;
+	int num_modes;
 	bool streaming;
 };
 
@@ -1736,8 +1740,8 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	hi846->fmt = fmt;
 
 	hi846->cur_mode =
-		v4l2_find_nearest_size(supported_modes,
-				       ARRAY_SIZE(supported_modes),
+		v4l2_find_nearest_size(hi846->supported_modes,
+				       hi846->num_modes,
 				       width, height, mf->width, mf->height);
 	dev_dbg(&client->dev, "%s: found mode: %dx%d\n", __func__,
 		hi846->cur_mode->width, hi846->cur_mode->height);
@@ -1821,8 +1825,11 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct hi846 *hi846 = to_hi846(sd);
+	const struct hi846_mode *supported_modes = hi846->supported_modes;
+
 
-	if (fse->pad || fse->index >= ARRAY_SIZE(supported_modes))
+	if (fse->pad || fse->index >= hi846->num_modes)
 		return -EINVAL;
 
 	if (fse->code != HI846_MEDIA_BUS_FORMAT) {
@@ -1950,12 +1957,12 @@ static int hi846_identify_module(struct hi846 *hi846)
 static s64 hi846_check_link_freqs(struct hi846 *hi846,
 				  struct v4l2_fwnode_endpoint *ep)
 {
-	int freqs_count = ARRAY_SIZE(supported_modes);
+	int freqs_count = hi846->num_modes;
 	u64 link_freq;
 	int i, j;
 
 	for (i = 0; i < freqs_count; i++) {
-		link_freq = hi846_get_link_freq(hi846, &supported_modes[i]);
+		link_freq = hi846_get_link_freq(hi846, &hi846->supported_modes[i]);
 		for (j = 0; j < ep->nr_of_link_frequencies; j++)
 			if (link_freq == ep->link_frequencies[j])
 				break;
@@ -1999,6 +2006,13 @@ static int hi846_parse_dt(struct hi846 *hi846, struct device *dev)
 
 	hi846->nr_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
 
+	hi846->supported_modes = supported_modes;
+	hi846->num_modes = NUM_MODES_2LANE;
+	if (hi846->nr_lanes == 4) {
+		hi846->supported_modes = supported_modes + 1;
+		hi846->num_modes = NUM_MODES_4LANE;
+	}
+
 	if (!bus_cfg.nr_of_link_frequencies) {
 		dev_err(dev, "link-frequency property not found in DT\n");
 		ret = -EINVAL;
@@ -2088,7 +2102,7 @@ static int hi846_probe(struct i2c_client *client)
 	if (ret)
 		goto err_power_off;
 
-	hi846->cur_mode = &supported_modes[0];
+	hi846->cur_mode = &hi846->supported_modes[0];
 
 	ret = hi846_init_controls(hi846);
 	if (ret) {
-- 
2.54.0


