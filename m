Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCB7343D78
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 11:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhCVKIG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 06:08:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:48360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229866AbhCVKHz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 06:07:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B23C6196C;
        Mon, 22 Mar 2021 10:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616407675;
        bh=QNvSAb0YWXjz9Tz19Zjo9adT2JLPjr6b/zH6SuZQ45A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qK+hSyBYfnTgDBQE+4lAG9iOEi/CnkkmqpzReSZtIsyBLVOopiKDnsuzVu7tkWADW
         nMHO8Ion61mfwYxuWLEcHZczHomIfGbQf+o2pyVZPkzNTE/c/JkDE6qQAM56w1poQL
         yr0UliD/S6fJ8hjr1V6oQ+k/+arYP0Id1Fo0xm6RVA0zQGirvYRCTIWpdaXoy/Ck8u
         SyCEJXjghHPtSAdmO74Cz6n0gEFSgAtZ+nR978a31RAGrVTFZ49hq+C3dPoPNxaMH6
         hY7F0WBLZfbDEcIhdIu7eaH+ZzgEf6rDvY3WLlg74J2l1ioPxrPDncoUrK05p4AOZK
         8xeT3P1+zSt3Q==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Sean Young <sean@mess.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: dvb-usb: avoid -Wempty-body warnings
Date:   Mon, 22 Mar 2021 11:07:25 +0100
Message-Id: <20210322100743.3880256-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322100743.3880256-1-arnd@kernel.org>
References: <20210322100743.3880256-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Building with 'make W=1' shows many warnings -Wempty-body warnings like

drivers/media/usb/dvb-usb/vp702x-fe.c: In function 'vp702x_fe_set_frontend':
drivers/media/usb/dvb-usb/vp702x-fe.c:190:46: error: suggest braces around empty body in an 'else' statement [-Werror=empty-body]
  190 |                 deb_fe("tuning succeeded.\n");
drivers/media/usb/dvb-usb/dtt200u.c: In function 'dtt200u_rc_query':
drivers/media/usb/dvb-usb/dtt200u.c:124:58: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
  124 |                 deb_info("st->data: %*ph\n", 5, st->data);
drivers/media/usb/dvb-usb/m920x.c: In function 'm920x_rc_query':
drivers/media/usb/dvb-usb/m920x.c:207:58: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
  207 |                 deb("Unknown rc key %02x\n", rc_state[1]);

Change the empty dprintk() macros to no_printk(), which avoids this
warning and adds format string checking.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/usb/dvb-usb/dvb-usb.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb.h b/drivers/media/usb/dvb-usb/dvb-usb.h
index 2b8ad2bde8a4..42f4d2fece8b 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb.h
+++ b/drivers/media/usb/dvb-usb/dvb-usb.h
@@ -38,8 +38,8 @@
 }
 #define DVB_USB_DEBUG_STATUS
 #else
-#define dprintk(args...)
-#define debug_dump(b,l,func)
+#define dprintk(var,level,args...) no_printk(args)
+#define debug_dump(b,l,func) do { } while (0)
 
 #define DVB_USB_DEBUG_STATUS " (debugging is not enabled)"
 
-- 
2.29.2

