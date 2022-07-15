Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14228575CAA
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 09:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232260AbiGOHtJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 03:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbiGOHtI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 03:49:08 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD31724BD9;
        Fri, 15 Jul 2022 00:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657871347; x=1689407347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JuBIX9AlsLth2DV5UV2eBx3OUqbtmMFLVWX7jnn/yrY=;
  b=gSWkQ3FYcvrFmvFcf5TCeFW5DC82/Orvpwt0DVeQo0ZxFS6jQ2s7LNPZ
   pjQBR2h96z1F4wZ+Djj8nHxt37vYIW2t0/6jwXYLy9DzA7x+J/ORWCMkz
   iQtl3QybKwhCcBmPGk4/Nk/y+lhJpWW2AxdPu0aZlrPVgtaTr2vowDMDf
   +7KW8lvulvPNSFuFGSjqKwbZgs623EpU5+NRx3mj7vFbcgNJIKKp8gtne
   CuwQxWsAhmeNnD0TzriOkj9E34IgU1ocyX6WEY5L2O6VLqeyhjFGNbkRU
   Ey/fXuBYCyM8ZiqkQeSh8X6e3jTWDF0UFUSRQXTor0t7g6buK/D8vs/MF
   A==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25069082"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 Jul 2022 09:49:04 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 15 Jul 2022 09:49:04 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 15 Jul 2022 09:49:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657871344; x=1689407344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JuBIX9AlsLth2DV5UV2eBx3OUqbtmMFLVWX7jnn/yrY=;
  b=MHaIila42GWO8qVIYVrD0bSRLwUy5yr8vZaafNWTDyOO0aUFVM16CSzn
   cD2FUGFjv+4jfbvQ1bjp8skHRiTkTM3yCjshNnQVFNyqvfAq+EIXY6PtH
   TsR3R6lYLs8AjrH8owwpNdB5vCqQXdABC0Gh2AF4giO7djMME6eeEDUq1
   uEDmaqwQFdKLlcLIZdSxcM0THdmN3TiO1DblXVou08Q5K7Tw3uto5OdqD
   rrsVFFrllTJEAAq3x5NGVx7fAkt7KmwiM4oQbhBE4z1+rgvBW+W2TdxpV
   86zLrWTecItc3lUviSPxccmaO7JURRHIMc7+lvgkaox7wlE9ZpgkDs7zR
   A==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25069081"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Jul 2022 09:49:04 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 06E1B280072;
        Fri, 15 Jul 2022 09:49:04 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/6] media: i2c: ov9282: remove unused and unset i2c_client member
Date:   Fri, 15 Jul 2022 09:48:53 +0200
Message-Id: <20220715074858.875808-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715074858.875808-1-alexander.stein@ew.tq-group.com>
References: <20220715074858.875808-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is not need anyway as the i2c_client is stored in v4l2_subdev.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 drivers/media/i2c/ov9282.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 2e0b315801e5..3269c1983bd5 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -123,7 +123,6 @@ struct ov9282_mode {
  */
 struct ov9282 {
 	struct device *dev;
-	struct i2c_client *client;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct gpio_desc *reset_gpio;
-- 
2.25.1

