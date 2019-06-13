Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D84FA43FBE
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 18:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbfFMQAA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 12:00:00 -0400
Received: from gofer.mess.org ([88.97.38.141]:58595 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731475AbfFMIt3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 04:49:29 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id BCA8A603E8; Thu, 13 Jun 2019 09:49:26 +0100 (BST)
Date:   Thu, 13 Jun 2019 09:49:26 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Takashi Kanamaru <neuralassembly@gmail.com>
Subject: [PATCH] media: rc: IR signal for Panasonic air conditioner too long
 sequences is too small
Message-ID: <20190613084926.bjxv2vdkp3qqpkuu@gofer.mess.org>
References: <CAKL8oB_qPGVXd3MCj=f1Lzh02ifGzYTS2YAD77s2MY2LAnc+1A@mail.gmail.com>
 <20190612150132.iemhbronjjaonpt2@gofer.mess.org>
 <CAKL8oB-KxsGxHAUac7sYBf-Gs4UkAPVkXg75LwwVbut9GkQ-sQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKL8oB-KxsGxHAUac7sYBf-Gs4UkAPVkXg75LwwVbut9GkQ-sQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IR signal to control the Panasonic ACXA75C00600 air conditioner has
439 pulse/spaces. Increase limit to make it possible to transmit signal.

Reported-by: Takashi Kanamaru <neuralassembly@gmail.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/lirc_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index 10830605c734..f078f8a3aec8 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -19,7 +19,7 @@
 #include "rc-core-priv.h"
 #include <uapi/linux/lirc.h>
 
-#define LIRCBUF_SIZE	256
+#define LIRCBUF_SIZE	1024
 
 static dev_t lirc_base_dev;
 
-- 
2.20.1

