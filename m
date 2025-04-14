Return-Path: <linux-media+bounces-30200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5944A88F8A
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 00:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 399893A6629
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 22:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102961F4187;
	Mon, 14 Apr 2025 22:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YTauXnyL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1041B9831
	for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 22:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744671166; cv=none; b=L+thRqKfdsofbdGDh7hbwBrv6QwmWNAw8PNrv0leym+jr7CAiyqpne38isigR8/g0ezZNls44HTCP/8x1jvu56IxZR7qCNT25D8GKLqJIYceW8baNv8GdMncHd0B2+FUVwSU3pyMzsVA/qfwvuKDh+LkCfWsWqfqplK8CtARNX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744671166; c=relaxed/simple;
	bh=DXp2kkpKK/EYqS0S987rmP7LN93yWyxy4no1bYoxMA8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=avmmv10y0fsUxxBhYZy3mQrt0p+Ainue+LwItNIscwTKCRli2CKapo4vEXHi9hYBcjoRjtUrNj6OJUwoeUKRRo1SbQvL8L3RqmmSKBBcJPSSHjXVq4GofrAkV7BH1ybK0rTw4UQKbBPUaZ0F/lg/NVZqaDs9ZrFEhHb43x+1mbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YTauXnyL; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3032ea03448so4489425a91.2
        for <linux-media@vger.kernel.org>; Mon, 14 Apr 2025 15:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744671164; x=1745275964; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=togwTMsUrCvDnQk9l1lLNxbmxkHmbN4j0HA8wPGqV8E=;
        b=YTauXnyL1oNuf6bf+pOU3j+VR6jOrmOUffUhKe8/hBY39zGKg6vvwm2im5nBaSSvNW
         XKn41Io3DyO+I6LjrDD35PM6amJ/8FPQyCZKSw9CiJIfkC36kidWvvpfUxgPTm+jrsgY
         mrgH7pzTOsGR3aX0dJ/ucjwRZgfaJdcuCjqGHUm3SjsJXyt6tBe8DLAApz5S74Zto1sP
         w/eq9NGQEz2wtbt90GtS6sOrcrw9Xs9xcbEbUr/KSLDODJQEWljjKFvUpMJtcEGLb+Nb
         PWiXMNkIcP8L0YucefatIP5NZiw8Sji/tkmPerc46S5A6gz5Jtg1c+L+lMLlg9x6xjSv
         1iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744671164; x=1745275964;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=togwTMsUrCvDnQk9l1lLNxbmxkHmbN4j0HA8wPGqV8E=;
        b=NF7/2cZNnHSaTLiQ31QylKzxZBSv277pC4Kzz6gZqrYDKUa3Qf+nUOJc/HbRAuwGN7
         7j1bryLX+8o+ntw2JTM61wM/oABMY5fi/lBIC4TBnJ9WcN/JMnBHN9T8W6j2IazVPrl5
         kguRK7kmbK9Id/nHF6KwmCoYtr/ZwYbXJ0DUZ0/vslNIiiWypDd7YGs9C9uXGo2Cmgjm
         vZ1+mYFAS0m7RvI5IvoHFK05rGTJszqK2APjbfooivS4rqqohzIw1vbB7kpgzM88CsSo
         0sGo8N/8nDJNZu/VarUDLBoMJ1MygNjjo3h2NyHUvyq6kiYPJKG6MWnTHpLKe9+gmHkh
         YYog==
X-Forwarded-Encrypted: i=1; AJvYcCWLhfZ/v8yeGHjaJqzsNt1jC1lsDi4jfVRAW55EWytFB7v3lg0sFtBF50HNRkV4ZRwKhZcb9N/fprlLzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQIICreGO57e4zDom0Jljmutd+/ZP58gvb4P3EABvnqaPnUXhy
	WsTmwOayIOjPUp2NRd5uOJCXCnBZINV2FrbuLPpyYYw6y82+C+oKwioGPq321K0p5fsWQyF2Z+G
	YTgyXYzsYt2CjFw==
