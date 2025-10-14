Return-Path: <linux-media+bounces-44346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 999E6BD7D19
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 09:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 821D24ECF0E
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 07:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6276D30DEA1;
	Tue, 14 Oct 2025 07:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqFsCipD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C2B307AE4
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 07:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426038; cv=none; b=sihWThYxTXq3wSMKs6jnMitvJvTzbuGBXrKMKWOhHyfrUj513tRtnYdrO0OJDubw+wQ5WXOvyOa+dRepb5XKWVQQVY90PFd0MTZ1zNx0VUmK7FQaRX2dunumGT4sIQBA8GslT7Pe1O5zWhJKudfVHYFUtoAZgkv7GVsqBL/SBKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426038; c=relaxed/simple;
	bh=7e3TGyZywB21Vu0/e0A9fczh8EzgWJG4tKhN9TqfLKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oAWeNnIY8BeQUFrwsUdhPAuDwqHlAei0ZGJRtt1ThDtoaRPCXPR3iw8i0nQYg8rZZDsoNn3yNCA1/9IbPob8+tZRSshIwca5oTANETsys5sxPBMOzOADXwN/EbTjAKB1nmGe2ty1Rq3FBXtrYwG+jo67KMZLSQ1scvMRT768bT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqFsCipD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426037; x=1791962037;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7e3TGyZywB21Vu0/e0A9fczh8EzgWJG4tKhN9TqfLKA=;
  b=hqFsCipDZ7BL7ZD7JsRfs7Iy8S6bEDr+Zg8wABNN64k8Q4ImKSdjM2ya
   ElvPdTgB4geQajGKozU8S2PPfGN6GSbQiIpEuYC3M9Q+GsxTwLxRih/vg
   EFKMn3LgU+LH7oPV7HzIL/LpXaLWbbLWWrnft1uFMX1T1CT7Er5Sw99v8
   SIn8I+w2E12BmnYq+rCq/V9bX6UMA4yxG7GxXcZzVeLapakP9tCpeVYdQ
   zmRDix8KBciEmp+/luWhJgKYNWbrxttbzOHtWCsxj6U8owpB40/AhOVfH
   j+eFfJCHFI+gIiKyCzQjs9rxJfDTEb8OozA9A+2AWUGGqg4oNCmGU6TcA
   A==;
X-CSE-ConnectionGUID: oyan7fxmQ6+7X3kEIdgZuw==
X-CSE-MsgGUID: KwzTwoIRSRq0tBACAeVpWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73257108"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="73257108"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:56 -0700
X-CSE-ConnectionGUID: swh+auFQROW2Qr5zTdTA6w==
X-CSE-MsgGUID: qJVGGFCERaKZudj2tCjxTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="181369842"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:55 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Dongwon Kim <dongwon.kim@intel.com>
Subject: [RFC 0/8] dma-buf: Add support for mapping dmabufs via interconnects
Date: Tue, 14 Oct 2025 00:08:50 -0700
Message-ID: <20251014071243.811884-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In a typical dma-buf use case, a dmabuf exporter makes its buffer
buffer available to an importer by mapping it using DMA APIs
such as dma_map_sgtable() or dma_map_resource(). However, this
is not desirable in some cases where the exporter and importer
are directly connected via a physical or virtual link (or
interconnect) and the importer can access the buffer without
having it DMA mapped.

So, to address this scenario, this patch series adds APIs to map/
unmap dmabufs via interconnects and also provides a helper to
identify the first common interconnect between the exporter and
importer. Furthermore, this patch series also adds support for
IOV interconnect in the vfio-pci driver and Intel Xe driver.

The IOV interconnect is a virtual interconnect between an SRIOV
physical function (PF) and its virtual functions (VFs). And, for
the IOV interconnect, the addresses associated with a buffer are
shared using an xarray (instead of an sg_table) that is populated
with entries of type struct range. 

The dma-buf patches in this series are based on ideas/suggestions
provided by Jason Gunthorpe, Christian Koenig and Thomas Hellström.
Note that the Xe driver patches in this series need to be rebased
in the next version to include feedback from the previous round
of review.

Patchset overview:
Patch 1-3: Add dma-buf APIs to map/unmap and match
Patch 4: Add support for IOV interconnect in vfio-pci driver
Patch 5: Add support for IOV interconnect in Xe driver
Patch 6-8: Create and use a new dma_addr array for LMEM based
           dmabuf BOs to store translated addresses (DPAs)

This series is rebased on top of the following repo:
https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/log/?h=dmabuf-vfio-v5

Associated Qemu patch series:
https://lore.kernel.org/qemu-devel/20251003234138.85820-1-vivek.kasireddy@intel.com/
Associated vfio-pci patch series:
https://lore.kernel.org/dri-devel/cover.1760368250.git.leon@kernel.org/

This series is tested using the following method:
- Run Qemu with the following relevant options:
  qemu-system-x86_64 -m 4096m ....
  -device ioh3420,id=root_port1,bus=pcie.0
  -device x3130-upstream,id=upstream1,bus=root_port1
  -device xio3130-downstream,id=downstream1,bus=upstream1,chassis=9
  -device xio3130-downstream,id=downstream2,bus=upstream1,chassis=10
  -device vfio-pci,host=0000:03:00.1,bus=downstream1
  -device virtio-gpu,max_outputs=1,blob=true,xres=1920,yres=1080,bus=downstream2
  -display gtk,gl=on
  -object memory-backend-memfd,id=mem1,size=4096M
  -machine q35,accel=kvm,memory-backend=mem1 ...
- Run Gnome Wayland with the following options in the Guest VM:
  # cat /usr/lib/udev/rules.d/61-mutter-primary-gpu.rules
  ENV{DEVNAME}=="/dev/dri/card1", TAG+="mutter-device-preferred-primary", TAG+="mutter-device-disable-kms-modifiers"
  # XDG_SESSION_TYPE=wayland dbus-run-session -- /usr/bin/gnome-shell --wayland --no-x11 &

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>

Vivek Kasireddy (8):
  dma-buf: Add support for map/unmap APIs for interconnects
  dma-buf: Add a helper to match interconnects between exporter/importer
  dma-buf: Add support for IOV interconnect
  vfio/pci/dmabuf: Add support for IOV interconnect
  drm/xe/dma_buf: Add support for IOV interconnect
  drm/xe/pf: Add a helper function to get a VF's backing object in LMEM
  drm/xe/bo: Create new dma_addr array for dmabuf BOs associated with
    VFs
  drm/xe/pt: Add an additional check for dmabuf BOs while doing bind

 drivers/dma-buf/dma-buf.c                  | 113 +++++++++++++++-
 drivers/gpu/drm/xe/xe_bo.c                 | 148 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_bo_types.h           |  12 ++
 drivers/gpu/drm/xe/xe_dma_buf.c            |  19 ++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  23 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |   1 +
 drivers/gpu/drm/xe/xe_pt.c                 |   8 ++
 drivers/gpu/drm/xe/xe_sriov_pf_types.h     |  19 +++
 drivers/vfio/pci/vfio_pci_dmabuf.c         | 141 +++++++++++++++++++-
 include/linux/dma-buf-interconnect.h       |  51 +++++++
 include/linux/dma-buf.h                    |  20 +++
 11 files changed, 540 insertions(+), 15 deletions(-)
 create mode 100644 include/linux/dma-buf-interconnect.h

-- 
2.50.1


