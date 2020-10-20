Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D1E293EF7
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 16:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408377AbgJTOrB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 10:47:01 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:48687 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408360AbgJTOq7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 10:46:59 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kUsue-0002IT-6H; Tue, 20 Oct 2020 14:46:56 +0000
From:   Colin King <colin.king@canonical.com>
To:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging: rkisp1: rsz: make const array static, makes object smaller
Date:   Tue, 20 Oct 2020 15:46:55 +0100
Message-Id: <20201020144655.53251-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array dev_names on the stack but instead it
static. Makes the object code smaller by 15 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  17091	   2648	     64	  19803	   4d5b	media/rkisp1/rkisp1-resizer.o

After:
   text	   data	    bss	    dec	    hex	filename
  17012	   2712	     64	  19788	   4d4c	media/rkisp1/rkisp1-resizer.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index 1687d82e6c68..7ca5b47c5bf5 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -763,8 +763,10 @@ static void rkisp1_rsz_unregister(struct rkisp1_resizer *rsz)
 
 static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
 {
-	const char * const dev_names[] = {RKISP1_RSZ_MP_DEV_NAME,
-					  RKISP1_RSZ_SP_DEV_NAME};
+	static const char * const dev_names[] = {
+		RKISP1_RSZ_MP_DEV_NAME,
+		RKISP1_RSZ_SP_DEV_NAME
+	};
 	struct media_pad *pads = rsz->pads;
 	struct v4l2_subdev *sd = &rsz->sd;
 	int ret;
-- 
2.27.0

