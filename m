Return-Path: <linux-media+bounces-37189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A28D2AFE7F5
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 13:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68F69564180
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 11:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F3D2D46AA;
	Wed,  9 Jul 2025 11:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zc0JilSE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9126290BD5;
	Wed,  9 Jul 2025 11:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061151; cv=none; b=VtUPmPLQmHvqoErlVsuTd0r4G6RnF9gkKAgwR/yevVFO5GKS+AE+/geGuKBJB6aiY4bZfBI84zLIAU1YWAtVNgtcZZkN2g546VMjY9oraEx7l4wQp39LCibR8zjd3oBACthis/SUY/7Inj+L478Ly94RIY2mrart29tfZyrU/lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061151; c=relaxed/simple;
	bh=rhmOjq0zJ77uIYDNsQhkrmmPh2SxcJ6XQ3xYdHJ7Gc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aHo31ZcfehuCCTCBlX10JBVviWWDuZLk1MUxCGCHIe203NP4GzA2Z7IsElwoIilcIxdMpTHI1YpczMiChGpUTRCTFFFy1Kdvn+PgAP4XwuobBeUT28ICG4Ck33oHvwcz7Vv6IT6i2+gScJu8iMZg2QLvfV42G8M/nUdFMQwb9Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zc0JilSE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4531898b208so1533825e9.3;
        Wed, 09 Jul 2025 04:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752061148; x=1752665948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5a7pj4ezc2Wigam/4fH4RN3wdRATRNixiUvvVfjohuI=;
        b=Zc0JilSElmRfk9CWIQbnzqVAlHqkzoXJ0m0tz2F2B/TzQqxM3EjQVXQWDNINNxwa6u
         ANnD5rHe7uBMoNAC/P5OFahSJUuaPY1tZ/+ykDUfRmB7nBJ6t7dqJZvz2uN4j46Wy8gU
         CnnBplUQGHgVlK5/7JgPRsO/3zbmW5eSNtJAJbFLZxk+Flxd3tdQuj/3TuGmpwinaycy
         NbyUr21OW7kzuMKlmxDINJ7YlMhkq8zz4f+zEORcD10O++bHiouwxumZQIQOgcOwoezk
         mlLI6nSfJp+v43mlsDgu46ULrMl842id3wgkQvm7YVQX5l1iubxo89YLmYzWe4PcJmTW
         5NAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061148; x=1752665948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5a7pj4ezc2Wigam/4fH4RN3wdRATRNixiUvvVfjohuI=;
        b=R6bUO7bgy64Ao3dU9z2iEfpxtNUXb3gU/fAn9qWYk3XE6Q9LYsoH2xBGaPoMAVN8/K
         UrMCJQo5UvwiSYPxxaxrby4lvm4fzMM0v6wm9s4gAH3y9LZNU2JcT4lOME9YlZTreq4j
         ppZptR4rO46+EFZQdH/LQEi0TaZqCmgyd3i4nub6jPLuTW48N8V8t65hQ62JF7NAQUa9
         6Foo0U7SZcJzlcKMbhrcs8x+CMo6wW0vpsOpm77QgM3MTZT10rqsGR2BF9nkY49senio
         sQvdqAbJmziO/waHpD6qLdm0K+1hcUbdX3hD8PW5GpaAyk1NX7zkMhozYMu9u2E59OHe
         Wyug==
X-Forwarded-Encrypted: i=1; AJvYcCXIZtcArkvqLcSy6Z7OkHfLU1SQx10nVSY2agxcYmCFpHkQl2crKA3Y4NimKd9J4qrBM2m8nNyfaNf115I=@vger.kernel.org, AJvYcCXiGH/yczmaHxcjrndcd9EkNFvz1R5IJ2ItJw77U84OHMgwV9bQDyPHxzxHt0A2By4SRjukBE4VFN8NTZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy0A1tY/WxR6XEnxP37MeJrZshPbHBLYtD/6kzaAHm72MCvv2I
	ca+BhpgwmafcRJw7dCnF838kLKSyfhIxeuMelgZid4fF5ecTdD5KRemH0iZiKSh7
