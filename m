Return-Path: <linux-media+bounces-57903-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCVvJfFvzWlsdgYAu9opvQ
	(envelope-from <linux-media+bounces-57903-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 21:20:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA52D37FC58
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 21:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44E3A3029267
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 19:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA21733263A;
	Wed,  1 Apr 2026 19:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CehY0KkH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092342DEA61
	for <linux-media@vger.kernel.org>; Wed,  1 Apr 2026 19:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775071072; cv=none; b=dMrFgVOhpcm1hfYfu2YAxa0oB4yefJc4SPIBlltH6An6loBIM9bQqdTSYDaf5PSMw3FQBIolC6U1GAjrym4YgSaLqN6ApTVS5XQywwfbQduslvK6AHGSBXDqxsuBQFujiyAf6TXdUpjhBLMIa5NvL9Jp/jw/K/W6SCIx4D0fgCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775071072; c=relaxed/simple;
	bh=WVp2ddejS72pCQjGiKfyMEp3r12FjUVCqSOQQN8vZ68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UdcnvQpqBkULhh+vfmh6/mxk09YP+QZnc9Ih8SYTHfl6aXquZUk1cFsB1k1XlCgaGJZZVVlK4zQSJ8ISK/kNTK0ijmnf0W7cca7s8MlcnTSy4sGaqvswunLErD+T5SEUbUSX2mCcN0bShm7UBlJ1AnqnytGU1n5J/WnSPEJrpfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CehY0KkH; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82a7539851fso56027b3a.1
        for <linux-media@vger.kernel.org>; Wed, 01 Apr 2026 12:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775071070; x=1775675870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xFGgYlat78QlHBf17jTWXfuiJFHZzeYKJ7RjiLS7B90=;
        b=CehY0KkHcr/s1XaucVoeoy7sxhGVwpAVKEILCMCGJtij0FzN2tIx/PMCl2+jsAn+xS
         HTh2CsHQRAp1TCBtkhTgZiBhLfvdnwB+9VdQjc07OlE4KmnJJl+oDIasNzqdxDkWK9bO
         YjUHq4qTOkFxUBidXi/iG5sscCDUNgKRG1usKnyPGNyhf2a2l7rMDah1/3TfOthnzHj3
         qZdwHa3YjJE+45vJEdIwWc1aNpGzQjc+dMbd7MNk0umIz94NyCBQg6y9KvXj+pL73Eh9
         duREj0kgrIg0NrHWic7WDTQ8v/liD82AXkZARDjlM7nPGH7pANmQzcbguUfs5GDdqES/
         UQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775071070; x=1775675870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFGgYlat78QlHBf17jTWXfuiJFHZzeYKJ7RjiLS7B90=;
        b=F+sTKtAb5Jm7MX3RC+IRXQ0CUw781g7avFkyKRYVTR/2kD7dwAAyTTk91Qc/u17ikV
         2+AB7a6zx4d5c2qIv1waBLlhmFiDfMATQkQqHLe8DZUTq1b0YBgaN8b5UrbPNkpGsQuC
         0DDFn3wOWsUTLawlw2dh88ACH/JQQIkqKxGXzqI/CWVZw0B0Fc9yZ8kxi7PYApq4B6RK
         9MsqYcIvL/X5/Cl2ixC9Hkl7jfRN07njPVTidduUW/aMXYb7zV8v92Zo+M30h/GtzU+d
         B16jYOY8LNomelfP8JesvcEuymenNhjYIhl0i0crI4wsfDcGZIasDnPskbn2odfNYu5s
         zkEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlwmM+QMBK08h75KL02ZjQs4IGisSnsvjFz5XWm1ddS3ARS1ZcxVuNjgVu4dVOem1CrcnKHZSnubXPCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5zMRFfGblU0y+qmDw1eS96lUCe2WEnAHdYS0BH8akQLyB4ZCT
	AKYk/XYd5J/tasTuQ8BqksWrJl2noHhc1/l7BFm1QMsn6rWmvrt/O9MR
X-Gm-Gg: ATEYQzxD7gTDoT7JOMDcNOqorYt5Dh49j7iqZTzJ2fVkFl5t6SalqrcHVkU4qpUfP2O
	ylL4SSwPU3NUDYX5Ur+0ZyjAHmneAjTdHJB66lCDsB9RvzOFkwqMPbTZqyi9KInUSAPPctZM0bE
	qWrNOcPZq6kTyiDZT2S4spgJuiBhL2pf3SBIGXMZGYbveCk0j+R3lHzPXdoa8fJWoGjTUyReSi+
	LDIs2EpPxUr/JnIp40l5sUIbY1maB07/MnvOlAPnG0qjNYTfABvfwQqsRHO2qZ9EDdQ2uHrOgtb
	RW4EN6uJMHAAoCUt4sM5O8UdsK4wL7egPE2IvULt8Cz3TfXYvpErxX69hl5Z8SapM+ALGNBfFOc
	q0B7I9jGBOS+IHL85W9d4A36MtT0XOfvJfFLuG8NuhRlj+5XxJT8atLOLkMewfkYVVYQmlD/2pU
	UawxyLiYHF3sc+X6gLYl8A1WlWsnu8J8WFlQo=
X-Received: by 2002:a05:6a00:3010:b0:7f1:7b2a:ab5b with SMTP id d2e1a72fcca58-82cfb901ee7mr688533b3a.27.1775071070238;
        Wed, 01 Apr 2026 12:17:50 -0700 (PDT)
Received: from ganesha.. ([106.51.225.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c706f7sm689490b3a.47.2026.04.01.12.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:17:49 -0700 (PDT)
From: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	error27@gmail.com
Cc: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] staging: media: av7110: coding style fixes: too many tabs
Date: Thu,  2 Apr 2026 00:47:42 +0530
Message-ID: <20260401191743.26951-1-ss22.kern.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57903-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ss22kerndev@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: EA52D37FC58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix warning reported by checkpatch.pl
"WARNING: Too many leading tabs - consider code refactoring"

Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
---
v4:
  - Added the missing check for  "feed->ts_type"
  - Removed initialization of 'ret'
  - handle_ts_memory_fe() accepts only "feed", "demux" and "av7110" extracted thereafter
  - demux->playing assigned to int, instead of bool to maintain original style
v3:
  - Removed the additional tabs in handle_ts_memory_fe() as indicated by Greg KH
  - Retained the original code style as suggested by Dan Carpenter
v2:
  - Refactored change by adding function handle_ts_memory_fe

v2: https://lore.kernel.org/linux-staging/20260318191149.109616-1-ss22.kern.dev@gmail.com/
v1: https://lore.kernel.org/linux-staging/20260316152340.238100-1-ss22.kern.dev@gmail.com/

 drivers/staging/media/av7110/av7110.c | 36 +++++++++++++++++++--------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..486dd8010e7f 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -932,6 +932,31 @@ static int dvb_feed_stop_pid(struct dvb_demux_feed *dvbdmxfeed)
 	return ret;
 }

+static int handle_ts_memory_fe(struct dvb_demux_feed *feed)
+{
+	struct dvb_demux *demux = feed->demux;
+	struct av7110 *av7110 = demux->priv;
+	int ret;
+
+	if (!(feed->ts_type & TS_DECODER))
+		return 0;
+
+	if (feed->pes_type >= 2)
+		return 0;
+
+	if ((demux->pids[0] & 0x8000) || (demux->pids[1] & 0x8000))
+		return 0;
+
+	dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
+	dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
+
+	ret = av7110_av_start_play(av7110, RP_AV);
+	if (!ret)
+		demux->playing = 1;
+
+	return ret;
+}
+
 static int av7110_start_feed(struct dvb_demux_feed *feed)
 {
 	struct dvb_demux *demux = feed->demux;
@@ -951,16 +976,7 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
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
+				ret = handle_ts_memory_fe(feed);
 				break;
 			default:
 				ret = dvb_feed_start_pid(feed);
--
2.43.0


