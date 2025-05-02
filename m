Return-Path: <linux-media+bounces-31560-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D009CAA6E96
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 12:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78CD71BA7FFE
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 10:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD07D21C18D;
	Fri,  2 May 2025 10:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IwuLGKIl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D910F21FF56
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180057; cv=none; b=S777kYOW5CAPihnE4DtIBE7fj2OddoC9+9/5WYl/1k/L6Gmwi63oB4EsbqmxjkdHxeyYcLpyLPCXvRYrcbvCgknew3Ffm8bQVDf9dOhmp/bShHN955/JCgNbnW7g8jlDKwOy2lvS05BPGsLPdoWhagoka3dBJvF71Ozczp6HABM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180057; c=relaxed/simple;
	bh=D/JJ4qOSeo4yHB1DLkoJZrzzQSLd4yo6KqCy5jfCsAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PPu96Lsw+Y5eyYmYWCKqh+YdM+XLO2ilH/YWYDgUnSv8A/TNGfnsHj5NN6kyU1/hz72aYA492y12UmFtnOVn33UrEvRmAL7XTkJ15q3Oylt30/TD0FfYgBMcz15FT04GlvXQ4bdCIoNQKUqFXOSmYe51LXXn/DGt9Mqc3Ibin8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IwuLGKIl; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acacb8743a7so323949966b.1
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 03:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180053; x=1746784853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7s0K4WHliGKFdPFhl8MQS72UtHPv10vOZ0g0k2aEl9I=;
        b=IwuLGKIlHoXJNIUAW34/YNCJJo4WLFJBAc+CUam833HTbOrxRD75CuYrrhsCckwzQX
         Y2ca4VlOHV+AhHEUlEPCRF+VekCOMC26sJI9yBeO3BEF74VuTqksQpcjRlTrz2OzqpmQ
         FdUjNTNooUMCUwpDzg5rA5zmbHrbJNaw/V30M7C+G3nyxdjVslO6++M/C0v7AMoY+4Jl
         c4N+LESvmmbCvgmasUmL3D13+2vf+E1C32F7eMImd1fiRDDhOC0uV2eszdLrZrgOnQ2K
         C1oKIANzw+wOPucpUji8m76xXpgXCERqBhuTD54M/w7HHISrgVolpxWkJT3IYRMOvHkN
         cr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180053; x=1746784853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7s0K4WHliGKFdPFhl8MQS72UtHPv10vOZ0g0k2aEl9I=;
        b=ePAIakXVZKmV/K5xcrKn+W03lQxSWfcjABWtVlx1yfFuv4x/rm0LlNWoMzv+fXZwhk
         ewv3lQYz/BsGP8nyU3W/t7OBxs3WT2MsujzsAlya7O+3WeyAYMSUgbVJNpoAusEjsbxE
         7hcJlog9bWDE+qbP7p2vM02UkrkoJtS3+W5jyReL8C9Nt+IS3EILBUv00p+MD2Av2VWx
         1JP0B5kXX090KyzqJL5ozTeAR3jCKp5OEBBpIATfWJcz1GzC+8x/H50Go/4vNB0yHBXH
         E6jmc4a/8qC2pb3X6BgwVIRERwIfPdyByfDQZknFCJ5ApuIkdKJwEhDBwTEcyAZrbiUA
         0qOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5dYR2SWjEeLCwbTNEHTXL/c7OulJJ45vQrsKSHjRVNw5Jg8NrfJfE0g2e3r2W4ZLfexVfggYyonYh0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yze4g0s7fsYHsJ2ucObPF2Oy9mulSPk0GfkQK07mYuCbrPBK1gF
	+J4HdlzwYAfibHLPh/UjiuSzolUVEbDuTCcyGSmIJPp3K1hPI7D5GxP8RTWgxRg=
