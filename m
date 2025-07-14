Return-Path: <linux-media+bounces-37629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF5EB0405E
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D8B67B09AB
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 13:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350022522BE;
	Mon, 14 Jul 2025 13:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="VeuCM+bD"
X-Original-To: linux-media@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E74205ABA;
	Mon, 14 Jul 2025 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500512; cv=none; b=eIoeLkBQtczHpwroGM05biEZjnp07gNcss85MZqy8x+ELRvhJIBAy4mKRIa7ijxQp1QsSUx1hY/OokvK1AhqKIbqIGH1Jtms4e1qKr8alKPks9VdvHqIUyDSKk6i8BtFSCHrdY5hP6l+efHMDej9oRngUKXlrpftkR4/jGLu2m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500512; c=relaxed/simple;
	bh=46KpK6LBeVGkPg/LZ7EN2RhfJQ51O/T2UeIdJHUYK1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r08zuvXag2mB1YTE2fXEDhlT7aVPfgaK/iYbLDkG5+VOgnBRCNoqMs/cePOoX5v1/2QZ8zZ+og7/pCqqo6ID4M7PcFGJ2unZ+emvP/UbidCJPrsPam1UPP++tmrwEQoXi0MdHs4a6/0SQ32pYGo0cvAudyzYm+GUdtKhFG5jLm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=VeuCM+bD; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7I9ULU5egYD6Yg6nTBUc/jDjpNReUJ4ytNTYeknpg9k=; b=VeuCM+bDA6y2gUuDVYJvfacPVO
	qmcm84ywz+Idb88sagb2Jaas7eqtC7eOSY2JYEs8xgc65DdAAwbTyQNy5fSm+lv3KlmTItd4/jMie
	DOI6rln/XGeLnJz1SIMI8Cd82SumVVU1MnzAUM7racd2VnqR2eZRTHwQUf7879EyxAGaRqzH2uPhc
	ycWTJmq3NZAenJPrguF/iPmSNNlfdRzN4MzMBudErJXdXeWoxIINNPF+WKAONS6SwdpEA1xw/pzjG
	iwRvdJC9uZ5b2sk2hWRvlT+Cbm1OutoWtNtor/FDJ2a26+fx12WzxlYVk0Lg9ippFLySVAUhFc53f
	fbVRJc+w==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <jmkim@debian.org>)
	id 1ubJRC-0016Jv-7C; Mon, 14 Jul 2025 13:41:46 +0000
From: Jongmin Kim <jmkim@debian.org>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Jongmin Kim <jmkim@debian.org>
Subject: [PATCH] staging: media: atomisp: fix open brace placement
Date: Mon, 14 Jul 2025 15:41:16 +0200
Message-ID: <20250714134119.67280-1-jmkim@debian.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: jmkim

Fix checkpatch errors "ERROR: open brace '{' following function definitions
go on the next line" in binary.c.

Signed-off-by: Jongmin Kim <jmkim@debian.org>

---
Hey, this is my first patch, I appreciate any feedback, thanks!
---
 .../media/atomisp/pci/runtime/binary/src/binary.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index af93ca96747c..01085a789180 100644
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
 
@@ -498,7 +501,8 @@ ia_css_binary_init_infos(void) {
 }
 
 int
-ia_css_binary_uninit(void) {
+ia_css_binary_uninit(void)
+{
 	unsigned int i;
 	struct ia_css_binary_xinfo *b;
 
@@ -637,7 +641,8 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 			struct ia_css_binary *binary,
 			struct ia_css_resolution *dvs_env,
 			int stream_config_left_padding,
-			bool accelerator) {
+			bool accelerator)
+{
 	const struct ia_css_binary_info *info = &xinfo->sp;
 	unsigned int dvs_env_width = 0,
 	dvs_env_height = 0,
-- 
2.50.0


