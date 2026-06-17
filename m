Return-Path: <linux-media+bounces-65076-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d38tB4EEMmoktwUAu9opvQ
	(envelope-from <linux-media+bounces-65076-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 04:20:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3633369617F
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 04:20:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="mQ1/YRmN";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65076-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65076-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A4CCA301AB5D
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 02:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA14311954;
	Wed, 17 Jun 2026 02:19:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC4230FF36
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 02:19:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662777; cv=none; b=q8hKkbLmpaDKTQED99KpddX9BwrUpS4ed4PtEr9R6tLxdelbBKVvRZ6tnkcQRvpQ2IDLuHa9I8cVvpFwHPC0BB8k0JEl1VECT6tG/Hlw0G8cW//zTKT8J9SPiWcwFfDkz8YmeJx6jqARdDpDVbsSJPPWOvSx44GeYpv33Xhekt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662777; c=relaxed/simple;
	bh=ct6Fgwve38x10N7LCLc2sJ09iyZssHjLWplvN3j1Cfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPpfDNPbGRloYUDnl2PtL1uD0qY676e7jFjOU4z6kO6LUD0061z8tjJPO7kPQYhqG0XhLNYu9p7OJRRd+gYBnYUM2TJMdqAvcG+ItP2ss6v5uRg9nU0AyqgwNtyK3EJL6ygPSrCqQF/aL/mehxWCKZJ0xrpISEzGo1aBgpUMPd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQ1/YRmN; arc=none smtp.client-ip=209.85.222.180
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-91591f19c30so709779385a.1
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 19:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662775; x=1782267575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3LnPj4hsy7t9yGnUJKMptAoaBCn6LSom4+XC5E/nvU=;
        b=mQ1/YRmNOn0y8llK/LvmC3PZ0vypXewOuB6cAKiKHXtHO2AiyhCydsxUlIYSYtof3W
         SxItvnIuLTToykSozC8jSs6iAT1e8VmYrEmBMa/pICDe3mju5qN9UG3QNAy2oIurFKz3
         CyM4EA9rkWc0CQFtDBz5ZpcyGIB6+G8TZJRRFnMFopN9TggIj1HxAg1m0FJARHliS8Gc
         L/lBqT4suxODBKN7Q4OJ/Phx+IT+0hOAPeI2QFFxbHEota8qZYEjLqSW0oXrJrF3jmHq
         9TB4lxImqi2RNwzGDjVzPu7+G5aw0kip0Ef4SEzQNt8rJx7XlVK+hMN+FYpc3SJEeh8S
         HeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662775; x=1782267575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U3LnPj4hsy7t9yGnUJKMptAoaBCn6LSom4+XC5E/nvU=;
        b=Vz7IoGg+t142rwHH/wFNOlZv/VSV/snm5r+w4hZTrH4N8m1wZedILqV4Azng1f60+S
         hWl3q2MNIAfLlpkB3fXIuwE+WXESE/QHilosG6HNSkvFii8fNfy49tZQf97wzc6ALA0C
         MG4Bf3iOKzQfV2dKWyYB00hH8mytBTJT2hszYC/ytecrf7es/tHTm0TR68BBW3FBjJvF
         Q8MSI10augH/o8+SGttuBP2TMWvq1d0zFThbYSMVSDOCJoD1wjIDCrUt93FofbxCvxdd
         Hcs7jURihkMIZhRzxcbA5le5qlSzqAtaXotqn7jK0LbellwDJ8UKnDCwOLs4z7pNogR5
         jlVw==
X-Forwarded-Encrypted: i=1; AFNElJ8buaHXJWFX2hVVvE/fQPkaIZCkbQw1CjGmeJK9oaj2H+e5iIv8F7vMjogJBK0+zmR6MtlADZLendNrWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ3ee800VHR13LjIcdskcQ21hQrKAg1KCWuYhAn+Ml80wAHMzz
	g5qKvwOfwN/bINB8GFbdUzu9xjOYqZDPHND5JYZdIINXWQSWXjYXzomg
X-Gm-Gg: Acq92OFk8eL51tX9eqKu8BD+QyHcvWv0cDzc+qTfmEiOh5ojz1L7mIC9yfz8O4Yh81u
	/+vScwW8HISzRkjiZaoaD9OiDJZmO+L22TdXJo4/qqaL6qmNnyUfHmK7fhZAjtCqyfwpZSIWINj
	2vs8BLvrrhNhPPuejQsHb3pukAuf6+RKIWGQBziQy0dSUEX8FAM8m+khtMuapq8UWKqbWiPWDLe
	GIT0tkLc0mqV/K+AL1amR9lAyIJ0yFGWL+V72DDVDEMRtJA4fR8v9TnNfg0STj1p+xl5adU2Kxa
	2Q/3WMwlgfYliDWD7pq6zj8KC1vLMhXE3R2Qq52g5RN+Bq43vpm4UrvBzaN7QjfzQimcZUcdRdg
	k8JJiIQLw+wNVnTtD4XE1hvmqhvkah9/LjCPha1y+I7DphVV6UpYI9/XT483QuQ4qBQ0cYMnov3
	bQUA5k23d7cE/9Z36h4IY0aNFUD+W+H6kG2obNyJf04m4lZzCTEaa4Xmfj/Yb+FXTl3bM4jGnxk
	0IpDWmQV3Y/tbTArCTj4M6Hj52c4YU1
X-Received: by 2002:a05:620a:7084:b0:915:eec4:1ec5 with SMTP id af79cd13be357-91d8e49c839mr409744485a.51.1781662774717;
        Tue, 16 Jun 2026 19:19:34 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:34 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/9] media: verisilicon: hantro: bound G2 HEVC tile loop to the buffer capacity
Date: Tue, 16 Jun 2026 22:19:02 -0400
Message-ID: <20260617021906.2746743-6-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65076-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3633369617F

prepare_tile_info_buffer() writes one entry per tile into the tile_sizes
DMA buffer, sized for a grid equal to the PPS uAPI array capacity. Use the
bounded v4l2_hevc_pps_num_tile_columns() / v4l2_hevc_pps_num_tile_rows()
helpers so the loops stay inside the buffer.

Fixes: cb5dd5a0fa51 ("media: hantro: Introduce G2/HEVC decoder")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
index e8c2e83379def..e7a7c7a42467a 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2020 Safran Passenger Innovations LLC
  */
 
+#include <media/v4l2-hevc.h>
+
 #include "hantro_hw.h"
 #include "hantro_g2_regs.h"
 
@@ -15,8 +17,8 @@ static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
 	const struct v4l2_ctrl_hevc_pps *pps = ctrls->pps;
 	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
 	u16 *p = (u16 *)((u8 *)ctx->hevc_dec.tile_sizes.cpu);
-	unsigned int num_tile_rows = pps->num_tile_rows_minus1 + 1;
-	unsigned int num_tile_cols = pps->num_tile_columns_minus1 + 1;
+	unsigned int num_tile_rows = v4l2_hevc_pps_num_tile_rows(pps);
+	unsigned int num_tile_cols = v4l2_hevc_pps_num_tile_columns(pps);
 	unsigned int pic_width_in_ctbs, pic_height_in_ctbs;
 	unsigned int max_log2_ctb_size, ctb_size;
 	bool tiles_enabled, uniform_spacing;
-- 
2.53.0


