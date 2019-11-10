Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3F37F6628
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 04:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbfKJCnO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 21:43:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:40758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728162AbfKJCnN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Nov 2019 21:43:13 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C63E215EA;
        Sun, 10 Nov 2019 02:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573353793;
        bh=0V0ylmDejaYia5CRLo0lS05lj+Q0a8zKivPVI6lYOYA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LDlVDM0YtsfXONP7fLKouQaIr6YcefwpDvZw32Y0fkS4QOiFpXf5SsEiaEeLX/XbH
         /1l5oz706956S5gmj7WXVw0W1gm5PQrNO3DpqQrz1grvVMKkn1ruPfMl04PDa0Z5wX
         ukG4CEBbSt8tAgvpplupbdE7fkE+jP5kPl3Hm2AQ=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jia-Ju Bai <baijiaju1990@gmail.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 093/191] media: pci: ivtv: Fix a sleep-in-atomic-context bug in ivtv_yuv_init()
Date:   Sat,  9 Nov 2019 21:38:35 -0500
Message-Id: <20191110024013.29782-93-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110024013.29782-1-sashal@kernel.org>
References: <20191110024013.29782-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jia-Ju Bai <baijiaju1990@gmail.com>

[ Upstream commit 8d11eb847de7d89c2754988c944d51a4f63e219b ]

The driver may sleep in a interrupt handler.

The function call paths (from bottom to top) in Linux-4.16 are:

[FUNC] kzalloc(GFP_KERNEL)
drivers/media/pci/ivtv/ivtv-yuv.c, 938:
	kzalloc in ivtv_yuv_init
drivers/media/pci/ivtv/ivtv-yuv.c, 960:
	ivtv_yuv_init in ivtv_yuv_next_free
drivers/media/pci/ivtv/ivtv-yuv.c, 1126:
	ivtv_yuv_next_free in ivtv_yuv_setup_stream_frame
drivers/media/pci/ivtv/ivtv-irq.c, 827:
	ivtv_yuv_setup_stream_frame in ivtv_irq_dec_data_req
drivers/media/pci/ivtv/ivtv-irq.c, 1013:
	ivtv_irq_dec_data_req in ivtv_irq_handler

To fix this bug, GFP_KERNEL is replaced with GFP_ATOMIC.

This bug is found by my static analysis tool DSAC.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/pci/ivtv/ivtv-yuv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/ivtv/ivtv-yuv.c b/drivers/media/pci/ivtv/ivtv-yuv.c
index 44936d6d7c396..1380474519f2b 100644
--- a/drivers/media/pci/ivtv/ivtv-yuv.c
+++ b/drivers/media/pci/ivtv/ivtv-yuv.c
@@ -935,7 +935,7 @@ static void ivtv_yuv_init(struct ivtv *itv)
 	}
 
 	/* We need a buffer for blanking when Y plane is offset - non-fatal if we can't get one */
-	yi->blanking_ptr = kzalloc(720 * 16, GFP_KERNEL|__GFP_NOWARN);
+	yi->blanking_ptr = kzalloc(720 * 16, GFP_ATOMIC|__GFP_NOWARN);
 	if (yi->blanking_ptr) {
 		yi->blanking_dmaptr = pci_map_single(itv->pdev, yi->blanking_ptr, 720*16, PCI_DMA_TODEVICE);
 	} else {
-- 
2.20.1

