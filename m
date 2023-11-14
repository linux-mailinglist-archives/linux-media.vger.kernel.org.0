Return-Path: <linux-media+bounces-323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A4F7EACF8
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 10:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2724A1C2089A
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 09:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD39182CB;
	Tue, 14 Nov 2023 09:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbuM/jeQ"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D415168D0
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 09:25:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F7C136
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 01:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699953918; x=1731489918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DwXcVJYZlatI7OnxCDpCSgfB4PFPDOs+YojIFba/Vf0=;
  b=AbuM/jeQ0DqiXkx6U8aVaAzGaPR3obdauuZvsD6Vuvh/aTFl+YWaWoTP
   Hg+r5a8OZ6Sw8P2Sqa9Ay2GWRLZ6lkpV8fNLmVuQCzZ+LzqlG15dg/XaS
   3BRT4eO+B/n39VhIBtcbfg+ngCUMDh+BAysuP/xIYKqBJR9my8GY0kUut
   EGPzQazXiaeqyaYxiqrLzYw3d9N+8APYeksKqkyeLABAieTK2dbiX6eFG
   GiT2fHDWUv8f9IzASoDjdYLWP0UMcBiLzM3wxcacFH7K6mncXfX/w/ml5
   b/9ROO3fr6GtKseY0/qINrpnktM+5OiGXJrh0MFuLyfHrpLXHLanj8ozl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387781692"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="387781692"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 01:25:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="938015858"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="938015858"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 01:25:16 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 094FA11FAC0;
	Tue, 14 Nov 2023 11:25:13 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH v4 4/6] media: ccs: Generate V4L2 CCI compliant register definitions
Date: Tue, 14 Nov 2023 11:25:08 +0200
Message-Id: <20231114092510.1443545-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231114092510.1443545-1-sakari.ailus@linux.intel.com>
References: <20231114092510.1443545-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generate register definitions that are fit for use with V4L2 CCI.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../driver-api/media/drivers/ccs/mk-ccs-regs  | 104 +++++++++++++-----
 1 file changed, 75 insertions(+), 29 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
index 2a4edc7e051a..3d3152b45821 100755
--- a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
+++ b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
@@ -82,14 +82,6 @@ for my $fh ($H, $LH) {
 	print $fh "/* $license */\n$copyright$note\n";
 }
 
-sub bit_def($) {
-	my $bit = shift @_;
-
-	return "BIT($bit)" if defined $kernel;
-	return "(1U << $bit)" if $bit =~ /^[a-zA-Z0-9_]+$/;
-	return "(1U << ($bit))";
-}
-
 print $H <<EOF
 #ifndef __${uc_header}__
 #define __${uc_header}__
@@ -97,23 +89,63 @@ print $H <<EOF
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
+    (defined $kernel ? "CCI_REG_PRIVATE_SHIFT" : 16) . "\n";
+
+my $flag = -1;
+my $all_flags;
+
+sub bit_def($) {
+	my $bit = shift @_;
+
+	if (defined $kernel) {
+		return "BIT$bit" if $bit =~ /^\(.*\)$/;
+		return "BIT($bit)";
+	}
+	return "(1U << $bit)";
+}
+
+sub flag_str($$) {
+	my ($flag, $check) = @_;
 
-print $H "#define CCS_FL_16BIT		" . bit_def("CCS_FL_BASE") . "\n";
-print $H "#define CCS_FL_32BIT		" . bit_def("CCS_FL_BASE + 1") . "\n";
-print $H "#define CCS_FL_FLOAT_IREAL	" . bit_def("CCS_FL_BASE + 2") . "\n";
-print $H "#define CCS_FL_IREAL		" . bit_def("CCS_FL_BASE + 3") . "\n";
+	$$flag++;
+
+	my $flag_str = !$$flag ? "CCS_FL_BASE" : "(CCS_FL_BASE + $$flag)";
+
+	$flag_str = bit_def($flag_str);
+
+	$$check .= " | " if defined $$check;
+
+	$$check .= $flag_str;
+
+	return $flag_str;
+}
+
+if (! defined $kernel) {
+	print $H "#define CCS_FL_16BIT		" . flag_str(\$flag, \$all_flags) . "\n";
+	print $H "#define CCS_FL_32BIT		" . flag_str(\$flag, \$all_flags) . "\n";
+}
+
+print $H "#define CCS_FL_FLOAT_IREAL	" . flag_str(\$flag, \$all_flags) . "\n";
+print $H "#define CCS_FL_IREAL		" . flag_str(\$flag, \$all_flags) . "\n";
+print $H "#define CCS_BUILD_BUG \\
+	BUILD_BUG_ON(~CCI_REG_PRIVATE_MASK & ($all_flags))\n"
+    if defined $kernel;
 
 print $H <<EOF
+
 #define CCS_R_ADDR(r)		((r) & 0xffff)
 
 EOF
-  ;
+    if ! defined $kernel;
 
 print $A <<EOF
 #include <stdint.h>
@@ -189,12 +221,12 @@ sub tabconv($) {
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
@@ -296,9 +328,13 @@ while (<$R>) {
 
 			next if $#{$this{args}} + 1 != scalar keys %{$this{argparams}};
 
-			my $reg_formula = "($this{addr}";
+			my $reg_formula = "$this{addr}";
 			my $lim_formula;
 
+			chop $reg_formula;
+
+			$reg_formula = "(" . $reg_formula if $this{flagstring} ne "";
+
 			foreach my $arg (@{$this{args}}) {
 				my $d = $h->{$arg}->{discontig};
 				my $times = $h->{$arg}->{elsize} != 1 ?
@@ -315,11 +351,13 @@ while (<$R>) {
 				$lim_formula .= (defined $lim_formula ? " + " : "") . "($arg)$times";
 			}
 
-			$reg_formula .= ")\n";
+			$reg_formula .= ")";
 			$lim_formula =~ s/^\(([a-z0-9]+)\)$/$1/i;
 
 			print $H tabconv sprintf("#define %-62s %s", "CCS_R_" . (uc $this{name}) .
-			  $this{arglist}, $reg_formula);
+						 $this{arglist}, $reg_formula .
+						 (($this{flagstring} eq "") ? "" :
+						  " | " . $this{flagstring} . ")") . "\n");
 
 			print $H tabconv $hdr_data;
 			undef $hdr_data;
@@ -369,16 +407,23 @@ while (<$R>) {
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
-	$addr = "($addr | $flagstring)" if $flagstring ne "";
+	$addr = "CCI_REG$bits($addr)" if defined $kernel;
+
+	if ($flagstring ne "" && !@$args) {
+		$addr = "($addr | $flagstring)";
+		$flagstring = "";
+	}
 
 	my $arglist = @$args ? "(" . (join ", ", @$args) . ")" : "";
 	$hdr_data .= sprintf "#define %-62s %s\n", "CCS_R_" . (uc $name), $addr
@@ -388,11 +433,12 @@ while (<$R>) {
 
 	%this = ( name => $name,
 		  addr => $addr,
+		  flagstring => $flagstring,
 		  base_addr => $base_addr,
 		  argparams => {},
 		  args => $args,
 		  arglist => $arglist,
-		  elsize => $size,
+		  elsize => $bits / 8,
 		);
 
 	if (!@$args) {
-- 
2.39.2


