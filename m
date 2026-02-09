Return-Path: <linux-media+bounces-52367-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOgdF2BniWm68QQAu9opvQ
	(envelope-from <linux-media+bounces-52367-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 05:49:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FDA10B9B9
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 05:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2B323008760
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 04:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD2927C84E;
	Mon,  9 Feb 2026 04:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b="BhU1vqUl"
X-Original-To: linux-media@vger.kernel.org
Received: from s.wrqvtvvn.outbound-mail.sendgrid.net (s.wrqvtvvn.outbound-mail.sendgrid.net [149.72.120.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD091E4AF
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 04:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.72.120.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770612563; cv=none; b=QgEXdAgzBb0FTqerRHzysHUzOEoUiDlVd3/q/8PA0PW+YFe1ETR2XDY+MBaq3VNlYpdTtyL5K/RNTNLEEL82ZjxdTJvqRam2zVyOKPf8P2pZ2cMF1vMYHYGvElLyqjRvERiGK5Eg47HksQvGsf2wKBwx+OljelN21Ls1ntXJZxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770612563; c=relaxed/simple;
	bh=tQ4IcYO89nYHl9MYuBAeE4Me/UH6SZZz3YLa2WWxzek=;
	h=From:Subject:Date:Message-ID:MIME-Version:To:Cc:Content-Type; b=UcprgklHSjy1fCA/TP70KuSw8yhsj3jisCC+GV+oAeTi3HwFWSnp51Fe31HnxiZ37B32Buwg7+b3H6qvNnG7BLaSzb0Eg1vph1fkfbLwuy1aXNAo4ekfVoD2L9wRo2/0DzFPbbR7VcTGTY+elzwOPu7Wtpjer94WmCTgrn7lIdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net; spf=pass smtp.mailfrom=em431.mattwardle.net; dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b=BhU1vqUl; arc=none smtp.client-ip=149.72.120.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em431.mattwardle.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mattwardle.net;
	h=from:subject:date:mime-version:to:cc:content-transfer-encoding:
	content-type:cc:content-type:date:from:subject:to;
	s=s1; bh=Xma/xcBzrkz1+5LG/zaFGbaExZzf2O/0xfn6lxfHeB4=;
	b=BhU1vqUlLLeXcTs70zA7tfMIRFFMycqY4kgfvjXlrposp+3tJcjdDtMpJ6dfpGw/DAv4
	FGKhnsBtkCDSzalWQI1MYvPuNCRF+sflJn2lFzZEReDaC0SVjLLPVCTYZ0y/cZp8kZ6Irl
	7idsd9ltQChgxcdsP8oh5/Ltg6QpI9NG2c0hwFjsJ4dUIeJCcnfz8iRXP9UFXbegHDXOuo
	seEgVNDaZNLzkdtHxjr1G7NM/Dn1a7Bbd3qbh4iHWLDioY3NRTB0gC4NbQ8SW9z3B6hq/a
	IjH4hY6Q2U8OYUw9zk+gRV1tbp2bpzPZTt1LBmzPMC/cR1U15DZpl33QORQ1VajA==
Received: by recvd-86cdcc7789-qh9bl with SMTP id recvd-86cdcc7789-qh9bl-1-69896752-3
	2026-02-09 04:49:22.074808347 +0000 UTC m=+76380.999479478
Received: from mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (unknown)
	by geopod-ismtpd-8 (SG) with ESMTP
	id PlxVWy8RSXGTP3uxeiWvAQ
	Mon, 09 Feb 2026 04:49:21.652 +0000 (UTC)
Received: from thinkpad (unknown [161.142.117.49])
	by mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (Postfix) with ESMTPSA id F127240E35;
	Mon,  9 Feb 2026 04:49:19 +0000 (UTC)
From: Matt Wardle <matt@mattwardle.net>
Subject: [PATCH] media: atomisp: Fix brace style issues in binary.c
Date: Mon, 09 Feb 2026 04:49:22 +0000 (UTC)
Message-ID: <20260209044854.83299-1-matt@mattwardle.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SG-EID: 
 =?us-ascii?Q?u001=2EFlbIg1=2FBrpD1HWcEBlj1tgh=2F0VDwewqbkmeZ1SFD9tLmzlDepFYnLmfnO?=
 =?us-ascii?Q?moWHy7n5HdVZTdyWWeMojZeck4brZ9kBcqoFwbn?=
 =?us-ascii?Q?mJ6qwsEpj6qeUE+PRWe1HLFxiY8=2F6me9pC3DvrD?=
 =?us-ascii?Q?+QNoFYyODV4b6VXmfkS1CinKjLzb3mGQzifDcdh?=
 =?us-ascii?Q?YcLTL5+CbYf9N=2F+8hNGN8RtyAHne6qE+mCrUHUZ?=
 =?us-ascii?Q?d55jaK4Eln86THe6rwd3EZR34WCtXSmc+v9u8NO?= =?us-ascii?Q?q5uu?=
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
	TAGGED_FROM(0.00)[bounces-52367-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matt@mattwardle.net,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mattwardle.net:email,mattwardle.net:dkim,mattwardle.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: A9FDA10B9B9
X-Rspamd-Action: no action

Fix checkpatch.pl errors and warnings regarding braces on incorrect
lines and braces not required for single statement blocks

Signed-off-by: Matt Wardle <matt@mattwardle.net>
---
 .../atomisp/pci/runtime/binary/src/binary.c   | 78 ++++++++-----------
 1 file changed, 31 insertions(+), 47 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index af93ca96747c..78c0457b16b5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -350,7 +350,8 @@ ia_css_binary_dvs_stat_grid_info(
 int
 ia_css_binary_3a_grid_info(const struct ia_css_binary *binary,
 			   struct ia_css_grid_info *info,
-			   struct ia_css_pipe *pipe) {
+			   struct ia_css_pipe *pipe)
+{
 	struct ia_css_3a_grid_info *s3a_info;
 	int err = 0;
 
@@ -441,7 +442,8 @@ supports_bds_factor(u32 supported_factors,
 
 static int
 binary_init_info(struct ia_css_binary_xinfo *info, unsigned int i,
-		 bool *binary_found) {
+		 bool *binary_found)
+{
 	const unsigned char *blob = sh_css_blob_info[i].blob;
 	unsigned int size = sh_css_blob_info[i].header.blob.size;
 
@@ -465,7 +467,8 @@ binary_init_info(struct ia_css_binary_xinfo *info, unsigned int i,
  * be selected if no other primary matches.
  */
 int
-ia_css_binary_init_infos(void) {
+ia_css_binary_init_infos(void)
+{
 	unsigned int i;
 	unsigned int num_of_isp_binaries = sh_css_num_binaries - NUM_OF_SPS - NUM_OF_BLS;
 
@@ -477,8 +480,7 @@ ia_css_binary_init_infos(void) {
 	if (!all_binaries)
 		return -ENOMEM;
 
-	for (i = 0; i < num_of_isp_binaries; i++)
-	{
+	for (i = 0; i < num_of_isp_binaries; i++) {
 		int ret;
 		struct ia_css_binary_xinfo *binary = &all_binaries[i];
 		bool binary_found;
@@ -498,12 +500,12 @@ ia_css_binary_init_infos(void) {
 }
 
 int
-ia_css_binary_uninit(void) {
+ia_css_binary_uninit(void)
+{
 	unsigned int i;
 	struct ia_css_binary_xinfo *b;
 
-	for (i = 0; i < IA_CSS_BINARY_NUM_MODES; i++)
-	{
+	for (i = 0; i < IA_CSS_BINARY_NUM_MODES; i++) {
 		for (b = binary_infos[i]; b; b = b->next) {
 			if (b->xmem_addr)
 				hmm_free(b->xmem_addr);
@@ -637,7 +639,8 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 			struct ia_css_binary *binary,
 			struct ia_css_resolution *dvs_env,
 			int stream_config_left_padding,
-			bool accelerator) {
+			bool accelerator)
+{
 	const struct ia_css_binary_info *info = &xinfo->sp;
 	unsigned int dvs_env_width = 0,
 	dvs_env_height = 0,
@@ -664,25 +667,21 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 	assert(binary);
 
 	binary->info = xinfo;
-	if (!accelerator)
-	{
+	if (!accelerator) {
 		/* binary->css_params has been filled by accelerator itself. */
 		err = ia_css_isp_param_allocate_isp_parameters(
 		    &binary->mem_params, &binary->css_params,
 		    &info->mem_initializers);
-		if (err) {
+		if (err)
 			return err;
-		}
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
@@ -713,8 +712,7 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 	binary->internal_frame_info.res.height      = isp_internal_height;
 	binary->internal_frame_info.raw_bit_depth   = bits_per_pixel;
 
-	if (in_info)
-	{
+	if (in_info) {
 		binary->effective_in_frame_res.width = in_info->res.width;
 		binary->effective_in_frame_res.height = in_info->res.height;
 
@@ -742,15 +740,13 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
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
@@ -769,8 +765,7 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 		}
 	}
 
-	if (vf_info && (vf_info->res.width != 0))
-	{
+	if (vf_info && (vf_info->res.width != 0)) {
 		err = ia_css_vf_configure(binary, bin_out_info,
 					  (struct ia_css_frame_info *)vf_info, &vf_log_ds);
 		if (err) {
@@ -788,8 +783,7 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 	binary->input_format      = stream_format;
 
 	/* viewfinder output info */
-	if ((vf_info) && (vf_info->res.width != 0))
-	{
+	if ((vf_info) && (vf_info->res.width != 0)) {
 		unsigned int vf_out_vecs, vf_out_width, vf_out_height;
 
 		binary->vf_frame_info.format = vf_info->format;
@@ -821,23 +815,20 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
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
@@ -847,8 +838,7 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 	sc_3a_dis_padded_width = binary->in_frame_info.padded_width;
 	sc_3a_dis_height = binary->in_frame_info.res.height;
 	if (bds_out_info && in_info &&
-	    bds_out_info->res.width != in_info->res.width)
-	{
+	    bds_out_info->res.width != in_info->res.width) {
 		/* TODO: Next, "internal_frame_info" should be derived from
 		 * bds_out. So this part will change once it is in place! */
 		sc_3a_dis_width = bds_out_info->res.width + info->pipeline.left_cropping;
@@ -858,18 +848,15 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 
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
@@ -882,21 +869,18 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
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
-- 
2.53.0


