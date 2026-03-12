Return-Path: <linux-media+bounces-55526-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLQLMxwKs2kMRwAAu9opvQ
	(envelope-from <linux-media+bounces-55526-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:46:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73721277471
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5330B30379E5
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43CE3FFAD9;
	Thu, 12 Mar 2026 18:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="lgc9YAVH"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9201A2D2481;
	Thu, 12 Mar 2026 18:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341206; cv=none; b=hljFnJcRZTMiiMB/5VhSJUIvwOwXsZc1GGylkGOW5CdEvx8IfqDXpY4KgtQIC2wgJF3lC6Fh4m6bkp7hJ6VVJObk5hW9xfsYxuOFVQ8Gb5hLU+ctU4huw/y3eiJUL+pA26XF4XJR2Fk83y8GnQzpqY/npoEzR6/w0O9m5UF4emk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341206; c=relaxed/simple;
	bh=/3/UCkDFwZRfnmjXob7cEPMdL5ys71tYNMr8/BLJtvk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jfdrTSEKk8SXghVFOuuZQnNxKK4rwbz3gXRrbtOY4G7N5/mcGWCvFyM6GYcg4sjZLwnkNdyjsi0ryqnD5EfG3X8A5TL0/04S7uWy/PsCq8JUoUCXNVKo3pIIkQM7jwjCF/EQWxjCeOZ4rKyUbc7cCstcC9LUYbVgarMZS586sCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=lgc9YAVH; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 62CHs62U736980;
	Thu, 12 Mar 2026 11:46:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=s2048-2025-q2; bh=SebPAxzAbwZ4sR8TrB
	gXGqjGB5kjL87tfUXzYAaiqr4=; b=lgc9YAVHFDkka23/1IXetZqaAHnr+ZYc0N
	bDpm6eNxmg35Lbu4RVfg/OnR2i3efqG4aUPHmhVNBgnNFy79/qdrMZFQDqt5UxDS
	Y0W/eIVUQfNJvm0kByv77RzjhdsDsHYdPdVPMUUmCaMLjJaQuy8oBeqDQeg2BncR
	wtngDadxw9o+aPJInBaCW5q+uGBXIstPosgOYfP9a+SoYvHjN7VwxIKlRmPC2mqF
	H7HTO3SpJQbm2pMg5AIVZNW8Ms8MgpB1618QSGPBr/PomBda/LGnhSP2du7Twp0c
	eFInGnN8yFo3pZLSBLVBzd/nxSAlUwOcoodmIVj8Cgkr6T0HdyVg==
Received: from mail.thefacebook.com ([163.114.134.16])
	by m0001303.ppops.net (PPS) with ESMTPS id 4cv29xs1mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 11:46:27 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 12 Mar
 2026 18:46:26 +0000
From: Matt Evans <mattev@meta.com>
To: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
        Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
        Mahmoud Adam
	<mngyadam@amazon.de>,
        David Matlack <dmatlack@google.com>
CC: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>,
        Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal
	<ankita@nvidia.com>,
        Pranjal Shrivastava <praan@google.com>,
        Alistair Popple
	<apopple@nvidia.com>,
        Vivek Kasireddy <vivek.kasireddy@intel.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <kvm@vger.kernel.org>
Subject: [RFC v2 PATCH 00/10] vfio/pci: Add mmap() for DMABUFs
Date: Thu, 12 Mar 2026 11:45:58 -0700
Message-ID: <20260312184613.3710705-1-mattev@meta.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jXI8TQKq_Doe6vXOdWcCSqqgnYUYBjaV
X-Proofpoint-GUID: jXI8TQKq_Doe6vXOdWcCSqqgnYUYBjaV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1MSBTYWx0ZWRfX9GAz447p88t4
 DxYilgJjn4/e/YE1QpygQ/d24uKsttN1tIwLrQ7VfMWaSvoUpryxXhFtGhNtaB8O4tEiwAr7UBe
 j004boiTD+LUadeYsCpyixfHC342rVM1HkJZCtHajuq8BMTD/uKwZFnXhidFg68pzAtJJ+SQzi7
 /JccWczKg6MeYpuNcjIm7H6lROOjTYRuO2+qyfbsmQGNzet8qaujzT4rbOUzzRMcc83Er0LPJwt
 LQrCvHelJuxy90z3BhLrIJvXm5FKrVNn0DD5lS0slRHGSWtolevGJ8XV69pLS2bq1wuLnVPA+yi
 /4xLsvU/UCuW/14NJri/IZp/jGF3Pb9E9pFtrJaV+Ivt3c+lkTPVawRMEgDfcOYuSN+AFQBVI0Z
 Shbo34owsiND/UiliNYlXug6V5B+rbQUHyyT4zx3vEZct92Q4K2ITdQ4jGV2OFGsQGtXA9ifBbZ
 oI04QLHhnE33hxWrARw==
X-Authority-Analysis: v=2.4 cv=G4YR0tk5 c=1 sm=1 tr=0 ts=69b30a03 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_78whYxrdx1mplLwxq1U:22 a=VwQbUJbxAAAA:8 a=FOH2dFAWAAAA:8 a=VabnemYjAAAA:8
 a=G31UBovebDcdE0zSMSQA:9 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55526-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[meta.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 73721277471
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,


There were various suggestions in the September 2025 thread "[TECH
TOPIC] vfio, iommufd: Enabling user space drivers to vend more
granular access to client processes" [0], and LPC discussions, around
improving the situation for multi-process userspace driver designs.
This RFC series implements some of these ideas.

(Thanks for feedback on v1!  Revised series, with changes noted
inline.)

Background: Multi-process USDs
==============================

The userspace driver scenario discussed in that thread involves a
primary process driving a PCIe function through VFIO/iommufd, which
manages the function-wide ownership/lifecycle.  The function is
designed to provide multiple distinct programming interfaces (for
example, several independent MMIO register frames in one function),
and the primary process delegates control of these interfaces to
multiple independent client processes (which do the actual work).
This scenario clearly relies on a HW design that provides appropriate
isolation between the programming interfaces.

The two key needs are:

 1.  Mechanisms to safely delegate a subset of the device MMIO
     resources to a client process without over-sharing wider access
     (or influence over whole-device activities, such as reset).

 2.  Mechanisms to allow a client process to do its own iommufd
     management w.r.t. its address space, in a way that's isolated
     from DMA relating to other clients.


mmap() of VFIO DMABUFs
======================

This RFC addresses #1 in "vfio/pci: Support mmap() of a VFIO DMABUF",
implementing the proposals in [0] to add mmap() support to the
existing VFIO DMABUF exporter.

This enables a userspace driver to define DMABUF ranges corresponding
to sub-ranges of a BAR, and grant a given client (via a shared fd)
the capability to access (only) those sub-ranges.  The VFIO device fds
would be kept private to the primary process.  All the client can do
with that fd is map (or iomap via iommufd) that specific subset of
resources, and the impact of bugs/malice is contained.

 (We'll follow up on #2 separately, as a related-but-distinct problem.
  PASIDs are one way to achieve per-client isolation of DMA; another
  could be sharing of a single IOVA space via 'constrained' iommufds.)


New in v2: To achieve this, the existing VFIO BAR mmap() path is
converted to use DMABUFs behind the scenes, in "vfio/pci: Convert BAR
mmap() to use a DMABUF" plus new helper functions, as Jason/Christian
suggested in the v1 discussion [3].

This means:

 - Both regular and new DMABUF BAR mappings share the same vm_ops,
   i.e.  mmap()ing DMABUFs is a smaller change on top of the existing
   mmap().

 - The zapping of mappings occurs via vfio_pci_dma_buf_move(), and the
   vfio_pci_zap_bars() originally paired with the _move()s can go
   away.  Each DMABUF has a unique address_space.

 - It's a step towards future iommufd VFIO Type1 emulation
   implementing P2P, since iommufd can now get a DMABUF from a VA that
   it's mapping for IO; the VMAs' vm_file is that of the backing
   DMABUF.


Revocation/reclaim
==================

Mapping a BAR subset is useful, but the lifetime of access granted to
a client needs to be managed well.  For example, a protocol between
the primary process and the client can indicate when the client is
done, and when it's safe to reuse the resources elsewhere, but cleanup
can't practically be cooperative.

For robustness, we enable the driver to make the resources
guaranteed-inaccessible when it chooses, so that it can re-assign them
to other uses in future.

"vfio/pci: Permanently revoke a DMABUF on request" adds a new VFIO
device fd ioctl, VFIO_DEVICE_PCI_DMABUF_REVOKE.  This takes a DMABUF
fd parameter previously exported (from that device!) and permanently
revokes the DMABUF.  This notifies/detaches importers, zaps PTEs for
any mappings, and guarantees no future attachment/import/map/access is
possible by any means.

A primary driver process would use this operation when the client's
tenure ends to reclaim "loaned-out" MMIO interfaces, at which point
the interfaces could be safely re-used.

New in v2: ioctl() on VFIO driver fd, rather than DMABUF fd.  A DMABUF
is revoked using code common to vfio_pci_dma_buf_move(), selectively
zapping mappings (after waiting for completion on the
dma_buf_invalidate_mappings() request).


BAR mapping access attributes
=============================

Inspired by Alex [Mastro] and Jason's comments in [0] and Mahmoud's
work in [1] with the goal of controlling CPU access attributes for
VFIO BAR mappings (e.g. WC), we can decorate DMABUFs with access
attributes that are then used by a mapping's PTEs.

I've proposed reserving a field in struct
vfio_device_feature_dma_buf's flags to specify an attribute for its
ranges.  Although that keeps the (UAPI) struct unchanged, it means all
ranges in a DMABUF share the same attribute.  I feel a single
attribute-to-mmap() relation is logical/reasonable.  An application
can also create multiple DMABUFs to describe any BAR layout and mix of
attributes.


Tests
=====

(Still sharing the [RFC ONLY] userspace test/demo program for context,
not for merge.)

It illustrates & tests various map/revoke cases, but doesn't use the
existing VFIO selftests and relies on a (tweaked) QEMU EDU function.
I'm (still) working on integrating the scenarios into the existing
VFIO selftests.

This code has been tested in mapping DMABUFs of single/multiple
ranges, aliasing mmap()s, aliasing ranges across DMABUFs, vm_pgoff >
0, revocation, shutdown/cleanup scenarios, and hugepage mappings seem
to work correctly.  I've lightly tested WC mappings also (by observing
resulting PTEs as having the correct attributes...).


