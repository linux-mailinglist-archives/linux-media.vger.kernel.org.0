Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18678344C17
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 17:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbhCVQqb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 12:46:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:35974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230403AbhCVQqM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 12:46:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D3626198E;
        Mon, 22 Mar 2021 16:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616431571;
        bh=Qyt24ho4lnH+0THV75bpg4f9WQqs21XxQUpWuZA4LmY=;
        h=From:To:Cc:Subject:Date:From;
        b=vNhan/75GMHamKHS0e07D2Y5jF8Q3Y0HWfN5yDL81bJEgH5Nj49QNo0m+ZJJAFxzk
         7srFyAoQ1ff9Kr9ucp7owknik8/WAAC+P/TuWvSIhsIcJx8ziz7G8GLLAWqHg6GxfG
         yLkx1tAMYKOKCfMdE9E3dr90IRooAm1cFDbrK3jsvRcKstJZEBi8TKuQSSsPZvlq3F
         aWAigTmniaXPFrOzgotb8oyMxiOhsgK//cwcp0uv2LmwUhVB8+CmGcjTYnkK/31zHY
         QnjILAoFlnv7JFaIy7KWEzyeex8NYD1TFG0lmVBoxJF1kqqIqRxxbBlzPoPl1CwKhp
         I2oU4hJU9L4YQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Patrick Boettcher <pb@linuxtv.org>,
        Johannes Stezenbach <js@linuxtv.org>,
        Andrew Morton <akpm@osdl.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: dvb-usb-remote: fix dvb_usb_nec_rc_key_to_event type mismatch
Date:   Mon, 22 Mar 2021 17:46:00 +0100
Message-Id: <20210322164607.925572-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

gcc-11 warns about the prototype not exactly matching the function
definition:

drivers/media/usb/dvb-usb/dvb-usb-remote.c:363:20: error: argument 2 of type ‘u8[5]’ {aka ‘unsigned char[5]’} with mismatched bound [-Werror=array-parameter=]
  363 |                 u8 keybuf[5], u32 *event, int *state)
      |                 ~~~^~~~~~~~~
In file included from drivers/media/usb/dvb-usb/dvb-usb-common.h:13,
                 from drivers/media/usb/dvb-usb/dvb-usb-remote.c:9:
drivers/media/usb/dvb-usb/dvb-usb.h:490:65: note: previously declared as ‘u8[]’ {aka ‘unsigned char[]’}
  490 | extern int dvb_usb_nec_rc_key_to_event(struct dvb_usb_device *, u8[], u32 *, int *);
      |                                                                 ^~~~

Fixes: 776338e121b9 ("[PATCH] dvb: Add generalized dvb-usb driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/usb/dvb-usb/dvb-usb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb.h b/drivers/media/usb/dvb-usb/dvb-usb.h
index 52407fc28c03..42f4d2fece8b 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb.h
+++ b/drivers/media/usb/dvb-usb/dvb-usb.h
@@ -487,7 +487,7 @@ extern int __must_check
 dvb_usb_generic_write(struct dvb_usb_device *, u8 *, u16);
 
 /* commonly used remote control parsing */
-extern int dvb_usb_nec_rc_key_to_event(struct dvb_usb_device *, u8[], u32 *, int *);
+extern int dvb_usb_nec_rc_key_to_event(struct dvb_usb_device *, u8[5], u32 *, int *);
 
 /* commonly used firmware download types and function */
 struct hexline {
-- 
2.29.2

