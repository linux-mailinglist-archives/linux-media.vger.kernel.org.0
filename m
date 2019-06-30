Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE575AE04
	for <lists+linux-media@lfdr.de>; Sun, 30 Jun 2019 05:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfF3D4d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 23:56:33 -0400
Received: from knopi.disroot.org ([178.21.23.139]:46712 "EHLO
        knopi.disroot.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbfF3D4d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 23:56:33 -0400
X-Greylist: delayed 397 seconds by postgrey-1.27 at vger.kernel.org; Sat, 29 Jun 2019 23:56:32 EDT
Received: from localhost (localhost [127.0.0.1])
        by disroot.org (Postfix) with ESMTP id 82CE435AD1;
        Sun, 30 Jun 2019 05:49:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
        by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id RcVaHcMZLjIq; Sun, 30 Jun 2019 05:49:53 +0200 (CEST)
From:   Chinmaya Krishnan Mahesh <chinmaya.mahesh@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
        t=1561866593; bh=9Ans4RlZn8dOH7qDF/10KOpQwK7T65Z7lmdyjzSs6EM=;
        h=From:To:Cc:Subject:Date;
        b=cxRkBFtLkJqF49ZKRJOmdQPn1WiL+0gAI0IbH2izNDvE48VmypAe/M+yVswDVcpFO
         G0jOYvwIl4tfIuw0ErGts8jklgNnMtIWEvNlyZh8OcbO8t+B05MxH238awK/j5QT/v
         nbXssB0o4AV839WeDkBIp/uhnTDe0fbi/XVVhvPViaoGK6bTFZNUFLBjloaQ5Di5dq
         RXOmMjmDq8tGhSHt/U4rrmlPxmbRJOkNDNvw4+b26gcLLvKWHgsf5t5eQpesV8YC9v
         zQX855x2+tPa8WxqO2WIhB0VOjyXG2m+5kjkuCm5D5k7o7pU+3BZF6rvzObA8kfsqZ
         zhNvFdQA6TUqw==
Cc:     Chinmaya Krishnan Mahesh <chinmaya.mahesh@disroot.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: imx7-media-csi: Remove unneeded break after return
Date:   Sat, 29 Jun 2019 22:49:04 -0500
Message-Id: <20190630034905.7124-1-chinmaya.mahesh@disroot.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes the checkpatch.pl warning:

WARNING: break is not useful after a goto or return

Signed-off-by: Chinmaya Krishnan Mahesh <chinmaya.mahesh@disroot.org>
---
 drivers/staging/media/imx/imx7-media-csi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index a708a0340eb1..c15acca1dc0d 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1021,7 +1021,6 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		break;
 	default:
 		return -EINVAL;
-		break;
 	}
 	return 0;
 }
-- 
2.22.0

