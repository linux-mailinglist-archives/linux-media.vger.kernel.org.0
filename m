Return-Path: <linux-media+bounces-64403-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ckEjFos7KWrtSgMAu9opvQ
	(envelope-from <linux-media+bounces-64403-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:25:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF73A6683C7
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 12:25:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VBjWp3pC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64403-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64403-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E380330FA249
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517A03DC4C4;
	Wed, 10 Jun 2026 10:22:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F9E3D8138
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 10:22:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086962; cv=none; b=t4qnUy2S8ZddN86YL4Xr1Du1l/gsD6oatnM2SosSSWm+rIgpNdricvI1YN7wXjbeDhqgv+G/i7Jdsb+jAbtGcLtnS66jm8Sg7/s+z7ptvHnmoVvPakflxPAjAyoGc9D0JlduKZkUhEZmuug84ebmV93/AXFkaMPm6fGdbOJQ4YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086962; c=relaxed/simple;
	bh=f1iPtx0tm9wNKMKTdwutboVp/GgC+sJ9bk9bkhQd2bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3oya1jGEWXPrFX9AfXSBnIFQBTGJ3CYL4SL4OhiQPPc11X064kZFpTr07gwCnKPIN5dUR+7FGZ1oTJK73ohZr8pbdnxuyoXtSB7iE7KnMrP+2K679/Aj8AXp7ph0PVRuS5lZkm8b+RYNXazOpx35i+M5Xp7ia22Vn9XtbQQ4kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBjWp3pC; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45efa80e0afso5131578f8f.2
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 03:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086959; x=1781691759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrxwLZxXKzJ/XclSGRqz6B9dkZuqXjbESIZFpynAdWU=;
        b=VBjWp3pC6TvO/ktYDNsrKb8YF72WHj+f6RnUOlUvQML4mU4LCqtHL7Q8BAaKP6t7CD
         3YBvTcg5r1sNEnyva4tHHYbas0ib1cX9eC7ofZ4bQ6t4QaKOHIVU16ly0fQNpdMn0p4I
         QGBmHt/okuV7oMYIwSagywYNpOFI5/w/t9noAwoj6ZlTes7ogBBpPGMMVesOmYrNS8ve
         IcKcXJ1A1tnncUh/7/VU2log+87CV4zFn+c5w6qTVGTqU8DBKHr17X+Vmuzzoa1JRZLW
         df08vH5HDADaKaTwKim+KXK5hSqpaSiL9mgg8Dg/kQtD7xD7tKCiM5mtL3JykhgCSE0n
         mUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086959; x=1781691759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BrxwLZxXKzJ/XclSGRqz6B9dkZuqXjbESIZFpynAdWU=;
        b=CJkbxRhTsQpX+XbU9RFgy3b+nRtqhiw7x+LNVE8GiC66W22FYEOSOAzrYlQc1UiVP1
         TJ4+GNSx+4bPVoUCJl7lmSbIX6N0fzfzX4lOLYn0Am4vEccmxR92XWSD+KH4wVzztgYj
         rHmzwd8jXNJYQp0VgqRkVqcWAOqPSa+K5hs3H7U7aNuISww59lCOxstX1W8gH1wgyy8f
         SvaDTjTjLzmtKmACYy/dVTibBdgNLjraWHAxPN1j5T1nXo7DzMf6wGhTwENMODb8/irr
         kAL+bn+EW5/8UC7bCggH/C9yW+2xK2ySyt7preV/bHzVJbrMSUVVfnncnnwo5RFlpWtc
         amjw==
X-Forwarded-Encrypted: i=1; AFNElJ9Qo6ir+L5SJ/xeo6su2pKAKwQlJjVBbBxHCpAnR17ftUaB95kufpBirxoW9aqNDXI6VOHNw4kTLbSe1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsBUbBGa/SuYNeKTcgFTJxqArLE33p85B8YfNGYcpeK5d+jUgK
	8D65oXIBuGGwuux0TETQnEWkEpLlg2sgaqSU7LNX+IZW8w9vk/eUPn62PH7wvm2V
X-Gm-Gg: Acq92OHza4dfsN0ZF5xNWcsKxAwtqm4s5Aq4mTunY2bfqdoLZ+niiKD7iqzRQw/eRRt
	H7bZY83sCm0ZadK7bg5JJT+KHiO78LpHQCQrgL1JXtroTYmUQi9wdrz+2i1Z0E7iuSN59Z94Pd1
	qAerldY4BcmzXAk07PyDiKpn8dFaWKto1wiSkQ7pzzPvr5dkGFUTxBTGQWFaIs1fyKhdy0lF9nF
	vwzFQRIlaMkruEDE0BgH/yBhFQNWmi12DRELvQIbMDUpdsybomzQKkywQxxrogL15oyWMnIyD0M
	sy52IMJxysvwudisoxDHFXdKU+X/LOaXav6vODtAKJUyYKAka0gD0QtH4RD4pTh2BMS/MQPI5+C
	ofzfwdsFZeD45OZizo1FAijPAppxDVfM/7mtlzt8z/H7pNrK8VeeXm3m6pc66I1KSssNbrGBi07
	Rc9cIlu8eYFbwk3p8gVxkvxGNzLkGQMdIlLi1Sk/TaPBLdvD/JGIAmTaZbTD4u85TbqQ4vCch0G
	Htb6LFnUoWYB00=
X-Received: by 2002:a5d:4dcb:0:b0:43d:71b:204b with SMTP id ffacd0b85a97d-460307788d0mr28370907f8f.39.1781086959086;
        Wed, 10 Jun 2026 03:22:39 -0700 (PDT)
Received: from garuda ([79.106.123.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35eae5sm71360831f8f.33.2026.06.10.03.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:22:38 -0700 (PDT)
From: Jurison Murati <eng.juri@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v2 1/2] media: i2c: ov8865: Drop the runtime PM usage count on stream failure
Date: Wed, 10 Jun 2026 12:22:36 +0200
Message-ID: <6b764b77a7d78b8ae2cfb8a213a1e844a329db26.1781085860.git.eng.juri@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609232255.13559-1-eng.juri@gmail.com>
References: <20260609232255.13559-1-eng.juri@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:dan.scally@ideasonboard.com,m:hansg@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[engjuri@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64403-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF73A6683C7

ov8865_s_stream() takes a runtime PM reference when enabling the
stream, but returns without releasing it if ov8865_sw_standby()
fails, leaving the reference unbalanced and the sensor powered
indefinitely. The same applies to a failure while disabling the
stream, in which case the reference acquired at stream start is
never dropped.

Drop the reference in a single place, both when disabling the
stream and on failure, and only update the streaming state on
success.

Signed-off-by: Jurison Murati <eng.juri@gmail.com>
---
Changes in v2:
- Drop the runtime PM usage count in a single place as suggested by
  Sakari, which now also covers a failure while disabling the stream.
- Not carrying Dan's Reviewed-by from v1 over since the logic changed.
- Reordered to 1/2 so the next patch can rely on the unified error
  handling. This was 2/2 in v1.

 drivers/media/i2c/ov8865.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index a8586df..5b909a8 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2621,15 +2621,13 @@ static int ov8865_s_stream(struct v4l2_subdev *subdev, int enable)
 	ret = ov8865_sw_standby(sensor, !enable);
 	mutex_unlock(&sensor->mutex);
 
-	if (ret)
-		return ret;
-
-	state->streaming = !!enable;
-
-	if (!enable)
+	if (ret || !enable)
 		pm_runtime_put(sensor->dev);
 
-	return 0;
+	if (!ret)
+		state->streaming = enable;
+
+	return ret;
 }
 
 static const struct v4l2_subdev_video_ops ov8865_subdev_video_ops = {
-- 
2.54.0


