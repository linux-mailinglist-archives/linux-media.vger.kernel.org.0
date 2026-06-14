Return-Path: <linux-media+bounces-64827-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jWb3Ek7eLmp85QQAu9opvQ
	(envelope-from <linux-media+bounces-64827-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:01:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9123681A45
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 19:01:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=c+3CpEvj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64827-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64827-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F38FD302BCDE
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 16:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D2A3CB2D5;
	Sun, 14 Jun 2026 16:58:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020C33CAA59
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 16:58:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781456312; cv=none; b=NFriFsoUp/a7KhPExPrJDEar9dpSK7F8EPzCC8L4PKA/Hjum18Oo+1l7S15wZtfV1n4JcntuIL2ZJwqUKoj5AuQq/hyW376G5iWyyGnRIxEegbOisGIrpnqVn9+gjnU3OcDggF3aRqDvjF0VChbP/WN+N9kqfCc45arhp2zli2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781456312; c=relaxed/simple;
	bh=UhzMGcfP/gZtI09aVzg4sADjY3x6y1g7GpnBnXdm0X0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZd0r5lP/F2RdaPpRvhQu9wgViRT7Pt6ueeRGHdSCXK/oTcKFFLPF33Utj0BbsUTF618pUkWeYJKouvSFiiq1fqGCIashonTq1YbJdMtC9jhxTVXQgstPdEN4+0WSuNjRd9oZytrKKpM5zrqZGkQinjKSSMSRJXSgGDiS92gwyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+3CpEvj; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c68190ade4so2432985ad.0
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 09:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456309; x=1782061109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kxd+Jkz/lYkMw/6qslaxPl3QML1gIEx/AcRIwkgS3I=;
        b=c+3CpEvjioX8/kpSgCHIAlAOsiUsz/hGDNlqUh2SlcvuAEg8fiK8mSGwOjM44npdR5
         Me76LOt5twhGE32LsmV4LwYtVC+URd2M1L7VpbfAnucr+/zKz/xKZlubz8ek5Nj5EH/0
         n72MuDu8phBD21h94qi181OV+sClTFWthRcpVe/9qU0tsq1K9XPCIR3fHWUOAe98xvvs
         mBgmbcZtTlDIG5W7DKBPB3wyMFykjGo8y3n8FJCKNj6W+D1khZ6rJEYpvn+AjR7Gz0Ug
         /v9CkJWPIIQbf7w5WdY8RVTcQz8Je5Y1zWEzhLftCi+JBL7bhxoax+VGx+VDQ1FLyJ64
         K+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456309; x=1782061109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/kxd+Jkz/lYkMw/6qslaxPl3QML1gIEx/AcRIwkgS3I=;
        b=Z7vI+1wWS5yK9kz/AIGKV/Kb334LAF5B3AUQIutYT6VUpCN1u7Pn022xBt1/ZECxNy
         2YHDm5/GSzNwz2VoDEaQokW+Ls45C8Ue5hL181MTQWccxB8wunxBvWCUidnjCF1/pzXb
         /RV2bv3jCVNRLBUwAZ1Pj2/iNN2K+W+W8cRWFlJOIcTsMxjI55NGwdBnCUp6AuIVqlJE
         Z21kesoI3HvELzy47AZ8y4rhfSJd9UEbdxcEwLTe21vTXVZs0JhIsP0NYngEUcJ1D2z1
         zGrboXLtec/dFsHN/uHjRDD6BcFPT9/mN7Jp3EW7hPtF/AlyICS5K/3SvAdLne7OELlw
         xdUw==
X-Gm-Message-State: AOJu0YwswqSx4B3O/3jKtn9q3H4gCXXWs8F2F276BJ8fu7tA7Y02PSkq
	znBn1PH2adTFxVNlrBlfWS+Wgb9lB71wtk4glF9pSb9HOmKnxIdrTHxACm0VKcMC
X-Gm-Gg: Acq92OHoZtQvyZ1ZEDjw8BZKcA+09tMlQQETPFcmgI6/TCL9k7EFDnmNMgqfWw48euW
	3Z8YBp3o/f/pqulhA1rPtd+Y+WPJOpNfCUZPtSWiF6xu6CYK77qF69xdElJ9UEuUSKs8GTzjxsH
	zISMG0L2Q4tQTLK6DeBTC1hjpwYLZKKvL4JeeBKd3SP4B868X0udk3cYIl/GaBDuFDqs+F9aYHI
	aeRotTITZY50HwPS8pKUrCC9XGPjmqrZsz+t4eyOZXRVJ0daehTbkI/eAs3hAcMDJRtfakJ3+4T
	bD5QC9DBVBgVd4wtuBOieLME+itqMc5+ThYxoxwD/KcKTOyjX5f4NBvPCbOmrTWXjFaQKmnEqjs
	VVPdRFHgyv9GaBTC79m9SiMbSsUn1flKExQY7F5SABWPW6TKjR6jDY2FiYKZV7TfHCaO0IF9axp
	7nk0Dy0kbhtmgjlXGF5tJCCR0RCOpkwTrpQxzumRJ8lw5c969zDV09
X-Received: by 2002:a17:903:17cf:b0:2c0:b801:d9ad with SMTP id d9443c01a7336-2c3fb003c63mr97037375ad.3.1781456309499;
        Sun, 14 Jun 2026 09:58:29 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.58.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:58:29 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Michael Krufky <mkrufky@linuxtv.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/22] media: usb: dvb-usb-v2: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:58 +0530
Message-ID: <20260614165630.3896-22-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxtv.org,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-64827-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:birenpandya@gmail.com,m:mkrufky@linuxtv.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9123681A45

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


