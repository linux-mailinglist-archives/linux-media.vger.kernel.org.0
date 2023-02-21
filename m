Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D634D69E440
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 17:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233175AbjBUQJG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 11:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232992AbjBUQJF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 11:09:05 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F58234F5
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 08:09:02 -0800 (PST)
Received: from hillosipuli.retiisi.eu (dkzbhx1tyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4502:69d6::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 08B031B002A4;
        Tue, 21 Feb 2023 18:09:00 +0200 (EET)
Received: from vihersipuli.localdomain (vihersipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::84:2])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id ED334634C91;
        Tue, 21 Feb 2023 18:08:49 +0200 (EET)
Received: from sailus by vihersipuli.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1pUVCD-0000jb-JM; Tue, 21 Feb 2023 18:08:49 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gjasny@googlemail.com,
        hverkuil@xs4all.nl, kieran.bingham@ideasonboard.com,
        mchehab@kernel.org, nicolas@ndufresne.ca, p.zabel@pengutronix.de,
        rosenp@gmail.com, sean@mess.org, user.vdr@gmail.com,
        xavier.claessens@collabora.com, deborah.brouwer@collabora.com,
        ariel@vanguardiasur.com.ar, ezequiel@vanguardiasur.com.ar,
        tomi.valkeinen@ideasonboard.com
Subject: [PATCH 1/1] utils: Add help text for v4l2-tracer-gen.pl
Date:   Tue, 21 Feb 2023 18:08:49 +0200
Message-Id: <20230221160849.2778-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
References: <20230221143204.26591-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add help text for v4l2-tracer-gen.pl, via the '-h' option. Also add
support for '--' to signal end of options, in case file names would begin
with dash.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi Laurent,

Can you squash this to the utils patch?

- Sakari

 utils/v4l2-tracer/v4l2-tracer-gen.pl | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/utils/v4l2-tracer/v4l2-tracer-gen.pl b/utils/v4l2-tracer/v4l2-tracer-gen.pl
index 8192a5bf..53473ae1 100755
--- a/utils/v4l2-tracer/v4l2-tracer-gen.pl
+++ b/utils/v4l2-tracer/v4l2-tracer-gen.pl
@@ -8,8 +8,26 @@ my %outtype = ( "common" => 1, "trace" => 1, "retrace" => 1 );
 while ($ARGV[0] =~ /^-/) {
 	my $arg = shift @ARGV;
 
-	$outdir = shift @ARGV if $arg eq "-o";
-	%outtype = (shift @ARGV => 1) if $arg eq '-t';
+	($outdir = shift @ARGV) && next if $arg eq "-o";
+	(%outtype = (shift @ARGV => 1)) && next if $arg eq '-t';
+	(help() && exit 0) if $arg eq '-h';
+	last if $arg eq '--';
+
+	print stderr "invalid option $arg, use $0 -h for help\n";
+	exit 0;
+}
+
+sub help() {
+	print stderr <<EOF;
+$0 - Generate files for V4L2 tracer
+
+usage: $0 [-o dir] [-t (common|trace|retrace)] [-h] header [header2] ...
+
+	-o dir	set output directory
+	-t x	generate particular trace files, the default is to generate
+		them all
+	-h	print this help text and quit
+EOF
 }
 
 sub convert_type_to_json_type {
-- 
2.30.2

