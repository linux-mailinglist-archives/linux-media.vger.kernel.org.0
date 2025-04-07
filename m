Return-Path: <linux-media+bounces-29518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAD8A7DFE3
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF03C188B557
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401D2188938;
	Mon,  7 Apr 2025 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dOXOhBmg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AA81552E3
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 13:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033276; cv=none; b=OtRrwKt/dOFQlo+b2V9TpOAvVTLcQsI2f3ZFh0bB3l0Q9efI8CmFL13A+kL06J8W1VeGdz2pNs0OT2PbfjtGgOY7xqnjlIXLvI/RFt2DKJgVWDKaR7sNjVMqbTv6NJDxt3LH8dWYRwpOZ3grm1mCKJvuDNwXJ6aXX1880Cu6c5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033276; c=relaxed/simple;
	bh=lO/mUC1b2o2UKaaw5H1v1oMz7lCt4ZqMcivf9La6BHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VxbuYzSHqiGjLItntAbT3TIHccgkirbHy0KoUZAkqhB482KkK4njxhQ+R+5IJgE8ou+0AjZRle9rdFBVkNxtVLgcvnIaRBsPYpnXOcPgdd6W0MC1Nl5aoOetMOYAVBj+nT2Ow0pkir2+NDatyugE44eJZmF7BgMH94JZJTxLlM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dOXOhBmg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033275; x=1775569275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lO/mUC1b2o2UKaaw5H1v1oMz7lCt4ZqMcivf9La6BHs=;
  b=dOXOhBmgjogC9TbcCVmEe3pi4V5t1WnDVTIsF1TlF2IRoqmSHEuz2wGA
   70Px2luu0JWx6x05KKnP+CpG8DyLtAhjbS5qbK2LmcvENRdgoOE/K9Nuc
   OmHwdzD/VyOy+aDSnfocH+c7Cx8cxk/ILIaxaJ51KNIM3LSvlulYT4TX1
   yjn2paKsDZEoXkb4FC8BTvPh7/+u6zq368P0KtFdem7QEwGS+PeNDg8qm
   hW3XXe3gNb/ZB2zhEwJ7JLwCgTGLJebd55kT+GokEWoK13+FzKOu2AObp
   Ha2kaBAaiW7Uz60r3jalpso3rzmZO5kyi+uZhOfeqGi0x1ByNYUPCfwC9
   A==;
X-CSE-ConnectionGUID: jS5OsAV7SPSt6dg4BKeVnw==
X-CSE-MsgGUID: YMV67bhcRd6BdgUPCaqG0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49073479"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49073479"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:41:14 -0700
X-CSE-ConnectionGUID: 5EyhGADOTiCU0flp7Nv3XQ==
X-CSE-MsgGUID: bi08QPp4R5ScTsc8Z3awQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="158936186"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.80.153])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:41:12 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Subject: [PATCH 7/7] media: intel/ipu6: Start using accessors to get dev pointer
Date: Mon,  7 Apr 2025 15:40:37 +0200
Message-Id: <20250407134037.808367-8-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
References: <20250407134037.808367-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use below cocci script to convert the code to use to_isys() and
isys_to_dev() accessors.

@@
expression X;
@@
(
- &X->isys->adev->auxdev.dev
+ isys_to_dev(to_isys(X))
|
- &isys->adev->auxdev.dev
+ isys_to_dev(isys)
)

Having accessors in place will make separation between common code and
fw/hw specific easier.

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   | 14 ++++-----
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 16 +++++-----
 .../media/pci/intel/ipu6/ipu6-isys-dwc-phy.c  | 16 +++++-----
 .../media/pci/intel/ipu6/ipu6-isys-jsl-phy.c  |  8 ++---
 .../media/pci/intel/ipu6/ipu6-isys-mcd-phy.c  | 10 +++----
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 24 +++++++--------
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 30 +++++++++----------
 drivers/media/pci/intel/ipu6/ipu6-isys.c      | 20 ++++++-------
 8 files changed, 69 insertions(+), 69 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
