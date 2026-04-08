Return-Path: <linux-media+bounces-58226-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKj5C+JJ1mkFDQgAu9opvQ
	(envelope-from <linux-media+bounces-58226-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 14:28:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B503BC09E
	for <lists+linux-media@lfdr.de>; Wed, 08 Apr 2026 14:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E82183031A78
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2026 12:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404493BE16E;
	Wed,  8 Apr 2026 12:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovbV6H6K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BFE40DFCD
	for <linux-media@vger.kernel.org>; Wed,  8 Apr 2026 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775651081; cv=none; b=T8U2N+JVKbNGUcuXKXPOJeg3Phw4IHYKle26tqtUweBNgjcTGcgCJZofQ8dOLp6auEc0QdMS7HJhEEf0/kbzSpJnJbcFgl5rPHCS2Ukn8VMCPrVj0PLZ4eVJHkXpUY00cdr6yeKFr9dq1kcY8m6LF6Yd4CJ+hXnJmKIpH1f9iBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775651081; c=relaxed/simple;
	bh=QTac96zLeeoxI/mPrtCRLuL+5l/PooS9WfQRPzx3Jsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C9U2ioXeE3JHl1RvYqt4KjM+LIzeHvDrNOHyOyRYFZ/x/ScmRYldBrOw+UhQuG27gB116sScAMDjPA8p/18fl3iiNLm3ExWZDGOS2lLGSETINKi8P2AzANvBWP6xuYVikk+SMAGyccF4YOO62nRqjueFd7OjnQl5hnkf1HdL0qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovbV6H6K; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b9d3ebed5so4974304f8f.1
        for <linux-media@vger.kernel.org>; Wed, 08 Apr 2026 05:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775651079; x=1776255879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hcT0qoIH7xmelj+rFhrvLZcEz9q7W2TTx0LM03Unuj8=;
        b=ovbV6H6KL1/gwnu64NMLTgB7dSodK+omUVjPlC3d1U4WkeTw6MoIWx0hlyJL0/My0C
         w9DxoXs69ZMoRN0QWWFRwvmkURzfV5bPuXvyb7YdW7lYSfeOYsNLiShNFFDYnpYz6pYw
         RqSq642EoZuxbSH5VEn2e+AGPFxyLJQPwHeIvrGWoxq/Mr3f3tuC3KJ2Z+TRNrih8fXY
         br7k4kJNY9usqiG9P59Pul/zbw/Jl4AqAKtEHDHAZ8FOgGCxF9Iz349pC9eJEX64PY4e
         3KPWMBK7yIZR+Menj5saoWP+opD+2ws+NfMl7OJ0481OJ9quBdTV/MHS+idAaRTjcoy4
         94eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775651079; x=1776255879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcT0qoIH7xmelj+rFhrvLZcEz9q7W2TTx0LM03Unuj8=;
        b=qsMIgmTMDIvjZd60Z2QSVRnMad7mq1NP1Gg/wlb1TUDH5KBHvyNlePvnFv9sEhApLB
         GjPLtH5BVcRf4yXxAukK84FJohP1iC8/KZPSg3eS7evq0JYTiBC8Li53Ze1i8P3Yth39
         fttP7Uv927AVEXtTIQnwr+arBa4tDJek9Jr05qGmUALv7gsLKlHEZrQjdCwr8FdzdFmG
         j1br+tbWBpGmgJcLBVTztf7thtn8VoF50WE5Ctf8Rnq0szzBL8Zy1mlrX8EhuT5LCgG1
         FNAI8pmxhFLB5s2pM10rSH5SPttftv4J373kFYkKEorRvqi+okN8/SMcTbw0bxeaxtmv
         4Fhg==
X-Forwarded-Encrypted: i=1; AJvYcCW02QfyoA7QhxsN8xSyYXRK7jQR3mZLhSbkpwhWxjnbwOgTsc9Vk5S2LkdJw47dLgY8+6uGdNsWZpQzPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVVeFts0t5XiOH7NRACjEQlH9ej3iJxAFdijdOqNW54SbM4Qln
	zUM7raFDt42fbWr9UsuVJIRzeHah3G8SeK5psi/sNV6xwf/91KiJrv5u
X-Gm-Gg: AeBDievMtaKotyH9adPL0bosyCuUQtOsxzV/ErX+chOnRVJW7dFPh9r/F3m1gik0vSZ
	I6cuqynC3HMa4fhDE3DzJgUIxONl7ZPNxUN7yeH9dKRSOdfCVTIMXSRximPCmDbwdLEzXqUv8zR
	gsdlB+DdMwhIelYAzwYRoXS2D0GJno1NCNw1E9d4gPjgdtAOePVtdPQ22mv4nO3J8Ed3TIva4QG
	aad9hW7Smd+0UtdlC4yM4Coywh7dOID20a9U662OOjmSFCOpRAbq4QIg2Tc6dg/fAgRLaTsXyar
	130tG+oEIN3yrNpuCSKuH/jHC1AWMhu2WGQQpy5DsDcpelM8GVcJp9jPrIrlhAcq8tndt5S9398
	glp1BocX8YQdzOCl5An8El0AOWmZO5fbdiPSvSxYJW3RiTWLuS4bF/7hiy/XipOAb+OJzGHN5oE
	pU0qaEsc2/I3xHXS3c5vmiRZjIu8mCFZNMCpI=
X-Received: by 2002:a05:6000:1446:b0:439:dfae:8083 with SMTP id ffacd0b85a97d-43d292dbc56mr31451445f8f.38.1775651078507;
        Wed, 08 Apr 2026 05:24:38 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1423:3300:ad43:2520:7f6:56d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e5890sm57197590f8f.31.2026.04.08.05.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 05:24:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: janusz.krzysztofik@intel.com,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	gaoxiang17@xiaomi.com
Cc: sumit.semwal@linaro.org
Subject: [PATCH] dma-buf: fix order of trace and fput
Date: Wed,  8 Apr 2026 14:24:37 +0200
Message-ID: <20260408122437.1364-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-58226-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: E3B503BC09E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dropping the last reference to the DMA-buf and then accessing the name
for tracing can't work correctly.

Only compile tested!

Signed-off-by: Christian König <christian.koenig@amd.com>
Fixed: 281a22631423 ("dma-buf: add some tracepoints to debug.")
---
 drivers/dma-buf/dma-buf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 11711874a325..3a9d5113b98c 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -845,9 +845,8 @@ void dma_buf_put(struct dma_buf *dmabuf)
 	if (WARN_ON(!dmabuf || !dmabuf->file))
 		return;
 
-	fput(dmabuf->file);
-
 	DMA_BUF_TRACE(trace_dma_buf_put, dmabuf);
+	fput(dmabuf->file);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
-- 
2.43.0