X-Gm-Gg: ASbGnctn0Pl9R/XcZouJ5C+y/49ENy0J9+xRdAcuBw2Qh6wem8obY1M1g7aEytVG7Yp
	rgb8ouY3HcI1rNuaLF5G1NHSi7kO72QNzfvoJmBDMAyY6GigtPpnLjejRE7RA/TuNNXu02Y6U0M
	29SqcICm5pY9rcoJjjTo66g/jfioyPbDT6D2Sb7V/85ckxvmugOE8cNtHgOCGB3gPVv4ul7Su/V
	OeJQifCJUPoaE1tBZOj44qdAVORYGEkDD4NT9FH6lOr2ZX3OheiylUQWBQ8RPGhw2sqxuQSrffP
	omQhYk4gq9qJUNCc2u2axqIQU/RrhKRqAN4VORsSbbCZXMUWtANUcLJ4SHjY8F7yEO9mSQMrX+M
	njVyTP2bI5nQ=
X-Google-Smtp-Source: AGHT+IGRDiCf8dhrWsKYncqqsNQ4h8uxhLurByQRg+HlAy9nFYJTK+Z2D3rmu8Lwohfvc8mYiAmOzg==
X-Received: by 2002:a05:600c:19d1:b0:453:bf1:8895 with SMTP id 5b1f17b1804b1-454d53e6a4emr7402395e9.5.1752061148063;
        Wed, 09 Jul 2025 04:39:08 -0700 (PDT)
Received: from thomas-precision3591.. ([2a0d:e487:313f:bd91:3d4b:795b:ac55:2b9d])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454d50537b2sm20225335e9.15.2025.07.09.04.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:39:07 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Krufky <mkrufky@linuxtv.org>,
	Steven Toth <stoth@hauppauge.com>,
	"G. Andrew Walls" <awalls@radix.net>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: cx18: Add missing check after DMA map
Date: Wed,  9 Jul 2025 13:35:40 +0200
Message-ID: <20250709113541.29542-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA map functions can fail and should be tested for errors.
If the mapping fails, dealloc buffers, and return.

Fixes: 1c1e45d17b66 ("V4L/DVB (7786): cx18: new driver for the Conexant CX23418 MPEG encoder chip")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/media/pci/cx18/cx18-queue.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-queue.c b/drivers/media/pci/cx18/cx18-queue.c
index 013694bfcb1c..7cbb2d586932 100644
--- a/drivers/media/pci/cx18/cx18-queue.c
+++ b/drivers/media/pci/cx18/cx18-queue.c
@@ -379,15 +379,22 @@ int cx18_stream_alloc(struct cx18_stream *s)
 			break;
 		}
 
+		buf->dma_handle = dma_map_single(&s->cx->pci_dev->dev,
+						 buf->buf, s->buf_size,
+						 s->dma);
+		if (dma_mapping_error(&s->cx->pci_dev->dev, buf->dma_handle)) {
+			kfree(buf->buf);
+			kfree(mdl);
+			kfree(buf);
+			break;
+		}
+
 		INIT_LIST_HEAD(&mdl->list);
 		INIT_LIST_HEAD(&mdl->buf_list);
 		mdl->id = s->mdl_base_idx; /* a somewhat safe value */
 		cx18_enqueue(s, mdl, &s->q_idle);
 
 		INIT_LIST_HEAD(&buf->list);
-		buf->dma_handle = dma_map_single(&s->cx->pci_dev->dev,
-						 buf->buf, s->buf_size,
-						 s->dma);
 		cx18_buf_sync_for_cpu(s, buf);
 		list_add_tail(&buf->list, &s->buf_pool);
 	}
-- 
2.43.0


