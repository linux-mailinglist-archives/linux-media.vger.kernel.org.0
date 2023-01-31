Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90A34682A98
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 11:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbjAaKcz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 05:32:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjAaKcy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 05:32:54 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5944F3EFD9
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 02:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675161171; x=1706697171;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g5pISfBTZt9KTAHmKBM/Y7t3GywY88DeJKM6jNbQhzM=;
  b=eqGaX18BsQZ/cfO6Zpln/+Rw9xFsHAx2zNEbYXuIwnfdBVC8BpRJPLuq
   48Y0SrhzahmHXTlKrL1XbUNyBwO3oPTM9ejueKMKlJj8uIwGC8xrfNFB7
   bJKJe4lmffsDtWClH5hH7FWSHPHME72FjWK6hRhWz+LpingwAuMFhzkjI
   bvOtz7w5XZGD4cUbijX0tYFeMIcXDBWlPv8+KHtKD9G+5qGNArjI8idrY
   z3qKHPev3tr/QotocnyEDAJv6/M7HKPpsLNJoUUruAVOXW4vYlZd/hDzu
   KEfLRYR2vgGNZfcMwT9dA4Ov7kV/cp2hFbldp3sGSFyS0zB0tL7X1sqMQ
   A==;
X-IronPort-AV: E=Sophos;i="5.97,261,1669071600"; 
   d="scan'208";a="28767280"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 31 Jan 2023 11:32:49 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 31 Jan 2023 11:32:49 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 31 Jan 2023 11:32:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675161169; x=1706697169;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=g5pISfBTZt9KTAHmKBM/Y7t3GywY88DeJKM6jNbQhzM=;
  b=McBuQdXU7dUkYO/KajpbfQtI/MOl4/HIBgY3/4PvgvbeBI1TrM/9UxQl
   YFPPG0CAoKgU+qsxiTmUH1Nhdp8Pas5w06n/Ip8jQNrrJoNefzGH34CND
   qMjuD4OMzsTNyBVDz07V9a0e2nKfiukCW3gcy657GOKDVmpNuMxmyYUKI
   2FN6objgVeJuZlJCS7TKtLy+lx8seP5z+K6qnn6iMxhrj39wQDo7Nh7Ae
   5GLeEasB7BDzzNRixQoTVe3IM532FLSfFNiA4neJsl7gRrJVfTHxJTRhu
   cwBlyyRrh8aZv/9ANysHJncAvEm145Yu+fBs5d/EK08pc7OnAAUTsWgVU
   g==;
X-IronPort-AV: E=Sophos;i="5.97,261,1669071600"; 
   d="scan'208";a="28767278"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 31 Jan 2023 11:32:49 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8C03B280056;
        Tue, 31 Jan 2023 11:32:49 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Ming Qian <ming.qian@nxp.com>, Shijie Qin <shijie.qin@nxp.com>,
        Zhou Peng <eagle.zhou@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 1/1] media: amphion: use dev_err_probe
Date:   Tue, 31 Jan 2023 11:32:44 +0100
Message-Id: <20230131103244.624698-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This simplifies the code and silences -517 error messages. Also
the reason is listed in /sys/kernel/debug/devices_deferred.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/platform/amphion/vpu_mbox.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_mbox.c b/drivers/media/platform/amphion/vpu_mbox.c
index bf759eb2fd46..b6d5b4844f67 100644
--- a/drivers/media/platform/amphion/vpu_mbox.c
+++ b/drivers/media/platform/amphion/vpu_mbox.c
@@ -46,11 +46,10 @@ static int vpu_mbox_request_channel(struct device *dev, struct vpu_mbox *mbox)
 	cl->rx_callback = vpu_mbox_rx_callback;
 
 	ch = mbox_request_channel_byname(cl, mbox->name);
-	if (IS_ERR(ch)) {
-		dev_err(dev, "Failed to request mbox chan %s, ret : %ld\n",
-			mbox->name, PTR_ERR(ch));
-		return PTR_ERR(ch);
-	}
+	if (IS_ERR(ch))
+		return dev_err_probe(dev, PTR_ERR(ch),
+				     "Failed to request mbox chan %s\n",
+				     mbox->name);
 
 	mbox->ch = ch;
 	return 0;
-- 
2.34.1

