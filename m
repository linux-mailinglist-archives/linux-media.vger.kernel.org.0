Return-Path: <linux-media+bounces-50594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F552D1AB0E
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 18:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 651C13015E35
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 17:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510243921D1;
	Tue, 13 Jan 2026 17:44:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC0E38A728
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 17:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326289; cv=none; b=QaiPLDBbPJwol+UtTr0O1iGQobVkjimVLCRCSbl0XDybig1MQdqyNjc5+Js4dnuvB0hUBXWqVD3QcOxK7TOwhvo6G7vYicde4hrlK1T31h7bVnnu0vytZl4kGSvrjsdhfvpdztwEagK0YAZMX7y/aWMd8kPs04NRQksbs0E/xFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326289; c=relaxed/simple;
	bh=ydCY4dMkYiDlitiuC6Z0F5oaftjzbWrrsxFgbMP3eh8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qihj+YUzDZQksuSALw9y/1UatRvXh23OkHE9TlRNnWe988KNXtohs5vwwa/jbB+llMf6SJwAap5DoxbgkFmU20kt9UcogMJC/wVg5y5ic7YFU6u+g5t8aD+3DKS9Ix34DfGqQZpH/I15Mr8q2rASbnDwH/iuUrc3GK9cVSQOrSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8712507269so353858866b.3
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 09:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768326286; x=1768931086;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRDDaI8PSQ9i8fUQYmRubU2lZ9FKKoqL8+7T/Yos84E=;
        b=JdO/AOYy8ACmH8W/EVFhWux6zY8YeBxBniaNIAJOLfbhwVkw4NVqXIbK3DbA3i4tlX
         cnfs8tD/j28vqymygV2snA4SRzvpSUZFcrZqO3mhpyGyYT+x3JkoMtLt6ohRrfEKBrZ+
         vJuzihsRY4U1KLk4W0oEjKgbBNW+zOP1xGUMUMD3GOrxW95gVP1ivzogWrc0jHpqwYcK
         YULbMia7grv+FIa4iC5ZHHBOw1oQcwy41IdWR92CG5g+yJiigQY5Yfgmig5+Ux3+7J1A
         3kMkWQGASEF+0Q7oYQJzTBDaVs55LrODR7Q+Wf5KlAUlrXQpN+v1blZiFCoaYTmduGEA
         G4jA==
X-Forwarded-Encrypted: i=1; AJvYcCWqa9nt7RizzxrujgfZEDMVR+tgjrJZy2bCrZFWH3fD2mnsh3Kn1BBu9IrYBsfGogwFXQhtFOC/CGb7Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEJRcDFQ8vN3EosD9qpnyh5G+l9shp5ysagucydQMe5Vb5BKjL
	3BrrsfvnzdNEBg0wlyI4iT1x+/INoEZvFGw8NIYTBkSOnJVKPqKM2OtT
X-Gm-Gg: AY/fxX4eLmvTjP7IJtbnUYPWXjga5b6+xPczj0I1akxij6IHHF2kCTDqiHxVm0yWoTs
	wUBphI2VhrGHOnFB3o/6sKKhIZlg/Mogq2SFyzFZ/8rP9pCrEOuwZgtg9bz4o2A8Zln1Y1t/b92
	Lg73cIvEqXhmr2pI5idYxg7E1r42/97yTV5wWtXeUdE7wUBDWEbKrtdTgz2P4q1Qn9QEjCyqSs3
	lkvO3jRITJ6x5jBo0TSGEkn4GnOWqt3m09Z+hnVFg60fqVIFK3mmsrAFXcXxr+JI7EJkx1E6jQ5
	AQE5hqUodiIfqzVYYTs5WNM8+ksDd/4YRfeZOXttVsErIXXa56Cf61h0Cc6C9IANYbul2YwyA0h
	rnAyUMu+ImLOS04GwsaHpXLn8wwkYeAiuD76f2hmAxfeyZsSnyhnCIdijfMujxZRrdy4eP9DI8U
	FGjbrUW++AZwewzWBow1z8UfCJqK9jqTyJGaomhcZJlI7GBw==
