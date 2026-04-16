Return-Path: <linux-media+bounces-58885-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKZUFIvi4GlhnAAAu9opvQ
	(envelope-from <linux-media+bounces-58885-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:22:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC9140EBA9
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 15:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 480A830E3905
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 13:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F212D396B68;
	Thu, 16 Apr 2026 13:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="n6R1ydmS"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75383242BE;
	Thu, 16 Apr 2026 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345524; cv=none; b=gmnWcczf0wgwfOR99CLV4q5D77KTxloIWbgDlFWxXCliFdKcEZX5B8fjijlLo2zptfTwX0uvjz6tNf6i1iTslwIE3ejPTrC+UiBu6YMcTgcad9NGRwzUMJU2CaI0z8sPSKhNDregLHvGbXazzOzvp3NQLFgkeAVZXUg1VDxTOiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345524; c=relaxed/simple;
	bh=e9advTTHGcSPpXXMDWv1DmZDs9a2tUwvONPBppxU140=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YVIvLfMmPSK4BzjWzrIzlhYnkiKbBDfz9oj44BuA98Q8NwGy9hhkNSrGqgF7p7W7PHVAClM6Yizs8D3VL4NbJwckm4zp3LHdEuNWo9cxA2g7Yle3RZ74lJojHL3Z5C8uJ4n5aL3BEi1pSa0A0cOP988tSwJIQ4KK87kr8VTIpcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=n6R1ydmS; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G0rQRf3422133;
	Thu, 16 Apr 2026 06:18:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=s2048-2025-q2; bh=uWvoP8xihtbjlTOo0V
	GZ9+gjNI+WyhvME6ivf0yFcew=; b=n6R1ydmSABpKNOFEwmjUirdeSdLBQDyOCY
	Uz8dExrw69NhoydATn1iXuB8wms3e8gRdXcpimnAdKIQ7YU/np5gK+dDnnXrh1//
	C4Mq7PS7rd1Xh0dG5FPWhdO3g8Y93LRiP/WCb11cL1Uavv5+6X7mQ9P7F7qd51fU
	HY5fUdwPr2z0pVL7ccVAZcEUv6IElFXYL2LGbIm11Mpyy+1kM3rvX3b3qeeq1G9x
	ODugDDV3SuIwUWYsnNjXMkYhByV5a9Sn4LGwrBoqBaL/A96q1/3hyD/T8iF2OiMe
	egkI+tYEsIfoT03qATlmIYutWGnYTreFKp/hgbMt6N5Xx51pk4+A==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4dh84w1rkh-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Apr 2026 06:18:27 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1b::2d) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Thu, 16 Apr
 2026 13:18:25 +0000
From: Matt Evans <mattev@meta.com>
To: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
        Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
CC: Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal
	<ankita@nvidia.com>,
        Pranjal Shrivastava <praan@google.com>,
        Alistair Popple
	<apopple@nvidia.com>,
        Vivek Kasireddy <vivek.kasireddy@intel.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <kvm@vger.kernel.org>
Subject: [PATCH 0/9] vfio/pci: Add mmap() for DMABUFs
Date: Thu, 16 Apr 2026 06:17:43 -0700
Message-ID: <20260416131815.2729131-1-mattev@meta.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: xvJ97mvJ2CwTMNnEjPSB-JkHSnbjtg01
X-Authority-Analysis: v=2.4 cv=OYioyBTY c=1 sm=1 tr=0 ts=69e0e1a3 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_1IyUuN4QrATX339ibzo:22 a=VwQbUJbxAAAA:8 a=FOH2dFAWAAAA:8 a=VabnemYjAAAA:8
 a=NEAV23lmAAAA:8 a=qjuhjZv_-3ty6mOANPAA:9 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEyNiBTYWx0ZWRfX5gbqR3zwJw/m
 BcZ09fwyz6uVjq0MXNorZbmpWflo9n5IMBIFuyvicX3xDermC9SJncIiDS2ZUwCHbtxoNB/hBV9
 6AWXF9PRt/AdtHw1rZN2ce6Kdv0XzAWMdjztYd4yM7bTZPFSEcDrCD0cBr9kz71RZTed4bEbQP2
 ygKX4grl+u1b7mIoQCK44s0y2JivWmPLYHFs6SAzYNGSXj0YyOUM0LV7ASCPqJP5KGl3aECr9FB
 FbRfMo4jHJ3MQGeB7U46ftdBpsGEshze6n2xDT2MSUBW0QQ+JMptZ4FLWfr4Smp/tRK4OgIiPXy
 hiwKcesi0D4nRWZAkCRA0QxkrJtKgtWGhzEz8fWK8/0ft7CD521Rj5moO+Z4ox4YYK/GqouAkJe
 nolqRqi/BUH/U0YN8BXXRnBie/OL3oCSu52xuWOQON/0HPnHxmUcAymPfGyzn/Wq4mK+GxfEqsJ
 b98FbiGvPAwWCJ7NODQ==
X-Proofpoint-GUID: xvJ97mvJ2CwTMNnEjPSB-JkHSnbjtg01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-58885-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,meta.com:dkim,meta.com:mid]
X-Rspamd-Queue-Id: 9DC9140EBA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi all,


