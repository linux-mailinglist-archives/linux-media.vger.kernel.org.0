Return-Path: <linux-media+bounces-49391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A73C5CD836E
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 06:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08671301B824
	for <lists+linux-media@lfdr.de>; Tue, 23 Dec 2025 05:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8113E25EF87;
	Tue, 23 Dec 2025 05:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b="czBtDdGS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909C43C465
	for <linux-media@vger.kernel.org>; Tue, 23 Dec 2025 05:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766468914; cv=none; b=YL556FVO3vbig6mmtA/rTY0n2iJ/5+yK47LofCQFlkjSBd6CvrOjJIEObUbP+Fm3TxycSrSAYYWO4KwNUDGjemz+Mdi/ksigdYWcxwAPCAN9Dxcy2HVJCu4aAt6lR53TxtPtlQ48ytfVxPvkY2H3W5Z0PsZchtpObfLH/MQ/4SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766468914; c=relaxed/simple;
	bh=RPpkS1QuyFFtxTsDVMkWej7l2G7Y6oeqyI5L1QR3FHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gcfPHv5KX/Eooti98+6o1wZqvHM8tPXNhzHwKu+bIvd5oJs0hq2XErrsKuEJh2i4kjaXvvTkZz/WczvFzKcaJ2PrL1xpEQqVkgpwyCgNcE7OJcQOHmCNipXig5rzEEqHH3THpQTigY7Zwadi3Cx7NvrfNvqr83p2hLeTmMk/C40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b=czBtDdGS; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso6534252b3a.1
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 21:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20230601.gappssmtp.com; s=20230601; t=1766468910; x=1767073710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jlHTkGTlLd5I0Fc+k21AUFih0xaPy2p6vqpjRhpFjs=;
        b=czBtDdGS5hnEvNVsOoXU+17XTIRcWVn0ro0tVUqEos0m/F3z2/1497uWgiOURw5nUQ
         mLZABxLHgTtmFO7g6f0MrEvl1scvfcpeWuGQ6yFl4mwXm9asafcSUAYu0fFHuRLo6ZT3
         sea4EGBqRKdoHWRdF5yrz9UlN3L9nuREt/XzjlSCNGZEo7LbNbMPEg/mT9X7ZH3Jrnx/
         yzkfp80HJ9IC9j2gcBgCIHV7GpYxFwPTH8xvzoquAXsasoOjUC8mrP+PnTRZ5KU4K9xc
         QgHUoR55yyXnKlE9wCF2BVUDGXsmBRwUyjDjOSQLIrWozmgO5d+x2ojrjyG5CF+B0Cys
         WRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766468910; x=1767073710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jlHTkGTlLd5I0Fc+k21AUFih0xaPy2p6vqpjRhpFjs=;
        b=egX1wfG06l244/pkvy0fPmSt3eQsHLMQGz26QwR9CkSjiqpzForViZ+iGM5+x7m3OT
         z6AQPCHn7TrNhieOMqmSe/S+SRENArrock//qMTsaSjx32tluhrurLhMf10RsZWGcU1U
         IaioCD0wjO3liaZ4Gpx+Cu4sgauX2SLKWhbYkq26Vb54lNFyFsLlGJalJ7KonGFvQcsG
         rVEE5fILhpuAqSp9nkJQVU3ZBQTld5qzcxlepkTsCFZJERb8HA1iWzho1mSnT7AJCLgL
         c1dqAQ3baNAfT/mHXEq1Dx0uXqdx8HyiwC+CoAYoGW7nclxU79qW+Tn71CGt1amjZh0s
         EB0g==
X-Forwarded-Encrypted: i=1; AJvYcCVWHuMnoghAo+gzo5JOrGuTs63YAp7RxSGDAg+4hXOW3HFcYoH7V2WvuFEZ0j7dWidh3D9scK6GVeWbVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW+5IEyCy76v1iDxwNe60ILOvAuGF9cd1e8FO7z2Tf3wF01w68
	o5TlAfEd353ORHCtkUvke8P1wCGfCRrWwIe6rCH/nPHmWKvQDYk5twL24Cbfj+AndtU=
X-Gm-Gg: AY/fxX5wFsWP03zAqcUhdNbYOjx1ukWeZLjzZJXTgUNj7e1mzlxrclE/KgUBp9DhfKB
	kEQaBGxljpkSM8p+PYGvUpVAq7p2ctLJ0Yx7eJSyQOw8BZCTK3XpOnJ2wTysHXjM3xsYElqIGiC
	EpHj27c/bs2Du5a0AkENpnp1ltT1jirqd71OIslrSvg/x0Tuvwy3pJVBYGWnTayNF7KBeR8/MVb
	MqpCAoNoKNowu2902He6NeDlV1rY5zHW4Gsz0HfxAFuMa8D9aRBwNPgxLjMmutyw4h4xtZMWQ1P
	wvGwzHEJPwW9D8i2Wo5Ly8rGgz6YIaRTBjk6XQM8SE9QCprfjEnaMA0z+Vxycp1t/sialIP4gQt
	UVUPXLcjhW71+UqLihi1y5ukNkaddPawlWsLtkmIdDL+pD1iD5yMMF7c9nKMSavRv+P4XjDBbqE
	WQ5fWPddATVNMdhr7sseLHbuPe
X-Google-Smtp-Source: AGHT+IEmBnCEvZ4KcsGUP2OBZ3PJxb3lPfUs8yKwN7nmXuTr/Mr71NH3RlybylhUYq9H/FqrLtaMBQ==
X-Received: by 2002:a05:6a00:808c:b0:7e8:450c:61a1 with SMTP id d2e1a72fcca58-7ff66a6d896mr12891880b3a.56.1766468909846;
        Mon, 22 Dec 2025 21:48:29 -0800 (PST)
Received: from localhost.localdomain ([103.158.43.19])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac28fsm12287026b3a.32.2025.12.22.21.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 21:48:29 -0800 (PST)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: mchehab@kernel.org
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c/tw9903: Fix potential memory leak in tw9903_probe()
Date: Tue, 23 Dec 2025 11:18:13 +0530
Message-ID: <20251223054816.68912-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In one of the error paths in tw9903_probe(), the memory allocated in
v4l2_ctrl_handler_init() and v4l2_ctrl_new_std() is not freed. Fix that
by calling v4l2_ctrl_handler_free() on the handler in that error path.

Cc: stable@vger.kernel.org
Fixes: 0890ec19c65d ("[media] tw9903: add new tw9903 video decoder")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Issue found using static analysis.

 drivers/media/i2c/tw9903.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/tw9903.c b/drivers/media/i2c/tw9903.c
index b996a05e56f2..c3eafd5d5dc8 100644
--- a/drivers/media/i2c/tw9903.c
+++ b/drivers/media/i2c/tw9903.c
@@ -228,6 +228,7 @@ static int tw9903_probe(struct i2c_client *client)
 
 	if (write_regs(sd, initial_registers) < 0) {
 		v4l2_err(client, "error initializing TW9903\n");
+		v4l2_ctrl_handler_free(hdl);
 		return -EINVAL;
 	}
 
-- 
2.43.0


