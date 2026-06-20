Return-Path: <linux-media+bounces-65315-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cYLfG9bmNmqKGAcAu9opvQ
	(envelope-from <linux-media+bounces-65315-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 21:15:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E0D6A98D7
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 21:15:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bGC0wRQz;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65315-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65315-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7089A300E3F6
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 19:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035B9369D40;
	Sat, 20 Jun 2026 19:15:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7126244665
	for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 19:15:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781982929; cv=none; b=rqYAdCPra2fwsgQTis2nlQRmNmzkwpExMg8UG6Dl6gC58RnmHJ74fZ5h9pCweFMp1dtTZIu/sKqG6PL41nPO1+K0Id8rLtaAL/t7CL+m6u0jF5M2U1ukhxI6Vp+etfbEAEfwaeTNqe+a0Hm2BHpr4mm6z2ZEQAvZJpUWbj4xpJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781982929; c=relaxed/simple;
	bh=VFBwOlnqefXRtkqyWJWmvbxNXf55m3uapOuWCpXfuwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J/TfkoBMZ0lGCYw6wIuVgjteyEb/DJP86PdMlhSWwHTppk5fFg+gGinHMSdkRLlyRvVY7GHnFt2/S/Obx+5LWNbHyV70KPjUhhvMQyGGstxSOqPD+yv5Bf2xG1OJD3tu7+oFpupEVIsB8MwhJxFcHvx9zQy8AT8Jdw/4FK5hig4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGC0wRQz; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0c3546924so23576235ad.3
        for <linux-media@vger.kernel.org>; Sat, 20 Jun 2026 12:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781982927; x=1782587727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2LUf4/h3bsaXpFBm9VmVxZv5sbzexG6A7SGGqxs2XA=;
        b=bGC0wRQzYXFfNx6iiEG7621vyjvBaD9+/0f2RWOJpYeJFs/OPkBdWahPYc9KZB2Z+S
         PdxWkeMXq+RqwO4Xa9aGKMoEReP7dvALo9mqtas+Q9hIDSZ+2/RQdKaJNDM4c68eARxG
         A4GtvSUAN9gYuxWVG8ZXJ5djuhG+XtuQa3GBidxdOliWKFnE1bto8YLMumva2Yxpoxv+
         Vx4mn7+4tGEyp58BWS/mRee0kyZ2O0zJ8UOcrjGU4G5ubdiCM9Bsnz41zyRG3DGPg+m0
         XedcyA23PKdFOPAbR4B6nucCIOgmkZeGlL0jbY7cAso2ymUjLaaTeJzJkVoq2IL/hH/O
         h9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781982927; x=1782587727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2LUf4/h3bsaXpFBm9VmVxZv5sbzexG6A7SGGqxs2XA=;
        b=Dbv3LCks2MyixQ4oUcyRXsrwzwJAjqg84tC3eVPourcrcldtv9AovZdgvZUFlty+on
         sQGS1zjqbf3VvUppFfKF6xkm/m7lwZJtYLCoIXJNJmrF/h4nmVk/qwLtS+DmHc5iUPz8
         f5r1tj6U2brq8kBUE8ixRgXbdR9Ejj09wphIaDfib8ENpODfmio/iJvpdWAtIZdGUldu
         tcN5RAvFNpqkIu2lRXVRhM6RX2/bfOdSUxMfZrh+MqR6Li/D+mYQyUvR0MzNAh1d9D6Y
         QSi5AwKJaltCVaPLMTWZ9z5uJkVunEaP4Q/1Ql10Tj+A9zq6A/WDxfYEBej0oaVZ/XaG
         1UCg==
X-Forwarded-Encrypted: i=1; AHgh+RrPE9K3D5I4a18oE4sd4tur4kNyJalmMASTiPXS3Ql8WWZuGR/8I+i0RouXzcjDrSZL7YIwPwmaYdk8ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnmLzrTAzeX+w5LQ2W81cOvSRS2fVLprwvvyekpx/EIlbIfqOe
	kawVFknKyeTutLF6lPVPHaNznGXjHdsGVXZzgCJrTGUljyXO0XShVSSH
X-Gm-Gg: AfdE7cnAK6rYlNxZKYKOohmcG3HGwQ2fIShZiJfR3+UlhgaFCdIGpUttADKJa0kG8DI
	44NL6w9UVpBGcS+L3eSVYZ1LksXRJqwaULFZAxG7+lw9SVMAxPseM36xvl4tJugAF5G1faLARW3
	5piF2LvGyQSab2gCvPhXKoCtlVE2LJUlz7DTK1uM38TQmji2voYg3Kje+Qo6y4qETCynsbFrHhF
	E5t31Qzf1EinQ9tyHd854BSvy294vFOfApEpyq79/KhTO2+ctvCE7kx3bDJfa7WbWZuZ7SpZ2rV
	JNBJm/f4G9nVeeSS4iA7eH9lCPy9AWgVvu3IEUkIQhiHWh/vPe0xhYS89W2yNJTDk5VCFIOBmhF
	RLCyK73Ipch++40ACBsd6tSgBpU48/PzNhstlmf8O6vEdO1KnJ9eGTKCIE/mJvIViLESoLpH6yc
	93uYa5A/4KPBVWcrMJZ/qtVTUPqUyiZJydk5jkWWqPsw==
X-Received: by 2002:a17:903:2b0c:b0:2c0:cb0e:ac42 with SMTP id d9443c01a7336-2c718f201dfmr89775985ad.3.1781982926862;
        Sat, 20 Jun 2026 12:15:26 -0700 (PDT)
Received: from localhost.localdomain ([49.207.234.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8cfbsm29450665ad.45.2026.06.20.12.15.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 20 Jun 2026 12:15:26 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org (open list:CEC FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Cc: Biren Pandya <birenpandya@gmail.com>,
	syzbot+051024d603432b4ab395@syzkaller.appspotmail.com
Subject: [PATCH] media: cec: cancel delayed work before freeing an interrupted transmit
Date: Sun, 21 Jun 2026 00:45:13 +0530
Message-ID: <20260620191515.50238-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,syzkaller.appspotmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65315-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:syzbot+051024d603432b4ab395@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,051024d603432b4ab395];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,syzkaller.appspot.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1E0D6A98D7

If wait_for_completion_killable() is interrupted in cec_transmit_msg_fh(),
the previous cancel_delayed_work_sync() could race with the CEC kthread,
which might re-arm the timeout *after* the cancel completes. This leads
to freeing active delayed_work and an ODEBUG warning.

Fix this by cancelling the delayed work only after removing the data from
the transmit and wait queues, ensuring the kthread cannot re-arm it. Drop
adap->lock around the synchronous cancel to avoid deadlocking with
cec_wait_timeout().

Fixes: 490d84f6d73c ("media: cec: forgot to cancel delayed work")
Reported-by: syzbot+051024d603432b4ab395@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=051024d603432b4ab395
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/cec/core/cec-adap.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index 8f7244ac1d43..50bd8bbeb5a5 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -965,7 +965,6 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 	 */
 	mutex_unlock(&adap->lock);
 	err = wait_for_completion_killable(&data->c);
-	cancel_delayed_work_sync(&data->work);
 	mutex_lock(&adap->lock);
 
 	if (err)
@@ -985,6 +984,13 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 		list_del(&data->list);
 	if (WARN_ON(!list_empty(&data->xfer_list)))
 		list_del(&data->xfer_list);
+
+	if (!cancel_delayed_work(&data->work)) {
+		mutex_unlock(&adap->lock);
+		cancel_delayed_work_sync(&data->work);
+		mutex_lock(&adap->lock);
+	}
+
 	kfree(data);
 	return 0;
 }
-- 
2.50.1

