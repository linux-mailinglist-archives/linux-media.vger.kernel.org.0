Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3B0D637685
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 11:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiKXKau (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 05:30:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbiKXKaY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 05:30:24 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8957AD0DF2;
        Thu, 24 Nov 2022 02:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669285816; x=1700821816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8EzM2+AU1Fro6JRdsVRnMz881rd525NgC/kvBamkYW8=;
  b=dIOqgMTXbcpX/PHNw6YZCM4O5aer4F+x6MJczEw0FtiOYNcEOmcOeuQ0
   cNwYO1IsmCaPNa3PsEPSd0XRYJWH6a58F2SzWRMBm2AL5vFKITEsnFhji
   bvQBk63PlJKgOYA3Jg0w6FlauFyEuFe8ZVgAMuLEXMTMrMbsWSmp742Ua
   Gk5rqZMhF6JQ5nA5dw6MaUWZtm1thC2qcoMESWq2YeTp/+oByI0+qSjuK
   q0zjEFgoNDNx531aaZXwQikQkjOvdgQcMcg4T5ZY/lZPa9wI7UW9vrt9t
   Yu+X1jsvs1ferI2Q/JU9K7P9C+5xmDuOyjrG/j7pboRpxlN6JJSEn9o11
   g==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665439200"; 
   d="scan'208";a="27558280"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 Nov 2022 11:30:04 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 24 Nov 2022 11:30:04 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 24 Nov 2022 11:30:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669285804; x=1700821804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8EzM2+AU1Fro6JRdsVRnMz881rd525NgC/kvBamkYW8=;
  b=Sqk2aDi/tz4wnljZuzRTKGfY/DSd4kQtWtsh/Jmx6VD0+tH4V16SCL/U
   l6QNM/WjhWrUvgq4Upd6hjCB7zrqK2ft87PMXJOIyzLDJxpthVQaer2s0
   3OAVX48JwL5sYg54tgYWcpRLfaOrslboTbL5Sb48QXgE34rL617B2D7c1
   77zjlWDcB/f6NB5Cd4rBVnNrx8e5LnKVRrO4KgWuKuSK11SSuLS7OH+BW
   A3Z4hqfb4+cP+yo830Rp39sRqUjGASxTjrI1GEUXalWS9+JTKPD5a8yt3
   fHhLIuwqmU4qvBfEyOXFG+MLyGTeBSgPBP+pVsnWjj39MMeZEMKO0vsC2
   g==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665439200"; 
   d="scan'208";a="27558279"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Nov 2022 11:30:04 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4BBAD280073;
        Thu, 24 Nov 2022 11:30:04 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v5 2/2] media: i2c: ov9282: Add ov9281 compatible
Date:   Thu, 24 Nov 2022 11:29:59 +0100
Message-Id: <20221124102959.1605202-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124102959.1605202-1-alexander.stein@ew.tq-group.com>
References: <20221124102959.1605202-1-alexander.stein@ew.tq-group.com>
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

According to product brief they are identical from software point of view.
Differences are a different chief ray angle (CRA) and the package.
To distinguish ov9281 & ov9282 in userspace the name has to be explicitly
set. Provide a fixed string using platform data.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/ov9282.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 072144668892..3d31d6f58dab 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1400,6 +1400,8 @@ static int ov9282_probe(struct i2c_client *client)
 
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov9282->sd, client, &ov9282_subdev_ops);
+	v4l2_i2c_subdev_set_name(&ov9282->sd, client,
+				 device_get_match_data(ov9282->dev), NULL);
 
 	ret = ov9282_parse_hw_config(ov9282);
 	if (ret) {
@@ -1499,7 +1501,8 @@ static const struct dev_pm_ops ov9282_pm_ops = {
 };
 
 static const struct of_device_id ov9282_of_match[] = {
-	{ .compatible = "ovti,ov9282" },
+	{ .compatible = "ovti,ov9281", .data = "ov9281" },
+	{ .compatible = "ovti,ov9282", .data = "ov9282" },
 	{ }
 };
 
-- 
2.34.1

