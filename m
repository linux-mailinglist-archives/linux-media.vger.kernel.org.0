Return-Path: <linux-media+bounces-64404-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l8e7K5A7KWruSgMAu9opvQ
	(envelope-from <linux-media+bounces-64404-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:25:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB176683CC
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:25:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gMZGnf14;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64404-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64404-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43CD4308D6BC
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050143EFD05;
	Wed, 10 Jun 2026 10:22:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10562F5337
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 10:22:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086963; cv=none; b=evGFqQRVVkDV1yQYKka3004TnRLj+qKAPvkJyb5Ohn5oKmT1Y248qVKLa7UTNZVVxVOPAui5J8JVLgBac5cK7T0t67+rx4mgFOtMlKHO2C+lOehGoaLP3yYNwMyrsG8XcjCSP7eI7QziSY2jDm1zQ4Cw5m4lwST4BQ+M+PZ4U3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086963; c=relaxed/simple;
	bh=jtxCmEnyVZ7I4mybG5ysoMHIaJeBLKP0rlxXW5TM770=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pqlSTwibMKRFRunjRlbCwoTrgnyfjdwcT24qKs/RDG65E9dop9KFbYYDhdQUy63MTxD+feXuVCxiCv25ukdZR6t4YLrAqcPZzuseda8CmDwfdcOY6ApzzS0LYLTie2De+dpu6yH81Oh/7ySoNwVPSOFP3Ew6UUxD92hu4jSNX5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMZGnf14; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so73101705e9.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 03:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086960; x=1781691760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SLaP4natyxsSyEsa4HE0hskJcWWNISJpoxCsB6+PCc=;
        b=gMZGnf14s4fMiHSMMZXuPMp32e689/7e9jF7UNv94bYZnu1xwaUKaN61Jgplyb6JJv
         ulF95zN7CcMW1V4o/QgdXZY4wExIGDUpzbC+8rbvdnGfXljRs9PdUwNB5nfUWPdzyZ9F
         BKftKWJCOpy93wajRJrMzKeMJ3DjsUY+lLAEAXACXGjHfSi9pDgt/vLf4iPd3DJsS3Ja
         C92O0S0lxcWnvA/Mh5n7CwocUX5+qF9PEBtFlMaQCoKMx5uYXH2khOlDHTyeTIpMfBgV
         BO51NlvxZp7x1TEYl1e9lapntkVOxTbhyNHT8bwgPXC/yv3Zv/AtYceM7ZEKgU/RKOvn
         5hlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086960; x=1781691760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0SLaP4natyxsSyEsa4HE0hskJcWWNISJpoxCsB6+PCc=;
        b=RFdwz5oTTVOUolsQV0SaxaBr1DFfH7t4pSBBdDhCTaRzp6n9tz6vnf/9lrWSRDtGjr
         RLLK2bF0h8OWuFM6L+nJF3A4S3X8oKSqidsCDN0YgD53U/4243vTZ5zkxYWC7jfMXOLv
         ip6OPYaOhNW56b1zwyGDyUfOB+BY0enk81bLZICuqktB3k1snW1rituM4VHC6bHNfBN2
         ULK08LlTmmNhCqeDA54u4Pg9OMuJL5ZRg4jfbYQbZTgZX2HVUqfFMHWdvJZVIqWL5agJ
         oBI735pySJA2seKywJhwiNfh8nwlaMf0mpnKAoAk6l5YK9kQOmtKmwmf14FxFNPVjlxB
         w7hw==
X-Forwarded-Encrypted: i=1; AFNElJ9lRGejLfj1JJ7gvbo8lKzthgkf47rkBgp+ef0Mv7WozSGxh0PtVUN5FFmNh3VaOHw+kbzkzzjc+3NNmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+QEtlfgJ1W6h2gyeTK7XLI07aZ7pnoyemwlhIjRpNIIqeSsDO
	C7Jfg6ztiQByLtlLmlbWgBVsomMjzfFbz62YkvuWM6hapG30YVkbX1J9
X-Gm-Gg: Acq92OGYLglxwkl+VuNHsK0yTaG4f38Rfjt+Z7FmjvABMVhNT+GU2ITaxj1+5K9Y4SO
	Yx+HhOSzUUL1jxdntO8eCxGNY8qySmGANR01neJIws9pD3Qo/Gi0fvQTCm9Jb1q4amP4B552+Sw
	nuIHvz/qIk127wNkMslGR+ES0obr8qlY/HPgPWNcRYSp6hsNbybW3KWExXi08u6uM2PwP7Alf+8
	V3cefRZRYhjjFbBhwoZykTZPNY2eSuifvYTLPlpN/gZm9PFndtue3c1cXi+lOrRyhjqgV1m32Fw
	z1FXs12Tk13qyX+nkCVvB+6RajTgN9HZuifLU00Pi+CeNrF2X2DDEqMnvTc1/pMZteQKAd3/3go
	XmPT2CDddbGnzJlNhv2lkwAc/WLhNwyg/ceT+8qfAF6N6tKAHvjqQh587Jr5tBFXkJVByUXI3De
	QqAUHqbSXl9q8p+T17hbpQID5TeYieYuCKCgt4tDkjcbV9OLcSbjmFenU35Cq6ZjitixJ2HW/PO
	9U5GczA/4kT9LU=
X-Received: by 2002:a05:600c:e548:10b0:490:d2a4:1b59 with SMTP id 5b1f17b1804b1-490d2a41c3bmr112751805e9.31.1781086960084;
        Wed, 10 Jun 2026 03:22:40 -0700 (PDT)
Received: from garuda ([79.106.123.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35eae5sm71360831f8f.33.2026.06.10.03.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:22:39 -0700 (PDT)
From: Jurison Murati <eng.juri@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: ov8865: Program the sensor on stream start
Date: Wed, 10 Jun 2026 12:22:37 +0200
Message-ID: <fa341298dfd2ba9ce431e21c2cf45002efacf2cf.1781085860.git.eng.juri@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <6b764b77a7d78b8ae2cfb8a213a1e844a329db26.1781085860.git.eng.juri@gmail.com>
References: <6b764b77a7d78b8ae2cfb8a213a1e844a329db26.1781085860.git.eng.juri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:dan.scally@ideasonboard.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[engjuri@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64404-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[engjuri@gmail.com,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FB176683CC

The sensor registers are only written in the runtime PM resume
handler; ov8865_set_fmt() merely stores the requested mode, relying on
the sensor being runtime suspended between uses so that the next
resume applies it.

That assumption breaks when something keeps the sensor powered. On
IPU3 platforms, ipu_bridge instantiates the VCM device with a
DL_FLAG_PM_RUNTIME device link to the sensor, so a userspace process
holding the VCM subdev open (e.g. wireplumber's camera monitor) pins
the sensor runtime-active. A subsequent set_fmt() then never reaches
the hardware: the sensor keeps streaming the mode programmed on the
last resume while the CSI-2 receiver expects the newly negotiated
format.

On a Surface Book 2 (IPU3, ov8865 + dw9719 VCM), requesting the
3264x2448 mode while the hardware was left programmed for the
1632x1224 binned mode makes ipu3-cio2 report "frame sync error" and
"payload length is 10340352, received 2585088" (exactly one binned
frame) for every frame, and the inverse case stalls the stream after
a single frame. Camera applications end up displaying one bogus frame
forever.

Program the sensor configuration and apply the control values on
stream start instead, where the negotiated mode is always current,
and only write the configuration in the runtime PM resume handler
when resuming with the stream already started.

Signed-off-by: Jurison Murati <eng.juri@gmail.com>
---
Changes in v2:
- Drop the hw_mode/hw_mbus_code state tracking. Instead, program the
  sensor unconditionally on stream start and move the configuration
  writes in the runtime PM resume handler behind the streaming check,
  as suggested by Dan, keeping mid-stream suspend working while not
  adding state outside the sub-device state, as requested by Sakari.
- Rebased on top of the runtime PM usage count fix (now 1/2), reusing
  its unified error path. This was 1/2 in v1.

 drivers/media/i2c/ov8865.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 5b909a8..c6d53c3 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2609,7 +2609,7 @@ static int ov8865_s_stream(struct v4l2_subdev *subdev, int enable)
 {
 	struct ov8865_sensor *sensor = ov8865_subdev_sensor(subdev);
 	struct ov8865_state *state = &sensor->state;
-	int ret;
+	int ret = 0;
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(sensor->dev);
@@ -2618,7 +2618,23 @@ static int ov8865_s_stream(struct v4l2_subdev *subdev, int enable)
 	}
 
 	mutex_lock(&sensor->mutex);
-	ret = ov8865_sw_standby(sensor, !enable);
+
+	/*
+	 * The sensor may have been kept powered by something else (e.g. the
+	 * VCM's runtime PM device link on IPU3 platforms), in which case
+	 * runtime resume did not run and the hardware may still be
+	 * configured for a previous mode. Always program the negotiated
+	 * configuration on stream start.
+	 */
+	if (enable) {
+		ret = ov8865_sensor_init(sensor);
+		if (!ret)
+			ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
+	}
+
+	if (!ret)
+		ret = ov8865_sw_standby(sensor, !enable);
+
 	mutex_unlock(&sensor->mutex);
 
 	if (ret || !enable)
@@ -2914,15 +2930,15 @@ static int ov8865_resume(struct device *dev)
 	if (ret)
 		goto complete;
 
-	ret = ov8865_sensor_init(sensor);
-	if (ret)
-		goto error_power;
+	if (state->streaming) {
+		ret = ov8865_sensor_init(sensor);
+		if (ret)
+			goto error_power;
 
-	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
-	if (ret)
-		goto error_power;
+		ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
+		if (ret)
+			goto error_power;
 
-	if (state->streaming) {
 		ret = ov8865_sw_standby(sensor, false);
 		if (ret)
 			goto error_power;
-- 
2.54.0


