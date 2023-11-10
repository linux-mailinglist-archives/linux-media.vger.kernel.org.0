Return-Path: <linux-media+bounces-37-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2965A7E7F03
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E917B21FD3
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D633C6A5;
	Fri, 10 Nov 2023 17:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2uFYgaT"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C323B7AF
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5E79250A4
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 01:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699609632; x=1731145632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5Ny0CzlI0T9Ji8/3jLUaDaKp5xeTnlgU01SPoEyelfQ=;
  b=n2uFYgaTzS8Q7eaWVbxSMiNmuOVTvsNuUtfmpG1tFaCYN0NHN5I1KAgJ
   LAQRc1+6xEX14DE47wwunmWsu0BSjgSyAT/iRJ32+Uyw1v55dm2LR4M9X
   hFuEfrIhMIajFWWS1SlV8g0+UycvSIqOw/mBtTXAPj1yfvLkru8pSZ0ZX
   u5chXkvSu/KiImBlJ9Ygwzh35+PnfDYw/eJWPgIK3w61URzTB0P58UtsT
   xeMuX1Z84sHIjjuiD/gt6na0q+MDVCUSdFYv5gFhZFQJIghRaTYHc5eXM
   31KDCUdAeWiV6qHWEx+Orujr5+e0/kUV7W+i5uGXcbL7z1eS66Ct+9LEs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="421253794"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="421253794"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:47:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="740114815"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="740114815"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 01:47:11 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4B2D8120381;
	Fri, 10 Nov 2023 11:47:08 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH 4/6] media: ccs: Generate V4L2 CCI compliant register definitions
Date: Fri, 10 Nov 2023 11:47:03 +0200
Message-Id: <20231110094705.1367083-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generate register definitions that are fit for use with V4L2 CCI.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../driver-api/media/drivers/ccs/mk-ccs-regs  | 61 +++++++++++++------
 1 file changed, 41 insertions(+), 20 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
index 2a4edc7e051a..5f5bb740ceda 100755
--- a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
+++ b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
@@ -85,9 +85,11 @@ for my $fh ($H, $LH) {
 sub bit_def($) {
 	my $bit = shift @_;
 
-	return "BIT($bit)" if defined $kernel;
-	return "(1U << $bit)" if $bit =~ /^[a-zA-Z0-9_]+$/;
-	return "(1U << ($bit))";
+	if (defined $kernel) {
+		return "BIT$bit" if $bit =~ /^\(.*\)$/;
+		return "BIT($bit)";
+	}
+	return "(1U << $bit)";
 }
 
 print $H <<EOF
@@ -97,23 +99,39 @@ print $H <<EOF
 EOF
   ;
 
-print $H "#include <linux/bits.h>\n\n" if defined $kernel;
-
 print $H <<EOF
-#define CCS_FL_BASE		16
+#include <linux/bits.h>
+
+#include <media/v4l2-cci.h>
+
 EOF
-  ;
+	if defined $kernel;
+
+print $H "#define CCS_FL_BASE		" .
+    (defined $kernel ? "CCI_REG_FLAG_PRIVATE_START" : 16) . "\n";
+
+my $flag = -1;
+
+sub flag_str() {
+	$flag++;
 
-print $H "#define CCS_FL_16BIT		" . bit_def("CCS_FL_BASE") . "\n";
-print $H "#define CCS_FL_32BIT		" . bit_def("CCS_FL_BASE + 1") . "\n";
-print $H "#define CCS_FL_FLOAT_IREAL	" . bit_def("CCS_FL_BASE + 2") . "\n";
-print $H "#define CCS_FL_IREAL		" . bit_def("CCS_FL_BASE + 3") . "\n";
+	return "CCS_FL_BASE" if !$flag;
+
+	return "(CCS_FL_BASE + $flag)";
+}
+
+if (! defined $kernel) {
+	print $H "#define CCS_FL_16BIT		" . bit_def(flag_str) . "\n";
+	print $H "#define CCS_FL_32BIT		" . bit_def(flag_str) . "\n";
+}
+print $H "#define CCS_FL_FLOAT_IREAL	" . bit_def(flag_str) . "\n";
+print $H "#define CCS_FL_IREAL		" . bit_def(flag_str) . "\n";
 
 print $H <<EOF
 #define CCS_R_ADDR(r)		((r) & 0xffff)
 
 EOF
-  ;
+    if ! defined $kernel;
 
 print $A <<EOF
 #include <stdint.h>
@@ -189,12 +207,12 @@ sub tabconv($) {
 	return (join "\n", @l) . "\n";
 }
 
-sub elem_size(@) {
+sub elem_bits(@) {
 	my @flags = @_;
 
-	return 2 if grep /^16$/, @flags;
-	return 4 if grep /^32$/, @flags;
-	return 1;
+	return 16 if grep /^16$/, @flags;
+	return 32 if grep /^32$/, @flags;
+	return 8;
 }
 
 sub arr_size($) {
@@ -369,15 +387,18 @@ while (<$R>) {
 	$name =~ s/[,\.-]/_/g;
 
 	my $flagstring = "";
-	my $size = elem_size(@flags);
-	$flagstring .= "| CCS_FL_16BIT " if $size eq "2";
-	$flagstring .= "| CCS_FL_32BIT " if $size eq "4";
+	my $bits = elem_bits(@flags);
+	if (! defined $kernel) {
+		$flagstring .= "| CCS_FL_16BIT " if $bits == 16;
+		$flagstring .= "| CCS_FL_32BIT " if $bits == 32;
+	}
 	$flagstring .= "| CCS_FL_FLOAT_IREAL " if grep /^float_ireal$/, @flags;
 	$flagstring .= "| CCS_FL_IREAL " if grep /^ireal$/, @flags;
 	$flagstring =~ s/^\| //;
 	$flagstring =~ s/ $//;
 	$flagstring = "($flagstring)" if $flagstring =~ /\|/;
 	my $base_addr = $addr;
+	$addr = "CCI_REG$bits($addr)" if defined $kernel;
 	$addr = "($addr | $flagstring)" if $flagstring ne "";
 
 	my $arglist = @$args ? "(" . (join ", ", @$args) . ")" : "";
@@ -392,7 +413,7 @@ while (<$R>) {
 		  argparams => {},
 		  args => $args,
 		  arglist => $arglist,
-		  elsize => $size,
+		  elsize => $bits / 8,
 		);
 
 	if (!@$args) {
-- 
2.39.2


