Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8D764B6CF
	for <lists+linux-media@lfdr.de>; Tue, 13 Dec 2022 15:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbiLMOHm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Dec 2022 09:07:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235122AbiLMOHl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Dec 2022 09:07:41 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A7D10D1
        for <linux-media@vger.kernel.org>; Tue, 13 Dec 2022 06:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1670940459; x=1702476459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h47CwEcGz/yNTtHGl4F8CVWfv99XUjgU9SCRQydtf+w=;
  b=GFW65alzD75YK06fepHWLtiYXzUeu5KE/60aFiPm6PSOwWO736JAZCEM
   Fp2F4ix5Icy1swL0jVXzGg0rCLufO2zMAe+UE69+pR5Pd+GiNtG/hElRr
   ooofGFD9kwmAFPZxLbel6XSqdljhy8ivsVwztQYd9JiiDcK73c/Z+RLRh
   tbWJy7c9ZeZ55B7TTSp1mQFLuldLcc0X/pnoeek2+FcPYtSTIhP65o/8v
   TIk8St0csx/7ihiNwu/L9Jy/RCi1L8Iz+Jp2vLQ4T7bYnEUoBIl6BLVko
   cMqWxMdwQv/9iy27EI6Xvp8aGKOk9dRP2U1zWsHthJp4zmNOCQovMSchn
   w==;
X-IronPort-AV: E=Sophos;i="5.96,241,1665439200"; 
   d="scan'208";a="27925182"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Dec 2022 15:07:34 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 13 Dec 2022 15:07:34 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 13 Dec 2022 15:07:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1670940454; x=1702476454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h47CwEcGz/yNTtHGl4F8CVWfv99XUjgU9SCRQydtf+w=;
  b=BFbQZV0PeqEQ/2vb4vYtzG0inZ/f7jXlZPkIOIkJqCVGaJaIfJ2iflq9
   YiMhEiaVzLYnlxWtQq9k8YDfReYntK2UIT8fuAdSCw2HlmBPlaHMKmR67
   ZRD7iolXn5o6zMFMGr9+v02lXZ73qPxtFRr73xJjHcL7gBjFLaZfJ/D3Y
   CLaDqZ8RWuiejdga5ZJ4rkL/UwtvJVsdq7LouO3MeYWlIacR2I9MG50uA
   plvv2eNu8UMSOE9Dss/sg45V7qypvfiXEIruLjnb492osWvbN10KMtXJb
   Hxjbxzxx+a056ooW6rY4AkggwjGD9EnwVaX6lIEySjA1oh1EXEnVKWP6N
   A==;
X-IronPort-AV: E=Sophos;i="5.96,241,1665439200"; 
   d="scan'208";a="27925181"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Dec 2022 15:07:34 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C9F07280072;
        Tue, 13 Dec 2022 15:07:33 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: i2c: ov9282: Switch to use dev_err_probe helper
Date:   Tue, 13 Dec 2022 15:07:27 +0100
Message-Id: <20221213140727.414976-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213140727.414976-1-alexander.stein@ew.tq-group.com>
References: <20221213140727.414976-1-alexander.stein@ew.tq-group.com>
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

In the probe path, dev_err() can be replaced with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name. It also sets the defer probe reason which can be
checked later through debugfs. It's more simple in error path.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/media/i2c/ov9282.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 8216644494bb..7f46cac38aab 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1142,10 +1142,9 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 	}
 
 	ret = ov9282_configure_regulators(ov9282);
-	if (ret) {
-		dev_err(ov9282->dev, "Failed to get power regulators\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(ov9282->dev, ret,
+				     "Failed to get power regulators\n");
 
 	rate = clk_get_rate(ov9282->inclk);
 	if (rate != OV9282_INCLK_RATE) {
-- 
2.34.1

