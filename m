Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A836E1A45C1
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 13:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgDJLjP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 07:39:15 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33838 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbgDJLjO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 07:39:14 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jMs09-0000GA-MU; Fri, 10 Apr 2020 11:39:13 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: mantis: remove redundant assignment to variable err
Date:   Fri, 10 Apr 2020 12:39:13 +0100
Message-Id: <20200410113913.14430-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/mantis/hopper_vp3028.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/mantis/hopper_vp3028.c b/drivers/media/pci/mantis/hopper_vp3028.c
index 37bd386f3ed8..ce1e8737b14b 100644
--- a/drivers/media/pci/mantis/hopper_vp3028.c
+++ b/drivers/media/pci/mantis/hopper_vp3028.c
@@ -33,7 +33,7 @@ static int vp3028_frontend_init(struct mantis_pci *mantis, struct dvb_frontend *
 {
 	struct i2c_adapter *adapter	= &mantis->adapter;
 	struct mantis_hwconfig *config	= mantis->hwconfig;
-	int err = 0;
+	int err;
 
 	mantis_gpio_set_bits(mantis, config->reset, 0);
 	msleep(100);
-- 
2.25.1

