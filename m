Return-Path: <linux-media+bounces-12591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B67E8FD333
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 18:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98F161F248B5
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 16:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D6F1922FD;
	Wed,  5 Jun 2024 16:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T1q9Jxv6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB181CD25
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 16:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717606506; cv=none; b=INXDVuOtfAxjNlpPpfw/mOz3iZyKeCI2HZYui3yuMAmq8GVuXXZ9lF/RZdymOU0c3RYGY/4WBNu0SGhC4vHLAupXtMA7EmB6pGvKcnUUh5Q4aIBINkrhWruSmzRX34OtnL47dGvqWqba3WYuZpHWIfRO5aCy1tO0VE3B64E2nmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717606506; c=relaxed/simple;
	bh=ZhnGrUGKDXQkVTXg5HRlyrWUPMfF1NMM9zqRJG8uNd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sn+ZSU1xeoCCE+RPOfr2pJIg9I4/Zegj8H3TOX/iGvvbLDmTLNfDdSvNJF6RymaBEfep7zHT1+QsBjCBXxY+XkSxkiWJV15jiRsO8m4me2g+fcEuWRkdKpaXMBqTptlTQ9rrOul/STHN5mBO7zXU6DyBV+pjZzKuoTAYbL+KnUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T1q9Jxv6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C855E16D4;
	Wed,  5 Jun 2024 18:54:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717606489;
	bh=ZhnGrUGKDXQkVTXg5HRlyrWUPMfF1NMM9zqRJG8uNd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T1q9Jxv6DMeHioVji51Ye9lix6+3HvxqTkD2LwkqCzANL9GEliSPgr7JSGqTXF8eG
	 x14Z4IWmr7hqXgQsGP0YJ6e/HDnvC4bOMmjl2kfabqO+7W/Pf9F005qzLGz+282zYT
	 zZAADndrjeJgUOUcWeIpYAWLVKG8SVdMGY2Kbj5Y=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/8] uapi: rkisp1-config: Add extensible parameters format
Date: Wed,  5 Jun 2024 18:54:20 +0200
Message-ID: <20240605165434.432230-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add to the rkisp1-config.h header data types and documentation of
the extensible parameters format.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 include/uapi/linux/rkisp1-config.h | 482 +++++++++++++++++++++++++++++
 1 file changed, 482 insertions(+)

diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
index 6eeaf8bf2362..9c93e536f270 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -996,4 +996,486 @@ struct rkisp1_stat_buffer {
 	struct rkisp1_cif_isp_stat params;
 };
 
