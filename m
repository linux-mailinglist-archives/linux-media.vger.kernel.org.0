Return-Path: <linux-media+bounces-62081-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFRhGX4ADGpcTQUAu9opvQ
	(envelope-from <linux-media+bounces-62081-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:17:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D07DA577DE5
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 08:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30DFC305B2FE
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 06:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDFF399340;
	Tue, 19 May 2026 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuWRet4b"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D216377577;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171355; cv=none; b=ifOjjfqHwvCeYerqJnWSioipEQNDYL+NzISzFOkh5nu0uyGg+8lDYd8+jxxNMDV9BZtSWTOo0ppFLP7HwzZLgsuMxov+K8sQ9DENj8hhWS0OQH5rZJBubEz0WSB6Ca++F8ZU8ZATUKkXBERtJtetcBSMMPqHZYkKYufO/YpsWvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171355; c=relaxed/simple;
	bh=UDxgamBdkS8D9+3ejkhADAphYNb/he3n+UCgekKDnJ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wbk0MFKfMrWmds3Rgd6K8E7rmhz5rXi/H7Efs1obq3td69npaU80dwpYrXtBP880n7rnVzq8t44vqafQ2lnh4FP/ZH+eX5AX4ndHblCVO7BudGPePTI6qjFT5+/hPE9RLz1Z1SLPJY7uweuyRSV9JkvPHwSGUXcxS5G90DaoA8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuWRet4b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3655AC2BCB3;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171355;
	bh=UDxgamBdkS8D9+3ejkhADAphYNb/he3n+UCgekKDnJ0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=KuWRet4b3hhoYF1btN/G4t14XG8r8tqXTJvJGdXHb8GDK7Yd082ayuJJLpVlD4w1N
	 exCWXFVxr0vKlBbfcY8JjYhK0LJ4apFxydDduYIo4AjqYCxuUE9oYH7466az+ANgqx
	 Pf/fzz7AnmQlzuLFWNuzJtBQh9dX8Cc+uMQ52NqmdPavVklK2IVfBA+6c37impWHYT
	 QVEX3L81/YI1qP+rCiQhfnDzzpMyiExnJbFcA3rxpq0BFO5LYQswjw8KtwLran8arN
	 /uIMIeCXL+iQ8FZHf9oWUVGIK8tHwk5lBC4SOZXw1MRmo1ftQtVP/G3t0yHv2uQZiv
	 wjBbT7EQrQPwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259D9CD4851;
	Tue, 19 May 2026 06:15:55 +0000 (UTC)
From: Ekansh Gupta via B4 Relay <devnull+ekansh.gupta.oss.qualcomm.com@kernel.org>
Subject: [PATCH 00/15] accel/qda: Qualcomm DSP Accelerator driver
Date: Tue, 19 May 2026 11:45:50 +0530
Message-Id: <20260519-qda-series-v1-0-b2d984c297f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABYADGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0NL3cKURF2IHl1zi2SjpDSD1BRziyQloIaCotS0zAqwYdGxtbUAp3z
 yMlwAAAA=
X-Change-ID: 20260519-qda-series-78c2bf0ed78b
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>, 
 Chenna Kesava Raju <quic_chennak@quicinc.com>, srini@kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org, 
 konradybcio@kernel.org, robin.clark@oss.qualcomm.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779171352; l=13104;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=UDxgamBdkS8D9+3ejkhADAphYNb/he3n+UCgekKDnJ0=;
 b=ztP0MLj2dHmOjRC1MPHn1kXflb1f9iVHHFYXT8zFO4Auiu0tB88klttxJpLVEm9IuYFf+geze
 8MSJb//mspDBxDytTQ2+pA/BLKC4oL+3aA8B8iFnGHMaOyjE/81w5bv
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Endpoint-Received: by B4 Relay for ekansh.gupta@oss.qualcomm.com/20260223
 with auth_id=647
X-Original-From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Reply-To: ekansh.gupta@oss.qualcomm.com
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62081-lists,linux-media=lfdr.de,ekansh.gupta.oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[ekansh.gupta@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lkml.org:url,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:replyto,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D07DA577DE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series introduces the Qualcomm DSP Accelerator (QDA) driver,
a DRM-based accelerator driver for Qualcomm DSPs. The driver provides a
standardized interface for offloading computational tasks to DSPs found
on Qualcomm SoCs, supporting all DSP domains.
 
The QDA driver implements the FastRPC protocol over the DRM accel
subsystem. It uses the same device-tree node structure as the existing
fastrpc driver in drivers/misc/. The approach for binding the QDA driver
to device-tree nodes while coexisting with the fastrpc driver is an open
item described below.

RFC thread: https://lore.kernel.org/dri-devel/20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com/T/
 
User-space staging branch
=========================
https://github.com/qualcomm/fastrpc/tree/accel/staging
 
Key Features
============
 
* Standard DRM accelerator interface via /dev/accel/accelN
* GEM-based buffer management with DMA-BUF import/export (PRIME)
* IOMMU-based memory isolation using per-process context banks
* FastRPC protocol implementation for DSP communication
* RPMsg transport layer for reliable message passing
* Support for all DSP domains (ADSP, CDSP, SDSP, GDSP)
* DRM IOCTL interface for DSP session management, buffer allocation,
  and remote procedure invocation
 
Architecture
============
 
1. DRM Accelerator Framework Integration
   The driver registers as a DRM accel device, exposing a standard
   /dev/accel/accelN character device node. This provides established
   DRM infrastructure for device management, file operations, and
   IOCTL dispatch.
 
2. Memory Management
   Buffers are managed as GEM objects with full PRIME support for
   DMA-BUF import/export. This enables seamless buffer sharing with
   other DRM drivers (GPU, camera, video) using standard kernel
   mechanisms.
 
3. IOMMU Context Bank Management
   IOMMU context banks (CBs) are represented as proper struct device
   instances on a custom virtual bus (qda-compute-cb). Each CB device
   is registered with the IOMMU subsystem and receives its own IOMMU
   domain, enabling per-session address space isolation. The custom
   bus was introduced because IOMMU context banks are synthetic
   constructs — not real platform devices — and to ensure CB device
   lifetime is strictly subordinate to the parent QDA device.
   See also: https://lore.kernel.org/all/245d602f-3037-4ae3-9af9-d98f37258aae@oss.qualcomm.com/
 
4. Memory Manager Architecture
   A pluggable memory manager coordinates IOMMU device assignment and
   buffer allocation. The current implementation uses a DMA-coherent
   backend with SID-prefixed DMA addresses for DSP firmware
   compatibility.
 
5. Transport Layer
   RPMsg communication is handled in a dedicated transport layer
   (qda_rpmsg.c), separate from the core DRM driver logic.
 
6. Code Organization
   The driver is organized across multiple files (~4600 lines total):
   * qda_drv.c:            Core driver and DRM integration
   * qda_rpmsg.c:          RPMsg transport layer
   * qda_cb.c:             Context bank device management
   * qda_compute_bus.c:    Custom virtual bus for CB devices
   * qda_gem.c:            GEM object management
   * qda_prime.c:          DMA-BUF import (PRIME)
   * qda_memory_manager.c: IOMMU device registry and allocation
   * qda_memory_dma.c:     DMA-coherent allocation backend
   * qda_fastrpc.c:        FastRPC protocol implementation
   * qda_ioctl.c:          IOCTL dispatch
 
7. UAPI Design
   The driver exposes DRM-style IOCTLs defined in
   include/uapi/drm/qda_accel.h, following DRM UAPI conventions
   (__u32/__u64 types, C++ guard, GPL-2.0-only WITH Linux-syscall-note).
 
Patch Series Organization
==========================
 
Patch 01:      MAINTAINERS entry
Patch 02:      Driver documentation (Documentation/accel/qda/)
Patches 03-04: Core driver skeleton and compute bus
Patch 05:      iommu: Register qda-compute-cb bus with IOMMU subsystem
Patches 06-07: CB device enumeration and memory manager
Patch 08:      QUERY IOCTL and UAPI header
Patches 09-11: GEM buffer management and PRIME import
Patches 12-15: FastRPC protocol (invoke, session create/release,
               map/unmap)
 
Open Items
===========
 
1. Device-Tree Compatible String
   The QDA driver uses the same device-tree node structure and
   properties as the existing fastrpc driver in drivers/misc/. A
   mechanism is needed to allow the QDA driver to bind to its device
   node independently of the fastrpc driver.
 
   The intended coexistence model is: platforms that require the
   complete fastrpc feature set continue to use "qcom,fastrpc"; new
   platforms where a feature available only in QDA takes priority, or
   where QDA's current feature set is sufficient, use a QDA-specific
   compatible string. New feature development is directed toward QDA
   rather than the existing fastrpc driver. As QDA matures toward
   feature parity with fastrpc, platforms can adopt the QDA-specific
   compatible string exclusively.
 
   The options under consideration are:
 
   a) Add a new "qcom,qda" compatible string to the existing
      qcom,fastrpc.yaml binding, since the DT node structure and
      properties are identical. This avoids a separate binding file
      but adds a QDA-specific string to a fastrpc binding.
 
   b) Introduce a separate qcom,qda.yaml binding that references or
      inherits the fastrpc binding properties.
 
   Seeking guidance from DT binding maintainers on the preferred
   approach.
 
