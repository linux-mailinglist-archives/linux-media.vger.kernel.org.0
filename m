Return-Path: <linux-media+bounces-66273-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uApFGB5NRWpP+QoAu9opvQ
	(envelope-from <linux-media+bounces-66273-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:23:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C686F0532
	for <lists+linux-media@lfdr.de>; Wed, 01 Jul 2026 19:23:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ozlabs.org header.s=201707 header.b=cwAGTMui;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66273-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66273-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ozlabs.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED7A03184845
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2026 17:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9398D495532;
	Wed,  1 Jul 2026 17:13:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DFB4949E3;
	Wed,  1 Jul 2026 17:13:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782926024; cv=none; b=Hg49Im6c/V7sV/bhHpiASRVJB6MDD7j5B59Bx/5jokt7fvDTaHWxy1gUpVgzp2fbqZBMnvTJ17rwj7XTwRyx7cKZEQGaokHSRrPeX633eh6AGGG3min6fOmEoVtkQN7K7e3hMh4IEGzYAwvit+X7HhkS6LWONpFuS1ewxUUa7Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782926024; c=relaxed/simple;
	bh=AxoJcUVsLyOA+eHi3L+DP5Ak8JjNG2Msbmqd+wJzheM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNd/vJe+/iIDGSKCE2J29PsOvOpvOGB/PbO0TDQALyjF7wzZmcTyOFi20MbrO4YJt0/d7QK7S7IVUnxEszvTe4Qa21Fpo5Fz2vwU4whh/SekF9tC86OuHdmoaHm21qUhdbhShvTwrxq4Q1Efm+PXHfjnnZjx7rsdTddn8wrIGXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=cwAGTMui; arc=none smtp.client-ip=150.107.74.76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1782926021;
	bh=Q7wMHC5wMXi79xSQJq1oa0JMjZtGpyIKwT+h3qHie/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cwAGTMui8KAgKIqS2zh/hMf2NpJ6Igjw5IT0UAZBRm8BXsqGyTjs+kdns6POc5EMM
	 j+p8ubTR9CxHTK9qYU6UB5yZHMa/IpIGY2avWkfEvO7VmJN+iZcfSCAw+nnC5SDZQm
	 8mBWN+CJsV8HfDYesVlHp3WdAaU6lWfwhOAUP6YIXgns9qanLf9uXRCUfjhGAWt2p1
	 DcFYvcyGUFWQdX0ECMysGsN6UMkP0TmF73t2Fkyw+ppNhfyfqfANe7D5cEDEtdBNRH
	 OPiKejWu6Dj2Cuzo59AQesh2id+S4WmLKo9HCd1fCqcRnIc3EVI1hoJ+3N64tBKNpZ
	 0zhrBSVM2ccxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4gr66r10vmz4wgb;
	Thu, 02 Jul 2026 03:13:40 +1000 (AEST)
From: Matt Evans <matt@ozlabs.org>
To: Alex Williamson <alex@shazbot.org>,
	Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Alex Mastro <amastro@fb.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Pranjal Shrivastava <praan@google.com>
Cc: Mahmoud Adam <mngyadam@amazon.de>,
	David Matlack <dmatlack@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	kvm@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v4 10/10] vfio/pci: Add mmap() attributes to DMABUF feature
Date: Wed,  1 Jul 2026 18:12:22 +0100
Message-ID: <20260701171245.90111-11-matt@ozlabs.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260701171245.90111-1-matt@ozlabs.org>
References: <20260701171245.90111-1-matt@ozlabs.org>
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
	DMARC_POLICY_ALLOW(-0.50)[ozlabs.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ozlabs.org:s=201707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66273-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:christian.koenig@amd.com,m:bhelgaas@google.com,m:logang@deltatee.com,m:kevin.tian@intel.com,m:praan@google.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:ankita@nvidia.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,m:linux-pci@vger.kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@ozlabs.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ozlabs.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9C686F0532

A new VFIO feature, VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR, is added to
set CPU-facing memory type attributes for a DMABUF exported from
vfio-pci.  These are used for subsequent mmap()s of the buffer.

There are two attributes supported:
 - The default, VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_NC
 - VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_WC, which results in WC
   PTEs for the DMABUF's BAR region.

Signed-off-by: Matt Evans <matt@ozlabs.org>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/vfio/pci/vfio_pci_core.c   |  2 ++
 drivers/vfio/pci/vfio_pci_dmabuf.c | 57 +++++++++++++++++++++++++++++-
 drivers/vfio/pci/vfio_pci_priv.h   | 14 ++++++++
 include/uapi/linux/vfio.h          | 27 ++++++++++++++
 4 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index ebdf9ec30517..0059c176d627 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1579,6 +1579,8 @@ int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
 		return vfio_pci_core_feature_dma_buf(vdev, flags, arg, argsz);
 	case VFIO_DEVICE_FEATURE_DMA_BUF_REVOKE:
 		return vfio_pci_core_feature_dma_buf_revoke(vdev, flags, arg, argsz);
+	case VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR:
+		return vfio_pci_core_feature_dma_buf_memattr(vdev, flags, arg, argsz);
 	default:
 		return -ENOTTY;
 	}
diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
index cfca820b767a..31fbad93f89b 100644
--- a/drivers/vfio/pci/vfio_pci_dmabuf.c
+++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
@@ -49,7 +49,10 @@ static int vfio_pci_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *
 	if ((vma->vm_flags & VM_SHARED) == 0)
 		return -EINVAL;
 
