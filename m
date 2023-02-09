Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 681E069002C
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 07:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbjBIGFQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 01:05:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbjBIGFP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 01:05:15 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7DFD12F18
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 22:05:09 -0800 (PST)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D82F66020B8;
        Thu,  9 Feb 2023 06:05:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1675922708;
        bh=9P0Cfhob6vVvTK8MXb1rhrg5CMWxjHYhRz9jLOcgVXo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FzUo2ur8lT4jO0RtTizvga4YVXjxif9DlzNxz4yUktMtb86Et2pm3TxJ2Aowwqzwy
         jrdaMPQ+9YOee+k1bZPKwGWGeh8t/GaUcD7XDZX1sKR1y9q/61sm6i+v3ygdidQgvz
         tamTbpTg6C0nIotQW/eMp5H/V04ZouCou8zXf4vqQo4b+bkvOdaIBLGQ4fs1wf3eag
         ZdANZZQr5IdK8XCov32OCcw/J0XSgusugG1QMewbenyvoCJPgz8zm17kWRlPMCPz8n
         gCS0cygxanNvO4AcheQqL3VoSEF4b+DKT8JkaqJNpcxvAeBiZ4ofSVXaovLvG8i5uK
         PVaCm17LBFhLg==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 3/5] v4l2-tracer: refactor autogeneration script
Date:   Wed,  8 Feb 2023 22:06:23 -0800
Message-Id: <992905de679cf90774a5b664439828c07289132d.1675920064.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675920064.git.deborah.brouwer@collabora.com>
References: <cover.1675920064.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use a function to generate value and flag arrays which gets rid of some
duplicate code and makes it easier to specify when the array generation
should stop. Also optimize the code to return or continue as soon as
possible within a function or loop.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/v4l2-tracer-gen.pl | 190 ++++++++++++---------------
 1 file changed, 83 insertions(+), 107 deletions(-)

diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
index fe648182..86e6d9d7 100755
--- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -85,6 +85,30 @@ sub enum_gen {
 	printf $fh_common_info_h "\t{ -1, \"\" }\n};\n\n";
 }
 
