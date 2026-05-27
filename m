Return-Path: <linux-media+bounces-62867-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPz7MrLGFmpVrwcAu9opvQ
	(envelope-from <linux-media+bounces-62867-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 12:25:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 078C85E2A76
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 12:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB526301A2C3
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4304E3F39F6;
	Wed, 27 May 2026 10:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="TvqXTS+v"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4843EEAE1;
	Wed, 27 May 2026 10:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779877441; cv=none; b=OKud+RrHLP/iM+mzADN8i0BxdKXLfF90a4eXKsJ1/iq0KLqMhOza9l+Iu80aMn8T65sQd4dGHJUMAMlnczj0y8CjktyknLE78cgPzUKcSsv9rxuVchNEWrThwBEw8MeITPZynvukHkcv5TOv2yzZmrvRCZ9HxgNVpWDeq5eptJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779877441; c=relaxed/simple;
	bh=JcIS8uyojQwRsnN2619nn6WvyykF2WADlUwjdA0DjfI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y7+1IEplpf5Zh8UlSjaAOmDgIrYNAYyZrGdrwmNhYE19Mm9vM8x9KRtPDAscVuRXNfB60nou0sskX2K/kHsFs0L3RW769eC7ATkDkQJvcfHEVw67oWKkMyEHzqdglYJkHXL2KCZq++8cYoN2n+ipXPU2KRBjegqfIXra0kVEa4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=TvqXTS+v; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R6Idck2507771;
	Wed, 27 May 2026 03:23:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=s2048-2025-q2; bh=BuInzWm6zlnr40MeLG
	Xyu48AjR8YXaNjRNA9wv7wh9s=; b=TvqXTS+vDPs+whi8CfXfKby7Bvox8F/qZO
	oEz0bfZ+PeiBpu1wgSfnrHT+hOhVNUbMFqSd3Xwy1NXQvOWxMecZh3YT8JegzQ01
	5H2kMisJBBrAit30l8Vj4RGnMjOETK9sXCKsuOsVag7/uYs3QS15ZK22nWbNGDH+
	fdiZqFoHeEU6ZU2tmShL+9Pwbi/A9Rnt/U0rqAWbKzvgCh+DpZC8JFrTnHWaMn86
	ODeKylxt9h/KYANsBd5aYikzQsr6AbxixBCKgGbisWN7VPKVc5ZPg0cZVitAG9PH
	UH+PcuVF7yD7S1VbU/+0ILe3PNLNa5UYi3gFtGrK0wl0qf7MJstA==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4edpnga485-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 27 May 2026 03:23:28 -0700 (PDT)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 27 May
 2026 10:23:26 +0000
From: Matt Evans <mattev@meta.com>
To: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
        Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Bjorn Helgaas
	<bhelgaas@google.com>,
        Logan Gunthorpe <logang@deltatee.com>
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
        <kvm@vger.kernel.org>, <linux-pci@vger.kernel.org>
Subject: [PATCH v2 0/9] vfio/pci: Add mmap() for DMABUFs
Date: Wed, 27 May 2026 03:23:03 -0700
Message-ID: <20260527102319.100128-1-mattev@meta.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: pDX_pw9F0mPlau3NKH58yeq_Xy9cVwzx
X-Authority-Analysis: v=2.4 cv=PME/P/qC c=1 sm=1 tr=0 ts=6a16c621 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=kkcUborcUVj0H7zxAXTl:22 a=VwQbUJbxAAAA:8 a=FOH2dFAWAAAA:8 a=VabnemYjAAAA:8
 a=NEAV23lmAAAA:8 a=h-ECioDzeyvzXXNZi24A:9 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEwMCBTYWx0ZWRfX9GH/QGKNIhYF
 k2y0OfCPd9PjHLger9H36g3A9qaPKmoXqLJS4EIXPcBEJiVebQppGgReFNWjFGZIVH21Nyuz3cv
 7KjY1OJjdeY6vvpfyYEBmiuszRSR9bhsv6M71gFLqoPjqo9VqzyXTufRh0VwKB4lCp/RSzDuocT
 Yk5pPd2TGUIXu9QicQH7tFUiPS1xEanT/Bg1L3EYni8DRXocrbKCEeTqDcGHsaKF2Dvp23ly3S0
 TlEKPk4Qt7UxriYRPbidPLweC0wKyudnp6LYkm0l88sEG8AUu2cEVWwbQ7i29lj1zb6hujD/4to
 j66ygBFWps4NJjADdssdUVb4idNEM2deJ+TRtsmB2K3AsQShMwYWfaJjthq7QL8bNT/AGuxTfTu
 ord+iJ40c5zvNAVPrmCfDnGKh1lJjkX3xon7V1mhYFo6LeFbmZUxRp1yj3Fz94jpB/UiMN7760I
 tEp89peWJ13UhgvQ+uw==
X-Proofpoint-ORIG-GUID: pDX_pw9F0mPlau3NKH58yeq_Xy9cVwzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-62867-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:mid,meta.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 078C85E2A76
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
unfettered access.

This is achieved by enabling mmap() of vfio-pci DMABUFs, passed by fd
to subordinate processes.  Second, a new ioctl()-based revocation
mechanism is added to allow the primary process to forcibly revoke
access to previously-shared BAR spans, even if the subordinate
processes haven't cleanly exited.

(The related topic of safe delegation of iommufd control to the
subordinate processes is not addressed here, and is follow-up work.)

As well as isolation and revocation, another advantage to accessing a
BAR through a VMA backed by a DMABUF is that it's straightforward to
mmap() the buffer with access attributes, such as write-combining.

Feedback from the RFCs requested that, instead of creating
DMABUF-specific vm_ops and .fault paths, to go the whole way and
migrate the existing VFIO PCI BAR mmap() to be backed by a DMABUF too,
resulting in a common vm_ops and fault handler for mmap()s of both the
VFIO device and explicitly-exported DMABUFs.  This will help future
iommufd emulation of VFIO Type1 peer-to-peer, making it easier to get
a DMABUF for a VFIO BAR as a DMA target.

mmap() conversion to use DMABUF underneath has been done for vfio-pci,
but not sub-drivers:

  nvgrace-gpu's mmap() override path is unchanged; I kept this out of
  scope for now not least because I don't have a thorough test setup
  for this system.  I would prefer to help the nvgrace-gpu maintainers
  enable BAR mmap() DMABUFs themselves.


Notes on patches
================


 PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE

   Later in the series, vfio-pci's mmap() is going to depend on
   pcim_p2pdma_provider() which depended on CONFIG_PCI_P2PDMA, which
   in turn depended on ZONE_DEVICE (which isn't available on 32-bit
   and some archs, because they lack MEMORY_HOTPLUG and friends).
   VFIO does _not_ require actual P2P to be present for basic mmap()
   functionality, only for the optional CONFIG_DMA_SHARED_BUFFER
   feature.

   This splits P2PDMA into a CONFIG_PCI_P2PDMA_CORE (which currently
   contains pcim_p2pdma_provider()) and an optional CONFIG_PCI_P2PDMA
   (which depends on ZONE_DEVICE etc., and provides P2P
   functionality).


 vfio/pci: Add a helper to look up PFNs for DMABUFs
 vfio/pci: Add a helper to create a DMABUF for a BAR-map VMA

   The first is for a DMABUF VMA fault handler to determine
   arbitrary-sized PFNs from ranges in DMABUF.  Secondly, refactor
   DMABUF export for use by the existing export feature and add a new
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

   !!! NOTE: the nvgrace-gpu driver continues to use its own private
   vm_ops, fault handler, etc. for its special memregions, and these
   DO still add PTEs to the VFIO device address_space.  So, a
   temporary flag, vdev->bar_needs_zap, maintains the old behaviour
   for this use.  At least this patch's consolidation makes it easy to
   remove the remaining zap when this need goes away; a FIXME reminds
   that this can be removed when nvgrace-gpu is converted.


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
   available before vdev->memory_lock is touched; this holds the
   device registration so that even if the buffer has been cleaned up,
   vdev hasn't been freed and so the lock can be safely taken.

   (I decided against the alternative of preventing cleanup by holding
   the VFIO device open if any DMABUFs exist, because it's both a
   change of behaviour and less clean overall.)

   I've added a chonky comment in place, happy to clarify more if you
   have ideas.

   This commit makes VFIO_PCI_CORE depend on PCI_P2PDMA_CORE (commit
   1) to bring in (only) the P2PDMA provider code.


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

   Adds a new VFIO feature, VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR.
   After a DMABUF is exported, this feature ioctl() isused to set a
   memory attribute that will be used by future mmap()s of the DMABUF
   fd (i.e. it does nothing for any existing maps).

   The default is UC, and via the feature one can specify CPU access
   as WC.  The attribute is an enum/scalar rather than
   bitmap/cumulative.  The attributes follow a "try-fail" model where
   a client can request an attribute and either succeed or fail with
   ENOTSUPP if it's unknown; if future attributes are
   platform-specific then their support can be probed.

   (Since it's just UC/WC for now, there is no reservation or numeric
   structure to the namespace yet, but we could support
   system/arch-specific values in future by carving out base +
   arch-specific + IMPDEF ranges.)


Testing
=======

(The [RFC ONLY] userspace test program, for QEMU edu-plus, has been
dropped from the series, but can be found in the GitHub branch below.
It at least illustrates the export, map, revoke, attribute, and close
semantics interoperate.)

This code has been tested in mapping DMABUFs of single/multiple
ranges, aliasing mmap()s, aliasing ranges across DMABUFs, vm_pgoff >
0, revocation, shutdown/cleanup scenarios, and hugepage mappings seem
to work correctly.  I've lightly tested WC mappings also (by observing
resulting PTEs as having the correct attributes...).  No regressions
observed on the VFIO selftests, or on our internal vfio-pci
applications.


