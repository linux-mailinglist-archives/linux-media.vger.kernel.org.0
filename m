Return-Path: <linux-media+bounces-42339-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A38B53467
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 15:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93BAB1C867A2
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 13:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BA232C316;
	Thu, 11 Sep 2025 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d5tI2AT4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E1331B833
	for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757598619; cv=none; b=ndgeT3q9ARVVOwnLF93CrX+7wxFO+lv9u9etfCtgXcItlB8kOWLL+jO7JyC3Ru1E18ADSTv5+2VSpdCfo7eF7z7cb73kfFgB9dIWrj1scJk5EV+JpQ8bfFqcnM8RTPcjTMRSOp2lhcI1zaVZEo7p+RqMNk975YdYEWAnxMslU9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757598619; c=relaxed/simple;
	bh=ECNQLxfGTCC9DVZMFEam8vduzlcET70jCXP3eI0kdXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=alWINgQetCYLdmkR0c5WEn8Heb5iIydK9dK3npofYm5QFjOAqTDZtQRhHua8xm1qdBJICX+2eqhxFHDmlA/RAL5gzv3qEPiNMAFU0k+dMRqtapalaV4HBUWgcm5cgwde5r0ZVnN1mJxRn97xZ5NDveEM7oKTgMy1QsPfVcIX/yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d5tI2AT4; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e96e5535fcdso1767098276.1
        for <linux-media@vger.kernel.org>; Thu, 11 Sep 2025 06:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757598616; x=1758203416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JtDMUhbai62kxq3n8kKo67cCRGiyz/FmvNZNSwA/DhQ=;
        b=d5tI2AT4BK9gqisvhrYd8S5CNS6pJpBumoijIxtbJ+JwKvvSkQwSpORuyMZ1EWPD+M
         TRf/8AnXUvx5Zboi9+F0DyQjpy8Fo4v3LtvXTdNIqj+u4ffHyIQfQ+oYYs3wA8QH+Xn+
         W39IQGjHAUm60WmP26gsVCr0kyNl9wDSGmoa5Y6Kh7A2oeLakbef2/bINLP+WqmuOj0Q
         44zFmLhZ//4w7pIH+InFPQBtb4isJvdmLfHsKGPNknilTv/TPARCkmo4XqPAIcXDBhwe
         gECsdgbklJAMhdWXBSwfS2LTDdnicfD1G9WTH0YXX5ssrVM2BIJhRTMF+dw8UybkZ8+v
         Rl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598616; x=1758203416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtDMUhbai62kxq3n8kKo67cCRGiyz/FmvNZNSwA/DhQ=;
        b=mfpHCXPdyiHAA1OI5u6hQCrhfvVXeZveeS5+G2Qkb+t3mxSC11Oy+/1i9jQFKBQJTk
         goge6Y8w2onk2KmP9tMxHK9GgEkt7AwYfUfJ81wKEuIq0dwLgUc3uUqwI5CwJmKM6+LL
         OG/3lo53SEmddgYFaAq0TjfOCTElutse2AMSEiKKlcfdcwzEs3vFT2jkwUipeZMCoAQd
         BuFZEPRydnCSiEDleQ8BtPZRG64U1LBxBK5KUnyPkYLyvpbxkg7+MlYBYw+b6sBKtJXD
         QVq+AWe1HfK41s6kqGWO61xEALQnDV/LsI1mA8eWahJ7hSMx9fLQJEtPciBTMPLEJReS
         DsuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVskYn8SBnjDebvWvUR1iwImL+IdS/XIVgidKjn6/VLquX+TX6KYSz1NppeUkRyHm+/oYmlglphQ9G9UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVUfap20OEdFc/hCWHleA2rP41c+u/I/DSLqsihMVfewaelF/G
	fpEYXm4r/33Jc7OoIsnlPKXJ94ZosJa6+CNcZSixiI8JxBrXeNEkWxbr5SseDADX9Eg=
