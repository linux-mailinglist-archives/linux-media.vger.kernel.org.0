Return-Path: <linux-media+bounces-56948-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIskHOtsw2lMqwQAu9opvQ
	(envelope-from <linux-media+bounces-56948-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 06:04:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AABF331FCF8
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 06:04:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBD1C304E30F
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 05:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E925C823DD;
	Wed, 25 Mar 2026 05:03:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307CB29BD91;
	Wed, 25 Mar 2026 05:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774415014; cv=none; b=KMU7wY+KWNwx9OfFgm4kfFIQqgoKhYVVEG8KnrWVzf9cvOULZLPXS3rPem5UUONRk0+wJ4peuq/1RSa1GLlfs+TgJuxDlhwfb8/AGqy02qiqU8yio5usxRdWe/rw5p0nAOV2C2d5+Eo/sf0q91DLvPyXKOfwZEh+sAvXg1ZdygE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774415014; c=relaxed/simple;
	bh=Awu+sn8ul0vFggRB9IqehrKKvHi8CGfOSyMEhiGckuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fE2zJ8MXhU4MAEWxss9oYFe/gFcXT1I8pyY4JhuPYeSVKJB7NSxveBmnPFl/eWlot8idJlr02+xzN3KYCbZ7O064ebifLvH4OrHDuBxYWutqNxB4stP2YP6lvG+RPDHFDKtoIjlECgddK6BN5hzwgZd7OXjYf8Mj7a0CVFH36DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn; spf=pass smtp.mailfrom=kylinsec.com.cn; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: esmtpgz14t1774414917t8a91143b
X-QQ-Originating-IP: YA39IovNu+xF2BtdXDpqSOiGqc6qPqKRXAAI3HsTMkw=
Received: from arch ( [175.11.89.206])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Mar 2026 13:01:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12467882065645595347
From: Luo Qiu <luoqiu@kylinsec.com.cn>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: verisilicon: Remove unnecessary memset() after dma_alloc_coherent
Date: Wed, 25 Mar 2026 13:00:55 +0800
Message-ID: <856D681C2A51EC65+20260325050055.1187863-1-luoqiu@kylinsec.com.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MwQdfXoP8nuzUD75Qpq1YHHBvq0ikvwaaoFHa3+WcBM/gb194p6cmz5I
	zWx2ZbVS5l0NgPY5ZJQopthPGv4/TlkRNDhJHilxxfVNIp2MBn6OHM4HoeLYhsAOAMk7J90
	NBTzm1EGVdGjyJTcV/dzRPe0kvBAZjUuejn1YMFkbQlYbEy4vDBI5z+kTs5b1d7UQIpCVu9
	d1IhOY8rPu0GsX/gnaO/gIGBIcD6u3Iki/VKNHkXMgnv0sEXcAJWp0RB08WQrXqdIR0Lx9x
	iY6cYe0Q6/5RcHUlsSa9r+CfS+voNGm/wf7b69kV+dR/3sNcehRvYp30tEsGAgoSC/LYbmT
	uoWIGOR6/tfDayL80K51lKoAhwRO+1wJ7X3cHtsN8dOshqk0yE9cKNH8Z6fdy+rTrPu5y+p
	I5ZU+KUXrDm4XA/wXNzt+jXeY4+or6djUVGeB48ZkHp2yZgYp8igJAWBTlNxmNI3xRM0YRt
	3NMINPiRgcKQEyKUIChpLSx1p+aSuJA8cDqa8uHLzqI2PktCXcfefsVrDf35dY0GQYepBIE
	Xd4FqKxkLocnwyzyQyw1N44pYeaS7ujce7Ri8RMwnFk0CsphlSneK5d3ZV18SyGMULuOgcl
	C0bDdDYUYO/fK7J8/hMc0oFlbfn26QxXDiSS5czxm17PcOJcLBqHPiyoN1bBBx4rw3Izs3J
	fzjEwgBoWGxN5pR1G0VgYJicVzVpKVD9YveQIL189HGE1UZmTYp7KUCdG8J+/M4A718KGkZ
	MEKbnemmJGAbRStYmQOMxv6SjvfDSbBYsqwkQUthCdaR08bvyVJz9dWmpwYOEILGAcAzM5h
	k02O3NxOQnaPIxL+sZrxEbnNSC0a94nfwaG9A2vALDp/jAPhUFwUBGbkj+zcgvMn5INJ360
	iambzHF+vCXagjHe0rUrjwMp50QcqrOwDOMQm//2OnaUdEX2gzfo0yxM6Dh4ACCws7EUbjg
	XE+3my+DR4RECn2WZrBHg+BqToS7eC8XjGFaV6UC9tGfloeyLqv62hxHVZ0z24EwP2oQXF3
	RXUUNpRQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56948-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[kylinsec.com.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[luoqiu@kylinsec.com.cn,linux-media@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinsec.com.cn:email,kylinsec.com.cn:mid]
X-Rspamd-Queue-Id: AABF331FCF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dma_alloc_coherent() already returns zeroed memory, so the subsequent
memset(0) calls are redundant.

Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
---
 drivers/media/platform/verisilicon/hantro_vp9.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_vp9.c b/drivers/media/platform/verisilicon/hantro_vp9.c
index 566cd376c097..607d618e8f4a 100644
--- a/drivers/media/platform/verisilicon/hantro_vp9.c
+++ b/drivers/media/platform/verisilicon/hantro_vp9.c
@@ -187,7 +187,6 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
 		return -ENOMEM;
 
 	tile_edge->size = size;
-	memset(tile_edge->cpu, 0, size);
 
 	size = hantro_vp9_segment_map_size(max_width, max_height);
 	vp9_dec->segment_map_size = size;
@@ -198,7 +197,6 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
 		goto err_segment_map;
 
 	segment_map->size = size;
-	memset(segment_map->cpu, 0, size);
 
 	size = hantro_vp9_prob_tab_size();
 	vp9_dec->ctx_counters_offset = size;
@@ -211,7 +209,6 @@ int hantro_vp9_dec_init(struct hantro_ctx *ctx)
 		goto err_misc;
 
 	misc->size = size;
-	memset(misc->cpu, 0, size);
 
 	init_v4l2_vp9_count_tbl(ctx);
 
-- 
2.53.0