End
===

This is based on VFIO next (e.g. at b9285405c5f6).

These commits are on GitHub for easier browsing, along with
"[RFC ONLY] selftests: vfio: Add standalone vfio_dmabuf_mmap_test":

https://github.com/metamev/linux/compare/b9285405c5f6...metamev:linux:dev/mev/vfio-dmabuf-mmap-v2


Thanks for reading,


Matt


================================================================================
Change log:

v2:

 - Rebase on VFIO next, picking up Alex's
   vfio_pci_dma_buf_move()/vfio_pci_dma_buf_cleanup() fixes, and
   dropping "vfio/pci: Fix vfio_pci_dma_buf_cleanup() double-put"

 - Added "PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE" so that the
   newly-added vfio-pci hard dependency on the P2PDMA provider instead
   pulls in the _CORE variant and not the full-fat CONFIG_PCI_P2PDMA.
   This means that the core of vfio-pci does not need ZONE_DEVICE, but
   if it's available then enabling P2PDMA in turn enables DMABUF
   export.  Fixes basic VFIO operation on 32b or other platforms without
   ZONE_DEVICE.

 - Fixed comment inaccuracy in vfio_pci_dma_buf_revoke() and cleaned
   up vdev validity test.

 - vfio_pci_dma_buf_find_pfn(): use PAGE_ALIGN(), better span variable
   naming, OVF check

 - Made vm_pgoffs use consistent (keeping the resource index at the
   top and masking where offset is used).  For BAR mmap, use new
   vma_pgoff_adjust to create the DMABUF with the exact mmap()ed span
   instead of from the start of the BAR with an invisible portion
   before the mapping.

 - Added VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR to set memory attributes,
   instead of using the export `flags` field.

 - vfio_pci_ioctl_reset: Moved vfio_pci_zap_revoke_bars()
   (effectively, vfio_pci_dma_buf_move()) back after D0 transition.
   Note, if a BAR zap is needed, it's done in this function so now
   happens after this D0 transition with the _move; it was done before
   it at the time of the memory_lock taking.

 - Minimised vfio_pci_dma_buf_mmap() (removed redundant span check),
   added READ_ONCE for memattr

 - Misc fixes: comment in DMABUF name generation, removed superfluous
   READ_ONCE from faulthandler


