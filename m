Return-Path: <linux-media+bounces-45161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1840FBF8B0D
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 22:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D751A4FBB70
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 20:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6CA245014;
	Tue, 21 Oct 2025 20:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ssn.edu.in header.i=@ssn.edu.in header.b="VY4ouE8g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92A9350A3D
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 20:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761077836; cv=none; b=gxTRSYYmb2tQ9Ay7Clt/SuH/Qcz6hxBVP6HSE1miYiCvlumYeYK8ibdFjhj1Z1UDu663WDfZ4dMrZFqDoJSP17SveqOhMADLNQ5SHylw1uouZru68HW/+6ZtzfLzbtnKUWekgjH1pVQuXumP2Q6Dcq1D3N1edvkV3Eq03n65lbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761077836; c=relaxed/simple;
	bh=3s9Hg8jMoBX9CiCTXq1M6Thci0WpmJxF38Djz8L/WlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CvjoxbMamhgWCyHSDBRWVN4D9NJF7lcVSQrcY6lJR8q8UdnXWTohasX1jRhl2HlGTS1vPL30bECjFnMYipc6rM1l+L2XwO7ozieWlxqQtiVOJjvhB0OnHcXpt//heihmG+eAm9fcVCekgFUJE0TSqRVT0I/mf+3ZE+/mOOQ41F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ssn.edu.in; spf=pass smtp.mailfrom=ssn.edu.in; dkim=pass (1024-bit key) header.d=ssn.edu.in header.i=@ssn.edu.in header.b=VY4ouE8g; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ssn.edu.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ssn.edu.in
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-27c369f898fso85834805ad.3
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 13:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ssn.edu.in; s=ssn; t=1761077831; x=1761682631; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fboqJCjCw6RVWXir/DI4EBNfbHyerzjrKQ29FGZhy8U=;
        b=VY4ouE8g6lRoGEcdfzSFyRucVnLYvEa3o1mMkK9RlCxpeIuXOVIrzP2zo2YO7Foy7B
         aLQpln3ucruxIjOhnNkBigAtHsN77nQ8QyyIfF+ShiJfSnHMoMZjZXeboKcZzzodhiwD
         mHkqKZqczv+RIXdScqbxGJrHmT3IJIdEMgjIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761077831; x=1761682631;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fboqJCjCw6RVWXir/DI4EBNfbHyerzjrKQ29FGZhy8U=;
        b=pHJLF63c7iVwR0lTIZDYr+UIAEh3cL2Oi2d4r8ddsqy0d09wA4SHxx9G867Gy1lVgN
         rc3G33pZn+27vSnQHPSyZJjY7rkh367XV9GdpDTOGzuiJUrpA6B67L4fqbRi74wRIejs
         DK/BFFlLjZLz4dRAU/JwNwY/WxbQZOEzAshDjYBE1aYhU9UuLMTBPmBR5xpMfbaOwXdh
         uJ8EPfG5dDCbQQVYgxDdICKPJH/xpbllEDbP7qbqQEIEiagAzNugZ0+WJSvEm/BsYoTX
         oU0BDFsY1F5cyiCBK7Mp4qsdjSH05sFWCHq0t1WmJQ9+hcM/LyZ/XcIT8ahTDZ3DwUhY
         sN7w==
X-Forwarded-Encrypted: i=1; AJvYcCWRVZxu5el+LnbhaOkgUNvz67ZNqC0TiJM0VkyLn2VkwjeE/Lfb6MgoxfDnkeIK1R0L2H1mbKMT6YSTdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZDPm5ORh0CM9JzQbbNyLuscZnH6M9uUY7wWO991OVNoA+MHS2
	d7oCykQTZLr1H+74JQtQLghaj+jlS+BD0KgMOzMG8q86qJMewpA1MEUrmdDh40f0SPQmh52ZE/a
	Ig1HfSFJEi74/MzqiHuiRbApODtBo5QsNB4ZsKNMQkrETUkEBD0LT4mQ=