Fin
===

v2 is based on next-20260310 (to build on Leon's recent series
"vfio: Wait for dma-buf invalidation to complete" [2]).


Please share your thoughts!  I'd like to de-RFC if we feel this
approach is now fair.


Many thanks,


Matt



References:

[0]: https://lore.kernel.org/linux-iommu/20250918214425.2677057-1-amastro@fb.com/
[1]: https://lore.kernel.org/all/20250804104012.87915-1-mngyadam@amazon.de/
[2]: https://lore.kernel.org/linux-iommu/20260205-nocturnal-poetic-chamois-f566ad@houat/T/#m310cd07011e3a1461b6fda45e3f9b886ba76571a
[3]: https://lore.kernel.org/all/20260226202211.929005-1-mattev@meta.com/

--------------------------------------------------------------------------------
Changelog:

v2:  Respin based on the feedback/suggestions:

- Transform the existing VFIO BAR mmap path to also use DMABUFs behind
  the scenes, and then simply share that code for explicitly-mapped
  DMABUFs.

- Refactors the export itself out of vfio_pci_core_feature_dma_buf,
  and shared by a new vfio_pci_core_mmap_prep_dmabuf helper used by
  the regular VFIO mmap to create a DMABUF.

- Revoke buffers using a VFIO device fd ioctl

