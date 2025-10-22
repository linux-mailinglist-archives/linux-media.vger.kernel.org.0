Return-Path: <linux-media+bounces-45179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 63109BF9F16
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 06:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DED64353FC3
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 04:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC3E2D0601;
	Wed, 22 Oct 2025 04:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ssn.edu.in header.i=@ssn.edu.in header.b="Qmka0NpI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644581F5437
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 04:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761107481; cv=none; b=MLMbZ+4lUCP2OIdltBeDMYM3/uRa8oaSE+lczjvqcT9wa2dnlMMqG6J3ilaH1YGHJEPAdW2UruRSt+Qhwba5sYkOF6wUOZHPgvdJgBksgDWNVy0UO0xqV29ge6zwR8helKW/LjKrTdxSbsuD00haPluL3w+Jx+whga4xd6OiSEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761107481; c=relaxed/simple;
	bh=aF9X/USAXc7qJxOd6+H5SsC0CuGg8nY892TtxEL+zRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tJ7zR4FMjL8QR9NErXkqZto7ZtsP5j+4dQc9dZ7UlRjyBO5lYcDnHRnzCXxqF08fuLqK4rFSaNFnbmLbi42EnIkFQxpzRjm3quDy3YKvaIDKj+4PZgO0ZUfnZXCQh9K20n3EWBueb+CxxDY9ctBzy8pPaN8B/iOSGbQV+uSPrRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ssn.edu.in; spf=pass smtp.mailfrom=ssn.edu.in; dkim=pass (1024-bit key) header.d=ssn.edu.in header.i=@ssn.edu.in header.b=Qmka0NpI; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ssn.edu.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ssn.edu.in
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-29226bc4bafso45418945ad.0
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 21:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ssn.edu.in; s=ssn; t=1761107476; x=1761712276; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9f3uvbf2qrrt/ziC3rimn8Y/fAQpzGjeRz5deOCQI/U=;
        b=Qmka0NpI1URT7mhySqWYrcROD/IQj+OdjUBusXVqq5hK4jZmsWZNwtk2OG6W2kn0H9
         pCfaa0fTUJje61/C4WMTWmJOo3zDohMxHnf05+iXoWHjnIVpAhGU9a34jw//SP19mpgW
         nsrxQxgJ0h+ZLTmwgKr7koC4KqqRuzMpZ2vTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761107476; x=1761712276;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9f3uvbf2qrrt/ziC3rimn8Y/fAQpzGjeRz5deOCQI/U=;
        b=b77ZuxZyF97NnXA958y5R4TAzl+ZQxRWIYVpzBUzin6UG8drQStzVgYG2j/9+ez0D2
         fM1VUG0vyurq4KKRSjU0WrnU66xokTgCEyUSy640Lz5rn2EHLjm7/VExcxaKZ8K5y0UW
         kRxHw24ipwXaHT6kKtVTUcgztxdrz86pPBZ5LvOPc/h/OKD4G2XVgu83OPf2JdX4iiRb
         4H+gzG2rGye3t7FinCE2c2f9tnbo6fGFjVFFk9e8YrDj9comLpCbGW7lhzhc4N5BlhEp
         AA0ztZS/7+bq7FU64+jg0oisW48GL/TQcPWZ8at21LZyLD/w+6VfAt77IGa7xR/bFKMd
         8HGA==
X-Forwarded-Encrypted: i=1; AJvYcCXe8TQTOguSlOof8I3KfQTukS5+U8tbvCKjn0ACXxeBmg2OjN//0JNW+bWSIzROWoJWVJE8eL5t1uIXcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeKd3GS0QHtYQYK/afZDWrh6cB9rcAlgq5mrY6cBr1ZkuIFTiz
	xjz8RW6e8o5PmwtzpQhRc2aKtl1MKvOWqxZEQkW2AnWkUoULaaQQLn+Q/QeT40ydR8c2AJEAnAQ
	h058eNlGmAG6vR+e9OmNod7K4SOO0toGxc2ismOUmwV963lp+5BHnGsGcsjQtlW1HFrYutvrnKm
	7cNA0=
X-Gm-Gg: ASbGncsC+SuEOa2N8ABCaX1hM2StCwPYy2k9q1rxK56JnkYXVog+KfMHYU9H8JllRJb
	7nNf5sbo/eyzV0PeN88WHqTVV0CurqD2gyGk8qxQQl17kJxoxIDPtMrd5ePK2VlZDJHVa7u1au6
	V/69BzEUak1pZIkRwU2oenwwvl9HXTKVo53gNAehcRHQuaBkrzKyPREgO9P9oQP5BItNLnRmY2h
	6tFuLRFH0yEv+CdJHU1XQqnDyHMgl74zjR3CfB7btgEbp52mjyqNvCjWwaaChS2n1LCXUhw94uL
	7b9sr8wiqhhDis+UX5EUTznEgpk3lgKSx4Ezs5SUQegxqgNOAtPe9d0euvnN3FN8WI6c+57ey/U
	ooFu0BvGyLXjC9S0AQ7q8YdQs+03UEK/FEIYvrguYPJxuYZ6KCbJXxVtjFy7AUEDVJsqBVeMvGV
	frEGoUGR/zav4R8CPPH7+EBivVJtrfUb09txbyBS0stiVcte4iETCUefZZNg0Np1tUVU898jShC
	uOgcqa2wMZh3AI=
