Return-Path: <linux-media+bounces-51111-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ia4GzVFcWn2fgAAu9opvQ
	(envelope-from <linux-media+bounces-51111-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 22:29:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6965E0F1
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 22:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4FF8550A6AC
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 10:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED303D6680;
	Tue, 20 Jan 2026 10:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3lM8UTA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F18F36165A
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 10:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768905710; cv=none; b=llqpVSqfcck/22dV7S+WyOCv8be8XftLZupEsmi8ilgIbBpAlUtNZ98EjAX4MwPyPfQBFMvfVegs+4R6yTGViWFk8V5MQtDYyysnR71/hgWr/xg1PW7NaRtXwnSITfzzWnI39qgBqG28K8Nqz4KHCoqJf6PL7OikBMikOM6hFIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768905710; c=relaxed/simple;
	bh=Ohb12pnkwdIT0Jne9UD+YNvgkmu2s71UxSfrE5BWiRs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UFBGW/QrKvbU6NLkmHTnhvIV7KPrPLYG5WWLIFweggoHT4/lWo37/0lEdl0HHUTsvIHBkgCrK8cCiwFJCBSwT423Y6yqWxXNO0RSf+O4O1FwnuiMiDyhRfKBTA7GPOeA0bmfncF391VZBkbwt6PI0utv6JZ0Xcnu32Rzd14V3QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3lM8UTA; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b453b17e41so3232664eec.1
        for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 02:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768905708; x=1769510508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fV/jHAHpW8XRaZZ0Qo+rv9A5isuApYKvNLSlJGZZqHI=;
        b=S3lM8UTAhiG+Fabdt5BFQhczEsxaAFfcpUZ2wIVXmw/QuHHMdYtpd0lrn1bzVIvpAl
         yVn4WiQagiDVcDGYioIbhfHAvjfIiasLDDm3jW+mN5xVn7/lS6kfDUZMpSo+HcM2UCip
         OJJDxDzSBUSHJK+PAHQVXGmcaJz/Ttp2DvNbSx0Hp8yEmAr+UFZhiBVQUfyhIKF02dH1
         SZdQ6V+gJ+So3tZzRE9wReWX3zhjkoOW4dxQd20crlzfEDBFhG+S2SYRa/8eL7yIZwWw
         OBQaRIdHth7AtVwZrm+ASKUiI89vI8pBwF3lM1HwItQdTPRMvboeYpPbzC9WvnDK5qcI
         XJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768905708; x=1769510508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fV/jHAHpW8XRaZZ0Qo+rv9A5isuApYKvNLSlJGZZqHI=;
        b=aIOpTLQQNC/BRZ6vnsPF5KErha4sYNxj9nSXaeXp3lIKaXxwVVALG/54+cd/5OVnrc
         nuVJm27+WyM7S8iRJGR2DJ1VZbgOjpT9S3gR85jsqWIdjrTOUIKtjaOzWrAG3qjydEpe
         aBpDN7mSd/FFwVULtul7A7Q6b514nxgZttKyPnrffmxQaJN3RcOo/zPABefM7q2MVKV8
         yGB14GA4IDBmQAn7Yi7a8+dU+RnkJTcdZZOm0LOOUyzgNHWpC4I980Is4gpBbFZcQDMV
         ltaSXhYO+6LP68N/9e1N9TkeR0MUvXJGs8lBb2oMdCuwnj9mVRlsEYqDUjZkCbh8tQGu
         y7bA==
X-Forwarded-Encrypted: i=1; AJvYcCW3nPVcWVJMyg/T8PEtFgspMxEU7+yLK48omJNmhU1MldTrrZXz3J8TwOFvlRIWveqjK3JshWKFhfjomw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMjxAMFA5D3R0XUVchKYPtVO/+Tm+MVCWW3KqLn+vcnmaaZ123
	KR1xfbVVcdVDRqbJsXSjl1wQHa8qU60zYk53zXyiUakJKiBLmExZY76L
X-Gm-Gg: AZuq6aKaStCLRLiq07J5i8SZu6JuWdpFq/U/62zqlFzZBhIFhXlqAqiv3Rm+rJVHk1N
	CF/wSjo66YvFHHD280L6fBq3F21NFwCvbUYHPadT3V8vOWzPKjAyXJJMw1L+M0aevoMVPC3MswL
	44MmKLuq9GVzCgxDqCQ4lSslnJjO66yzJIQLjOqTQl1msetbD8peCWpe+izaPcF6qdacrvl3aUR
	YspR3uW8SJGmLCRTu+l6n7TD1OvsQ/MCE4TjYzH1EJOyqMCsdd3UFdqNqg27gX2JhhPPFpzRiUN
	jxjFxrt5yinaY0jFI46xifwvAGZae7NweBorKBePlv92VlDxi6yvvXNW6U+uWbdK7yZDWyvjNOJ
	H3fbeF0LKnThA3p8tnq0TJa/MY3T7viUWHxTlfm2pzSzDJzgghtIF9EYL2KgLRZ1eIWvezJyz/r
	9CzgEd+pF/lWCk66FYALt0PPsNkaxCmsqE+QsaNm2VhbbgFDNJSr15CSnyXauFxu0geAEptevZq
	jHwVd2dXsughkxbgRC/ghD8SywgJjrxOxIxCy0a9uHZxQTt9Zq+qxfLOg==
X-Received: by 2002:a05:7301:9e43:b0:2ae:56ef:c85d with SMTP id 5a478bee46e88-2b6b34b2b47mr9729558eec.9.1768905707610;
        Tue, 20 Jan 2026 02:41:47 -0800 (PST)
Received: from 2045L.localdomain (70.sub-75-229-220.myvzw.com. [75.229.220.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b36564ffsm16521853eec.28.2026.01.20.02.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 02:41:47 -0800 (PST)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: dvb_demux: fix potential TOCTOU race conditions
Date: Tue, 20 Jan 2026 18:41:28 +0800
Message-ID: <20260120104129.105079-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[34];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51111-lists,linux-media=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: DF6965E0F1
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
 drivers/media/dvb-core/dvb_demux.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_demux.c b/drivers/media/dvb-core/dvb_demux.c
index 290fc7961647..e9e833285f0f 100644
--- a/drivers/media/dvb-core/dvb_demux.c
+++ b/drivers/media/dvb-core/dvb_demux.c
@@ -1147,15 +1147,18 @@ static int dvbdmx_write(struct dmx_demux *demux, const char __user *buf, size_t
 	struct dvb_demux *dvbdemux = (struct dvb_demux *)demux;
 	void *p;
 
-	if ((!demux->frontend) || (demux->frontend->source != DMX_MEMORY_FE))
+	if (mutex_lock_interruptible(&dvbdemux->mutex))
+		return -ERESTARTSYS;
+
+	if ((!demux->frontend) || (demux->frontend->source != DMX_MEMORY_FE)) {
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
@@ -1208,11 +1211,13 @@ static int dvbdmx_connect_frontend(struct dmx_demux *demux,
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


