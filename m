Return-Path: <linux-media+bounces-22638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 430249E401F
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 17:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEC63B39493
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 16:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E2D20D4F6;
	Wed,  4 Dec 2024 16:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4n1WkQHH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9575A20C499
	for <linux-media@vger.kernel.org>; Wed,  4 Dec 2024 16:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733329625; cv=none; b=fIqPv3cGSRZ3L+ZoRZV91A1No9eQphpPGMumam3VRtD1X66nTS6TxhSd0cebh9NMIEHZ5taA+zEeJ7cxf34aHmDquvil/imVAx35lodQNFGRA6Fq7wvjxhaLpYHTqFhzYxT6RYkjQeRbfGm7LEKckoHpzxOBp8LfiKxL7rU7W6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733329625; c=relaxed/simple;
	bh=fJkw2rLMTtXSXhulM8gnhffaFfLiI1f0yAZSjHGcIX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIA5dd7/vIM5aAtIybCYwIcemSmY42BrwJ+Am1YJPI2n1YGjN2R9czbcg02m4yB30fGd/uPlO4V3cUnT46r8H69fQ7t9pgKrNdzYLer1gRi/um+J2QVweeqLcridPrZd4IBxGfe2gcIvmbCd0+Ai4M3QVxiuEnRRpmLITahr+yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4n1WkQHH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4349ea54db7so61765e9.0
        for <linux-media@vger.kernel.org>; Wed, 04 Dec 2024 08:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733329622; x=1733934422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndPjCiEchgmhN558RiQyP0Yt1FLq3iHOnb50r5toGHE=;
        b=4n1WkQHHwDnRHDoSIIEdJN67nUStmUBcHEIdSHqvKaDm5qIzzeOEW+FB99ksnz+Y4B
         sB55fX7bW42s94SZXDFZy+jX5zRFdq396No43GpqTPT2w9LMFeMMXS1UCT3UWWlRokUW
         jMHlxpY55+RCl98zk/WkZY8RF1bJgLFi5W3mn+pU8SCM2ugOa01Gj2yGiWsr9IV8C4CH
         gBaQzIYQwRUib4RlMxXX7lQkv/P+6LHHQBxt2UUzD6CNVSIchE01Sjg+HTuQH36mNaXK
         Jmke3uWfIOStAuD8Fk5cfMbH4RH/X8p4dVHTs9midILE1TrB2DpLsA9HPhOlsBmFt4ll
         ZlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733329622; x=1733934422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndPjCiEchgmhN558RiQyP0Yt1FLq3iHOnb50r5toGHE=;
        b=U3F5AnfAuZcTb0wVxP9h22D84ZuQcLlr0q/qqfFtHIkT5AS7i+GV0WEktQom8HRVTS
         VaRYNXXEtuUt0UpM2iTZKoGBXkSI0xI9hxeXOr9ghW+5AJCoa87Wz+yxSnDIiHiVU7a7
         zd2Ha2tcNt97ssDZs2U4l9zTVq8Lp1W/kMFwUjv+04vDh9YmCG78MPRmNSBl5LOReJKz
         x+fQtjoFXZboubwrtokDhqu/2J2igK6OC3pcRPw5+3UTpA3ZatNlWp2rPOb44II80SkB
         6SyOG50CpnlhnTAZnxHHHTwsb3VRA+ebO+CJceLNpr7sFRSkXiujsd53jOmH81D6ljlY
         r9Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUfzdODKCalA7X7juy2Vfdh5w7P/YBlsi8FoFau9HBqDLerLtL+I0wvjPmaZ2CCjnVFGhn0tIlzz/9iqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1La7Kpky/1Wn6HM91PeuKORZBAURVgZPXo4AMY1nmu4n1fEHA
	vudjJhRRWoM6a7Dqh+4LiJA/j2cFJ2KpDTtDwBDvyUC8CwCEP4GxHI3OFL9T9Q==
X-Gm-Gg: ASbGnctvNUI03WsmdHh2pynuVqZRRKpYRo4td3u1EY6n7jkRAgJacbed87osilCX6YA
	UjICSNxrM+hpX8Psr5Z9mMvbHDlumcrcDHHvC2sJOyebbvPQuSp1MDteGlh9mT9L56pSmBc4rfp
	e07OhAIBqKPoMLdK4jvqm0yOuzpprEMAaNabMEz9fbxdfKtIh81Xxnb5OHCmk7Da2jo1bsbEpu1
	84fSPiJza+E1dzEGSeOzh9x4YUJJFTu3IgDdw==
X-Google-Smtp-Source: AGHT+IHRNnKQuL0FzYJ9sRykYWh8jH2cm3zF2nEbZZRSS5rqUEb9oxCGR02zINfXQfHQRF/jLblOew==
X-Received: by 2002:a05:600c:3ac8:b0:42c:9e35:cde6 with SMTP id 5b1f17b1804b1-434d4a5d4a4mr1384465e9.2.1733329621419;
        Wed, 04 Dec 2024 08:27:01 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:4606:5fa1:8ade:6950])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dec66e0esm16298133f8f.43.2024.12.04.08.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:27:00 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Wed, 04 Dec 2024 17:26:20 +0100
Subject: [PATCH v2 2/3] udmabuf: also check for F_SEAL_FUTURE_WRITE
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-udmabuf-fixes-v2-2-23887289de1c@google.com>
References: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
In-Reply-To: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
To: Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <jstultz@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733329589; l=1031;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=fJkw2rLMTtXSXhulM8gnhffaFfLiI1f0yAZSjHGcIX0=;
 b=NhY0leWwseGXjAz22badChvpbfQCiGr6eextWw4sxPskRjjjSOJH/wPzPkPy4s/BHbCWwcM7p
 LC618vgQbjWCzsNvNI9+Z53VJP06p8zJnx97CEnj6l4JcYpay7agU4B
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

When F_SEAL_FUTURE_WRITE was introduced, it was overlooked that udmabuf
must reject memfds with this flag, just like ones with F_SEAL_WRITE.
Fix it by adding F_SEAL_FUTURE_WRITE to SEALS_DENIED.

Fixes: ab3948f58ff8 ("mm/memfd: add an F_SEAL_FUTURE_WRITE seal to memfd")
Cc: stable@vger.kernel.org
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/dma-buf/udmabuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index c1d8c2766d6d36fc5fe1b3d73057f6e01ec6678f..b330b99fcc7619a05bb7dc2aeeb9c82faf9a387b 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -297,7 +297,7 @@ static const struct dma_buf_ops udmabuf_ops = {
 };
 
 #define SEALS_WANTED (F_SEAL_SHRINK)
-#define SEALS_DENIED (F_SEAL_WRITE)
+#define SEALS_DENIED (F_SEAL_WRITE|F_SEAL_FUTURE_WRITE)
 
 static int check_memfd_seals(struct file *memfd)
 {

-- 
2.47.0.338.g60cca15819-goog


