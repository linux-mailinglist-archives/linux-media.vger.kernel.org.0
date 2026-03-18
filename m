Return-Path: <linux-media+bounces-56237-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KBZOOj9uml2eAIAu9opvQ
	(envelope-from <linux-media+bounces-56237-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:32:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F4E2C209F
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5787302140C
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 19:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558913F20F8;
	Wed, 18 Mar 2026 19:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9HbIlNJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B362989B5
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 19:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773862365; cv=none; b=XgayLqaDG7WeCSs5N/KoEJm9v76EczfJaOeQcyWhg0TBJRD7Sb58DAbtVQW0DsIVBNiH486OwDX6fvS373XxX2MuncPUoTWKN68LTx0dTg8NWJUO62+VebvIkZk4TD4ewwUjQPfG9yBdApn8S+9MGJze63RhlMWoQYxqnfk74SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773862365; c=relaxed/simple;
	bh=Sa9LZMmYnHSAUw8nvBcoHZqtGdkkPiUKkR8E5qnbbB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ox230pWPaoFERmrJaXMR/u6+pEas0PoHIzUMd9FDKG+JRVeYSmzVpSzaDYBlLCJZ1S05lHPhiQR5nGbW58B3NWkQXhKAmSWIVgaj2C1yAZFBJ/ljPIWaRz+t+LlvNegHjNkiBMzgekKT8f//EGfcA048pnO7scRuGy41zNqpJY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9HbIlNJ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so267894a91.1
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 12:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773862363; x=1774467163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbU4+BE126IsvD/jRxcUr/l8T7vCwh3ERJ4LHLwRlcE=;
        b=j9HbIlNJH2G07R9jQTyDMxig176DfSXXTyq5XWfV37tDrzHrJinbZP/cNMwjGiudfP
         gGwjZmqIyb/TR7VQqF/K4yVMng/0nrWIEDXQ2lirAweR/IkHvkqRirtRfyK4wyJkmEA7
         IPnvPoYh0XUy0TMUnvnrDgDmOl4ejKGm6jgIGICgacEPau8Bb8EGxUCrx+eYPedPsoby
         YKojLQzltd6t5BC18HPio1gN9JoQ7K41XRaFoTWerY5YmBT4Hvebf5TeRTOVbaNsTVhS
         kGCD+wZnKb6kzlvLwR0C+LiiplK4eqeqdu6TbABNaShpv7iXfkXhYPK3HoJgjQ0XBK+V
         DkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773862363; x=1774467163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fbU4+BE126IsvD/jRxcUr/l8T7vCwh3ERJ4LHLwRlcE=;
        b=iJxJ6Hcz0jAXs8qgEa0l0w5m+aUHOYQDsCNIt/situ/Pc/oaXsmoY7iEtGqhb3tJU8
         PfJGVvJvFC95s5bT9RKfF3xfmyZ8D4pC93Gi79g29yDUWyT06srqrwQTE+BuZdIxz6SO
         n2lHCL672bIyXWvTVot7oeH7cqWFQHkW/tyw8CQ82jD5B/hS9REbjbZGNOxr/59WDaK9
         MYwt9baU24QqBmq2/beQ0FZD3WcqpwxYxngUF8LpfhBhigh3E6N7rBvFrsdGaCylJNY+
         8ifNtpMmAXpZ1dXNqIcJygf8wwYEQWVALrzFQoepm9vrkX/xOPCkd0Syu+YnNy8VHwHJ
         eEiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8k21d1XilZGhHkRKejPtt9Wzyo4AFCmJplOIgYK6s6RneX4TBaf2dc/DowAjgvpecAKoOuK2Er36qmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwmkKTDBqFZ0t1ppNiQGk5+up2Cf1K8t4PwjiBz8WVlLXaX+TN
	xzKhLzyirZrUooqXdnDg+8Zp7XmH07JfG5yLk0Lu3YAO0HKACf8gxm/Q
X-Gm-Gg: ATEYQzwDKGYMs4/A4DG+rzAXD5fNUpDo60RnU3rlcO6VPolDzrl2DyCO6frATQnK4G9
	UrV139E0/uW2JQ6kyhi47cKyEFaYp9eS2LNcH8ExSh8Tpw1uVWWjJfz8s0ZLmwtZaUOC9TrNLVn
	BP6CbXLTx7kqGhZJUW0Ty2PbP/Tiedp+F9nDKgHQhW8ZH05xduvvrMM90LpcVarZoSNOW7EjCj8
	pRSdcn+5HTjMBfCLe2t2PhmHrTshM5Io1EO5m11pfzhcdgiPHDdag1F2YIV/n/ATLR0cyaT2p99
	CRA3saVKSM/IKQqQKghAWJ+2sSOqAvEr4l0f2JXT58SIerZcpdJN8+0me7rgha/QhKgXl/GgaU0
	BZnNxTqu9/5ypmjd7ynbunJLTZUTSk4brrraCYm6gn4IWXJzN8nfj1IEGyWosjUwDTc1gH/12gm
	xj+Ym4rYmKczyH/ldUUFFpK892
X-Received: by 2002:a17:90b:2791:b0:359:8c9a:fde9 with SMTP id 98e67ed59e1d1-35bb9e7d3eamr4819178a91.11.1773862362849;
        Wed, 18 Mar 2026 12:32:42 -0700 (PDT)
Received: from ganesha.. ([106.51.225.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bbabae770sm1668455a91.1.2026.03.18.12.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:32:42 -0700 (PDT)
From: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: media: av7110: coding style fixes: too many tabs
Date: Thu, 19 Mar 2026 01:02:29 +0530
Message-ID: <20260318193233.110451-1-ss22.kern.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316152340.238100-1-ss22.kern.dev@gmail.com>
References: <20260316152340.238100-1-ss22.kern.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56237-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ss22kerndev@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.723];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 88F4E2C209F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch fixes below warning reported by checkpatch.pl
WARNING: Too many leading tabs - consider code refactoring

Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 33 +++++++++++++++++++--------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..15460ca026dc 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -932,6 +932,28 @@ static int dvb_feed_stop_pid(struct dvb_demux_feed *dvbdmxfeed)
 	return ret;
 }
 
+static int handle_ts_memory_fe(struct dvb_demux_feed *feed,
+			       struct dvb_demux *demux,
+			       struct av7110 *av7110)
+{
+		int ret = 0;
+
+		if (feed->pes_type >= 2)
+			return 0;
+
+		if ((demux->pids[0] & 0x8000) || (demux->pids[1] & 0x8000))
+			return 0;
+
+		dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
+		dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
+
+		ret = av7110_av_start_play(av7110, RP_AV);
+		if (!ret)
+			demux->playing = true;
+
+		return ret;
+}
+
 static int av7110_start_feed(struct dvb_demux_feed *feed)
 {
 	struct dvb_demux *demux = feed->demux;
@@ -951,16 +973,7 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
 		    (feed->pes_type <= DMX_PES_PCR)) {
 			switch (demux->dmx.frontend->source) {
 			case DMX_MEMORY_FE:
-				if (feed->ts_type & TS_DECODER)
-					if (feed->pes_type < 2 &&
-					    !(demux->pids[0] & 0x8000) &&
-					    !(demux->pids[1] & 0x8000)) {
-						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
-						dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
-						ret = av7110_av_start_play(av7110, RP_AV);
-						if (!ret)
-							demux->playing = 1;
-					}
+				ret = handle_ts_memory_fe(feed, demux, av7110);
 				break;
 			default:
 				ret = dvb_feed_start_pid(feed);
-- 
2.43.0


