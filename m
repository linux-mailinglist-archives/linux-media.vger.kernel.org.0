Return-Path: <linux-media+bounces-64864-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JyG5CrEPL2qO7gQAu9opvQ
	(envelope-from <linux-media+bounces-64864-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:31:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E126822F2
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 22:31:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dcJWX1TX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64864-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64864-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A251B3011F2B
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028B131E856;
	Sun, 14 Jun 2026 20:30:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBEA2FFF8D
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 20:30:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781469057; cv=none; b=rdQ0xGd/xG/zQbKvgNgPsTHE2AY+9MKIzW8iPa4nfv+4/OLjyrNHMmecE2/OJ71cz4AIeckBkIGq5MFp84+GVSPXxivQEqEZ5/OykZGpwayW9bbHkX8o5HXjMh0pOKroUZRmFcNLg/OI1PC3RpNDhfP5/LeZghSBR5K9Ns3Q39w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781469057; c=relaxed/simple;
	bh=rSCo/akBYGtVS7sR9AfcdpFZ+U9t7v+fmjBTrZeWhRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVwomPM7ud+xTrRHsedbfjY6Mg3Qr9zDWmVBStSm+7mhgKhXmTygptwfG3cMmiPFPy7XY1znrAzAWRQpU6DeYS3dR/NXi09AuZ5V0vR0LMPksUPRFU0O7JzlBW96+BgYdZiieB2GH/Cyo+/Epw5Wx1xABh9unMC4d9gYITVmRoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcJWX1TX; arc=none smtp.client-ip=209.85.216.52
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36c68964315so1355506a91.2
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 13:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781469056; x=1782073856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHsAcKvWPIsAqo8fcZi3AQFBCbARIH0MASezqJ4sMZc=;
        b=dcJWX1TXUHIoj3GMFH+73pwOZ2+RpxgDg7hBYeLWJl+BwlEYnlH15gSKHDX2uzJa0v
         bXxLdP1BvGA1xxcHu4ha8wN9eCEvs22P4Tu5ZLKQj+XYyvaSimsj6Tm8PeVykmPvz0fs
         0P+DsAoFuc8RSwFe2sfeeerDeJaBYOWFBVTnvVRjqvse6LkIGcMesETU9lKV5FtzZZzV
         /EiXpC5vsdeHy1/rKvQE/jJOqYVHnVNh5MA+us0tMibythmrDTyPMbJhXunUz/rhx/Mf
         5sJ2Ivq1KGee9wnSqG2tCZwweM2RtEkVMGEKB+8IkSG0ORptLWWutjt2mr2gzayiWAYi
         +32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781469056; x=1782073856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uHsAcKvWPIsAqo8fcZi3AQFBCbARIH0MASezqJ4sMZc=;
        b=PQn1fwhWb1xDm/TdaHCJgXFLEhJyogEtWLXypSvMH0FYYxyX410EzS3J4fu6UotBSy
         PfnyPvMOAer1ncQ2cBYBBDymDcO6557HGhGLxrxm0ewuLxlp6fvNC9wSOHTeCGq1slV0
         qYVcHbG6RRlBdb6VeG/jRXsh5j8vrjfCdIe1kujaDkNb0ZBUURMhx49VVrXG+stnsgtB
         QGIn3AZ7aeAzvzbxJTeiQPGaAx9ob30gnOz+hufYTFnInbUdhJvy9LfRecS7X0pgXvyd
         7Mv86AX6AAGOY0GYk9bSw0D3SbagbsZ3GJESVUeZmOHy9BWBGLkCmjSAmI9/arkqNrAL
         yDwQ==
X-Gm-Message-State: AOJu0YxHPQnAJD3NpXx57ugKqZ95le4QY5M8ncBRtEn6gOkCSVSW9zMI
	unXSO9VFv3EccGVbjKStr1yck2dG7ranI9O4Qe1qHXC6dX5Letk9/9no5vHrFmXY
X-Gm-Gg: Acq92OEyQLxTkmlW/7vhRGFVOmltscoZq9Vg6ma8ep/XUX9MehbLr+4NXeeSvIw9wql
	jgSgTscUA+dFARBo+9dkFwqbfwz+tYsc0SspJ3EyRP5SXW6+xRYTw6cJT1mlL4zUp6luZkwnUBk
	dkCp6mf+LJH5/2t4oCX6ttQ0tj2hkCtODAGDCB3YI3nQ1yfv2DP+BW53dwBJanL0s6LQgqZm8vQ
	lHkeB+VwQ2t1awQRHAqEHk8Ht2F3iOccQkQooRB0d4P5GrkFuSMS6KsaKMSZVCCgnKCBxC3UDqr
	v/DYon8ByWxq7jorWVnDqugZ4qPvYaNuA/bkQFyr+cDKMIrtb2GMTIJyXQpl6/AGNp1e0FyUJn1
	UhNoQKUC4DOkSPFQ231u2uk/1GeFuUwLyJBD7MYS35m6lnDEAjeWLbi2kklvTQQae+DfgpsOc/m
	i2D1qnTy5Du27gPeGQYGGQhaFZTTZQBnl2s0yX58siwsjZ3SlSObTPFic3HLXBXxM=
X-Received: by 2002:a17:90b:1348:b0:36d:b12f:6143 with SMTP id 98e67ed59e1d1-37a04784e81mr11628323a91.25.1781469055730;
        Sun, 14 Jun 2026 13:30:55 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm5439828a91.2.2026.06.14.13.30.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 13:30:55 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Michael Krufky <mkrufky@linuxtv.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v3 21/22] media: usb: dvb-usb-v2: Add missing media_entity_cleanup()
