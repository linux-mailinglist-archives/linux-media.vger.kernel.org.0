Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F225E392AB5
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 11:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235836AbhE0J2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 05:28:16 -0400
Received: from mail.ispras.ru ([83.149.199.84]:57810 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235777AbhE0J2P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 05:28:15 -0400
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPS id BC19040D3BFF;
        Thu, 27 May 2021 09:26:39 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [PATCH] media: vidtv: Fix memory leak in remove
Date:   Thu, 27 May 2021 12:26:24 +0300
Message-Id: <20210527092624.29352-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

vidtv_bridge_remove() releases and cleans up everything except for dvb
itself. The patch adds this missed release.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 75617709c8ce..0f6d998d18dc 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -557,6 +557,7 @@ static int vidtv_bridge_remove(struct platform_device *pdev)
 	dvb_dmxdev_release(&dvb->dmx_dev);
 	dvb_dmx_release(&dvb->demux);
 	dvb_unregister_adapter(&dvb->adapter);
+	kfree(dvb);
 	dev_info(&pdev->dev, "Successfully removed vidtv\n");
 
 	return 0;
-- 
2.26.2

