Return-Path: <linux-media+bounces-34440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEBFAD38D5
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 15:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B0471BA0A89
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 13:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7891F22577D;
	Tue, 10 Jun 2025 13:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ezIKtYk2"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4841E29ACDA
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 13:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561172; cv=none; b=O/SxbSId7PB+yWgm4zNCzfBliyQsGCs0Kbkcb7T5V/ShVK50nK0d6ZIUkx+37ZUwEhOHk+MMW7pQetGI48OHeyClEMHYZJJ9hTWtiMPx8o1j/YP4CIilNamxObPPAdWJUVKJdYApolMchNp2QtNBfkN8B+jnYIA4KXhXFKikeRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561172; c=relaxed/simple;
	bh=NfGd8wiVsnIGlkddAY6txj9tOa78YL4VYJnBGkbEwwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnGrRm971G00npZYjOLOHOTYLCcsFKgQqlyN1y0M+rz8ou7+Y+KyjTfEpzOpbvxQxOZHd5/D2ynFdPFnxjpH9IjM7hJl9IqTNHJ76JIAqgxWOSmVsl0TUg/lcU810Qcu41gazE8iuRcYwAuYX94FY+Rnw2qEuh/6H4Tc47GuM6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ezIKtYk2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749561169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PECxVyikQ9zU3hJ7MtiQUOf3zC4eClOuuMti35ulFIo=;
	b=ezIKtYk2zxMGjy/9vW6VoA1aE9F45w4sEpnn8ilHeM1Ip5nPTATEsKrwL47nEbabYIfxhB
	uzLfgvQJQckkGViTSyMvn99vw0eWJzQgvpEzepNOLkBO/lP3iCjomMMdJclvXdC7zTuyXH
	krlT+g9wSrkdeJpiw4IMtBwexgpsCuM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-95NisX9pM7ug9yPT4z-MfA-1; Tue, 10 Jun 2025 09:12:48 -0400
X-MC-Unique: 95NisX9pM7ug9yPT4z-MfA-1
X-Mimecast-MFC-AGG-ID: 95NisX9pM7ug9yPT4z-MfA_1749561168
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3901ff832so517661185a.3
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 06:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561168; x=1750165968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PECxVyikQ9zU3hJ7MtiQUOf3zC4eClOuuMti35ulFIo=;
        b=TxA9Z94UzNhphu2GX+uLzbyqpNz/vaQJ01d79MBUsVMSPHEdq6IuiiN/Jv6egriqxm
         e1tNP0JQb00sj8WdOnaC3Or1KEuE5uDfNbw5B47VLHkWCe9TNoSluQt/8Ksn+8sUJpZJ
         eyFGfinL8UanMQsUtUhZtspnH6gbdRTbCTXivkn/Eh3LgzUJ/Om9SnUi4BsqK599uTFR
         01T84XQcb3WPuuVJyuLiGBjMZKntrvnGWluP87bzZ+0hr6mwil0quuueZAay3BkvBu8q
         f6XdEPaiKwleI9E086r1VdehqS34R2sMalBacTN/BWlvDkiozSmVyHc4ly7ledKwgHDT
         1C0A==
X-Forwarded-Encrypted: i=1; AJvYcCUIJpeQAi4tnKQmjTb55pZynCcjr+S0J40USYWFCDuRTfVwWkMjFvGZvRGZpWtACGP7oknmLi1kgiUNkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqG9xr/LeFI6OfCPz/PUBw+Pnttj7d+kShUu3GDHc+SmdtrU0J
	Gs810GSeAhMg75qNJScse5f5JMkn1zst5TlkUok3JdaEHDBvYdfr1jpx7xACVjqnqmX5+5HbjRO
	7zJTP6q6tADwHylBFW9FEmG262vqwKzKatS7RkoobfNH6pgw+w6p/5lvb1rH57b4l
X-Gm-Gg: ASbGncvE3+6rVl1evJZh3f0BeIzBNhn6Nk5DfyTX9q1a9h9TQ5zHkyW7Wpzv3TMB5AB
	+tMhGv387n0K7f1AbKc/tHhLQHFjHkVeoISzXEqI9ixoTbXiC3AzEAJ72qX7rG561w5n9HHw4x4
	AwvILwk7KIBy/8bYnghzkUdt8nSw3doPyWaBxYmhYUioyuWIc8pwS0PSll85rVWWuXFNP+OXcZF
	rs/qPLSnO3kaZmF/9KEyoOiik/WRSp/gAbpHgMcc/aI7KfQy+zotfzkM0bXPnoLtVZmA7iKmSXl
	Hxr7hjfmrfbQKFjF14c0YkOnihVKD6V6nZmvsM2e0NGce5phF8X1XA==
X-Received: by 2002:a05:620a:454b:b0:7cc:fef2:51b9 with SMTP id af79cd13be357-7d2298ec18fmr2737089285a.52.1749561167963;
        Tue, 10 Jun 2025 06:12:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5bCzCA/Bb8gTxULZZifA/R0afXX8wGKlcmbzwfFYe6YdDUcmddGY0FzDv8nfqETa2Ner9Hg==
X-Received: by 2002:a05:620a:454b:b0:7cc:fef2:51b9 with SMTP id af79cd13be357-7d2298ec18fmr2737085985a.52.1749561167617;
        Tue, 10 Jun 2025 06:12:47 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25170615bsm696832285a.9.2025.06.10.06.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:12:47 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com
Cc: mripard@kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v4 1/3] Documentation: dma-buf: heaps: Fix code markup
Date: Tue, 10 Jun 2025 06:12:29 -0700
Message-ID: <20250610131231.1724627-2-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610131231.1724627-1-jkangas@redhat.com>
References: <20250610131231.1724627-1-jkangas@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Code snippets should be wrapped in double backticks to follow
reStructuredText semantics; the use of single backticks uses the
:title-reference: role by default, which isn't quite what we want.
Add double backticks to code snippets to fix this.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 535f49047ce64..23bd0bd7b0654 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -19,7 +19,7 @@ following heaps:
  - The ``cma`` heap allocates physically contiguous, cacheable,
    buffers. Only present if a CMA region is present. Such a region is
    usually created either through the kernel commandline through the
-   `cma` parameter, a memory region Device-Tree node with the
-   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
-   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
+   ``cma`` parameter, a memory region Device-Tree node with the
+   ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`` or
+   ``CMA_SIZE_PERCENTAGE`` Kconfig options. Depending on the platform, it
    might be called ``reserved``, ``linux,cma``, or ``default-pool``.
-- 
2.49.0