v1: https://lore.kernel.org/all/20260226202211.929005-1-mattev@meta.com/


Matt Evans (10):
  vfio/pci: Set up VFIO barmap before creating a DMABUF
  vfio/pci: Clean up DMABUFs before disabling function
  vfio/pci: Add helper to look up PFNs for DMABUFs
  vfio/pci: Add a helper to create a DMABUF for a BAR-map VMA
  vfio/pci: Convert BAR mmap() to use a DMABUF
  vfio/pci: Remove vfio_pci_zap_bars()
  vfio/pci: Support mmap() of a VFIO DMABUF
  vfio/pci: Permanently revoke a DMABUF on request
  vfio/pci: Add mmap() attributes to DMABUF feature
  [RFC ONLY] selftests: vfio: Add standalone vfio_dmabuf_mmap_test

 drivers/vfio/pci/Kconfig                      |   3 +-
 drivers/vfio/pci/Makefile                     |   3 +-
 drivers/vfio/pci/vfio_pci_config.c            |  18 +-
 drivers/vfio/pci/vfio_pci_core.c              | 123 +--
 drivers/vfio/pci/vfio_pci_dmabuf.c            | 425 +++++++--
 drivers/vfio/pci/vfio_pci_priv.h              |  46 +-
 include/uapi/linux/vfio.h                     |  42 +-
 tools/testing/selftests/vfio/Makefile         |   1 +
 .../vfio/standalone/vfio_dmabuf_mmap_test.c   | 837 ++++++++++++++++++
 9 files changed, 1339 insertions(+), 159 deletions(-)
 create mode 100644 tools/testing/selftests/vfio/standalone/vfio_dmabuf_mmap_test.c

-- 
2.47.3


