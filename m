Return-Path: <linux-media+bounces-59617-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nXjrJt9b7WltiQAAu9opvQ
	(envelope-from <linux-media+bounces-59617-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 02:27:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 095914687DF
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 02:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4370D301106D
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2026 00:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08621F131A;
	Sun, 26 Apr 2026 00:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjeyABAb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8971EEE6
	for <linux-media@vger.kernel.org>; Sun, 26 Apr 2026 00:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777163225; cv=none; b=uZp10suzXkv8je4wT9e1Dg6p8tKugcrBr9asNBhnweFmPBXWKHOfqo7rfEdAfnCljfd9waFKJtShuOG+eUoJew2uR2jpOpi3DLd98QFVv4SQX+9S89X6J50ugRaILJ3qvULqEHOBRogMMkyEcGq5rPAeT017ROaTc8HnDg2hHNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777163225; c=relaxed/simple;
	bh=YCLbslie3NiZPx9jQSuzjpl73nOvyJagEqFdIclfqOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YVve3ZJJnFpF3PrYCifJJXjHBRGqAnwFfL1V3oYwN+FfqznuDq/k0VGBfU6c4+cimwHR/YvMLhmYlvMiO2lrqy6VmjjIZfdPM1Nv9bBHmhFAwWP/TWPeEQUjU0daukvh5n7a2c7DBVvow2vXrR1FJynMjU/iNQC4UtoCpXm7jbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjeyABAb; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8e8c0c2d2bcso485084785a.1
        for <linux-media@vger.kernel.org>; Sat, 25 Apr 2026 17:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777163222; x=1777768022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kFNy+gHycOTnjB6H7mfknpfmC1xnEHBgISXSIOKUt5I=;
        b=GjeyABAbd368JpYsErYDwm/CgpdmzNROjbi5aAbZ0KCw/HDkp9+BOx1jR1E6uQ7nqt
         CIE15gBDoncgHr313xcgA/NEauikSqv96LBYZLH72frm7wnf2EL0nOl3luBHE5vb6ePK
         F2RJ+oPE8FMh7iCS/c8OT5xTkqKiPtdpoBHuxRric+Dnm4SHEalh7J0IL9AvOowQqhie
         45yNRn+Vzh1n0Nas58iyg8qeRqm2Qh62dAJnnGhnvtGZrweKESpnCNORuRgNP1vjA05v
         +BuLWmWruGHoXdIDiqhDgaa1cCH79I+ScofkYAUBYn6qk1wHngiZaJjNKF0AXPrQvIHz
         3vTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777163222; x=1777768022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFNy+gHycOTnjB6H7mfknpfmC1xnEHBgISXSIOKUt5I=;
        b=C04r75RrlJvPTPbgvDQVDzvwYtPy2msa/8Y5XiuQwLkTRYS4NT1ED4tCULgns/ODfX
         LQmFoWe4YQsE6R8FcEbjjQhTpwan43176qhN+a6wmDCWrzt4eDGyfu0GqSDtYLd1gUgL
         3JQ/XhfzSXqZmWfun0VhTnh9u0r0nYXv+F7r8aNIex3eoyjr0byYlJbRdIRjfZKh+9Hv
         P1UDTprRBybAnmTTincezJWAtb0p2S/RlSBAAIgBDq58LNxEmV3vsORDRgrCKDLLQArL
         XfWy2xNE1xnPcqgqc6T2bUPWFAkMOseWRvrgiVGNe2auBXFteu8XeW/3aG7flsRftbpq
         WQkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yYcCdZQ7/miiyV3Ul68v5z1GZk1rbiNZK5tBffCKNqdEESjx48W/qHuVyNpwIZ41KdrtsTfW7tlANpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybtpSrEz5TAWDx1yX54H3/oCPnks7yVzzFg3w8HHA872k83F/u
	lJc7f3oqwSn5J5CYjIk4UB6kKKX2NL844KKpoWMNCEpzmDg3XAgXqxCR
X-Gm-Gg: AeBDiesu51f/fp0aAGyGmZ2I5UjIWNBteixx05blAUBJ82ygHeKbDROAWDxPZ/LRi0Z
	+PKjyiPuwKqZ27rEoc6Z1bKB8iwEGe0BNWbnxp2bE8RVRqrgSa+uJpLa0sx8hVwaUXv7bIqIobF
	YwRVdcaJ+4OYTzq3+O8j7Sc7fAzQgBzKu/jz8p2JYkoO/OV7TgpIDjoiopD+O826k8VuqPAjppc
	94phl4T5xaG9OucPcAzqOoXBs7XiT5QXJ5AS+OJNBcLd11li+Oa7rAFYadaLbZIZpZyLLe2AUdI
	AfXLOsCpjbWiyP5RsMK/QmU/7tuYIGT24ovc7BNMVOLCKqx1tdrnnCNo2xN+SXYfJMgzikm4fyJ
	CtldUjLpDR60xp3KbFMjW4Zrh7r/vwS5uGiVSDcbRo/Zun8rLY7BYZeyQGsQiHeE8UPSYIb4ANS
	659Pos6RnABwUx8dYq/EvpTnjzhPwkCKhU8VdwHBH86mk4ukwwLBRS1fK4qQqAejIH8c1Jc3v9n
	VuSUQsQIaxXybP5xPeLmWrVFOHC0BbAbV2S6sKo2AjjLg==
X-Received: by 2002:a05:620a:708d:b0:8ed:d906:a8da with SMTP id af79cd13be357-8edd906ac96mr3551973485a.18.1777163221955;
        Sat, 25 Apr 2026 17:27:01 -0700 (PDT)
Received: from archlinux.tail090342.ts.net (h135-134-218-104.nwblwi.broadband.dynamic.tds.net. [135.134.218.104])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ef12122800sm1233988585a.18.2026.04.25.17.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 17:27:01 -0700 (PDT)
From: Vickram Kapoor <vickramk.207@gmail.com>
To: slongerbeam@gmail.com
Cc: p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vickram Kapoor <vickramk.207@gmail.com>
Subject: [PATCH] media: imx: ic-prp: add FORMAT_TRY frame interval support
Date: Sat, 25 Apr 2026 19:26:59 -0500
Message-ID: <20260426002659.119625-1-vickramk.207@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 095914687DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-59617-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[vickramk207@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Implement frame interval handling for V4L2_SUBDEV_FORMAT_TRY
by storing and retrieving per-pad intervals from the subdev state.
Also add a PRP-specific init_state callback to initialize TRY intervals
from the active default, and move default interval initialization to
prp_init().

Signed-off-by: Vickram Kapoor <vickramk.207@gmail.com>
---
 drivers/staging/media/imx/imx-ic-prp.c | 89 +++++++++++++++++++-------
 1 file changed, 66 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 2b80d54006b3..a5c17bd4f783 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -88,6 +88,18 @@ __prp_get_fmt(struct prp_priv *priv, struct v4l2_subdev_state *sd_state,
 		return &priv->format_mbus;
 }
 
+static struct v4l2_fract *
+__prp_get_frame_interval(struct prp_priv *priv,
+			 struct v4l2_subdev_state *sd_state,
+			 unsigned int pad,
+			 enum v4l2_subdev_format_whence which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_state_get_interval(sd_state, pad);
+
+	return &priv->frame_interval;
+}
+
 /*
  * V4L2 subdev operations.
  */
@@ -398,22 +410,26 @@ static int prp_get_frame_interval(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_interval *fi)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
-
-	/*
-	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
-	 * subdev active state API.
-	 */
-	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
+	struct v4l2_fract *interval;
+	int ret = 0;
 
 	if (fi->pad >= PRP_NUM_PADS)
 		return -EINVAL;
 
 	mutex_lock(&priv->lock);
-	fi->interval = priv->frame_interval;
+
+	interval = __prp_get_frame_interval(priv, sd_state, fi->pad,
+					    fi->which);
+	if (!interval) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	fi->interval = *interval;
+out:
 	mutex_unlock(&priv->lock);
 
-	return 0;
+	return ret;
 }
 
 static int prp_set_frame_interval(struct v4l2_subdev *sd,
@@ -421,24 +437,51 @@ static int prp_set_frame_interval(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_interval *fi)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
-
-	/*
-	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
-	 * subdev active state API.
-	 */
-	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
+	struct v4l2_fract *interval;
+	int ret = 0;
 
 	if (fi->pad >= PRP_NUM_PADS)
 		return -EINVAL;
 
 	mutex_lock(&priv->lock);
 
+	interval = __prp_get_frame_interval(priv, sd_state, fi->pad,
+					    fi->which);
+	if (!interval) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	/* No limits on valid frame intervals */
 	if (fi->interval.numerator == 0 || fi->interval.denominator == 0)
-		fi->interval = priv->frame_interval;
+		fi->interval = *interval;
 	else
-		priv->frame_interval = fi->interval;
+		*interval = fi->interval;
+out:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int prp_init_state(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *sd_state)
+{
+	struct prp_priv *priv = sd_to_priv(sd);
+	struct v4l2_fract *interval;
+	unsigned int pad;
+	int ret;
+
+	ret = imx_media_init_state(sd, sd_state);
+	if (ret)
+		return ret;
+
+	mutex_lock(&priv->lock);
+
+	for (pad = 0; pad < PRP_NUM_PADS; pad++) {
+		interval = v4l2_subdev_state_get_interval(sd_state, pad);
+		if (interval)
+			*interval = priv->frame_interval;
+	}
 
 	mutex_unlock(&priv->lock);
 
@@ -450,10 +493,6 @@ static int prp_registered(struct v4l2_subdev *sd)
 	struct prp_priv *priv = sd_to_priv(sd);
 	u32 code;
 
-	/* init default frame interval */
-	priv->frame_interval.numerator = 1;
-	priv->frame_interval.denominator = 30;
-
 	/* set a default mbus format  */
 	imx_media_enum_ipu_formats(&code, 0, PIXFMT_SEL_YUV);
 
@@ -487,7 +526,7 @@ static const struct v4l2_subdev_ops prp_subdev_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops prp_internal_ops = {
-	.init_state = imx_media_init_state,
+	.init_state = prp_init_state,
 	.registered = prp_registered,
 };
 
@@ -504,6 +543,10 @@ static int prp_init(struct imx_ic_priv *ic_priv)
 	ic_priv->task_priv = priv;
 	priv->ic_priv = ic_priv;
 
+	/* init default frame interval */
+	priv->frame_interval.numerator = 1;
+	priv->frame_interval.denominator = 30;
+
 	for (i = 0; i < PRP_NUM_PADS; i++)
 		priv->pad[i].flags = (i == PRP_SINK_PAD) ?
 			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
-- 
2.53.0


