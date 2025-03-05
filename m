Return-Path: <linux-media+bounces-27621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C97AA4FFB3
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EB09177630
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4062475C8;
	Wed,  5 Mar 2025 13:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VhotKfS6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783606F099
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180004; cv=none; b=KtvXNFe6HDyiu41rbDG3byTWa1CeLjMEOuHEZoBBudWPR9wWRBagRQQntQGOv4VsGXUipN5+MQ21JaHL3rRsHlXRsghyBbvG3L+u/65GNbxDiQQ3LZAqLV0pkItFDJzgfD9195MjDxmj/kR8xanNUMLcfeCwZ/M2HDmTUzgPR5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180004; c=relaxed/simple;
	bh=56sqqOEqGriHtOFEYlo9hGHgSO0l2VpnsflbgQyFSf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VY0pRUhW+hI6MzfHoELf+0zzNFZh+9P1WTF5nQWJRqfQP8Y+j+oTj7JuadUr6ATNWxMf1w14FhqeiRFjpQdNtFS971C8sLTg2wk3fCk3/A03vRGkwnpx5KhARqDvbI//cn6Rfam2SjINiBd3DR/zAAfMni3eJbZjQPG40WafJ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VhotKfS6; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e539ea490dso4863675a12.0
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 05:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741180000; x=1741784800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7SQjgG6U13+uAQOBhn9HhQeG3VGEtTdqOEuDMKUhZ7o=;
        b=VhotKfS6sQi/QNWvKJHQwoibQAluNbMSCQVhrwAr3989u2DHFZUQsUH/cgKazRl1K3
         Ub798VQsBXeDBNQ+YSC/PS9YGbxNgOnUk+1ys+aHr0wI68T8tpxqwvFSlwskv6iROmkT
         mY443uGuosLOSF2uWqxuUotNfWn+gEZ4lHi7RJrkAlLEypo0VR0fhHOXWEOe/NgsAIOi
         Rn4puUGzRAlSV8rzHovGuRMfpPUb8aosVSoYEC4bMYzAZREs40e+H7lBK9UqWTmtc3kt
         mg8azee1DrJrcmF4Nf5lzwUIV3w6KmTJByQ17OdRpXqsbnC1Hwg51F8d+o7GBkfWlYY+
         VGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180000; x=1741784800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SQjgG6U13+uAQOBhn9HhQeG3VGEtTdqOEuDMKUhZ7o=;
        b=Z4qVD7tiWN6IZoX9Iykg2pQLdn46AFtmPYZA6ATP5jqdOSITV4JB5V5ut14ax1pbpt
         +15RgTg767kOiPJwD8ml4iJ6e8nWN1387+oBiXmI78hbK7w2j+ePZfRXhhAV531//o1F
         Bb3Hh0z6570kpzeRTC5xqaJtX3SH3Vh5m+Brke17tRsTrIfXekYNh7FXeH+wwlDFIGy6
         +XbDl0gT4vsDH4CnlSz42IhQ71vpqpxj2kG/v/KLJVFCxDo6CTxE8aUTyeOM113IhoyD
         VAtBWBI/gJWw/y4rQh0UsW0CNieQUpcP5ZcVjvbLl7Df+Cz55pXZhF6QKkRed0I81w3H
         05xg==
X-Forwarded-Encrypted: i=1; AJvYcCV6XYpNNTmjbhjBa4eUaCMjRdCYasUOZNtzF7FZCm0IuOp4jc9irgV6p6vxOYIL341Xn9hWJDf7uSGkrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzubTqlDfypaMoZxwES5llGziKbLMUHPETICdVc4OqJNNkAGH0u
	+4Y//w+ozl/Yot8X+WmUsC4gKEcCSkP18LB9fkv2HB60BBm6sMA9p9mz8tXREOo=
X-Gm-Gg: ASbGncunWjVm1V3nibbMg0BG6Rg5S4na109l7h8+ASYvM82ddX8OkJZfMddMQqJTeC9
	U50Ze/7TxQxu7VmEg3FzuSkGQpDZwtwsHyXOnqAjWOEwbDsbcVju7yhD8lfrj7wN/U/33XqnhIR
	u3OhYU1HRKa19CGyhfao1yArruVGN34Hpnrn28/rpWM1XSZLq9A/A2nBem68dqyOF5iVmKEPp7N
	zNhrM0IAW1oFFORuYueTbOO9dud7l7BfT+1M21herMRnJCZuMj2gnrAaHnJsuk4DLuhOycSgYLv
	8qZGikEWERVTzMvTXOPynXXioV4vfLAVeY1b4Ci75YJhZS0lcKvze6ojpGD52qhzwudK6XOYih9
	Ll1Hi3bebm06yjyrS83sNXA==
