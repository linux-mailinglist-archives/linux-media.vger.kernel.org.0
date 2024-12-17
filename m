Return-Path: <linux-media+bounces-23560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 854E69F487E
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 11:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 827151887842
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 10:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B591B1DFE00;
	Tue, 17 Dec 2024 10:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xlzEMGmD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF56C1DF257
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 10:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734430103; cv=none; b=g2/C7AX0fXATrE0Uydejr8v8s6svGAZ67W0BGTO0sZpK5lvLDNirBfAnGA4z3VMLuxD8fLpDqKesvqiQy2FKEYxWMlJ6PBCqNEPDN1lh1ROhM0Y5nSb6GvV65V08kFoJK8yl8B9ULNDevGLaOhJReC0gokkdFRCasMDBoNpYRqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734430103; c=relaxed/simple;
	bh=d15E3pJA9hmh7lDm6J25ExDrn0giWWob9vHhL0cNU4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nOSIizpDoMj2s6GhHvNJYn7WW1SaQfQGvAL8ZadxrsN7FrdBeXgYVVwfAI3k8JnPA9WGy87/FE3INaM96+Im0ooTD0cthN3kf1CarPNIPAOeb8zIGB39CxfTMurV+fH78NWDudx5/pz+BxyR6kmWIBl7M0swrMfs1lmaqBv+524=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xlzEMGmD; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3023c51146cso50308411fa.1
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 02:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734430098; x=1735034898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AYCRMSX++86+KnqMpmtjVu7Tiu/JgIj/lkT3HzDUCoc=;
        b=xlzEMGmDFbbWvR0NB+bNgv4JkezmUXvK03ZYHBnvKnHm89+shCA+KkVfEtbUaennIo
         vHS3heddEHZ0cwmADd40BI73l9oAGrjTu56nhYuSx//6rLcibP4etjJUVxwkjGnSWtXi
         IByKHswX3ysymKCmf0r6tv5cjaxz1t1lded3m/Bh5Hjz3iVVJffD9ZijwPO28JSaluUJ
         2Qb3E2dSi5cDQQLrHkTowoepymloiBQJj68Da863M0AE9mYeJRquIESCyZcTqFgNjoG0
         CDXEEIvXylW6Ato123mO2AKNHxAvldnTr1HPIPE70P0c2YuvVDCz2UyvmZwDuz3PC2x1
         Q/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734430098; x=1735034898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYCRMSX++86+KnqMpmtjVu7Tiu/JgIj/lkT3HzDUCoc=;
        b=Pt0V9ZUtqbz1E+ONG1sYcgiyu2pC0vz71uTb/ZSitLxI7WQKqhIH0kL24LLctzenwU
         OrfCqw9+ye76GKYMahY0et3LOHTagvJ0I0mKPBgaj1xLh3P/FGdlMjZLbIg4CgbNKpGo
         1lPe9W4GdJXJfV7sGJaVDnXCTnfVG7RITeQ3fNijk+b5DP3rHVFFoyTXyQTfG1O4pco7
         gQxMyYE5yZWkzq7uxOjNqqEkj8r9OfaTvpbPDJDNwIJXsw2/d333auiOOby7E6DxXMsP
         sjyEv+OiGettG5RCd0xFNeAECu7kXtakMfM7RAnR4ihZ/qN0nkqHz2cvjmFHIecWBxDq
         NlyA==
X-Forwarded-Encrypted: i=1; AJvYcCVJLLr8cWfWtg+rxhGkW7MLolZGsJTeNXsdx6AASIyGczDOv6iJ1gt46ce26pfubIE/3suBEV7X3G9arQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmI8jjKBuuRMdFS0mZa3zTVr2djUHDImXUu0Gvcjyvf68Mroji
	BdJv/9y3dVG71i6Ut0YdfPQdqRb3Sg13rBvaj76kerOeDWTnEN9JS8QQzDG+p+k=
X-Gm-Gg: ASbGncvrUzhXyFpunN9H6Ffz9Dv3N5PHWHLXjSoENs5Rrmekj+plv6zgQc5kp1pvZ1q
	ImwTo3bStJaxHZCpS2OTjegfoqGD3soLUVkijtkPbsHRRnhrA0JQWoV2zml0p11s1QkbTCRU0HZ
	F37QrUczQMv8iROfE6snuKHizPVaHVPyB+4j6rQYKYYvv9Kbkp7vTbkfoVHyGUkZzciXPiqpudj
	PLGlyfcOTzPvlil5f2HtGs6oVOdwgygkrABUfjkEl5Uimw3+LpDBARinuG1MHRaQ3ab4yS/qaZL
	PQjD7vrZws3M2PyWqU3ot3Boi6Z69EYGEw==
