Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06876357E53
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 10:44:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhDHIoU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 04:44:20 -0400
Received: from gofer.mess.org ([88.97.38.141]:46423 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229602AbhDHIoT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 04:44:19 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 469DCC63A5; Thu,  8 Apr 2021 09:44:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1617871447; bh=EtJiALi37guJLoFZQJPgBc/QTHyIv1MzvfxgWStZ/JY=;
        h=From:To:Cc:Subject:Date:From;
        b=f9gBe1baNiKME70gkW7bYokOLOG6aR6FeN+OArBSbhiWCvQUHETLrsEX+J7PPi2Rs
         05GJFj9SdAlYuKL81e5wH7BkcGR0Kgr5Ihi0Ue4YVaunYuSKVpFlKU+PvxBMzD9PHN
         v1LA9NIO5onJYHHZh5jWOC/zx//IaDwhqUxpfWbKPSEd3OL+LnYyyKhKL6Pbrgo9Zt
         wrN7F2NBFi+erXBioS3kWGP5eVCJafan72ufgRrRiR/82RHJCZPC4/NpKC2nFlnbc5
         DGFJX6i7u93knjoUb/SeJi0ZsCNlkvzst65hsh0I/+s8B4+lA9pWJgwTNGTDsm0K39
         9q/aoAIDvP4zQ==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Nikolaos Beredimas <beredim@gmail.com>,
        Michael Zimmermann <sigmaepsilon92@gmail.com>
Subject: [PATCH] media: ite-cir: probe of ITE8708 on ASUS PN50 fails
Date:   Thu,  8 Apr 2021 09:44:07 +0100
Message-Id: <20210408084407.21828-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Asus PN50 has 16 byte io region for the ITE8708 in its DSDT, which
causes the probe fail. So, accept larger regions.

Link: https://www.spinics.net/lists/linux-media/msg177725.html
Cc: Nikolaos Beredimas <beredim@gmail.com>
Reported-by: Michael Zimmermann <sigmaepsilon92@gmail.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/ite-cir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index 9388774df9d7..5bc23e8c6d91 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -1333,7 +1333,7 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 
 	/* validate pnp resources */
 	if (!pnp_port_valid(pdev, io_rsrc_no) ||
-	    pnp_port_len(pdev, io_rsrc_no) != dev_desc->io_region_size) {
+	    pnp_port_len(pdev, io_rsrc_no) < dev_desc->io_region_size) {
 		dev_err(&pdev->dev, "IR PNP Port not valid!\n");
 		goto exit_free_dev_rdev;
 	}
-- 
2.30.2

