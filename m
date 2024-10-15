Return-Path: <linux-media+bounces-19655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1777899E395
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 12:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FA151C21EB1
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 10:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403DE1E1C33;
	Tue, 15 Oct 2024 10:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rRtQBcVY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFBDEC5
	for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728987456; cv=none; b=sffWgpUJY7q4PuYOdGnkflIbeoyO0L+daZqEjRVI8QiL36mJHuTXxtE+4iRKbFw+DzXHQae2TCLaCrPB5oDEU4m6/nlVUmPnk2xj3ycpoeeccIHI6/5wrGVdgK9WY/Oim73St7jo0a0UINWhkYoi93O26AEsPLhjRhgwMTXdW7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728987456; c=relaxed/simple;
	bh=VjXu4ypxNF+TX/Ebao0a04lHKDn4awtkjq2IJbq+oBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qvij+4l+IBlEyj+d6Tzh/MOT59e9QutCfo11pn6DwT11QrzAu5KPv30AmCyZax6k5ayoTGKJOSO1gCLBFK4ecdlt4HvEebEbc5a+YKaklPjSqUvQIUWFuiPDrcCBu8WsyLD7NaOM2ZGDKrn5gI/wimR8vj3d0Ye7+PdqAKrHh6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rRtQBcVY; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c97cc837c3so2715345a12.0
        for <linux-media@vger.kernel.org>; Tue, 15 Oct 2024 03:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728987453; x=1729592253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/vsiyFH7AdAG35W+mWfukPu7OxX/u28De0FB1ag7l3I=;
        b=rRtQBcVY4PdRa2FdyyZs5epU4PoBZVJOVZ2ZHB2/QlMVuDTYuFdpmu/8RDa8FzPjFe
         mZNf/LOFrIvGACj7jjnzVtjnJSqsUHtFougzTBT9d5UNCcMQsia/RNn+zJ5cTBoGfl6A
         zP0a04jhTWLZxjtfc57P9w5zJtCty15CTGBcIxEiywbOuEFXldWPXUN3nTjz6WVWEmNC
         4YTcYEUamA3OekxfQhccW7OpW8NKpiY6HMkgJcyivQC5SsFRyeUz5hbifP46i02sNX0q
         QDOQxruqKk/uOoza7c+fHN97lRUB7u7fG6VendN36RnhODdd90pzbXWxKywk2Pq1tdDU
         hCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728987453; x=1729592253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vsiyFH7AdAG35W+mWfukPu7OxX/u28De0FB1ag7l3I=;
        b=YGr0pqYE2spQnKU3DrdBYPiXmxXrPGWkqtLBVcepGnWeRyi5vP+1Dcfx7Sh9b/b0oX
         PM8VsgAZpoe8mVKzNJN6roh01o89R7fUSefHSxVE8yaVayMhpapOQkbQ54yYF5eKe3Zl
         Ww0d90SZrPkpRIxoDG30z9MsidEzYtoA/OrnO4GFpbm5PhEZit7a6gNMglJMKjbjVQVD
         mi9EbBK1Uzej0OhYMGAOW2SSh/m/oTuoy60XiD3Nz78WdTFJUwHUFpnkOyfGv5miNtRP
         Hgm1X3KM9sl+CxEpg68xTKA0Fk9YEpiFIC3YiQcNn4cCrAvatJKfjeU5J+3XMqtGFipL
         pKNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnIgHCsa9bLzLP9Y3w4YuKycpmwvcvPhZoL3i2ScixYkiqqTLezABjjRz2XU37byfO1M602wbF50RM9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxncFJ+oB0Fgylgl9lN6HzBFvmCXkqEOQFk+evBAa1r47roZnXu
	0K8Ynw5BaujKkve7KZZQLIvwIVfH98SgRMt0YBBdWNxkuQJtmjv/pnHapNXn4KA=
