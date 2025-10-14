Return-Path: <linux-media+bounces-44347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38042BD7D2A
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 09:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFA743B6451
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 07:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BCA30DEBE;
	Tue, 14 Oct 2025 07:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LysmJff3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A94730CD8C
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 07:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426040; cv=none; b=LDCfvUPqCCLhBHcwt/DBMQYb89Na7qGSDeqhaKQxlF8zE6lu5BDi06zdG75P5bmQje+us7UtxMq3LvTbYv/pbLSTGUWs8ZFt03cI8JCbbB/zJX/pUPvkiz4WKEm69g/lm3v3X0VUWMQbrbIfRC0JEXWpI1tzH+Jen9acjR+Eo08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426040; c=relaxed/simple;
	bh=yh1xtuPzPIYwf/mvsxOCmqZavj42ErFHrTFWR7mOTeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iTEeaSbyYCbgBseL0nyVTimvb6Kh5g4zPMW9+4cBBjiy+nUrmDhTVq7WphwARV/iyCw0RsLF1GYo/O3JnRvAI1bR4uTTcWFengKpdJgRybwN3SboYYtbwsMiduweDOYxsIq6sJ9Hx1rclOXcflmB4SS7qCnozJrqpsRtTWm+eBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LysmJff3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760426038; x=1791962038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yh1xtuPzPIYwf/mvsxOCmqZavj42ErFHrTFWR7mOTeI=;
  b=LysmJff3wV8xg4CsVSCjrHmxmj+WUBFTM6sEcvbs35JaADPV/kP6iDmo
   yOP7aFyDOubr28k3TUUoQdS6vqEOfQSm0sFSZd21Agj7r7+7aIylVYoIQ
   VISzc+MzVa3cthlI/zXRrlglGJcaeg8tUAn+/ni3YwxCGebrJoIjA8kwI
   OAtk7K2+LL3xpdgSsf0pLAuWCg2yGGTGgwKEPeUpvIVZH3GxAPZY3ohUv
   JRmWDfEosjJSGqgR/O70Z7Vdk7Rz8oJxuRCboDwj6LCyrRY9S++gzRR8f
   4I1thjmpgOfdX54c4MqEoj7IUYp95ZZ0SXAeyvl5nz+HvpK+n3jELaFk1
   w==;
X-CSE-ConnectionGUID: 8sPzYJZ0SxegtIBK0O1T4A==
X-CSE-MsgGUID: pelb1E4YT+CvDhtg0EEO/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73257113"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="73257113"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:57 -0700
X-CSE-ConnectionGUID: oGfti8sAQ5+vzaf8oPTL4A==
X-CSE-MsgGUID: ZE8b/suBRJK8pUA3alJ+8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="181369856"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 00:13:57 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: [RFC 2/8] dma-buf: Add a helper to match interconnects between exporter/importer
Date: Tue, 14 Oct 2025 00:08:52 -0700
Message-ID: <20251014071243.811884-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251014071243.811884-1-vivek.kasireddy@intel.com>
References: <20251014071243.811884-1-vivek.kasireddy@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If the importer provides an op for supports_interconnects(), the
exporter starts the matching (or negotiation) process (during
attach) by invoking the supports_interconnects() which would then
call this helper to identify the first common interconnect
supported by both exporter and importer.

Note that whether an interconnect is supported between an
exporter/importer is ultimately determined by the exporter via
the match op it is expected to provide.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/dma-buf.c            | 45 +++++++++++++++++++++++++++-
 include/linux/dma-buf-interconnect.h |  6 ++++
 include/linux/dma-buf.h              |  9 ++++++
 3 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 162642bd53e8..ed48540d1c1d 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -965,8 +965,11 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 
 	attach->dev = dev;
 	attach->dmabuf = dmabuf;