index 62ed92ff1d30..38548578b7a6 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-isys.c
@@ -28,7 +28,7 @@ static const char send_msg_types[N_IPU6_FW_ISYS_SEND_TYPE][32] = {
 
 static int handle_proxy_response(struct ipu6_isys *isys, unsigned int req_id)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	struct ipu6_fw_isys_proxy_resp_info_abi *resp;
 	int ret;
 
@@ -53,7 +53,7 @@ int ipu6_fw_isys_send_proxy_token(struct ipu6_isys *isys,
 				  unsigned int offset, u32 value)
 {
 	struct ipu6_fw_com_context *ctx = isys->fwcom;
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	struct ipu6_fw_proxy_send_queue_token *token;
 	unsigned int timeout = 1000;
 	int ret;
@@ -97,7 +97,7 @@ int ipu6_fw_isys_complex_cmd(struct ipu6_isys *isys,
 			     size_t size, u16 send_type)
 {
 	struct ipu6_fw_com_context *ctx = isys->fwcom;
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	struct ipu6_fw_send_queue_token *token;
 
 	if (send_type >= N_IPU6_FW_ISYS_SEND_TYPE)
@@ -135,7 +135,7 @@ int ipu6_fw_isys_simple_cmd(struct ipu6_isys *isys,
 
 int ipu6_fw_isys_close(struct ipu6_isys *isys)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	int retry = IPU6_ISYS_CLOSE_RETRY;
 	unsigned long flags;
 	void *fwcom;
@@ -178,7 +178,7 @@ void ipu6_fw_isys_cleanup(struct ipu6_isys *isys)
 
 	ret = ipu6_fw_com_release(isys->fwcom, 1);
 	if (ret < 0)
-		dev_warn(&isys->adev->auxdev.dev,
+		dev_warn(isys_to_dev(isys),
 			 "Device busy, fw_com release failed.");
 	isys->fwcom = NULL;
 }
@@ -218,7 +218,7 @@ static int ipu6_isys_fwcom_cfg_init(struct ipu6_isys *isys,
 	unsigned int max_send_queues, max_sram_blocks, max_devq_size;
 	struct ipu6_fw_syscom_queue_config *input_queue_cfg;
 	struct ipu6_fw_syscom_queue_config *output_queue_cfg;
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	int type_proxy = IPU6_FW_ISYS_QUEUE_TYPE_PROXY;
 	int type_dev = IPU6_FW_ISYS_QUEUE_TYPE_DEV;
 	int type_msg = IPU6_FW_ISYS_QUEUE_TYPE_MSG;
@@ -323,7 +323,7 @@ static int ipu6_isys_fwcom_cfg_init(struct ipu6_isys *isys,
 
 int ipu6_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	int retry = IPU6_ISYS_OPEN_RETRY;
 	struct ipu6_fw_com_cfg fwcom = {
 		.cell_start = start_sp,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index ddd19cde69be..575b90625c89 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -86,7 +86,7 @@ s64 ipu6_isys_csi2_get_link_freq(struct ipu6_isys_csi2 *csi2)
 
 	src_pad = media_entity_remote_source_pad_unique(&csi2->asd.sd.entity);
 	if (IS_ERR(src_pad)) {
-		dev_err(&csi2->isys->adev->auxdev.dev,
+		dev_err(isys_to_dev(to_isys(csi2)),
 			"can't get source pad of %s (%ld)\n",
 			csi2->asd.sd.name, PTR_ERR(src_pad));
 		return PTR_ERR(src_pad);
@@ -160,7 +160,7 @@ static int
 ipu6_isys_csi2_calc_timing(struct ipu6_isys_csi2 *csi2,
 			   struct ipu6_isys_csi2_timing *timing, s32 accinv)
 {
-	struct device *dev = &csi2->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(csi2));
 	s64 link_freq;
 
 	link_freq = ipu6_isys_csi2_get_link_freq(csi2);
@@ -202,7 +202,7 @@ void ipu6_isys_register_errors(struct ipu6_isys_csi2 *csi2)
 
 void ipu6_isys_csi2_error(struct ipu6_isys_csi2 *csi2)
 {
-	struct device *dev = &csi2->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(csi2));
 	const struct ipu6_csi2_error *errors;
 	u32 status;
 	u32 i;
@@ -227,7 +227,7 @@ static int ipu6_isys_csi2_set_stream(struct v4l2_subdev *sd,
 	struct isys_subdev *asd = to_isys_subdev(sd);
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(asd);
 	struct ipu6_isys *isys = csi2->isys;
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	struct ipu6_isys_csi2_config cfg;
 	unsigned int nports;
 	int ret = 0;
@@ -518,7 +518,7 @@ int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
 			struct ipu6_isys *isys,
 			void __iomem *base, unsigned int index)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	int ret;
 
 	csi2->isys = isys;
@@ -559,7 +559,7 @@ int ipu6_isys_csi2_init(struct ipu6_isys_csi2 *csi2,
 void ipu6_isys_csi2_sof_event_by_stream(struct isys_stream *stream)
 {
 	struct video_device *vdev = stream->asd->sd.devnode;
-	struct device *dev = &stream->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(stream));
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(stream->asd);
 	struct v4l2_event ev = {
 		.type = V4L2_EVENT_FRAME_SYNC,
@@ -574,7 +574,7 @@ void ipu6_isys_csi2_sof_event_by_stream(struct isys_stream *stream)
 
 void ipu6_isys_csi2_eof_event_by_stream(struct isys_stream *stream)
 {
-	struct device *dev = &stream->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(stream));
 	struct ipu6_isys_csi2 *csi2 = to_ipu6_isys_csi2(stream->asd);
 	u32 frame_sequence = atomic_read(&stream->sequence);
 
@@ -588,7 +588,7 @@ int ipu6_isys_csi2_get_remote_desc(u32 source_stream,
 				   struct v4l2_mbus_frame_desc_entry *entry)
 {
 	struct v4l2_mbus_frame_desc_entry *desc_entry = NULL;
-	struct device *dev = &csi2->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(csi2));
 	struct v4l2_mbus_frame_desc desc;
 	struct v4l2_subdev *source;
 	struct media_pad *pad;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
index db2874843453..78c6db71d51d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-dwc-phy.c
@@ -63,7 +63,7 @@ enum phy_fsm_state {
 static void dwc_dphy_write(struct ipu6_isys *isys, u32 phy_id, u32 addr,
 			   u32 data)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	void __iomem *isys_base = isys->pdata->base;
 	void __iomem *base = isys_base + IPU6_DWC_DPHY_BASE(phy_id);
 
@@ -74,7 +74,7 @@ static void dwc_dphy_write(struct ipu6_isys *isys, u32 phy_id, u32 addr,
 
 static u32 dwc_dphy_read(struct ipu6_isys *isys, u32 phy_id, u32 addr)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	void __iomem *isys_base = isys->pdata->base;
 	void __iomem *base = isys_base + IPU6_DWC_DPHY_BASE(phy_id);
 	u32 data;
@@ -112,7 +112,7 @@ static u32 __maybe_unused dwc_dphy_read_mask(struct ipu6_isys *isys, u32 phy_id,
 static int dwc_dphy_ifc_read(struct ipu6_isys *isys, u32 phy_id, u32 addr,
 			     u32 *val)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	void __iomem *isys_base = isys->pdata->base;
 	void __iomem *base = isys_base + IPU6_DWC_DPHY_BASE(phy_id);
 	void __iomem *reg;
@@ -139,7 +139,7 @@ static int dwc_dphy_ifc_read(struct ipu6_isys *isys, u32 phy_id, u32 addr,
 static int dwc_dphy_ifc_write(struct ipu6_isys *isys, u32 phy_id, u32 addr,
 			      u32 data)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	void __iomem *isys_base = isys->pdata->base;
 	void __iomem *base = isys_base + IPU6_DWC_DPHY_BASE(phy_id);
 	void __iomem *reg;
@@ -189,7 +189,7 @@ static u32 dwc_dphy_ifc_read_mask(struct ipu6_isys *isys, u32 phy_id, u32 addr,
 
 static int dwc_dphy_pwr_up(struct ipu6_isys *isys, u32 phy_id)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	u32 fsm_state;
 	int ret;
 
@@ -401,7 +401,7 @@ static void ipu6_isys_dwc_phy_aggr_setup(struct ipu6_isys *isys, u32 master,
 #define PHY_E	4
 static int ipu6_isys_dwc_phy_powerup_ack(struct ipu6_isys *isys, u32 phy_id)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	u32 rescal_done;
 	int ret;
 
@@ -434,7 +434,7 @@ static int ipu6_isys_dwc_phy_powerup_ack(struct ipu6_isys *isys, u32 phy_id)
 
 static void ipu6_isys_dwc_phy_reset(struct ipu6_isys *isys, u32 phy_id)
 {
-	dev_dbg(&isys->adev->auxdev.dev, "Reset phy %u", phy_id);
+	dev_dbg(isys_to_dev(isys), "Reset phy %u", phy_id);
 
 	dwc_dphy_write(isys, phy_id, IPU6_DWC_DPHY_SHUTDOWNZ, 0);
 	dwc_dphy_write(isys, phy_id, IPU6_DWC_DPHY_RSTZ, 0);
@@ -449,7 +449,7 @@ int ipu6_isys_dwc_phy_set_power(struct ipu6_isys *isys,
 				const struct ipu6_isys_csi2_timing *timing,
 				bool on)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	void __iomem *isys_base = isys->pdata->base;
 	u32 phy_id, primary, secondary;
 	u32 nlanes, port, mbps;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c b/drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c
index c804291cfae9..73ac24c6853d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-jsl-phy.c
@@ -63,7 +63,7 @@ static void ipu6_isys_csi2_phy_config_by_port(struct ipu6_isys *isys,
 					      unsigned int port,
 					      unsigned int nlanes)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	void __iomem *base = isys->adev->isp->base;
 	unsigned int bbnum;
 	u32 val, reg, i;
@@ -139,7 +139,7 @@ static void ipu6_isys_csi2_rx_control(struct ipu6_isys *isys)
 static int ipu6_isys_csi2_set_port_cfg(struct ipu6_isys *isys,
 				       unsigned int port, unsigned int nlanes)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	unsigned int sip = port / 2;
 	unsigned int index;
 
@@ -171,7 +171,7 @@ ipu6_isys_csi2_set_timing(struct ipu6_isys *isys,
 			  const struct ipu6_isys_csi2_timing *timing,
 			  unsigned int port, unsigned int nlanes)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	void __iomem *reg;
 	u32 port_base;
 	u32 i;
@@ -207,7 +207,7 @@ int ipu6_isys_jsl_phy_set_power(struct ipu6_isys *isys,
 				const struct ipu6_isys_csi2_timing *timing,
 				bool on)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	void __iomem *isys_base = isys->pdata->base;
 	int ret = 0;
 	u32 nlanes;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c b/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
index 71aa5009512a..95e40f43aeb4 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-mcd-phy.c
@@ -502,7 +502,7 @@ static const struct phy_reg **config_regs[3] = {
 
 static int ipu6_isys_mcd_phy_powerup_ack(struct ipu6_isys *isys, u8 id)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	void __iomem *isys_base = isys->pdata->base;
 	u32 val;
 	int ret;
@@ -522,7 +522,7 @@ static int ipu6_isys_mcd_phy_powerup_ack(struct ipu6_isys *isys, u8 id)
 
 static int ipu6_isys_mcd_phy_powerdown_ack(struct ipu6_isys *isys, u8 id)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	void __iomem *isys_base = isys->pdata->base;
 	u32 val;
 	int ret;
@@ -553,7 +553,7 @@ static void ipu6_isys_mcd_phy_reset(struct ipu6_isys *isys, u8 id, bool assert)
 
 static int ipu6_isys_mcd_phy_ready(struct ipu6_isys *isys, u8 id)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	void __iomem *isys_base = isys->pdata->base;
 	u32 val;
 	int ret;
@@ -621,7 +621,7 @@ static int ipu6_isys_driver_port_to_phy_port(struct ipu6_isys_csi2_config *cfg)
 
 static int ipu6_isys_mcd_phy_config(struct ipu6_isys *isys)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	struct ipu6_bus_device *adev = isys->adev;
 	const struct phy_reg **phy_config_regs;
 	struct ipu6_device *isp = adev->isp;
@@ -667,7 +667,7 @@ int ipu6_isys_mcd_phy_set_power(struct ipu6_isys *isys,
 				const struct ipu6_isys_csi2_timing *timing,
 				bool on)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	void __iomem *isys_base = isys->pdata->base;
 	u8 port, phy_id;
 	refcount_t *ref;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index d9457176f32f..1e1ae13d5e07 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -59,7 +59,7 @@ static int ipu6_isys_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
 {
 	struct isys_queue *aq = vb2_queue_to_isys_queue(q);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(av));
 	u32 size = ipu6_isys_get_data_size(av);
 
 	/* num_planes == 0: we're being called through VIDIOC_REQBUFS */
@@ -80,7 +80,7 @@ static int ipu6_isys_buf_prepare(struct vb2_buffer *vb)
 {
 	struct isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(av));
 	u32 bytesperline = ipu6_isys_get_bytes_per_line(av);
 	u32 height = ipu6_isys_get_frame_height(av);
 	u32 size = ipu6_isys_get_data_size(av);
@@ -123,7 +123,7 @@ void ipu6_isys_buffer_list_queue(struct isys_buffer_list *bl,
 		struct device *dev;
 
 		av = ipu6_isys_queue_to_video(aq);
-		dev = &av->isys->adev->auxdev.dev;
+		dev = isys_to_dev(to_isys(av));
 		spin_lock_irqsave(&aq->lock, flags);
 		list_del(&ib->head);
 		if (op_flags & ISYS_BUFFER_LIST_ACTIVE)
@@ -155,7 +155,7 @@ void ipu6_isys_buffer_list_queue(struct isys_buffer_list *bl,
  */
 static void flush_firmware_streamon_fail(struct isys_stream *stream)
 {
-	struct device *dev = &stream->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(stream));
 	struct isys_queue *aq;
 	unsigned long flags;
 
@@ -197,7 +197,7 @@ static void flush_firmware_streamon_fail(struct isys_stream *stream)
 static int buffer_list_get(struct isys_stream *stream,
 			   struct isys_buffer_list *bl)
 {
-	struct device *dev = &stream->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(stream));
 	struct isys_queue *aq;
 	unsigned long flags;
 	unsigned long buf_flag = ISYS_BUFFER_LIST_INCOMING;
@@ -291,7 +291,7 @@ static int ipu6_isys_stream_start(struct ipu6_isys_video *av,
 				  struct isys_buffer_list *bl, bool error)
 {
 	struct isys_stream *stream = av->stream;
-	struct device *dev = &stream->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(stream));
 	struct isys_buffer_list __bl;
 	int ret;
 
@@ -353,7 +353,7 @@ static void buf_queue(struct vb2_buffer *vb)
 	struct isys_video_buffer *ivb =
 		vb2_buffer_to_isys_video_buffer(vvb);
 	struct isys_buffer *ib = &ivb->ib;
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(av));
 	struct media_pipeline *media_pipe =
 		media_entity_pipeline(&av->vdev.entity);
 	struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
@@ -436,7 +436,7 @@ static int ipu6_isys_link_fmt_validate(struct isys_queue *aq)
 {
 	struct v4l2_mbus_framefmt format;
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(av));
 	struct media_pad *remote_pad =
 		media_pad_remote_pad_first(av->vdev.entity.pads);
 	struct v4l2_subdev *sd;
@@ -539,7 +539,7 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 {
 	struct isys_queue *aq = vb2_queue_to_isys_queue(q);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(av));
 	const struct isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	struct isys_buffer_list __bl, *bl = NULL;
@@ -654,7 +654,7 @@ static unsigned int
 get_sof_sequence_by_timestamp(struct isys_stream *stream, u64 time)
 {
 	struct ipu6_isys *isys = stream->isys;
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	unsigned int i;
 
 	/*
@@ -700,7 +700,7 @@ ipu6_isys_buf_calc_sequence_time(struct isys_buffer *ib, u64 time)
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(av));
 	struct isys_stream *stream = av->stream;
 	u64 ns;
 	u32 sequence;
@@ -739,7 +739,7 @@ ipu6_stream_buf_ready(struct isys_stream *stream, u8 pin_id, u32 pin_addr,
 {
 	struct isys_queue *aq = stream->output_pins[pin_id].aq;
 	struct ipu6_isys *isys = stream->isys;
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	struct isys_buffer *ib;
 	struct vb2_buffer *vb;
 	unsigned long flags;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 71429e83d8aa..1bc55aa0e2d0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -366,7 +366,7 @@ static int link_validate(struct media_link *link)
 {
 	struct ipu6_isys_video *av =
 		container_of(link->sink, struct ipu6_isys_video, pad);
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(av));
 	struct v4l2_subdev_state *s_state;
 	struct v4l2_subdev *s_sd;
 	struct v4l2_mbus_framefmt *s_fmt;
@@ -450,7 +450,7 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
 	struct v4l2_rect v4l2_crop;
 	struct ipu6_isys *isys = av->isys;
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	int input_pins = cfg->nof_input_pins++;
 	int output_pins;
 	u32 src_stream;
@@ -521,7 +521,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 	struct ipu6_fw_isys_stream_cfg_data_abi *stream_cfg;
 	struct ipu6_fw_isys_frame_buff_set_abi *buf = NULL;
 	struct isys_stream *stream = av->stream;
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(av));
 	struct isys_fw_msgs *msg = NULL;
 	struct isys_queue *aq;
 	int ret, retout, tout;
@@ -658,7 +658,7 @@ static int start_stream_firmware(struct ipu6_isys_video *av,
 
 static void stop_streaming_firmware(struct ipu6_isys_video *av)
 {
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(av));
 	struct isys_stream *stream = av->stream;
 	int ret, tout;
 
@@ -685,7 +685,7 @@ static void stop_streaming_firmware(struct ipu6_isys_video *av)
 static void close_streaming_firmware(struct ipu6_isys_video *av)
 {
 	struct isys_stream *stream = av->stream;
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(av));
 	int ret, tout;
 
 	reinit_completion(&stream->stream_close_completion);
@@ -733,7 +733,7 @@ int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
 	csi2->receiver_errors = 0;
 	stream->source_entity = source_entity;
 
-	dev_dbg(&av->isys->adev->auxdev.dev,
+	dev_dbg(isys_to_dev(to_isys(av)),
 		"prepare stream: external entity %s\n",
 		stream->source_entity->name);
 
@@ -746,7 +746,7 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 	struct ipu6_isys *isys = av->isys;
 	struct ipu6_isys_csi2 *csi2 = NULL;
 	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	struct v4l2_mbus_framefmt format;
 	struct v4l2_subdev *esd;
 	struct v4l2_control hb = { .id = V4L2_CID_HBLANK, .value = 0 };
@@ -852,7 +852,7 @@ void ipu6_isys_put_stream(struct isys_stream *stream)
 		return;
 	}
 
-	dev = &stream->isys->adev->auxdev.dev;
+	dev = isys_to_dev(to_isys(stream));
 
 	spin_lock_irqsave(&stream->isys->streams_lock, flags);
 	for (i = 0; i < IPU6_ISYS_MAX_STREAMS; i++) {
@@ -916,7 +916,7 @@ ipu6_isys_query_stream_by_handle(struct ipu6_isys *isys, u8 stream_handle)
 		return NULL;
 
 	if (stream_handle >= IPU6_ISYS_MAX_STREAMS) {
-		dev_err(&isys->adev->auxdev.dev,
+		dev_err(isys_to_dev(isys),
 			"stream_handle %d is invalid\n", stream_handle);
 		return NULL;
 	}
@@ -942,7 +942,7 @@ ipu6_isys_query_stream_by_source(struct ipu6_isys *isys, int source, u8 vc)
 		return NULL;
 
 	if (source < 0) {
-		dev_err(&isys->adev->auxdev.dev,
+		dev_err(isys_to_dev(isys),
 			"query stream with invalid port number\n");
 		return NULL;
 	}
@@ -987,7 +987,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 	struct v4l2_subdev_krouting *routing;
 	struct isys_stream *stream = av->stream;
 	struct v4l2_subdev_state *subdev_state;
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(av));
 	struct v4l2_subdev *sd;
 	struct media_pad *r_pad;
 	u32 sink_pad, sink_stream;
@@ -1151,7 +1151,7 @@ void ipu6_isys_fw_close(struct ipu6_isys *isys)
 		ipu6_fw_isys_close(isys);
 		if (isys->fwcom) {
 			isys->need_reset = true;
-			dev_warn(&isys->adev->auxdev.dev,
+			dev_warn(isys_to_dev(isys),
 				 "failed to close fw isys\n");
 		}
 	}
@@ -1159,9 +1159,9 @@ void ipu6_isys_fw_close(struct ipu6_isys *isys)
 	mutex_unlock(&isys->mutex);
 
 	if (isys->need_reset)
-		pm_runtime_put_sync(&isys->adev->auxdev.dev);
+		pm_runtime_put_sync(isys_to_dev(isys));
 	else
-		pm_runtime_put(&isys->adev->auxdev.dev);
+		pm_runtime_put(isys_to_dev(isys));
 }
 
 int ipu6_isys_setup_video(struct ipu6_isys_video *av,
@@ -1169,7 +1169,7 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 {
 	const struct isys_pixelformat *pfmt =
 		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
-	struct device *dev = &av->isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(to_isys(av));
 	struct v4l2_mbus_frame_desc_entry entry;
 	struct v4l2_subdev_route *route = NULL;
 	struct v4l2_subdev_route *r;
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 8ac0cc7574de..827ae7b9bfc8 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -107,7 +107,7 @@ isys_complete_ext_device_registration(struct ipu6_isys *isys,
 				      struct v4l2_subdev *sd,
 				      struct ipu6_isys_csi2_config *csi2)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	unsigned int i;
 	int ret;
 
@@ -198,7 +198,7 @@ static int isys_csi2_create_media_links(struct ipu6_isys *isys)
 {
 	const struct ipu6_isys_internal_csi2_pdata *csi2_pdata =
 		&isys->pdata->ipdata->csi2;
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	unsigned int i, j;
 	int ret;
 
@@ -418,7 +418,7 @@ static void get_lut_ltrdid(struct ipu6_isys *isys, struct ltr_did *pltr_did)
 
 static int set_iwake_register(struct ipu6_isys *isys, u32 index, u32 value)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	u32 req_id = index;
 	u32 offset = 0;
 	int ret;
@@ -448,7 +448,7 @@ static int set_iwake_register(struct ipu6_isys *isys, u32 index, u32 value)
 static void set_iwake_ltrdid(struct ipu6_isys *isys, u16 ltr, u16 did,
 			     enum ltr_did_type use)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	u16 ltr_val, ltr_scale = LTR_SCALE_1024NS;
 	u16 did_val, did_scale = DID_SCALE_1US;
 	struct ipu6_device *isp = isys->adev->isp;
@@ -532,7 +532,7 @@ void update_watermark_setting(struct ipu6_isys *isys)
 {
 	struct isys_iwake_watermark *iwake_watermark = &isys->iwake_watermark;
 	u32 iwake_threshold, iwake_critical_threshold, page_num;
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	u32 calc_fill_time_us = 0, ltr = 0, did = 0;
 	struct video_stream_watermark *p_watermark;
 	enum ltr_did_type ltr_did_type;
@@ -680,18 +680,18 @@ static int isys_notifier_bound(struct v4l2_async_notifier *notifier,
 	int ret;
 
 	if (s_asd->csi2.port >= isys->pdata->ipdata->csi2.nports) {
-		dev_err(&isys->adev->auxdev.dev, "invalid csi2 port %u\n",
+		dev_err(isys_to_dev(isys), "invalid csi2 port %u\n",
 			s_asd->csi2.port);
 		return -EINVAL;
 	}
 
 	ret = ipu_bridge_instantiate_vcm(sd->dev);
 	if (ret) {
-		dev_err(&isys->adev->auxdev.dev, "instantiate vcm failed\n");
+		dev_err(isys_to_dev(isys), "instantiate vcm failed\n");
 		return ret;
 	}
 
-	dev_dbg(&isys->adev->auxdev.dev, "bind %s nlanes is %d port is %d\n",
+	dev_dbg(isys_to_dev(isys), "bind %s nlanes is %d port is %d\n",
 		sd->name, s_asd->csi2.nlanes, s_asd->csi2.port);
 	ret = isys_complete_ext_device_registration(isys, sd, &s_asd->csi2);
 	if (ret)
@@ -782,7 +782,7 @@ static void isys_notifier_cleanup(struct ipu6_isys *isys)
 
 static int isys_register_devices(struct ipu6_isys *isys)
 {
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	struct pci_dev *pdev = isys->adev->isp->pdev;
 	int ret;
 
@@ -985,7 +985,7 @@ static int alloc_fw_msg_bufs(struct ipu6_isys *isys, int amount)
 struct isys_fw_msgs *ipu6_get_fw_msg_buf(struct isys_stream *stream)
 {
 	struct ipu6_isys *isys = stream->isys;
-	struct device *dev = &isys->adev->auxdev.dev;
+	struct device *dev = isys_to_dev(isys);
 	struct isys_fw_msgs *msg;
 	unsigned long flags;
 	int ret;
-- 
2.34.1


