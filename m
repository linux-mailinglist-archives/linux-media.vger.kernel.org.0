Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E70878091
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2019 19:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbfG1RL3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Jul 2019 13:11:29 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:34730 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfG1RL3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Jul 2019 13:11:29 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hrmhh-000484-LW; Sun, 28 Jul 2019 17:11:25 +0000
From:   Colin King <colin.king@canonical.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: vsp1: fix memory leak of dl on error return path
Date:   Sun, 28 Jul 2019 18:11:24 +0100
Message-Id: <20190728171124.14202-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the call vsp1_dl_body_get fails and returns null the
error return path leaks the allocation of dl. Fix this by kfree'ing
dl before returning.

Addresses-Coverity: ("Resource leak")
Fixes: 5d7936b8e27d ("media: vsp1: Convert display lists to use new body pool")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/vsp1/vsp1_dl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vsp1/vsp1_dl.c b/drivers/media/platform/vsp1/vsp1_dl.c
index 104b6f514536..d7b43037e500 100644
--- a/drivers/media/platform/vsp1/vsp1_dl.c
+++ b/drivers/media/platform/vsp1/vsp1_dl.c
@@ -557,8 +557,10 @@ static struct vsp1_dl_list *vsp1_dl_list_alloc(struct vsp1_dl_manager *dlm)
 
 	/* Get a default body for our list. */
 	dl->body0 = vsp1_dl_body_get(dlm->pool);
-	if (!dl->body0)
+	if (!dl->body0) {
+		kfree(dl);
 		return NULL;
+	}
 
 	header_offset = dl->body0->max_entries * sizeof(*dl->body0->entries);
 
-- 
2.20.1