X-Gm-Gg: ASbGnct9FQciLKznJcSH1mSJHUi8oO0ZzOoumKd1RQzS1leRNwj+yKBfKIEmk4oa01K
	kb1zr6CBa/z3B92yBKkjxsX2VBE8kARUsu6Vo6xlI0yb9U3DO6+lKOOY8f3W51humEe+pGZ6LcO
	b+6+igJktl9zpWC30qW6WNY9wL5HSqFqTnDKVIBtOiEDwphXio3UkGqeHxEm+m0tdqQwI8TKLAY
	nRrLm+ntVVWoSu/9wFd4hAy+qt8NNd72/XC2xA34KDgVELiIl4l8ukLiUHVvJX65yTJkG11lw+C
	KbWGyraRM7q9xpNM7JS0+6woZloSnr3P3ElY9jA3vyw2TJBgM5iOZmU5Wn96Qv/8Pl2ynzi0KTn
	1D2Pq3LArMngoTcjrf8/EayRRl5m4b+LVsaFnuamka/A3+iCDb5mPA8q334GAQ3gfL99upmFivZ
	+kAdLdxNNubmd9nJOyLbrpKZn6svJx7od4cduj3Tn31jm2R5Ngc6Ix7TPV0ZWkuwRCHY5KzOZ+I
	PgCKcGXrotwd84=
X-Google-Smtp-Source: AGHT+IEUy/ejndszEfjZ3DhOlo0RzlR6VaDcA1yz8MEsmxWgkx1tI42kbduExxRtzT6d7bynvLJJAw==
X-Received: by 2002:a17:902:f681:b0:290:d0fb:55c0 with SMTP id d9443c01a7336-290d0fb5971mr217778985ad.43.1761077831617;
        Tue, 21 Oct 2025 13:17:11 -0700 (PDT)
Received: from biancaa-HP-Pavilion-Laptop-15-eg2xxx.. ([2406:7400:1c3:33f3:d5f3:33d1:a1e0:46bc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fdd10sm117171835ad.83.2025.10.21.13.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 13:17:11 -0700 (PDT)
From: Biancaa Ramesh <biancaa2210329@ssn.edu.in>
To: linux-kernel@vger.kernel.org
Cc: awalls@md.metrocast.net,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Biancaa Ramesh <biancaa2210329@ssn.edu.in>
Subject: [PATCH] kernel memory safety check in a block
Date: Wed, 22 Oct 2025 01:47:04 +0530
Message-ID: <20251021201704.178535-1-biancaa2210329@ssn.edu.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"

Signed-off-by: Biancaa Ramesh <biancaa2210329@ssn.edu.in>
[PATCH] media: cx18: fix potential double free in cx18_stream_alloc

The function cx18_stream_alloc() may free buf->buf and buf multiple times
if dma_mapping_error() occurs. This patch:

- Adds checks before kfree() to avoid double free
- Sets pointers to NULL after free to make accidental double free less likely
- Improves overall memory safety and robustness in error paths
---
 drivers/media/pci/cx18/cx18-queue.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-queue.c b/drivers/media/pci/cx18/cx18-queue.c
index eeb5513b1d52..025ba4e6e4be 100644
--- a/drivers/media/pci/cx18/cx18-queue.c
+++ b/drivers/media/pci/cx18/cx18-queue.c
@@ -383,9 +383,16 @@ int cx18_stream_alloc(struct cx18_stream *s)
 						 buf->buf, s->buf_size,
 						 s->dma);
 		if (dma_mapping_error(&s->cx->pci_dev->dev, buf->dma_handle)) {
-			kfree(buf->buf);
+			if (buf) {
+        		if (buf->buf){
+            	kfree(buf->buf);
+				buf->buf =NULL;
+				}
+        		kfree(buf);
+				buf=NULL;
+    		}
 			kfree(mdl);
-			kfree(buf);
+			//makes accidental double free less possible
 			break;
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

