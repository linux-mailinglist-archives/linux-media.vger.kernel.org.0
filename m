Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 858A7CDE83
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 11:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727411AbfJGJwp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 05:52:45 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42189 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfJGJwp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 05:52:45 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iHPh3-0007mO-7E; Mon, 07 Oct 2019 09:52:41 +0000
From:   Colin King <colin.king@canonical.com>
To:     Andy Walls <awalls@md.metrocast.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: cx18: make array mapping static, makes object smaller
Date:   Mon,  7 Oct 2019 10:52:40 +0100
Message-Id: <20191007095240.29540-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array mapping on the stack but instead make it
static. Makes the object code smaller by 79 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  27572	   2096	      0	  29668	   73e4	drivers/media/pci/cx18/cx18-ioctl.o

After:
   text	   data	    bss	    dec	    hex	filename
  27429	   2160	      0	  29589	   7395	drivers/media/pci/cx18/cx18-ioctl.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/cx18/cx18-ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index 85f3e7307538..fa57e12f2ac8 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -664,7 +664,7 @@ static int _cx18_process_idx_data(struct cx18_buffer *buf,
 	struct cx18_enc_idx_entry *e_buf;
 
 	/* Frame type lookup: 1=I, 2=P, 4=B */
-	const int mapping[8] = {
+	static const int mapping[8] = {
 		-1, V4L2_ENC_IDX_FRAME_I, V4L2_ENC_IDX_FRAME_P,
 		-1, V4L2_ENC_IDX_FRAME_B, -1, -1, -1
 	};
-- 
2.20.1

