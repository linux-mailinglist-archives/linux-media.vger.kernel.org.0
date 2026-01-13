Return-Path: <linux-media+bounces-50615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B88D1B678
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 22:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2AA343008155
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 21:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044E2322B66;
	Tue, 13 Jan 2026 21:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B7FLaRzu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="W3J3eXbs"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BF73090CC
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 21:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768339999; cv=none; b=bRJ0KRS2+u6OLp07oj8efBqTk8V+3voWBn1Pkmc+7IpiHECp7BIa1AX8K9taoDjUPayyRQtFZb85feIo46NEoPMccTz1kB767GxHpHCCFxr96wY1yWarX7QuLlH8bCnZ2LajRgzGQmcoo4MJKkQmzFMEZnHveSyNm7dF/27FSAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768339999; c=relaxed/simple;
	bh=xYbmds8UZbX1be+uPgEL9+Gygk4UBSNp3f36Ck+O1XQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g96ncHzRbatSE2tnpJTSxHfq6kvFk4aNeaMnYCfKgUAYwpIdZcKyn4j//QT3/EGyx90Q+PN9eNpKVlAMFXTYGDQJsrRf8jGLOEkuptucPHDm3X77obO4atBnP6DHSSrz4DiXBhQ4CHjZj7uK2I2nozxjE0ppxZFpvCBh/p1ZGCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B7FLaRzu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=W3J3eXbs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768339997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jP7f0lQJG9KXkNw18KBRK9Mc0gzLz/Z1noHFWbbNo8Y=;
	b=B7FLaRzuNGbLR+DyBjvJR3siQVd9paML071ZRvlYMIZliEIGWL3MVJI2bbpXJ9y/bd0/oN
	PB//AH0pYlGk8+OZl/LrWVmchAHE6uHMDGQ02wgQ+DCykRvmAmFtzZq/68el1GrpxIqhnT
	7qAeIj8e5JttXJXwjEFBbmqcEpYX8pM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-fvXHTxchMc61T3puXH-vOA-1; Tue, 13 Jan 2026 16:33:15 -0500
X-MC-Unique: fvXHTxchMc61T3puXH-vOA-1
X-Mimecast-MFC-AGG-ID: fvXHTxchMc61T3puXH-vOA_1768339995
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee1b7293e7so311951141cf.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 13:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768339995; x=1768944795; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jP7f0lQJG9KXkNw18KBRK9Mc0gzLz/Z1noHFWbbNo8Y=;
        b=W3J3eXbsC1Qz0v7yOADzzdw5v5x805fJaQlup1c708lzK25VNdwlGgAYIL5MW0psth
         xhUoJgyQN1zZBKvYzafpU1pnR6DUdhYp5FsvrG9rysYeIZrVZd6vz0bd8VcpRdD1j3F9
         uu3ZsIAUaIg1wSypvJWvwvA5X3fcNDgVQrWJGRN1KH9LNK2Bj76z5TEZ52vw2jQSi9dt
         tFL89GWjnUKdPBmLzZvJp9eSEjlyzl5zF9xIUA6SabNvTxAgO2PtzvWuiJ58/CEqXvn6
         +C0GktgEPWDNrjkreKP498t2JDleafkcY5eejo0u/nVUUZpi+PacXhh7abpR4NXTwLMB
         pikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768339995; x=1768944795;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jP7f0lQJG9KXkNw18KBRK9Mc0gzLz/Z1noHFWbbNo8Y=;
        b=PfvH1nhgijQj4Fg4lgS7D0OBrMjBFA5CYw6Oi1PM12uqqRMzf5nIm++5Ykg2Ga4X/y
         /j/092UTzWNzrl1aMqmu74NLquf+JOZTkJy4bFQ8hphj/9VaMhMh7kSuHzHJ43sm0MVi
         LCONdXI8S1OGsm3Oe8totfCgi+v+kbI7W7NcfRxaJsDlWkHP8KJQCfcoFPQIiuqz8weY
         YMA7Qub1fwkPbLrs+keMHc2XQIKPjgfJMcTHLqc1rAC7nciMpNCzbIufbzTM/MIwkjqA
         74B3rK8s1nbOaz/Bdyve+PTtq3yUb0po6mLDBjN9BoJyNu/wh+hPF5BHhBTobVZG75gc
         ElTQ==
