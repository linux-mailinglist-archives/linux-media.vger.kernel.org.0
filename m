Return-Path: <linux-media+bounces-65301-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZbHUDZrANWrr3wYAu9opvQ
	(envelope-from <linux-media+bounces-65301-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 00:20:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8370A6A7E85
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2026 00:20:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CMykFLnm;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65301-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65301-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AFDD3094C96
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 22:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905BE3BED30;
	Fri, 19 Jun 2026 22:19:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B225C3655DD
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 22:19:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781907553; cv=none; b=njHEASGr8W9i666OsXRIqVAcLHyyJfntjfCd+klMFluCLaVgv1if+d4GL1VkZ5ziN4dQqCjYKN429uh6Rfr2DimBvoJ+vZyha+Ab0xhW0Y27Ue3RNjgCd76YUVQu/GUjiIzCX03G3XzByCIUGuXKViT9DZf1xWFE6Mg5yjrsHh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781907553; c=relaxed/simple;
	bh=DdEzNGXBbAJlLKvgKj8MWaMVC+JVtLzMufbPuNq+nrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dwkeYKW+ecErqszTLtUpX9jiEXNi2TFEPQxwHdRLiN2ept3/JjXhGEElJVj06oKKwlTkKN5Z76WR6gCFZ3aIDIjGTz7IOYEiMmjUcAtve3oQ7vvAJCgiwuF9A3MAtFdR24sznC0NDYIun7VtLQ2sJzsc3EdnXwrnM/ZPC2ve6Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMykFLnm; arc=none smtp.client-ip=209.85.208.47
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6977c0814d1so131662a12.2
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 15:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781907550; x=1782512350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNj5JOnCEdVFcw3tVgjzQE7ie9IkNhVYMnie8GeBSUc=;
        b=CMykFLnmJFeYCNdiuoSiQSb8sH/yAen/3ZVwPKsufJnP2jRbqd+BmFFnAWrF8OYcR5
         3TPZHhbkDpE3Hbuf4dg6yr/WlX3f19zgLaB5HvU+PeBMyf9tNqPaoXaPuMSFKRNanho4
         y0M4RTbDXQ50qZEjnKClpLlK6VdTFR2zaKGodwTO75PhJq21C1wTLkn04ejQvLoOvhp7
         nabc/qf1L1ilYGWq5z/rdoEFSLsZmVcox24muN1rz80t8H7MnZcYVe7dctlcuetjShG9
         9kJV0A7hwW+X0mKdYNSDYOCYpVuMcPWJhKb0ySfXKuyrg5sdKWh++V9mQa0/m+cyJVhV
         kBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781907550; x=1782512350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QNj5JOnCEdVFcw3tVgjzQE7ie9IkNhVYMnie8GeBSUc=;
        b=ApE8UKybUM5AFvd6LPPDSKpyXqT6wesZgFQpUdBEt2OcQ4o8nRDLGKXYqJ+ZWjXI29
         Q5ASQ7uHjTbTN1kskYZ6FMSk3xJbKlUvqmdChhSfbDQzGs+xJU24PfNGXUr/7mIQrT2A
         3ixOltVrzOqM9Km9QcKFzcLqMAR7UqgMc3qKvpSKDb9mwOk/93uU6wqD53BGm7d5huOb
         agthi7yZqBqO+hh+fqr2lw2f9kO9eYPYfQK602Yb/tNbhVHI5UHFTyl+jgUz90f3X1Bk
         hShlc/hkfG+mpECvvHg5jHzdbTenR2aHJEO9M3nUub/nnntNeCe2eIgMfuBWtKriEctE
         UNqA==
X-Gm-Message-State: AOJu0YzK0rgYmLUw6NXbdE79SrREI0/qnuni/JkkIy5KkAW88gZ4COf9
	kQQO4JDXHds0vFvv7u3s1jvKTDLslkkIeak8I+n00ARPibrCMblpBJRm
X-Gm-Gg: AfdE7clJOKSVwxm3LMfl+frSu6XVQIaGzaI9dAtAgifNC3leXfxEiCkXHieEoGca/7o
	SjC1QeZonvUHxroL8/nCcDHOupwQmeC2lv/0qy6Nxd2K+chA8D2VU7tNLwUwnncROcq6GFBP1Z6
	dl8Z8czaGssPHf9ljbpzDCSQIm/nkq4N6kujI2UMCkTe5YDOPmfgBFd1wHUmSl4c/7Ld24KjYFc
	BWUf/wXbKNrG92+pJNzPoa6/72RixuDzqH56urIM9j1Vvc5YnJevkCkbd26vIdwdhfDlJtnWlhe
	UuQfDDZvBjvKgUHcXQ3kkk3xNotwouJLB5TKddLZPq26m3H8HW6GT7CoYu3I6QKx8e0hFr2xjCX
	7x6XbyEVeFxNwfajWebPeRtMR7zhTxrx8X9Dg/XdI8G4f9l1PpndwhJY0VG1T8zdkS9ns7ojhAN
	i1PVYlxH0GrgTPkeWrIrP9FyZqXwsq//BfcUaLcW7od7paNEs=
X-Received: by 2002:a17:907:934d:b0:bfe:ed06:5a15 with SMTP id a640c23a62f3a-c098bd62af7mr321921166b.51.1781907549959;
        Fri, 19 Jun 2026 15:19:09 -0700 (PDT)
Received: from adr.. (212-8-253-73.hosted-by-worldstream.net. [212.8.253.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49b77bsm28513066b.2.2026.06.19.15.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 15:19:09 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH 2/2] staging: media: av7110: refactor av7110_start_feed to reduce indentation
Date: Fri, 19 Jun 2026 19:15:24 -0300
Message-ID: <20260619221524.51814-2-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619221524.51814-1-andrem.33333@gmail.com>
References: <20260619221524.51814-1-andrem.33333@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-65301-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:andrem.33333@gmail.com,m:andrem33333@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrem33333@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrem33333@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8370A6A7E85

The av7110_start_feed function contains heavily nested if-statements,
causing excessive indentation and violating code style guidelines.
Refactor the logic inside the DMX_MEMORY_FE case by inverting the
conditional check to break early, reducing the indentation level.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index e77be16f442c..2e32acf897ff 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -942,16 +942,16 @@ static int av7110_start_feed(struct dvb_demux_feed *feed)
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
+				if (feed->pes_type >= 2 ||
+				    (demux->pids[0] & 0x8000) ||
+				    (demux->pids[1] & 0x8000))
+					break;
+
+				dvb_ringbuffer_flush_spinlock_wakeup(&av7110->avout);
+				dvb_ringbuffer_flush_spinlock_wakeup(&av7110->aout);
+				ret = av7110_av_start_play(av7110, RP_AV);
+				if (!ret)
+					demux->playing = 1;
 				break;
 			default:
 				ret = dvb_feed_start_pid(feed);
-- 
2.43.0


