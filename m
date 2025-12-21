Return-Path: <linux-media+bounces-49265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1340CD4236
	for <lists+linux-media@lfdr.de>; Sun, 21 Dec 2025 16:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CCA530088AD
	for <lists+linux-media@lfdr.de>; Sun, 21 Dec 2025 15:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71592F83A1;
	Sun, 21 Dec 2025 15:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPNoYfK9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854452882A9
	for <linux-media@vger.kernel.org>; Sun, 21 Dec 2025 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331185; cv=none; b=pf1Nfr+d0cUWZy/uvP5MhGOoCGL2abHEQOrWH7Bfcuw30bNP2Qv4YBzfWu3e5TpAiV3zcKIXdIab4ntHOHmMLak2N4/AIwn7duQnNEoQsqx2SovcA2JRE662r3L3pZIBcO7OtuQnQ7+9lROsWyO/bZKWXLBxzeUFiN3p2Ar+/Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331185; c=relaxed/simple;
	bh=HkuCW3j18DOkfj4FZVyszFaUT1VrRz7LBECaVdh7QFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ch9jKfuWQCfKC7UEx+UVzg/LRFVGbIWqnXUYkcSIOSJ4rkNz5JI5Vbhz1PELLbG7CMW9cC2oJT3iNdB0IBHooOn9kkQaiETx8GRE/Q87X8nU3RhqgfQ3LLno01KS2Qv79vzs9JYh1x268Na9mKrOXEHMXUGcud8Klunua3jWW3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPNoYfK9; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64d2c50f0d6so1048338a12.3
        for <linux-media@vger.kernel.org>; Sun, 21 Dec 2025 07:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766331182; x=1766935982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tfKTmo4nJELW1fqaLs3q/xm7GxRxsQ6W6reyaDZwX/4=;
        b=VPNoYfK9ltyxseVTHKUk7dgQZOugv1Q3pooBIW2nvCT03Uxcy5MjimPUMCJlxnE6Rs
         9lPxuCZ5sj4VX4/sOKKPXUXAF2vdm6WWxGvS7bSRSAxiqFh7ORn94e5Zps1BthDjGeJk
         u5Yx1eEk8l20s5f68OVwZ9pNUnL3AA8K25MVp3tmPFI7BV5+1lDJ8iLNPL8GFyw810Nx
         PZriypzTz5zjqrPqcxSEs+W7970bVClU+5gh1LhXXW47OP0Ye6AdTz/nwWhXDbEAQSG4
         Rctu5YQJrvqtxCREPyQr6ytuONbMhs6aGYKJztxwPBpCX21jGVw1fzySDAZGU6z4HF0L
         w6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766331182; x=1766935982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfKTmo4nJELW1fqaLs3q/xm7GxRxsQ6W6reyaDZwX/4=;
        b=P7Hb0r2Se8f5z0UoG5H7x9hj5K+3/7buhT/TMQP8qH1D3iWZCP88AkiRwREEIKBfVr
         EnkHTj+AMSEnyJmDriBrjpElP07+OKLFtwn1Q0fb0IfBZabF5GnJ7DIDHTJuUQgIKugL
         doycEf92U0IC6CDr1LrdhQqHrLqWPqudP98n8rl2jl7AQrxaPjOH/rECwHSrA3Q5mzVI
         cr0qpZdNLMsSaGxJvl4nzqeRIg4J0VEpXWqPGhVynE3TVzTYoyCYFI1Ta9+/WhJxbLrF
         Zlap3cM9V+vn897WgNcKQJzpquSdr0Xb5gM5G5xMGdXKrc8Y2lZxjg3EEnm/tncoNMVF
         RMHA==
X-Gm-Message-State: AOJu0Yz3eZfQKF8DTEHChdFLXpTeQN2S1gblc83mHv4pLZNTg0mJFiEt
	Mw4NkZuvxk2fOoFwRIkewEh8B575ek3eUWFNwrBeIjSsythQH9r9eu5U
X-Gm-Gg: AY/fxX4Sdgjs0kmTuSYaq2ofI/0moPFjGzRCozrnc6Jg+Nt+pMUMwC8mci9w6rDdqHu
	CqBsK/y6JxGZJPYOA6EDvwRfL/NeE2b2JxuNAaOWAYE3aSsIgq2++p3hGavAoWF7ddtbGMpaUyl
	onCpdMY0R7PbRoJLU9TfaYzvxGUm7PDRWLPJZ7rAG+rkjGf8fdwzaJKFaob1HPNr1QKerMStq4W
	t1NmJE7sWjA+acKExP1DzXBZyOhy+8u6xrTbcmvmx55Op2Sv2Xa6/Pw1my8YgrEgPtfdQH0fo6B
	KmkMOEWvPv8yj5ngJ9jpAqExDJreOmEJr1O6vTLu5bW05Q72upClw52QqeKNkwBBkT5+IEIaeOg
	gT51wcojH4zXkv9WlBaaJcJkNCXYMlTLumIownemp/r7ennsybALf3vqQ+9CZelPTxYLGQM0Edh
	w=
X-Google-Smtp-Source: AGHT+IHCJZ9Sq/rnbPBZLh9tgt8wtX1m3fVtbRYW12r7euLP7G7Br1Ulnd8nM/hRB9h1cJ2bDI4bvQ==
X-Received: by 2002:a05:6402:40cb:b0:64b:bb79:96bb with SMTP id 4fb4d7f45d1cf-64bbb799a91mr5639423a12.24.1766331181695;
        Sun, 21 Dec 2025 07:33:01 -0800 (PST)
Received: from prometheus ([85.11.110.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916adc61sm7629741a12.31.2025.12.21.07.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 07:33:01 -0800 (PST)
From: Szymon Wilczek <swilczek.lx@gmail.com>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	Szymon Wilczek <swilczek.lx@gmail.com>,
	syzbot+4317d7108e14e5d56308@syzkaller.appspotmail.com
Subject: [PATCH] dma-buf: fix WARNING in dma_buf_vmap
Date: Sun, 21 Dec 2025 16:32:50 +0100
Message-ID: <20251221153250.17591-1-swilczek.lx@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a driver's vmap callback returns an error (e.g. -ENOMEM), dma_buf_vmap()
triggers a WARN_ON_ONCE(). This is incorrect as vmap operations can legitimately
fail due to resource exhaustion or other transient conditions, as documented.

Fix this by removing the WARN_ON_ONCE(). The error code is already correctly
propagated to the caller.

Reported-by: syzbot+4317d7108e14e5d56308@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4317d7108e14e5d56308
Signed-off-by: Szymon Wilczek <swilczek.lx@gmail.com>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index edaa9e4ee4ae..14b55f67ee1c 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1525,7 +1525,7 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
 	BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
 
 	ret = dmabuf->ops->vmap(dmabuf, &ptr);
-	if (WARN_ON_ONCE(ret))
+	if (ret)
 		return ret;
 
 	dmabuf->vmap_ptr = ptr;
-- 
2.52.0


