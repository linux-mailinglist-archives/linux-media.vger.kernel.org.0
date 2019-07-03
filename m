Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 584ED5E625
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 16:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfGCOMO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 10:12:14 -0400
Received: from gofer.mess.org ([88.97.38.141]:48283 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbfGCOMO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jul 2019 10:12:14 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id D6E2060A67; Wed,  3 Jul 2019 15:12:12 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v4l-utils 1/2] gen_keytables.pl: strip comments from C files
Date:   Wed,  3 Jul 2019 15:12:11 +0100
Message-Id: <20190703141212.31719-1-sean@mess.org>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some keymaps contain mappings in comments which should have not been
included.

Cc: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Sean Young <sean@mess.org>
---
 utils/keytable/gen_keytables.pl | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/utils/keytable/gen_keytables.pl b/utils/keytable/gen_keytables.pl
index 4124e366..8f3a87e6 100755
--- a/utils/keytable/gen_keytables.pl
+++ b/utils/keytable/gen_keytables.pl
@@ -82,7 +82,17 @@ sub parse_file($$)
 
 	printf "processing file $filename\n" if ($debug);
 	open IN, "<$filename" or die "couldn't find $filename";
-	while (<IN>) {
+	# read the entire file
+	my $file = do { local $/ = undef; <IN> };
+	close IN;
+
+	# remove comments
+	$file =~ s,/\*.*?\*/,,sg;
+	$file =~ s,//[^\n]*,,sg;
+
+	my @lines = split /\n/, $file;
+
+	foreach (@lines) {
 		if (m/struct\s+rc_map_table\s+(\w[\w\d_]+)/) {
 			flush($filename, $legacy);
 
@@ -140,7 +150,6 @@ sub parse_file($$)
 			}
 		}
 	}
-	close IN;
 
 	flush($filename, $legacy);
 
-- 
2.21.0

