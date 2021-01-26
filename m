Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E0D305BEC
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 13:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S313329AbhAZWyQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 17:54:16 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:45001 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393221AbhAZRqE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 12:46:04 -0500
X-Originating-IP: 78.199.60.242
Received: from localhost.localdomain (unknown [78.199.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C6EB21BF20C;
        Tue, 26 Jan 2021 17:45:17 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-media@vger.kernel.org
Cc:     Bastien Nocera <hadess@hadess.net>
Subject: [PATCH] keytable: Add source information in generated keymaps
Date:   Tue, 26 Jan 2021 18:45:14 +0100
Message-Id: <20210126174514.1393240-1-hadess@hadess.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add comments to mention that keymap files are generated, and list which
tool was used to generate them and the kernel source filename.

This should make it less likely that generated files are used as
examples to contribute keymaps from, and more likely that upstream
changes are channeled through the right source tree.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 utils/keytable/gen_keytables.pl | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/utils/keytable/gen_keytables.pl b/utils/keytable/gen_keytables.pl
index c14aded3..40556479 100755
--- a/utils/keytable/gen_keytables.pl
+++ b/utils/keytable/gen_keytables.pl
@@ -36,10 +36,15 @@ sub flush($$)
 	my $filename = shift;
 	my $legacy = shift;
 	my $defined;
+	my $relative_filename = $filename;
 
 	return if (!$keyname || !$out);
-	print "Creating $dir/$keyname.toml\n";
+	$relative_filename =~ s/^$kernel_dir//;
+	$relative_filename =~ s/^\///;
+	print "Creating $dir/$keyname.toml from $relative_filename\n";
 	open OUT, ">$dir/$keyname.toml";
+	print OUT "# Generated with gen_keytables.pl in v4l-utils\n";
+	print OUT "# using $relative_filename as a source file\n";
 	print OUT "[[protocols]]\n";
 	print OUT "name = \"$keyname\"\n";
 	print OUT "protocol = \"$type\"\n";
-- 
2.29.2