X-Google-Smtp-Source: AGHT+IEVzbizS5bwIONCCb0BiftDU4fhMTk3w7cU8mlcfeirhwdZn8Tcrol5ikyaUqfRuPhfJrQ0elLNwB7pMag=
X-Received: from pjtq5.prod.google.com ([2002:a17:90a:c105:b0:305:2d68:2be6])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5242:b0:2fa:1a23:c01d with SMTP id 98e67ed59e1d1-3082367497dmr18231328a91.21.1744671164151;
 Mon, 14 Apr 2025 15:52:44 -0700 (PDT)
Date: Mon, 14 Apr 2025 22:52:23 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250414225227.3642618-1-tjmercier@google.com>
Subject: [PATCH 0/4] Replace CONFIG_DMABUF_SYSFS_STATS with BPF
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, android-mm@google.com, simona@ffwll.ch, 
	corbet@lwn.net, eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com, "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

Until CONFIG_DMABUF_SYSFS_STATS was added [1] it was only possible to
perform per-buffer accounting with debugfs which is not suitable for
production environments. Eventually we discovered the overhead with
per-buffer sysfs file creation/removal was significantly impacting
allocation and free times, and exacerbated kernfs lock contention. [2]
dma_buf_stats_setup() is responsible for 39% of single-page buffer
creation duration, or 74% of single-page dma_buf_export() duration when
stressing dmabuf allocations and frees.

I prototyped a change from per-buffer to per-exporter statistics with a
RCU protected list of exporter allocations that accommodates most (but
not all) of our use-cases and avoids almost all of the sysfs overhead.
While that adds less overhead than per-buffer sysfs, and less even than
the maintenance of the dmabuf debugfs_list, it's still *additional*
overhead on top of the debugfs_list and doesn't give us per-buffer info.

This series uses the existing dmabuf debugfs_list to implement a BPF
dmabuf iterator, which adds no overhead to buffer allocation/free and
provides per-buffer info. While the kernel must have CONFIG_DEBUG_FS for
the dmabuf_iter to be available, debugfs does not need to be mounted.
The BPF program loaded by userspace that extracts per-buffer information
gets to define its own interface which avoids the lack of ABI stability
with debugfs (even if it were mounted).

As this is a replacement for our use of CONFIG_DMABUF_SYSFS_STATS, the
last patch is a RFC for removing it from the kernel. Please see my
suggestion there regarding the timeline for that.

[1] https://lore.kernel.org/linux-media/20201210044400.1080308-1-hridya@google.com/
[2] https://lore.kernel.org/all/20220516171315.2400578-1-tjmercier@google.com/

T.J. Mercier (4):
  dma-buf: Rename and expose debugfs symbols
  bpf: Add dmabuf iterator
  selftests/bpf: Add test for dmabuf_iter
  RFC: dma-buf: Remove DMA-BUF statistics

 .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  24 ---
 Documentation/driver-api/dma-buf.rst          |   5 -
 drivers/dma-buf/Kconfig                       |  15 --
 drivers/dma-buf/Makefile                      |   1 -
 drivers/dma-buf/dma-buf-sysfs-stats.c         | 202 ------------------
 drivers/dma-buf/dma-buf-sysfs-stats.h         |  35 ---
 drivers/dma-buf/dma-buf.c                     |  40 +---
 include/linux/btf_ids.h                       |   1 +
 include/linux/dma-buf.h                       |   6 +
 kernel/bpf/Makefile                           |   3 +
 kernel/bpf/dmabuf_iter.c                      | 130 +++++++++++
 tools/testing/selftests/bpf/config            |   1 +
 .../selftests/bpf/prog_tests/dmabuf_iter.c    | 116 ++++++++++
 .../testing/selftests/bpf/progs/dmabuf_iter.c |  31 +++
 14 files changed, 299 insertions(+), 311 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
 delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
 delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
 create mode 100644 kernel/bpf/dmabuf_iter.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
 create mode 100644 tools/testing/selftests/bpf/progs/dmabuf_iter.c

-- 
2.49.0.604.gff1f9ca942-goog


