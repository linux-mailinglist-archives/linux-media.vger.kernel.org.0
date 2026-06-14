Return-Path: <linux-media+bounces-64840-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BDHUH+byLmq86QQAu9opvQ
	(envelope-from <linux-media+bounces-64840-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:28:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1310A681E39
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:28:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nz74uJW6;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64840-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64840-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EBEC3013EEA
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683D13A451B;
	Sun, 14 Jun 2026 18:28:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFCC1B78F3
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 18:28:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781461699; cv=none; b=sY0kk/1EmnoT4WQ6rhZz3+pTWDWqvbKS1oHmpRLuygBvoio8WGyw3zJcRmVrh4ez7rMvEQknEjx5JwId7iN87kRPLwmNgNm8AfdNmS6zJfPn64dMpGECna7W1i0D5Iw1D41wk3a4fNSlRbtHMWvDy8BpScE7KWcoxKp+KgeJiL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781461699; c=relaxed/simple;
	bh=rSCo/akBYGtVS7sR9AfcdpFZ+U9t7v+fmjBTrZeWhRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNz7DED+WGu3SJLqTDNu0LziBfTxiPaPRLX7cZe5DMZgOP5gIFZWLcizr45WH78hLuRF16qJxTbYcCoWZem7u5p8jlo0RVRPq4EGh76J+vTTS3Q7g3VCcyH0jJ+ptoqKiXhKa9JI37gYZrDWQLGWT9IS4FqWFAKzkGS5+EIXFSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nz74uJW6; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0a5354da1so20657665ad.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 11:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781461698; x=1782066498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHsAcKvWPIsAqo8fcZi3AQFBCbARIH0MASezqJ4sMZc=;
        b=nz74uJW6EKLMebku/gcBnAX9AWwDOZGvw2lLhewsCap8f9kjzx6wlqM8slGwMriuX5
         2N7dwmGadr/dBJBzp5Ynkus/kp22wsn2Ka7LhWGfJohS9sZSV9ozKl0W7p7TiqK0NmDs
         I3/5IIzrlsvQiu+YCkI+GnGaa4C9+Xq8KF9K7Klc2o6gmAx0Y59xsg4NpNG4q9K3WL6o
         G8vX+gOcfCVk50snLnSlNLrcXkTXS3tmqgrc8KszKH5ciK2pXiGBD9bkMnqGuCNJ0wLU
         SDscdqh+/q0Am2wj+boU4hVSsO8gl06UOOKaNizireeTsQ7bdVgDMMd81EcvKqXwarwe
         xJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781461698; x=1782066498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uHsAcKvWPIsAqo8fcZi3AQFBCbARIH0MASezqJ4sMZc=;
        b=TjyVvoHgeOD3RTLgwQSeY7/jUS4bn4pygnsuoD118mafBrqYnE8Z4blZkWYk+EUlQZ
         fYMNLDWinIyJRqWhGAYeo+ohOITpS6mVshHPRlza3uZkpjGmW8/aBJeXyZFuyE/4EqkD
         r3iDEk4EWoCs3v+amtPVJbxZazAVAIOLAo8TNF2eHeaeafcEuY0MHllRv2HVhnc3vz/O
         lDi6IdmpuBQNyi5uRYlkgnZQX4UWvHTqbw9aRMA2sOEsEcSKzi7AkprKGjp9Vmjw/ydo
         A6cjqzzm0tOfeuThg68lZd4XZBgSvihr8pXybFA7djoy/HNR7Oio0GCJqM+aD4nkDA2x
         Rnjg==
X-Gm-Message-State: AOJu0Ywv6TnXVk/1/NoZfmfoHAz8fb9MJlQ2oinzZNTCVbbWs5u1L6NK
	Ei+TjtPhT2pw6oTqYwSkr8IoeImQj69EBWfb6iqt07EX4PlWZSuZ8yxBc+JLJRd2
X-Gm-Gg: Acq92OFQkvRzTXNt5T7Tntvaevl5PKvlWCL0znv+RnWHT1vHKbZIeE3SBxY+yssho8f
	rEs8qvReYbJgY7GGxrmAEhznQrx68VerM9GA8OGpXHX8z5fW3tQXsEFFOpYeMn5qN4pYbHUrJTI
	L+kGpJUamvsVYarre9KE2lLEhthDP4rDOw2BiPNf8697By1UpY0LamXiADnPZPulhJlwKaKmSo5
	3h01aSHa84r08lv/MF0o87lCJMuZjvrRCmnTj5C6b1NfLex/jdOV/E64PMjffS4PfsuSp+IKbDS
	Q0YdeK4YDqFMPs5jppiw3Uq4155WkV9yXyPi0cFhYZ5IvJtZ7eA3+3Ja2uU3sdDZRtGYloecMEB
	c+J4NO9yWaAxZqAS0npAcN+GfvyJAHL2As0bYepgT6l1xMqM3p68yyUaSaga8HGaP0XCMADrZiG
	Wiz3JPXhu0TSKp93mzWaPZbPfb7yTUOakJ9ZaMfh+AaO9N4pcDjiY1
X-Received: by 2002:a17:903:41c9:b0:2c2:dc3a:a92e with SMTP id d9443c01a7336-2c3fb4ebb67mr96588355ad.8.1781461698040;
        Sun, 14 Jun 2026 11:28:18 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5369sm79161335ad.9.2026.06.14.11.28.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 11:28:17 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Michael Krufky <mkrufky@linuxtv.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 21/22] media: usb: dvb-usb-v2: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 23:57:11 +0530
Message-ID: <20260614182714.7999-9-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614182714.7999-1-birenpandya@gmail.com>
References: <20260614182714.7999-1-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxtv.org,kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-64840-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1310A681E39

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


