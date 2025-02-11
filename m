Return-Path: <linux-media+bounces-26013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BDAA31170
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 17:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C73F1884D93
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 16:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E28E255E32;
	Tue, 11 Feb 2025 16:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTcjPgQ6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E121D54EE
	for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 16:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291476; cv=none; b=WiyM53FzoqHxsB9ojb1UdQl6NDTT+BY1Zld1kaE+wgaxr3M0SKW7MaulpfzBp9exnvFGSMvTVYMcxjwQKDXxINjxpGykN+d7y7MVLVYiyzI7KWpws7MPeuAH7B9noe8bKrC/kkYKsyiu10HCbPlD0VYzr8lS3v77XCDD0Nq83e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291476; c=relaxed/simple;
	bh=WWVE1VsYiOh9i7wmeSgBNQ7ZY0D3tyX6PU2eiWITlgA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BRQ1l3WtLIjcbVI3jz634/awT9P81g064M/cA5j1rsXqBh4sng+gBU3r8svtG7g1qka0u6tOhZViW3JmLtmApxox1ivdhQqObJyS+1cndbRWjkStwzBgEWpOCxASl0bKPMbSAkxE015VU5ZNxTkYREvC5wdMfuBRw/N2qpPEAIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTcjPgQ6; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5de5a853090so7394790a12.3
        for <linux-media@vger.kernel.org>; Tue, 11 Feb 2025 08:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739291473; x=1739896273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cB9GGK9j287qQwW682FU+FnOXGITaIfNkLXZoLCeIRg=;
        b=aTcjPgQ6WzU0N9ySaoAtkJawVcwMge7428FHu0IzHBb7F6WpUu+bB9HTM8S0f8eW7F
         J7hWzs9A3yhepoOMvsAEkIMclmuMJyJf/lLBNgIHgMnfW9pIJAKzhD+CKuYCrwkeoIpv
         uVb1+LUhdIX/CgOYGzGG41aD7XaEwlLX8XO/nmDhzzQPmlNInFHiYIKn/yrLpqw98dvR
         4JvNIwPsjcXkXmR0sH1+tEscdKxZxVubn4H2uOsErFein+vvqDHzpfM5e5Ra1Y9pWf1c
         v5vqk4v0HX8pX1/7AnnexeofhUOfBvnW3DjehAirpcyJE3kMe2Uv5nz2s84sLGaxiP41
         wVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739291473; x=1739896273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cB9GGK9j287qQwW682FU+FnOXGITaIfNkLXZoLCeIRg=;
        b=cIqd5BLNFru/0VNpdFyAftwp2lbJE8JHvvYnEfgnrxrebY1A/IaEOCEUsIK65PMq64
         FWdqcAL1nI9P5vUEgrmnznjvgdX8K0wCyOta8s6ElfrI3RJkeMGOnfmtTxBqGojnNIV5
         tHaqcJVB5s2eGwl9a/HNA0tT5n69xqOyWT9CsKHnptvITfVdbvr+bV2+WVM/NO+0g1AU
         5VlLRkYS5F+t4l12veojI/9tBKKmQhsVTR08bdZBDJiXChsWDVTIRoTyg1SIaRWrUXQM
         uXrz/3qdlMg0MzuTmoS9dJxMzcU82YeOLtR2Gg4RBdE1rAWtRxcsThx/pzzAnGqVZOWU
         5F9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVqnmSf8W0IhK9Z0God/w8CtuIfWr9hMPD4ivLTrRWuQdWM+P58UKQEvagsK92XH2yU19YWOZl5XH2msQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQeWSdl9eyUrv3y7YV5V9x1BiUNC+jrG1VZXiQGVQvJTHSFUzr
	e9QWGFJIpUCQS0f1QIFJ0eyLCR+uTtLnv2lS8kzU+FHk7F5q/HB8eBNpNP9s
X-Gm-Gg: ASbGncsBgdP3Tolt04YUU0zxIKM6QOMXmuWHPPegXIz9HCF3kWUGbNj1c7sXhq/FUtK
	wTqW5g7t7+3W/zMPvmyZCFq0pIwFaIuAREN7Q8VKX27QwBq3Di7JaFZrU+14zDMMkN9w/vSkSjI
	46oy+imTbnslf5rFnb2fL4P/IWny2+kvYxigPtwe1u0qdfkH5jP5FcXSOgp3A91EnOPa5YuCpxg
	XxpmaRU7LJ+698lz6cY57QNgXINqjpv6Zgh9LeQfdawbZhMb+FZnoJymA7IUg/J++Uq87vuH1mv
	n5lohCEtyBFtX1671CuRsRMQeBPW
X-Google-Smtp-Source: AGHT+IEe/kXp42nTvgE04i7M8NJuzTiQ6kmVxfRkZm7tSxkcMoG7qhTNznS24oTUjaEHCExq/khNgg==
X-Received: by 2002:a05:6402:1ed6:b0:5de:525c:53cb with SMTP id 4fb4d7f45d1cf-5de525c544amr17964157a12.6.1739291473181;
        Tue, 11 Feb 2025 08:31:13 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:154a:1300:5b91:7670:e404:c65a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b7ade9sm9838748a12.25.2025.02.11.08.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:31:12 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	tzimmermann@suse.de,
	simona@ffwll.ch,
	dmitry.osipenko@collabora.com,
	tvrtko.ursulin@igalia.com,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/4] dma-buf: fix incorrect dma-fence documentation
Date: Tue, 11 Feb 2025 17:31:06 +0100
Message-Id: <20250211163109.12200-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211163109.12200-1-christian.koenig@amd.com>
References: <20250211163109.12200-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There isn't much worse than documentation giving an incorrect advise.
Grabbing a spinlock while interrupts are disabled usually means that you
must also disable interrupts for all other uses of this spinlock.

Otherwise really hard to debug issues can occur. So fix that invalid
documentation.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-fence.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index e7ad819962e3..e230af0d123f 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -169,8 +169,8 @@ struct dma_fence_ops {
 	 * implementation know that there is another driver waiting on the
 	 * signal (ie. hw->sw case).
 	 *
-	 * This function can be called from atomic context, but not
-	 * from irq context, so normal spinlocks can be used.
+	 * This is called with irq's disabled, so only spinlocks which also
+	 * disable irq's can be used.
 	 *
 	 * A return value of false indicates the fence already passed,
 	 * or some failure occurred that made it impossible to enable
-- 
2.34.1


