Return-Path: <linux-media+bounces-55525-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJQXKIAKs2kMRwAAu9opvQ
	(envelope-from <linux-media+bounces-55525-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:48:32 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 038502774D4
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 111B630E0DE2
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB6739A81B;
	Thu, 12 Mar 2026 18:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="pYL0HTRz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA8A3FFAB7;
	Thu, 12 Mar 2026 18:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341206; cv=none; b=AS3+lmUyBOWhnPWa1t3HsRy++ZUAhTjy9+NNA/ghCfbCt8/PPetC8HidINB3IFmdxh5lvkVY0Ts9ayOqm5sAybHeiW72Rh1QCUuo60neQbZOwIBhXkOZIS/Tt4haJnmmiUgK9SLQHy2tsvLb57XyNbMMgW8rVlUZrj05zm/rOrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341206; c=relaxed/simple;
	bh=ZROWNSa59nUsl5X/QgDcGHcaR/c4lJYMdLrJTNBrpdk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BJvLdlI42nQlwZ36Y/fnW1yJhJMAGsfr+IohZlfzo0947erLnh6a6JAQCRPUG/BIjg3tMA1sT+E93CuiRWmGqawJAKLypTG+KeCyh0ymBOIeqb2gi8lX9nF93IqVN8y/2CBPqV9kSOmddez7N98SfhRuonA1AIhZMAmbbVskgnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=pYL0HTRz; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CH37c93822056;
	Thu, 12 Mar 2026 11:46:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=lyheLk9Wvs0fvD4s1b5iebQGWNGSW8pkLBga2jwoIMs=; b=pYL0HTRziDvE
	ieE6PsbkKCshsCYWNDD1wtNcjCEhoUDkzVT5WnfN5H+Urq+PoLq9kJ7m21Tcsulc
	CE41Dz6/6BW5PB+oJZhpw54Bp8AYSxCxYwDjjfR17KL8STWRYwR/1cX/HuWqN1Ed
	wQytqiM++CkCBXQhbarMSlzz7PpJjfAYm/76oCYJ1+2gX66Cu0q3/qMrBvGPFfAz
	AhpWlckCOXKsEdfaCp+iMNzxlaGCwY9LWFOSRjMVgu0pX7ZAxpgKAgpKoRHv1MQy
	h1s+sdnzTvGdWJZEXnR2lXiCehzAqZD/OaGTQsCD3RH7bXE+lGN/6DZcXxZXKQ58
	FiiQxXP11Q==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4cv1j2j8et-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 11:46:30 -0700 (PDT)
Received: from localhost (2620:10d:c085:208::7cb7) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 12 Mar
 2026 18:46:29 +0000
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
Subject: [RFC v2 PATCH 01/10] vfio/pci: Set up VFIO barmap before creating a DMABUF
Date: Thu, 12 Mar 2026 11:45:59 -0700
Message-ID: <20260312184613.3710705-2-mattev@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260312184613.3710705-1-mattev@meta.com>
References: <20260312184613.3710705-1-mattev@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PvXIK7001yah_q_sVCLHPSoZDp3mLo2e
X-Authority-Analysis: v=2.4 cv=ALq93nRn c=1 sm=1 tr=0 ts=69b30a06 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=crHB47gyY4rKiduisYu9:22 a=VabnemYjAAAA:8 a=DkskzI1_-XwU4soQF-MA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1MSBTYWx0ZWRfX8djASQHH+VAA
 ltjJlqmH55EDbWfxbbJ7FyTuvxqN6vMHePt/cF2tSVoxk6bkjkTwC8QjvpTwsT+RD9YMljBSaK/
 36OsJTKf1QwsIQaUMPiSF0WgBUCs2IfZNBpOevxB+IcKzDPftiEmHtW6c7yvvertvgCTar5vur1
 d2Mhx0mRzrpATABoUz7byz5ekuDjE2ULkxl/3npaeLDswE2K4nDrSqN/I/sncUDG5VuHQ+Vz0ZF
 2hZ80M9bF0gZ7E+jmCV9iL4lqBZZnzS1quxPjHn745eOrle3T8vm3yZsmn5P9cEhBCRpVhMK5s1
 12YSduE3T56nfBeqmjxXEz3yiR4C5SKEaqAB1/E7IaifPUB/T+dvyG+IeWodMtzH6kEBwUS3X5s
 rgKXzYRfW8SLe+g6Xetq6+3eZ5KAYhPBIwJMjJbd8ZGGYXHd7RTGjfl20sHcfL54eCH/Ck4PiB+
 Mzp/l+X46195EIqFNWg==
X-Proofpoint-ORIG-GUID: PvXIK7001yah_q_sVCLHPSoZDp3mLo2e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55525-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[meta.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 038502774D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A DMABUF exports access to BAR resources which need to be requested
before the DMABUF is handed out.  Usually the resources are requested
when setting up the barmap when the VFIO device fd is mmap()ed, but
there's no guarantee that's done before a DMABUF is created.

Set up the barmap (and so request resources) in the DMABUF-creation
path.

Fixes: 5d74781ebc86c ("vfio/pci: Add dma-buf export support for MMIO regions")
Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/vfio/pci/vfio_pci_dmabuf.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index 3a803923141b..44558cc2948e 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -269,6 +269,17 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 		goto err_free_priv;
 	}
 
+	/*
+	 * Just like the vfio_pci_core_mmap() path, we need to ensure
+	 * PCI regions have been requested before returning DMABUFs
+	 * that reference them.  It's possible to create a DMABUF for
+	 * a BAR without the BAR having already been mmap()ed.  The
+	 * barmap setup requests the regions for us:
+	 */
+	ret = vfio_pci_core_setup_barmap(vdev, get_dma_buf.region_index);
+	if (ret)
+		goto err_free_phys;
+
 	priv->vdev = vdev;
 	priv->nr_ranges = get_dma_buf.nr_ranges;
 	priv->size = length;
-- 
2.47.3


