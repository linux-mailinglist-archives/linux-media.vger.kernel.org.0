Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8332E5C138
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 18:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729297AbfGAQiQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 12:38:16 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:47163 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729230AbfGAQiQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 12:38:16 -0400
X-Originating-IP: 83.155.44.161
Received: from classic.redhat.com (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 372861C0002
        for <linux-media@vger.kernel.org>; Mon,  1 Jul 2019 16:38:15 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH 1/2] keytable: Add source information in generated keymaps
Date:   Mon,  1 Jul 2019 18:38:12 +0200
Message-Id: <20190701163813.25032-1-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add comments to mention that keymap files are generated, and that
they shouldn't be modified by hand. Also list which tool was used
to generate them and the kernel source filename.

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 utils/keytable/gen_keytables.pl | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/utils/keytable/gen_keytables.pl b/utils/keytable/gen_keytables.pl
index 4124e366..3dc74ba6 100755
--- a/utils/keytable/gen_keytables.pl
+++ b/utils/keytable/gen_keytables.pl
@@ -36,10 +36,17 @@ sub flush($$)
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
+	print OUT "# This file is a generated data file, do not modify manually\n";
+	print OUT "#\n";
+	print OUT "# Generated with gen_keytables.pl in v4l-utils\n";
+	print OUT "# using $relative_filename as a source file\n";
 	print OUT "[[protocols]]\n";
 	print OUT "name = \"$keyname\"\n";
 	print OUT "protocol = \"$type\"\n";
-- 
2.21.0

