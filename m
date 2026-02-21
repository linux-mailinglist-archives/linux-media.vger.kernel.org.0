Return-Path: <linux-media+bounces-53140-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPYEC6GrmWlMWAMAu9opvQ
	(envelope-from <linux-media+bounces-53140-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Feb 2026 13:57:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 642D716CDCD
	for <lists+linux-media@lfdr.de>; Sat, 21 Feb 2026 13:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B9673017015
	for <lists+linux-media@lfdr.de>; Sat, 21 Feb 2026 12:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A1B14884C;
	Sat, 21 Feb 2026 12:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ao/MFqem"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A123B1B3
	for <linux-media@vger.kernel.org>; Sat, 21 Feb 2026 12:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771678615; cv=none; b=E4bJOdNaIt+nO5RW6Z9Kdad5n3eDlv/H/tU59r00QucI6QXHSDWjos7f98Ojw4y4kyt+aj8ZuUh9BHKATjfVl/Ji1IW91SN2ThXt+6yvXWNUc3A5TSEj84KxFjfx32yaZs+5CHFKm35IVa7exb1ADi7q16kKMG1NejnnAXzUbgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771678615; c=relaxed/simple;
	bh=YgWjYxq7RXbp0FyYKts73N4C0h4XJlyREAM2Ese+c4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RSc0kMOjdiClXVvCRzhPdJ3GcafYtUpALDNYTJ569IgWx5dnhlKqf9BUEihZIdrbwO7MFGOS69yMW4KLd2EZnsSD9P7poRTZKpc7jnCOE759CV8oEeqwF42iUl7IfGCeC9Z8jr7DNmubAcIeao07dOv7G4uAhtcmj3avVAPNnCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ao/MFqem; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-436356740e6so3116611f8f.2
        for <linux-media@vger.kernel.org>; Sat, 21 Feb 2026 04:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771678613; x=1772283413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b8C4N7X0/t/n4R4Lnbl6uwhiS31yaXGWjSbzbzgqD70=;
        b=ao/MFqemtjmdzNssZdB3rs8SN82Xm/HTNFzpJHHnYSpIEMk3BUFfB8imtpx3eg5sTj
         ynQgV6awZLQpKGtxDaRDaD5Lsy1aCIlTvrm6GJFv3bLFJtcqCWvixLGBA4SzQa9Ku1o2
         pxJ9edNiivdheCOp+jbXTaT/0LB1817cAbxkLsR0d2XrASR+dxzPIcUJV8I7uR9Te42t
         l48kL4slP+AmBG2uUBDHblPZtmtK7pxzN7EVD/XAMjp0Q4y3+4NgEBIy1CgxTKkTdI+n
         e3d41EMoYQuNzVSft4uEdyYxmmsCgHOPBavqD7JniKqErvKn1d5d2tvChJZCWtY0+MCF
         8gpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771678613; x=1772283413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8C4N7X0/t/n4R4Lnbl6uwhiS31yaXGWjSbzbzgqD70=;
        b=AQZH7iCBK/jQzrUy6fpjzWduKXJLK1VKPY/mz+sqQOnWW7Mr/0Zgy41oceCEbHBMfB
         miSdGIxRWK4Bl6dCvlUXYwiuAuipTmC3oQG4kx+zpWIQYlaoX+xdrEcVYH3EqkLFnedb
         NkzwazSxtCqs3ilja9qn/gKUvLtu6nWg7k17jYSs0/3eyIMwHhYc/rqBameBQQLBvMXj
         yWcxiRjYw0rLikypGHa5XVzq833LbENHBNPKRE6/mRVsGQ29YbdV/n5+6gfbibyTLxVS
         KdgEhg04VGBQxvds1jMTwMjxAIhCsTfdoKPByVBS1/OCZCYQFORezDcCCqyB7yWDe7p+
         XfLg==
X-Gm-Message-State: AOJu0YysOZb9Gzntk2ODvI3mW03d04wygvjL2/9le2h72qUpmtmKRXhM
	MtJDf8t9OCTNLUAs+Kw8ZMzM9QDmUZP5Q9qwKnlZR4JfbXPNd/9L5EWU
X-Gm-Gg: AZuq6aKfNGiOzrYOnC1pI0NYesyCE2fCYNOGkH+x43/W7NKsb2pRKSumljcWpQByh57
	JhWjDZPwwdm6MMgTbcMBauy5BZBw3jBh05M1tJYJm3ArgIeE0uNVHbQDF92uD0ds9A7K6O+tDn0
	PpnF5LFs2U2JepRkzCY7qKWm917y0F8dHZBk5t26gYr92fbrr92M1CDhEovBKVrLzzvHbZ4JY+Q
	TAwCffKKmPFNMoC6khiWyMLYtlfTwzU35Q5328mVFDF1tVDwbXCPMESotW5q+0aAY3IGta5owuG
	k9ZsorNgj5fwK2XU/gCyGDEQralgWG81y/UVJX4+4BS0TL1Bix4J2zbPBN3gYe1aPsb6VWJdawd
	p3LKrqLDb5A2/bGtQs0hD6nuWim9DzfQ56COgQK90NsGJmwcuiVuy6P48hpSDB8O9fR7BNXXGi2
	eS/uqb6lZqCTStBQYLoe7zkS8=
X-Received: by 2002:a05:6000:3111:b0:437:6f15:29f0 with SMTP id ffacd0b85a97d-4396f17f44dmr5877675f8f.45.1771678612573;
        Sat, 21 Feb 2026 04:56:52 -0800 (PST)
Received: from masalkhi ([2a02:3037:22e:87e2:d9d5:eb22:70e:7c2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm5700039f8f.4.2026.02.21.04.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 04:56:51 -0800 (PST)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: dwlsalmeida@gmail.com,
	mchehab@kernel.org,
	thomas.weissschuh@linutronix.de,
	dingyihan@uniontech.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>,
	syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
Subject: [PATCH v2] media: vidtv: fix pass-by-value structs causing MSAN warnings
Date: Sat, 21 Feb 2026 13:56:18 +0100
Message-ID: <20260221125618.133570-1-abd.masalkhi@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-53140-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linutronix.de,uniontech.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,syzkaller.appspotmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[abdmasalkhi@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media,96f901260a0b2d29cd1a];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email]
X-Rspamd-Queue-Id: 642D716CDCD
X-Rspamd-Action: no action

vidtv_ts_null_write_into() and vidtv_ts_pcr_write_into() take their
argument structs by value, causing MSAN to report uninit-value warnings.
While only vidtv_ts_null_write_into() has triggered a report so far,
both functions share the same issue.

Fix by passing both structs by const pointer instead, avoiding the
stack copy of the struct along with its MSAN shadow and origin metadata.
The functions do not modify the structs, which is enforced by the const
qualifier.

Fixes: f90cf6079bf67 ("media: vidtv: add a bridge driver")
Reported-by: syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=96f901260a0b2d29cd1a
Tested-by: syzbot+96f901260a0b2d29cd1a@syzkaller.appspotmail.com
Suggested-by: Yihan Ding <dingyihan@uniontech.com>
Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
---
Changes in v2:
 - Fix the incorrect 'Fixes' tag
 - Add const qualifier to function parameters
 - Fix a similar pass-by-value issue in vidtv_ts_pcr_write_into()
 - Link to v1: https://lore.kernel.org/all/20260216211703.3702-1-abd.masalkhi@gmail.com/
---
 drivers/media/test-drivers/vidtv/vidtv_mux.c |  4 +-
 drivers/media/test-drivers/vidtv/vidtv_ts.c  | 48 ++++++++++----------
 drivers/media/test-drivers/vidtv/vidtv_ts.h  |  4 +-
 3 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_mux.c b/drivers/media/test-drivers/vidtv/vidtv_mux.c
index f99878eff7ac..7dad97881fdb 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_mux.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_mux.c
@@ -233,7 +233,7 @@ static u32 vidtv_mux_push_pcr(struct vidtv_mux *m)
 	/* the 27Mhz clock will feed both parts of the PCR bitfield */
 	args.pcr = m->timing.clk;
 
-	nbytes += vidtv_ts_pcr_write_into(args);
+	nbytes += vidtv_ts_pcr_write_into(&args);
 	m->mux_buf_offset += nbytes;
 
 	m->num_streamed_pcr++;
@@ -363,7 +363,7 @@ static u32 vidtv_mux_pad_with_nulls(struct vidtv_mux *m, u32 npkts)
 	args.continuity_counter = &ctx->cc;
 
 	for (i = 0; i < npkts; ++i) {
-		m->mux_buf_offset += vidtv_ts_null_write_into(args);
+		m->mux_buf_offset += vidtv_ts_null_write_into(&args);
 		args.dest_offset  = m->mux_buf_offset;
 	}
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.c b/drivers/media/test-drivers/vidtv/vidtv_ts.c
index ca4bb9c40b78..cbe9aff9ffb5 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_ts.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.c
@@ -48,7 +48,7 @@ void vidtv_ts_inc_cc(u8 *continuity_counter)
 		*continuity_counter = 0;
 }
 
-u32 vidtv_ts_null_write_into(struct null_packet_write_args args)
+u32 vidtv_ts_null_write_into(const struct null_packet_write_args *args)
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
 
@@ -83,17 +83,17 @@ u32 vidtv_ts_null_write_into(struct null_packet_write_args args)
 	return nbytes;
 }
 