v1:
https://lore.kernel.org/kvm/20260416131815.2729131-1-mattev@meta.com/

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
  PCI/P2PDMA: Add CONFIG_PCI_P2PDMA_CORE
  vfio/pci: Add a helper to look up PFNs for DMABUFs
  vfio/pci: Add a helper to create a DMABUF for a BAR-map VMA
  vfio/pci: Convert BAR mmap() to use a DMABUF
  vfio/pci: Provide a user-facing name for BAR mappings
  vfio/pci: Clean up BAR zap and revocation
  vfio/pci: Support mmap() of a VFIO DMABUF
  vfio/pci: Permanently revoke a DMABUF on request
  vfio/pci: Add mmap() attributes to DMABUF feature

 drivers/pci/Kconfig                 |  10 +-
 drivers/pci/Makefile                |   2 +-
 drivers/pci/p2pdma.c                |  16 +
 drivers/vfio/pci/Kconfig            |   4 +-
 drivers/vfio/pci/Makefile           |   3 +-
 drivers/vfio/pci/nvgrace-gpu/main.c |   5 +
 drivers/vfio/pci/vfio_pci_config.c  |  30 +-
 drivers/vfio/pci/vfio_pci_core.c    | 225 +++++++++---
 drivers/vfio/pci/vfio_pci_dmabuf.c  | 548 ++++++++++++++++++++++++----
 drivers/vfio/pci/vfio_pci_priv.h    |  57 ++-
 include/linux/pci-p2pdma.h          |  24 +-
 include/linux/pci.h                 |   2 +-
 include/linux/vfio_pci_core.h       |   1 +
 include/uapi/linux/vfio.h           |  57 +++
 14 files changed, 815 insertions(+), 169 deletions(-)

-- 
2.47.3


