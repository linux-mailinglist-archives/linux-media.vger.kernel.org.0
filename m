Return-Path: <linux-media+bounces-52506-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sISxCqX5imlBPAAAu9opvQ
	(envelope-from <linux-media+bounces-52506-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:25:57 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A84C118D8C
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26022306ECA1
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B32340D84;
	Tue, 10 Feb 2026 09:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b="lp0SA8Iv"
X-Original-To: linux-media@vger.kernel.org
Received: from s.wrqvtzvf.outbound-mail.sendgrid.net (s.wrqvtzvf.outbound-mail.sendgrid.net [149.72.126.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCE73375DC
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 09:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.72.126.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715457; cv=none; b=L5/ttskWBXxk0GvbqtxUss4vnOm8Q60age9fvV3cP6574M/zY3O9JulFYS0Qed6Yk59oSE8Tr2ayCCdDU3e8vmWnmCuvINPqUr5FtDWPSeVCgyFfCkQoQ8afADCFt4Mrf3H/10mrzFHrdlgiUtTtdi8OK22q8c1/aD+oZgUM/w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715457; c=relaxed/simple;
	bh=mdHV/OrvcoTOfYGXpBzBJ5qf8muzn3HLdO3CHr+Ip3Y=;
	h=From:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 To:Cc:Content-Type; b=rtx3zQ1zia2lkSxmaw40vKwU+l0MmiaHJiLRQu+3dQrrXi05hEvmxREkULLp7bBcfSNpvziBulTe5vO7c476Mg3LzTzFLwAPvRv9r4ty5jhUa8FXyZfUXuqsDRO4TUpnKMx+42S2/xLt8zP4F0MPRlllgZyYQ9E4lGrHiQgQKi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net; spf=pass smtp.mailfrom=em431.mattwardle.net; dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b=lp0SA8Iv; arc=none smtp.client-ip=149.72.126.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em431.mattwardle.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mattwardle.net;
	h=from:subject:date:in-reply-to:references:mime-version:to:cc:
	content-transfer-encoding:content-type:cc:content-type:date:from:subject:to;
	s=s1; bh=snQso672sutlEFlqaXhUA/V91FaIPJyTuuy2toBCCeM=;
	b=lp0SA8IvRapHLb7CAvDenq94EAZbFwKGcj2l1P/PRxN0Waj54CWf30MSl0d1Q6STusvs
	VKfnJzqG7LyaAcI54dJYPs1CZlCXyA9KHjYA1MGJkWFLCu26vCS59JlQF87jqjrnCHEdBh
	MjTn4BHpsVCXyOcu9H5ubTnik8ljwxMCcnaezH5t5354p1MOOdoKtzO8PADtgSVtuAIQL0
	Vr+CPGAvjgshU7OLXATjS3DAcjK/dAnSJcKoRbgvpqNq2sej3EvwK3EiTZhMOBuc5SIeAB
	/NXyOrdPH0B2J44A8F5kZ1CL0dgYdeUwx3e1xnjdjGzupLrBGi83v5yr5rjSYoPw==
Received: by recvd-5fb7fdbd94-cwpcz with SMTP id recvd-5fb7fdbd94-cwpcz-1-698AF93F-E
	2026-02-10 09:24:15.304883989 +0000 UTC m=+55682.711982724
Received: from mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (unknown)
	by geopod-ismtpd-3 (SG) with ESMTP
	id 0-zhEk9CQjCSmtlsjGGwsg
	Tue, 10 Feb 2026 09:24:05.513 +0000 (UTC)
Authentication-Results: mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net; dmarc=fail (p=reject dis=none) header.from=mattwardle.net
Received: from thinkpad (unknown [161.142.117.49])
	by mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (Postfix) with ESMTPSA id 57BDE40E37;
	Tue, 10 Feb 2026 09:24:05 +0000 (UTC)
From: Matt Wardle <matt@mattwardle.net>
Subject: [PATCH 3/3] staging: media: atomisp: Fix braces on incorrect lines
Date: Tue, 10 Feb 2026 09:24:15 +0000 (UTC)
Message-ID: <20260210092243.294732-4-matt@mattwardle.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210092243.294732-1-matt@mattwardle.net>
References: <20260210092243.294732-1-matt@mattwardle.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SG-EID: 
 =?us-ascii?Q?u001=2EFlbIg1=2FBrpD1HWcEBlj1tgh=2F0VDwewqbkmeZ1SFD9tLmzlDepFYnLmfnO?=
 =?us-ascii?Q?moWHy7n5HdVZTdyWWeMojZeck4brVYul=2FIqvcwM?=
 =?us-ascii?Q?d58FkwoGE+aZ=2FgGAunHiGqEHnhv=2FBXvNq3Sld2d?=
 =?us-ascii?Q?LlXs9vZ21PJ+CaCif9hbXYxTu=2FbKgtF19Qtsmzw?=
 =?us-ascii?Q?AXsbYN9ojmksgEoCKmbRBLA0KMOnupTOkHVFFYB?=
 =?us-ascii?Q?oOpB+kd7yxJkmRc0imcH0PY=2FYLosMYMLHt0cOkc?= =?us-ascii?Q?wegs?=
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Matt Wardle
	<matt@mattwardle.net>
X-Entity-ID: u001.OAl4HwJfzvoR6h5DRlrySA==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mattwardle.net,reject];
	R_DKIM_ALLOW(-0.20)[mattwardle.net:s=s1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mattwardle.net:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52506-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@mattwardle.net,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mattwardle.net:mid,mattwardle.net:dkim,mattwardle.net:email,checkpatch.pl:url]
X-Rspamd-Queue-Id: 7A84C118D8C
X-Rspamd-Action: no action

Fix checkpatch.pl errors:

ERROR: that open brace { should be on the previous line

Signed-off-by: Matt Wardle <matt@mattwardle.net>
---
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c |  3 +-
 .../isp/kernels/raw/raw_1.0/ia_css_raw.host.c |  3 +-
 .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |  6 +-
 .../isp/kernels/vf/vf_1.0/ia_css_vf.host.c    |  3 +-
 .../atomisp/pci/runtime/binary/src/binary.c   | 60 +++++++------------
 .../pci/runtime/isp_param/src/isp_param.c     |  6 +-
 drivers/staging/media/atomisp/pci/sh_css.c    |  6 +-
 7 files changed, 29 insertions(+), 58 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
index 4c85b5a62224..cf6c29155758 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
@@ -273,8 +273,7 @@ int store_dvs_6axis_config(const struct ia_css_dvs_6axis_config *dvs_6axis_confi
 					       binary,
 					       dvs_in_frame_info);
 
-	if (!me)
-	{
+	if (!me) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);
 		return -ENOMEM;
 	}
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
index 80fd64a8eb98..fb0e2a88cadb 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
@@ -23,8 +23,7 @@ static const struct ia_css_raw_configuration default_config = {
 /* MW: These areMIPI / ISYS properties, not camera function properties */
 static enum sh_stream_format css2isp_stream_format(enum atomisp_input_format from)
 {
-	switch (from)
-	{
+	switch (from) {
 	case ATOMISP_INPUT_FORMAT_YUV420_8_LEGACY:
 				return sh_stream_format_yuv420_legacy;
 	case ATOMISP_INPUT_FORMAT_YUV420_8:
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
index aaabb3388044..6f92709f87eb 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
@@ -176,13 +176,11 @@ int ia_css_get_dvs2_statistics(struct ia_css_dvs2_statistics *host_stats,
 	assert(isp_stats);
 
 	map = ia_css_isp_dvs_statistics_map_allocate(isp_stats, NULL);
-	if (map)
-	{
+	if (map) {
 		hmm_load(isp_stats->data_ptr, map->data_ptr, isp_stats->size);
 		ia_css_translate_dvs2_statistics(host_stats, map);
 		ia_css_isp_dvs_statistics_map_free(map);
-	} else
-	{
+	} else {
 		IA_CSS_ERROR("out of memory");
 		ret = -ENOMEM;
 	}
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index f8870f7e790d..152faab2b169 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -64,8 +64,7 @@ int sh_css_vf_downscale_log2(const struct ia_css_frame_info *out_info,
 	* test for the height since the vmem buffers only put restrictions on
 	* the width of a line, not on the number of lines in a frame.
 	*/
-	while (out_width >= vf_info->res.width)
-	{
+	while (out_width >= vf_info->res.width) {
 		ds_log2++;
 		out_width /= 2;
 	}
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index c7962549e999..39b37b557aff 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -477,8 +477,7 @@ int ia_css_binary_init_infos(void)
 	if (!all_binaries)
 		return -ENOMEM;
 
-	for (i = 0; i < num_of_isp_binaries; i++)
-	{
+	for (i = 0; i < num_of_isp_binaries; i++) {
 		int ret;
 		struct ia_css_binary_xinfo *binary = &all_binaries[i];
 		bool binary_found;
@@ -502,8 +501,7 @@ int ia_css_binary_uninit(void)
 	unsigned int i;
 	struct ia_css_binary_xinfo *b;
 
-	for (i = 0; i < IA_CSS_BINARY_NUM_MODES; i++)
-	{
+	for (i = 0; i < IA_CSS_BINARY_NUM_MODES; i++) {
 		for (b = binary_infos[i]; b; b = b->next) {
 			if (b->xmem_addr)
 				hmm_free(b->xmem_addr);
@@ -664,8 +662,7 @@ int ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 	assert(binary);
 
 	binary->info = xinfo;
-	if (!accelerator)
-	{
+	if (!accelerator) {
 		/* binary->css_params has been filled by accelerator itself. */
 		err = ia_css_isp_param_allocate_isp_parameters(
 		    &binary->mem_params, &binary->css_params,
@@ -673,15 +670,13 @@ int ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 		if (err)
 			return err;
 	}
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
-	{
+	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
 		if (out_info[i] && (out_info[i]->res.width != 0)) {
 			bin_out_info = out_info[i];
 			break;
 		}
 	}
-	if (in_info && bin_out_info)
-	{
+	if (in_info && bin_out_info) {
 		need_scaling = (in_info->res.width != bin_out_info->res.width) ||
 			       (in_info->res.height != bin_out_info->res.height);
 	}
@@ -712,8 +707,7 @@ int ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 	binary->internal_frame_info.res.height      = isp_internal_height;
 	binary->internal_frame_info.raw_bit_depth   = bits_per_pixel;
 
-	if (in_info)
-	{
+	if (in_info) {
 		binary->effective_in_frame_res.width = in_info->res.width;
 		binary->effective_in_frame_res.height = in_info->res.height;
 
@@ -741,15 +735,13 @@ int ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 		binary->in_frame_info.crop_info = in_info->crop_info;
 	}
 
-	if (online)
-	{
+	if (online) {
 		bits_per_pixel = ia_css_util_input_format_bpp(
 				     stream_format, two_ppc);
 	}
 	binary->in_frame_info.raw_bit_depth = bits_per_pixel;
 
-	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++)
-	{
+	for (i = 0; i < IA_CSS_BINARY_MAX_OUTPUT_PORTS; i++) {
 		if (out_info[i]) {
 			binary->out_frame_info[i].res.width     = out_info[i]->res.width;
 			binary->out_frame_info[i].res.height    = out_info[i]->res.height;
@@ -768,8 +760,7 @@ int ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 		}
 	}
 
-	if (vf_info && (vf_info->res.width != 0))
-	{
+	if (vf_info && (vf_info->res.width != 0)) {
 		err = ia_css_vf_configure(binary, bin_out_info,
 					  (struct ia_css_frame_info *)vf_info, &vf_log_ds);
 		if (err) {
@@ -787,8 +778,7 @@ int ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 	binary->input_format      = stream_format;
 
 	/* viewfinder output info */
-	if ((vf_info) && (vf_info->res.width != 0))
-	{
+	if ((vf_info) && (vf_info->res.width != 0)) {
 		unsigned int vf_out_vecs, vf_out_width, vf_out_height;
 
 		binary->vf_frame_info.format = vf_info->format;
@@ -820,23 +810,20 @@ int ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 			binary->vf_frame_info.padded_width = vf_out_width;
 			binary->vf_frame_info.res.height   = vf_out_height;
 		}
-	} else
-	{
+	} else {
 		binary->vf_frame_info.res.width    = 0;
 		binary->vf_frame_info.padded_width = 0;
 		binary->vf_frame_info.res.height   = 0;
 	}
 
-	if (info->enable.ca_gdc)
-	{
+	if (info->enable.ca_gdc) {
 		binary->morph_tbl_width =
 		    _ISP_MORPH_TABLE_WIDTH(isp_internal_width);
 		binary->morph_tbl_aligned_width  =
 		    _ISP_MORPH_TABLE_ALIGNED_WIDTH(isp_internal_width);
 		binary->morph_tbl_height =
 		    _ISP_MORPH_TABLE_HEIGHT(isp_internal_height);
-	} else
-	{
+	} else {
 		binary->morph_tbl_width  = 0;
 		binary->morph_tbl_aligned_width  = 0;
 		binary->morph_tbl_height = 0;
@@ -846,8 +833,7 @@ int ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 	sc_3a_dis_padded_width = binary->in_frame_info.padded_width;
 	sc_3a_dis_height = binary->in_frame_info.res.height;
 	if (bds_out_info && in_info &&
-	    bds_out_info->res.width != in_info->res.width)
-	{
+	    bds_out_info->res.width != in_info->res.width) {
 		/* TODO: Next, "internal_frame_info" should be derived from
 		 * bds_out. So this part will change once it is in place! */
 		sc_3a_dis_width = bds_out_info->res.width + info->pipeline.left_cropping;
@@ -857,18 +843,15 @@ int ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 
 	s3a_isp_width = _ISP_S3A_ELEMS_ISP_WIDTH(sc_3a_dis_padded_width,
 			info->pipeline.left_cropping);
-	if (info->s3a.fixed_s3a_deci_log)
-	{
+	if (info->s3a.fixed_s3a_deci_log) {
 		s3a_log_deci = info->s3a.fixed_s3a_deci_log;
-	} else
-	{
+	} else {
 		s3a_log_deci = binary_grid_deci_factor_log2(s3a_isp_width,
 			       sc_3a_dis_height);
 	}
 	binary->deci_factor_log2  = s3a_log_deci;
 
-	if (info->enable.s3a)
-	{
+	if (info->enable.s3a) {
 		binary->s3atbl_width  =
 		    _ISP_S3ATBL_WIDTH(sc_3a_dis_width,
 				      s3a_log_deci);
@@ -881,21 +864,18 @@ int ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 		binary->s3atbl_isp_height =
 		    _ISP_S3ATBL_ISP_HEIGHT(sc_3a_dis_height,
 					   s3a_log_deci);
-	} else
-	{
+	} else {
 		binary->s3atbl_width  = 0;
 		binary->s3atbl_height = 0;
 		binary->s3atbl_isp_width  = 0;
 		binary->s3atbl_isp_height = 0;
 	}
 
-	if (info->enable.sc)
-	{
+	if (info->enable.sc) {
 		binary->sctbl_width_per_color = _ISP_SCTBL_WIDTH_PER_COLOR(sc_3a_dis_padded_width, s3a_log_deci);
 		binary->sctbl_aligned_width_per_color = SH_CSS_MAX_SCTBL_ALIGNED_WIDTH_PER_COLOR;
 		binary->sctbl_height = _ISP_SCTBL_HEIGHT(sc_3a_dis_height, s3a_log_deci);
-	} else
-	{
+	} else {
 		binary->sctbl_width_per_color         = 0;
 		binary->sctbl_aligned_width_per_color = 0;
 		binary->sctbl_height                  = 0;
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index 354e5405fd60..1d20eb650757 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -101,8 +101,7 @@ int ia_css_isp_param_allocate_isp_parameters(struct ia_css_isp_param_host_segmen
 	unsigned int mem, pclass;
 
 	pclass = IA_CSS_PARAM_CLASS_PARAM;
-	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++) {
 		for (pclass = 0; pclass < IA_CSS_NUM_PARAM_CLASSES; pclass++) {
 			u32 size = 0;
 
@@ -176,8 +175,7 @@ int ia_css_isp_param_copy_isp_mem_if_to_ddr(struct ia_css_isp_param_css_segments
 {
 	unsigned int mem;
 
-	for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++) {
 		size_t       size	  = host->params[pclass][mem].size;
 		ia_css_ptr ddr_mem_ptr  = ddr->params[pclass][mem].address;
 		char	    *host_mem_ptr = host->params[pclass][mem].address;
diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 73bd87f43a8c..e7f2443696d1 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -2256,8 +2256,7 @@ alloc_continuous_frames(struct ia_css_pipe *pipe, bool init_time)
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "alloc_continuous_frames() IA_CSS_FRAME_FORMAT_RAW_PACKED\n");
 		ref_info.format = IA_CSS_FRAME_FORMAT_RAW_PACKED;
-	} else
-	{
+	} else {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "alloc_continuous_frames() IA_CSS_FRAME_FORMAT_RAW\n");
 		ref_info.format = IA_CSS_FRAME_FORMAT_RAW;
@@ -7862,8 +7861,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 
 	/* check if mipi size specified */
 	if (stream_config->mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
-		if (!IS_ISP2401 || !stream_config->online)
-		{
+		if (!IS_ISP2401 || !stream_config->online) {
 			unsigned int port = (unsigned int)stream_config->source.port.port;
 
 			if (port >= N_MIPI_PORT_ID) {
-- 
2.53.0