X-Gm-Message-State: AOJu0YySVv0VlxIoEbjrzeQpKszk0WxBEzYxFQfzv6SE4Hr5aXrDOcF1
	GGYYT8wxxqh/pkTg8vxY5NkkONGAp6epY6tNf5Kn//UKVUirwmFAshfMeAmvJUANae7Cl0k4+kf
	t7O2Dwxuc3z72VdoFU6VpHNF2ZPT41BuqD44Grh0pbIci9fiZsP17rWyx4Vzvsv+M
X-Gm-Gg: AY/fxX5AQv5flZXxDUKCwYzIt5xazU7VyJrJ/E9A8C5eIlW8vR3A8R0IEkc0zRcvghr
	82XlG3CqBIf78wvM8Sk/t4Zp3BXKEWfD7KsYgvpWHZbE1mdLZHCf7PWI/op3nHsTRtg1xMHLLEt
	T5T+FhRF8l0STV8PNx9ivDbtkpW1cNub6ilbNvINt0Q3JrSqC/SCyp0IBDko9mpB495fT4ruzWS
	Tlc6JE7KZHRGaKVlPQlqktbvebJJ2OfuFzrzcJ8XYzlvxsM2LMc8awgXXo5r/X48SiRhrqtqBSS
	wSITzpjevI4mmHAllgjwUYZurlTmtEUNdIm4Nx5xfS608/NrfL+UZwSPCf9DB1vQ8QV97k8zkI3
	W/WOxVzF1GjajYpBr5RyRhBJjTXtpNb7p55UNNskQHf54unjT0DY=
X-Received: by 2002:a05:622a:c6:b0:4ee:19f2:9f1b with SMTP id d75a77b69052e-5014822bafemr8156881cf.37.1768339995142;
        Tue, 13 Jan 2026 13:33:15 -0800 (PST)
X-Received: by 2002:a05:622a:c6:b0:4ee:19f2:9f1b with SMTP id d75a77b69052e-5014822bafemr8156571cf.37.1768339994692;
        Tue, 13 Jan 2026 13:33:14 -0800 (PST)
Received: from localhost (pool-100-17-20-16.bstnma.fios.verizon.net. [100.17.20.16])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077268016sm164280926d6.46.2026.01.13.13.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 13:33:14 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
Subject: [PATCH v2 0/2] dma-buf: system_heap: account for system heap
 allocation in memcg
Date: Tue, 13 Jan 2026 16:32:43 -0500
Message-Id: <20260113-dmabuf-heap-system-memcg-v2-0-e85722cc2f24@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zXNQQ7CIBCF4as0s3YaoILVlfcwLkaYFha0DVCja
 Xp30cTlt3j/2yBzCpzh0myQ+BlymKcKdWjAeppGxuCqQQllhBQKXaTHOqBnWjC/c+GIkaMd0fa
 Gul46YzqCOl8SD+H1S9/u1UOaIxafmP5BLZWU8txJYdqT1sdeo0L+3q6Or4mdp9LaOcK+fwCrp
 AtLqAAAAA==
X-Change-ID: 20260102-dmabuf-heap-system-memcg-c86a381d663a
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@redhat.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.2

Capture dmabuf system heap allocations in memcg following prior
conversations[1][2]. Disable this behavior by default unless configured
by "dma_heap.mem_accounting" module parameter.

[1] https://lore.kernel.org/dri-devel/Z-5GZ3kJDbhgVBPG@phenom.ffwll.local/
[2] https://lore.kernel.org/all/CABdmKX2_UOENujpW0dXe0Z0x+4V3onfGDmHf1DMOXfDha6ddOA@mail.gmail.com/

Changes in v2:
- Add a module parameter to enable dma-buf cgroup accounting, disabled
  by default.
- Split system_heap logic in its own commit.
- Link to v1: https://lore.kernel.org/lkml/20251211193106.755485-2-echanude@redhat.com/

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
Eric Chanudet (2):
      dma-buf: heaps: add parameter to account allocations using cgroup
      dma-buf: system_heap: account for system heap allocation in memcg

 drivers/dma-buf/dma-heap.c          | 5 +++++
 drivers/dma-buf/heaps/system_heap.c | 9 +++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)
---
base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
change-id: 20260102-dmabuf-heap-system-memcg-c86a381d663a

Best regards,
-- 
Eric Chanudet <echanude@redhat.com>


