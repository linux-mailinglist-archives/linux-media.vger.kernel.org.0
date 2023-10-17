Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03FE07CC949
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 18:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbjJQQ6j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 12:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234912AbjJQQ6i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 12:58:38 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDA94FD
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 09:58:36 -0700 (PDT)
Received: from mz550.lan (node-1w7jr9sszvrs1l8hzw7y2s2bv.ipv6.telus.net [IPv6:2001:569:be8a:cf00:d491:55fe:74d9:74cb])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id ADB19660576A;
        Tue, 17 Oct 2023 17:58:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1697561915;
        bh=2Apxkh6ANHgi6p4K4YFjFOWtu8sV247f4B4oGviG860=;
        h=From:To:Cc:Subject:Date:From;
        b=C0uFAk3HEadVnSBQch27ncgpARak+c+V/C9BzD4COewKX28K3jfbTXYQTfGURBKbH
         t/+tfJ7ju9D/dg3+FCp3GiEVGmz6Z2OYxPp9KWEMeB5Zyyy8nq/aL2dIEe7OI5Kyy6
         xtYICHGAc+Bur0IW4Y8XXRz87kJS9pdaywRqUZQhanIy0PgHCoUYS9S9ZepNCRZ44X
         HJCkRT4DzdKZ9kzLGmJofRCQeC/ICRItjfKxdEqHwtZQkBa0xs7oC1cXkBLGQlj+Cy
         djOr/KHzItCg2MT4Ou8zNrp/2apVI3D40yntoX7Cm+mGwfqG3Ym+nbSIpv8p/FaGS1
         oanwixFSuKGVw==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org
Cc:     Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] v4l2-tracer: fix autogen script for AV1
Date:   Tue, 17 Oct 2023 09:58:19 -0700
Message-ID: <20231017165819.18634-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The AV1 uAPI introduced some new enums and also defined
two array sizes arithmetically e.g.
__u32 mi_col_starts[V4L2_AV1_MAX_TILE_COLS + 1];

Adjust the autogeneration scripts to handle these changes.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/v4l2-tracer-gen.pl | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
index cbfdfbe0..e8f9d71e 100755
--- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -32,7 +32,9 @@ EOF
 
 sub convert_type_to_json_type {
 	my $type = shift;
-	if ($type eq __u8 || $type eq char || $type eq __u16 || $type eq __s8 || $type eq __s16 || $type eq __s32 || $type eq 'int') {
+	if ($type eq __u8 || $type eq char || $type eq __u16 || $type eq __s8 || $type eq __s16 || $type eq __s32 || $type eq 'int' ||
+		$type eq 'v4l2_av1_warp_model' || $type eq 'v4l2_av1_frame_restoration_type' || $type eq 'v4l2_av1_frame_type' ||
+		$type eq 'v4l2_av1_interpolation_filter' || $type eq 'v4l2_av1_tx_mode') {
 		return "int";
 	}
 	if ($type eq __u32 || $type eq __le32 || $type eq __s64) {
@@ -658,19 +660,29 @@ sub struct_gen_ctrl {
 		@words = grep  {!/\]/} @words; # remove values with brackets e.g. V4L2_H264_REF_LIST_LEN]
 
 		($type) = $words[0];
+		if ($type eq 'enum') {
+			$type = $words[1];
+		}
 		$json_type = convert_type_to_json_type($type);
 
 		($member) = $words[scalar @words - 1];
 
 		# generate members that are arrays
 		if ($line =~ /.*\[.*/) {
+
+			# e.g. two dimensional array [x][y]
+			my @dimensions = ($line) =~ /\[(.*?)\]/g;
+
+			#for struct v4l2_av1_tile_info [V4L2_AV1_MAX_TILE_ROWS + 1]
+			if (grep {$_ =~ /\+/} @dimensions) {
+				$member = $words[scalar @words - 3];
+			}
+
 			printf $fh_trace_cpp "\t\/\* %s \*\/\n", $line; # add comment
 			printf $fh_trace_cpp "\tjson_object *%s_obj = json_object_new_array();\n", $member;
 			printf $fh_retrace_cpp "\n\t\/\* %s \*\/\n", $line; # add comment
 
-			my @dimensions = ($line) =~ /\[(\w+)\]/g;
 			$dimensions_count = scalar @dimensions;
-
 			if ($dimensions_count > 1) {
 				printf $fh_retrace_cpp "\tint count_%s = 0;\n", $member;
 			}
-- 
2.41.0

