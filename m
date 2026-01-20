Return-Path: <linux-media+bounces-51114-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHbrJMJOcGlvXQAAu9opvQ
	(envelope-from <linux-media+bounces-51114-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 04:57:54 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6255350B08
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 04:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B092D666D06
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 12:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7714266AB;
	Tue, 20 Jan 2026 12:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqP8j3ze"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BB342669E
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 12:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911085; cv=none; b=VF7W8A1JrlDnNiIpzUgT7lYvaEZmIIew9pNrKFtc57WLWJ+ueWcSf4WBAivJeyYsV8jmNjo2WwXMmRe1xY13mxBvhW73XxAbYUf5/O9Evjhaqs2jLjtUkTcnbWmf3RRZW7/oTU41NOmMvajYVjuF1cov3Wnd6SNrjTOJuspcWOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911085; c=relaxed/simple;
	bh=x1ZFqXPg08O8CIdkeGxwHnmW3vI6NSISVaARNwC7Hyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IEBk1b9pbgm+36AFySGuoWEIAt1cmtoQ4+XKtZZyeY4txKp1H75UMhtaTz8+qKqyHSkwES13QF18tUmreVDgp12yJvcPBuK01deqY4Jn0lYVvfj5jZBsvU3DAHD8UU5XzpNfvLCelB+LLy7zSaeZAfxvPfr+tfq8R6e+XwHm5lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqP8j3ze; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81db1530173so2471506b3a.1
        for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 04:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768911083; x=1769515883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+M/fFjyuX7BH6FG6ugPKx8MXXjIS/+A8oqVRnCk5TSg=;
        b=ZqP8j3zeuAmEfLBUtIhLGvIqC8jOaoKyGwx4VFMlvVZzCJkSGGOLAegOrg+7NxwXPH
         pxpTQ8R15fd+fEaWbUBIF/0m9FgK/FFAl4ZYjgTpCJXRd3HPRTVZ5kuHrt7GFVaI/12s
         T++WxC9s48Jz+LYI3p87y4B7nl/URW6aSQ7tH130tf4q/meEGgGdalfJl1klSJ8Zlav2
         iHrkZmBlpk4PocnNHuxhm7GvYlADVecYU2A5x5VTmqgjaWrSjbgfSUd6CPuP89DovQkZ
         n9RwHIl77hVIguIsvpDRkjBqzLx03lDYv++QHzm+JhP5djmSkL+Vvv4xpFIMwdENIKJ9
         gXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768911083; x=1769515883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+M/fFjyuX7BH6FG6ugPKx8MXXjIS/+A8oqVRnCk5TSg=;
        b=Gi9Knu1BLtVm2UQo97HsvQNBRtjbq1/hHFCXuHYM4yth3YcAxrIE8d4jtNzyU+ZHIg
         FmppCa9PSOwrxVbGXmg+TarxgwH4bgmYdk0mOJSaw8OPglx/DApVsMttxuhT5xnOimp9
         efsjD3KHOqbXpbE7LUgGPtx4ja459ZquQuiqXEJL2K1VdMzGmgAAQAP084I9HhQKQt35
         52gxba3T5Ov9wOB6fAzSQrPJJ8YF5GrkM6Z9b1Ly9EEyIwqZ3GfF/LHAq0xNUK9IBXP6
         hwi/g4z2uzW13hRy1+uMlgt8bq/G8A/EWxzuEny0B02A8lDNSVl7kUixl/ec+65yCOF0
         800Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXp3kJ47meHsKsxae0xGz+bAaB6jUZOqKaiPNMdeHKs9h6OHrAsvOtmKsBkWWENB0NdKzz/ecaxuMM4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE0ap0uO72hdxnGokTaRJgKt5XZfPdqbgnDVf1jjm9E3tsPSiK
	6Vr5vVWlBk1PF9VDMmhwGjsRrSayN7mWNYwdaWQnddiLo+HiO0a1tMIe
X-Gm-Gg: AZuq6aLxAK9QBzvf1OSUGL+qtISGleIx3DcJd3WHcqJcAjeiDeW87WvDBJDCxkQLUAy
	qSs4aVdwChwLfsysHYi+phulRsnUcVyHx3a+k6Wz5bFWLa4DpzZ7wMG7v9Vz9Uj9kRsTd41vkrH
	2a7aYZY55Nj/BsLAvfBIu7/fa/f9K9fYC7jbwVqI1eEmEJweJetnTelJ6A4nYHbghCVuRFHWkFU
	Q6xE8uNc5ZGGOkPZyThfoM4JHp27eKDRJqevltV0X9eCYRy1oUc3NcfvLDE55/mmuq/+/NwMn7d
	2+6BpMEuc7OiGXglE9ktaZs+jGF1NKhjOHsnXb5qEN1JKphl+eH6jqRtPectCROuLlNy+9n2bMj
	i6jOMKT+5s8GunXdWNYVqRx6d/I+x4TtSKOR9Qkw5yTrZ8Scqar1C+NsfeqDRRuaOHbaRVEzj0W
	P/maigdKMdekRlBD550ubK2z7A5SeOpn8JxmX36FbO8Ip6R6RAoXnqs8nZG0m8/OeGSc6GBhNcW
	e6UTOTlxxPbNlmeYMBPIC9KFcLQ6yXBceb9CwhdvpY1lTYNEf2QVOxhoA==
X-Received: by 2002:a05:6a00:180e:b0:7fb:e662:5b9 with SMTP id d2e1a72fcca58-81fe880897amr1744566b3a.31.1768911082919;
        Tue, 20 Jan 2026 04:11:22 -0800 (PST)
Received: from 2045D.localdomain (70.sub-75-229-220.myvzw.com. [75.229.220.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10bdc65sm12150178b3a.21.2026.01.20.04.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:11:22 -0800 (PST)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: dvb_demux: fix potential TOCTOU race conditions
Date: Tue, 20 Jan 2026 20:11:05 +0800
Message-ID: <20260120121105.8959-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51114-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 6255350B08
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


