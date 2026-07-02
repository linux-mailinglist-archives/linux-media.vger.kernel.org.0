Return-Path: <linux-media+bounces-66400-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d5F+I8GdRmrpaAsAu9opvQ
	(envelope-from <linux-media+bounces-66400-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 19:20:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2934B6FB392
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 19:20:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OXwIj96P;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66400-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66400-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BFCF03072DA9
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 17:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 437D034EF0E;
	Thu,  2 Jul 2026 17:12:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFE7340408
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 17:12:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012368; cv=none; b=SrQ/p2nCozYku/2wh4nGON9P+X491AkkW8n6q8owVqNikC3FaNjXuPwRspivwct6eYBEg0xnfU9ELL0QPSBRGanSz+zdcEXLK/g7L+JLcSkf00t/bu7/gc9ucIiwt7rzYErnBxzw5sF4d5R/7nDeUq/Z/J5wNgUtd3JduG7hylc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012368; c=relaxed/simple;
	bh=hslD0RxxCSuvDFNHuDmSu+4NnDOItkzQFlnoRY7Hjzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SJKzgSaBPHJIPWmGnoEknqphuEhFs7NIuMcUMFFSn0tmXZUyeYqKRj378U3k26VYJNFaAZkCL6paUL9r7HY/W62jEG+6jhQ8EiC67rOpHdCVaqETSYXQ3xdO9I5LOHwfvFNW0bKL2ucy8B2nPtHNPl0ZI9CMOUvSmi/GmU58QNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXwIj96P; arc=none smtp.client-ip=209.85.215.177
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso838052a12.2
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 10:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783012365; x=1783617165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STd5MQvh0NQAJtVTzJOmHeJBNZHmtcn+Q1hAWhkb67w=;
        b=OXwIj96PQjZmNuRo1S9E2BKHTV/+sYue8Od52H4mMWYSPI40Ips0IvihwnfKT1RUHx
         pT8bOqPq14KG1KUY+YyKSQDMPAKKN2c57trpX7H4TcrhwqB6C2gTaCEQNuzhaHhSt3hZ
         R5w9Hgugm5fq3tmB9bigOrb0kb2uhUqeW3sSz192b+1fpRWJXzEpcjY+muLLDJCqwJJN
         kVK73CeLgOCB8rppKkvw/DR05IXUhkY2qKOz/flUq1CmXxwcFJb/tF8hR0ovqpE9fTmH
         J+MdKKyjZcHHXpIlWorafhi0afj8HG0sfa4Ug2NTaT+p0+D08e45JpeJh3MlKqMXdJkq
         qYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012365; x=1783617165;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STd5MQvh0NQAJtVTzJOmHeJBNZHmtcn+Q1hAWhkb67w=;
        b=nXublOPivyBYkwC9es/M0hNiyUPNS9y0iBbL4C3WAO2rfPvvf2dbIH0H/V9qzg14Ij
         zqo/QmP06exS3hiHW+r1RVJzvTvjmoKpwW51KjQvpft+5jtvUUksTHSjNifPYrWW+OGA
         ueFu988AigrQFVbWtRiDBMTyGNs0kkGb25MEFOZu8fw2cyrdVhzfZBMNBUjOVzbvita6
         S77lXmLirjUHJ5EaAFtlgRRVR5Pu+DoY8XECbV5KY4lmyMIFoTIKGRzjb6Pnv8kzCaia
         OsiLr8rxwwY1zKFXztaNU46y9HcWDKBvefu7dsw1K3tNLflPCcYR/32FE+8XnA/FxOxE
         vKRg==
X-Forwarded-Encrypted: i=1; AFNElJ8KwtbwiF4A9w+nGJAA4xVD48dDMWdtwHT+EJqPTcGR8k4pv1xFOOnh0t5Uxgsnlu8NCDp4lixFISgyIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySzenMXrRNc3a/8R+6mucbINZ4YKUSWM1cQfAMFjyX89BYTQps
	oFZlrtKsynm3bg36DJeWVmUuuj41ZGX4iNQMTpN1G1GkfS+xI8IwHuShTmEqJF4=
X-Gm-Gg: AfdE7cmge7yKEzqTCpcKRkhS0FHBcPbrwRrN21PLX1SMJdrSUkfp5v546KYV95uvWsz
	1eECjVPk6UkQ9ZHTDDc4NVCrDr2OzxP1gfunwVeY+muDBBs2mdMEYQ9DsWdxvePIhqLsbMsisqf
	9jrhhhdEem6ZJOoRv/+WVFMjhVInwWeNsEWAMzkoTZo1KsQyu7vD1eXVBoH0T5Q6asQVFYRP76F
	zzTQLmqUCJbDU8bfGfz9tWiYezHwG+RMAu7uig4hWuwBjK2/mkhaMJ2PVbCNLsrgfj+/V8opBGb
	S2cUObVsOmB1ryDnZGPwgJiIWKEvaImJAMftpRIgNkrx5hugqyGwU6FUAg/zQZY7lhy1x3Z9lJm
	GULrkHozAUnFflfdMXPkGD3n2Myt9t4Vs9sdt9HiFLMFYjqJe601HGtavlSICYCcLtZYX9ml2Jn
	+nd4K5E5FBtaQvM9F/yJOxIqJYvcGjBclGVjy3B4uYhTs4U28Idx7U7UlYHlEOsA2v
X-Received: by 2002:a05:6a21:d84:b0:3bf:7189:2d1f with SMTP id adf61e73a8af0-3bff422a1c2mr6819657637.31.1783012365278;
        Thu, 02 Jul 2026 10:12:45 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0ef50sm1644370a12.6.2026.07.02.10.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:12:44 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: docs: remove invalid struct member
Date: Thu,  2 Jul 2026 14:12:31 -0300
Message-ID: <20260702171234.31030-1-nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,lists.freedesktop.org,lists.linaro.org];
	TAGGED_FROM(0.00)[bounces-66400-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:nico.antinori.7@gmail.com,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-kernel-mentees@lists.linux.dev,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:nicoantinori7@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[nicoantinori7@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicoantinori7@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2934B6FB392

In the structs dma_fence_array and dma_fence_chain, the field 'lock'
has been removed, but its documentation comment remained. Remove the
stale descriptions to clear up the following kernel-doc warnings:

WARNING: ./include/linux/dma-fence-array.h:47 Excess struct member 'lock' description in 'dma_fence_array'
WARNING: ./include/linux/dma-fence-array.h:47 Excess struct member 'lock' description in 'dma_fence_array'
WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'
WARNING: ./include/linux/dma-fence-chain.h:48 Excess struct member 'lock' description in 'dma_fence_chain'

Fixes: 5943243914b9 ("dma-buf: use inline lock for the dma-fence-array")
Fixes: a408c0ca0c41 ("dma-buf: use inline lock for the dma-fence-chain")
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 include/linux/dma-fence-array.h | 1 -
 include/linux/dma-fence-chain.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 1b1d87579c38..0c49d7ccefb6 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -28,7 +28,6 @@ struct dma_fence_array_cb {
 /**
  * struct dma_fence_array - fence to represent an array of fences
  * @base: fence base class
- * @lock: spinlock for fence handling
  * @num_fences: number of fences in the array
  * @num_pending: fences in the array still pending
  * @fences: array of the fences
diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
index df3beadf1515..42289f505164 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -20,7 +20,6 @@
  * @prev: previous fence of the chain
  * @prev_seqno: original previous seqno before garbage collection
  * @fence: encapsulated fence
- * @lock: spinlock for fence handling
  */
 struct dma_fence_chain {
 	struct dma_fence base;
--
2.47.3


