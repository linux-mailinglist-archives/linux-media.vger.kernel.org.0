Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46093FDBFF
	for <lists+linux-media@lfdr.de>; Fri, 15 Nov 2019 12:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727274AbfKOLLR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 06:11:17 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34913 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727142AbfKOLLR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 06:11:17 -0500
Received: by mail-lf1-f67.google.com with SMTP id i26so7752358lfl.2
        for <linux-media@vger.kernel.org>; Fri, 15 Nov 2019 03:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=OGagCI7TdPELPhIzze+Z8RA18NFVOq1Xwu9t28Iw5cU=;
        b=SWttfy3gHu1BC/T0NtsnpLFLPWpY4X9/jvvsPc1nLRtN++G6PK4SoWEXYUhwOsAZET
         t6Zsh1xAK33DqkYlsyS4uyXVPygGbc12Nb2EZUO3V5edV9ELxbY9v/VnEDCSfeT3caZt
         FXXqJ0IOR5cUXj6KODJfOiArlpo2455BfpDNaFF/mACXu5LTIcJyAKTFCjT0TRhoWG+P
         i5ziyUJjVQgCJrnnbPLJoSifqKVooMRrTOFTSQ41RYZA/fVDnJEwrw9JB1oLdXdGybow
         fc7805yccRvaJ2xFx2DQRmUEsGhyO+w2wEo1TepVP54L5yHZ3SnGV5dKBVJvGhoHKXLT
         RjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=OGagCI7TdPELPhIzze+Z8RA18NFVOq1Xwu9t28Iw5cU=;
        b=sxXsq7k5+AnJCdSl9v8QpIO4lzRilwEk8UWeTz1MgnMXyRRa2Bpngdz+Xaem9tuBhh
         0TxnoLKcVXrSvE4SAaOoYpbNkKwocGeJNH/PCWQo9pTzKbN8tqR+nN1y7mItpkE6r9ay
         HNoIHIXeqi0altf06R/3GpUXLRGf0kxqO5DyAR/r26QVZSELsJ0aTtkDr/6ViaGsP3Nt
         x64IPlahyBAUBMsORkdovBdEj0jKY1TwLAOWtNU7e967cJCWAf0wznnG8VYKvBoqFcUz
         aeCqtTBbKJq2XjGFKLgXVKWedoBUPVBYQHBymmMXqE3spHtuxVK0TSKBCkVtlh40Y6ma
         jVxA==
X-Gm-Message-State: APjAAAX3aXK770NPcO84EvdzqGCUZN/iPWpZRQfUnJZ3x+GlnAvhji77
        f5NUzRyGS5SnPrdnwU2vCKcguHeDljEmWonmHzX/eg==
X-Google-Smtp-Source: APXvYqylNd1BYvQTuX1TAn270rl8KOA5tTGXL4m88XAJFHcCOloRAvjV5Rv3ZtO18Bd4xeVxv/LpXMWRWntew46VBWs=
X-Received: by 2002:ac2:4d10:: with SMTP id r16mr11383738lfi.70.1573816275063;
 Fri, 15 Nov 2019 03:11:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a19:905:0:0:0:0:0 with HTTP; Fri, 15 Nov 2019 03:11:14 -0800 (PST)
From:   Vincent McIntyre <vincent.mcintyre@gmail.com>
Date:   Fri, 15 Nov 2019 22:11:14 +1100
Message-ID: <CAEsFdVP9FkvG8+oPLkMUuaxPNYnc2Ug1dBgnAAxZqS_fUGf77Q@mail.gmail.com>
Subject: [PATCH] media_build: support building against a specific kernel.
To:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I find it helpful to be able to build the linux-media modules
for a kernel other than the one I am currently running.

This is a resend of the patch that appeared at
  https://patchwork.linuxtv.org/patch/59979/
and completely supercedes that patch.
There are no differences in the patch, just the formatting of the
submission email.

Signed-off-by: vincent.mcintyre@gmail.com

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
+          'version=s' => \$kernel_version,
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
@@ -539,7 +546,7 @@ build - Builds the media drivers without needing
to compile a new kernel
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
