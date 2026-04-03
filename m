Return-Path: <linux-media+bounces-58004-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJ0ZBuwnz2letQYAu9opvQ
	(envelope-from <linux-media+bounces-58004-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 04:37:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F153906B4
	for <lists+linux-media@lfdr.de>; Fri, 03 Apr 2026 04:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DE5A3048EE2
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2026 02:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944B234F49F;
	Fri,  3 Apr 2026 02:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBEdEe98"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835482737EB
	for <linux-media@vger.kernel.org>; Fri,  3 Apr 2026 02:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775183831; cv=none; b=HpjK6YpQgpTEBIVtzeg06PkQhCdA+ItOoETJTHe6zXPCYncrq9j9WMlAP+wNf9WLOLAeY/un+hrDp/ErZvBQ2Joxp+cLsjdr9d+3HV8Sh8x+fvkMGdJYNj485pPhpxj4IG0haElgQsZim+8+HDChgJoZ5yKQ/uEpgwzu2/1PVTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775183831; c=relaxed/simple;
	bh=x1ZFqXPg08O8CIdkeGxwHnmW3vI6NSISVaARNwC7Hyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mrjGadhg4EcKsnqwgNnCRNKyC9lcKL1r2OuZ0ZtL7YYtyoZZsRnJ3ODtUZEWJbld80ShF9hj5Iaw5HrNVWudbgTVihZ4Vd8lyzWy+dRqqMVc8qpYz+cGsXzVGtNq3iG6rL5e/STIqKtm7xayt1BGwH5F02xB8/JF0BwL19e8wlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBEdEe98; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c5b3d8eab1so754370eec.1
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 19:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775183828; x=1775788628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+M/fFjyuX7BH6FG6ugPKx8MXXjIS/+A8oqVRnCk5TSg=;
        b=kBEdEe98UjnN6ZV40xND+IYwqOSfxcnR4iUuLN+DKRus8k664bm8KvhMfqhvPJlbOc
         kfXDWJ/2FIG2lOHnhSFeB3RhBIu03IZ4+6L2rsgyIWjzCrsiEtPvM0VYBRiYD052CF5s
         qX09CuJ7tFIcTzmJtRT4qOlI5oOWTF9QZdFUcz1uhJpLAWzYUDyk0Ft2UAF8eqajUC0Z
         Z8NiegjViq29w7RdUab7rrd1JZPSBXBU0586RQy6Zg/nsRvTn1a3gUkVDSR7mnRiOTBq
         63hp7mRx7qS3NZeG+G4ozEAGmmr2Dqyff83ECo2kiFnXLWptvQsyRfHrSNbLIl6Xr5oh
         e2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775183828; x=1775788628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+M/fFjyuX7BH6FG6ugPKx8MXXjIS/+A8oqVRnCk5TSg=;
        b=K1iKAHhXRKN+RBK6kC/aSLSIFlJCY7qfp8TxDVs50JXtcVAktPEdK6oE5k76iCp2lD
         wDkueK8FM8ErthcYnZlhvBXH6vvqJBAI4Khos+r29lsPhVJaTjMSwD1YdqtR2pr2EfnH
         ZDH/aSPoAAOSU9Xqt6aVAGyEzCiLLYVg8RSAsF+5X+7/GfwWcI/6Dex3mG9frEcRmnXv
         6RN7UMfdns5D2gDB53dT2CMvl01FcHEjKze2khqKrKjfDsMuoePDsQkJWRLUhh5Gqckb
         gHoWgqKTcg9Lj+NSUMy3hiJz1IHHx3Uis9jYgcW2HsSESWfSyvt5IyDLPw/C1cYyL6Rx
         wSYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGEXzBQUJ07BcB1rQoqoB/csCQEPgO4N7yhjVM9IZZhZolVaKkHgYlzR435TMdCHzSxZyv6o25laTNrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxihtavtRyEMlnijxcbgQb9Lztvk5BaIHXjtS+eGWJb21B/eNCF
	2flvUO6P8uK6Al/5vvOx6To9YIoO34SUUvJbmN3qHQUXbg9N6bUcogGa
X-Gm-Gg: AeBDieuOt0Le3hug+Q1yQqQPC2pU4i9j32F+2xhFg/thYSN0Vx0pFYvdBMAFm5Rkp/L
	Thgri7qXbacZ8ihUbuk6mZEuO2Fq5NXvzqn4DA6iNDKCfpt3DsgmQqWiJkBUCknrGG3jVrV8iZ0
	Dkb6FmxRXs5IAngOn/bX/Bv3F/jgWmwYHobrlnl68ecnUFfDXo8gOdqXXN/igmYh8oqaqNWFj/8
	1U7Ic58wN4sIqU+VNpBZS9MXqF83shSt5ZjksH+Yf7nCpt8pWW1zf2zMRBEAhe9H/Hqj3PidK+P
	d8mQZG3xTUmBgoztgnF2Oa47NbCR6JdCeZoRc8wz8To6eycQjJJctUTQ0Zh4NdAGUmuNvEqwNnZ
	PJK9AHKHNiUgVvxrjnXA7aQe+fw81BVUuwkQ/8jdxOfwdCfUIVikiM1HVL8dvScXnWeZvvqlKsV
	XAOotAnX8ngXwmn0WovPAiQBuD932Mu8Py6VChkDDlk5t7WS4KqZXpeUIeu/mh2+DBDLjG+/ytN
	ojpEdD4ZlnuFqSbRTzKYqSUmqbbfizz6/vsmcOymYpZx/WqTRG2JIYSvNwUTfQ4aXB74GKUmszB
	t7jubcmiW2n+PQNX1z0LwxI=
X-Received: by 2002:a05:7301:4090:b0:2c0:c5e4:605f with SMTP id 5a478bee46e88-2cbfbe7dd2emr767363eec.24.1775183827454;
        Thu, 02 Apr 2026 19:37:07 -0700 (PDT)
Received: from 2045L.localdomain (85.sub-72-110-99.myvzw.com. [72.110.99.85])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cc63960a56sm203483eec.13.2026.04.02.19.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 19:37:07 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Darshan Rathod <darshanrathod475@gmail.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH RESEND v2] media: dvb_demux: fix potential TOCTOU race conditions
Date: Fri,  3 Apr 2026 10:36:30 +0800
Message-ID: <20260403023630.248450-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vivo.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-58004-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 83F153906B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The dvb_demux functions handle frontend connectivity without holding
dvbdemux->mutex during checks, leading to TOCTOU race conditions. In
dvbdmx_write(), a concurrent dvbdmx_disconnect_frontend() can set
demux->frontend to NULL after the check, causing a potential NULL pointer
dereference. In dvbdmx_connect_frontend(), a concurrent connection could
set the frontend between the check and the lock. This allows the second
caller to overwrite the existing frontend, leading to resource leaks.
The dvb_demux module should use its own mutex to ensure thread safety
for these internal state checks.