X-Gm-Gg: ASbGncsVNNrRb/NsupQeRN1WfELr9m80xM/ylVPI89/urni10FGEnQDgEt3qYEFvjx9
	e5pmewOsAjyRxO0iida9v9/CUpMT81QOv4EyRAbE9XA+X5n+IqkkVEVKxYXkV+kdzRrBpIrfjhu
	ZsowZkOTBLxD/DQtoucQbL7qxRn7V5+ISXvRdNDgo+MUelBKaAMLzGTjvlpiZl0E5mjz5w4klbf
	kRJKkTo/XqQh6AZdWGy8kzA+jqwucWLV6JKD3KnuEuFR4KjsQij6sSGnbw9MHqKnaXxG7nMba32
	49HVsjaPwTJ8miXIgif9U0kYvCCjf7oQfihbD7uI6Q71nEdy8oWA4uh5B5rnsPs5Ygs7gwOWydN
	+hibD6MGLHd6+Qq5IlkU+yhZmv9Zp
X-Google-Smtp-Source: AGHT+IFVQ05Wy19uhQgm3WGFHmkjNDkU/CkOZ/JefCJgyEqixW3GP1YNcmydW/OHUj5KILxYfZoE8Q==
X-Received: by 2002:a17:907:6e87:b0:ace:4ed9:a8c3 with SMTP id a640c23a62f3a-ad17ad876e4mr209631266b.7.1746180052767;
        Fri, 02 May 2025 03:00:52 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:00:52 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v8 00/14] TEE subsystem for protected dma-buf allocations
Date: Fri,  2 May 2025 11:59:14 +0200
Message-ID: <20250502100049.1746335-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch set allocates the protected DMA-bufs from a DMA-heap
instantiated from the TEE subsystem.

The TEE subsystem handles the DMA-buf allocations since it is the TEE
(OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QTEE) which sets up the
protection for the memory used for the DMA-bufs.

The DMA-heap uses a protected memory pool provided by the backend TEE
driver, allowing it to choose how to allocate the protected physical
memory.

The allocated DMA-bufs must be imported with a new TEE_IOC_SHM_REGISTER_FD
before they can be passed as arguments when requesting services from the
secure world.

Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
Recording) has been identified so far to serve as examples of what can be
expected. The use-cases has predefined DMA-heap names,
"protected,secure-video", "protected,trusted-ui", and
"protected,secure-video-record". The backend driver registers protected
memory pools for the use-cases it supports.

Each use-case has it's own protected memory pool since different use-cases
requires isolation from different parts of the system. A protected memory
pool can be based on a static carveout instantiated while probing the TEE
backend driver, or dynamically allocated from CMA and made protected as
needed by the TEE.

This can be tested on a RockPi 4B+ with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m rockpi4.xml \
        -b prototype/sdp-v8
repo sync -j8
cd build
make toolchains -j$(nproc)
make all -j$(nproc)
# Copy ../out/rockpi4.img to an SD card and boot the RockPi from that
# Connect a monitor to the RockPi
# login and at the prompt:
gst-launch-1.0 videotestsrc ! \
        aesenc key=1f9423681beb9a79215820f6bda73d0f \
                iv=e9aa8e834d8d70b7e0d254ff670dd718 serialize-iv=true ! \
        aesdec key=1f9423681beb9a79215820f6bda73d0f ! \
        kmssink

The aesdec module has been hacked to use an OP-TEE TA to decrypt the stream
into protected DMA-bufs which are consumed by the kmssink.

The primitive QEMU tests from previous patch set can be tested on RockPi
in the same way with:
xtest --sdp-basic

The primitive test are tested on QEMU with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b prototype/sdp-v8
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

Changes since V7:
* Adding "dma-buf: dma-heap: export declared functions",
  "cma: export cma_alloc() and cma_release()", and
  "dma-contiguous: export dma_contiguous_default_area" to export the symbols
  needed to keep the TEE subsystem as a load module.
* Removing CONFIG_TEE_DMABUF_HEAP and CONFIG_TEE_CMA since they aren't
  needed any longer.
* Addressing review comments in "optee: sync secure world ABI headers"
* Better align protected memory pool initialization between the smc-abi and
  ffa-abi parts of the optee driver.

Changes since V6:
* Restricted memory is now known as protected memory since to use the same
  term as https://docs.vulkan.org/guide/latest/protected.html. Update all
  patches to consistently use protected memory.