X-Google-Smtp-Source: AGHT+IFoSBcZrkiChgB4pqL7tE0eZfJ4KXAE8/CROlLVwwwfJ7xMioU8E2x8rJrk0YsmPXDwWauSdg==
X-Received: by 2002:a05:6402:43ce:b0:5c4:1320:e5a3 with SMTP id 4fb4d7f45d1cf-5c948cd8df1mr11041123a12.16.1728987452987;
        Tue, 15 Oct 2024 03:17:32 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d778b80sm519581a12.78.2024.10.15.03.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 03:17:32 -0700 (PDT)
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
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [RFC PATCH v2 0/2] TEE subsystem for restricted dma-buf allocations
Date: Tue, 15 Oct 2024 12:15:32 +0200
Message-ID: <20241015101716.740829-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch set allocates the restricted DMA-bufs via the TEE subsystem.
This a complete rewrite compared to the previous patch set [1], and other
earlier proposals [2] and [3] with a separate restricted heap.

The TEE subsystem handles the DMA-buf allocations since it is the TEE
(OP-TEE, AMD-TEE, TS-TEE, or a future QTEE) which sets up the restrictions
for the memory used for the DMA-bufs.

I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
DMA-bufs. This new IOCTL reaches the backend TEE driver, allowing it to
choose how to allocate the restricted physical memory.

TEE_IOC_RSTMEM_ALLOC is quite similar to TEE_IOC_SHM_ALLOC so it's tempting
to extend TEE_IOC_SHM_ALLOC with two new flags
TEE_IOC_SHM_FLAG_SECURE_VIDEO and TEE_IOC_SHM_FLAG_SECURE_TRUSTED_UI for
the same feature. However, it might be a bit confusing since
TEE_IOC_SHM_ALLOC only returns an anonymous file descriptor, but
TEE_IOC_SHM_FLAG_SECURE_VIDEO and TEE_IOC_SHM_FLAG_SECURE_TRUSTED_UI would
return a DMA-buf file descriptor instead. What do others think?

This can be tested on QEMU with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b prototype/sdp-v2
repo sync -j8
cd build
make toolchains -j4
make all -j$(nproc)
make run-only
# login and at the prompt:
xtest --sdp-basic

https://optee.readthedocs.io/en/latest/building/prerequisites.html
list dependencies needed to build the above.

The tests are pretty basic, mostly checking that a Trusted Application in
the secure world can access and manipulate the memory. There are also some
negative tests for out of bounds buffers etc.

Thanks,
Jens

[1] https://lore.kernel.org/lkml/20240830070351.2855919-1-jens.wiklander@linaro.org/
[2] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
[3] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/

Changes since the V1 RFC:
* Based on v6.11
* Complete rewrite, replacing the restricted heap with TEE_IOC_RSTMEM_ALLOC

Changes since Olivier's post [2]:
* Based on Yong Wu's post [1] where much of dma-buf handling is done in
  the generic restricted heap
* Simplifications and cleanup
* New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
  support"
* Replaced the word "secure" with "restricted" where applicable

Jens Wiklander (2):
  tee: add restricted memory allocation
  optee: support restricted memory allocation

 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/core.c          |  21 ++++
 drivers/tee/optee/optee_private.h |   6 +
 drivers/tee/optee/optee_smc.h     |  35 ++++++
 drivers/tee/optee/smc_abi.c       |  45 ++++++-
 drivers/tee/tee_core.c            |  33 ++++-
 drivers/tee/tee_private.h         |   2 +
 drivers/tee/tee_rstmem.c          | 200 ++++++++++++++++++++++++++++++
 drivers/tee/tee_shm.c             |   2 +
 drivers/tee/tee_shm_pool.c        |  69 ++++++++++-
 include/linux/tee_core.h          |   6 +
 include/linux/tee_drv.h           |   9 ++
 include/uapi/linux/tee.h          |  33 ++++-
 13 files changed, 455 insertions(+), 7 deletions(-)
 create mode 100644 drivers/tee/tee_rstmem.c

-- 
2.43.0


