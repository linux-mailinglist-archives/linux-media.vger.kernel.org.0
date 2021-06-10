Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2FA3A22D1
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 05:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbhFJDem (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 23:34:42 -0400
Received: from m12-13.163.com ([220.181.12.13]:59870 "EHLO m12-13.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229655AbhFJDel (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Jun 2021 23:34:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Hf2YQ
        2eAvyV7KJFoGT7VJaISwJgTJ47RCqpnTiWy38g=; b=UzhDklMmS9TfnYCGedZXe
        0bzjLbBxgy8BWkylC08Iv326/vsLTo/V/UYXePdvronSr0M6GfwkB9Gbo+yFsCTD
        q6ykFMNXxlKx1KnY+fxqbKk9VDxK9VI8HyOgbm+Qwz5uNizJvmqqurKvNvoZqzFl
        LH28gxurb5FmsR0ruuTgao=
Received: from localhost.localdomain (unknown [218.17.89.92])
        by smtp9 (Coremail) with SMTP id DcCowACHj5Pyg8FgBu8jFg--.19196S2;
        Thu, 10 Jun 2021 11:16:03 +0800 (CST)
From:   lijian_8010a29@163.com
To:     sean@mess.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        lijian <lijian@yulong.com>
Subject: [PATCH] media: rc: streamzap: Removed unnecessary 'return'
Date:   Thu, 10 Jun 2021 11:15:04 +0800
Message-Id: <20210610031504.20672-1-lijian_8010a29@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowACHj5Pyg8FgBu8jFg--.19196S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrAryrKw1kZFyrWFWUJF15twb_yoWxWrb_ua
        1SvFZ7uF1DAw15Z3W5Kr9Iv3yvyFW29F1kAFsYqFy3Jr43uayYvryqkr47trWDZr13ZFyD
        Wa4agF1xCr1UGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnC1v7UUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5olmxttqbyiikqdsmqqrwthudrp/xtbBLBitUF++MJh8eQAAsF
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: lijian <lijian@yulong.com>

Removed unnecessary 'return'.

Signed-off-by: lijian <lijian@yulong.com>
---
 drivers/media/rc/streamzap.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 9f3cd9fb6b6e..9cd765e31c49 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -265,8 +265,6 @@ static void streamzap_callback(struct urb *urb)
 
 	ir_raw_event_handle(sz->rdev);
 	usb_submit_urb(urb, GFP_ATOMIC);
-
-	return;
 }
 
 static struct rc_dev *streamzap_init_rc_dev(struct streamzap_ir *sz)
-- 
2.25.1


