Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6EB6676A5
	for <lists+linux-media@lfdr.de>; Sat, 13 Jul 2019 00:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728160AbfGLWrD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 18:47:03 -0400
Received: from gofer.mess.org ([88.97.38.141]:36655 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728152AbfGLWrD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 18:47:03 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id CB0E4600B4; Fri, 12 Jul 2019 23:47:00 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Frank Wunderlich <frank-w@public-files.de>,
        Sean Wang <sean.wang@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 2/3] media: rc: remove unused #define RC_PROTO_BIT_ALL
Date:   Fri, 12 Jul 2019 23:46:59 +0100
Message-Id: <20190712224700.11285-2-sean@mess.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190712224700.11285-1-sean@mess.org>
References: <20190712224700.11285-1-sean@mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This lists all the protocols that the kernel knows about, however there
are no users.

Signed-off-by: Sean Young <sean@mess.org>
---
 include/media/rc-map.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/include/media/rc-map.h b/include/media/rc-map.h
index bebd3c4c6338..3a7f8728f6ec 100644
--- a/include/media/rc-map.h
+++ b/include/media/rc-map.h
@@ -38,22 +38,6 @@
 #define RC_PROTO_BIT_RCMM32		BIT_ULL(RC_PROTO_RCMM32)
 #define RC_PROTO_BIT_XBOX_DVD		BIT_ULL(RC_PROTO_XBOX_DVD)
 
-#define RC_PROTO_BIT_ALL \
-			(RC_PROTO_BIT_UNKNOWN | RC_PROTO_BIT_OTHER | \
-			 RC_PROTO_BIT_RC5 | RC_PROTO_BIT_RC5X_20 | \
-			 RC_PROTO_BIT_RC5_SZ | RC_PROTO_BIT_JVC | \
-			 RC_PROTO_BIT_SONY12 | RC_PROTO_BIT_SONY15 | \
-			 RC_PROTO_BIT_SONY20 | RC_PROTO_BIT_NEC | \
-			 RC_PROTO_BIT_NECX | RC_PROTO_BIT_NEC32 | \
-			 RC_PROTO_BIT_SANYO | \
-			 RC_PROTO_BIT_MCIR2_KBD | RC_PROTO_BIT_MCIR2_MSE | \
-			 RC_PROTO_BIT_RC6_0 | RC_PROTO_BIT_RC6_6A_20 | \
-			 RC_PROTO_BIT_RC6_6A_24 | RC_PROTO_BIT_RC6_6A_32 | \
-			 RC_PROTO_BIT_RC6_MCE | RC_PROTO_BIT_SHARP | \
-			 RC_PROTO_BIT_XMP | RC_PROTO_BIT_CEC | \
-			 RC_PROTO_BIT_IMON | RC_PROTO_BIT_RCMM12 | \
-			 RC_PROTO_BIT_RCMM24 | RC_PROTO_BIT_RCMM32 | \
-			 RC_PROTO_BIT_XBOX_DVD)
 /* All rc protocols for which we have decoders */
 #define RC_PROTO_BIT_ALL_IR_DECODER \
 			(RC_PROTO_BIT_RC5 | RC_PROTO_BIT_RC5X_20 | \
-- 
2.21.0

