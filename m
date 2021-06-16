Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3F93A9A5E
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 14:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbhFPMau (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 08:30:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:49254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232217AbhFPMaq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 08:30:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F9EC613BD;
        Wed, 16 Jun 2021 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623846520;
        bh=IZjqD2I+8Bdj62sCZmrApsPeQG82LsZGKTUJEvkz6E4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gJFUbmbEzqThmvQJg+a64/ryAPKBUgu6E+Q5YMtaygXjDp4wsYJWpZoM9Kxh+cXoZ
         w18vX5dcTxGdUFk39EgEzAI85i9rBMiJxX3KUtrZ+OXuZbuJzSzoww7rH0NKC3y25E
         zZpXHSWIU/MAWLpOeuyyb8r2/0bCdpwgL/nsLELVAydYh0eu7htjrfNufuGWFKzsjR
         4JrdhqYAz/sI+oi2yG+IHYppk2QxVra1tfREYUHkfl2PnczYPxknBhWPL4xcw8KrW4
         CEzmvmMsgXP/jyoo1IGLcnAH8yhWovwPFGx7jkklVMddn6t9De36neIfCxlL6gjbHM
         I6EzKdf94Pa2Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltUes-004oij-CV; Wed, 16 Jun 2021 14:28:38 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tasos Sahanidis <tasos@tasossah.com>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 06/11] media: saa7134: fix saa7134_initdev error handling logic
Date:   Wed, 16 Jun 2021 14:28:32 +0200
Message-Id: <9e1b48aeaf261e37aa99d868c44acfe7df0d7fc4.1623846327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623846327.git.mchehab+huawei@kernel.org>
References: <cover.1623846327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Smatch reported an issue there:
	drivers/media/pci/saa7134/saa7134-core.c:1302 saa7134_initdev() warn: '&dev->devlist' not removed from list

But besides freeing the list, the media controller graph also
needs to be cleaned up on errors. Address those issues.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/pci/saa7134/saa7134-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index 97b1767f1fff..47158ab3956b 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -1277,14 +1277,17 @@ static int saa7134_initdev(struct pci_dev *pci_dev,
 	 */
 #ifdef CONFIG_MEDIA_CONTROLLER
 	err = media_device_register(dev->media_dev);
-	if (err)
+	if (err) {
+		media_device_cleanup(dev->media_dev);
 		goto err_unregister_video;
+	}
 #endif
 
 	return 0;
 
 err_unregister_video:
 	saa7134_unregister_video(dev);
+	list_del(&dev->devlist);
 	saa7134_i2c_unregister(dev);
 	free_irq(pci_dev->irq, dev);
 err_iounmap:
-- 
2.31.1

