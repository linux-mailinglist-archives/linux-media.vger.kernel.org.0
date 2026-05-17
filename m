Return-Path: <linux-media+bounces-61839-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sO7IH+9aCWrKWQQAu9opvQ
	(envelope-from <linux-media+bounces-61839-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 08:06:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C1F55F66C
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 08:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B2C3300E735
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 06:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C4E315D21;
	Sun, 17 May 2026 06:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIMImiAc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4495F36AF6
	for <linux-media@vger.kernel.org>; Sun, 17 May 2026 06:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778997978; cv=none; b=IjDIhEPeuElX7p5fNTDiOmVSWDHusqS6Yw47cuTBs4AwD4u4A9axruCGNMmDbCmq2Adz6c1Qqt1K7CZPGWuEJh8QLYNtjCQtK2yN8k045OJGAJvGlUcYwcXi4+ZEc7P2/cNWJk4KAvB0e5aFxt+zbnK6XMfejPG+7JLOXBfOw84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778997978; c=relaxed/simple;
	bh=WURkIoNSx7cpBfeNmDjEHI4iCOu0FPGWs5wvUfkxOAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iauJKT/6S03KB9QJ+UTgS2AQzFl+pPlDTYDaHq7xkmC6TxLjHH9DsATa6ciVaAKB5bfrX4yIX8uyBMM88Nsa5l/ZkOqGdymRoLB6GeJvlH1coE7jCDDC2tUU3E5+z5M8iq74ojHr/lqwv/h0/OZhkVL91/ZXZkrv0vzdFLA6L0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIMImiAc; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7dccb8644c4so725256a34.0
        for <linux-media@vger.kernel.org>; Sat, 16 May 2026 23:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778997976; x=1779602776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6gmKXteedUEtXr055uhX+38a7zvo9Ud/r154o82WzWM=;
        b=IIMImiAc9SmgDDNHeTbyU1ntqTW1QxtZbysBDtFPjgyXCONWy+HAuBXLxLGx+xYMfN
         xxJK5OXd8VUKi9UAF7gZeRPNYHM6C/HtlO+JKN3k7kLlPypcTj7GN9YkjUO6RdntjljA
         awtTF2aFqkTLj4NtbhZaTQLadDKT9lSufPPR74xKjGHT2Q6gOnAbVF67Ot2HgDdBADIr
         wjl5jjTvDkw6QnYiPYODpYgv74MpXftiznwk7bYLQqRCAEWDUM3C1QZt3/qAnzXVTjbK
         sfQJ/uyQ1GCXLoXHaMwCh51IaeG4vxmnRxkBPGFoXt84i0iJ3o5JKK6qf7h/mYUoCdux
         tanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778997976; x=1779602776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gmKXteedUEtXr055uhX+38a7zvo9Ud/r154o82WzWM=;
        b=jHuT6FrQ/J5c07UPQjtHRIPbR4KwGAILFiLYB07SHXQpn6jL8o45aVdJ2QYhqPdffa
         ZKJIRNQ+rJ7rgNdx1ONJDiG2bVjscPlarQVwkdpCKds54E4esWM9pYn/DutGDOfaBtTW
         OhZ34TNw2XPpwp5MqolwV2P7WT49cZDD1xxbTBedu4jjCQHb/eDrzFtS7YxzNIN8z1fm
         XUAWpp8LCegpkKXR2tMGMnaYPjKDn1x+v4c2MEXwBB8VcNesU0Q/FmgXPVvF5074/SZa
         GzRZGbTfmTAaUn0MmGct98UyIFzrCFK7K4kmW9IdbKOY24OqQfTWTB+TkePBc57PSKkn
         TEeQ==
X-Forwarded-Encrypted: i=1; AFNElJ9TMceHsCoBks6Sv4f8MDbQLnhT92o+gWeGsHTehhakKOSsexCGp3qszLlvOQyblro02biqCp9SYk11HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNSN5dpE5x9qZo4YrAnosjxsYkQmMcwQmMhGYx0nxYunI+0zDM
	NxmPB9VZyYH8NI5FIRSRV9FrnJrpz1r8NPI8A3Ixct3M4ihWT91Iqs66
X-Gm-Gg: Acq92OH2/w0YppFwA/MLBh+e/++luEnAVcnZ0DjQT9+lHmeIW191ouqiHI7obGazihU
	umPQ/6S3LRWDwZeJDIYgaY5sccyPJ/wYLiQ3dOcQq8cO23VwWkh0RXvE9D4C51/3UCVE55PlOhB
	1ukl8YgJRndsq+S6HOWSrtXj2leMIAuMmRzawKuq/Yz1DbgfiqLQ4+j99L0/lNku7bnFqsIOjVS
	j7/7gWDQYTYI6pxbGMr2oOh9OpNlhJZEjE4vnfaA/joWK9x3vI5tEprqWplUDEzwBmbYM27InZw
	vrTvt3YaD0v+lbIbTb+20ww+qwSwzVIGKhkSsvr5jbnpLLyo2H2rLe5vkyMsZVGBNis81Sf4BFw
	FFn+Xrkmxp2LBbos6fMlYXCWRUtDFSN2mbslBLLlb8e/psHCd/8VAfNGRlFdVVv8XA1zkb/4HAx
	kLP7Xmu9nEUENIK8JWzpsIloQ3Ty3rnqJi0DbVZy6mNe+N2B5J++ug
X-Received: by 2002:a05:6830:d01:b0:7d7:ed69:81b2 with SMTP id 46e09a7af769-7e4ea071959mr7144526a34.5.1778997976305;
        Sat, 16 May 2026 23:06:16 -0700 (PDT)
Received: from pop-os.. ([2806:264:548c:885a:a314:9972:40f1:1f4d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55b7cd6c0sm5550998a34.4.2026.05.16.23.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 23:06:15 -0700 (PDT)
From: =?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	gregkh@linuxfoundation.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	=?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
Subject: [PATCH] staging: media: tegra-video: prefer using the BIT macro
Date: Sun, 17 May 2026 00:05:11 -0600
Message-ID: <20260517060511.231437-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F2C1F55F66C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61839-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[diegomanceradev@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Replace open-coded bit shifts (1 << 28) with the standard kernel BIT
macro. This improves code uniformity, matches style guidelines, and
prevents accidental signed overflow issues.

Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index e513e6ccb..08fa234af 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -177,7 +177,7 @@ enum tegra_vi_out {
 #define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
 #define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
 #define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
-#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
+#define       CSI_PP_PAD_FRAME_PAD1S			BIT(28)
 #define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
 #define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
 #define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
-- 
2.43.0


