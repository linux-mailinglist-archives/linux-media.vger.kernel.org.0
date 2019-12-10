Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 378831199BF
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2019 22:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbfLJVIK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Dec 2019 16:08:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:55218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727789AbfLJVIJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Dec 2019 16:08:09 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 311D620652;
        Tue, 10 Dec 2019 21:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576012088;
        bh=NTLGjjrKDMXOJHDqU/SElGsTPONZ0OyXok4rT2tYV9Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ojxn/sHaiKidI348cjLqGsIr4rbB++Jcf03Q95dmFP2dijnxe8vCGIwRvylfZorVc
         jHKfrpxzJE3tk1opro7xfazJ69SKiFc9clVWXt0bCkLJzhI9N3Y5HQwk0dnZfq1Z99
         5cseljFvssmsE4Bv87UFO/r6R7djT/B59QBkoozc=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yang Yingliang <yangyingliang@huawei.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 066/350] media: flexcop-usb: fix NULL-ptr deref in flexcop_usb_transfer_init()
Date:   Tue, 10 Dec 2019 16:02:51 -0500
Message-Id: <20191210210735.9077-27-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yang Yingliang <yangyingliang@huawei.com>

[ Upstream commit 649cd16c438f51d4cd777e71ca1f47f6e0c5e65d ]

If usb_set_interface() failed, iface->cur_altsetting will
not be assigned and it will be used in flexcop_usb_transfer_init()
It may lead a NULL pointer dereference.

Check usb_set_interface() return value in flexcop_usb_init()
and return failed to avoid using this NULL pointer.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Signed-off-by: Sean Young <sean@mess.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 1a801dc286f85..d1331f8281082 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -504,7 +504,13 @@ static int flexcop_usb_transfer_init(struct flexcop_usb *fc_usb)
 static int flexcop_usb_init(struct flexcop_usb *fc_usb)
 {
 	/* use the alternate setting with the larges buffer */
-	usb_set_interface(fc_usb->udev,0,1);
+	int ret = usb_set_interface(fc_usb->udev, 0, 1);
+
+	if (ret) {
+		err("set interface failed.");
+		return ret;
+	}
+
 	switch (fc_usb->udev->speed) {
 	case USB_SPEED_LOW:
 		err("cannot handle USB speed because it is too slow.");
-- 
2.20.1

