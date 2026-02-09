Return-Path: <linux-media+bounces-52412-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF27BH7wiWn4EQAAu9opvQ
	(envelope-from <linux-media+bounces-52412-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 15:34:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 657E1110755
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 15:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50F703069AD7
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 14:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40A537AA91;
	Mon,  9 Feb 2026 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b="IN0mr1D3"
X-Original-To: linux-media@vger.kernel.org
Received: from s.wfbtzhsw.outbound-mail.sendgrid.net (s.wfbtzhsw.outbound-mail.sendgrid.net [159.183.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB20C37B3F9
	for <linux-media@vger.kernel.org>; Mon,  9 Feb 2026 14:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.183.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647350; cv=none; b=gknkOWJG11IBgV7ydwavrwk3ttaxxNhu+RwbsEZwC2Gk9xuymPVVHFzSN18YPVNf0/XH1tFwdkhSQi+GYH344te2o8nM65uI9jQoka51aUgl7smxMhUBMFgRNhAtZhaxlsd/N8nTcYa8zFhs8edhHEVM9hGBkYp9nV9YY0H6Fyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647350; c=relaxed/simple;
	bh=rkVssAybYxLfGxftiwOR+k7yh0pKMxb88eOGdT9K9II=;
	h=From:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 To:Cc:Content-Type; b=Gj2iWlE2w2Aeaf+hG+ctpqas0/hJBJFJ8v/h06AcN0fmtpIL9Zpw82LyqxrTuFjCzLxHSAukUf8J28iKG0H2dpnfOk3PIqxQzBtmHkhurYMeKEIcQ2grWeFNDNF1oiQI2YY1vpJvPyLiMKVMbPTGG19RAo92sTQORtoskYRSs74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net; spf=pass smtp.mailfrom=em431.mattwardle.net; dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b=IN0mr1D3; arc=none smtp.client-ip=159.183.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em431.mattwardle.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mattwardle.net;
	h=from:subject:date:in-reply-to:references:mime-version:to:cc:
	content-transfer-encoding:content-type:cc:content-type:date:from:subject:to;
	s=s1; bh=BV+ZJSMbLj5dDEDHNDmgTuhTfzFIRNndYsdoinI3MN4=;
	b=IN0mr1D3eEJBbKrQ2r2JjFR06bv0TQowpSj5WBm+q8cURvMmui/hxdusjl3qP1/HaHOP
	R2Tce1fbzguwSh7WPC9BNdeU63Fn50ThuvJTIZ63eOcfp50ydWMaAd3sDcqwOZIDsqcnL7
	mmhmpLUkFTwc2QMpabbKH36bUqtaHc4kHP8CE+PuwjXAf/cN79pGVn/5DQCn2iRJRb0vYW
	C/yjC17WJG0JqX5W6St18SHVgW5UtmuaKFRgDTaioW+nTo3M9OTTfM0YAy3guaQo/qe1Hg
	x075axy/aX6UfSc1+W3dXEKllTnW9ie3bMomgtGw+gPRIth+V6I7+h2Vs3AgMm1A==
Received: by recvd-569467cd7-2thlx with SMTP id recvd-569467cd7-2thlx-1-6989EF33-18
	2026-02-09 14:29:07.47362297 +0000 UTC m=+111066.938075885
Received: from mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (unknown)
	by geopod-ismtpd-16 (SG) with ESMTP
	id FBQrihoITmC6w_YOznsxvA
	Mon, 09 Feb 2026 14:29:07.214 +0000 (UTC)
Authentication-Results: mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net; dmarc=fail (p=reject dis=none) header.from=mattwardle.net
Received: from thinkpad (unknown [161.142.117.49])
	by mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (Postfix) with ESMTPSA id 55DA441178;
	Mon,  9 Feb 2026 14:29:06 +0000 (UTC)
From: Matt Wardle <matt@mattwardle.net>
Subject: [PATCH 1/3] staging: media: atomisp: Fix braces on incorrect lines
Date: Mon, 09 Feb 2026 14:29:07 +0000 (UTC)
Message-ID: <20260209142820.650334-2-matt@mattwardle.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209142820.650334-1-matt@mattwardle.net>
References: <20260209142820.650334-1-matt@mattwardle.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SG-EID: 
 =?us-ascii?Q?u001=2EFlbIg1=2FBrpD1HWcEBlj1tgh=2F0VDwewqbkmeZ1SFD9tLmzlDepFYnLmfnO?=
 =?us-ascii?Q?moWHy7n5HdVZTdyWWeMojZeck4brflh3FU4nNXS?=
 =?us-ascii?Q?wxIqsa31bWDpBCjl5IrCvSiISVbI1FPoxQ6X=2FmW?=
 =?us-ascii?Q?XUlhD4uhbK2vR+N2zajei43x8WMuNmtNUelUk71?=
 =?us-ascii?Q?UdOvPYebuFvrdWvS6ZJzNZMsJjGmXqXF4WYNyVf?=
 =?us-ascii?Q?VUf9Rc0q6tUAN=2F3A5JkrIsJXRPYqOd1vt0qjaub?= =?us-ascii?Q?cxiQ?=
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
	TAGGED_FROM(0.00)[bounces-52412-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mattwardle.net:mid,mattwardle.net:dkim,mattwardle.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 657E1110755
X-Rspamd-Action: no action

Fix checkpatch.pl errors:

ERROR: open brace '{' following function definitions go on the next line
ERROR: that open brace { should be on the previous line

Signed-off-by: Matt Wardle <matt@mattwardle.net>
---
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c |  6 +-
 .../isp/kernels/raw/raw_1.0/ia_css_raw.host.c |  6 +-
 .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |  9 +--
 .../isp/kernels/vf/vf_1.0/ia_css_vf.host.c    |  9 ++-
 .../atomisp/pci/runtime/binary/src/binary.c   | 75 ++++++++-----------
 .../pci/runtime/isp_param/src/isp_param.c     | 12 +--
 drivers/staging/media/atomisp/pci/sh_css.c    |  6 +-
 7 files changed, 53 insertions(+), 70 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
index e9d6dd0bbfe2..8d37bcb034d1 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
@@ -263,7 +263,8 @@ store_dvs_6axis_config(
     const struct ia_css_dvs_6axis_config *dvs_6axis_config,
     const struct ia_css_binary *binary,
     const struct ia_css_frame_info *dvs_in_frame_info,
-    ia_css_ptr ddr_addr_y) {
+    ia_css_ptr ddr_addr_y)
+{
 	struct ia_css_host_data *me;
 
 	assert(dvs_6axis_config);
@@ -274,8 +275,7 @@ store_dvs_6axis_config(
 					       binary,
 					       dvs_in_frame_info);
 
-	if (!me)
-	{
+	if (!me) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);
 		return -ENOMEM;
 	}
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
index a00f8d049a33..987876b42e6d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
@@ -22,9 +22,9 @@ static const struct ia_css_raw_configuration default_config = {
 
 /* MW: These areMIPI / ISYS properties, not camera function properties */
 static enum sh_stream_format
-css2isp_stream_format(enum atomisp_input_format from) {
-	switch (from)
-	{
+css2isp_stream_format(enum atomisp_input_format from)
+{
+	switch (from) {
 	case ATOMISP_INPUT_FORMAT_YUV420_8_LEGACY:
 				return sh_stream_format_yuv420_legacy;
 	case ATOMISP_INPUT_FORMAT_YUV420_8:
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
index 027eae0ca69e..c30533723899 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
@@ -167,7 +167,8 @@ void ia_css_sdis2_clear_coefficients(
 int
 ia_css_get_dvs2_statistics(
     struct ia_css_dvs2_statistics          *host_stats,
-    const struct ia_css_isp_dvs_statistics *isp_stats) {
+    const struct ia_css_isp_dvs_statistics *isp_stats)
+{
 	struct ia_css_isp_dvs_statistics_map *map;
 	int ret = 0;
 
@@ -177,13 +178,11 @@ ia_css_get_dvs2_statistics(
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
index 3c675063c4a7..940b5767954c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -49,7 +49,8 @@ int
 sh_css_vf_downscale_log2(
     const struct ia_css_frame_info *out_info,
     const struct ia_css_frame_info *vf_info,
-    unsigned int *downscale_log2) {
+    unsigned int *downscale_log2)
+{
 	unsigned int ds_log2 = 0;
 	unsigned int out_width;
 
@@ -65,8 +66,7 @@ sh_css_vf_downscale_log2(
 	* test for the height since the vmem buffers only put restrictions on
 	* the width of a line, not on the number of lines in a frame.
 	*/
-	while (out_width >= vf_info->res.width)
-	{
+	while (out_width >= vf_info->res.width) {
 		ds_log2++;
 		out_width /= 2;
 	}
@@ -86,7 +86,8 @@ configure_kernel(
     const struct ia_css_frame_info *out_info,
     const struct ia_css_frame_info *vf_info,
     unsigned int *downscale_log2,
-    struct ia_css_vf_configuration *config) {
+    struct ia_css_vf_configuration *config)
+{
 	int err;
 	unsigned int vf_log_ds = 0;
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index af93ca96747c..315cce008d3c 100644
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
@@ -664,8 +667,7 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 	assert(binary);
 
 	binary->info = xinfo;
-	if (!accelerator)
-	{
+	if (!accelerator) {
 		/* binary->css_params has been filled by accelerator itself. */
 		err = ia_css_isp_param_allocate_isp_parameters(
 		    &binary->mem_params, &binary->css_params,
@@ -674,15 +676,13 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 			return err;
 		}
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
@@ -713,8 +713,7 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 	binary->internal_frame_info.res.height      = isp_internal_height;
 	binary->internal_frame_info.raw_bit_depth   = bits_per_pixel;
 
-	if (in_info)
-	{
+	if (in_info) {
 		binary->effective_in_frame_res.width = in_info->res.width;
 		binary->effective_in_frame_res.height = in_info->res.height;
 
@@ -742,15 +741,13 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
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
@@ -769,8 +766,7 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 		}
 	}
 
-	if (vf_info && (vf_info->res.width != 0))
-	{
+	if (vf_info && (vf_info->res.width != 0)) {
 		err = ia_css_vf_configure(binary, bin_out_info,
 					  (struct ia_css_frame_info *)vf_info, &vf_log_ds);
 		if (err) {
@@ -788,8 +784,7 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 	binary->input_format      = stream_format;
 
 	/* viewfinder output info */
-	if ((vf_info) && (vf_info->res.width != 0))
-	{
+	if ((vf_info) && (vf_info->res.width != 0)) {
 		unsigned int vf_out_vecs, vf_out_width, vf_out_height;
 
 		binary->vf_frame_info.format = vf_info->format;
@@ -821,23 +816,20 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
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
@@ -847,8 +839,7 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 	sc_3a_dis_padded_width = binary->in_frame_info.padded_width;
 	sc_3a_dis_height = binary->in_frame_info.res.height;
 	if (bds_out_info && in_info &&
-	    bds_out_info->res.width != in_info->res.width)
-	{
+	    bds_out_info->res.width != in_info->res.width) {
 		/* TODO: Next, "internal_frame_info" should be derived from
 		 * bds_out. So this part will change once it is in place! */
 		sc_3a_dis_width = bds_out_info->res.width + info->pipeline.left_cropping;
@@ -858,18 +849,15 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 
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
@@ -882,21 +870,18 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
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
index 251dd75a7613..f21797598cd5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -97,13 +97,13 @@ int
 ia_css_isp_param_allocate_isp_parameters(
     struct ia_css_isp_param_host_segments *mem_params,
     struct ia_css_isp_param_css_segments *css_params,
-    const struct ia_css_isp_param_isp_segments *mem_initializers) {
+    const struct ia_css_isp_param_isp_segments *mem_initializers)
+{
 	int err = 0;
 	unsigned int mem, pclass;
 
 	pclass = IA_CSS_PARAM_CLASS_PARAM;
-	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++) {
 		for (pclass = 0; pclass < IA_CSS_NUM_PARAM_CLASSES; pclass++) {
 			u32 size = 0;
 
@@ -175,11 +175,11 @@ int
 ia_css_isp_param_copy_isp_mem_if_to_ddr(
     struct ia_css_isp_param_css_segments *ddr,
     const struct ia_css_isp_param_host_segments *host,
-    enum ia_css_param_class pclass) {
+    enum ia_css_param_class pclass)
+{
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


