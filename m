Return-Path: <linux-media+bounces-64474-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wLpAJWWKKWogZAMAu9opvQ
	(envelope-from <linux-media+bounces-64474-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:01:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7475166B1E3
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:01:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=tCN4QYX2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64474-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64474-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CF2430CE1A7
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 15:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276B742DFEF;
	Wed, 10 Jun 2026 15:44:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6E73D8918;
	Wed, 10 Jun 2026 15:44:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106261; cv=none; b=tnefRDxEira32Cnm6u487M5OMzN66st5K3kWnmCXwbYe2QKbI7LXDLtg5nJVw4IRzuzgmm3cxmd9XMVHgGThcf35YefX18+wbzDE1ICr6ds9vu+5wgKILLAdhRdRWaX1GBOfHGmxNnSVlqUxZVVsyGUbd84pYG/jTAzJlD9mrIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106261; c=relaxed/simple;
	bh=T8eU7IoZSKrHMsPBlJVdxwbHnIox+SDoIa9Tk63wGVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KWV9iIvyJkLrgCYBbn5j5vkZAU+2TNf1iBtteWaEfEfihOts1YeCTU7BtrA42EvxMzooFIbYz6qCd3WiIWtiCOObBbiN8FUXczNSTHNjzYqndGOdhTDV6WhHV56wvkqHFJezefgNsfurUUBZBFUgvpUEHKNsK0yuzTK4EtC4YkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=tCN4QYX2; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1781106249;
	bh=QxiwaJXK0eusahTJ98NMZLJo2Ex1cKOT1GYTyk1Nsc4=;
	h=From:To:Cc:Subject:Date:From;
	b=tCN4QYX2RjHa2Pz0V8jjk87/ugPZGdlb8GPTgeq+LU22b/CIVPlu1B9JGBow/hZ6N
	 XnuKVZSRNzlfrj5nzFTZvQ+q09GMpngERLBsyju5ohtulnkwoVZRFRVi9za2HGFweG
	 jGZDMoB3O2LcIddEL8Ar8xXrQSEy9gleoX7ZT4KJOSXuiNXE/iGsbcm4ifpwu46YLj
	 mnAIHyDOR8WZCxJz4kIzDp6Lov5pxKTykapmYahTwDU0AWVy3OV3EDRFMMWU8ocEme
	 MhJO0GT9jrb8DnUqz7qveBN7JWkoLXDwISo/gtfYtAWeGWnAI+DB4wfsM+iKXUS+jo
	 b84PX2cLDEvEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gb97C4Dtwz4wKh;
	Thu, 11 Jun 2026 01:44:07 +1000 (AEST)
From: Matt Evans <matt@ozlabs.org>
To: Alex Williamson <alex@shazbot.org>,
	Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Alex Mastro <amastro@fb.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>
Cc: Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v3 0/9] vfio/pci: Add mmap() for DMABUFs
Date: Wed, 10 Jun 2026 16:43:14 +0100
Message-ID: <20260610154327.37758-1-matt@ozlabs.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64474-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ozlabs.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7475166B1E3

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
to subordinate processes.  Second, a new revocation mechanism is added
to allow the primary process to forcibly revoke access to
previously-shared BAR spans, even if the subordinate processes haven't
cleanly exited.

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

   This splits out p2pdma_core.c under CONFIG_PCI_P2PDMA_CORE (which
   currently contains pcim_p2pdma_provider()), and an optional
   CONFIG_PCI_P2PDMA which depends on ZONE_DEVICE etc. providing
   P2P functionality in the existing p2pdma.c.


 vfio/pci: Add a helper to look up PFNs for DMABUFs
 vfio/pci: Add a helper to create a DMABUF for a BAR-map VMA

   The first is for a DMABUF VMA fault handler to determine
   arbitrary-sized PFNs from ranges in DMABUF.  Secondly, refactor
   DMABUF export for use by the existing export feature and add a
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
   becomes that of the DMABUF.  The DMABUF takes ownership of the
   device and put()s it on release, which maintains the existing
   behaviour of a VMA keeping the VFIO device open.

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
   revoke-zap/unrevoke.  This makes the "revoke/un-revoke" steps
   clearer.

   NOTE: Because drivers can use their own vm_ops and override .mmap,
   the core must conservatively assume an overridden .mmap might still
   add PTEs to the VFIO device address_space and therefore still does
   the zap.  A new flag, zap_bars_on_revoke, enables the zap when
   .mmap is overridden.  A driver that does not need the zap can clear
   this to opt-out, e.g. if the driver calls down to the common mmap
   (and so uses DMABUFs).


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

   This commit makes VFIO_PCI_CORE depend on PCI_P2PDMA_CORE (commit
   1) to bring in (only) the P2PDMA provider code.


 vfio/pci: Permanently revoke a DMABUF on request

   By weight, this is mostly a rename of revoked to an enum, status.
   There are now 3 states for a buffer, usable and revoked
   temporary/permanent.  A new VFIO feature is added,
   VFIO_DEVICE_FEATURE_DMA_BUF_REVOKE, which takes a DMABUF (exported
   from the same device) and permanently revokes it.  Thus a userspace
   driver can guarantee any downstream consumers of a shared fd are
   prevented from accessing a BAR range, and that range can be reused.
   NOTE: This might block userspace, waiting on importers to detach.

   The code doing revocation in vfio_pci_dma_buf_move() is moved,
   unchanged, to a common function for use by ..._move() and this new
   feature.


 vfio/pci: Add mmap() attributes to DMABUF feature

   Adds a new VFIO feature, VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR.
   After a DMABUF is exported, this feature is used to set a memory
   attribute that will be used by future mmap()s of the DMABUF fd.  It
   doesn't affect existing maps.

   The default is UC, and via the feature one can specify CPU access
   as WC.  The attribute is an enum/scalar rather than
   bitmap/cumulative.  The attributes follow a "try-fail" model where
   a client can request an attribute and either succeed or fail with
   ENOENT if it's unknown; if future attributes are platform-specific
   then their support can be probed.

   (Since it's just UC/WC for now, there is no reservation or numeric
   structure to the namespace yet, but we could support
   system/arch-specific values in future by carving out base +
   arch-specific + IMPDEF ranges.)