Fix this by extending the lock scope. Move the frontend state checks
inside the dvbdemux->mutex critical section to ensure the state remains
stable during the operation.

This possible bug was found by our experimental static analysis tool,
which analyzes lock usage to detect TOCTOU issues.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
v2:
* Remove unnecessary parentheses to fix checkpatch --strict warning, as
reported by Media CI robot.
---
 drivers/media/dvb-core/dvb_demux.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_demux.c b/drivers/media/dvb-core/dvb_demux.c
index 7c4d86bfdd6c..38ffbbfef1f5 100644
--- a/drivers/media/dvb-core/dvb_demux.c
+++ b/drivers/media/dvb-core/dvb_demux.c
@@ -1141,15 +1141,18 @@ static int dvbdmx_write(struct dmx_demux *demux, const char __user *buf, size_t
 	struct dvb_demux *dvbdemux = (struct dvb_demux *)demux;
 	void *p;
 
-	if ((!demux->frontend) || (demux->frontend->source != DMX_MEMORY_FE))
+	if (mutex_lock_interruptible(&dvbdemux->mutex))
+		return -ERESTARTSYS;
+
+	if (!demux->frontend || demux->frontend->source != DMX_MEMORY_FE) {
+		mutex_unlock(&dvbdemux->mutex);
 		return -EINVAL;
+	}
 
 	p = memdup_user(buf, count);
-	if (IS_ERR(p))
+	if (IS_ERR(p)) {
+		mutex_unlock(&dvbdemux->mutex);
 		return PTR_ERR(p);
-	if (mutex_lock_interruptible(&dvbdemux->mutex)) {
-		kfree(p);
-		return -ERESTARTSYS;
 	}
 	dvb_dmx_swfilter(dvbdemux, p, count);
 	kfree(p);
@@ -1202,11 +1205,13 @@ static int dvbdmx_connect_frontend(struct dmx_demux *demux,
 {
 	struct dvb_demux *dvbdemux = (struct dvb_demux *)demux;
 
-	if (demux->frontend)
-		return -EINVAL;
-
 	mutex_lock(&dvbdemux->mutex);
 
+	if (demux->frontend) {
+		mutex_unlock(&dvbdemux->mutex);
+		return -EINVAL;
+	}
+
 	demux->frontend = frontend;
 	mutex_unlock(&dvbdemux->mutex);
 	return 0;
-- 
2.43.0