-	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	if (READ_ONCE(priv->memattr) == VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_WC)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+	else
+		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 
 	/* See comments in vfio_pci_core_mmap() re VM_ALLOW_ANY_UNCACHED. */
@@ -482,6 +485,7 @@ int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 	priv->vdev = vdev;
 	priv->nr_ranges = get_dma_buf.nr_ranges;
 	priv->size = length;
+	priv->memattr = VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_NC;
 	ret = vdev->pci_ops->get_dmabuf_phys(vdev, &priv->provider,
 					     get_dma_buf.region_index,
 					     priv->phys_vec, dma_ranges,
@@ -759,6 +763,57 @@ int vfio_pci_core_feature_dma_buf_revoke(
 		}
 	}
 
+out_put_buf:
+	dma_buf_put(dmabuf);
+
+	return ret;
+}
+
+int vfio_pci_core_feature_dma_buf_memattr(
+	struct vfio_pci_core_device *vdev, u32 flags,
+	struct vfio_device_feature_dma_buf_memattr __user *arg,
+	size_t argsz)
+{
+	struct vfio_device_feature_dma_buf_memattr db_attr;
+	struct vfio_pci_dma_buf *priv;
+	struct dma_buf *dmabuf;
+	int ret;
+
+	if (!vdev->pci_ops || !vdev->pci_ops->get_dmabuf_phys)
+		return -EOPNOTSUPP;
+
+	ret = vfio_check_feature(flags, argsz,
+				 VFIO_DEVICE_FEATURE_SET,
+				 sizeof(db_attr));
+	if (ret != 1)
+		return ret;
+
+	if (copy_from_user(&db_attr, arg, sizeof(db_attr)))
+		return -EFAULT;
+
+	dmabuf = dma_buf_get(db_attr.dmabuf_fd);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+
+	/* Verify DMABUF: see comments in vfio_pci_dma_buf_revoke() */
+	priv = dmabuf->priv;
+	if (dmabuf->ops != &vfio_pci_dmabuf_ops ||
+	    READ_ONCE(priv->vdev) != vdev) {
+		ret = -ENODEV;
+		goto out_put_buf;
+	}
+
+	switch (db_attr.memattr) {
+	case VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_NC:
+	case VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_WC:
+		WRITE_ONCE(priv->memattr, db_attr.memattr);
+		ret = 0;
+		break;
+
+	default:
+		ret = -ENOENT;
+	}
+
 out_put_buf:
 	dma_buf_put(dmabuf);
 
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index 8741abd04461..b3c72df002c4 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -41,6 +41,7 @@ struct vfio_pci_dma_buf {
 	struct kref kref;
 	struct completion comp;
 	unsigned long vma_pgoff_adjust;
+	u32 memattr;
 	enum vfio_pci_dma_buf_status status;
 };
 
@@ -157,6 +158,10 @@ int vfio_pci_core_feature_dma_buf_revoke(
 	struct vfio_pci_core_device *vdev, u32 flags,
 	struct vfio_device_feature_dma_buf_revoke __user *arg,
 	size_t argsz);
+int vfio_pci_core_feature_dma_buf_memattr(
+	struct vfio_pci_core_device *vdev, u32 flags,
+	struct vfio_device_feature_dma_buf_memattr __user *arg,
+	size_t argsz);
 #else
 static inline int
 vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
@@ -165,6 +170,7 @@ vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
 {
 	return -ENOTTY;
 }
+
 static inline int vfio_pci_core_feature_dma_buf_revoke(
 	struct vfio_pci_core_device *vdev, u32 flags,
 	struct vfio_device_feature_dma_buf_revoke __user *arg,
@@ -172,6 +178,14 @@ static inline int vfio_pci_core_feature_dma_buf_revoke(
 {
 	return -ENOTTY;
 }
+
+static inline int vfio_pci_core_feature_dma_buf_memattr(
+	struct vfio_pci_core_device *vdev, u32 flags,
+	struct vfio_device_feature_dma_buf_memattr __user *arg,
+	size_t argsz)
+{
+	return -ENOTTY;
+}
 #endif
 
 #endif
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 697c0bb4b9bc..ab30b89399d0 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -1554,6 +1554,33 @@ struct vfio_device_feature_dma_buf_revoke {
 	__s32	dmabuf_fd;
 };
 
+/**
+ * Given a dma_buf fd previously created by
+ * VFIO_DEVICE_FEATURE_DMA_BUF, SET the memory attribute that will be
+ * used by future mmap()s of that fd.  SETting a new attribute does
+ * not affect existing VMAs.
+ *
+ * The default, if no previous SET has been performed, is NC.
+ *
+ * Return: 0 on success, -1 and errno is set on failure:
+ *
+ *  EBADF, EINVAL: dmabuf_fd is not a DMABUF fd.
+ *  ENODEV: The dmabuf_fd does not match this VFIO device.
+ *  ENOENT: The given memattr is not supported.
+ */
+#define VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR 14
+
+/* Valid memory attributes for the memattr field */
+enum vfio_device_dma_buf_memattr {
+	VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_NC = 0, /* pgprot_noncached */
+	VFIO_DEVICE_FEATURE_DMA_BUF_MEMATTR_WC = 1, /* pgprot_writecombine */
+};
+
+struct vfio_device_feature_dma_buf_memattr {
+	__s32	dmabuf_fd;
+	__u32	memattr;
+};
+
 /* -------- API for Type1 VFIO IOMMU -------- */
 
 /**
-- 
2.50.1 (Apple Git-155)


