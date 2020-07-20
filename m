Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0C20226DFD
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 20:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730436AbgGTSKm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 14:10:42 -0400
Received: from turbocat.net ([88.99.82.50]:43378 "EHLO mail.turbocat.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729172AbgGTSKl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 14:10:41 -0400
Received: from hps2020.home.selasky.org (unknown [178.17.145.105])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail.turbocat.net (Postfix) with ESMTPSA id B9FAE260503
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 20:10:39 +0200 (CEST)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Petter Selasky <hps@selasky.org>
Subject: [PATCH] [MEDIA] Use standard integer types
Message-ID: <4c32e020-1da4-5fbd-a445-121d361bd1e0@selasky.org>
Date:   Mon, 20 Jul 2020 20:10:18 +0200
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes compilation under FreeBSD.

Signed-off-by: Hans Petter Selasky <hps@selasky.org>
---
  utils/common/keymap.h | 10 ++++++----
  1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/utils/common/keymap.h b/utils/common/keymap.h
index 99833827..dc198bc1 100644
--- a/utils/common/keymap.h
+++ b/utils/common/keymap.h
@@ -2,6 +2,8 @@
  #ifndef __KEYMAP_H
  #define __KEYMAP_H

+#include <stdint.h>
+
  struct keymap {
  	struct keymap *next;
  	char *name;
@@ -20,16 +22,16 @@ struct protocol_param {

  struct scancode_entry {
  	struct scancode_entry *next;
-	u_int64_t scancode;
+	uint64_t scancode;
  	char *keycode;
  };

  struct raw_entry {
  	struct raw_entry *next;
-	u_int64_t scancode;
-	u_int32_t raw_length;
+	uint64_t scancode;
+	uint32_t raw_length;
  	char *keycode;
-	u_int32_t raw[1];
+	uint32_t raw[1];
  };

  void free_keymap(struct keymap *map);
-- 
2.27.0
