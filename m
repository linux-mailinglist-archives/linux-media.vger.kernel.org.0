Return-Path: <linux-media+bounces-31676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BA4AA89C1
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 00:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A153E1892D44
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 22:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E07C24887C;
	Sun,  4 May 2025 22:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zCPNMwB7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E861DDC3E
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 22:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746398546; cv=none; b=olL64IZL1peQtCfme4ocSxESPLJKH1w+bzMs6D7OpESNVSBiobPpHgLkNw9PRmi5xEx55K/7hVnbkU3avDQtW+E2AImXFyTnED8yuAxr9bSUWqhuPK19YgMfoAHgY8sPyzDmPf3YwcHJV86pazXdRHhNmItie/0h7MulU5d/ZG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746398546; c=relaxed/simple;
	bh=qh7v4iKytSvBhnNzPm/US2EOynFq0Kz2NyjqK3T9F5k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Y8L7/xy4BFgZqvyFd3ZIL8VBkQLvzuVyeN1582TTEDUi2pzStkCwL0r1BDsqhmeGl5I8KEf+mOrjxKVA5uevDqONn31J6h22KN+N7ulymiowsnJ1HKyhtTJg7XeeLMNhNhCBUdqoAX2104G8a9r7o2KZSBuBEmZjruuOAzkiS5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zCPNMwB7; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2254bdd4982so54655705ad.1
        for <linux-media@vger.kernel.org>; Sun, 04 May 2025 15:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746398544; x=1747003344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h2Ves7K5HSdZ8gJm7O2bxGfv8D+1P/iEs4NcrGFZQAU=;
        b=zCPNMwB7YoBlPuL4HJjlj6NHvoEb6db8fnR9gX0GLVPnwydsqeSZmqNP+hSzdvgRDS
         gMaqG1B3PdPIla4+KGaeCxt3roc8Cqmaah1zWvCmg+lyBbblGwqhv40yaEl5XeQJIjvl
         3UIsn+o9qnB9G1q8i1XORq8nNw9uWjzPdvQacJ3N7Jy+H9jwkB3APmBMD4tW1nHsme12
         EcEA5GgIsNPai3ZE4QCPvq95rn4eCs9bJ+3ppHfervgp76RNSplVsaZ2irxmTyNEJhJv
         idKwtqEpHf/thwbm9GCY/CV/D1AwrKzqKxs19yU6nuyKLoDrPuyTwg6Y6PO0NXuJeZji
         1aiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746398544; x=1747003344;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2Ves7K5HSdZ8gJm7O2bxGfv8D+1P/iEs4NcrGFZQAU=;
        b=o6AwNTrLm1bgysRstZvhDrHeq4jbuG1hKkxpCG/1/5K8P8kySa5EAY3gtiEv5GPrzW
         7DXMPPg9qhxw0XkkHA3S5KvQeCeHsd1T6tqN0o3ibZRsgTzRcFY2TjSu+YfaFj5hq9D3
         yMvG7Z/6Yt0kt3WdOA1W4RS8xo+0iyS/KOyRMvJBDxZhaE+3VSfxCIx0vM6wClrMQ31H
         UF8IoIxM2vGnsEwTt6W5Wdw2itVi8x+hw5yyJBMtMQV0TA6I1Gl+5bEAAWo81NTZbZcs
         gJb18sREt5yaxI+clU/8inFmdO/TgtdB/jQvhG3ncAD6UiboahR2uKE3nFv9j5rCpI0T
         4tHA==
X-Forwarded-Encrypted: i=1; AJvYcCUOn4o96UO7aKNsvVTYy7LgfJ0iURrDHHcE8lsfw9jpR2Ty/hv4FkHY15giWzMYXSflymzl3/cUc3dS0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9+TFtPmOKBQdZ5gy/Jhpw6/o8YM20oOG/PdslpMwXHjspbx3X
	bKC+dxn4o3a7SG69UfxTj3MT7yM+kRXjiJaRkenxQg/9J7QvoixvQkXV21iOzGD7MUBOGFJHLqF
	//oNc+WeOmcsPww==