+/*---------- PART3: Extensible Configuration Parameters  ------------*/
+
+/**
+ * enum rkisp1_ext_params_block_type - RkISP1 extensible params block type
+ *
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS: Black level subtraction
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC: Defect pixel cluster correction
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG: Sensor de-gamma
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAINS: Auto white balance gains
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT: ISP filtering
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM: Bayer de-mosaic
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK: Cross-talk correction
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC: Gamma out correction
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF: De-noise pre-filter
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGHT: De-noise pre-filter strength
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC: Color processing
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_IE: Image effects
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC: Lens shading correction
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS: Auto white balance statistics
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS: Histogram statistics
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS: Auto exposure statistics
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS: Auto-focus statistics
+ */
+enum rkisp1_ext_params_block_type {
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_SDG,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_GAINS,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_FLT,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_BDM,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_CTK,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_GOC,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_DPF_STRENGHT,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_CPROC,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_IE,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_LSC,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB_MEAS,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS,
+	RKISP1_EXT_PARAMS_BLOCK_TYPE_SENTINEL,
+};
+
+/**
+ * enum rkisp1_ext_params_block_state - RkISP1 extensible parameter block enable
+ *					state flags
+ *
+ * @RKISP1_EXT_PARAMS_BLOCK_NO_CHANGE: Do not change the block power state
+ * @RKISP1_EXT_PARAMS_BLOCK_DISABLE: Disable the HW block
+ * @RKISP1_EXT_PARAMS_BLOCK_ENABLE: Enable the HW block
+ */
+enum rkisp1_ext_params_block_state {
+	RKISP1_EXT_PARAMS_BLOCK_NO_CHANGE,
+	RKISP1_EXT_PARAMS_BLOCK_DISABLE,
+	RKISP1_EXT_PARAMS_BLOCK_ENABLE,
+};
+
+/**
+ * struct rkisp1_ext_params_block_header - RkISP1 extensible parameter block
+ *					   header
+ *
+ * This structure represents the common part of all the ISP configuration
+ * blocks. Each parameters block shall embed an instance of this structure type
+ * as its first member, followed by the block-specific configuration data. The
+ * driver inspects this common header to discern the block type and its size and
+ * properly handle the block content by casting it to the correct block-specific
+ * type.
+ *
+ * The @type field is one of the values enumerated by
+ * :c:type:`rkisp1_ext_params_block_type` and specifies how the data should be
+ * interpreted by the driver. The @size field specifies the size of the
+ * parameters block and is used by the driver for validation purposes.
+ *
+ * The @state field specifies if the ISP block power state should be changed,
+ * and, if it has to, if it has to be enabled to disabled. The possible
+ * states are enumerated by :c:type:`rkisp1_ext_params_block_state`.
+ * When userspace needs to configure and enable an ISP block it shall fully
+ * populate the block configuration and the @state flag shall be set to
+ * RKISP1_EXT_PARAMS_BLOCK_ENABLE. When userspace simply wants to disable the
+ * ISP block the @state flag shall be set to RKISP1_EXT_PARAMS_BLOCK_DISABLE. If
+ * a new configuration of an ISP block should be applied but the power state
+ * doesn't need to be changed, userspace shall fully populate the ISP block
+ * configuration and the @state flag shall be set to
+ * RKISP1_EXT_PARAMS_BLOCK_NO_CHANGE.
+ *
+ * Userspace is responsible for correctly populating the parameters block header
+ * fields (@type, @state and @size) and correctly populate the block-specific
+ * parameters.
+ *
+ * For example:
+ *
+ * .. code-block:: c
+ *
+ *	void populate_bls(struct rkisp1_ext_params_block_header *block) {
+ *		struct rkisp1_ext_params_bls_config *bls =
+ *			(struct rkisp1_ext_params_bls_config *)block;
+ *
+ *		block->header.type = RKISP1_EXT_PARAMS_BLOCK_ID_BLS;
+ *		block->header.state = RKISP1_EXT_PARAMS_BLOCK_ENABLE;
+ *		block->header.size = sizeof(struct rkisp1_ext_params_bls_config);
+ *
+ *		bls->bls_config.enable_auto = 0;
+ *		bls->bls_config.fixed_val.r = blackLevelRed_;
+ *		bls->bls_config.fixed_val.gr = blackLevelGreenR_;
+ *		bls->bls_config.fixed_val.gb = blackLevelGreenB_;
+ *		bls->bls_config.fixed_val.b = blackLevelBlue_;
+ *	}
+ *
+ * @type: The parameters block type, see
+ *	  :c:type:`rkisp1_ext_params_block_type`
+ * @state: The block enable state flag, see
+ *	   :c:type:`rkisp1_ext_params_block_state`
+ * @size: Size (in bytes) of the parameters block, including this header
+ */
+struct rkisp1_ext_params_block_header {
+	__u32 type;
+	__u32 state;
+	__u64 size;
+};
+
+/**
+ * struct rkisp1_ext_params_bls_config - RkISP1 extensible params BLS config
+ *
+ * RkISP1 extensible parameters Black Level Subtraction configuration block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @bls_config: Black Level Subtraction configuration, see
+ *		:c:type:`rkisp1_cif_isp_bls_config`
+ */
+struct rkisp1_ext_params_bls_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_bls_config bls_config;
+};
+
+/**
+ * struct rkisp1_ext_params_dpcc_config - RkISP1 extensible params DPCC config
+ *
+ * RkISP1 extensible parameters Defective Pixel Cluster Correction configuration
+ * block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @dpcc_config: Defective Pixel Cluster Correction configuration, see
+ *		 :c:type:`rkisp1_cif_isp_dpcc_config`
+ */
+struct rkisp1_ext_params_dpcc_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_dpcc_config dpcc_config;
+};
+
+/**
+ * struct rkisp1_ext_params_sdg_config - RkISP1 extensible params SDG config
+ *
+ * RkISP1 extensible parameters Sensor Degamma configuration block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @sdg_config: Sensor Degamma configuration, see
+ *		:c:type:`rkisp1_cif_isp_sdg_config`
+ */
+struct rkisp1_ext_params_sdg_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_sdg_config sdg_config;
+};
+
+/**
+ * struct rkisp1_ext_params_lsc_config - RkISP1 extensible params LSC config
+ *
+ * RkISP1 extensible parameters Lens Shading Correction configuration block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @lsc_config: Lens Shading Correction configuration, see
+ *		:c:type:`rkisp1_cif_isp_lsc_config`
+ */
+struct rkisp1_ext_params_lsc_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_lsc_config lsc_config;
+};
+
+/**
+ * struct rkisp1_ext_params_awb_gain_config - RkISP1 extensible params AWB
+ *					      gain config
+ *
+ * RkISP1 extensible parameters Auto-White Balance Gains configuration block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @awb_config: Auto-White Balance Gains configuration, see
+ *		:c:type:`rkisp1_cif_isp_awb_gain_config`
+ */
+struct rkisp1_ext_params_awb_gain_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_awb_gain_config awb_config;
+};
+
+/**
+ * struct rkisp1_ext_params_flt_config - RkISP1 extensible params FLT config
+ *
+ * RkISP1 extensible parameters Filter configuration block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @flt_config: Filter configuration, see
+ *		:c:type:`rkisp1_cif_isp_flt_config`
+ */
+struct rkisp1_ext_params_flt_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_flt_config flt_config;
+};
+
+/**
+ * struct rkisp1_ext_params_bdm_config - RkISP1 extensible params BDM config
+ *
+ * RkISP1 extensible parameters Demosaicing configuration block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @bdm_config: Demosaicing configuration, see
+ *		:c:type:`rkisp1_cif_isp_bdm_config`
+ */
+struct rkisp1_ext_params_bdm_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_bdm_config bdm_config;
+};
+
+/**
+ * struct rkisp1_ext_params_ctk_config - RkISP1 extensible params CTK config
+ *
+ * RkISP1 extensible parameters Cross-Talk configuration block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @ctk_config: Cross-Talk configuration, see
+ *		:c:type:`rkisp1_cif_isp_ctk_config`
+ */
+struct rkisp1_ext_params_ctk_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_ctk_config ctk_config;
+};
+
+/**
+ * struct rkisp1_ext_params_goc_config - RkISP1 extensible params GOC config
+ *
+ * RkISP1 extensible parameters Gamma-Out configuration block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @goc_config: Gamma-Out configuration, see
+ *		:c:type:`rkisp1_cif_isp_goc_config`
+ */
+struct rkisp1_ext_params_goc_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_goc_config goc_config;
+};
+
+/**
+ * struct rkisp1_ext_params_dpf_config - RkISP1 extensible params DPF config
+ *
+ * RkISP1 extensible parameters De-noise Pre-Filter configuration block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @dpf_config: De-noise Pre-Filter configuration, see
+ *		:c:type:`rkisp1_cif_isp_dpf_config`
+ */
+struct rkisp1_ext_params_dpf_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_dpf_config dpf_config;
+};
+
+/**
+ * struct rkisp1_ext_params_dpf_strength_config - RkISP1 extensible params DPF
+ *						  strength config
+ *
+ * RkISP1 extensible parameters De-noise Pre-Filter strength configuration block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @dpf_strength_config: De-noise Pre-Filter strength configuration, see
+ *			 :c:type:`rkisp1_cif_isp_dpf_strength_config`
+ */
+struct rkisp1_ext_params_dpf_strength_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_dpf_strength_config dpf_strength_config;
+};
+
+/**
+ * struct rkisp1_ext_params_cproc_config - RkISP1 extensible params CPROC config
+ *
+ * RkISP1 extensible parameters Color Processing configuration block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @cproc_config: Color processing configuration, see
+ *		  :c:type:`rkisp1_cif_isp_cproc_config`
+ */
+struct rkisp1_ext_params_cproc_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_cproc_config cproc_config;
+};
+
+/**
+ * struct rkisp1_ext_params_ie_config - RkISP1 extensible params IE config
+ *
+ * RkISP1 extensible parameters Image Effect configuration block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @ie_config: Image Effect configuration, see
+ *	       :c:type:`rkisp1_cif_isp_ie_config`
+ */
+struct rkisp1_ext_params_ie_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_ie_config ie_config;
+};
+
+/**
+ * struct rkisp1_ext_params_awb_meas_config - RkISP1 extensible params AWB
+ *					      Meas config
+ *
+ * RkISP1 extensible parameters Auto-White Balance Measurement configuration
+ * block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @awb_meas_config: Auto-White Balance measure configuration, see
+ *		     :c:type:`rkisp1_cif_isp_awb_meas_config`
+ */
+struct rkisp1_ext_params_awb_meas_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_awb_meas_config awb_meas_config;
+};
+
+/**
+ * struct rkisp1_ext_params_hst_config - RkISP1 extensible params Histogram config
+ *
+ * RkISP1 extensible parameters Histogram statistics configuration block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @hst_config: Histogram statistics configuration, see
+ *		:c:type:`rkisp1_cif_isp_hst_config`
+ */
+struct rkisp1_ext_params_hst_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_hst_config hst_config;
+};
+
+/**
+ * struct rkisp1_ext_params_aec_config - RkISP1 extensible params AEC config
+ *
+ * RkISP1 extensible parameters Auto-Exposure statistics configuration block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @aec_config: Auto-Exposure statistics configuration, see
+ *		:c:type:`rkisp1_cif_isp_aec_config`
+ */
+struct rkisp1_ext_params_aec_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_aec_config aec_config;
+};
+
+/**
+ * struct rkisp1_ext_params_afc_config - RkISP1 extensible params AFC config
+ *
+ * RkISP1 extensible parameters Auto-Focus statistics configuration block
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *	    :c:type:`rkisp1_ext_params_block_header`
+ * @afc_config: Auto-Focus statistics configuration, see
+ *		:c:type:`rkisp1_cif_isp_afc_config`
+ */
+struct rkisp1_ext_params_afc_config {
+	struct rkisp1_ext_params_block_header header;
+	struct rkisp1_cif_isp_afc_config afc_config;
+};
+
+#define RKISP1_EXT_PARAMS_MAX_SIZE					\
+	(sizeof(struct rkisp1_ext_params_bls_config)			+\
+	sizeof(struct rkisp1_ext_params_dpcc_config)			+\
+	sizeof(struct rkisp1_ext_params_sdg_config)			+\
+	sizeof(struct rkisp1_ext_params_lsc_config)			+\
+	sizeof(struct rkisp1_ext_params_awb_gain_config)		+\
+	sizeof(struct rkisp1_ext_params_flt_config)			+\
+	sizeof(struct rkisp1_ext_params_bdm_config)			+\
+	sizeof(struct rkisp1_ext_params_ctk_config)			+\
+	sizeof(struct rkisp1_ext_params_goc_config)			+\
+	sizeof(struct rkisp1_ext_params_dpf_config)			+\
+	sizeof(struct rkisp1_ext_params_dpf_strength_config)		+\
+	sizeof(struct rkisp1_ext_params_cproc_config)			+\
+	sizeof(struct rkisp1_ext_params_ie_config)			+\
+	sizeof(struct rkisp1_ext_params_awb_meas_config)		+\
+	sizeof(struct rkisp1_ext_params_hst_config)			+\
+	sizeof(struct rkisp1_ext_params_aec_config)			+\
+	sizeof(struct rkisp1_ext_params_afc_config))
+
+/**
+ * enum rksip1_ext_param_buffer_version - RkISP1 extensible parameters version
+ *
+ * @RKISP1_EXT_PARAM_BUFFER_V1: First version of RkISP1 extensible parameters
+ */
+enum rksip1_ext_param_buffer_version {
+	RKISP1_EXT_PARAM_BUFFER_V1 = 1,
+};
+
+/**
+ * struct rkisp1_ext_params_cfg - RkISP1 extensible parameters configuration
+ *
+ * This struct contains the configuration parameters of the RkISP1 ISP
+ * algorithms, serialized by userspace into a data buffer. Each configuration
+ * parameter block is represented by a block-specific structure which contains a
+ * :c:type:`rkisp1_ext_params_block_header` entry as first member. Userspace
+ * populates the @data buffer with configuration parameters for the blocks that
+ * it intends to configure. As a consequence, the data buffer effective size
+ * changes according to the number of ISP blocks that userspace intends to
+ * configure and is set by userspace in the @total_size field.
+ *
+ * The parameters buffer is versioned by the @version field to allow modifying
+ * and extending its definition. Userspace shall populate the @version field to
+ * inform the driver about the version it intends to use. The driver will parse
+ * and handle the @data buffer according to the data layout specific to the
+ * indicated version and return an error if the desired version is not
+ * supported.
+ *
+ * For each ISP block that userspace wants to configure, a block-specific
+ * structure is appended to the @data buffer, one after the other without gaps
+ * in between nor overlaps. Userspace shall populate the @total_size field with
+ * the effective size, in bytes, of the @data buffer.
+ *
+ * The expected memory layout of the parameters buffer is::
+ *
+ *	+-------------------- struct rkisp1_ext_params_cfg -------------------+
+ *	| version = RKISP_EXT_PARAMS_BUFFER_V1;                               |
+ *	| total_size = sizeof(struct rkisp1_ext_params_bls_config)            |
+ *	|              sizeof(struct rkisp1_ext_params_dpcc_config);          |
+ *	| +------------------------- data  ---------------------------------+ |
+ *	| | +------------- struct rkisp1_ext_params_bls_config -----------+ | |
+ *	| | | +-------- struct rkisp1_ext_params_block_header  ---------+ | | |
+ *	| | | | type = RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS;                | | | |
+ *	| | | | state = RKISP1_EXT_PARAMS_BLOCK_ENABLE;                 | | | |
+ *	| | | | size = sizeof(struct rkisp1_ext_params_bls_config);     | | | |
+ *	| | | +---------------------------------------------------------+ | | |
+ *	| | | +---------- struct rkisp1_cif_isp_bls_config -------------+ | | |
+ *	| | | | enable_auto = 0;                                        | | | |
+ *	| | | | fixed_val.r = 256;                                      | | | |
+ *	| | | | fixed_val.gr = 256;                                     | | | |
+ *	| | | | fixed_val.gb = 256;                                     | | | |
+ *	| | | | fixed_val.b = 256;                                      | | | |
+ *	| | | +---------------------------------------------------------+ | | |
+ *	| | +------------ struct rkisp1_ext_params_dpcc_config -----------+ | |
+ *	| | | +-------- struct rkisp1_ext_params_block_header  ---------+ | | |
+ *	| | | | type = RKISP1_EXT_PARAMS_BLOCK_TYPE_DPCC;               | | | |
+ *	| | | | state = RKISP1_EXT_PARAMS_BLOCK_ENABLE;                 | | | |
+ *	| | | | size = sizeof(struct rkisp1_ext_params_dpcc_config);    | | | |
+ *	| | | +---------------------------------------------------------+ | | |
+ *	| | | +---------- struct rkisp1_cif_isp_dpcc_config ------------+ | | |
+ *	| | | | mode = RKISP1_CIF_ISP_DPCC_MODE_STAGE1_ENABLE;          | | | |
+ *	| | | | output_mode =                                           | | | |
+ *	| | | |   RKISP1_CIF_ISP_DPCC_OUTPUT_MODE_STAGE1_INCL_G_CENTER; | | | |
+ *	| | | | set_use = ... ;                                         | | | |
+ *	| | | | ...  = ... ;                                            | | | |
+ *	| | | +---------------------------------------------------------+ | | |
+ *	| | +-------------------------------------------------------------+ | |
+ *	| +-----------------------------------------------------------------+ |
+ *	+---------------------------------------------------------------------+
+ *
+ * @version: The RkISP1 extensible parameters buffer version, see
+ *	     :c:type:`rksip1_ext_param_buffer_version`
+ * @total_size: The RkISP1 configuration data effective size, excluding this
+ *		header
+ * @data: The RkISP1 extensible configuration data blocks
+ */
+struct rkisp1_ext_params_cfg {
+	__u32 version;
+	__u64 total_size;
+	__u8 data[RKISP1_EXT_PARAMS_MAX_SIZE];
+};
+
 #endif /* _UAPI_RKISP1_CONFIG_H */
-- 
2.45.1