2. Privilege Level Management
   Currently, daemon processes and user processes have the same access
   level as both use the same accel device node. This needs to be
   addressed as daemons attach to privileged DSP protection domains
   and require higher privilege levels for system-level operations.
   Seeking guidance on the best approach: separate device nodes,
   capability-based checks, or DRM master/authentication mechanisms.
 
3. UAPI Compatibility Layer
   A compatibility layer is needed to facilitate migration of client
   applications from the existing FastRPC UAPI to the new QDA UAPI,
   ensuring a smooth transition for existing userspace code. Seeking
   guidance on the preferred implementation approach: in-kernel
   translation layer, userspace wrapper library, or hybrid solution.
 
   An initial evaluation of an in-kernel translation shim was
   performed, where legacy FastRPC device nodes (/dev/fastrpc-*) are
   exposed and requests are internally routed to the QDA accel driver.
   The goal was to keep the compatibility layer minimal, reuse existing
   QDA helper paths (attach, buffer allocation, mapping, etc.), and
   avoid duplication of GEM and buffer management logic.
 
   However, the following challenges were identified:
 
   a) Dependency on drm_file for QDA helpers
      QDA relies on GEM-backed allocations and per-client handle
      namespaces, which require a valid struct drm_file. Since GEM
      handles are scoped per drm_file, the compatibility layer cannot
      directly reuse QDA helper paths without establishing a proper
      drm_file context for each client.
 
   b) Lack of public API for drm_file creation
      Creating a drm_file directly (similar to mock_drm_getfile()-style
      approaches) is not feasible, as the required helpers
      (drm_file_alloc(), drm_file_free(), etc.) are internal to the DRM
      core and not exported. This prevents external drivers from safely
      constructing and managing drm_file instances.
 
   c) VFS-based open is not a viable solution
      Opening the underlying accel device (/dev/accel/accelN) from the
      compatibility driver via filp_open() does provide a valid
      drm_file, but introduces reliance on userspace-visible device
      paths, lack of stability in containerized or chroot environments,
      and no clean mapping between legacy device nodes and accel
      devices.
 
   d) Userspace proxy limitations (CUSE)
      A CUSE-based userspace proxy was evaluated. However, DMA-buf file
      descriptors passed by legacy applications cannot be directly
      reused in the CUSE daemon (file descriptors are process-specific),
      which breaks buffer sharing semantics.
 
   e) drm_client-based approaches do not match requirements
      drm_client APIs (used for fbdev emulation) rely on a shared
      drm_file and do not provide the per-client isolation required by
      FastRPC semantics.
 
   Due to the above constraints, it is currently unclear how to
   implement an in-kernel compatibility layer that correctly handles
   per-client drm_file contexts without relying on VFS paths or
   non-exported DRM internals.
 