X-Gm-Gg: ASbGnct17g8q344AgXuQQZJ9v16J1fNNZMBNUxK/jNQ46DE/8x0epmu54s3RBTYeUnM
	eK0WELZF7Gh/fI4uLj2elnQrM/bMS6xxjQ0hspSPQNmKjjw2I0e5pwUbSVmZd5+BnWe7kUAa9FI
	k5Mwcm37e2BkhEA1KOevZ2E5pw+iJ1sln/a41dyZ3Doav87RVqxORXRwwmUnhK1N4wY4y6DO+yP
	QWAi92n5aXMpal/OKc6xbAPaQBTUoUgt7nwW2Zl0qYAKcR21fUNH8rKkG+1rO59xsSV0OAP/lrX
	YuKpl3RU/wRkGllNVRJPoTZEzg4CQc5LLzuYqhte37K4nEAoOVzLDmxH5XEgeweSQ6smr0lJYgD
	aTCR8MuMa13D75EMdBcdj6cZk+dwW1wsB6vavpFsL97iZG7gGpOKsQjX2etj0pxOgBqiCC8HXg5
	PAXAqKR2BLQ+4vy+0jtq9L
X-Google-Smtp-Source: AGHT+IHbfoA81dXA4GxjWQ56zMxLZWMAIRCEmHjjVIDkGG/G1uhNR5mpx/anEbv76JrIjHUHGGPFSQ==
X-Received: by 2002:a05:690e:1553:10b0:622:66fb:f243 with SMTP id 956f58d0204a3-6233c3b9cedmr2754702d50.13.1757598616061;
        Thu, 11 Sep 2025 06:50:16 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f7623434csm3526257b3.11.2025.09.11.06.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:50:14 -0700 (PDT)
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
	robin.murphy@arm.com,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v12 0/9] TEE subsystem for protected dma-buf allocations
Date: Thu, 11 Sep 2025 15:49:41 +0200
Message-ID: <20250911135007.1275833-1-jens.wiklander@linaro.org>
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
Recording) have been identified so far to serve as examples of what can be
expected. The use-cases have predefined DMA-heap names,
"protected,secure-video", "protected,trusted-ui", and
"protected,secure-video-record". The backend driver registers protected
memory pools for the use-cases it supports.

Each use-case has its own protected memory pool since different use-cases
require isolation from different parts of the system. A protected memory
pool can be based on a static carveout instantiated while probing the TEE
backend driver, or dynamically allocated from CMA (dma_alloc_pages()) and
made protected as needed by the TEE.

This can be tested on a RockPi 4B+ with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m rockpi4.xml \
        -b prototype/sdp-v12
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

The primitive QEMU tests from previous patch sets can be tested on RockPi
in the same way using:
xtest --sdp-basic

The primitive tests are tested on QEMU with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b prototype/sdp-v12
repo sync -j8
cd build
make toolchains -j$(nproc)
make SPMC_AT_EL=1 all -j$(nproc)
make SPMC_AT_EL=1 run-only
# login and at the prompt:
xtest --sdp-basic

The SPMC_AT_EL=1 parameter configures the build with FF-A and an SPMC at
S-EL1 inside OP-TEE. The parameter can be changed to SPMC_AT_EL=n to test
without FF-A using the original SMC ABI instead. Please remember to do
%make arm-tf-clean
for TF-A to be rebuilt properly using the new configuration.

https://optee.readthedocs.io/en/latest/building/prerequisites.html
list dependencies required to build the above.

The primitive tests are pretty basic, mostly checking that a Trusted
Application in the secure world can access and manipulate the memory. There
are also some negative tests for out of bounds buffers, etc.

Thanks,
Jens

Changes since V11:
* In "dma-buf: dma-heap: export declared functions":
  - use EXPORT_SYMBOL_NS_GPL()
  - Added TJ's R-B and Sumit's Ack
* In "tee: implement protected DMA-heap", import the namespaces "DMA_BUF"
  and "DMA_BUF_HEAP" as needed.

Changes since V10:
* Changed the new ABI OPTEE_MSG_CMD_GET_PROTMEM_CONFIG to report a list
  of u32 memory attributes instead of u16 endpoints to make room for both
  endpoint and access permissions in each entry.
* In "tee: new ioctl to a register tee_shm from a dmabuf file descriptor",
  remove the unused path for DMA-bufs allocated by other means than the on
  in the TEE SS.
