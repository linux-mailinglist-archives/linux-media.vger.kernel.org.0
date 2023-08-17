Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B33077F95F
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 16:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352096AbjHQOiw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 10:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352069AbjHQOie (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 10:38:34 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8CA2D79
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 07:38:32 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31771bb4869so7034095f8f.0
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 07:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692283111; x=1692887911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CilnvTYr96ahQ3O2WrOgBxIJx4YDnh0XI4B0xmqb0M=;
        b=YwTeQTNLM9eIWy12X5K0elLIAsH1jrFwere4LkOVehwSBrbX1XJFXLm0wZ1huOMlcb
         uYfW7SewcC3PRa0bHyVusBnwdi/KaTsaGMOMOb7bWRQiHlAVgOsFbsFokAbJUyHHutKG
         t/u6ZAqctzypvbIUGzT9a+qNjkPNFGiU8HYNMRP4rG9a5ZEeZJcL3rRjPDvNSAB1toTH
         70c0jmDU+8VXtv9LLRlh01FURuoxKwZQwC5UC7y8GZJ7OaRRXSZcLajOgI1hXtqJMzEI
         FUHcfMBp+XO7/awzpWQGryX3dQfLZF8le+HHkiH8IHxaGwVGVoowAoSxFw5zIXU7t+iT
         glUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692283111; x=1692887911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5CilnvTYr96ahQ3O2WrOgBxIJx4YDnh0XI4B0xmqb0M=;
        b=j4ixLyl4EcmV0JryOEewpd68G/I1dNPx6QTpp3nHlzlCVzEOHwkAFpl2NZ37VP0nUg
         /ixHh+1b4WhW+DB0NR0aCJwRhrpM7vicIiKkIBKsoPpc6sP5HOG7XX2PPVEY8ee+FZMy
         4zkDeWWxQf5s5V4oKgP3CU9bqXhkV4QBYxlMOlU5JKzKszza6U72R3ODpruDlvjXmj03
         v65HmLEtiQ8E0P4QnPKDrzhROReHzDeH4VnCGBGBwAlEfQz94hDq6suL+LlRWVz4eLfm
         stHgESKpRK31DtfYvMZovGsmdnoOXNTjDLNFgDmhCJdZnfTINJ7AGINWYQyJMJvM7eGE
         njAw==
X-Gm-Message-State: AOJu0Yyz9YFfun8Hv5RAo8Bzbd6MqZqTw2LwBBcRY3j+4OwlcMfNV44A
        ePDOAK5/ynwD4gnvYpbPaA37aA==
X-Google-Smtp-Source: AGHT+IEao7YnjHg3coPXwWG667W6QdSpnb6X8GoTtuIqq6drB5OqPJwYRIplZY8lboMZR68QteUrdw==
X-Received: by 2002:a5d:4641:0:b0:317:d048:8d87 with SMTP id j1-20020a5d4641000000b00317d0488d87mr3847749wrs.61.1692283110826;
        Thu, 17 Aug 2023 07:38:30 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i8-20020a5d4388000000b0030647449730sm25218232wrq.74.2023.08.17.07.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:38:30 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] media: qcom: camss: Add support for setting CSIPHY clock name csiphyX
Date:   Thu, 17 Aug 2023 15:38:11 +0100
Message-ID: <20230817143812.677554-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817143812.677554-1-bryan.odonoghue@linaro.org>
References: <20230817143812.677554-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Several of our upstream and soon-to-be upstream SoC CAMSS dtsi declare
csiphyX as opposed to the older clock name csiX_phy.

For newer SoCs csiphyX turns out to be a clock you really need to set.

On sc8280xp for example we will encounter difficult to track down and
root-cause RX CRC errors without setting the csiX_phy clock. On sdm845 and
sm8250 we declare the csiXphy clock but seem to get away with not setting
it.

The right approach here is to set the clock when it is declared. If a SoC
doesn't require or a SoC driver implementer doesn't think we need, then the
clock ought to simply be omitted from the clock list.

Include csiphyX in the set of permissible strings which will subsequently
lead to the csiphyX clock being set during csiphy_set_clock_rates() phase.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index baf78c525fbfc..d9c751f457703 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -687,6 +687,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
 				if (csiphy->rate_set[i])
 					break;
 			}
+
+			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name, "csiphy%d", k);
+			if (csiphy->rate_set[i])
+				break;
 		}
 	}
 
-- 
2.41.0

