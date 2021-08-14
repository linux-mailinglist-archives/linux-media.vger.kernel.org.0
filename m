Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3FB3EC203
	for <lists+linux-media@lfdr.de>; Sat, 14 Aug 2021 12:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237816AbhHNKaP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Aug 2021 06:30:15 -0400
Received: from m12-13.163.com ([220.181.12.13]:59292 "EHLO m12-13.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237454AbhHNKaO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Aug 2021 06:30:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=A1Xih
        OWuHHXYNrhm25vLX8VY1Q6zUvtleP7mf64ETXE=; b=e8Jht/w3AFSEEKEQTyudt
        DCsVP9Jh/AZIUpCc5jJ5PRK+y/xWGEQqZVhOE/E0XD+8NbfC3fy7CfgEpzGmkFnf
        Dc+GhKPDGVu5P9/dMdw4ZEX2+7yJml4qi9KYR1icJ4NFxMUY4EKWRNBAJKcrPmfh
        3Gv9WIFzc4wueUhYE5U/uM=
Received: from nilus-desk (unknown [120.229.1.29])
        by smtp9 (Coremail) with SMTP id DcCowADnla4TmxdhU+pYPg--.969S3;
        Sat, 14 Aug 2021 18:29:41 +0800 (CST)
Date:   Sat, 14 Aug 2021 18:29:39 +0800
From:   Nil Yi <teroincn@163.com>
To:     sean@mess.org, linux-media@vger.kernel.org
Subject: [PATCH] media: rc: clean the freed urb pointer to avoid double free
Message-ID: <20210814102939.GA66862@nilus-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CM-TRANSID: DcCowADnla4TmxdhU+pYPg--.969S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFy8Ww4fCrWrtF4rtw1xAFb_yoWfGrb_Cr
        13Xrn3uws8Grn8Kr1UKw1xZry5KFW0vF48X3WfKr13Aw4ava1vyrsrWF9xAr47GFsruF9r
        G34FgFWfGr93WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0D3ktUUUUU==
X-Originating-IP: [120.229.1.29]
X-CM-SenderInfo: 5whu0xxqfqqiywtou0bp/xtbBHBXuEl3mAWAPiQAAsp
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After freed rx_urb, we should set the second interface urb to NULL,
otherwise a double free would happen when the driver is removed
from the first interface.

Signed-off-by: Nil Yi <teroincn@163.com>
---
 drivers/media/rc/imon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 2ca4e86c7..54da6f600 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -2358,8 +2358,10 @@ static struct imon_context *imon_init_intf1(struct usb_interface *intf,
 touch_setup_failed:
 find_endpoint_failed:
 	usb_put_dev(ictx->usbdev_intf1);
+	ictx->usbdev_intf1 = NULL;
 	mutex_unlock(&ictx->lock);
 	usb_free_urb(rx_urb);
+	ictx->rx_urb_intf1 = NULL;
 rx_urb_alloc_failed:
 	dev_err(ictx->dev, "unable to initialize intf1, err %d\n", ret);
 
-- 
2.17.1


