Return-Path: <linux-media+bounces-52935-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBRpOl+Jk2kv6QEAu9opvQ
	(envelope-from <linux-media+bounces-52935-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 22:17:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64418147AE2
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 22:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AADDA3015A5C
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 21:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A1B28640F;
	Mon, 16 Feb 2026 21:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igke/t8o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D1815ADB4
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 21:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771276635; cv=none; b=N3Vv2esroz7iRvtYJDiAMo2xe8RHb04Unt2KG/8PfY0tLLnruVtOnwm/HyCBlPzAD43q4S/bmPQwU9eX+cg9lxfyZRo+vHEkSbrrpvQLxiGmRpg3jsawBI7d/YA4miGBezNkoUdvYHBqICy4tbQf6x9CJBzBC5sTkuWCD9e/esE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771276635; c=relaxed/simple;
	bh=PHuRTWn3LLSApQ8KhA+0Fhp++y2aTZ5MBIrR34sa08M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jpqd+UjBIGh45Faemm1aiNwSM+Ld7msLIZ+/fRcSwHwMYNcE8aOtb/zi2oYfVblOgfJFTNDEuLGn81IoTdoe74XsDssqC6lILY2ouimtypqoiO7L3pm9s/PoSTJtHPEkwwoLZhCcl7Kgz+OkT56f1RZEQkv+cBaBvSL5vTBV7e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igke/t8o; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-4376acce52eso2320565f8f.1
        for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 13:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771276632; x=1771881432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hl5mbnNyuPCNXoCUnQoB64+0pXNQpBtlWAy/l88YWm4=;
        b=igke/t8ovZSNIA0vxu833hgrKAcUxjgDeQJemV54v3O4nLIgTyW+iKQA9J9S3ap34C
         ARHasrVyo+NgPqWDqmRU8ChnVG5ujSERcyv5wSbENbZEYOxXpY2vMhALI1YJNivFf78m
         BvPVx7pvwAeF3KXU9IUUddZvHN8xtCea7zxEfULJ3PNPvJar1O/QNS1zS26ALUut7Z4J
         3V5N4gbB4uM+QEW2OxJ1ZjtmeHkdWrZpJ3ZrWYcIsa6cORp+oSrEJAFIMK6fUwAWVAGX
         /mu+nKi8z6LgH6F+ZyTrY1fIU6Th5Ep8na5L6BXWYoHQdjm2vzPYMh7HGypYexvQ85Fv
         LThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771276632; x=1771881432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hl5mbnNyuPCNXoCUnQoB64+0pXNQpBtlWAy/l88YWm4=;
        b=So5XYQzLAv58B4SDteNFv/3Cx51Gdy7YJXMjITWXGGV6s9EBYyzchdttuV233Rrm3n
         pTd4khS/o9se+Q2c+TVi/fHPzSyikilp7Zvkhiw4xXLvUwxDOu9Str2NgfV81mGk7nlH
         zQEXjICCBm3BxfSihy+aE7+qRkmHqxsNglzduqH9U0gPBCX02uJzp3Bu3r5eOlLIDbRS
         Ngx0IJbWeZJSdl1ItpWhWVGeUX0pZMcIML9d4gxG6k9He3dJ7ltsJUfwhlTkLkYZyI7t
         JUw2+waZ0Hdftr5Na/KAwUYrO1pjZE4/kkPGcI2gp0A2VsaUolpFsLSlzzJ8vUqWwMRN
         u8gQ==
X-Gm-Message-State: AOJu0YyNS6QNtKi8N+MVDaEbAJedFAWhq0Ca9OKbCBZaaTlV2MR7t8wV
	F+4zRdmYgdrakKS4V1d1oCtR/g3Hx8o/iHvFh3BoZ4PzYZ+0XubE0+yC
X-Gm-Gg: AZuq6aLlnY7X2CG73tH11P6hIrR0tJ8w0T4Y8SyGrWQZ+7h2lEXRutfUnV5UTKYbsjI
	1EDi36glfQCPlu+YqO+h5MgglU8Vlek9UNdtfnfUx76WaJEEhljTVW1denHpb950fvuMi2fnNJ1
	0fGMADhJWtDgqEe1XLyulFrUzl9/NBfYzGCWQFlJxt4GB9RrPOFDj23bvnlvbc/sgwn5FTb46Cc
	AFyawFWlGNllpDUmoQoBD/7dP67PWYzXDKYuB4QaOXUb9JjhOW7k+pRtakTJfe0IGKQjE+I0HNP
	6xuhxTnch8WOe0G/ir21zzv/xMygECyLprd559XtIjoHXMLh9z58R3b09NPTToZf6Yo9QQ3b61o
	j2sW/CUdCuLEsPv3U+0q17nTdK21SxHEOc34ESLUFsIkOjFrvY3IBPfjQbX4RtCowQ1FBgH4Xx/
	3R6LxWo3dfBu2uYYtypRCvfJiSI3o/WV0YZ2U=
X-Received: by 2002:a05:6000:40df:b0:436:30e1:6c1 with SMTP id ffacd0b85a97d-437978c0b73mr23195099f8f.5.1771276631967;
        Mon, 16 Feb 2026 13:17:11 -0800 (PST)
Received: from masalkhi ([2a02:3037:26d:2bf3:2828:10ac:606c:9bf3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad112bsm30018765f8f.36.2026.02.16.13.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 13:17:11 -0800 (PST)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: dwlsalmeida@gmail.com,
	mchehab@kernel.org,
	linmag7@gmail.com,
	thomas.weissschuh@linutronix.de
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>,
	syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
Subject: [PATCH] media: vidtv: fix uninitialized args.buf_sz passed by value
Date: Mon, 16 Feb 2026 22:17:03 +0100
Message-ID: <20260216211703.3702-1-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,syzkaller.appspotmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52935-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linutronix.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdmasalkhi@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,96f901260a0b2d29cd1a];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 64418147AE2
X-Rspamd-Action: no action

vidtv_ts_null_write_into() takes null_packet_write_args by value,
causing MSAN to report an uninit-value warning on buf_sz inside
the function.

Fix by passing the struct by pointer instead, avoiding the stack copy
entirely.

Reported-by: syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=96f901260a0b2d29cd1a
Fixes: cd7a5651db26 ("alpha: add missing address argument in call to page_table_check_pte_clear()")
Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_mux.c |  2 +-
 drivers/media/test-drivers/vidtv/vidtv_ts.c  | 18 +++++++++---------
 drivers/media/test-drivers/vidtv/vidtv_ts.h  |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index f99878eff7ac..67a580396112 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -363,7 +363,7 @@ static u32 vidtv_mux_pad_with_nulls(struct vidtv_mux *m, u32 npkts)
 	args.continuity_counter = &ctx->cc;
 
 	for (i = 0; i < npkts; ++i) {
-		m->mux_buf_offset += vidtv_ts_null_write_into(args);
+		m->mux_buf_offset += vidtv_ts_null_write_into(&args);
 		args.dest_offset  = m->mux_buf_offset;
 	}
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.c b/drivers/media/test-drivers/vidtv/vidtv_ts.c
index ca4bb9c40b78..7e6e92503fb8 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_ts.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.c
@@ -48,7 +48,7 @@ void vidtv_ts_inc_cc(u8 *continuity_counter)
 		*continuity_counter = 0;
 }
 
-u32 vidtv_ts_null_write_into(struct null_packet_write_args args)
+u32 vidtv_ts_null_write_into(struct null_packet_write_args *args)
 {
 	u32 nbytes = 0;
 	struct vidtv_mpeg_ts ts_header = {};
@@ -56,21 +56,21 @@ u32 vidtv_ts_null_write_into(struct null_packet_write_args args)
 	ts_header.sync_byte          = TS_SYNC_BYTE;
 	ts_header.bitfield           = cpu_to_be16(TS_NULL_PACKET_PID);
 	ts_header.payload            = 1;
-	ts_header.continuity_counter = *args.continuity_counter;
+	ts_header.continuity_counter = *args->continuity_counter;
 
 	/* copy TS header */
-	nbytes += vidtv_memcpy(args.dest_buf,
-			       args.dest_offset + nbytes,
-			       args.buf_sz,
+	nbytes += vidtv_memcpy(args->dest_buf,
+			       args->dest_offset + nbytes,
+			       args->buf_sz,
 			       &ts_header,
 			       sizeof(ts_header));
 
-	vidtv_ts_inc_cc(args.continuity_counter);
+	vidtv_ts_inc_cc(args->continuity_counter);
 
 	/* fill the rest with empty data */
-	nbytes += vidtv_memset(args.dest_buf,
-			       args.dest_offset + nbytes,
-			       args.buf_sz,
+	nbytes += vidtv_memset(args->dest_buf,
+			       args->dest_offset + nbytes,
+			       args->buf_sz,
 			       TS_FILL_BYTE,
 			       TS_PACKET_LEN - nbytes);
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.h b/drivers/media/test-drivers/vidtv/vidtv_ts.h
index 09b4ffd02829..28da15dcc697 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_ts.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.h
@@ -90,7 +90,7 @@ void vidtv_ts_inc_cc(u8 *continuity_counter);
  *
  * Return: The number of bytes written into the buffer.
  */
-u32 vidtv_ts_null_write_into(struct null_packet_write_args args);
+u32 vidtv_ts_null_write_into(struct null_packet_write_args *args);
 
 /**
  * vidtv_ts_pcr_write_into - Write a PCR  packet into a buffer.
-- 
2.43.0


