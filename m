Return-Path: <linux-media+bounces-57499-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJUoFCHSyGnprAUAu9opvQ
	(envelope-from <linux-media+bounces-57499-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 09:17:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E585D351036
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 09:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3093C301CFBF
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 07:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5E122D4DC;
	Sun, 29 Mar 2026 07:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7JYfaCZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A4427979A
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 07:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774768602; cv=none; b=Na1AJrbTXSzDBrS6TMLqS5kgW5HJmFjFsIRfkSrOeAaf908QH5XJdPmsXZcV9CUndYWe4zWxZBHU/sTi4kuvVwkxypT2eDi7IXUjADYZn48waBufOfEuWWWLVTwqcQKE+3K6iJG5OIZFSSde3q2wII4XcLC8gqsuDgcwrbZojb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774768602; c=relaxed/simple;
	bh=JfFn5dD8fXSM0/s/rgq34bUOJdT1IsgTK5+GKwn9EYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e4RXawtAuyEef3Lp1LGMY996LA90KXTWM53r2DC+zw9kwNKq7S3mDn/eeLck50Qw92hOX5xVN4zehOknnCUwuxfew98iEsNmuAjaDPO5f2uB6Wd2igVm2UN+vntMdEbbkyYY77aZVdXAtmfET0wmTxgFpZLo95o1AuIlrUrN5OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7JYfaCZ; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-6052f9376bfso15928137.2
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 00:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774768600; x=1775373400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IncM+rKcgmau4uVK2sm4qPStCq75MjSeVAISYr8iaEQ=;
        b=F7JYfaCZ40zkTyZjD4/oo9cjgt8c8bax/h81LxTNsXwIjfCJoEazRrsMgXyVgSpMiV
         73Blt8wowCB8elOrluDcCPjsYRtYVz7pOiso/eaUtfl7pcd/zDWi9wCHrzqSyhZ5i4tN
         CKTcwtLeIZYLDFSdZ36Kln0imkqeAXZKSWoME3+EAnXWFLczLOL1ikqr7sECibdvCYtj
         8r7qBA5hv/MQNQIzAZO+KL0FOtiSfZkBnn0oQTHXSB1mDyVK0ymNZSHEOWgkAbndVf6P
         BmKMcfgune/yu3zuALXgBWM2D915/oZubTB+pMGUgLfnWJhBqo1tHtlZhoNmgQtVukiw
         d3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774768600; x=1775373400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IncM+rKcgmau4uVK2sm4qPStCq75MjSeVAISYr8iaEQ=;
        b=ivGqdpSGOM/igfzbGZ0NzWMMknRzk/sQVPCouVBP4cXgAxCrQD9TrZCpjJlQTPyoLr
         PIAxXIyx+G8iClaE51Hr53I6OB3MZDXJ7sWvAfVq6Dyjq5iV8qp/IPZuZT8GRmFvqOin
         XtDRA6Srsm2bJC7a2pBVWwPVgWHWcHuvtRmXs9VT0ZYIIJ+vbTHpPM+zh4mtjXy8ww1E
         peO+Zo4kZCfNsTYbPEcZCshNplVG73Qps9uZf3LN/ef3NSepQQZ83HUgBmr+rfCCzS1t
         5FKoF50GDF3E4GOxvFTIeRtQ+eamtZZgBB+ZcFQBlHxBs1z90J2Sr5YPYnDkt09AXN2L
         G76A==
X-Forwarded-Encrypted: i=1; AJvYcCUzvG0b0Euyj3Pa/t0BRr0ZRC9dRzJDJnrvkjj3WVe4SSLqFMwAwREuBdHsfu/hdmt+xS0trp6n0bsKXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+LxFkjuNnogfMsIbEPvdEvYkMR3gzUBNltaU/U27kEx4MzW27
	6mnbNNnKEQFFBvEeKvb9k8bknc3iaNU8jhBRO5oG7IFpvWDTmp6UKa3n
X-Gm-Gg: ATEYQzyTVt9qEMl413ocpKAeqiE6k0yoJzSRizbmJ4CwZFMTHmZm0Upc5N5QYkkQteP
	DTl5feGxQaHRm0ql3wk5qbwHGPlZyvMtAiXT+cFpgsBZlxMmcy4hZvBKblH1NasrwkdU1BlzqIY
	DFy+OUiza4m38OYEjqHmAfq+eWHvR7GJlaNNGC4Q7qK2fxy4vgF/I3O5l/YDklZkk60IYItG9/D
	C8Oi8Nh9txVJfa98KKyPHxSnUbh188dEOYtqGqEzAy4wmn1J0d9aRWPQY3uGP3VQpcEqjGFNchG
	Qfld6x8J7quj/Q71Ts2oCkW197P0cndY6gt9Utzz9awkWlosbA4rRRQ3hGZjuctDuFv9vrwQ4OJ
	UR+chNq1NajH0Xtr0ufdWTm3DVcapKTc2BDTH3zI0HVtVlLfvQroEjfOUTqACGv0NOe8YF27YOI
	oLedLszeNQBQ5qsa15HD16SrQq
X-Received: by 2002:a05:6102:41aa:b0:5f1:b7b2:8929 with SMTP id ada2fe7eead31-604f90e520cmr2908812137.15.1774768600043;
        Sun, 29 Mar 2026 00:16:40 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6df:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a5afa9sm4390638137.6.2026.03.29.00.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:16:39 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] staging: vc04_services: vchiq-mmal: fix integer underflow in port_parameter_get()
Date: Sun, 29 Mar 2026 01:15:42 -0600
Message-ID: <20260329071616.507876-5-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329071616.507876-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329071616.507876-1-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[broadcom.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,raspberrypi.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-57499-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebasjosue84@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E585D351036
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

port_parameter_get() subtracts 2 * sizeof(u32) from the VideoCore
firmware's reply size field to compute the parameter value size. If
the firmware returns a size smaller than 8, the subtraction wraps
around to a large value due to unsigned integer underflow.

The underflowed size is then used in a comparison that selects the
wrong copy path and stored back to the caller via *value_size,
propagating a bogus size to subsequent operations.

Add a minimum size check before the subtraction and return -EPROTO
if the reply is malformed.

Cc: stable@vger.kernel.org
Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 18e805b92..f2bb5ce0a 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1436,6 +1436,10 @@ static int port_parameter_get(struct vchiq_mmal_instance *instance,
 	/* port_parameter_get_reply.size includes the header,
 	 * whilst *value_size doesn't.
 	 */
+	if (rmsg->u.port_parameter_get_reply.size < (2 * sizeof(u32))) {
+		ret = -EPROTO;
+		goto release_msg;
+	}
 	rmsg->u.port_parameter_get_reply.size -= (2 * sizeof(u32));
 
 	if (ret || rmsg->u.port_parameter_get_reply.size > *value_size) {
-- 
2.43.0