* In "tee: implement protected DMA-heap" add the hidden config option
  TEE_DMABUF_HEAP to tell if the DMABUF_HEAPS functions are available
  for the TEE subsystem
* Adding "tee: refactor params_from_user()", broken out from the patch
  "tee: new ioctl to a register tee_shm from a dmabuf file descriptor"
* For "tee: new ioctl to a register tee_shm from a dmabuf file descriptor":
  - Update commit message to mention protected memory
  - Remove and open code tee_shm_get_parent_shm() in param_from_user_memref()
* In "tee: add tee_shm_alloc_cma_phys_mem" add the hidden config option
  TEE_CMA to tell if the CMA functions are available for the TEE subsystem
* For "tee: tee_device_alloc(): copy dma_mask from parent device" and
  "optee: pass parent device to tee_device_alloc", added
  Reviewed-by: Sumit Garg <sumit.garg@kernel.org>

Changes since V5:
* Removing "tee: add restricted memory allocation" and
  "tee: add TEE_IOC_RSTMEM_FD_INFO"
* Adding "tee: implement restricted DMA-heap",
  "tee: new ioctl to a register tee_shm from a dmabuf file descriptor",
  "tee: add tee_shm_alloc_cma_phys_mem()",
  "optee: pass parent device to tee_device_alloc()", and
  "tee: tee_device_alloc(): copy dma_mask from parent device"
* The two TEE driver OPs "rstmem_alloc()" and "rstmem_free()" are replaced
  with a struct tee_rstmem_pool abstraction.
* Replaced the the TEE_IOC_RSTMEM_ALLOC user space API with the DMA-heap API

Changes since V4:
* Adding the patch "tee: add TEE_IOC_RSTMEM_FD_INFO" needed by the
  GStreamer demo
* Removing the dummy CPU access and mmap functions from the dma_buf_ops
* Fixing a compile error in "optee: FF-A: dynamic restricted memory allocation"
  reported by kernel test robot <lkp@intel.com>

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



Etienne Carriere (1):
  tee: new ioctl to a register tee_shm from a dmabuf file descriptor

Jens Wiklander (13):
  tee: tee_device_alloc(): copy dma_mask from parent device
  optee: pass parent device to tee_device_alloc()
  optee: account for direction while converting parameters
  optee: sync secure world ABI headers
  dma-buf: dma-heap: export declared functions
  tee: implement protected DMA-heap
  tee: refactor params_from_user()
  cma: export cma_alloc() and cma_release()
  dma-contiguous: export dma_contiguous_default_area
  tee: add tee_shm_alloc_cma_phys_mem()
  optee: support protected memory allocation
  optee: FF-A: dynamic protected memory allocation
  optee: smc abi: dynamic protected memory allocation

 drivers/dma-buf/dma-heap.c        |   3 +
 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/call.c          |  10 +-
 drivers/tee/optee/core.c          |   1 +
 drivers/tee/optee/ffa_abi.c       | 198 ++++++++++++-
 drivers/tee/optee/optee_ffa.h     |  27 +-
 drivers/tee/optee/optee_msg.h     |  83 +++++-
 drivers/tee/optee/optee_private.h |  55 +++-
 drivers/tee/optee/optee_smc.h     |  69 ++++-
 drivers/tee/optee/protmem.c       | 330 +++++++++++++++++++++
 drivers/tee/optee/rpc.c           |  31 +-
 drivers/tee/optee/smc_abi.c       | 191 ++++++++++--
 drivers/tee/tee_core.c            | 157 +++++++---
 drivers/tee/tee_heap.c            | 470 ++++++++++++++++++++++++++++++
 drivers/tee/tee_private.h         |  16 +
 drivers/tee/tee_shm.c             | 164 ++++++++++-
 include/linux/tee_core.h          |  70 +++++
 include/linux/tee_drv.h           |  10 +
 include/uapi/linux/tee.h          |  31 ++
 kernel/dma/contiguous.c           |   1 +
 mm/cma.c                          |   2 +
 22 files changed, 1789 insertions(+), 132 deletions(-)
 create mode 100644 drivers/tee/optee/protmem.c
 create mode 100644 drivers/tee/tee_heap.c


base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
-- 
2.43.0


