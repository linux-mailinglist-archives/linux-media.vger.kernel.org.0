Return-Path: <linux-media+bounces-52337-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IfiKr+dh2kKawQAu9opvQ
	(envelope-from <linux-media+bounces-52337-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 21:17:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 400001070A0
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 21:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 547B93016D3A
	for <lists+linux-media@lfdr.de>; Sat,  7 Feb 2026 20:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D1E33BBAA;
	Sat,  7 Feb 2026 20:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Grj1qlY7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD5F33A9F5
	for <linux-media@vger.kernel.org>; Sat,  7 Feb 2026 20:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770495412; cv=none; b=cXJoD3o2pSYxXeCNuhLkIQMCtyPGLdP+6oksaH/JUPv+FZB3SzUc3KEQUy/975fMJHPclM6gbW1m19M77Mnc1n6rSryl4h9sAWO/G2f/ADMyEncfhQq2ZkYD7VTubJlDKWm7s/SpaBNEhsDnAaw/jgNaUSjGfK3eB0nHmtM52so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770495412; c=relaxed/simple;
	bh=fmf+IvZXfTS9lX/mYWGHMR4VL6rH5CI1CROTGaxeIvc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bvGDFhu2EbOdLsv6o8SNDzc+N/Oj+v6UUNjWZGnAVVfvDEC3EUSdYZvPG1qzA0yKi3chT1E3n/KW7FYs9CGHlE65KdLL0I748pGB48hMyWTpzicGEVScAFs4hxb8UwcUtmbqzS8YCIXggtV+HQwCBHFUgB/0hUQUB88ZqknoAiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Grj1qlY7; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-352de4c94adso376079a91.3
        for <linux-media@vger.kernel.org>; Sat, 07 Feb 2026 12:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770495412; x=1771100212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RBpgTWXrKC/ep28TsDpXq3W1RYINh19dRkfUQIrLGfw=;
        b=Grj1qlY7nGQWXJplUT/uVP8ialUNThF/FJPMPR5RqP7bPzWLsRO4wQlFD1sbriELt5
         79GTQUjgvUoVvjXWSMiRZ+66yPOnP/HNP5sS0ytaZZZdqkSLcPdRmrmLU5Whg/rqwahn
         THKYPDpDX4FIM6c7KltyXzSGO7lsQ3NUBYC1RkWUzxg55gIHKQrued9Hqn7IhzROTaTu
         fxrfZlOqCfwiH6eY9WAywFW7+gNPgSn9v4dKQQRlZAh1hqGh4YXvpnmi7eu9p27X90OB
         R5WQkpt72um4KckDuz2Vuv7OsxYMe+3E47gqA3HbG+AvvTqeenzcHseOMYVcqaZn7BUg
         mN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770495412; x=1771100212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBpgTWXrKC/ep28TsDpXq3W1RYINh19dRkfUQIrLGfw=;
        b=TNq/hRymtxT4ib0LnKjPHcD9dGC1OZhkNU0ZINcuef1K3jhjxSrVy2mICTfGL7Cwj0
         8s2QCV1BwZoJhQQRaImh1zVZXeTJh9p7JHnNNqoPi5C0xSj9L4bNMebrzH0jBFtp32/s
         aNI6txSwTTdrKwYOe9YBAZqeqQZ3+GU70g2EM90c2xhLTUGR/gpAx5K0e6go6aBbGv4S
         fVNoTTrKozi7YRhR5fGKE2i70ADgk3+DDGbNGoBItECzppD/XcJrHXlUO45k4mwbjYiu
         GlJuLpFVf+5mkwDzMDW5ZCWxSEODZhcSARFcXkEOi1CgovJE6VtVT7UkQAv/1D75W9zo
         7buw==
X-Gm-Message-State: AOJu0YwOZjmJVShQaRzCsW2Tfcp/3wkYaMaWcM30mRVLx7aOjQVTpnF9
	lwi7hvT0xm5jcB76HkW31THwepKX6SyBXMEQcAg87i1Q0yBmMJ2Q9Mw0
X-Gm-Gg: AZuq6aLkxDdmSVIVKkjNImT23pmYH+3wM7sPCGJQA4YQ/QiHbg6nCKXNRO018e+nYP0
	b0xi8V25NZXjiCVBt6+cT/Oh7TTP3LgcFJbiRPTq9HvP7FILMqiNUlh9BSJIIFSJkchXyo/DmFz
	DwUt7B9CAJtdW5yFJ24MBuu3BrkbmHKq/8ONkXUe4bqEGyhuscwNNyzzTQQFi7SCGH9iaWDNtg8
	hCWlGx4gZUDWWzsMb7PJyCSjz7e7Pd16em7/MF/20jsXWjAbAcnUfcP/g9sl5Qva89oa0FBvLs8
	JHgQNfFvf/+iAaReTjCN76LCfiRg/12C4B4RZ+gI9ApmvOt+5zUTBs7jaeTZNeHbWXLF8C7dTr/
	XJfjSujlsiBVtZ9FLJRZjwEBcB+9C29aou4Q0FoccYk5MCA1RClz3i9bAG8NidwgKMssuZJJjD3
	ZtPGEVSOIlt71vGQ==
X-Received: by 2002:a05:6a20:9143:b0:34f:36b6:1612 with SMTP id adf61e73a8af0-393acb726f7mr4847450637.0.1770495411815;
        Sat, 07 Feb 2026 12:16:51 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:bb2d:e035:1f86:719f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5249a0sm5002241a12.11.2026.02.07.12.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 12:16:51 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: dwlsalmeida@gmail.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+814c351d094f41a1b86@syzkaller.appspotmail.com,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH] media: vidtv: fix general protection fault in vidtv_psi_ts_psi_write_into
Date: Sun,  8 Feb 2026 01:46:01 +0530
Message-Id: <20260207201601.50478-1-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52337-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,syzkaller.appspotmail.com,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[officialsohamkute@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,814c351d094f41a1b86];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 400001070A0
X-Rspamd-Action: no action

Add defensive validation for psi_write_args pointers to avoid
null pointer dereference reported by syzbot.

Reported-by: syzbot+814c351d094f41a1b86@syzkaller.appspotmail.com

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_psi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_psi.c b/drivers/media/test-drivers/vidtv/vidtv_psi.c
index 2a51c898c..bac0ea03b 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_psi.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_psi.c
@@ -156,7 +156,13 @@ static void vidtv_psi_set_sec_len(struct vidtv_psi_table_header *h, u16 new_len)
  * add stuffing (i.e. padding bytes) after the CRC
  */
 static u32 vidtv_psi_ts_psi_write_into(struct psi_write_args *args)
-{
+{	
+	if (!args || !args->dest_buf || !args->from ||
+	    !args->continuity_counter) {
+		pr_warn_once("%s: invalid write arguments\n", __func__);
+		return 0;
+	}
+
 	struct vidtv_mpeg_ts ts_header = {
 		.sync_byte = TS_SYNC_BYTE,
 		.bitfield = cpu_to_be16((args->new_psi_section << 14) | args->pid),
-- 
2.34.1