* In "tee: implement protected DMA-heap", handle unloading of the
  backend driver module implementing the heap. The heap is reference
  counted and also calls tee_device_get() to guarantee that the module
  remains available while the heap is instantiated.
* In "optee: support protected memory allocation", use
  dma_coerce_mask_and_coherent() instead of open-coding the function.
* Added Sumit's R-B to
  - "optee: smc abi: dynamic protected memory allocation"
  - "optee: FF-A: dynamic protected memory allocation"
  - "optee: support protected memory allocation"
  - "tee: implement protected DMA-heap"
  - "dma-buf: dma-heap: export declared functions"

Changes since V9:
* Adding Sumit's R-B to "optee: sync secure world ABI headers"
* Update commit message as requested for "dma-buf: dma-heap: export
  declared functions".
* In "tee: implement protected DMA-heap":
  - add the hidden config option TEE_DMABUF_HEAPS to tell if the TEE
    subsystem can support DMA heaps
  - add a pfn_valid() to check that the passed physical address can be
    used by __pfn_to_page() and friends
  - remove the memremap() call, the caller is should do that instead if
    needed
* In "tee: add tee_shm_alloc_dma_mem()" guard the calls to
  dma_alloc_pages() and dma_free_pages() with TEE_DMABUF_HEAPS to avoid
  linking errors in some configurations
* In "optee: support protected memory allocation":
  - add the hidden config option OPTEE_STATIC_PROTMEM_POOL to tell if the
    driver can support a static protected memory pool
  - optee_protmem_pool_init() is slightly refactored to make the patches
    that follow easier
  - Call devm_memremap() before calling tee_protmem_static_pool_alloc()

Changes since V8:
* Using dma_alloc_pages() instead of cma_alloc() so the direct dependency on
  CMA can be removed together with the patches
  "cma: export cma_alloc() and cma_release()" and
  "dma-contiguous: export dma_contiguous_default_area". The patch
* Renaming the patch "tee: add tee_shm_alloc_cma_phys_mem()" to
  "tee: add tee_shm_alloc_dma_mem()"
* Setting DMA mask for the OP-TEE TEE device based on input from the secure
  world instead of relying on the parent device so following patches are
  removed: "tee: tee_device_alloc(): copy dma_mask from parent device" and
  "optee: pass parent device to tee_device_alloc()".
* Adding Sumit Garg's R-B to "tee: refactor params_from_user()"
* In the patch "tee: implement protected DMA-heap", map the physical memory
  passed to tee_protmem_static_pool_alloc().

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
* Removing the patch "optee: account for direction while converting parameters"

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

Jens Wiklander (8):
  optee: sync secure world ABI headers
  dma-buf: dma-heap: export declared functions
  tee: implement protected DMA-heap
  tee: refactor params_from_user()
  tee: add tee_shm_alloc_dma_mem()
  optee: support protected memory allocation
  optee: FF-A: dynamic protected memory allocation
  optee: smc abi: dynamic protected memory allocation

 drivers/dma-buf/dma-heap.c        |   4 +
 drivers/tee/Kconfig               |   5 +
 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/Kconfig         |   5 +
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/core.c          |   7 +
 drivers/tee/optee/ffa_abi.c       | 146 ++++++++-
 drivers/tee/optee/optee_ffa.h     |  27 +-
 drivers/tee/optee/optee_msg.h     |  84 ++++-
 drivers/tee/optee/optee_private.h |  15 +-
 drivers/tee/optee/optee_smc.h     |  37 ++-
 drivers/tee/optee/protmem.c       | 335 ++++++++++++++++++++
 drivers/tee/optee/smc_abi.c       | 141 ++++++++-
 drivers/tee/tee_core.c            | 158 +++++++---
 drivers/tee/tee_heap.c            | 500 ++++++++++++++++++++++++++++++
 drivers/tee/tee_private.h         |  14 +
 drivers/tee/tee_shm.c             | 157 +++++++++-
 include/linux/tee_core.h          |  59 ++++
 include/linux/tee_drv.h           |  10 +
 include/uapi/linux/tee.h          |  31 ++
 20 files changed, 1670 insertions(+), 67 deletions(-)
 create mode 100644 drivers/tee/optee/protmem.c
 create mode 100644 drivers/tee/tee_heap.c


base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
-- 
2.43.0


