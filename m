Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED1BF113F2A
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 11:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728991AbfLEKPa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 05:15:30 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:41059 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728735AbfLEKP3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Dec 2019 05:15:29 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id D8AC3225EB
        for <linux-media@vger.kernel.org>; Thu,  5 Dec 2019 05:15:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 05 Dec 2019 05:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arewethere.net;
         h=date:from:to:subject:message-id:mime-version:content-type; s=
        fm1; bh=bVqCyx5ElKacabu/NIh6DOq2jMaPS17s6pJdTN4SbyE=; b=y4Grcg+r
        QyG3+CqjHPc4Nsq4K/TNMcutOLFpib/xnAcoXx24Hf1IxUWRxJxKAiAowz7MtL2w
        jh9SAn1a8lp8tqUcsaOKJWuS94Lcdw35zXiGlEgGaq897T98pXyErid8jO0NUyt5
        thuMOATxeSeIdfw6qOyME3aDXMrVL31NbzEvFHuE1qaKBsSgnZMgeq2jlwQbRKiS
        kfpIx8568E8ZIlXMgWa5b/lW6iVOA15pZkhb3ulnGT29aamEUiMUkseyI7MK2n/X
        x1HuoMGIZRplH58ZpbgIJB/fGi88/fWzccpwO/YIwlAspq6OAAl8RL31D2uf62dU
        ACHr2MOFLMWMdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=bVqCyx5ElKacabu/NIh6DOq2jMaPS
        17s6pJdTN4SbyE=; b=SF8AlJX76byMh5stTN1Xu19i3YUJtrfgRf1jOIQvVWFtQ
        uFR4KzjWYwLExtJdsSMdlh3a3me44RtxQLJ07sQXLHlwymoW/8tLgxBD4UUk1FuC
        rdYMeoXq5PbeWSwbUN8H551Hyte4sT0TqAOkKyMFFHPlgutDVThUc2LtS8JmW/DM
        jfd0z2jne/3ZIVfo4uusv+377QGDrD7l99vK1o27d8IExypgSvOoAoG+RKmPBOEu
        S2v7oFgMGUMp1sDS/xMS1bmd5iRRkmdVWirSRMNKimZQ6Dl9n40PHrQmttB8cspR
        u9ZYhxpzmt05ulp9aLI4B4xjIxbWcqX4m/+UFHB7w==
X-ME-Sender: <xms:wNjoXS4-fvvzkCz6cR8fBHNL3c96ImJIY1bwppDs81Rd4Qif6wKjAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudekuddgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtuggfsehttdertd
    dtredvnecuhfhrohhmpeggihhntggvnhhtucfotgfknhhthihrvgcuoehmvgguihgrsegr
    rhgvfigvthhhvghrvgdrnhgvtheqnecuffhomhgrihhnpehlihhnuhigthhvrdhorhhgne
    cukfhppedurdduvdelrddujeekrddufeeknecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
    vgguihgrsegrrhgvfigvthhhvghrvgdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:wNjoXV_Y709kcKbsk-W40J2HZC_PmvHuMEqZVnef0vv4Wr1sMdA9KA>
    <xmx:wNjoXWbGwmwxkQcFM0KchPi0mtbqzVZgrBgW6PQjLK0tBJCh2dGeVg>
    <xmx:wNjoXW4AJCFKDVcYQykkiUFhqb1MKWr1GY-SmkNo2xn5vDHkKj5gvQ>
    <xmx:wNjoXbggvFEGmOG9VkFTsgEhcUR7u69tY3rUxnSXbMUoNrMO8cqbtw>
Received: from ubuntu.windy (unknown [1.129.178.138])
        by mail.messagingengine.com (Postfix) with ESMTPA id A454930600AB
        for <linux-media@vger.kernel.org>; Thu,  5 Dec 2019 05:15:27 -0500 (EST)
Date:   Thu, 5 Dec 2019 21:15:24 +1100
From:   Vincent McIntyre <media@arewethere.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media-build: build against a specific kernel
Message-ID: <20191205101523.GD9298@ubuntu.windy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I find it helpful to be able to build the linux-media modules
for a kernel other than the one I am currently running.

This is a resend of the patch that in two previous attempts
made it into patchwork but the text was line-wrapped.
Those patches should be dropped.
  https://patchwork.linuxtv.org/patch/59979/
  https://patchwork.linuxtv.org/patch/60186/

There are no differences in the patch, just the submission email.
Apologies for all the noise.

Signed-off-by: Vincent McIntyre <media@arewethere.net>

---
 build | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/build b/build
index 2f6b3f4..c2067e7 100755
--- a/build
+++ b/build
@@ -14,6 +14,7 @@ my $check_only = 0;
 my $main_git = 0;
 my $depth;
 my @git;
+my $kernel_version = '';

 my $main_git_url = "git://linuxtv.org/media_tree.git";
 my $main_branch = "master";
@@ -27,6 +28,7 @@ GetOptions('v|verbose' => \$level,
 	   'main_git|main-git' => \$main_git,
 	   'depth=i' => \$depth,
 	   'git=s{2}' => \@git,
+	   'version=s' => \$kernel_version,
 	  ) or pod2usage(2);
 pod2usage(1) if $help;
 pod2usage(-exitstatus => 0, -verbose => 2) if $man;
@@ -522,7 +524,12 @@ print "******************\n";
 print "* Start building *\n";
 print "******************\n";

-run("make allyesconfig", "can't select all drivers");
+if ($kernel_version =~ /\S/) {
+    print "Building for kernel version $kernel_version\n";
+    run("make allyesconfig VER=$kernel_version", "can't select all drivers");
+} else {
+    run("make allyesconfig", "can't select all drivers");
+}
 run("make", "build failed");

 print "**********************************************************\n";
@@ -539,7 +546,7 @@ build - Builds the media drivers without needing to compile a new kernel
 =head1 SYNOPSIS

 build [--help] [--man] [--verbose] [--check-only] [<--git> [URL] [BRANCH]]
- [--main-git] [--depth [DEPTH]]
+ [--main-git] [--depth [DEPTH]] [--version [KERNELVERSION]]

 =head1 OPTIONS

@@ -579,6 +586,11 @@ depth parameter, in order to get a smaller tree.

 That helps to reduce disk storage and download time.

+=item B<--version> [KERNELVERSION]
+
+Try to build for a particular kernel version. The format of the
+version string is the same as the output from 'uname -r'.
+
 =back

 =head1 DESCRIPTION
--
2.7.4

