Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617F832A861
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580249AbhCBRa5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:30:57 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:40851 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1578127AbhCBKfx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Mar 2021 05:35:53 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id H2MqlKlzoC40pH2Mulm6FL; Tue, 02 Mar 2021 11:35:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614681308; bh=aywMBKj7XPMQut+SsneeNKnRjh+kRQd0wisobz4nOlQ=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=BcxLJ/O+Bx+1zH0oQxKl4Y21GKnk7AjiZETeu+8Xh9G9zwlRflKA+k0HO+LXoX0Uy
         SsLAtkouP3WPPRKKsjTPbVlE7rWzBMTQ/xynOJnGLGOz8F3Qs9f7Nd+WmS1/C0/K5T
         A+2UVRRbyGrYwGlxQaOZETNnqoVitoUYU1e5hZmrrlITTG9YLjeQmS3G2ZoP1rOlaZ
         sGTTJh9hN4vucc2qiOUf8Q9uVCqkWjj0veLfvyrJuuniWALAb6xkAvPE4OQ9efvmfC
         GGJZw84B6Bf5JvaPh4naERrDg5y+aaTQpxsBoTe/sSOt78SI0pDu78S6VTn68fTKq8
         yu8P9iVWeO4ng==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] bootstrap.sh: restore configure.ac
Date:   Tue,  2 Mar 2021 11:34:58 +0100
Message-Id: <20210302103458.819043-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302103458.819043-1-hverkuil-cisco@xs4all.nl>
References: <20210302103458.819043-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfOE/rhnHDjmszu4cYYwmvRspQ1M8KiVR7C7BhBrEKx4JcjRAQTTJIU3GBSZzk/x8zvymOl0uB8NiYFrhG8Z0ZMUWp/C9KFrFbU4PaOSrK0cdDLBFsxo8
 cjiWJQik0fqqZh7XBJcZWQFQCOys3/cWOT2sarWjTqCfF3eu8Xaq+1fGueyZlEx+cDXOLZfxlnrs5uP26Q3tY8aAGtvdy6ynHFDck8akbEPGP+rc1LG84q5I
 dmjJ/DO7cOxT2YqNGG0446C1kBpbv/mqcTjj2p/Af8U=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

gettextize overwrites AM_GNU_GETTEXT_VERSION in configure.ac,
which is not what we want since we want to support older gettext
versions as well. Restore the original configure.ac on exit.

Also add set -e to exit if one of the commands fails.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 bootstrap.sh | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/bootstrap.sh b/bootstrap.sh
index 0e9eb2d4..52bb0165 100755
--- a/bootstrap.sh
+++ b/bootstrap.sh
@@ -1,6 +1,7 @@
 #!/bin/bash
 
-mkdir build-aux/ 2>/dev/null
+set -e
+mkdir -p build-aux/ 2>/dev/null
 touch build-aux/config.rpath libdvbv5-po/Makefile.in.in v4l-utils-po/Makefile.in.in
 autoreconf -vfi
 
@@ -13,6 +14,13 @@ if [ "GETTEXTIZE" != "" ]; then
 	sed "s,read dummy < /dev/tty,," < $GETTEXTIZE > ./gettextize
 	chmod 755 ./gettextize
 
+	# gettextize overwrites AM_GNU_GETTEXT_VERSION in
+	# configure.ac, which is not what we want since we want to
+	# support older gettext versions as well. Restore the
+	# original configure.ac on exit.
+	cp configure.ac configure.ac.orig
+	trap "mv configure.ac.orig configure.ac" EXIT
+
 	echo "Generating locale v4l-utils-po build files for gettext version $VER"
 	./gettextize --force --copy --no-changelog --po-dir=v4l-utils-po >/dev/null
 
-- 
2.30.1