This series is based on previous RFCs/discussions:

Tech topic: https://lore.kernel.org/linux-iommu/20250918214425.2677057-1-amastro@fb.com/
RFCv1:	    https://lore.kernel.org/all/20260226202211.929005-1-mattev@meta.com/
RFCv2:	    https://lore.kernel.org/kvm/20260312184613.3710705-1-mattev@meta.com/


The background/rationale is covered in more detail in the RFC cover
letters.  The TL;DR is:

The goal is to enable userspace driver designs that use VFIO to export
DMABUFs representing subsets of PCI device BARs, and "vend" those
buffers from a primary process to other subordinate processes by fd.
These processes then mmap() the buffers and their access to the device
is isolated to the exported ranges.  This is an improvement on sharing
the VFIO device fd to subordinate processes, which would allow
unfettered access .

This is achieved by enabling mmap() of vfio-pci DMABUFs.  Second, a
new ioctl()-based revocation mechanism is added to allow the primary
process to forcibly revoke access to previously-shared BAR spans, even
if the subordinate processes haven't cleanly exited.

(The related topic of safe delegation of iommufd control to the
subordinate processes is not addressed here, and is follow-up work.)

As well as isolation and revocation, another advantage to accessing a
BAR through a VMA backed by a DMABUF is that it's straightforward to
create the buffer with access attributes, such as write-combining.


Notes on patches
================

Feedback from the RFCs requested that, instead of creating
DMABUF-specific vm_ops and .fault paths, to go the whole way and
migrate the existing VFIO PCI BAR mmap() to be backed by a DMABUF too,
resulting in a common vm_ops and fault handler for mmap()s of both the
VFIO device and explicitly-exported DMABUFs.  This has been done for
vfio-pci, but not sub-drivers (nvgrace-gpu's special-case mappings are
unchanged).


 vfio/pci: Fix vfio_pci_dma_buf_cleanup() double-put

   A bug fix to a related are, whose context is a depdency for later
   patches.


 vfio/pci: Add a helper to look up PFNs for DMABUFs
 vfio/pci: Add a helper to create a DMABUF for a BAR-map VMA

   The first is for a DMABUF VMA fault handler to determine
   arbitrary-sized PFNs from ranges in DMABUF.  Secondly, refactor
   DMABUF export for use by the existing export feature and a new
   helper that creates a DMABUF corresponding to a VFIO BAR mmap()
   request.


 vfio/pci: Convert BAR mmap() to use a DMABUF

   The vfio-pci core mmap() creates a DMABUF with the helper, and the
   vm_ops fault handler uses the other helper to resolve the fault.
   Because this depends on DMABUF structs/code, CONFIG_VFIO_PCI_CORE
   needs to depend on CONFIG_DMA_SHARED_BUFFER.  The
   CONFIG_VFIO_PCI_DMABUF still conditionally enables the export
   support code.

   NOTE: The user mmap()s a device fd, but the resulting VMA's vm_file
   becomes that of the DMABUF which takes ownership of the device and
   puts it on release.  This maintains the existing behaviour of a VMA
   keeping the VFIO device open.

   BAR zapping then happens via the existing vfio_pci_dma_buf_move()
   path, which now needs to unmap PTEs in the DMABUF's address_space.


 vfio/pci: Provide a user-facing name for BAR mappings

   There was a request for decent debug naming in /proc/<pid>/maps
   etc.  comparable to the existing VFIO names: since the VMAs are
   DMABUFs, they have a "dmabuf:" prefix and can't be 100% identical
   to before.  This is a user-visible change, but this patch at least
   now gives us extra info on the BDF & BAR being mapped.


 vfio/pci: Clean up BAR zap and revocation

   In general (see NOTE!) the vfio_pci_zap_bars() is now obsolete,
   since it unmaps PTEs in the VFIO device address_space which is now
   unused.  This consolidates all calls (e.g. around reset) with the
   neighbouring vfio_pci_dma_buf_move()s into new functions, to
   revoke-zap/unrevoke.

   NOTE: the nvgrace-gpu driver continues to use its own private
   vm_ops, fault handler, etc. for its special memregions, and these
   DO still add PTEs to the VFIO device address_space.  So, a
   temporary flag, vdev->bar_needs_zap, maintains the old behaviour
   for this use.  At least this patch's consolidation makes it easy
   to remove the remaining zap when this need goes away.

   A FIXME is added: if nvgrace-gpu is converted to DMABUFs, remove
   the flag and final zap.


 vfio/pci: Support mmap() of a VFIO DMABUF

   Adds mmap() for a DMABUF fd exported from vfio-pci.

   It was a goal to keep the VFIO device fd lifetime behaviour
   unchanged with respect to the DMABUFs.  An application can close
   all device fds, and this will revoke/clean up all DMABUFs; no
   mappings or other access can be performed now.  When enabling
   mmap() of the DMABUFs, this means access through the VMA is also
   revoked.  This complicates the fault handler because whilst the
   DMABUF exists, it has no guarantee that the corresponding VFIO
   device is still alive.  Adds synchronisation ensuring the vdev is
   available before vdev->memory_lock is touched.

   (I decided against the alternative of preventing cleanup by holding
   the VFIO device open if any DMABUFs exist, because it's both a
   change of behaviour and less clean overall.)

   I've added a chonky comment in place, happy to clarify more if you
   have ideas.


 vfio/pci: Permanently revoke a DMABUF on request

   By weight, this is mostly a rename of revoked to an enum, status.
   There are now 3 states for a buffer, usable and revoked
   temporary/permanent.  A new VFIO device ioctl is added,
   VFIO_DEVICE_PCI_DMABUF_REVOKE, which passes a DMABUF (exported from
   that device) and permanently revokes it.  Thus a userspace driver
   can guarantee any downstream consumers of a shared fd are prevented
   from accessing a BAR range, and that range can be reused.

   The code doing revocation in vfio_pci_dma_buf_move() is moved,
   unchanged, to a common function for use by _move() and the new
   ioctl path.

   Q:  I can't think of a good reason to temporarily revoke/unrevoke
   buffers from userspace, so didn't add a 'flags' field to the ioctl
   struct.  Easy to add if people think it's worthwhile for future
   use.


 vfio/pci: Add mmap() attributes to DMABUF feature

   Reserves bits [31:28] in vfio_device_feature_dma_buf to allow a
   (CPU) mapping attribute to be specified for an exported set of
   ranges.  The default is the current UC, and a new flag can specify
   CPU access as WC.

   Q:  I've taken 4 bits; the intention is for this field to be a
   scalar not a bitmap (i.e. mutually-exclusive access properties).
   Perhaps 4 is a bit too many?


