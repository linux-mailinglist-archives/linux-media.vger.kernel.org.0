Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B882CBF8B
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 15:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgLBO1A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 09:27:00 -0500
Received: from retiisi.eu ([95.216.213.190]:59408 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727629AbgLBO1A (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 09:27:00 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 42D69634C87;
        Wed,  2 Dec 2020 16:24:08 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 1/2] Documentation: ccs: Rename ccs-regs.txt as ccs-regs.asc
Date:   Wed,  2 Dec 2020 16:22:10 +0200
Message-Id: <20201202142211.10305-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201202142211.10305-1-sakari.ailus@linux.intel.com>
References: <20201202142211.10305-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As documentation used to be in .txt files before converting to ReST,
rename ccs-regs.txt to avoid it being taken as documentation that
pre-dates ReST conversion and so target for further conversion to ReST.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/drivers/ccs/{ccs-regs.txt => ccs-regs.asc}          | 0
 Documentation/driver-api/media/drivers/ccs/ccs.rst            | 4 ++--
 Documentation/driver-api/media/drivers/ccs/mk-ccs-regs        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename Documentation/driver-api/media/drivers/ccs/{ccs-regs.txt => ccs-regs.asc} (100%)

diff --git a/Documentation/driver-api/media/drivers/ccs/ccs-regs.txt b/Documentation/driver-api/media/drivers/ccs/ccs-regs.asc
similarity index 100%
rename from Documentation/driver-api/media/drivers/ccs/ccs-regs.txt
rename to Documentation/driver-api/media/drivers/ccs/ccs-regs.asc
diff --git a/Documentation/driver-api/media/drivers/ccs/ccs.rst b/Documentation/driver-api/media/drivers/ccs/ccs.rst
index 9164c9fa8b42..f49e971f2d92 100644
--- a/Documentation/driver-api/media/drivers/ccs/ccs.rst
+++ b/Documentation/driver-api/media/drivers/ccs/ccs.rst
@@ -59,7 +59,7 @@ effect in device timing and likely also in power consumption.
 Register definition generator
 -----------------------------
 
-The ccs-regs.txt file contains MIPI CCS register definitions that are used
+The ccs-regs.asc file contains MIPI CCS register definitions that are used
 to produce C source code files for definitions that can be better used by
 programs written in C language. As there are many dependencies between the
 produced files, please do not modify them manually as it's error-prone and
@@ -77,6 +77,6 @@ definitions:
 		-e drivers/media/i2c/ccs/ccs-regs.h \
 		-L drivers/media/i2c/ccs/ccs-limits.h \
 		-l drivers/media/i2c/ccs/ccs-limits.c \
-		-c Documentation/driver-api/media/drivers/ccs/ccs-regs.txt
+		-c Documentation/driver-api/media/drivers/ccs/ccs-regs.asc
 
 **Copyright** |copy| 2020 Intel Corporation
diff --git a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
index 3d6a2a7aac3a..6668deaf2f19 100755
--- a/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
+++ b/Documentation/driver-api/media/drivers/ccs/mk-ccs-regs
@@ -5,7 +5,7 @@
 use Getopt::Long qw(:config no_ignore_case);
 use File::Basename;
 
-my $ccsregs = "ccs-regs.txt";
+my $ccsregs = "ccs-regs.asc";
 my $header;
 my $regarray;
 my $limitc;
@@ -27,7 +27,7 @@ if (defined $help) {
 	print <<EOH
 $0 - Create CCS register definitions for C
 
-usage: $0 -c ccs-regs.txt -e header -r regarray -l limit-c -L limit-header [-k]
+usage: $0 -c ccs-regs.asc -e header -r regarray -l limit-c -L limit-header [-k]
 
 	-c ccs register file
 	-e header file name
-- 
2.27.0

