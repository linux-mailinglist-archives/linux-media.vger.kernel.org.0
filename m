Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39CFE583F7A
	for <lists+linux-media@lfdr.de>; Thu, 28 Jul 2022 15:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238818AbiG1NCw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jul 2022 09:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236063AbiG1NCu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jul 2022 09:02:50 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E48CE3E776;
        Thu, 28 Jul 2022 06:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659013369; x=1690549369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G4u1tivvbK5IkZ2oQaHeT7PpCwIMbfiPJFHfYAMie1U=;
  b=gFBhab7XUi4Yp8BpTtnd2vLQDVqh5JQvomrTqAc2Ggl21RBnkYXgs5bt
   0G8rwBR2VH2XURdbgUQH17Rdx4sVw43mVrERePxOYLhXcGwcGVRXaTqE/
   KngOw8h/qKXWp/NZysojjeBePKRHJjD6TNsb8dnie0x1YcrSdSTSJadNO
   +QeQQ4f7dI5lO+AE5+VnxYs63obb+vfF3JS17dUG6KMjdA7ybf+V9HH2J
   kKoJwpsInA8J2L4J+f43K2wkrlMGo5TnLimKA5ZrSiOo0ueRfIDQ4gc8Q
   2REdsKZBDqr0xtAIeA4kc/dlGN0s1X6s0LAcDR03c0HfcrjdcMLXkcxPP
   g==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654552800"; 
   d="scan'208";a="25321369"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 28 Jul 2022 15:02:43 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 28 Jul 2022 15:02:43 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 28 Jul 2022 15:02:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1659013363; x=1690549363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G4u1tivvbK5IkZ2oQaHeT7PpCwIMbfiPJFHfYAMie1U=;
  b=izBtzfY4utTI1L2Gg3znF7GrWm4Hq/mU8UL53G7AO3jcdhx5p3dj9/9G
   0jPXXv09favnrYTKW4Qn/1qxheYm8NLt3lLPUBQZwv9EEnnH1pACXVE9M
   f/oaQfrgFTakwIvCvWDzt5zY89pNSOpA+8wPRo8KdJkBPxMaX4yYqMqYa
   1c7PlKumyUW/eeIo9Se6IjImlrTgZ4o+qPJztXpOMraUa+tC0IfP76JZN
   LhUwu8MzGucrm7fc0iFMTs2MRxeUs/t8KIZWzyuDh5PPp0X1sSbV2egcn
   xpCMbYQFd0bPUu/0eGkj5epFAB1xV3KharkBox3sWt1lo9Dp4MdNVYtnO
   g==;
X-IronPort-AV: E=Sophos;i="5.93,198,1654552800"; 
   d="scan'208";a="25321368"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 28 Jul 2022 15:02:43 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AAFCA280072;
        Thu, 28 Jul 2022 15:02:43 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH v4 3/7] media: i2c: ov9282: Add ov9281 compatible
Date:   Thu, 28 Jul 2022 15:02:33 +0200
Message-Id: <20220728130237.3396663-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
References: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
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

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 drivers/media/i2c/ov9282.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 8a252bf3b59f..c8d83a29f9bb 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1113,6 +1113,7 @@ static const struct dev_pm_ops ov9282_pm_ops = {
 };
 
 static const struct of_device_id ov9282_of_match[] = {
+	{ .compatible = "ovti,ov9281" },
 	{ .compatible = "ovti,ov9282" },
 	{ }
 };
-- 
2.25.1