Testing
=======

(The [RFC ONLY] userspace test program, for QEMU edu-plus, has been
dropped, but can be found in the GitHub branch below.)

This code has been tested in mapping DMABUFs of single/multiple
ranges, aliasing mmap()s, aliasing ranges across DMABUFs, vm_pgoff >
0, revocation, shutdown/cleanup scenarios, and hugepage mappings seem
to work correctly.  I've lightly tested WC mappings also (by observing
resulting PTEs as having the correct attributes...).  No regressions
observed on the VFIO selftests, or on our internal vfio-pci
applications.


End
===

This is based on -next (next-20260414 but will merge earlier), as it
depends on Leon's series "vfio: Wait for dma-buf invalidation to
complete":

https://lore.kernel.org/linux-iommu/20260205-nocturnal-poetic-chamois-f566ad@houat/T/#m310cd07011e3a1461b6fda45e3f9b886ba76571a

These commits are on GitHub, along with "[RFC ONLY] selftests: vfio: Add
standalone vfio_dmabuf_mmap_test":

https://github.com/metamev/linux/compare/next-20260414...metamev:linux:dev/mev/vfio-dmabuf-mmap


Thanks for reading,


Matt


================================================================================
Change log:


v1:

 - Cleanup of the common DMABUF-aware VMA vm_ops fault handler and
   export code.
 - Fixed a lot of races, particularly faults racing with DMABUF
   cleanup (if the VFIO device fds close, for example).
 - Added nicer human-readable names for VFIO mmap() VMAs


RFCv2:  Respin based on the feedback/suggestions:
https://lore.kernel.org/kvm/20260312184613.3710705-1-mattev@meta.com/

 - Transform the existing VFIO BAR mmap path to also use DMABUFs
   behind the scenes, and then simply share that code for
   explicitly-mapped DMABUFs.  Jason wanted to go that direction to
   enable iommufd VFIO type 1 emulation to pick up a DMABUF for an IO
   mapping.

 - Revoke buffers using a VFIO device fd ioctl

RFCv1:
https://lore.kernel.org/all/20260226202211.929005-1-mattev@meta.com/


Matt Evans (9):
  vfio/pci: Fix vfio_pci_dma_buf_cleanup() double-put
  vfio/pci: Add a helper to look up PFNs for DMABUFs
  vfio/pci: Add a helper to create a DMABUF for a BAR-map VMA
  vfio/pci: Convert BAR mmap() to use a DMABUF
  vfio/pci: Provide a user-facing name for BAR mappings
  vfio/pci: Clean up BAR zap and revocation
  vfio/pci: Support mmap() of a VFIO DMABUF
  vfio/pci: Permanently revoke a DMABUF on request
  vfio/pci: Add mmap() attributes to DMABUF feature

 drivers/vfio/pci/Kconfig            |   3 +-
 drivers/vfio/pci/Makefile           |   3 +-
 drivers/vfio/pci/nvgrace-gpu/main.c |   5 +
 drivers/vfio/pci/vfio_pci_config.c  |  30 +-
 drivers/vfio/pci/vfio_pci_core.c    | 224 ++++++++++---
 drivers/vfio/pci/vfio_pci_dmabuf.c  | 500 +++++++++++++++++++++++-----
 drivers/vfio/pci/vfio_pci_priv.h    |  49 ++-
 include/linux/vfio_pci_core.h       |   1 +
 include/uapi/linux/vfio.h           |  42 ++-
 9 files changed, 690 insertions(+), 167 deletions(-)

-- 
2.47.3


