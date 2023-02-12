Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B18A3693572
	for <lists+linux-media@lfdr.de>; Sun, 12 Feb 2023 01:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjBLAvq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 19:51:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjBLAvp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 19:51:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A6E17CFD
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 16:51:42 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7DCFD01;
        Sun, 12 Feb 2023 01:51:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676163101;
        bh=FCQQkI8QwDPOF/fgyhp4/xaKXorK5Q2STBKsGBpmJjE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M+wtCKIaXvPLXOzNkEorOW4wCxqInV6eJLTaek2+7LdXY9W/hL526P1zZmQaphGkw
         LfvVEpYG6x2rIIStv3C2OAyaThc3roaMdXqJ8EIbmEh7qxPhZYA8pvZHFTPyv+RIq2
         PXJ2Gj04TFi/9+EU9rtv8NBTbEok9B64avHshsJw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@collabora.com, gjasny@googlemail.com, hverkuil@xs4all.nl,
        kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        nicolas@ndufresne.ca, p.zabel@pengutronix.de, rosenp@gmail.com,
        sakari.ailus@iki.fi, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [v4l-utils] [PATCH v8 1/6] utils: Allow choosing v4l2-tracer-gen.pl output
Date:   Sun, 12 Feb 2023 02:51:32 +0200
Message-Id: <20230212005137.12025-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212005137.12025-1-laurent.pinchart@ideasonboard.com>
References: <20230212005137.12025-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

In v4l2-tracer-gen.pl, add support for setting the output directory for
the generated files and choosing which ones to generate (common, trace or
retrace). The default is to generate them all in the current directory,
i.e. what the script used to do.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
[Append a '/' automatically between $outdir and $fname]
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 utils/v4l2-tracer/v4l2-tracer-gen.pl | 36 ++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
index fe648182ac34..f7454e7f0bab 100755
--- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -2,6 +2,16 @@
 # SPDX-License-Identifier: GPL-2.0-only */
 # Copyright 2022 Collabora Ltd.
 
+my $outdir = ".";
+my %outtype = ( "common" => 1, "trace" => 1, "retrace" => 1 );
+
+while ($ARGV[0] =~ /^-/) {
+	my $arg = shift @ARGV;
+
+	$outdir = shift @ARGV if $arg eq "-o";
+	%outtype = (shift @ARGV => 1) if $arg eq '-t';
+}
+
 sub convert_type_to_json_type {
 	my $type = shift;
 	if ($type eq __u8 || $type eq char || $type eq __u16 || $type eq __s8 || $type eq __s16 || $type eq __s32 || $type eq 'int') {
@@ -696,29 +706,45 @@ sub struct_gen_ctrl {
 	printf $fh_retrace_cpp "}\n\n";
 }
 
-open($fh_trace_cpp, '>', 'trace-gen.cpp') or die "Could not open trace-gen.cpp for writing";
+sub do_open($$) {
+	my ($type, $fname) = @_;
+	my $fh;
+
+	if (defined $outtype{$type}) {
+		$fname = "$outdir/$fname";
+	} else {
+		$fname = "/dev/null";
+	}
+
+	open($fh, "> $fname") or die "Could not open $fname for writing";
+
+	return $fh;
+}
+
+
+$fh_trace_cpp = do_open("trace", "trace-gen.cpp");
 printf $fh_trace_cpp "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n";
 printf $fh_trace_cpp " *\n * AUTOMATICALLY GENERATED BY \'%s\' DO NOT EDIT\n */\n\n", __FILE__;
 printf $fh_trace_cpp "#include \"v4l2-tracer-common.h\"\n\n";
 
-open($fh_trace_h, '>', 'trace-gen.h') or die "Could not open trace-gen.h for writing";
+$fh_trace_h = do_open("trace", "trace-gen.h");
 printf $fh_trace_h "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n";
 printf $fh_trace_h " *\n * AUTOMATICALLY GENERATED BY \'%s\' DO NOT EDIT\n */\n\n", __FILE__;
 printf $fh_trace_h "\#ifndef TRACE_GEN_H\n";
 printf $fh_trace_h "\#define TRACE_GEN_H\n\n";
 
-open($fh_retrace_cpp, '>', 'retrace-gen.cpp') or die "Could not open retrace-gen.cpp for writing";
+$fh_retrace_cpp = do_open("retrace", "retrace-gen.cpp");
 printf $fh_retrace_cpp "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n";
 printf $fh_retrace_cpp " *\n * AUTOMATICALLY GENERATED BY \'%s\' DO NOT EDIT\n */\n\n", __FILE__;
 printf $fh_retrace_cpp "#include \"v4l2-tracer-common.h\"\n\n";
 
-open($fh_retrace_h, '>', 'retrace-gen.h') or die "Could not open retrace-gen.h for writing";
+$fh_retrace_h = do_open("retrace", "retrace-gen.h");
 printf $fh_retrace_h "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n";
 printf $fh_retrace_h " *\n * AUTOMATICALLY GENERATED BY \'%s\' DO NOT EDIT\n */\n\n", __FILE__;
 printf $fh_retrace_h "\#ifndef RETRACE_GEN_H\n";
 printf $fh_retrace_h "\#define RETRACE_GEN_H\n\n";
 
-open($fh_common_info_h, '>', 'v4l2-tracer-info-gen.h') or die "Could not open v4l2-tracer-info-gen.h for writing";
+$fh_common_info_h = do_open("common", "v4l2-tracer-info-gen.h");
 printf $fh_common_info_h "/* SPDX-License-Identifier: GPL-2.0-only */\n/*\n * Copyright 2022 Collabora Ltd.\n";
 printf $fh_common_info_h " *\n * AUTOMATICALLY GENERATED BY \'%s\' DO NOT EDIT\n */\n\n", __FILE__;
 printf $fh_common_info_h "\#ifndef V4L2_TRACER_INFO_GEN_H\n";
-- 
Regards,

Laurent Pinchart

