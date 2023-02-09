Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2989B69002D
	for <lists+linux-media@lfdr.de>; Thu,  9 Feb 2023 07:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjBIGFR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Feb 2023 01:05:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjBIGFP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Feb 2023 01:05:15 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C394F15C83
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 22:05:11 -0800 (PST)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C21DE66020B9;
        Thu,  9 Feb 2023 06:05:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1675922710;
        bh=VutZ1grtQ2O3WbvpQhgVnzEcHGwmjyuY996fpsvEWVs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GRVj9m3K1ODkdqGkwwFUMERrRVYdYdu9AC586riH7UiM+WcfS6KUxP2UQv9IN+40r
         fBesOWH4uWsUuMUW8i5Olj+gR4aiJGgEM5ZTAmUCZslyfD7vQPsK8peI/816Nnoz47
         1xRSRibrefz4bsSJzGUBIBVxCnmoP7nHqujHpAz06//dWJ2B3owRqJYxCSO6l9Vgr3
         RFCWCdgVl5fbALKEhlvPQUQrMvOaIRR1mFgelEAlLvcfMp1WJk209asP5OkUzsSAxt
         StTz4MSr1/sesZxn0SIp+S+COdpyW0tfGy7/6cfWaH+nHMxOLTqUTws6JQBElRyaGH
         UUYOYcikdrs7Q==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 4/5] v4l2-tracer: add exact matching for 'type' and 'field'
Date:   Wed,  8 Feb 2023 22:06:24 -0800
Message-Id: <43eeda9a0a546dc0f001bffd24ecfd969cb5f016.1675920064.git.deborah.brouwer@collabora.com>
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

The autogeneration script was overly broad in converting to strings any
struct member whose name included the words 'type' or 'field.' Stop
converting members to strings when the name only partially matches e.g.
pic_order_cnt_type. Convert a member to a string only if the name matches
exactly 'type' or 'field.'

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 utils/v4l2-tracer/v4l2-tracer-gen.pl | 50 +++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
index 86e6d9d7..66d46f0c 100755
--- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -130,14 +130,37 @@ sub clean_up_line {
 sub get_val_def_name {
 	my $member = shift;
 	my $struct_name = shift;
-	if ($member =~ /type/) {
-		if ($struct_name =~ /.*fmt|format|buf|parm|crop|selection|vbi.*/) {
-			return "v4l2_buf_type_val_def";
-		} elsif ($struct_name =~ /ctrl$/) {
-			return "v4l2_ctrl_type_val_def";
-		} else {
-			return "nullptr"; # will print as hex string
+	@structs_that_use_v4l2_buf_type = qw(v4l2_fmtdesc v4l2_requestbuffers v4l2_buffer v4l2_crop
+	                                     v4l2_exportbuffer v4l2_cropcap v4l2_selection
+	                                     v4l2_sliced_vbi_cap v4l2_format v4l2_streamparm);
+	@structs_that_use_v4l2_ctrl_type = qw(v4l2_queryctrl v4l2_query_ext_ctrl);
+	if ($member eq "type") {
+		foreach (@structs_that_use_v4l2_buf_type) {
+			if ($struct_name eq $_) {
+				return "v4l2_buf_type_val_def";
+			}
+		}
+		foreach (@structs_that_use_v4l2_tuner_type) {
+			if ($struct_name eq $_) {
+				return "v4l2_tuner_type_val_def";
+			}
+		}
+		foreach (@structs_that_use_v4l2_ctrl_type) {
+			if ($struct_name eq $_) {
+				return "v4l2_ctrl_type_val_def";
+			}
+		}
+		if ($struct_name eq "v4l2_frmsizeenum") {
+			return "v4l2_frmsizetypes_val_def";
 		}
+		if ($struct_name eq "v4l2_frmivalenum") {
+			return "v4l2_frmivaltypes_val_def";
+		}
+		return "nullptr"; # will print as hex string
+	}
+	# special treatment for struct v4l2_input which has members named both "tuner" and "type"
+	if (($member eq "tuner") && ($struct_name eq "v4l2_input")) {
+		return "v4l2_tuner_type_val_def";
 	}
 	if ($member =~ /pixelformat/) {
 		return "v4l2_pix_fmt_val_def";
@@ -153,12 +176,15 @@ sub get_val_def_name {
 	if ($member =~ /memory/) {
 		return "v4l2_memory_val_def";
 	}
-	if ($member =~ /field/) {
-		if ($struct_name =~ /.*pix|buffer.*/) {
-			return "v4l2_field_val_def";
-		} else {
-			return "nullptr"; # will print as hex string
+	@structs_that_use_v4l2_field = qw(v4l2_pix_format v4l2_buffer v4l2_framebuffer v4l2_window
+	                                  v4l2_pix_format_mplane v4l2_event_vsync);
+	if ($member eq "field") {
+		foreach (@structs_that_use_v4l2_field) {
+			if ($struct_name eq $_) {
+				return "v4l2_field_val_def";
+			}
 		}
+		return "nullptr"; # will print as hex string
 	}
 	if ($member =~ /^id$/) {
 		if ($struct_name =~ /.*control|query.*/) {
-- 
2.39.0

