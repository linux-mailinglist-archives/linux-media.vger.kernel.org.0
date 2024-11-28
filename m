Return-Path: <linux-media+bounces-22222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C42899DBA2B
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 16:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D5EFB218C3
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 15:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD68A1B6CE2;
	Thu, 28 Nov 2024 15:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qE+kO2F/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6083A1AF0A5
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732806582; cv=none; b=BfaT4xAeFJHiA4N22mf8DSOz/eClScVdG9B5mvDJ9KOh/QzaSqTN6h4j11s3yRCMho9y4n9du5ZFR/PVlto9QcAuxMUFwCuet/66N8att2nSg937d0rehFN72IBJM8y2EX9yMDxnm5LKvZsfV1mT4tLzicUWmjfA9IZR+KAnQwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732806582; c=relaxed/simple;
	bh=McyL2tqZSyVWtvejVCMYFi1ubWC5emJmIm4iAVRj1Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sk/EjFk6HrxLXu6HC3osj1zNUpptNQQ6ktMXzze6jdhFOR6twx/BeJNgM3CE/7s3jND44OqKyFsRb1HTDDdbto9COF7G4A799/EjpJB2ra2qAa9Kw0ruc3HBPMmhe8+45nlOgPHoQDwuh9CAEhrBeHfj7ysphJSRjVJIJ9Tm9g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qE+kO2F/; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa55da18f89so132586866b.0
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 07:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732806579; x=1733411379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lx8FUbil1lq4BtoAebbj8qif3q0b2Rsp7fvYReP+0O4=;
        b=qE+kO2F/aESx/IO6nDIpnUnO50WzTzEwZ0nkGG7Z07gYwjbK3xSYnTUbl8n45pEwMe
         wP1Xj3TgHkv3yLgTNLn8KMHce4LvxrJ9vLUepX1rUGubQA0e2P0lVvuH8CglzIou+ajy
         E571RlRC+LLbnJOr+86YkTaWdMKaW8GBrFBydhQwI099oowTG59jvN1thZQr6D4AGtB6
         3bMgv2tCaQlDmg1Qy2Z+a/9GQS9xIC29+L/RipVrr1VhPFmI6Iq9Z3tVRgeJ9kpriYUK
         1x046TpGWTzqlWuinlfiBWTqNzLBSmTrLC2t9xKhqWAFyzEZvVs5WwECdbS7JourEXv+
         YOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732806579; x=1733411379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lx8FUbil1lq4BtoAebbj8qif3q0b2Rsp7fvYReP+0O4=;
        b=D61BeHCeYBsn1D8nbF611GN6HViEK/moUAUa4owQ8t4Rpe+bnvqlmuKGY1+8uagNlS
         8YSCuCaKY+v5uUnzVd7ZPHlyJLIgk7rc12h8BA+cIZ9V1UHoyo1L+sG+WEMTE+1YcB60
         CN7baZXePGIzsq+aJ8V+1Xvt9oOh7NS2LRYhN7JhrffhgtKhYMJLkLuTcVBaEOk0an4v
         x/DXH18Etmq1Z3qFVMbsKsK8DsmE5E4Ycr9wxFEB3njEiMqYnnd52qykRkC199347xt2
         fMu3tQtjIQjd2Rs8bLKl9gmImP0gjCR/0koKcd/edGvf0q5uwOoyuJPm2+y49obARygZ
         suxg==
X-Forwarded-Encrypted: i=1; AJvYcCXr9UT/7zTlvO/N25zSbN+gTAWVM4JsQcNVQdcvh410KWA4Z19tDgLuQKBSSAvuJuSv7JAvPT8CeFnsxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUFH4WwhL8kexSvp/ExQg18a3653yazYATlcyr/pEMpmACLZhY
	w2MgfpfMtjDFD5vTTm0jdNfLnuv1n5fsloXXvqA4Q00hTnwvF+m0rzr/u79Si9VnOQkNZDYOYJw
	m
X-Gm-Gg: ASbGnctgXOXtlcAvfKdt+o6SuXflHxXzwqqba2dcR/vjOuOpzsRsMKTQs1dKpEUvwcZ
	jAO+/HqdlrS8fNGhlA35RBcUIGbskttOuO1IzTdHSAf4cbgSCLcYKfDR1ycZ61Ejv0YK5ADQOHv
	R1zIBpzeufly7yG5bqiEBUxcbh70wS2lw6G+rslNkkcmyx4cXeunXaJBvbudCB7MdkvtC3gKzVl
	Mm34m4wJ9fpfYmomx6yUbjVwvWOe2sz5uxqyTrmrrufoTRqrmVnQcqPuJebaMLh+PtrMk5VZ4Nf
	4WZYelcgzzLeMTExhCUDlW2G
X-Google-Smtp-Source: AGHT+IErM6pO63m4fDk26WsSCnoRuNdeklZdOejyiYshrc8elr0SpIMuHzrJ+hXYJB8Y4wtZl7A20A==
X-Received: by 2002:a17:906:3d22:b0:aa5:50b6:a600 with SMTP id a640c23a62f3a-aa581028af3mr520735266b.44.1732806578748;
        Thu, 28 Nov 2024 07:09:38 -0800 (PST)
Received: from rayden.urgonet (h-79-136-84-141.A175.priv.bahnhof.se. [79.136.84.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm75711366b.163.2024.11.28.07.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:09:38 -0800 (PST)
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
Subject: [PATCH v3 0/4] TEE subsystem for restricted dma-buf allocations
Date: Thu, 28 Nov 2024 16:09:00 +0100
Message-ID: <20241128150927.1377981-1-jens.wiklander@linaro.org>
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
This a big update compared to the previous patch set [1].

The TEE subsystem handles the DMA-buf allocations since it is the TEE
(OP-TEE, AMD-TEE, TS-TEE, or perhaps a future QTEE) which sets up the
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
        -b prototype/sdp-v3
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

[1] https://lore.kernel.org/lkml/20241015101716.740829-1-jens.wiklander@linaro.org/

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

Jens Wiklander (4):
  tee: add restricted memory allocation
  optee: account for direction while converting parameters
  optee: sync secure world ABI headers
  optee: support restricted memory allocation

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
 drivers/tee/optee/rstmem.c        | 380 ++++++++++++++++++++++++++++++
 drivers/tee/optee/smc_abi.c       | 214 +++++++++++++++--
 drivers/tee/tee_core.c            |  37 ++-
 drivers/tee/tee_private.h         |   2 +
 drivers/tee/tee_rstmem.c          | 201 ++++++++++++++++
 drivers/tee/tee_shm.c             |   2 +
 drivers/tee/tee_shm_pool.c        |  69 +++++-
 include/linux/tee_core.h          |  15 ++
 include/linux/tee_drv.h           |   4 +-
 include/uapi/linux/tee.h          |  37 ++-
 20 files changed, 1344 insertions(+), 77 deletions(-)
 create mode 100644 drivers/tee/optee/rstmem.c
 create mode 100644 drivers/tee/tee_rstmem.c

-- 
2.43.0


