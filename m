Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB17488B16
	for <lists+linux-media@lfdr.de>; Sat, 10 Aug 2019 13:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfHJLpA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 10 Aug 2019 07:45:00 -0400
Received: from gofer.mess.org ([88.97.38.141]:55415 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726101AbfHJLpA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 10 Aug 2019 07:45:00 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id BD61C61BFD; Sat, 10 Aug 2019 12:44:58 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Shuah Khan <shuah@kernel.org>
Subject: [PATCH 3/3] selftests: ir: fix ir_loopback test failure
Date:   Sat, 10 Aug 2019 12:44:58 +0100
Message-Id: <20190810114458.8883-3-sean@mess.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190810114458.8883-1-sean@mess.org>
References: <20190810114458.8883-1-sean@mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The decoder is called rc-mm, not rcmm. This was renamed late in the cycle
so this bug crept in.

Cc: Shuah Khan <shuah@kernel.org>
Signed-off-by: Sean Young <sean@mess.org>
---
 tools/testing/selftests/ir/ir_loopback.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/ir/ir_loopback.c b/tools/testing/selftests/ir/ir_loopback.c
index e700e09e3682..af7f9c7d59bc 100644
--- a/tools/testing/selftests/ir/ir_loopback.c
+++ b/tools/testing/selftests/ir/ir_loopback.c
@@ -54,9 +54,9 @@ static const struct {
 	{ RC_PROTO_RC6_MCE, "rc-6-mce", 0x00007fff, "rc-6" },
 	{ RC_PROTO_SHARP, "sharp", 0x1fff, "sharp" },
 	{ RC_PROTO_IMON, "imon", 0x7fffffff, "imon" },
-	{ RC_PROTO_RCMM12, "rcmm-12", 0x00000fff, "rcmm" },
-	{ RC_PROTO_RCMM24, "rcmm-24", 0x00ffffff, "rcmm" },
-	{ RC_PROTO_RCMM32, "rcmm-32", 0xffffffff, "rcmm" },
+	{ RC_PROTO_RCMM12, "rcmm-12", 0x00000fff, "rc-mm" },
+	{ RC_PROTO_RCMM24, "rcmm-24", 0x00ffffff, "rc-mm" },
+	{ RC_PROTO_RCMM32, "rcmm-32", 0xffffffff, "rc-mm" },
 };
 
 int lirc_open(const char *rc)
-- 
2.21.0

