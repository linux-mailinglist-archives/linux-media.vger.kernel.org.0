Return-Path: <linux-media+bounces-55543-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDjOHOMxs2ntSwAAu9opvQ
	(envelope-from <linux-media+bounces-55543-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:36:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE22F27A15D
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:36:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6E4731A529F
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 21:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4773E4C82;
	Thu, 12 Mar 2026 21:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="GPWohJuG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB30B3EF65E
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 21:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351341; cv=none; b=eWCrvosBSo/96udQQDlJwUALoZo2YhrplabZt6oSLh7b5uFELhmVJgXQ/G9iGjGyncWCOtda6qMzWMWRs/08D2vU9rKO9SZFFHrh3V/79kcHbgGUGc56I8eeMBR4n5t0y/j5VtzirCBuFJAzKHIhI7RHDH+Y4RY7uVwsTOtWYvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351341; c=relaxed/simple;
	bh=U1UApUd8m9jNNBBaVptBVMlnsSInF7PkNvQcpWumDmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m6KV5p2APY8gCKC7U11aTWCPxodgl+J/nC7eh7SINdbM+yra/to3mRlSRtAflOGZdiF9KXOFKEY24cpugzlF5B0o+xKRTUq9s6Iq/4im8eQulgAYyDzwxiBQtIVgpVyrWX9xMt4rovp1/5o4S0qjadmR2z87m6fRBUBU/3lpNrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=GPWohJuG; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4673790ab85so1036002b6e.3
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 14:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773351338; x=1773956138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrXmVswXiTuB4xM/wws7SxlQnhfknGHd8WNGOyXcGFk=;
        b=GPWohJuGogrQFIEp1b71jY8FkQ94bEwyB0mWHpO3K1TqEbgUZZVv5kTRNz6wkTzbi+
         ULugAuIAAH25ip+gbQIkQZMORBQziQHuXlcs6kApjdUiTmTD6Tvewvlx7/qBlj8hOE8f
         5z1q1b/7rHdv2k3tS6B/53ArBWkdzH/cvIgKYocWRdfPNsjJ5ifPa0Xk87AsOIn2zSSe
         tBuydP3FQ360J//Tu2TIKRCu5wLPQtxcybyd5HOx312dJ1gVlu7cdlsVtDgJRGD9uDXT
         DM+i3uZNDVsWKZTf8NAZA1uw3Ob4jHvZOlxF24hzowpr56TUX7I6/2imJ7yT8yyREZ4S
         jkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773351338; x=1773956138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UrXmVswXiTuB4xM/wws7SxlQnhfknGHd8WNGOyXcGFk=;
        b=oVnVP8d9a+R3NRAc1C0ZBqQNAUoowH1iwu6HseoJVsxGchyzeASfsUzkChcQpRYuAx
         CKYFiWoYZgpTmHeypzD0OS0CRKqxM235DgcLKDsgapcoeCY/Y3XLm/87PIioV+TA73Iz
         viTxakJtnmThAEXVp6vmDJ8Q4PqsAbB0XVfl1kYz18XQER0K61oyEGC7MpzVj9nfxCJD
         MqbHDSNKgPfwFVBoP8knwkzvsSnBAMyQjYz2warzO6jsUwN7awYfrMxcrOJdUr8BCKhR
         YLyYreI3WSRi2U5ckvnki4uLLFLTIw84KG7U0K0lqOUscOcSNVzXYX/nDTQLtucQJ2o1
         0EkQ==
X-Gm-Message-State: AOJu0YybYO8QiK1jf9MegW4r/DRosDK3q5UATLu8P85KGu0jDer8wEPf
	jYaHvvWazjoVPISzzHAO0WUwH+8wiSfXeTym1pw9wD0J53JxZoiv15VadFW6ct9gCG8iRdVic98
	XRo82yGA=
X-Gm-Gg: ATEYQzyfBQ39080xc6lkZotqbzgewhuBYv5zNeMfHJGhg/FWrJ6xvlBcNz0s90FJ8xx
	aAqijSksU47oHvuqE5bDdgTyiRM6dUdBGSOB7dN+JV81xqCPiOTHsunc+coZSHAdWu5BhysFH1M
	eu7nY1XWouaC1rOtawuhjghTiBMqYDo4Lp36Mn+OJ1+DrIzcmU2W2ZWnAq2fHjZ9HHriyHa36Q7
	Me5QSPxdqBqL8AS+wbElv8nGJCg4u093PEVjQms1MwHNaony1tBHDD72p2Exso81PyeLCb4dUJF
	Gi4ZUTWr9fW/7s4OljaSI6WTCOUAtL8aEPEWbuYU+9eClHbgW81XTX91yg/Hx+M32KkzYC3rvt7
	jCfXmkVLNrTMJu/FI8pkChRSYVIL53Ihr2vPu0NNrL0ap4Pl1BDaao8D2OK2cJhN/RRTRrNym/3
	A2XV71R/7s7B1CXd/a6Lzlbv0vmACAOx7UWmXgtmpG40r/dysrbeia9wdJB6vHe8Yt0MYI1C/YC
	tIdCSgjLZtcxN3iWAQ=
X-Received: by 2002:a05:6808:302c:b0:467:4a7:e3f6 with SMTP id 5614622812f47-467570efaf8mr432973b6e.2.1773351338416;
        Thu, 12 Mar 2026 14:35:38 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4673415c264sm3657572b6e.5.2026.03.12.14.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:35:37 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 03/11] xc5000: Add rf strength function
Date: Thu, 12 Mar 2026 16:35:24 -0500
Message-Id: <20260312213532.2907276-4-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20260312213532.2907276-1-brad@nextdimension.cc>
References: <20260312213532.2907276-1-brad@nextdimension.cc>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nextdimension.cc:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55543-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[nextdimension.cc];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nextdimension.cc:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brad@nextdimension.cc,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: CE22F27A15D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Without a rf strength function implemented, analog lock
cannot be detected by standardized command line tools.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
---
 drivers/media/tuners/xc5000.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/tuners/xc5000.c b/drivers/media/tuners/xc5000.c
index a28481edd22e..d3eb7e19bf2c 100644
--- a/drivers/media/tuners/xc5000.c
+++ b/drivers/media/tuners/xc5000.c
@@ -1333,6 +1333,16 @@ static int xc5000_set_config(struct dvb_frontend *fe, void *priv_cfg)
 }
 
 
+static int xc5000_get_rf_strength(struct dvb_frontend *fe, u16 *rssi)
+{
+	struct xc5000_priv *priv = fe->tuner_priv;
+
+	dprintk(1, "%s()\n", __func__);
+
+	return xc_get_lock_status(priv, rssi);
+}
+
+
 static const struct dvb_tuner_ops xc5000_tuner_ops = {
 	.info = {
 		.name              = "Xceive XC5000",
@@ -1353,7 +1363,8 @@ static const struct dvb_tuner_ops xc5000_tuner_ops = {
 	.get_frequency	   = xc5000_get_frequency,
 	.get_if_frequency  = xc5000_get_if_frequency,
 	.get_bandwidth	   = xc5000_get_bandwidth,
-	.get_status	   = xc5000_get_status
+	.get_status	   = xc5000_get_status,
+	.get_rf_strength   = xc5000_get_rf_strength,
 };
 
 struct dvb_frontend *xc5000_attach(struct dvb_frontend *fe,
-- 
2.35.1


