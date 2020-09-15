Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D942326B220
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 00:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbgIOWl1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 18:41:27 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:47965 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbgIOP5x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 11:57:53 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kID05-0004Cu-2K; Tue, 15 Sep 2020 15:36:09 +0000
From:   Colin King <colin.king@canonical.com>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxim Levitsky <maximlevitsky@gmail.com>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: rc: fix check on dev->min_timeout for LIRC_GET_MIN_TIMEOUT ioctl
Date:   Tue, 15 Sep 2020 16:36:08 +0100
Message-Id: <20200915153608.35154-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the LIRC_GET_MIN_TIMEOUT is checking for a null dev->max_timeout
and then accessing dev->min_timeout, hence we may have a potential null
pointer dereference issue.  This looks like a cut-n-paste typo, fix it
by checking on dev->min_timeout before accessing it.

Addresses-Coverity: ("Copy-paste error")
Fixes: e589333f346b ("V4L/DVB: IR: extend interfaces to support more device settings")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/rc/lirc_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index 220363b9a868..d230c21e1d31 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -533,7 +533,7 @@ static long lirc_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 	/* Generic timeout support */
 	case LIRC_GET_MIN_TIMEOUT:
-		if (!dev->max_timeout)
+		if (!dev->min_timeout)
 			ret = -ENOTTY;
 		else
 			val = dev->min_timeout;
-- 
2.27.0

