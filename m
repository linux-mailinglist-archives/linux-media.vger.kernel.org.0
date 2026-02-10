Return-Path: <linux-media+bounces-52505-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD4iO3D5imlBPAAAu9opvQ
	(envelope-from <linux-media+bounces-52505-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:25:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CEE118D7E
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 10:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F52B30601B7
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 09:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393F4340DB9;
	Tue, 10 Feb 2026 09:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b="RC/gdnGS"
X-Original-To: linux-media@vger.kernel.org
Received: from s.wrqvtbkv.outbound-mail.sendgrid.net (s.wrqvtbkv.outbound-mail.sendgrid.net [149.72.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC05340A49
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 09:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.72.123.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715444; cv=none; b=Wdiwx+lv1Do/6K4q+EZtQYnOAOTpY0uUnTpSZeAZB7vKf8ZaXnY5J4m7qFqBjr5feSyGktKf4SISGmDaPGuHq1P5zW122GLlD/FE3fzo/I0KTxd4sOTGq0Zx2hduKVL2SObQOVBYMMf+NTwWKbNMYcbG3E+D8jAdzL/4wo2u9ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715444; c=relaxed/simple;
	bh=9jJs7MmJoKsYj3XlZrD6IjmxfM3I0wNi4KUdZUQ/z0w=;
	h=From:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 To:Cc:Content-Type; b=i7pWh3EloeI/lOyq0egt7ckcvumSK6o6wagNeKVe1aGeCM6WuwmD+uNQTkDgOS6LQiPaiKXwwWd3J/aZn95UiR4grenV0muTpSGQzBEr9gGuexdU0btYd/g5+fVMJlV+Oln/mr/AKt2d9ZpRGtMTnOKtqr/dIeL5AadJetT/GUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net; spf=pass smtp.mailfrom=em431.mattwardle.net; dkim=pass (2048-bit key) header.d=mattwardle.net header.i=@mattwardle.net header.b=RC/gdnGS; arc=none smtp.client-ip=149.72.123.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mattwardle.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em431.mattwardle.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mattwardle.net;
	h=from:subject:date:in-reply-to:references:mime-version:to:cc:
	content-transfer-encoding:content-type:cc:content-type:date:from:subject:to;
	s=s1; bh=dcfTklgjaCy1rPUq2cimFzYnzz4hXIpUGtmQWpURVCM=;
	b=RC/gdnGSpA/05ZE2HfkUBNzc3GfZXA0ykVegS6mpfVt//+p9E8fszP2Pq+pXgNiRv9cv
	WWLiKonqUktfNWT0uyFv0A06R3KrJX2SZ7d5D3m2ZPnBRwjRy0pCfKD1laCXTxsODQiJUA
	zEq6LMlG0QWanbJcvbJMoVP/N7PbX4ueNI5eKV7vQ09Duq8tlPNoZfTgQvrq4SEAillXda
	wzURGYKhNHTmJi+OhpuVVEADl1xqy7mvmKz3yg5v7F1E7U6KtoLbxKu1zxC2YbumZTE4sd
	UzzIMOeJwfBE9IWCw0pmby6/zrIAjRvBjHLBOY1TzbnOinwau68bSF9/gW/fByiQ==
Received: by recvd-5fb7fdbd94-cwpcz with SMTP id recvd-5fb7fdbd94-cwpcz-1-698AF932-1
	2026-02-10 09:24:02.014661469 +0000 UTC m=+55669.421760190
Received: from mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (unknown)
	by geopod-ismtpd-9 (SG) with ESMTP
	id Hm-93m4YR7qK3Sh1Thencg
	Tue, 10 Feb 2026 09:24:01.896 +0000 (UTC)
Authentication-Results: mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net; dmarc=fail (p=reject dis=none) header.from=mattwardle.net
Received: from thinkpad (unknown [161.142.117.49])
	by mail.3n0xdopx5uce3ivigaxioahche.ix.internal.cloudapp.net (Postfix) with ESMTPSA id A8D9040E37;
	Tue, 10 Feb 2026 09:24:01 +0000 (UTC)
From: Matt Wardle <matt@mattwardle.net>
Subject: [PATCH 2/3] staging: media: atomisp: Fix function indentation and
 braces
Date: Tue, 10 Feb 2026 09:24:02 +0000 (UTC)
Message-ID: <20260210092243.294732-3-matt@mattwardle.net>
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
 =?us-ascii?Q?moWHy7n5HdVZTdyWWeMojZeck4braJp6ggXS5Hg?=
 =?us-ascii?Q?cJ0Tx4HbZa5NjIBJq7+IQTJAc9yh0Nsf2VPaIe1?=
 =?us-ascii?Q?fp9P9VSCOImMpkgnLg5wvdwyIjeJThJu2xvOnYJ?=
 =?us-ascii?Q?2=2FZpdIb32KgpzDZoKD7SnsxP=2FQ7jYZhw63imEpD?=
 =?us-ascii?Q?TlVDJTFodeptRARK4=2FUw5RUjjBU7Ac92kIH=2FW1a?=
 =?us-ascii?Q?YHS5?=
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
	TAGGED_FROM(0.00)[bounces-52505-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 47CEE118D7E
X-Rspamd-Action: no action

Fix parameter indentation for functions and move opening braces onto new
line. Fix checkpatch.pl errors:

ERROR: open brace '{' following function definitions go on the next line

Signed-off-by: Matt Wardle <matt@mattwardle.net>
---
 .../isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c | 11 ++---
 .../isp/kernels/raw/raw_1.0/ia_css_raw.host.c |  4 +-
 .../kernels/sdis/sdis_2/ia_css_sdis2.host.c   |  7 ++-
 .../isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 22 ++++-----
 .../atomisp/pci/runtime/binary/src/binary.c   | 48 +++++++++----------
 .../pci/runtime/isp_param/src/isp_param.c     | 18 ++++---
 6 files changed, 52 insertions(+), 58 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
index e9d6dd0bbfe2..4c85b5a62224 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
@@ -258,12 +258,11 @@ convert_allocate_dvs_6axis_config(
 	return me;
 }
 
-int
-store_dvs_6axis_config(
-    const struct ia_css_dvs_6axis_config *dvs_6axis_config,
-    const struct ia_css_binary *binary,
-    const struct ia_css_frame_info *dvs_in_frame_info,
-    ia_css_ptr ddr_addr_y) {
+int store_dvs_6axis_config(const struct ia_css_dvs_6axis_config *dvs_6axis_config,
+			   const struct ia_css_binary *binary,
+			   const struct ia_css_frame_info *dvs_in_frame_info,
+			   ia_css_ptr ddr_addr_y)
+{
 	struct ia_css_host_data *me;
 
 	assert(dvs_6axis_config);
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
index a00f8d049a33..80fd64a8eb98 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/raw/raw_1.0/ia_css_raw.host.c
@@ -21,8 +21,8 @@ static const struct ia_css_raw_configuration default_config = {
 };
 
 /* MW: These areMIPI / ISYS properties, not camera function properties */
-static enum sh_stream_format
-css2isp_stream_format(enum atomisp_input_format from) {
+static enum sh_stream_format css2isp_stream_format(enum atomisp_input_format from)
+{
 	switch (from)
 	{
 	case ATOMISP_INPUT_FORMAT_YUV420_8_LEGACY:
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
index 027eae0ca69e..aaabb3388044 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2.host.c
@@ -164,10 +164,9 @@ void ia_css_sdis2_clear_coefficients(
 	dvs2_coefs->ver_coefs.even_imag = NULL;
 }
 
-int
-ia_css_get_dvs2_statistics(
-    struct ia_css_dvs2_statistics          *host_stats,
-    const struct ia_css_isp_dvs_statistics *isp_stats) {
+int ia_css_get_dvs2_statistics(struct ia_css_dvs2_statistics *host_stats,
+			       const struct ia_css_isp_dvs_statistics *isp_stats)
+{
 	struct ia_css_isp_dvs_statistics_map *map;
 	int ret = 0;
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
index 3c675063c4a7..f8870f7e790d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
@@ -45,11 +45,10 @@ int ia_css_vf_config(struct sh_css_isp_vf_isp_config      *to,
  * to the requested viewfinder resolution on the upper side. The output cannot
  * be smaller than the requested viewfinder resolution.
  */
-int
-sh_css_vf_downscale_log2(
-    const struct ia_css_frame_info *out_info,
-    const struct ia_css_frame_info *vf_info,
-    unsigned int *downscale_log2) {
+int sh_css_vf_downscale_log2(const struct ia_css_frame_info *out_info,
+			     const struct ia_css_frame_info *vf_info,
+			     unsigned int *downscale_log2)
+{
 	unsigned int ds_log2 = 0;
 	unsigned int out_width;
 
@@ -80,13 +79,12 @@ sh_css_vf_downscale_log2(
 	return 0;
 }
 
-static int
-configure_kernel(
-    const struct ia_css_binary_info *info,
-    const struct ia_css_frame_info *out_info,
-    const struct ia_css_frame_info *vf_info,
-    unsigned int *downscale_log2,
-    struct ia_css_vf_configuration *config) {
+static int configure_kernel(const struct ia_css_binary_info *info,
+			    const struct ia_css_frame_info *out_info,
+			    const struct ia_css_frame_info *vf_info,
+			    unsigned int *downscale_log2,
+			    struct ia_css_vf_configuration *config)
+{
 	int err;
 	unsigned int vf_log_ds = 0;
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index 60ae7bf5512b..c7962549e999 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -347,10 +347,10 @@ ia_css_binary_dvs_stat_grid_info(
 	return;
 }
 
-int
-ia_css_binary_3a_grid_info(const struct ia_css_binary *binary,
-			   struct ia_css_grid_info *info,
-			   struct ia_css_pipe *pipe) {
+int ia_css_binary_3a_grid_info(const struct ia_css_binary *binary,
+			       struct ia_css_grid_info *info,
+			       struct ia_css_pipe *pipe)
+{
 	struct ia_css_3a_grid_info *s3a_info;
 	int err = 0;
 
@@ -439,9 +439,9 @@ supports_bds_factor(u32 supported_factors,
 	return ((supported_factors & PACK_BDS_FACTOR(bds_factor)) != 0);
 }
 
-static int
-binary_init_info(struct ia_css_binary_xinfo *info, unsigned int i,
-		 bool *binary_found) {
+static int binary_init_info(struct ia_css_binary_xinfo *info, unsigned int i,
+			    bool *binary_found)
+{
 	const unsigned char *blob = sh_css_blob_info[i].blob;
 	unsigned int size = sh_css_blob_info[i].header.blob.size;
 
@@ -464,8 +464,8 @@ binary_init_info(struct ia_css_binary_xinfo *info, unsigned int i,
 /* When binaries are put at the beginning, they will only
  * be selected if no other primary matches.
  */
-int
-ia_css_binary_init_infos(void) {
+int ia_css_binary_init_infos(void)
+{
 	unsigned int i;
 	unsigned int num_of_isp_binaries = sh_css_num_binaries - NUM_OF_SPS - NUM_OF_BLS;
 
@@ -497,8 +497,8 @@ ia_css_binary_init_infos(void) {
 	return 0;
 }
 
-int
-ia_css_binary_uninit(void) {
+int ia_css_binary_uninit(void)
+{
 	unsigned int i;
 	struct ia_css_binary_xinfo *b;
 
@@ -625,19 +625,19 @@ binary_in_frame_padded_width(int in_frame_width,
 	return rval;
 }
 
-int
-ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
-			bool online,
-			bool two_ppc,
-			enum atomisp_input_format stream_format,
-			const struct ia_css_frame_info *in_info, /* can be NULL */
-			const struct ia_css_frame_info *bds_out_info, /* can be NULL */
-			const struct ia_css_frame_info *out_info[], /* can be NULL */
-			const struct ia_css_frame_info *vf_info, /* can be NULL */
-			struct ia_css_binary *binary,
-			struct ia_css_resolution *dvs_env,
-			int stream_config_left_padding,
-			bool accelerator) {
+int ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
+			    bool online,
+			    bool two_ppc,
+			    enum atomisp_input_format stream_format,
+			    const struct ia_css_frame_info *in_info, /* can be NULL */
+			    const struct ia_css_frame_info *bds_out_info, /* can be NULL */
+			    const struct ia_css_frame_info *out_info[], /* can be NULL */
+			    const struct ia_css_frame_info *vf_info, /* can be NULL */
+			    struct ia_css_binary *binary,
+			    struct ia_css_resolution *dvs_env,
+			    int stream_config_left_padding,
+			    bool accelerator)
+{
 	const struct ia_css_binary_info *info = &xinfo->sp;
 	unsigned int dvs_env_width = 0,
 	dvs_env_height = 0,
diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index 251dd75a7613..354e5405fd60 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -93,11 +93,10 @@ ia_css_init_memory_interface(
 	}
 }
 
-int
-ia_css_isp_param_allocate_isp_parameters(
-    struct ia_css_isp_param_host_segments *mem_params,
-    struct ia_css_isp_param_css_segments *css_params,
-    const struct ia_css_isp_param_isp_segments *mem_initializers) {
+int ia_css_isp_param_allocate_isp_parameters(struct ia_css_isp_param_host_segments *mem_params,
+					     struct ia_css_isp_param_css_segments *css_params,
+					     const struct ia_css_isp_param_isp_segments *mem_initializers)
+{
 	int err = 0;
 	unsigned int mem, pclass;
 
@@ -171,11 +170,10 @@ ia_css_isp_param_load_fw_params(
 	}
 }
 
-int
-ia_css_isp_param_copy_isp_mem_if_to_ddr(
-    struct ia_css_isp_param_css_segments *ddr,
-    const struct ia_css_isp_param_host_segments *host,
-    enum ia_css_param_class pclass) {
+int ia_css_isp_param_copy_isp_mem_if_to_ddr(struct ia_css_isp_param_css_segments *ddr,
+					    const struct ia_css_isp_param_host_segments *host,
+					    enum ia_css_param_class pclass)
+{
 	unsigned int mem;
 
 	for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++)
-- 
2.53.0


