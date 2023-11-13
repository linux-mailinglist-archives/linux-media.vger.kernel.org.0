Return-Path: <linux-media+bounces-242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD297E9D8D
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D936B209D6
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698F720B29;
	Mon, 13 Nov 2023 13:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YH9YFfT/"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABAF20B02
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 13:45:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778EB1A6
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 05:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699883106; x=1731419106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C+vIdoVSa6nEVbVe1c/r3C3xSwgC+SuPq94fBqODX3M=;
  b=YH9YFfT/XQvtGsqrvjFgk71nvoePclSe/KnvrA09ky7MaDcv4uY3HcDW
   E4oAKpQTY5B3D8ForIgO1EuA4p2YahFCs3bnpqlMRrTNC8GPXi6FoXZxn
   O8UB7tpsFEFo8PSt36cEO66AlPSR3pJpNKvvIkYwGHOrdZu4ouqSNWlod
   McvyyQD44UDRuAewcehBhnd2h7xTeNy4B2sk6ZjlJ3dBbMoey14ehwPBK
   +C3Ri07Lc4tTSb+bhLJ+1Q6F8z0pK8P3nsNomuCFcN31xaTJlGeGtHddn
   w6o2mzFax70S8GdpziJGtBAbeIznFpmW3AycAvNDL+63gCGskdVU66wLT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="421531270"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="421531270"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:45:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="793440937"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="793440937"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 05:45:04 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9B346120DDF;
	Mon, 13 Nov 2023 15:45:01 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH v2 4/6] media: ccs: Generate V4L2 CCI compliant register definitions
Date: Mon, 13 Nov 2023 15:44:56 +0200
Message-Id: <20231113134458.1423754-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231113134458.1423754-1-sakari.ailus@linux.intel.com>
References: <20231113134458.1423754-1-sakari.ailus@linux.intel.com>
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
index 2a4edc7e051a..01252ee6062b 100755
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
+print $H "#define CCS_BUILD_BUG \
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


