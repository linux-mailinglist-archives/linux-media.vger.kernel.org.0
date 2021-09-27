Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C50141940B
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 14:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234265AbhI0MWG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 08:22:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:45018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234073AbhI0MWF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 08:22:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 719DE61074;
        Mon, 27 Sep 2021 12:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632745228;
        bh=jhCTgeMjDAgbXS4PhsYSF1UKTXtXCFTpi/I5crQIPYQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Kvk395jTUE93EswOaTpjw8khOLF9oZ4j5V5Hg11Q0KLOkDZZ3Bb0OTDWfO99SXd2C
         vAPojKCdaumtc3MwO0et5/x8HwLFuGVwR3BSNeknv7nw7NPaeI556r1ShAcZ6+ZZrS
         ZV3tlSOpK3xNAKsrMTFTJIYvictjp3ZDY65+Kl0yiENDOxYUoU2t2iWAaxeKql3pI4
         vihCyWv+nEyBcIagH/lvuXJl4SNiuu/yh3rjM9ZxomVj+Modduj3gCtR+kiYmgi0mG
         lDASZGYXmtwu2t6EJpmXrvPncsrjWhaFtKRJj/qdGpsYViBQ+sPNTKZnHDGHcHtATk
         KXo151FMbP4Ag==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Olivier Lorin <o.lorin@laposte.net>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH] media: gspca/gl860-mi1320: avoid -Wstring-concatenation warning
Date:   Mon, 27 Sep 2021 14:20:18 +0200
Message-Id: <20210927122024.941874-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Newer clang versions are suspicious of definitions that mix concatenated
strings with comma-separated arrays of strings, this has found real bugs
elsewhere, but this seems to be a false positive:

drivers/media/usb/gspca/gl860/gl860-mi1320.c:62:37: error: suspicious concatenation of string literals in an array initialization; did you mean to separate the elements with a comma? [-Werror,-Wstring-concatenation]
        "\xd3\x02\xd4\x28\xd5\x01\xd0\x02" "\xd1\x18\xd2\xc1"
                                           ^
                                          ,
drivers/media/usb/gspca/gl860/gl860-mi1320.c:62:2: note: place parentheses around the string literal to silence warning
        "\xd3\x02\xd4\x28\xd5\x01\xd0\x02" "\xd1\x18\xd2\xc1"

Use the extra parentheses as suggested in the warning message.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/usb/gspca/gl860/gl860-mi1320.c | 24 ++++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/gspca/gl860/gl860-mi1320.c b/drivers/media/usb/gspca/gl860/gl860-mi1320.c
index 0749fe13160f..1253eb145c99 100644
--- a/drivers/media/usb/gspca/gl860/gl860-mi1320.c
+++ b/drivers/media/usb/gspca/gl860/gl860-mi1320.c
@@ -49,44 +49,44 @@ static struct validx tbl_post_unset_alt[] = {
 	{0x0061, 0x0000}, {0x0068, 0x000d},
 };
 
-static u8 *tbl_1280[] = {
+static u8 *tbl_1280[] = {(
 	"\x0d\x80\xf1\x08\x03\x04\xf1\x00" "\x04\x05\xf1\x02\x05\x00\xf1\xf1"
 	"\x06\x00\xf1\x0d\x20\x01\xf1\x00" "\x21\x84\xf1\x00\x0d\x00\xf1\x08"
 	"\xf0\x00\xf1\x01\x34\x00\xf1\x00" "\x9b\x43\xf1\x00\xa6\x05\xf1\x00"
 	"\xa9\x04\xf1\x00\xa1\x05\xf1\x00" "\xa4\x04\xf1\x00\xae\x0a\xf1\x08"
-	,
+	), (
 	"\xf0\x00\xf1\x02\x3a\x05\xf1\xf1" "\x3c\x05\xf1\xf1\x59\x01\xf1\x47"
 	"\x5a\x01\xf1\x88\x5c\x0a\xf1\x06" "\x5d\x0e\xf1\x0a\x64\x5e\xf1\x1c"
 	"\xd2\x00\xf1\xcf\xcb\x00\xf1\x01"
-	,
+	), (
 	"\xd3\x02\xd4\x28\xd5\x01\xd0\x02" "\xd1\x18\xd2\xc1"
-};
+)};
 
-static u8 *tbl_800[] = {
+static u8 *tbl_800[] = { (
 	"\x0d\x80\xf1\x08\x03\x03\xf1\xc0" "\x04\x05\xf1\x02\x05\x00\xf1\xf1"
 	"\x06\x00\xf1\x0d\x20\x01\xf1\x00" "\x21\x84\xf1\x00\x0d\x00\xf1\x08"
 	"\xf0\x00\xf1\x01\x34\x00\xf1\x00" "\x9b\x43\xf1\x00\xa6\x05\xf1\x00"
 	"\xa9\x03\xf1\xc0\xa1\x03\xf1\x20" "\xa4\x02\xf1\x5a\xae\x0a\xf1\x08"
-	,
+	), (
 	"\xf0\x00\xf1\x02\x3a\x05\xf1\xf1" "\x3c\x05\xf1\xf1\x59\x01\xf1\x47"
 	"\x5a\x01\xf1\x88\x5c\x0a\xf1\x06" "\x5d\x0e\xf1\x0a\x64\x5e\xf1\x1c"
 	"\xd2\x00\xf1\xcf\xcb\x00\xf1\x01"
-	,
+	), (
 	"\xd3\x02\xd4\x18\xd5\x21\xd0\x02" "\xd1\x10\xd2\x59"
-};
+)};
 
-static u8 *tbl_640[] = {
+static u8 *tbl_640[] = {(
 	"\x0d\x80\xf1\x08\x03\x04\xf1\x04" "\x04\x05\xf1\x02\x07\x01\xf1\x7c"
 	"\x08\x00\xf1\x0e\x21\x80\xf1\x00" "\x0d\x00\xf1\x08\xf0\x00\xf1\x01"
 	"\x34\x10\xf1\x10\x3a\x43\xf1\x00" "\xa6\x05\xf1\x02\xa9\x04\xf1\x04"
 	"\xa7\x02\xf1\x81\xaa\x01\xf1\xe2" "\xae\x0c\xf1\x09"
-	,
+	), (
 	"\xf0\x00\xf1\x02\x39\x03\xf1\xfc" "\x3b\x04\xf1\x04\x57\x01\xf1\xb6"
 	"\x58\x02\xf1\x0d\x5c\x1f\xf1\x19" "\x5d\x24\xf1\x1e\x64\x5e\xf1\x1c"
 	"\xd2\x00\xf1\x00\xcb\x00\xf1\x01"
-	,
+	), (
 	"\xd3\x02\xd4\x10\xd5\x81\xd0\x02" "\xd1\x08\xd2\xe1"
-};
+)};
 
 static s32 tbl_sat[] = {0x25, 0x1d, 0x15, 0x0d, 0x05, 0x4d, 0x55, 0x5d, 0x2d};
 static s32 tbl_bright[] = {0, 8, 0x10, 0x20, 0x30, 0x40, 0x50, 0x60, 0x70};
-- 
2.29.2

