Return-Path: <linux-media+bounces-55527-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPP3KycKs2kMRwAAu9opvQ
	(envelope-from <linux-media+bounces-55527-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:47:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E054277478
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 19:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C5013037C36
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28587401496;
	Thu, 12 Mar 2026 18:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="AKkjswGo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B323FD12C;
	Thu, 12 Mar 2026 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.145.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341207; cv=none; b=cydkNYQ0OcfIRN36EqS//is7GC8ruwqWepvMAJD+9gPBl5X9dG2RnZkzLYBFcWYP5UTwGjKDkxqSJX1lRkTGyiVIynMrov2qn37TxKnqVlsJxM5yE+BxLzmbYU4rUT3ny6V0hNtIub21lg6xcQUfBEmN62bqfSdzRPghDo31l6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341207; c=relaxed/simple;
	bh=SlPadT6Oif2I8Ldrfkcy50pxboNZmXXA8d3IUOT2bv4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FTm0ZDwJXFAdXoMmiIB25rBPi2zZOxXrkOyO2npt1/cx+dlBrvOwIbjzHH6rqGthFX/9eP5FM72XgBRkgjTGq3aQDf7wzQ3d+apMfZtYxA4CUaTmqqEIHj+feH/EJEgsP1/VdDoHD3g16qBStYFC8CocBDTboF4FIm7V2vnh2Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=AKkjswGo; arc=none smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CHrWqW2853764;
	Thu, 12 Mar 2026 11:46:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=yABRgDa4Smt7xH35V/HV2UTHouYqNi0/j2J9K5YgcvI=; b=AKkjswGoDJeJ
	3LFVTzysksvweic7lsg+Q281vwoLUjw5DyDTrrb+jaTG9HKMB/vURPWqdTGsheJW
	mnjkiuo6TgTIQXZ2b5MjJNNOTOlLNa/CAFWuj9yTaa0NOdNSynTpEukQMHT8wJro
	Oxf++2ulrANLf+S4HXIRVMUrE5ZWDvzTuUWeauYrOvBuN0vRpt5wMN0M7BV9tUmS
	ZJ4OvOqi4Tc8GWIoQ+aV+z5YaCRvIXL1hESLHawyPtIDSixBk4NjxZjNClKFXYCI
	UMEYKzr4Ycz1jTDeYVBQsESvL0RNwiD1VinZPJENU6fv3O5pPbqq9gyjkK4UzIux
	kXZGn9k3nw==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4cv29nh38v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2026 11:46:32 -0700 (PDT)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 12 Mar
 2026 18:46:32 +0000
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
Subject: [RFC v2 PATCH 02/10] vfio/pci: Clean up DMABUFs before disabling function
Date: Thu, 12 Mar 2026 11:46:00 -0700
Message-ID: <20260312184613.3710705-3-mattev@meta.com>
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
X-Proofpoint-GUID: T8Yuc9PQqL6Z-6JxP8LV4CMEZQgXG9hN
X-Proofpoint-ORIG-GUID: T8Yuc9PQqL6Z-6JxP8LV4CMEZQgXG9hN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1MSBTYWx0ZWRfX7XzcAXsQ5Hr/
 waDgvCGVXfyPZksrBh7BebX5id10i4wDMWPzJC1L0EbTSXpHYLMfpRY4PGPcXSdVwkI+5HxdsjQ
 xYnUqKCqgBd3UcZEJiwK3SrWO50h1PgXcXaxmfjp8yKwI0H/Z8BAUZC4buJNfAl4UaqJQSwdYrB
 afVvUp0fU2aUJIXRD/+HsmMAAvqtnfA3kidQflYpbq1IoK+6nGkuyWzcNPM2KN84Fbqv9fJkTjh
 kc9Mw76bhQAVQQ7qIn3CKclIT+jIc9UATBYZEgTSG8vAojpJO9yBqVsW9uHx4CJqeMfGSA+lig/
 Qt+yJtfXJGF1MY7bCrUrTP5eZvpiOwmb7T3lNqeWqfKlGUIk5SblFPojq7wbpCylvoa2VHaiMiV
 c6Os+n/hClffeC6nXzOMLTI5/zRGJS+4Fy52RYPGqXfUOu2DVoXvOUDns77xFc35Ca3G+JI8QdE
 zT3ZUoo4hVc2qAy6Ing==
X-Authority-Analysis: v=2.4 cv=FvYIPmrq c=1 sm=1 tr=0 ts=69b30a09 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=03ozwUkBphtHgyqjj1sw:22 a=VabnemYjAAAA:8 a=4DpnPWOeRWuCnonzwFEA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55527-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 2E054277478
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On device shutdown, make vfio_pci_core_close_device() call
vfio_pci_dma_buf_cleanup() before the function is disabled via
vfio_pci_core_disable().  This ensures that all access via DMABUFs is
revoked before the function's BARs become inaccessible.

This fixes an issue where, if the function is disabled first, a tiny
window exists in which the function's MSE is cleared and yet BARs
could still be accessed via the DMABUF.  The resources would also be
freed and up for grabs by a different driver.

Fixes: 5d74781ebc86c ("vfio/pci: Add dma-buf export support for MMIO regions")
Signed-off-by: Matt Evans <mattev@meta.com>
---
 drivers/vfio/pci/vfio_pci_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index d43745fe4c84..f9ed3374d268 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -734,10 +734,10 @@ void vfio_pci_core_close_device(struct vfio_device *core_vdev)
 #if IS_ENABLED(CONFIG_EEH)
 	eeh_dev_release(vdev->pdev);
 #endif
-	vfio_pci_core_disable(vdev);
-
 	vfio_pci_dma_buf_cleanup(vdev);
 
+	vfio_pci_core_disable(vdev);
+
 	mutex_lock(&vdev->igate);
 	vfio_pci_eventfd_replace_locked(vdev, &vdev->err_trigger, NULL);
 	vfio_pci_eventfd_replace_locked(vdev, &vdev->req_trigger, NULL);
-- 
2.47.3