-u32 vidtv_ts_pcr_write_into(struct pcr_write_args args)
+u32 vidtv_ts_pcr_write_into(const struct pcr_write_args *args)
 {
 	u32 nbytes = 0;
 	struct vidtv_mpeg_ts ts_header = {};
 	struct vidtv_mpeg_ts_adaption ts_adap = {};
 
 	ts_header.sync_byte     = TS_SYNC_BYTE;
-	ts_header.bitfield      = cpu_to_be16(args.pid);
+	ts_header.bitfield      = cpu_to_be16(args->pid);
 	ts_header.scrambling    = 0;
 	/* cc is not incremented, but it is needed. see 13818-1 clause 2.4.3.3 */
-	ts_header.continuity_counter = *args.continuity_counter;
+	ts_header.continuity_counter = *args->continuity_counter;
 	ts_header.payload            = 0;
 	ts_header.adaptation_field   = 1;
 
@@ -102,27 +102,27 @@ u32 vidtv_ts_pcr_write_into(struct pcr_write_args args)
 	ts_adap.PCR    = 1;
 
 	/* copy TS header */
-	nbytes += vidtv_memcpy(args.dest_buf,
-			       args.dest_offset + nbytes,
-			       args.buf_sz,
+	nbytes += vidtv_memcpy(args->dest_buf,
+			       args->dest_offset + nbytes,
+			       args->buf_sz,
 			       &ts_header,
 			       sizeof(ts_header));
 
 	/* write the adap after the TS header */
-	nbytes += vidtv_memcpy(args.dest_buf,
-			       args.dest_offset + nbytes,
-			       args.buf_sz,
+	nbytes += vidtv_memcpy(args->dest_buf,
+			       args->dest_offset + nbytes,
+			       args->buf_sz,
 			       &ts_adap,
 			       sizeof(ts_adap));
 
 	/* write the PCR optional */
-	nbytes += vidtv_ts_write_pcr_bits(args.dest_buf,
-					  args.dest_offset + nbytes,
-					  args.pcr);
+	nbytes += vidtv_ts_write_pcr_bits(args->dest_buf,
+					  args->dest_offset + nbytes,
+					  args->pcr);
 
-	nbytes += vidtv_memset(args.dest_buf,
-			       args.dest_offset + nbytes,
-			       args.buf_sz,
+	nbytes += vidtv_memset(args->dest_buf,
+			       args->dest_offset + nbytes,
+			       args->buf_sz,
 			       TS_FILL_BYTE,
 			       TS_PACKET_LEN - nbytes);
 
diff --git a/drivers/media/test-drivers/vidtv/vidtv_ts.h b/drivers/media/test-drivers/vidtv/vidtv_ts.h
index 09b4ffd02829..3606398e160d 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_ts.h
+++ b/drivers/media/test-drivers/vidtv/vidtv_ts.h
@@ -90,7 +90,7 @@ void vidtv_ts_inc_cc(u8 *continuity_counter);
  *
  * Return: The number of bytes written into the buffer.
  */
-u32 vidtv_ts_null_write_into(struct null_packet_write_args args);
+u32 vidtv_ts_null_write_into(const struct null_packet_write_args *args);
 
 /**
  * vidtv_ts_pcr_write_into - Write a PCR  packet into a buffer.
@@ -101,6 +101,6 @@ u32 vidtv_ts_null_write_into(struct null_packet_write_args args);
  *
  * Return: The number of bytes written into the buffer.
  */
-u32 vidtv_ts_pcr_write_into(struct pcr_write_args args);
+u32 vidtv_ts_pcr_write_into(const struct pcr_write_args *args);
 
 #endif //VIDTV_TS_H
-- 
2.51.0