X-Google-Smtp-Source: AGHT+IEd+bNYS6vl4w16DgOMSV/S7pPkiZN6xIuC+GDZaXXvAtfmV3zwE5YULJyf3rlJMlDMMOTqoQ==
X-Received: by 2002:a17:902:ce0e:b0:273:c463:7b2c with SMTP id d9443c01a7336-290c9c89680mr216879095ad.3.1761107476259;
        Tue, 21 Oct 2025 21:31:16 -0700 (PDT)
Received: from biancaa-HP-Pavilion-Laptop-15-eg2xxx.. ([2406:7400:1c3:33f3:2f80:d146:31b0:93aa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-293113c1f4fsm2240455ad.116.2025.10.21.21.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 21:31:15 -0700 (PDT)
From: Biancaa Ramesh <biancaa2210329@ssn.edu.in>
To: sumit.semwal@linaro.org
Cc: christian.koenig@amd.com,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	Biancaa Ramesh <biancaa2210329@ssn.edu.in>
Subject: [PATCH v2] Signed-off-by: Biancaa Ramesh <biancaa2210329@ssn.edu.in>
Date: Wed, 22 Oct 2025 10:01:07 +0530
Message-ID: <20251022043108.7197-1-biancaa2210329@ssn.edu.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"

dma-buf: improve dma_buf_show_fdinfo output

Improve the readability of /proc/<pid>/fdinfo output for DMA-BUF by
including file flags and ensuring consistent format specifiers for size
and other fields.

This patch also fixes incorrect format specifiers and removes references
to obsolete struct members (num_attachments and num_mappings) that no
longer exist in the DMA-BUF framework.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510220802.svbgdYsJ-lkp@intel.com/
---
 drivers/dma-buf/dma-buf.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 1c0035601c4f..4541f8ec5d62 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -571,24 +571,22 @@ static long dma_buf_ioctl(struct file *file,
 	}
 }
 
-static void dma_buf_show_fdinfo(struct seq_file *s, struct file *f)
+static void dma_buf_show_fdinfo(struct seq_file *s, struct file *file)
 {
-    struct dma_buf *dmabuf = f->private_data;
+	struct dma_buf *dmabuf;
 
-    if (!dmabuf)
-        return;
+	dmabuf = file->private_data;
+	if (!dmabuf)
+		return;
 
-    seq_printf(s, "flags:\t%lu\n", f->f_flags);
-    seq_printf(s, "size:\t%llu\n", dmabuf->size);
-    seq_printf(s, "count:\t%ld\n", file_count(dmabuf->file) - 1);
-    seq_printf(s, "attachments:\t%d\n", atomic_read(&dmabuf->num_attachments));
-    seq_printf(s, "mappings:\t%d\n", atomic_read(&dmabuf->num_mappings));
-    seq_printf(s, "exp_name:\t%s\n", dmabuf->exp_name ? dmabuf->exp_name : "N/A");
+	seq_printf(s, "size:\t%zu\n", dmabuf->size);
+	seq_printf(s, "count:\t%ld\n", file_count(dmabuf->file) - 1);
+	seq_printf(s, "exp_name:\t%s\n", dmabuf->exp_name ? dmabuf->exp_name : "N/A");
 
-    spin_lock(&dmabuf->name_lock);
-    if (dmabuf->name)
-        seq_printf(s, "name:\t%s\n", dmabuf->name);
-    spin_unlock(&dmabuf->name_lock);
+	spin_lock(&dmabuf->name_lock);
+	if (dmabuf->name)
+		seq_printf(s, "name:\t%s\n", dmabuf->name);
+	spin_unlock(&dmabuf->name_lock);
 }
 
 
-- 
2.43.0


-- 
::DISCLAIMER::

---------------------------------------------------------------------
The 
contents of this e-mail and any attachment(s) are confidential and
intended 
for the named recipient(s) only. Views or opinions, if any,
presented in 
this email are solely those of the author and may not
necessarily reflect 
the views or opinions of SSN Institutions (SSN) or its
affiliates. Any form 
of reproduction, dissemination, copying, disclosure,
modification, 
distribution and / or publication of this message without the
prior written 
consent of authorized representative of SSN is strictly
prohibited. If you 
have received this email in error please delete it and
notify the sender 
immediately.
---------------------------------------------------------------------
Header of this mail should have a valid DKIM signature for the domain 
ssn.edu.in <http://www.ssn.edu.in/>