X-Google-Smtp-Source: AGHT+IHuCz71jYp7eU0HTiLFptbPk6lrg0W55Lpw1DSz92hnpN7BGzAC+85g1xWfhNsyzgUyDK+bpg==
X-Received: by 2002:a05:6402:13cd:b0:5dc:74fd:abf1 with SMTP id 4fb4d7f45d1cf-5e59f3ee29amr7186053a12.15.1741180000374;
        Wed, 05 Mar 2025 05:06:40 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:06:39 -0800 (PST)
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
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 00/10] TEE subsystem for restricted dma-buf allocations
Date: Wed,  5 Mar 2025 14:04:06 +0100
Message-ID: <20250305130634.1850178-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch set allocates the restricted DMA-bufs from a DMA-heap
instantiated from the TEE subsystem.

The TEE subsystem handles the DMA-buf allocations since it is the TEE
(OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QTEE) which sets up the
restrictions for the memory used for the DMA-bufs.

The DMA-heap uses a restricted memory pool provided by the backend TEE
driver, allowing it to choose how to allocate the restricted physical
memory.

The allocated DMA-bufs must be imported with a new TEE_IOC_SHM_REGISTER_FD
before they can be passed as arguments when requesting services from the
secure world.

Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
Recording) has been identified so far to serve as examples of what can be
expected. The use-cases has predefined DMA-heap names,
"restricted,secure-video", "restricted,trusted-ui", and
"restricted,secure-video-record". The backend driver registers restricted
memory pools for the use-cases it supports.

Each use-case has it's own restricted memory pool since different use-cases
requires isolation from different parts of the system. A restricted memory
pool can be based on a static carveout instantiated while probing the TEE
backend driver, or dynamically allocated from CMA and made restricted as
needed by the TEE.

This can be tested on a RockPi 4B+ with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m rockpi4.xml \
        -b prototype/sdp-v6
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
into restricted DMA-bufs which are consumed by the kmssink.

The primitive QEMU tests from previous patch set can be tested on RockPi
in the same way with:
xtest --sdp-basic

The primitive test are tested on QEMU with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b prototype/sdp-v6
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

Jens Wiklander (9):
  tee: tee_device_alloc(): copy dma_mask from parent device
  optee: pass parent device to tee_device_alloc()
  optee: account for direction while converting parameters
  optee: sync secure world ABI headers
  tee: implement restricted DMA-heap
  tee: add tee_shm_alloc_cma_phys_mem()
  optee: support restricted memory allocation
  optee: FF-A: dynamic restricted memory allocation
  optee: smc abi: dynamic restricted memory allocation

 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/call.c          |  10 +-
 drivers/tee/optee/core.c          |   1 +
 drivers/tee/optee/ffa_abi.c       | 194 +++++++++++-
 drivers/tee/optee/optee_ffa.h     |  27 +-
 drivers/tee/optee/optee_msg.h     |  65 ++++-
 drivers/tee/optee/optee_private.h |  55 +++-
 drivers/tee/optee/optee_smc.h     |  71 ++++-
 drivers/tee/optee/rpc.c           |  31 +-
 drivers/tee/optee/rstmem.c        | 329 +++++++++++++++++++++
 drivers/tee/optee/smc_abi.c       | 190 ++++++++++--
 drivers/tee/tee_core.c            | 147 +++++++---
 drivers/tee/tee_heap.c            | 470 ++++++++++++++++++++++++++++++
 drivers/tee/tee_private.h         |   7 +
 drivers/tee/tee_shm.c             | 199 ++++++++++++-
 include/linux/tee_core.h          |  67 +++++
 include/linux/tee_drv.h           |  10 +
 include/uapi/linux/tee.h          |  29 ++
 19 files changed, 1781 insertions(+), 123 deletions(-)
 create mode 100644 drivers/tee/optee/rstmem.c
 create mode 100644 drivers/tee/tee_heap.c


base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
-- 
2.43.0


