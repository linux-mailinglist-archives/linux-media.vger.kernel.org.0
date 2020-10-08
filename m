Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C256C287DAE
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 23:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbgJHVM2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 17:12:28 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40919 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728464AbgJHVM2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 17:12:28 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kQdD5-0006NN-Mn; Thu, 08 Oct 2020 21:12:23 +0000
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Julian Scheel <julian@jusst.de>, linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: tm6000: Fix sizeof() mismatches
Date:   Thu,  8 Oct 2020 22:12:23 +0100
Message-Id: <20201008211223.202670-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The are two instances of sizeof() being used incorrectly. The
sizeof(void *) is incorrect because urb_buffer is a char ** pointer,
fix this by using sizeof(*dev->urb_buffer).  The sizeof(dma_addr_t *)
is incorrect, it should be sizeof(*dev->urb_dma), which is a dma_addr_t
and not a dma_addr_t *.  This errors did not cause any issues because
it just so happens the sizes are the same.

Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
Fixes: 16427faf2867 ("[media] tm6000: Add parameter to keep urb bufs allocated")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/tm6000/tm6000-video.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/tm6000/tm6000-video.c b/drivers/media/usb/tm6000/tm6000-video.c
index bfba06ea60e9..d6400c17e34f 100644
--- a/drivers/media/usb/tm6000/tm6000-video.c
+++ b/drivers/media/usb/tm6000/tm6000-video.c
@@ -461,11 +461,12 @@ static int tm6000_alloc_urb_buffers(struct tm6000_core *dev)
 	if (dev->urb_buffer)
 		return 0;
 
-	dev->urb_buffer = kmalloc_array(num_bufs, sizeof(void *), GFP_KERNEL);
+	dev->urb_buffer = kmalloc_array(num_bufs, sizeof(*dev->urb_buffer),
+					GFP_KERNEL);
 	if (!dev->urb_buffer)
 		return -ENOMEM;
 
-	dev->urb_dma = kmalloc_array(num_bufs, sizeof(dma_addr_t *),
+	dev->urb_dma = kmalloc_array(num_bufs, sizeof(*dev->urb_dma),
 				     GFP_KERNEL);
 	if (!dev->urb_dma)
 		return -ENOMEM;
-- 
2.27.0

