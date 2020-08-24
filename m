Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E14DB2501AF
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 18:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgHXQFW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 12:05:22 -0400
Received: from gofer.mess.org ([88.97.38.141]:51663 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727036AbgHXQEn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 12:04:43 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id A4155C6416; Mon, 24 Aug 2020 17:04:39 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: rc: rename lirc char dev region to "lirc"
Date:   Mon, 24 Aug 2020 17:04:38 +0100
Message-Id: <20200824160439.29588-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

BaseRemoteCtl is not descriptive.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/lirc_dev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index 583e4f32a0da..bea52a2fae2b 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -811,8 +811,7 @@ int __init lirc_dev_init(void)
 		return PTR_ERR(lirc_class);
 	}
 
-	retval = alloc_chrdev_region(&lirc_base_dev, 0, RC_DEV_MAX,
-				     "BaseRemoteCtl");
+	retval = alloc_chrdev_region(&lirc_base_dev, 0, RC_DEV_MAX, "lirc");
 	if (retval) {
 		class_destroy(lirc_class);
 		pr_err("alloc_chrdev_region failed\n");
-- 
2.26.2

