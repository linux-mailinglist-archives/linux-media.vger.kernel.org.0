Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA4F575CAB
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 09:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232286AbiGOHtR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 03:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232263AbiGOHtJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 03:49:09 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BDAB24976;
        Fri, 15 Jul 2022 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657871348; x=1689407348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wPuNOpFdSsFsXF8Dch070sqETEJwKj+qyzoVF98CDRo=;
  b=nEDLG17F2pl6U37Bi+YurSwyIz3YMcdUU1T4Bk7fdTFer72EHubKGhq+
   yK1HRI5hErpM4daRWWm3mXXnOifMVdOxAUZLY7XOV0AeomWT3+/0H4evm
   6o/Qn6TgsKciGspil3R2sG6Dov57mtnijJ8zruG0J8UGTQ+DnUuxemvfJ
   zEkWB8cpll8yN8fN3qwUGODPXG85jMXjr+mlJcbegPyjBWIIBYe0OXeHP
   nY3xAQ0Qwt3FT5TpNoi181SozRe94yuvIJGEnMnhxRdKCu0mWcL8fAAtN
   tA/kqJy0eXiXCSPW3mqGtqpP8Hi4bZI3vBylUQATUBM3n8sfdSll3aLH3
   A==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25069086"
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
  bh=wPuNOpFdSsFsXF8Dch070sqETEJwKj+qyzoVF98CDRo=;
  b=C5+zd1G4e7CE0lqFxibRGMYOeNZtXebQUZBdiEZ5XH+XsiCRqX2A85fl
   gDqSpmk2D28mke19k6KRnUlS0wrnnA23yk2IpgX4TrVezOQSFYZZ7UJb2
   fVv1M4L2AaXsPxFNfOSdEPIbalrvcBj+iEcsvVH2xrdhFUD8qLyMHq2o7
   iPnH3jAsQ3/jnmqGf/PMLT4DFEdovQetTISjyXXI/wx56yjmbZux8UfG6
   dkODdUSWTVJEvQjswhtxNAA3YEAAJB+jPH5+IQ28shOW/uUBxccQGTv8O
   qwS5a918kdMJQs0cLOwDJ2T8jyUWzBKjgopXMMmoPi1I4bHVWzronB/hx
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,273,1650924000"; 
   d="scan'208";a="25069085"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Jul 2022 09:49:04 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 67BCB280072;
        Fri, 15 Jul 2022 09:49:04 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/6] media: i2c: ov9282: Add ov9281 compatible
Date:   Fri, 15 Jul 2022 09:48:55 +0200
Message-Id: <20220715074858.875808-4-alexander.stein@ew.tq-group.com>
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

According to product brief they are identical from software point of view.
Differences are a different chief ray angle (CRA) and the package.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
---
 drivers/media/i2c/ov9282.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 3269c1983bd5..04fda8222e07 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1114,6 +1114,7 @@ static const struct dev_pm_ops ov9282_pm_ops = {
 };
 
 static const struct of_device_id ov9282_of_match[] = {
+	{ .compatible = "ovti,ov9281" },
 	{ .compatible = "ovti,ov9282" },
 	{ }
 };
-- 
2.25.1

