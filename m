Return-Path: <linux-media+bounces-56228-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aO8yIB75umlwdwIAu9opvQ
	(envelope-from <linux-media+bounces-56228-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:12:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F249F2C1DB5
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 20:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A51023014555
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 19:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F273F0757;
	Wed, 18 Mar 2026 19:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vxx/d1+t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05FC314D1D
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 19:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773861140; cv=none; b=GKRF6jUsn6f6trnM6lOovbvdEYMzJUPiYoLM5qtP03qGotuyI2pXXVY10skGPGYVRGhw/bi1YdqF4OjHJnXWoVAbsWhGCFtfRFiJuMSE3LXfIOqjxHRX+G5gYkD5CEYQL1A9wbA+RTF3OZmjph9OuMy4Y4qJg3hSh52JQ12Olac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773861140; c=relaxed/simple;
	bh=Ke2jPk32BmZfMKuOc2wbyhXwQbB58vorjkeaSPb14s0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UcN2kjHY6KoP75Qb72MX0COIrUS0oZnuuEGaPiWskBU5gNKU4OEbX0LXeOmdO6sk3HKTU1/2w+hAw+/cBwephHNJi6Sm9Lm1jKxahuZ+aKE+ygcFhvCRvaDieJbMlPz3QMzeVhyozAMMomnaQvUzYAv5p+d5tYrwN96ln+9xo9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vxx/d1+t; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b0603ee486so1270275ad.0
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 12:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773861137; x=1774465937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rtyvqAyOmQpfFoytdsaHk5qiw++19zV7NVycqJvGPgo=;
        b=Vxx/d1+to/CVAdr1Kq2QzqNnSa/zPbi+11O+e7yOojQ+KFyQc9DgCh1sAzt0lOq/HP
         eJgW1r0HbZtd7M/fHqJu6t9bZJumbYe6naYqzHGUku3YmrJFXFV2fdw9XfspKwTEkWUX
         bFdJNSHReiGZfuH8eJsQNbOI0uFVgGXEbosveFKVnkDAFULrhdhKh5GnuatUhWcWicv8
         MnQrdlkc81DtniG3E237dBPOb5268tYlVAGa9zjAlBAvHPEieU6FGgLxVBN9e8qfV6A2
         k0YT2D3VxZnGrowF92iZmLdcZ6meCCYASO6pnmP/6qGzWXM+f89mfy8oUOc7z8U0As4P
         tZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773861137; x=1774465937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtyvqAyOmQpfFoytdsaHk5qiw++19zV7NVycqJvGPgo=;
        b=IdihoeRl4pTeZ2uW8NSYLQDksRByBLwbKuOS5aq40Q9rjOcqwoY5qL9N9ttHlbbuc9
         EIeWnmbmRncsHH4hgLbGxayeE/vM+vMjziZiEViG+8RROH0g7b40GuYwcNKAJnqxVE++
         0UqPQqRnmhvEGbhiO81/5AB1sRximq4ywEGfOTXelvISRpw3+GjPfXNu2Mxbzr9qFrbJ
         qsUi8sBJ6PdvEc6uzJ2yZ5mvMX42NHoWmxl2aollnBwmCDfDwK3WJJxh4ShOyfgdwm1D
         6ZflGaqOyqnB1O0V0ie90iW9FX8N4J9gK1JT4OvmdyGuAHVNt/Lcbko6jxXxjXpsXOQb
         xfKg==
X-Forwarded-Encrypted: i=1; AJvYcCUcDQPOkhtBvpGZvOni5Oj1qW08O6CtfHluo6EIhQE9dOjoHYAG+tvgjTuDrptlh6CEwGvcc2TCTaDH3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiv0K0QrXvNsLWAHCiMNLIJBh9Oxn/bnUNFjF3G/Ld3cbY86XB
	0CVByGj4KW4sOZdUrCp5ODDXyXQPWLFFa/cTBg905J1SE/cm9yHk6TC6
X-Gm-Gg: ATEYQzxy8nYpMBakdTPbgyum5ChHpev7GrQ5H+FIb6iB2TITvAMasCXBL2Vq5hKgmGB
	7ZDNs+vXorIzmCMJlVvojH8i1crH9WF8/J045T4Cl03XBWubC9+5h1lKx7Gf4Nro4WSpvRMqsYN
	MPo6/MMING2Ipcd6w366JegTWVbSTp4bXg1yIIa48vnpKiho2N51NiWHR1zccB1TzTwWqwpLJSI
	/kyzpmNTwXuBXuE8ErRT+4L+vWnDUE5WDnYdWvWGOBDaxerT1Ey9InRF9uZJy4xsGOOMwztOEw6
	POm3csRx/clM7rlyotnnebDdLd50+k+Bn48wNCPf027M2PmWrmdkucdHZXFr7/Ahc6VihR45WYF
	9a5khuVYQxgXojDBmm0/+jrbqo4v0zeGQx5IgImEYvh+V71V15Z/xGDSV83C2VJ4ryxhv8E57so
	dKx+s91+KKvqZ2TXPOG9JsiqDL
X-Received: by 2002:a17:903:b85:b0:2b0:5661:e10f with SMTP id d9443c01a7336-2b06e43f61dmr39596955ad.53.1773861136974;
        Wed, 18 Mar 2026 12:12:16 -0700 (PDT)
Received: from ganesha.. ([106.51.225.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e615f88sm35495855ad.65.2026.03.18.12.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:12:16 -0700 (PDT)
From: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: av7110: coding style fixes: too many tabs
Date: Thu, 19 Mar 2026 00:41:47 +0530
Message-ID: <20260318191149.109616-1-ss22.kern.dev@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-56228-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ss22kerndev@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.652];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: F249F2C1DB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch fixes below warning reported by checkpatch.pl
WARNING: Too many leading tabs - consider code refactoring

Signed-off-by: Sudarshan Srinivasan <ss22.kern.dev@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 32 ++++++++++++++++++---------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..970343c4ec51 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -932,6 +932,27 @@ static int dvb_feed_stop_pid(struct dvb_demux_feed *dvbdmxfeed)
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
+		demux->playing = (ret) ? true : false;
+
+		return ret;
+}
+
 static int av7110_start_feed(struct dvb_demux_feed *feed)
 {
 	struct dvb_demux *demux = feed->demux;
@@ -951,16 +972,7 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
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