X-Google-Smtp-Source: AGHT+IF2LxGsN/6Keoe3DyT2UHG1IbdrBpLZY09D3elBScNdSzuVpg3kGMzeCVp/wgijXP8twmjnjw==
X-Received: by 2002:a17:906:7954:b0:b87:2579:b6cf with SMTP id a640c23a62f3a-b872579ba1bmr579850766b.41.1768326285367;
        Tue, 13 Jan 2026 09:44:45 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm20873259a12.17.2026.01.13.09.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:44:44 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH 0/5] New DRM accel driver for Texas Instruments' C7x DSPs
Date: Tue, 13 Jan 2026 18:44:34 +0100
Message-Id: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKEZmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Nj3ZKMxNzUYl1jYxNDI/NEoxRLwxQloOKCotS0zAqwQdGxtbUAsQm
 1olgAAAA=
X-Change-ID: 20260113-thames-334127a2d91d
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

This series adds a new DRM/Accel driver that supports the C7x DSPs
inside some Texas Instruments SoCs such as the J722S. These can be used
as accelerators for various workloads, including machine learning
inference.

This driver controls the power state of the hardware via remoteproc and
communicates with the firmware running on the DSP via rpmsg_virtio.  The
kernel driver itself allocates buffers, manages contexts, and submits
jobs to the DSP firmware. Buffers are mapped by the DSP itself using its
MMU, providing memory isolation among different clients.

The source code for the firmware running on the DSP is available at:
https://gitlab.freedesktop.org/tomeu/thames_firmware/.

Everything else is done in userspace, as a Gallium driver (also called
thames) that is part of the Mesa3D project: https://docs.mesa3d.org/teflon.html

If there is more than one core that advertises the same rpmsg_virtio
service name, the driver will load balance jobs between them with
drm-gpu-scheduler.

Userspace portion of the driver: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39298

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
Tomeu Vizoso (5):
      arm64: dts: ti: k3-j722s-ti-ipc-firmware: Add memory pool for DSP i/o buffers
      accel/thames: Add driver for the C7x DSPs in TI SoCs
      accel/thames: Add IOCTLs for BO creation and mapping
      accel/thames: Add IOCTL for job submission
      accel/thames: Add IOCTL for memory synchronization

 Documentation/accel/thames/index.rst               |  28 ++
 MAINTAINERS                                        |   9 +
 .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi      |  11 +-
 drivers/accel/Kconfig                              |   1 +
 drivers/accel/Makefile                             |   3 +-
 drivers/accel/thames/Kconfig                       |  26 ++
 drivers/accel/thames/Makefile                      |  11 +
 drivers/accel/thames/thames_core.c                 | 161 +++++++
 drivers/accel/thames/thames_core.h                 |  53 +++
 drivers/accel/thames/thames_device.c               |  93 +++++
 drivers/accel/thames/thames_device.h               |  46 ++
 drivers/accel/thames/thames_drv.c                  | 180 ++++++++
 drivers/accel/thames/thames_drv.h                  |  21 +
 drivers/accel/thames/thames_gem.c                  | 407 ++++++++++++++++++
 drivers/accel/thames/thames_gem.h                  |  45 ++
 drivers/accel/thames/thames_ipc.h                  | 204 +++++++++
 drivers/accel/thames/thames_job.c                  | 463 +++++++++++++++++++++
 drivers/accel/thames/thames_job.h                  |  51 +++
 drivers/accel/thames/thames_rpmsg.c                | 276 ++++++++++++
 drivers/accel/thames/thames_rpmsg.h                |  27 ++
 20 files changed, 2113 insertions(+), 3 deletions(-)
---
base-commit: 27927a79b3c6aebd18f38507a8160294243763dc
change-id: 20260113-thames-334127a2d91d

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>


