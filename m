Return-Path: <linux-media+bounces-30756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25221A97A04
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 00:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 440A317ED81
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 22:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693792BEC2A;
	Tue, 22 Apr 2025 22:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PM/Eidah"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAE11FECD4;
	Tue, 22 Apr 2025 22:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745359597; cv=none; b=kty3rIbeYqSKUpVgbUgljbAj6eim3Lft2zOMeDPKFuRIBFdDbw/bLv/HYET5zc+oAXZxlaUgU8hH9SaCRYDLaehexQSH+Ggfnf6wxlb7L1GJWYD6AYmZF9YriaeDAGC0Jx4jVCYR6s5NVra7LDPBUQB3jbpngVcYbi5rF4kkhsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745359597; c=relaxed/simple;
	bh=tuZFH+YPbz0RM6eaajURU9+Pku8ZR4mHrVLcvtwZPFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cHWeeW0emSNN+bytNqmdg0n0oXSVW3R7CqpJn0eOYUbBO3UzkwKnFFZvsss4Jr/EW2ceqAiCqiwksGCXBicFJRzITs91frtHAzYK+jJ9T8MrbOiMxWUn3atxuVubdP68FhNEAnwVqQ2gAId6qrozaaN+IqMDwbm24CcoSQlWsC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PM/Eidah; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3819498f8f.2;
        Tue, 22 Apr 2025 15:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745359594; x=1745964394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YB1xGX6pFG9S33G4DkDnszbCcY9UyskbeFRbPxNa7a8=;
        b=PM/Eidahx44lS+gRr/0Eenv/3sUG4UN28FXEMdqM4iT14AgFHTJyBEqbqf1ixGiSgD
         3VarNT6XZcrJJQNWEVrSS9i1TLaEULHMvHcbTjyfh1CsTz3P1+VaRSZhij3XDgfdD/Gn
         ec1NDygz+1iM9k9v4zsy6aJSsxZXBOE+dVrqq3iWV4f9Kc6xujDVEvFjCCSQW3jztOel
         o2lw36hkoM+97eCW7uQa8jF9QPY2KJ9tCkNed40zTk49fE5fLS+idYbY+Zo5/9etECtv
         1hA+nsTne+0iJpdS8MJTcjFYJSQQIoEFO2E/+BgyFrGIHWa0SddPr0tzsFJ58Zle+JVg
         zZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359594; x=1745964394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YB1xGX6pFG9S33G4DkDnszbCcY9UyskbeFRbPxNa7a8=;
        b=r5BLPJ4RcxPIu220H3g2bYocyOWJJQ7FsSc9Mnzl3J8yLDPniOZo/p94ii2SwTna+Y
         U6uV/68Gf+gug8U9YQo7NjUUzVf+72ip+sVwXW4jbo4d5goenBehZEhnXKXSbUMJ1GeF
         ga3cQWrFP7di7szrlX/OclAS1wVsAoW5dcnx7mV9RCni0SumYLxF+8gCmx5Xvl27elbF
         DyQ8YxXfLA1Jn8NiM9FqOWKvjfrZRhxXsivtqaNbqNRCwoFC1j0Up5vY7NFuIklKuF6v
         BMTkw5OGR7qWERwaGRLU8W5dBX+bbDSLl5GZ50SB1Ti6jLgy9kEW77cvI5NZzEArU1RM
         1aug==
X-Forwarded-Encrypted: i=1; AJvYcCXKGNdSoJZqaa3Cr5I0M37KgWbFE7eks2wJrOFSJ1q1doEMwONVLcirsw+EEkbHpjpHjHcI7RZZqdg3g6o=@vger.kernel.org, AJvYcCXb9LOI9Z4UQHNkn2d6kdmXdhMvMyJ2ZVnm8OjzNSvg5GwZYI9yKCZ9wOK/XNTVK5gQeRfhR7m4ueWWXJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIPr7thwoqptWaHxvU9MYRqBzW3yOjdd4Rm2GTHabgYM3b8IM9
	SnsF6GkHwpUM8zgrwKJ083NCAVNa+ChqpBAR8XKE5czKaXDnBa6b
X-Gm-Gg: ASbGncsCfscWYwolrmYe+HmSAlu3ndnxlZI7xjE2VTVu28l4bXwAJRpWvDNVULTm/D+
	SRhH/RzPdUsq3ni4NdzPizFTs0lw0F9YNa3K23TVLE5LP3ESnpYObAL7zmhLNiH44biIJE573mA
	C9GIMpoal8c3jMtZBdFsvBUWMcSXA/TyJpvV273hzcryRi6n99/3DlAGCNBefBqMIjgZIB2tBLl
	6dJCKcymRms/te/pwFt5KoLAF/8vwlOd98eey6/QHAzg/mXEj2+tfqsjf3fbbaNd1toxClphsE7
	axoh91UsqsmyJWsNCH9iHegUxWw91WPi/zqiM5x/vw==
X-Google-Smtp-Source: AGHT+IH2d7yNdQ11WUghNAhzaCdxOoKDBGRwo65j4Mt/Dnv6ia1u3FQoAdvO8VkKfmMezO5hiFWzuw==
X-Received: by 2002:a05:6000:2509:b0:39e:e75b:5cd with SMTP id ffacd0b85a97d-39efba2c98emr14484631f8f.3.1745359594331;
        Tue, 22 Apr 2025 15:06:34 -0700 (PDT)
Received: from localhost ([194.120.133.58])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa4207afsm16716557f8f.12.2025.04.22.15.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:06:34 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] dma-buf/sw_sync: remove redundant error check on variable err
Date: Tue, 22 Apr 2025 23:06:27 +0100
Message-ID: <20250422220627.89077-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable err is always zero at the point where it is being
non-zero checked for an error. The check and error return path
are redundant and can be removed. Issue detected by Coverity Scan
static analysis.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/dma-buf/sw_sync.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 4f27ee93a00c..ef3fda792749 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -437,9 +437,6 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 
 	dma_fence_put(fence);
 
-	if (ret)
-		return ret;
-
 	if (copy_to_user((void __user *)arg, &data, sizeof(data)))
 		return -EFAULT;
 
-- 
2.49.0


