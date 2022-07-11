Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E46456D79E
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 10:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiGKIQ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 04:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbiGKIQw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 04:16:52 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9751E3CB;
        Mon, 11 Jul 2022 01:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657527408; x=1689063408;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=klwcmwrkKvPTuZKskv/wl1boELttcnKApdWjvkZ9c7c=;
  b=bliDJc/GTQrnKkgJeO5r3zK7zk03Fw2VckRnXNGHGhydgrWw60ACqFKu
   r2Kszanx/uttNmxQIWjYlj/1cYDOSA+l2Ynfc5Qww4kmW8EaVzUWephVP
   cp/hOkwGCZa3UUzRCBpcjugScvw5jMC/KnH9Vl9qCYNio0Cc5PAvNgyME
   DenSOT3cDfJ0vkn2DtTIQKsO7codUo2jzg6/sxt2NBg69CGIEct0N0KBA
   V6bTkJOxh2IwgKuEGWwBO2qhBokVwewlog6B1/rn2pnZMMcOamdY2egOK
   YeD7GewQ4Ykvnc0cvBQkhfCTfVc8JsezLcsY9T7k+8R3A14Y8yW6xf1BB
   g==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650924000"; 
   d="scan'208";a="24967070"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Jul 2022 10:16:42 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 11 Jul 2022 10:16:42 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 11 Jul 2022 10:16:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1657527402; x=1689063402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=klwcmwrkKvPTuZKskv/wl1boELttcnKApdWjvkZ9c7c=;
  b=DXrpaLA2zvN5B401IdE/pEPsqmhWLdhflPSduKPFYNkyZ8cCC/MGh1iQ
   j2MXh4WLrg5sFNcyRM5l/XvNL8zFegX4IkdoLXV/X+xMR++a098tORc3I
   KwE8ID/bjjP0qNdIy+ieuR1iDPK6QHdG1FQOOQGpMqaeTvL3QkIzkr6NX
   TUJ5XBdsqCda4qqHv0tL3s/Ch5cvc7jfIkSFgBk+AyJvC9V8BQa+D3WTI
   FWlIgh0cK7JqYBiS1RxiSqQQFuSgzfCDU3EvTpzPLn6328z1YoZdeylOd
   TDt7cnYRvNm3cxqFjfpTkm6kzNw/ocIFC4jl3tQ5kP77mIbDt8gn83zjM
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650924000"; 
   d="scan'208";a="24967069"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Jul 2022 10:16:42 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A6342280078;
        Mon, 11 Jul 2022 10:16:42 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/6] media: i2c: ov9282: remove unused and unset i2c_client member
Date:   Mon, 11 Jul 2022 10:16:34 +0200
Message-Id: <20220711081639.150153-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
References: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
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

