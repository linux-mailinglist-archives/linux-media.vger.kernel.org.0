Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACDC371C3C
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 18:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbhECQvt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 12:51:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:33124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233940AbhECQtg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 May 2021 12:49:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10FCF6188B;
        Mon,  3 May 2021 16:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620060032;
        bh=CG7ym1DwNEcBcQkVoZ/+m/j3whJpEMiPeUKGgsbvmT0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XUFjKJ9/t70Hakb0ia8Yk//zhC74nlPb1mhn6osvCDDxO+KyFTFAK65HamEs9tT+U
         0KjD7zlT1kUEgKFwlUayJ6Qpo5SEpY8xbTtPuWpUrNqU6mO0x8k2BKeKodiuBoWLkE
         y4CeN6VCfDIFtnqfXb8ZwTRzfDNgQOff6KGsEAQxp/CaMpH45rtUUQj23RxqGTx3En
         2ZqPCoOIvAapnf/ANFxQHqLxwmcjtQd7Y0/5y28uHo46RhZGuzneUGeaUC4k3tt7S2
         0exPwbTS3QxFxN+fpQnESlF7GRBqX/I+eCo4FZOIRCYatXt6Ldr8BTTq/o0XD0d1SN
         SUXSQVWoPImTQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Muhammad Usama Anjum <musamaanjum@gmail.com>,
        syzbot+889397c820fa56adf25d@syzkaller.appspotmail.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 33/57] media: em28xx: fix memory leak
Date:   Mon,  3 May 2021 12:39:17 -0400
Message-Id: <20210503163941.2853291-33-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163941.2853291-1-sashal@kernel.org>
References: <20210503163941.2853291-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Muhammad Usama Anjum <musamaanjum@gmail.com>

[ Upstream commit 0ae10a7dc8992ee682ff0b1752ff7c83d472eef1 ]

If some error occurs, URB buffers should also be freed. If they aren't
freed with the dvb here, the em28xx_dvb_fini call doesn't frees the URB
buffers as dvb is set to NULL. The function in which error occurs should
do all the cleanup for the allocations it had done.

Tested the patch with the reproducer provided by syzbot. This patch
fixes the memleak.

Reported-by: syzbot+889397c820fa56adf25d@syzkaller.appspotmail.com
Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/em28xx/em28xx-dvb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/em28xx/em28xx-dvb.c b/drivers/media/usb/em28xx/em28xx-dvb.c
index a73faf12f7e4..e1946237ac8c 100644
--- a/drivers/media/usb/em28xx/em28xx-dvb.c
+++ b/drivers/media/usb/em28xx/em28xx-dvb.c
@@ -1924,6 +1924,7 @@ static int em28xx_dvb_init(struct em28xx *dev)
 	return result;
 
 out_free:
+	em28xx_uninit_usb_xfer(dev, EM28XX_DIGITAL_MODE);
 	kfree(dvb);
 	dev->dvb = NULL;
 	goto ret;
-- 
2.30.2

