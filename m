Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0434A3027E
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 20:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfE3S71 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 14:59:27 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54917 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbfE3S71 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 14:59:27 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hWQGr-00049T-64; Thu, 30 May 2019 18:59:25 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: cx23885: remove redundant assignment to err
Date:   Thu, 30 May 2019 19:59:24 +0100
Message-Id: <20190530185924.9206-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is assigned with a value that is never read and
it is re-assigned a new value later on.  The assignment is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/cx23885/cx23885-dvb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-dvb.c b/drivers/media/pci/cx23885/cx23885-dvb.c
index e2e63f05645e..13595fcb6a40 100644
--- a/drivers/media/pci/cx23885/cx23885-dvb.c
+++ b/drivers/media/pci/cx23885/cx23885-dvb.c
@@ -2657,8 +2657,6 @@ int cx23885_dvb_register(struct cx23885_tsport *port)
 			dev->pci_bus,
 			dev->pci_slot);
 
-		err = -ENODEV;
-
 		/* dvb stuff */
 		/* We have to init the queue for each frontend on a port. */
 		pr_info("%s: cx23885 based dvb card\n", dev->name);
-- 
2.20.1