Date: Mon, 15 Jun 2026 01:58:21 +0530
Message-ID: <20260614202835.11977-22-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614202835.11977-1-birenpandya@gmail.com>
References: <20260614202835.11977-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxtv.org,kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64864-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:mkrufky@linuxtv.org,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1E126822F2

The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/mxl111sf.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
index 870ac3c8b085..0524685e220e 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
@@ -900,8 +900,21 @@ static int mxl111sf_attach_tuner(struct dvb_usb_adapter *adap)
 		return ret;
 
 	ret = media_device_register_entity(mdev, &state->tuner);
-	if (ret)
+	if (ret) {
+		media_entity_cleanup(&state->tuner);
 		return ret;
+	}
+#endif
+	return 0;
+}
+
+static int mxl111sf_detach_tuner(struct dvb_usb_adapter *adap)
+{
+	struct mxl111sf_state *state = adap_to_priv(adap);
+
+#ifdef CONFIG_MEDIA_CONTROLLER_DVB
+	media_device_unregister_entity(&state->tuner);
+	media_entity_cleanup(&state->tuner);
 #endif
 	return 0;
 }
@@ -1093,6 +1106,7 @@ static struct dvb_usb_device_properties mxl111sf_props_dvbt = {
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_dvbt,
 	.tuner_attach      = mxl111sf_attach_tuner,
+	.tuner_detach      = mxl111sf_detach_tuner,
 	.init              = mxl111sf_init,
 	.streaming_ctrl    = mxl111sf_ep4_streaming_ctrl,
 	.get_stream_config = mxl111sf_get_stream_config_dvbt,
@@ -1135,6 +1149,7 @@ static struct dvb_usb_device_properties mxl111sf_props_atsc = {
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_atsc,
 	.tuner_attach      = mxl111sf_attach_tuner,
+	.tuner_detach      = mxl111sf_detach_tuner,
 	.init              = mxl111sf_init,
 	.streaming_ctrl    = mxl111sf_ep6_streaming_ctrl,
 	.get_stream_config = mxl111sf_get_stream_config_atsc,
@@ -1177,6 +1192,7 @@ static struct dvb_usb_device_properties mxl111sf_props_mh = {
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_mh,
 	.tuner_attach      = mxl111sf_attach_tuner,
+	.tuner_detach      = mxl111sf_detach_tuner,
 	.init              = mxl111sf_init,
 	.streaming_ctrl    = mxl111sf_ep5_streaming_ctrl,
 	.get_stream_config = mxl111sf_get_stream_config_mh,
@@ -1246,6 +1262,7 @@ static struct dvb_usb_device_properties mxl111sf_props_atsc_mh = {
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_atsc_mh,
 	.tuner_attach      = mxl111sf_attach_tuner,
+	.tuner_detach      = mxl111sf_detach_tuner,
 	.init              = mxl111sf_init,
 	.streaming_ctrl    = mxl111sf_streaming_ctrl_atsc_mh,
 	.get_stream_config = mxl111sf_get_stream_config_atsc_mh,
@@ -1325,6 +1342,7 @@ static struct dvb_usb_device_properties mxl111sf_props_mercury = {
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_mercury,
 	.tuner_attach      = mxl111sf_attach_tuner,
+	.tuner_detach      = mxl111sf_detach_tuner,
 	.init              = mxl111sf_init,
 	.streaming_ctrl    = mxl111sf_streaming_ctrl_mercury,
 	.get_stream_config = mxl111sf_get_stream_config_mercury,
@@ -1396,6 +1414,7 @@ static struct dvb_usb_device_properties mxl111sf_props_mercury_mh = {
 	.i2c_algo          = &mxl111sf_i2c_algo,
 	.frontend_attach   = mxl111sf_frontend_attach_mercury_mh,
 	.tuner_attach      = mxl111sf_attach_tuner,
+	.tuner_detach      = mxl111sf_detach_tuner,
 	.init              = mxl111sf_init,
 	.streaming_ctrl    = mxl111sf_streaming_ctrl_mercury_mh,
 	.get_stream_config = mxl111sf_get_stream_config_mercury_mh,
-- 
2.50.1 (Apple Git-155)


