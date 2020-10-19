Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0D5292750
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 14:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbgJSM1h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 08:27:37 -0400
Received: from m15114.mail.126.com ([220.181.15.114]:60985 "EHLO
        m15114.mail.126.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbgJSM1g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 08:27:36 -0400
X-Greylist: delayed 1944 seconds by postgrey-1.27 at vger.kernel.org; Mon, 19 Oct 2020 08:27:36 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=OFtEsqbgr+92eux+bA
        JK5hFDJIJWbwGaB1Mx7vK03yk=; b=FAJr/J/xpAHxCKI9vpHIdJADJ0SX4E+lkh
        BmcUldP/Sl5M0Hk1KDB35RXa9QwK2bTvg66P4w0XgU93X8BdNGTBQCpJkq3/W1ZK
        vp3H6LEAKSvdGNBAf00Is+uFWHcNKBfBOurvZvebXiwwcIARLD/WatFoJDTrEAMa
        xFiHev8a0=
Received: from localhost.localdomain (unknown [36.112.86.14])
        by smtp7 (Coremail) with SMTP id DsmowABHTW2Yfo1fu6MPKQ--.47297S2;
        Mon, 19 Oct 2020 19:55:05 +0800 (CST)
From:   Defang Bo <bodefang@126.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Defang Bo <bodefang@126.com>
Subject: [PATCH] media: v4l2-compat-ioctl32: check for max size
Date:   Mon, 19 Oct 2020 19:54:49 +0800
Message-Id: <1603108489-4832-1-git-send-email-bodefang@126.com>
X-Mailer: git-send-email 1.9.1
X-CM-TRANSID: DsmowABHTW2Yfo1fu6MPKQ--.47297S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKryUWFW7Xw1xKr18GFy3Jwb_yoWfArcEqw
        nrWFn7WF4DJFn7A34ktay3Z34a9an7uryrGFZrtrWaqr9rA3WqyrWvvr9rGrsrWa1jyFn8
        ZFs3Wr17CF17GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0J5r7UUUUU==
X-Originating-IP: [36.112.86.14]
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbitBnC11pEBvGt+gAAsG
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Similar to commit<ea72fbf588ac>("media: v4l2-compat-ioctl32: prevent go past max size"} ,add max size check for count variable.

Signed-off-by: Defang Bo <bodefang@126.com>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index a99e82e..5041d60 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -207,7 +207,7 @@ static int put_v4l2_window32(struct v4l2_window __user *p64,
 	    get_user(clipcount, &p64->clipcount) ||
 	    put_user(clipcount, &p32->clipcount))
 		return -EFAULT;
-	if (!clipcount)
+	if (!clipcount || count > (U32_MAX/sizeof(*uclips)))
 		return 0;
 
 	if (get_user(kclips, &p64->clips))
-- 
1.9.1