-	if (importer_ops)
+	if (importer_ops) {
 		attach->peer2peer = importer_ops->allow_peer2peer;
+		if (importer_ops->supports_interconnects)
+			attach->allow_ic = true;
+	}
 	attach->importer_ops = importer_ops;
 	attach->importer_priv = importer_priv;
 
@@ -1680,6 +1683,46 @@ void dma_buf_unmap_interconnect(struct dma_buf_attachment *attach,
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_interconnect, "DMA_BUF");
 
+bool dma_buf_match_interconnects(struct dma_buf_attachment *attach,
+				 const struct dma_buf_interconnect_match *exp,
+				 unsigned int exp_ics,
+				 const struct dma_buf_interconnect_match *imp,
+				 unsigned int imp_ics)
+{
+	const struct dma_buf_interconnect *exp_ic, *imp_ic;
+	const struct dma_buf_interconnect_ops *ic_ops;
+	struct dma_buf *dmabuf = attach->dmabuf;
+	unsigned int i, j;
+
+	if (!exp || !imp)
+		return false;
+
+	if (!attach->allow_ic)
+		return false;
+
+	ic_ops = dmabuf->ops->interconnect_ops;
+	if (!ic_ops || !ic_ops->match_interconnect)
+		return false;
+
+	for (i = 0; i < exp_ics; i++) {
+		for (j = 0; j < imp_ics; j++) {
+			exp_ic = exp[i].interconnect;
+			imp_ic = imp[j].interconnect;
+
+			if (exp_ic->type == imp_ic->type) {
+				if (ic_ops->match_interconnect(exp_ic, imp_ic)) {
+					attach->interconnect.type = exp_ic->type;
+					return true;
+				}
+			}
+		}
+	}
+
+	attach->allow_ic = false;
+	return false;
+}
+EXPORT_SYMBOL_NS_GPL(dma_buf_match_interconnects, "DMA_BUF");
+
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
diff --git a/include/linux/dma-buf-interconnect.h b/include/linux/dma-buf-interconnect.h
index 17504dea9691..a72f65ed4806 100644
--- a/include/linux/dma-buf-interconnect.h
+++ b/include/linux/dma-buf-interconnect.h
@@ -20,10 +20,16 @@ struct dma_buf_interconnect {
 	enum dma_buf_interconnect_type type;
 };
 
+struct dma_buf_interconnect_match {
+	const struct dma_buf_interconnect *interconnect;
+};
+
 struct dma_buf_interconnect_ops {
 	int (*map_interconnect)(struct dma_buf_attachment *attach,
 				struct dma_buf_ranges *ranges);
 	void (*unmap_interconnect)(struct dma_buf_attachment *attach,
 				   struct dma_buf_ranges *ranges);
+	bool (*match_interconnect)(const struct dma_buf_interconnect *exp_ic,
+				   const struct dma_buf_interconnect *imp_ic);
 };
 #endif
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index db91c67c00d6..3e6124387f3c 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -479,6 +479,10 @@ struct dma_buf_attach_ops {
 	 * point to the new location of the DMA-buf.
 	 */
 	void (*move_notify)(struct dma_buf_attachment *attach);
+
+	bool (*supports_interconnects)(struct dma_buf_attachment *attach,
+				       const struct dma_buf_interconnect_match *,
+				       unsigned int num_ics);
 };
 
 /**
@@ -599,6 +603,11 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,
 struct dma_buf_ranges *dma_buf_map_interconnect(struct dma_buf_attachment *);
 void dma_buf_unmap_interconnect(struct dma_buf_attachment *,
 				struct dma_buf_ranges *);
+bool dma_buf_match_interconnects(struct dma_buf_attachment *attach,
+				 const struct dma_buf_interconnect_match *,
+				 unsigned int exp_ics,
+				 const struct dma_buf_interconnect_match *,
+				 unsigned int imp_ics);
 
 void dma_buf_move_notify(struct dma_buf *dma_buf);
 int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
-- 
2.50.1