X-Google-Smtp-Source: AGHT+IHZU/IgRazPzMt1BTv+XPB01kJYHZQYFJnvwgpeo9BxmS7vAECnkhvSmQ/NjPskK0oQHygtHA==
X-Received: by 2002:a2e:a546:0:b0:300:3307:389f with SMTP id 38308e7fff4ca-304441a4d58mr7622151fa.0.1734430097840;
        Tue, 17 Dec 2024 02:08:17 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441a69ecsm12122681fa.111.2024.12.17.02.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 02:08:17 -0800 (PST)
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
Subject: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
Date: Tue, 17 Dec 2024 11:07:36 +0100
Message-ID: <20241217100809.3962439-1-jens.wiklander@linaro.org>
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

The TEE subsystem handles the DMA-buf allocations since it is the TEE
(OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QCOMTEE) which sets up the
restrictions for the memory used for the DMA-bufs.

I've added a new IOCTL, TEE_IOC_RSTMEM_ALLOC, to allocate the restricted
DMA-bufs. This IOCTL reaches the backend TEE driver, allowing it to choose
how to allocate the restricted physical memory.

TEE_IOC_RSTMEM_ALLOC takes in addition to a size and flags parameters also
a use-case parameter. This is used by the backend TEE driver to decide on
allocation policy and which devices should be able to access the memory.

Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
Recording) has been identified so far to serve as examples of what can be
expected. More use-cases can be added in userspace ABI, but it's up to the
backend TEE drivers to provide the implementation.

Each use-case has it's own restricted memory pool since different use-cases
requires isolation from different parts of the system. A restricted memory
pool can be based on a static carveout instantiated while probing the TEE
backend driver, or dynamically allocated from CMA and made restricted as
needed by the TEE.

This can be tested on QEMU with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b prototype/sdp-v4
repo sync -j8
cd build
make toolchains -j$(nproc)
make SPMC_AT_EL=1 all -j$(nproc)
make SPMC_AT_EL=1 run-only
# login and at the prompt:
xtest --sdp-basic

The SPMC_AT_EL=1 parameter configures the build with FF-A and an SPMC at
S-EL1 inside OP-TEE. The parameter can be changed into SPMC_AT_EL=n to test
without FF-A using the original SMC ABI instead. Please remember to do
%rm -rf ../trusted-firmware-a/build/qemu
for TF-A to be rebuilt properly using the new configuration.

https://optee.readthedocs.io/en/latest/building/prerequisites.html
list dependencies needed to build the above.

The tests are pretty basic, mostly checking that a Trusted Application in
the secure world can access and manipulate the memory. There are also some
negative tests for out of bounds buffers etc.

Thanks,
Jens

Changes since V3:
* Make the use_case and flags field in struct tee_shm u32's instead of
  u16's
* Add more description for TEE_IOC_RSTMEM_ALLOC in the header file
* Import namespace DMA_BUF in module tee, reported by lkp@intel.com
* Added a note in the commit message for "optee: account for direction
  while converting parameters" why it's needed
* Factor out dynamic restricted memory allocation from
  "optee: support restricted memory allocation" into two new commits
  "optee: FF-A: dynamic restricted memory allocation" and
  "optee: smc abi: dynamic restricted memory allocation"
* Guard CMA usage with #ifdef CONFIG_CMA, effectively disabling dynamic
  restricted memory allocate if CMA isn't configured

Changes since the V2 RFC:
* Based on v6.12
* Replaced the flags for SVP and Trusted UID memory with a u32 field with
  unique id for each use case
* Added dynamic allocation of restricted memory pools
* Added OP-TEE ABI both with and without FF-A for dynamic restricted memory
* Added support for FF-A with FFA_LEND

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

Jens Wiklander (6):
  tee: add restricted memory allocation
  optee: account for direction while converting parameters
  optee: sync secure world ABI headers
  optee: support restricted memory allocation
  optee: FF-A: dynamic restricted memory allocation
  optee: smc abi: dynamic restricted memory allocation

 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/call.c          |  10 +-
 drivers/tee/optee/core.c          |   1 +
 drivers/tee/optee/ffa_abi.c       | 178 +++++++++++++-
 drivers/tee/optee/optee_ffa.h     |  27 ++-
 drivers/tee/optee/optee_msg.h     |  65 ++++-
 drivers/tee/optee/optee_private.h |  75 ++++--
 drivers/tee/optee/optee_smc.h     |  71 +++++-
 drivers/tee/optee/rpc.c           |  31 ++-
 drivers/tee/optee/rstmem.c        | 388 ++++++++++++++++++++++++++++++
 drivers/tee/optee/smc_abi.c       | 213 ++++++++++++++--
 drivers/tee/tee_core.c            |  38 ++-
 drivers/tee/tee_private.h         |   2 +
 drivers/tee/tee_rstmem.c          | 201 ++++++++++++++++
 drivers/tee/tee_shm.c             |   2 +
 drivers/tee/tee_shm_pool.c        |  69 +++++-
 include/linux/tee_core.h          |  15 ++
 include/linux/tee_drv.h           |   2 +
 include/uapi/linux/tee.h          |  44 +++-
 20 files changed, 1358 insertions(+), 76 deletions(-)
 create mode 100644 drivers/tee/optee/rstmem.c
 create mode 100644 drivers/tee/tee_rstmem.c


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.43.0


