Return-Path: <linux-media+bounces-31569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D2EAA6EBE
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 12:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14DE31BC6091
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 10:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C64246778;
	Fri,  2 May 2025 10:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udsnngaM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0C6245016
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 10:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180073; cv=none; b=kbqY52nuV2nRAq5bSBHmRGguX4SMLSqAoTM8LNCS7oSeeDPiLVTmB0EdwtMvwu3UF2vrIEp5Acq6/3fggn1a7pvj1tn3VXC9JrS/qzEJuT8OrWvNDTKcE6jwVa762GvIAhpFYPrr+hTVTVqgEV13fXjqUOeD3SVDZPRTG+QWNO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180073; c=relaxed/simple;
	bh=K6D/di6lA+uVA6E3AQ7OcMI+aIt5a8gGMoofegAlu74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DhPEQP4R8c02i3TrWk1cGsUiU5wQL/wxsU1GOj7V+GxxYqAsSZELQC+D/6qwkHCOn/XMMD4+4lYZB1W1lhazl+5txmUCRLULiDb3CMjCf1RlDTWhcjBgM2zxKxub9DhWWV+5xdNPxPtXRHysPneDQS0rng7tSE93ShRKIau0FiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=udsnngaM; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so327452066b.1
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 03:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180070; x=1746784870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1anNv4Z25lfJ6IEDtR0M/iXAZvESKw8M2gLCl/3GqgY=;
        b=udsnngaMiu4HZwa72tQ13KsWDqtwRtRluVrAszilSe4HH9W1TGkq+VLjlNoWyuRZvO
         nOEW8xOs5u6zWvCFsslAKAgVImXaDLN9S3nh+lgBS6yi2ajf7ZFZH7qlIfvygqi9l5YS
         vuIYW6lfewu0h+A50BBwkYfLujgImh7HFWmqFowpZzJYZfLA9YgzWX5vI4jp+7mJc64t
         ZwsI4t1teZMq+qqSgpsQwxMDlfzP8/+du+jnLjHh8Xt25GWRa50unQ2LLkepm2Au5yEi
         lrhrPKwWkOpAV6p0MFRDkY3tOUMdP15VkrCr0J7YGwS51d/bgSkZIn1+rBxS0ackmIQ0
         fMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180070; x=1746784870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1anNv4Z25lfJ6IEDtR0M/iXAZvESKw8M2gLCl/3GqgY=;
        b=tWuH3X24PHPBjjQ0DJhJ6sYXKEP6Ipidg+IBim3/3/31ag8M+f/SnA4ws5BepWyiUE
         38Mlj4pg1wEYIoYV7g1sJs9ob6hY7fl58lDRYhrXs4Pafv5y1OQx85fO+drnVfhTgZ0f
         E1xrVmK0QqVw8Ti4XzlqaF0Bq0sDoy3Ow8UamTs56E7lE3mSpRRgzeex7zFv+sXEkP1U
         sWSI1nN+8FOgMu7HfwiYlWbuoRO2Fv0/2DBMXCXBCLCnoPb6uxYgyoTzvICgeHZ1XlID
         vWbYJ/meMwUxSl1r5ofshOpnvEO2H48yGLJb8tgqrpFl7r8Us++sOhlJfhwArvMAaZwS
         r4xA==
X-Forwarded-Encrypted: i=1; AJvYcCUwyPVE0/ZI6fXb3iU+4ylHxuC7VRiftXPUKNE59k6Q/7kc1BNx1prWJ3uXSZ9sUzpGKqkKr0k7mZtt/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAsKoI4l6TuejKVTTO1DcXv09Z9STfUKMFxLQnjVXg3ksM+SP7
	9IAeJUtd+UNNoxqC+h9fbu6/qGrxgsfznqNa/PAUcKhWJfgeOk3SM8Te/EF51Lc=
X-Gm-Gg: ASbGncvAMy96KhHYMgjl7A5Gf/02vYxZ6jGdWPUZ32Z7xgf0cVMmpRCXbtv+CCqvF1H
	haXnHTcB/HRIKzNH5e9ab1ygVYA2V1oRHWGx1VxddSGKxD2ZrgnGm+n4s4NXB3Hp354VhOK6br8
	rUyI2k7C567aDbncvBdFbfR6ijkHhEHf3/Y/CU0NnewF03ijzpVqHXwSbU5SAVZ5jTNSj4eh603
	sdHIzjYRbJATR66/e29rdkSO/spAA7ahrQCjLnBYDjW580ymPcINKiBvkLliaTBWVTIk/4JFDxq
	RHelAnr5SO+y+13jx0xFg9398yjsvDjMyxxCOyQ1r1Xra2Q2iS0MTtJwmFO8YCFYg7zj4YfT6+Z
	yPcOWwmI5n6nAcM16Ng==
X-Google-Smtp-Source: AGHT+IGbNYwwYka0rS/o95u834QMshNlm6ZE08gyDe8QEBQfbOvJaJeikFzKXGrLN54PFU3NRdyFmg==
X-Received: by 2002:a17:907:7255:b0:ace:f2c2:5a4 with SMTP id a640c23a62f3a-ad17ad5d279mr201865366b.13.1746180070053;
        Fri, 02 May 2025 03:01:10 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:09 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Subject: [PATCH v8 09/14] cma: export cma_alloc() and cma_release()
Date: Fri,  2 May 2025 11:59:23 +0200
Message-ID: <20250502100049.1746335-10-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export the two functions cma_alloc() and cma_release().

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 mm/cma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/cma.c b/mm/cma.c
index 15632939f20a..c60901e73a26 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -915,6 +915,7 @@ struct page *cma_alloc(struct cma *cma, unsigned long count,
 {
 	return __cma_alloc(cma, count, align, GFP_KERNEL | (no_warn ? __GFP_NOWARN : 0));
 }
+EXPORT_SYMBOL(cma_alloc);
 
 struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp)
 {
@@ -1002,6 +1003,7 @@ bool cma_release(struct cma *cma, const struct page *pages,
 
 	return true;
 }
+EXPORT_SYMBOL(cma_release);
 
 bool cma_free_folio(struct cma *cma, const struct folio *folio)
 {
-- 
2.43.0


