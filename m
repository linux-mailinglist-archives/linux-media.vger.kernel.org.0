Return-Path: <linux-media+bounces-60424-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP2bE3f5+WndFgMAu9opvQ
	(envelope-from <linux-media+bounces-60424-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:06:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4E44CF0F3
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 16:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF7103070A2C
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 14:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF28E47DD78;
	Tue,  5 May 2026 14:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AVP8sPCI"
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E4247DD6D;
	Tue,  5 May 2026 14:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777989930; cv=none; b=oQMVrvVrwdwBgp+ubXhWg55cKMEz/vJBxhqjdWRCPKtUN8jrYRhyB2W7HWxZACxySSNbod6av5CfZwugSZz1aBrAuDOPqTWmbot0icvCEYQf7t8YmDZl6fpaOaaRUUxSgxsEu8Q9ZexRVzMZzLufBiazWukbHkm8hZr2AuoXvNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777989930; c=relaxed/simple;
	bh=iyP/JaXBkTbwZEXjAStW8lEzoZNntiUAc3QwhcHeM3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ASJP5Ob17dwQXaKTJftM92wW2Oij2y5cYZBlQS3c4Pw8/sV/xGrdIeE8nh1oyuFUwNrvy7PJcXlSQ9LQcKoKN8ittvV2sYpX963iXqXoNAVCKTBEVfYjTc1Ce+2YCcZ47t85zrdhYqzvtHBjnj4VI3CF1O+z6S5vlVFDewCvPuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AVP8sPCI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B2F024C0;
	Tue,  5 May 2026 07:05:20 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 156CC3F763;
	Tue,  5 May 2026 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777989925; bh=iyP/JaXBkTbwZEXjAStW8lEzoZNntiUAc3QwhcHeM3o=;
	h=From:To:Cc:Subject:Date:From;
	b=AVP8sPCIrwkEWGrTaXpA6Im1VQWWw+uTbtbX3XiVBAup4tMMeO/iLw+A42dT7Be0o
	 xe14tg17ZPx3Z59IFP6ah6B6XQAl77krNHSOGynpJGa66Ok8S/I/VgyJ2dsP6L8bM4
	 fEcayPwk9oJayp5u9OMQctpwEtK6q9PyIfSSIUug=
From: Ketil Johnsen <ketil.johnsen@arm.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: [PATCH 0/8] drm/panthor: Protected mode support for Mali CSF GPUs
Date: Tue,  5 May 2026 16:05:06 +0200
Message-ID: <20260505140516.1372388-1-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AB4E44CF0F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org,linaro.org,collabora.com,arm.com,google.com,amd.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60424-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ketil.johnsen@arm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:url,arm.com:dkim,arm.com:mid,gitlab.freedesktop.org:url]

Hi,

This is a patch series covering the support for protected mode execution in
Mali Panthor CSF kernel driver.

It builds on the initial RFC posted by Florent Tomasin back in January of 2025.

The initial RFC can be found here:
https://lore.kernel.org/lkml/cover.1738228114.git.florent.tomasin@arm.com/

The Mali CSF GPUs come with the support for protected mode execution at the
HW level. This feature requires two main changes in the kernel driver:

1) Configure the GPU with a protected buffer. The system must provide a DMA
   heap from which the driver can allocate a protected buffer.
   It can be a carved-out memory or dynamically allocated protected memory region.
   Some system includes a trusted FW which is in charge of the protected memory.
   Since this problem is integration specific, the Mali Panthor CSF kernel
   driver must import the protected memory from a device specific exporter.

2) Handle enter and exit of the GPU HW from normal to protected mode of execution.
   FW sends a request for protected mode entry to the kernel driver.
   The acknowledgment of that request is a scheduling decision. Effectively,
   protected mode execution should not overrule normal mode of execution.
   A fair distribution of execution time will guaranty the overall performance
   of the device, including the UI (usually executing in normal mode),
   will not regress when a protected mode job is submitted by an application.


Background
----------

Current Mali Panthor CSF driver does not allow a user space application to
execute protected jobs on the GPU. This use case is quite common on end-user-device.
A user may want to watch a video or render content that is under a "Digital Right
Management" protection, or launch an application with user private data.

1) User-space:

   In order for an application to execute protected jobs on a Mali CSF GPU the
   user space application must submit jobs to the GPU within a "protected regions"
   (range of commands to execute in protected mode).

   Find here an example of a command buffer that contains protected commands:

```
          <--- Normal mode ---><--- Protected mode ---><--- Normal mode --->
   +-------------------------------------------------------------------------+
   | ... | CMD_0 | ... | CMD_N | PROT_REGION | CMD_N+1 | ... | CMD_N+M | ... |
   +-------------------------------------------------------------------------+
```

   The PROT_REGION command acts as a barrier to notify the HW of upcoming
   protected jobs. It also defines the number of commands to execute in protected
   mode.

   The Mesa definition of the opcode can be found here:

     https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/panfrost/lib/genxml/v10.xml?ref_type=heads#L763

