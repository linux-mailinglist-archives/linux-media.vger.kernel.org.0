Return-Path: <linux-media+bounces-52706-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KN0JI63rjmkCGAEAu9opvQ
	(envelope-from <linux-media+bounces-52706-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 10:15:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B7C13457E
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 10:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A2A83042B7A
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 09:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F92974BE1;
	Fri, 13 Feb 2026 09:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JopeMpVb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFBE4A21
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770974105; cv=none; b=lG0XuNdSgvbT8f5noOJISkdEhEhZHl9NFKx9ENMsf1a8psZJEjOB8UKFZdMj9P+1KNkdBCB2J9Dd6F9UC4TCOD7oiwNm4XY/VgEQBjoEGG6TwGYBcnknSRPvg4wfT0VkZLJiUrDHoq8QncvAt2Y8FmKHHLjpNVs4vTX7Z/kuL3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770974105; c=relaxed/simple;
	bh=6veDJhQ+0eIaAZOJcIL/D3XTVNjNN5zMO0OVns1Zp9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lBUrbWyUNOY8Cxu75K37uBse5t1an1JJJW45vm/8lPrWSVz1huH3+1WL92AvMuZtgjm8Rq5RF7BFR8K3Q+2nyTr3l0TLVhpjKAioQ27qRUFdtY4on+RfG1Zon0uZx6uH4IXgRG92PgR7vRvWSZse+LfZZt8aQJqDFLrE1KAgj90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JopeMpVb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483103c7126so1313585e9.2
        for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 01:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770974102; x=1771578902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zCdD7lSk2JqQGo4mK3E+TOq0B3GIskXXL8ofh8f8Wjk=;
        b=JopeMpVbFyhvRCZ+GvvY+jVq/GkvIszhKagp8svDWVaR27vdfxFTqm1WwEVbjh2TRB
         /MoBygNutQlNi3RhzP4GlP56luqkwKSDL3GjHxpOgQhaWvkycB5XAAAgCf1J/w0f0fzA
         vQqmVLdh2535wDTVW8UqEG0PfiJ9iSr2Ivqou9JnsJG/l6YqV/GZc+6/DuO2MKZkD9nX
         4P/1oASQVaxt/eg29bHHDZFu30RC6V4WtCqiY3TarMgzdhuSn8WDZcAbvAOf65FBNqpq
         MYU8LAggOZ+hPn/Y8+2u39xw3fQk0J8S780EG93l4SSCE1bQRrEFAdmvf4zOSyvpTv/H
         aiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770974102; x=1771578902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCdD7lSk2JqQGo4mK3E+TOq0B3GIskXXL8ofh8f8Wjk=;
        b=qZGjIu0Ya/rIV/iu0eNo0Uj33t+578shLHx4C4UVz+Z+hXs/4aKMRv1L4BITwNR3rg
         pLyoYaoWNlPuvp+CzH4eVC48CpcUhWIuJohZO564M6EFVzuMUJB5D/R/QLkpuuOf4Rvr
         NKFodfrQbnWy/4JNGZQFsuAmC4VOrr8XbDACY/uGj9ze8Mr9fxhaBh4tBIhsxFcSq2J0
         oJZYdyPqabHsUKr5htcfZbMp2JZQKcgxZ4q0zJwIwmUTmWL3ouo+ULBBtuiBzLj8YH1K
         bI2bcvs4NX2EWs+TdhM2NVZNlac51PWbiO374fCcKwbQyUR0Pw9LlXq0eJqujoKzy0xN
         nC2w==
X-Forwarded-Encrypted: i=1; AJvYcCXEX3BIiWwRTrIc37ghOWV8FrKYCJOw8ggIJVzCmaqRTgYMONS5XqU4mZzUBZLbGZGJU0sbSgDIVK/tMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF6fUCfbpmj/08rxM5kIEShqQ+40pikBInJVm4nnbvqteJ4CGC
	IQqyLUrQ74bVbpsxwiXb0QfPbxcSmiz9XvTQYt4/U8wWAet3+B9VzJx5
X-Gm-Gg: AZuq6aLumYfStcgLqFXgs4KefLuYxrAFwx6XyY2M85tPyK4HH3xTUHo1fAv4EmRWa35
	gPA7l26pq901D1WWJpD8mwvGV4J4+HbuU2s4LCPgnfV49rC45GjnLpYFyvugpApEcsJeHdLc7Jk
	yyAm2y1+wYBNMUYq77+KsLjFbfXUkq6SmBI4rXPXJTRoikAw9uVylcH5DGTJ7Z67foGrm7sBNgL
	O++19t9hM3QY03nYoO/ivBIyamiTHKcQwOxXuHfBQPFVJ4DbWB92KGBcIKKUvJDERSEjP1xwLDQ
	u3rYQibssMui40OYvstRaFj0wwxk0cf3LXUvU28aTA4GqbhLwhJIvu0MESL5PHQZN+6B8lohJb7
	FLlr9Xp7swLxWckscUMItUs0CyViP1D13iHS2mZEElm0DkUcBGIL2Ikgv6TCZtSDZ6j5R9GQ8Ia
	TZYOmZWPAK0F4+FEfHBRclMqEKSlJjK6EwHs+XtRCF5pyhnsGQHp9bLzBN7zOsqqt/rDls9+iB/
	kCt8SNvwx8vtH7HCWQu
X-Received: by 2002:a05:600c:4746:b0:47d:3ffb:39ed with SMTP id 5b1f17b1804b1-483710546e4mr18587225e9.4.1770974101882;
        Fri, 13 Feb 2026 01:15:01 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-82-204.paris.inria.fr. [128.93.82.204])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm4035968f8f.0.2026.02.13.01.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 01:15:01 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: iris: Fix dma_free_attrs() size in iris_hfi_queues_init()
Date: Fri, 13 Feb 2026 10:13:27 +0100
Message-ID: <20260213091330.23431-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-52706-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,oss.qualcomm.com,linux.dev,kernel.org,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fourierthomas@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F0B7C13457E
X-Rspamd-Action: no action

The core->iface_q_table_vaddr buffer is alloc'd with size queue_size
but freed with sizeof(*q_tbl_hdr) which is different.

Change the dma_free_attrs() size.

Fixes: d7378f84e94e ("media: iris: introduce iris core state management with shared queues")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index b3ed06297953..bf6db23b53e2 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -263,7 +263,7 @@ int iris_hfi_queues_init(struct iris_core *core)
 					  GFP_KERNEL, DMA_ATTR_WRITE_COMBINE);
 	if (!core->sfr_vaddr) {
 		dev_err(core->dev, "sfr alloc and map failed\n");
-		dma_free_attrs(core->dev, sizeof(*q_tbl_hdr), core->iface_q_table_vaddr,
+		dma_free_attrs(core->dev, queue_size, core->iface_q_table_vaddr,
 			       core->iface_q_table_daddr, DMA_ATTR_WRITE_COMBINE);
 		return -ENOMEM;
 	}
-- 
2.43.0