Testing
=======

(The [RFC ONLY] userspace test program, for QEMU edu-plus, can be
found in the GitHub branch below.  It at least illustrates how the
export, map, revoke, attribute, and close semantics interoperate.)

This code has been tested in mapping DMABUFs of single/multiple ranges
from multiple BARs, aliasing mmap()s, aliasing ranges across DMABUFs,
vm_pgoff > 0, revocation, shutdown/cleanup scenarios, and hugepage
mappings.  I've lightly tested WC mappings also (by observing
resulting PTEs as having the correct attributes...).  No regressions
observed on the VFIO selftests, or on our internal vfio-pci
applications.  VFIO on i386 has been build-tested.


End
===

This is based on VFIO next (e.g. at b9285405c5f6).

These commits are on GitHub for easier browsing, along with
"[RFC ONLY] selftests: vfio: Add standalone vfio_dmabuf_mmap_test":

https://github.com/metamev/linux/compare/b9285405c5f6...metamev:linux:dev/mev/vfio-dmabuf-mmap-v3


Thanks for reading,


Matt


================================================================================
Change log:

v3:
 - Refactor p2pdma.c: split out pcim_p2pdma_provider() into a new
   p2pdma_core.c under CONFIG_PCI_P2PDMA_CORE.

 - vfio_pci_dma_buf_find_pfn() cleanups: Rename parameter to priv,
   remove bad WARN, move unnecessary addition out of inner loop.

 - vfio_pci_core_mmap_prep_dmabuf() cleanups: Remove uint32_t, remove
   unnecessary const variable.

 - Conversion of BAR mmap() to DMABUF: VFIO_PCI_DMABUF depends on
   VFIO_PCI_CORE. vfio_pci_mmap_huge_fault(): move dev_dbg() outside
   of lock (argh), remove READ_ONCE(vdev)/move priv->vdev read and
   improve comment explanation.

 - On revoke, BAR zap defaults to on if .mmap is overridden by a
   driver (and implements an opt-out for the hisi_acc_vfio_pci driver,
   which overrides mmap() with a simple wrapper that ends up using the
   common DMABUF mmap() rather than custom mappings).

 - Reworded commit "vfio/pci: Support mmap() of a VFIO DMABUF" message
   for clarity.  Reworded vfio_pci_mmap_huge_fault() comment for
   accuracy (vdev validity depends on not being revoked).
   Added comment in mmap() explaining belt-and-braces approach for
   early detecting a map of a revoked buffer.

 - Revoke now uses VFIO_DEVICE_FEATURE_DMA_BUF rather than a new
   ioctl(); instead of the revoke helper taking 'revoked/permanently'
   bools, it's become vfio_pci_dma_buf_set_status() taking a single
   status enum.  Added a READ_ONCE() for the lockless test of
   priv->vdev (flags it as intentional, even if it's in practice going
   to be a single-copy atomic read).

 - Removed GET on vfio_pci_core_feature_dma_buf_memattr(), removed
   unnecessary taking of memory_lock, fixed error return values.  In
   particular, removes ENOTSUPP, and uses ENOENT to indicate an
   unknown attribute enum value was passed to SET.  In the discussion
   here,
   https://lore.kernel.org/all/20260602131417.41366391@shazbot.org/
   we'd agreed on EOPNOTSUPP before I realised that's already used
   elsewhere.  ENOENT uniquely indicates an unknown attribute.


v2:
https://lore.kernel.org/all/20260527102319.100128-1-mattev@meta.com/

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

 MAINTAINERS                                   |   2 +-
 drivers/pci/Kconfig                           |  10 +-
 drivers/pci/Makefile                          |   1 +
 drivers/pci/p2pdma.c                          | 109 +---
 drivers/pci/p2pdma.h                          |  29 +
 drivers/pci/p2pdma_core.c                     | 118 ++++
 drivers/vfio/pci/Kconfig                      |   5 +-
 drivers/vfio/pci/Makefile                     |   3 +-
 .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |   8 +
 drivers/vfio/pci/vfio_pci_config.c            |  30 +-
 drivers/vfio/pci/vfio_pci_core.c              | 213 +++++--
 drivers/vfio/pci/vfio_pci_dmabuf.c            | 564 +++++++++++++++---
 drivers/vfio/pci/vfio_pci_priv.h              |  64 +-
 include/linux/pci-p2pdma.h                    |  24 +-
 include/linux/pci.h                           |   2 +-
 include/linux/vfio_pci_core.h                 |   1 +
 include/uapi/linux/vfio.h                     |  47 ++
 17 files changed, 958 insertions(+), 272 deletions(-)
 create mode 100644 drivers/pci/p2pdma.h
 create mode 100644 drivers/pci/p2pdma_core.c

-- 
2.50.1 (Apple Git-155)