4. Documentation Improvements
   Add detailed IOCTL usage examples, document DSP firmware interface
   requirements, and create a migration guide from the existing FastRPC
   driver.
 
5. Per-Session Memory Allocation
   Develop a userspace API to support memory allocation on a per-session
   basis, enabling session-specific memory management.
 
6. Audio and Sensors PD Support
   The current series does not handle Audio PD and Sensors PD
   functionalities. These specialized protection domains require
   additional support for real-time constraints and power management.
 
Interface Compatibility
========================
 
The QDA driver uses the same device-tree node structure and child node
layout (including "qcom,fastrpc-compute-cb" child nodes) as the
existing fastrpc driver. The underlying FastRPC protocol and DSP
firmware interface are compatible with the existing fastrpc driver,
ensuring that DSP firmware and libraries continue to work without
modification.
 
References
==========
 
Previous discussions on this migration:
- https://lkml.org/lkml/2024/6/24/479
- https://lkml.org/lkml/2024/6/21/1252
 
Testing
=======
 
The driver has been tested on Qualcomm platforms with:
- Basic FastRPC attach/release operations
- DSP process creation and initialization
- Memory mapping/unmapping operations
- Dynamic invocation with various buffer types
- GEM buffer allocation and mmap
- PRIME buffer import from other subsystems

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Ekansh Gupta (15):
      MAINTAINERS: Add entry for Qualcomm DSP Accelerator (QDA) driver
      accel/qda: Add QDA driver documentation
      accel/qda: Add initial QDA DRM accelerator driver
      accel/qda: Add compute bus for QDA context banks
      iommu: Add QDA compute context bank bus to iommu_buses
      accel/qda: Create compute context bank devices on QDA compute bus
      accel/qda: Add memory manager for CB devices
      accel/qda: Add QUERY IOCTL and QDA UAPI header
      accel/qda: Add DMA-backed GEM objects and memory manager integration
      accel/qda: Add GEM_CREATE and GEM_MMAP_OFFSET IOCTLs
      accel/qda: Add PRIME DMA-BUF import support
      accel/qda: Add FastRPC invocation support
      accel/qda: Add DSP process creation and release
      accel/qda: Add remote memory mapping to DSP address space
      accel/qda: Add remote memory unmap from DSP address space

 Documentation/accel/index.rst          |    1 +
 Documentation/accel/qda/index.rst      |   13 +
 Documentation/accel/qda/qda.rst        |  146 +++++
 MAINTAINERS                            |    9 +
 drivers/accel/Kconfig                  |    1 +
 drivers/accel/Makefile                 |    2 +
 drivers/accel/qda/Kconfig              |   34 +
 drivers/accel/qda/Makefile             |   19 +
 drivers/accel/qda/qda_cb.c             |  146 +++++
 drivers/accel/qda/qda_cb.h             |   32 +
 drivers/accel/qda/qda_compute_bus.c    |   68 ++
 drivers/accel/qda/qda_drv.c            |  192 ++++++
 drivers/accel/qda/qda_drv.h            |   91 +++
 drivers/accel/qda/qda_fastrpc.c        | 1058 ++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_fastrpc.h        |  390 ++++++++++++
 drivers/accel/qda/qda_gem.c            |  177 ++++++
 drivers/accel/qda/qda_gem.h            |   62 ++
 drivers/accel/qda/qda_ioctl.c          |  296 +++++++++
 drivers/accel/qda/qda_ioctl.h          |   19 +
 drivers/accel/qda/qda_memory_dma.c     |  110 ++++
 drivers/accel/qda/qda_memory_dma.h     |   17 +
 drivers/accel/qda/qda_memory_manager.c |  380 ++++++++++++
 drivers/accel/qda/qda_memory_manager.h |   75 +++
 drivers/accel/qda/qda_prime.c          |  184 ++++++
 drivers/accel/qda/qda_prime.h          |   18 +
 drivers/accel/qda/qda_rpmsg.c          |  248 ++++++++
 drivers/accel/qda/qda_rpmsg.h          |   30 +
 drivers/iommu/iommu.c                  |    4 +
 include/linux/qda_compute_bus.h        |   32 +
 include/uapi/drm/qda_accel.h           |  229 +++++++
 30 files changed, 4083 insertions(+)
---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260519-qda-series-78c2bf0ed78b

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>