X-Google-Smtp-Source: AGHT+IG3s83AHDeqTtbeNWFu9VJHl3WJY2PIPoEJXseXQ3szKVonPVO7le0fvgXadvoDti/xd87e1NfGDxlroAA=
X-Received: from plbmk14.prod.google.com ([2002:a17:903:2bce:b0:21f:4f0a:c7e2])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2350:b0:220:d078:eb33 with SMTP id d9443c01a7336-22e18c0dda7mr103753045ad.36.1746398543674;
 Sun, 04 May 2025 15:42:23 -0700 (PDT)
Date: Sun,  4 May 2025 22:41:36 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250504224149.1033867-1-tjmercier@google.com>
Subject: [PATCH v2 0/6] Replace CONFIG_DMABUF_SYSFS_STATS with BPF
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org, song@kernel.org, alexei.starovoitov@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, android-mm@google.com, simona@ffwll.ch, 
	corbet@lwn.net, eddyz87@gmail.com, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com, "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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
provides per-buffer info. The list has been moved outside of
CONFIG_DEBUG_FS scope so that it is always populated. The BPF program
loaded by userspace that extracts per-buffer information gets to define
its own interface which avoids the lack of ABI stability with debugfs.

As this is a replacement for our use of CONFIG_DMABUF_SYSFS_STATS, the
last patch is a RFC for removing it from the kernel. Please see my
suggestion there regarding the timeline for that.

[1] https://lore.kernel.org/linux-media/20201210044400.1080308-1-hridya@goo=
gle.com
[2] https://lore.kernel.org/all/20220516171315.2400578-1-tjmercier@google.c=
om

v1: https://lore.kernel.org/all/20250414225227.3642618-1-tjmercier@google.c=
om

v1 -> v2:
Make the DMA buffer list independent of CONFIG_DEBUG_FS per Christian K=C3=
=B6nig
Add CONFIG_DMA_SHARED_BUFFER check to kernel/bpf/Makefile per kernel test r=
obot
Use BTF_ID_LIST_SINGLE instead of BTF_ID_LIST_GLOBAL_SINGLE per Song Liu
Fixup comment style, mixing code/declarations, and use ASSERT_OK_FD in self=
test per Song Liu
Add BPF_ITER_RESCHED feature to bpf_dmabuf_reg_info per Alexei Starovoitov
Add open-coded iterator and selftest per Alexei Starovoitov
Add a second test buffer from the system dmabuf heap to selftests
Use the BPF program we'll use in production for selftest per Alexei Starovo=
itov
  https://r.android.com/c/platform/system/bpfprogs/+/3616123/2/dmabufIter.c
  https://r.android.com/c/platform/system/memory/libmeminfo/+/3614259/1/lib=
dmabufinfo/dmabuf_bpf_stats.cpp

T.J. Mercier (6):
  dma-buf: Rename and expose debugfs symbols
  bpf: Add dmabuf iterator
  bpf: Add open coded dmabuf iterator
  selftests/bpf: Add test for dmabuf_iter
  selftests/bpf: Add test for open coded dmabuf_iter
  RFC: dma-buf: Remove DMA-BUF statistics

 .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  24 --
 Documentation/driver-api/dma-buf.rst          |   5 -
 drivers/dma-buf/Kconfig                       |  15 -
 drivers/dma-buf/Makefile                      |   1 -
 drivers/dma-buf/dma-buf-sysfs-stats.c         | 202 --------------
 drivers/dma-buf/dma-buf-sysfs-stats.h         |  35 ---
 drivers/dma-buf/dma-buf.c                     |  58 +---
 include/linux/dma-buf.h                       |   6 +-
 kernel/bpf/Makefile                           |   3 +
 kernel/bpf/dmabuf_iter.c                      | 177 ++++++++++++
 kernel/bpf/helpers.c                          |   5 +
 .../testing/selftests/bpf/bpf_experimental.h  |   5 +
 tools/testing/selftests/bpf/config            |   3 +
 .../selftests/bpf/prog_tests/dmabuf_iter.c    | 258 ++++++++++++++++++
 .../testing/selftests/bpf/progs/dmabuf_iter.c |  91 ++++++
 15 files changed, 561 insertions(+), 327 deletions(-)
 delete mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
 delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
 delete mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
 create mode 100644 kernel/bpf/dmabuf_iter.c
 create mode 100644 tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c
 create mode 100644 tools/testing/selftests/bpf/progs/dmabuf_iter.c


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
--=20
2.49.0.906.g1f30a19c02-goog


