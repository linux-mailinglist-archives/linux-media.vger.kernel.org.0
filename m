Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A393B3EC1B8
	for <lists+linux-media@lfdr.de>; Sat, 14 Aug 2021 11:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237717AbhHNJk4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Aug 2021 05:40:56 -0400
Received: from m12-16.163.com ([220.181.12.16]:60203 "EHLO m12-16.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236824AbhHNJkz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Aug 2021 05:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=AzeSz
        3uZrMbZamPLfM5iLsTAOlY+hBCKG5RM65dBOEY=; b=IxtGejPi7G3q/dhGs1Eoq
        2v8ARbnLp1i+wyUcCmwXLvMrfrE/LLohbiUDQUD+L8y+U1dRXIcCIG303sPRCTdE
        3h1u2p/fI6N6/03QvP6mDXu7a/pc2r0r8x37HaZP1wKAyGyA6iuHvLZ7gCU080B8
        YHGvQd+64LtnSxBPvfbTr8=
Received: from nilus-desk (unknown [120.229.1.29])
        by smtp12 (Coremail) with SMTP id EMCowABHVDV6jxdhvvz57Q--.28572S3;
        Sat, 14 Aug 2021 17:40:11 +0800 (CST)
Date:   Sat, 14 Aug 2021 17:40:09 +0800
From:   Nil Yi <teroincn@163.com>
To:     crope@iki.fi, linux-media@vger.kernel.org
Cc:     sean@mess.org
Subject: [PATCH] media: dvb-frontends: clean the freed pointer and counter
Message-ID: <20210814094009.GA66453@nilus-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CM-TRANSID: EMCowABHVDV6jxdhvvz57Q--.28572S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gry8AryDXw4fWF1DtFykGrg_yoWDJFb_K3
        4DArnrZa4YqFn8Zr40yF1Fy3yvy3y3Zr48WFyrtry3tF40vFyq9a4DKFyDtFy7XF4xurnx
        JFWagF47GFn3GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8XVy7UUUUU==
X-Originating-IP: [120.229.1.29]
X-CM-SenderInfo: 5whu0xxqfqqiywtou0bp/xtbBLAruEl++M6t33wAAsL
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After freed the dev->urb_list, we should set it to NULL as well as set
counter to zero.

Signed-off-by: Nil Yi <teroincn@163.com>
Asked-by: Sean Young <sean@mess.org>
---
 drivers/media/dvb-frontends/rtl2832_sdr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/rtl2832_sdr.c b/drivers/media/dvb-frontends/rtl2832_sdr.c
index 1a2f0d2ad..6a4f2997d 100644
--- a/drivers/media/dvb-frontends/rtl2832_sdr.c
+++ b/drivers/media/dvb-frontends/rtl2832_sdr.c
@@ -376,8 +376,11 @@ static int rtl2832_sdr_alloc_urbs(struct rtl2832_sdr_dev *dev)
 		dev_dbg(&pdev->dev, "alloc urb=%d\n", i);
 		dev->urb_list[i] = usb_alloc_urb(0, GFP_KERNEL);
 		if (!dev->urb_list[i]) {
-			for (j = 0; j < i; j++)
+			for (j = 0; j < i; j++) {
 				usb_free_urb(dev->urb_list[j]);
+				dev->urb_list[j] = NULL;
+			}
+			dev->urbs_initialized = 0;
 			return -ENOMEM;
 		}
 		usb_fill_bulk_urb(dev->urb_list[i],
-- 
2.17.1