2) Kernel-space:

   When loading the FW image, the Kernel driver must also load the data section of
   CSF FW that comes from the protected memory, in order to allow FW to execute in
   protected mode.

   Important: this memory is not owned by any process. It is a GPU device level
              protected memory.

   In addition, when a CSG (group) is created, it must have a protected suspend buffer.
   This memory is allocated within the kernel but bound to a specific CSG that belongs
   to a process. The kernel owns this allocation and does not allow user space mapping.
   The format of the data in this buffer is only known by the FW and does not need to
   be shared with other entities. The purpose of this buffer is the same as the normal
   suspend buffer but for protected mode. FW will use it to suspend the execution of
   PROT_REGION before returning to normal mode of execution.


Design decisions
----------------

The Mali Panthor CSF kernel driver will allocate protected DMA buffers
using a global protected DMA heap. The name of the heap can vary on
the system and is integration specific. Therefore, the kernel driver
will retrieve it using the DTB entry: "protected-heap-name".

The Mali Panthor CSF kernel driver will handle enter/exit of protected
mode with a fair consideration of the job scheduling.

If the system integrator does not provide a protected DMA heap, the driver
will not allow any protected mode execution.


Patch series
------------

[PATCHES 1-2]:
  Thees patches comes from the following patch series:
  https://lore.kernel.org/lkml/20240720071606.27930-1-yunfei.dong@mediatek.com/

  These extend the DMA-buf heap API to allow other kernel drivers to Find
  and allocate memory from dma heaps.

  Note: This patch series do not include a protected DMA heap, as this is
  platform specific.

  * dma-heap: Add proper kref handling on dma-buf heaps
  * dma-heap: Provide accessors so that in-kernel drivers can allocate dmabufs from specific heaps

[PATCHES 3, 5 and 6]:
  These are refactoring to aid the implementation of the protected rendering
  feature itself.

* drm/panthor: De-duplicate FW memory section sync
* drm/panthor: Minor scheduler refactoring
* drm/panthor: Explicit expansion of locked VM region

[Patch 4]:
  This introduces allocation of protected memory inside the Panthor driver.
  It also ensures the protected FW sections are loaded.

  * drm/panthor: Add support for protected memory allocation in panthor

[PATCH 7]:
  This patch implements the logic to handle enter/exit of the GPU protected
  mode in Panthor CSF driver.

  Note: to prevent scheduler priority inversion, only a single CSG is allowed
        to execute while in protected mode. It must be the top priority one.

  * drm/panthor: Add support for entering and exiting protected mode

[PATCH 8]:
  The final patch exposes this feature via the uAPI.

  * drm/panthor: Expose protected rendering features

Testing
-------

1) Platform and development environment

   Any platform containing a Mali CSF type of GPU and a protected memory allocator
   that is based on DMA Heap can be used. For example, it can be a physical platform
   or a simulator such as Arm Total Compute FVPs platforms. Reference to the latter:

     https://developer.arm.com/Tools%20and%20Software/Fixed%20Virtual%20Platforms/Total%20Compute%20FVPs

2) Mesa:

PanVK support can be found here:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40044

This is still work in progress.

Constraints
-----------

At the time of developing the feature, Linux kernel does not have a generic
way of implementing protected DMA heaps. The patch series relies on previous
work to expose the DMA heap API to the kernel drivers.

The Mali CSF GPU requires device level allocated protected memory, which do
not belong to a process. The current Linux implementation of DMA heap only
allows a user space program to allocate from such heap. Having the ability
to allocate this memory at the kernel level via the DMA heap API would allow
support for protected mode on Mali CSF GPUs.



Florent Tomasin (3):
  drm/panthor: Add support for protected memory allocation in panthor
  drm/panthor: Minor scheduler refactoring
  drm/panthor: Add support for entering and exiting protected mode

John Stultz (2):
  dma-heap: Add proper kref handling on dma-buf heaps
  dma-heap: Provide accessors so that in-kernel drivers can allocate dmabufs from specific heaps

Ketil Johnsen (3):
  drm/panthor: De-duplicate FW memory section sync
  drm/panthor: Explicit expansion of locked VM region
  drm/panthor: Expose protected rendering features

 Documentation/gpu/panthor.rst            |  47 +++
 drivers/dma-buf/dma-heap.c               | 109 ++++++-
 drivers/gpu/drm/panthor/Kconfig          |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |  29 +-
 drivers/gpu/drm/panthor/panthor_device.h |  15 +
 drivers/gpu/drm/panthor/panthor_drv.c    |  21 +-
 drivers/gpu/drm/panthor/panthor_fw.c     | 137 ++++++--
 drivers/gpu/drm/panthor/panthor_fw.h     |   7 +
 drivers/gpu/drm/panthor/panthor_gem.c    |  77 ++++-
 drivers/gpu/drm/panthor/panthor_gem.h    |  16 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    |  14 +-
 drivers/gpu/drm/panthor/panthor_gpu.h    |   6 +
 drivers/gpu/drm/panthor/panthor_heap.c   |   2 +
 drivers/gpu/drm/panthor/panthor_mmu.c    |  79 +++--
 drivers/gpu/drm/panthor/panthor_sched.c  | 387 ++++++++++++++++++-----
 include/linux/dma-heap.h                 |   8 +
 include/uapi/drm/panthor_drm.h           |  45 ++-
 17 files changed, 864 insertions(+), 136 deletions(-)

-- 
2.43.0