+sub val_def_gen {
+	my $last_val = shift;
+	my $sentinel = shift;
+	if (length $sentinel == 0) {
+		$sentinel = "-1"; # _flag_def arrays end with 0, _val_def arrays end in -1
+	}
+	($val) = ($_) =~ /^#define\s*(\w+)\s*/;
+	printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $val, $val;
+	while (<>) {
+		next if ($_ =~ /^\s*\/?\s?\*.*/); # skip comments
+		next if ($_ =~ /^\s*$/);  # skip blank lines
+		($val) = ($_) =~ /^#define\s*(\w+)\s*/;
+		next if ($val eq ""); # skip lines that don't start with define e.g. V4L2_STD_ATSC_16_VSB
+		printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $val, $val;
+		last if ($val eq $last_val);
+	}
+	printf $fh_common_info_h "\t{ $sentinel, \"\" }\n};\n\n";
+}
+
+sub flag_def_gen {
+	my $last_flag = shift;
+	val_def_gen($last_flag, 0);
+}
+
 sub clean_up_line {
 	my $line = shift;
 	chomp($line);
@@ -104,103 +128,97 @@ sub clean_up_line {
 }
 
 sub get_val_def_name {
-	my @params = @_;
-	my $member = @params[0];
-	my $struct_name = @params[1];
-
-	$val_def_name = "";
+	my $member = shift;
+	my $struct_name = shift;
 	if ($member =~ /type/) {
 		if ($struct_name =~ /.*fmt|format|buf|parm|crop|selection|vbi.*/) {
-			$val_def_name = "v4l2_buf_type_val_def";
+			return "v4l2_buf_type_val_def";
 		} elsif ($struct_name =~ /ctrl$/) {
-			$val_def_name = "v4l2_ctrl_type_val_def";
+			return "v4l2_ctrl_type_val_def";
 		} else {
-			$val_def_name = "nullptr"; # will print as hex string
+			return "nullptr"; # will print as hex string
 		}
 	}
 	if ($member =~ /pixelformat/) {
-		$val_def_name = "v4l2_pix_fmt_val_def";
+		return "v4l2_pix_fmt_val_def";
 	}
 	if ($member =~ /cmd/) {
 		if ($struct_name =~ /v4l2_decoder_cmd/) {
-			$val_def_name = "decoder_cmd_val_def";
+			return "decoder_cmd_val_def";
 		}
 		if ($struct_name =~ /v4l2_encoder_cmd/) {
-			$val_def_name = "encoder_cmd_val_def";
+			return "encoder_cmd_val_def";
 		}
 	}
 	if ($member =~ /memory/) {
-		$val_def_name = "v4l2_memory_val_def";
+		return "v4l2_memory_val_def";
 	}
 	if ($member =~ /field/) {
 		if ($struct_name =~ /.*pix|buffer.*/) {
-			$val_def_name = "v4l2_field_val_def";
+			return "v4l2_field_val_def";
 		} else {
-			$val_def_name = "nullptr"; # will print as hex string
+			return "nullptr"; # will print as hex string
 		}
 	}
 	if ($member =~ /^id$/) {
 		if ($struct_name =~ /.*control|query.*/) {
-			$val_def_name = "control_val_def";
-		} else {
-			$val_def_name = "nullptr"; # will print as hex string
+			return "control_val_def";
 		}
+		return "nullptr"; # will print as hex string
 	}
 	if ($member =~ /capability|outputmode|capturemode/) {
 		if ($struct_name =~ /.*v4l2_captureparm|v4l2_outputparm.*/) {
-		$val_def_name = "streamparm_val_def";
+		return "streamparm_val_def";
 		}
 	}
 	if ($member =~ /colorspace/) {
-		$val_def_name = "v4l2_colorspace_val_def";
+		return "v4l2_colorspace_val_def";
 	}
 	if ($member =~ /ycbcr_enc/) {
-		$val_def_name = "v4l2_ycbcr_encoding_val_def";
+		return "v4l2_ycbcr_encoding_val_def";
 	}
 	if ($member =~ /quantization/) {
-		$val_def_name = "v4l2_quantization_val_def";
+		return "v4l2_quantization_val_def";
 	}
 	if ($member =~ /xfer_func/) {
-		$val_def_name = "v4l2_xfer_func_val_def";
+		return "v4l2_xfer_func_val_def";
 	}
-
-	return $val_def_name;
+	return "";
 }
 
 sub get_flag_def_name {
-	my @params = @_;
-	my $member = @params[0];
-	my $struct_name = @params[1];
-
-	$flag_def_name = "";
+	my $member = shift;
+	my $struct_name = shift;
 	if ($member =~ /flags/) {
 		if ($struct_name =~ /buffers$/) {
-			$flag_def_name = "v4l2_memory_flag_def";
-		} elsif ($struct_name =~ /.*pix_format.*/) {
-			$flag_def_name = "v4l2_pix_fmt_flag_def";
-		} elsif ($struct_name =~ /.*ctrl$/) {
-			$flag_def_name = "v4l2_ctrl_flag_def";
-		} elsif ($struct_name =~ /.*fmtdesc$/) {
-			$flag_def_name = "v4l2_fmt_flag_def";
-		} elsif ($struct_name =~ /.*selection$/) {
-			$flag_def_name = "v4l2_sel_flag_def";
-		} else {
-			$flag_def_name = "nullptr"
+			return "v4l2_memory_flag_def";
+		}
+		if ($struct_name =~ /.*pix_format.*/) {
+			return "v4l2_pix_fmt_flag_def";
+		}
+		if ($struct_name =~ /.*ctrl$/) {
+			return "v4l2_ctrl_flag_def";
 		}
+		if ($struct_name =~ /.*fmtdesc$/) {
+			return "v4l2_fmt_flag_def";
+		}
+		if ($struct_name =~ /.*selection$/) {
+			return "v4l2_sel_flag_def";
+		}
+			return "nullptr";
 	}
 
 	if ($member =~ /.*cap.*/) {
 		# v4l2_requestbuffers, v4l2_create_buffers
 		if ($struct_name =~ /buffers$/) {
-			$flag_def_name = "v4l2_buf_cap_flag_def";
+			return "v4l2_buf_cap_flag_def";
 		}
 		# v4l2_capability
 		if ($struct_name =~ /capability$/) {
-			$flag_def_name = "v4l2_cap_flag_def";
+			return "v4l2_cap_flag_def";
 		}
 	}
-
-	return $flag_def_name;
+	return "";
 }
 
 # trace a struct nested in another struct in videodev2.h
@@ -760,82 +778,40 @@ while (<>) {
 		push (@controls, $_);
 	}
 
-	if (grep {/^\/\* Control classes \*\//} $_) {
+	if (grep {/^#define V4L2_CTRL_CLASS_USER\s+/} $_) {
 		printf $fh_common_info_h "constexpr val_def ctrlclass_val_def[] = {\n";
-		while (<>) {
-			last if $_ =~ /^\s*$/; # last if blank line
-			($ctrl_class) = ($_) =~ /#define\s*(\w+)\s+.*/;
-			printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $ctrl_class, $ctrl_class;
-		}
-		printf $fh_common_info_h "\t{ -1, \"\" }\n};\n\n";
+		val_def_gen("V4L2_CTRL_CLASS_COLORIMETRY");
+		next;
 	}
-
-	if (grep {/\/\* Values for 'capabilities' field \*\//} $_) {
+	if (grep {/^#define V4L2_CAP_VIDEO_CAPTURE/} $_) {
 		printf $fh_common_info_h "constexpr flag_def v4l2_cap_flag_def[] = {\n";
-		while (<>) {
-			last if $_ =~ /.*V I D E O   I M A G E   F O R M A T.*/;
-			next if ($_ =~ /^\/?\s?\*.*/); # skip comments
-			next if $_ =~ /^\s*$/; # skip blank lines
-			($cap) = ($_) =~ /#define\s+(\w+)\s+.+/;
-			printf $fh_common_info_h "\t{ $cap, \"$cap\" },\n"
-		}
-		printf $fh_common_info_h "\t{ 0, \"\" }\n};\n\n";
+		flag_def_gen("V4L2_CAP_DEVICE_CAPS");
+		next;
 	}
-
-	if (grep {/\*      Pixel format         FOURCC                          depth  Description  \*\//} $_) {
+	if (grep {/^#define V4L2_PIX_FMT_RGB332\s+/} $_) {
 		printf $fh_common_info_h "constexpr val_def v4l2_pix_fmt_val_def[] = {\n";
-		while (<>) {
-			last if $_ =~ /.*SDR formats - used only for Software Defined Radio devices.*/;
-			next if ($_ =~ /^\s*\/\*.*/); # skip comments
-			next if $_ =~ /^\s*$/; # skip blank lines
-			($pixfmt) = ($_) =~ /#define (\w+)\s+.*/;
-			printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $pixfmt, $pixfmt;
-		}
-		printf $fh_common_info_h "\t{ -1, \"\" }\n};\n\n";
+		val_def_gen("V4L2_PIX_FMT_IPU3_SRGGB10");
+		next;
 	}
-
-	if (grep {/^#define V4L2_BUF_CAP_SUPPORTS_MMAP.*/} $_) {
+	if (grep {/^#define V4L2_BUF_CAP_SUPPORTS_MMAP\s+/} $_) {
 		printf $fh_common_info_h "constexpr flag_def v4l2_buf_cap_flag_def[] = {\n";
-		($buf_cap) = ($_) =~ /#define (\w+)\s+.*/;
-		printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $buf_cap, $buf_cap;
-		while (<>) {
-			last if $_ =~ /^\s*$/; # blank line
-			($buf_cap) = ($_) =~ /#define (\w+)\s+.*/;
-			printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $buf_cap, $buf_cap;
-		}
-		printf $fh_common_info_h "\t{ 0, \"\" }\n};\n\n";
+		flag_def_gen("V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS");
+		next;
 	}
-
-	if (grep {/.*Flags for 'capability' and 'capturemode' fields.*/} $_) {
+	if (grep {/^#define V4L2_MODE_HIGHQUALITY\s+/} $_) {
 		printf $fh_common_info_h "constexpr val_def streamparm_val_def[] = {\n";
-		while (<>) {
-			last if $_ =~ /^\s*$/; # blank line
-			($streamparm) = ($_) =~ /^#define\s*(\w+)\s*/;
-			printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $streamparm, $streamparm;
-		}
-		printf $fh_common_info_h "\t{ -1, \"\" }\n};\n\n";
+		val_def_gen("V4L2_CAP_TIMEPERFRAME");
+		next;
 	}
-
-	if (grep {/.*V4L2_ENC_CMD_START.*/} $_) {
+	if (grep {/^#define V4L2_ENC_CMD_START\s+/} $_) {
 		printf $fh_common_info_h "constexpr val_def encoder_cmd_val_def[] = {\n";
-		($enc_cmd) = ($_) =~ /^#define\s*(\w+)\s*/;
-		printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $enc_cmd, $enc_cmd;
-		while (<>) {
-			last if $_ =~ /^\s*$/; # blank line
-			($enc_cmd) = ($_) =~ /^#define\s*(\w+)\s*/;
-			printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $enc_cmd, $enc_cmd;
-		}
-		printf $fh_common_info_h "\t{ -1, \"\" }\n};\n\n";
+		val_def_gen("V4L2_ENC_CMD_RESUME");
+		next;
 	}
-
-	if (grep {/.*Decoder commands.*/} $_) {
+	if (grep {/^#define V4L2_DEC_CMD_START\s+/} $_) {
 		printf $fh_common_info_h "constexpr val_def decoder_cmd_val_def[] = {\n";
-		while (<>) {
-			last if $_ =~ /^\s*$/; # blank line
-			($dec_cmd) = ($_) =~ /^#define\s*(\w+)\s*/;
-			printf $fh_common_info_h "\t{ %s,\t\"%s\" },\n", $dec_cmd, $dec_cmd;
-		}
-		printf $fh_common_info_h "\t{ -1, \"\" }\n};\n\n";
+		val_def_gen("V4L2_DEC_CMD_FLUSH");
+		next;
 	}
 
 	if (grep {/^#define\s+(VIDIOC_\w*)\s*.*/} $_) {
-- 
2.39.0

