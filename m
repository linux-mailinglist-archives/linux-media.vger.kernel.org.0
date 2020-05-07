Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68AE81C9D96
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 23:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgEGVne (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 17:43:34 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43493 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbgEGVnd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 May 2020 17:43:33 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jWoIl-0008EL-ID; Thu, 07 May 2020 21:43:31 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: mantis_dvb: remove redundant initialization to variable result
Date:   Thu,  7 May 2020 22:43:31 +0100
Message-Id: <20200507214331.65790-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable result is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/mantis/mantis_dvb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/mantis/mantis_dvb.c b/drivers/media/pci/mantis/mantis_dvb.c
index e78ca1f26e68..2da94be5b373 100644
--- a/drivers/media/pci/mantis/mantis_dvb.c
+++ b/drivers/media/pci/mantis/mantis_dvb.c
@@ -135,7 +135,7 @@ static int mantis_dvb_stop_feed(struct dvb_demux_feed *dvbdmxfeed)
 int mantis_dvb_init(struct mantis_pci *mantis)
 {
 	struct mantis_hwconfig *config = mantis->hwconfig;
-	int result = -1;
+	int result;
 
 	dprintk(MANTIS_DEBUG, 1, "dvb_register_adapter");
 
-- 
2.25.1

