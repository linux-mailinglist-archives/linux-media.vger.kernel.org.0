Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 118271AB3F8
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 00:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387443AbgDOWyT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Apr 2020 18:54:19 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53107 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgDOWyO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Apr 2020 18:54:14 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1jOqv5-0003nk-PA; Wed, 15 Apr 2020 22:54:11 +0000
From:   Colin King <colin.king@canonical.com>
To:     Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: davinci: remove redundant assignment to pointer 'common'
Date:   Wed, 15 Apr 2020 23:54:11 +0100
Message-Id: <20200415225411.1565933-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer 'common' is being assigned with a value that is never read,
the assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/davinci/vpif_display.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/davinci/vpif_display.c b/drivers/media/platform/davinci/vpif_display.c
index ead14c49d4f5..7d55fd45240e 100644
--- a/drivers/media/platform/davinci/vpif_display.c
+++ b/drivers/media/platform/davinci/vpif_display.c
@@ -1225,7 +1225,6 @@ static int vpif_probe_complete(void)
 probe_out:
 	for (k = 0; k < j; k++) {
 		ch = vpif_obj.dev[k];
-		common = &ch->common[k];
 		video_unregister_device(&ch->video_dev);
 	}
 	return err;
-- 
2.25.1

