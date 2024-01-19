Return-Path: <linux-media+bounces-3900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 285FB8323CB
	for <lists+linux-media@lfdr.de>; Fri, 19 Jan 2024 04:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64685B22383
	for <lists+linux-media@lfdr.de>; Fri, 19 Jan 2024 03:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37694A0C;
	Fri, 19 Jan 2024 03:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O4cdoNWc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C60B17F5
	for <linux-media@vger.kernel.org>; Fri, 19 Jan 2024 03:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705635194; cv=none; b=GAzC2SIg/o6blugYcWKFFCzI5BQhwc+tqhthbKPqj6U/bvPrqZkgjojo4fzOq9WQjsVA+MPw0RH1UJmid9/2TZTC/LuBWon6/+wu8L2TyiCi+1HUec2BbMyqjfLZ3hGBbBT0egXa0lH+VEJZcveUhJQsgRA81SAZa5rV+dNfVSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705635194; c=relaxed/simple;
	bh=C5cJj4Ka7/foS1je4bNK0Ads/1y5LmH0u13xCV7j4Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NtKpoSleRmSGDpvye5ijJMbTX0J3Iwpr8PqLEvDyORQHFxVnZnkeQJCLS7To0vUYCoDtMx8xyJuobgAGdXvxh/oMY/RsJ/LdvlCIUwMOkdcoKghvvmqs6eYGHKzt50GD5W4LwKaJItOcB1Fn6L7wRwsVRnStHNEFaBGUS9uvNFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O4cdoNWc; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-6d9b41a3cb7so94393b3a.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jan 2024 19:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705635191; x=1706239991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wEILTqh/RXJMBB+YR36HUlkVGyOVde6YUHPbxwHA7iM=;
        b=O4cdoNWcXDYveQQyj/Rf1xEa2qmiMoDICIO/8pyjH2GC9RO9dNVJ0+WObkuztrmoUD
         TZIFxgpB5KPu/kFZzBVSYY0Wl1MHjRyNjrmPlf91eFljbt3kSmdrQXbQy+MZ0SR+fJAw
         9kET4fPXJWPS095gL8SoGagnlIGbIdcksCd04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705635191; x=1706239991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEILTqh/RXJMBB+YR36HUlkVGyOVde6YUHPbxwHA7iM=;
        b=a/vf0BTbjgQ/SjqnzN/BhpZiCVTPNta4pfe6/u1sFgCxtbd+UDOxb67C9plltmPI6K
         9XMyBPjMExcARhENkMyFfhearRMZBQAihw2WuVSqU6TChvcdud93qunuCvCCksUBElEZ
         6IzyZ1QYmyXpX0jlKCp5PLveR5hZUiJXP5nlkWsJU4Ko/jPa+v4FKOzor1045aB4VzGY
         kjHkADhmU63bVCiLrcFu8c64iiGr1mdMkNRfgaDiIo2iA3DznVVIUBrC7wridUvcUkGq
         GH4lAa1GEM5jJ7bLUnxE0IVp9AtbZ+0MzhfoBGVm6LGwIGxBlDxwyznzoTyqw2hKhzGn
         CDFA==
X-Gm-Message-State: AOJu0Yx3obeGIVh4qo8snMLgQRXHb2dwpiXTHzbXtIc0F2CUm7XwQCJ4
	zYQhsbO3Z8PcHEA8KadJWwP2KXSiuaV/QaXv3dSlk/Ao+s8UYGQMOcUbm+3XUw==
X-Google-Smtp-Source: AGHT+IEFxeuO/fG6ld/BUBm6Yi4OVDK+ZMfI8nq9gNKpyVBzwG2r6sD51jIADODKtdwQtKWpJQbJlQ==
X-Received: by 2002:a05:6a00:db:b0:6db:936c:aabe with SMTP id e27-20020a056a0000db00b006db936caabemr1077205pfj.2.1705635190937;
        Thu, 18 Jan 2024 19:33:10 -0800 (PST)
Received: from localhost (60.252.199.104.bc.googleusercontent.com. [104.199.252.60])
        by smtp.gmail.com with UTF8SMTPSA id q16-20020a056a00085000b006d9aa04574csm3990493pfk.52.2024.01.18.19.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 19:33:10 -0800 (PST)
From: Tommy Chiang <ototot@chromium.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Tommy Chiang <ototot@chromium.org>
Subject: [PATCH] dma-buf: Add syntax highlighting to code listings in the document
Date: Fri, 19 Jan 2024 03:31:26 +0000
Message-ID: <20240119033126.1802711-1-ototot@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch tries to improve the display of the code listing
on The Linux Kernel documentation website for dma-buf [1] .

Originally, it appears that it was attempting to escape
the '*' character, but looks like it's not necessary (now),
so we are seeing something like '\*' on the webite.

This patch removes these unnecessary backslashes and adds syntax
highlighting to improve the readability of the code listing.

[1] https://docs.kernel.org/driver-api/dma-buf.html

Signed-off-by: Tommy Chiang <ototot@chromium.org>
---
 drivers/dma-buf/dma-buf.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8fe5aa67b167..e083a0ab06d7 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1282,10 +1282,12 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
  *   vmap interface is introduced. Note that on very old 32-bit architectures
  *   vmalloc space might be limited and result in vmap calls failing.
  *
- *   Interfaces::
+ *   Interfaces:
  *
- *      void \*dma_buf_vmap(struct dma_buf \*dmabuf, struct iosys_map \*map)
- *      void dma_buf_vunmap(struct dma_buf \*dmabuf, struct iosys_map \*map)
+ *   .. code-block:: c
+ *
+ *     void *dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
+ *     void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
  *
  *   The vmap call can fail if there is no vmap support in the exporter, or if
  *   it runs out of vmalloc space. Note that the dma-buf layer keeps a reference
@@ -1342,10 +1344,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
  *   enough, since adding interfaces to intercept pagefaults and allow pte
  *   shootdowns would increase the complexity quite a bit.
  *
- *   Interface::
+ *   Interface:
+ *
+ *   .. code-block:: c
  *
- *      int dma_buf_mmap(struct dma_buf \*, struct vm_area_struct \*,
- *		       unsigned long);
+ *     int dma_buf_mmap(struct dma_buf *, struct vm_area_struct *, unsigned long);
  *
  *   If the importing subsystem simply provides a special-purpose mmap call to
  *   set up a mapping in userspace, calling do_mmap with &dma_buf.file will
-- 
2.43.0.381.gb435a96ce8-goog


