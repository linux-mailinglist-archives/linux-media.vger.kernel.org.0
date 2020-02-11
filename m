Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88319159AEA
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2020 22:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731941AbgBKVGI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Feb 2020 16:06:08 -0500
Received: from gateway33.websitewelcome.com ([192.185.145.23]:48785 "EHLO
        gateway33.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729443AbgBKVGI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Feb 2020 16:06:08 -0500
X-Greylist: delayed 1373 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Feb 2020 16:06:08 EST
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway33.websitewelcome.com (Postfix) with ESMTP id DE6046B90E0
        for <linux-media@vger.kernel.org>; Tue, 11 Feb 2020 14:43:14 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 1cNGjE27KSl8q1cNGjx943; Tue, 11 Feb 2020 14:43:14 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=LQJB9qTDYCP+pqJ+o+EBP152WnYVWjGH4JWUtcOBzIE=; b=REsq19WTHIU6YtgQ7oha9+2aGC
        BUSi2vRfRTfUm9EwFxgSPohhmaNEkO0I4ocLIi3rOC7dZjV1+ED1SqAxmi2ppU2t3bO/puPiurrQk
        lIztZ4Htz6vvkoOJqqggbBEnn2xiD+qsJbZ98bOg5Rty2tsgDwnFrpW7eaC87GZ2ZrxzCsE4GyX3S
        bJ4UuA4OuiYBQLXoZNCKPj6uqOGN39HCHmX1aUZewq37NYNkzAwG7Zl0umNk8Tz7PuDYqIoxsYE1L
        TfQ1sBu1sKkDY175Z3ldLGT1PBEuGfyWBNFikH4nl7o3+I05iFuOGUzfgFjYK3yt97YG7Cae7w3FF
        B3XmduXg==;
Received: from [200.68.140.36] (port=10643 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j1cNE-001sPr-V3; Tue, 11 Feb 2020 14:43:13 -0600
Date:   Tue, 11 Feb 2020 14:45:47 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] media: rc: iguanair: Replace zero-length array with
 flexible-array member
Message-ID: <20200211204547.GA17869@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.140.36
X-Source-L: No
X-Exim-ID: 1j1cNE-001sPr-V3
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.140.36]:10643
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 28
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertenly introduced[3] to the codebase from now on.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/media/rc/iguanair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/iguanair.c b/drivers/media/rc/iguanair.c
index fbacb13b614b..028374b04e47 100644
--- a/drivers/media/rc/iguanair.c
+++ b/drivers/media/rc/iguanair.c
@@ -85,7 +85,7 @@ struct send_packet {
 	uint8_t channels;
 	uint8_t busy7;
 	uint8_t busy4;
-	uint8_t payload[0];
+	uint8_t payload[];
 };
 
 static void process_ir_data(struct iguanair *ir, unsigned len)
-- 
2.25.0

