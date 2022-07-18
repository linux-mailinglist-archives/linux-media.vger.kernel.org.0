Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4972057795A
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 03:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbiGRBmc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jul 2022 21:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231376AbiGRBma (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jul 2022 21:42:30 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13333F582
        for <linux-media@vger.kernel.org>; Sun, 17 Jul 2022 18:42:30 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id f2so14995099wrr.6
        for <linux-media@vger.kernel.org>; Sun, 17 Jul 2022 18:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LnpMoI2by3ePt6nUWwT7vjvkOkmnHTxe90huw8o9440=;
        b=Qgtle3phRvdJCBca1KTNdKbnylFncS70wPOQMRwtGI2gD39g1AAdXfoBE5KRqTIbkR
         kE39D5VevECdxwIfe3jfnm0boLVZeT0pbff8LckbjWRtjB95OIQ60waqvNR2AWjNT49V
         3dpJgwaKv8gKEbu2s0nZU9UlAFZ4y5JBbucK7NE+KhRjLVlbHpi9oc5rb5AbOp6tgIth
         pEATG8WJE1XRmurPikwT06AMEJI9RamsoJFDX1yiwLslxXVjvf+lkNtnIEXWm5q7dlzT
         uN5q9dBHU3Zm+zSsheq0vNBuUPvxJ8AYAJovjCumAl3kCXU91XJmcglgg++8h43i7odN
         nhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LnpMoI2by3ePt6nUWwT7vjvkOkmnHTxe90huw8o9440=;
        b=tYaq8DbCY1rjXPGb+u5lpspkrxkxp/JvZTmZtyGeWK4Qp8gT7hKnOcsJDuAGGFnNm9
         PIc64KiBCtv6Rx6nfCUn8cXOnulDncH644GvDWK4+1pgUWCcdhV36yGZyPG6Z4Pk5m/B
         GGfMr9Q1lW01W3E2V/INbDCRU9iRAUXa5hDwZdZ71Xqd3t/uhZizIjCPkyn3E7Jl0o1f
         ARtX/kXMJH4/TzziA7E3QGSfw6V/0iBqEuhxYqY2oGthFciTv3OL6z7i6Axi9319iQ3N
         9DrSxz+M3SDPWcpLhUYuAytT9qRc0Jd5/eU9n4SVfs4WR+Xh+TvJgRPpemAMOKpnupT/
         kusA==
X-Gm-Message-State: AJIora+E3E/ByX+2Pet0zPS6NMQ6G13Nw2kwR9XKeZV5yg1lY3Y6tJrS
        DayE4Nmc/8LbAOzAAYkM4hPa2Q==
X-Google-Smtp-Source: AGRyM1sT0A1zxDCLMr8CvcJ4vCRMIPkkYR3HIyNGrcWRk90z9V8luTwc6n5yrFuKpD+/3OZT8JS8VQ==
X-Received: by 2002:a5d:598e:0:b0:21d:86b2:f35 with SMTP id n14-20020a5d598e000000b0021d86b20f35mr21707439wri.54.1658108548684;
        Sun, 17 Jul 2022 18:42:28 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v10-20020adfebca000000b0021d76a1b0e3sm1685139wrn.6.2022.07.17.18.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 18:42:28 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        andrey.konovalov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 3/3] media: i2c: imx577: Fix chip identifier define name
Date:   Mon, 18 Jul 2022 02:42:15 +0100
Message-Id: <20220718014215.1240114-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220718014215.1240114-1-bryan.odonoghue@linaro.org>
References: <20220718014215.1240114-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Other IMX chips which read out the chip-id @ 0x0016 use the following
naming convention

drivers/media/i2c/imx258.c:#define IMX258_CHIP_ID        0x0258
drivers/media/i2c/imx319.c:#define IMX319_CHIP_ID        0x0319
drivers/media/i2c/imx355.c:#define IMX355_CHIP_ID        0x0355

Right now imx577.c does

drivers/media/i2c/imx577.c:#define IMX577_ID             0x577

Fixup the define name for consistency to IMX577_CHIP_ID.

Fixes: 9214e86c0cc1 ("media: i2c: Add imx412 camera sensor driver")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/imx577.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx577.c b/drivers/media/i2c/imx577.c
index 519b523c4091..e9b381e067db 100644
--- a/drivers/media/i2c/imx577.c
+++ b/drivers/media/i2c/imx577.c
@@ -27,7 +27,7 @@
 
 /* Chip ID */
 #define IMX577_REG_ID		0x0016
-#define IMX577_ID		0x577
+#define IMX577_CHIP_ID		0x577
 
 /* Exposure control */
 #define IMX577_REG_EXPOSURE_CIT	0x0202
@@ -904,9 +904,9 @@ static int imx577_detect(struct imx577 *imx577)
 	if (ret)
 		return ret;
 
-	if (val != IMX577_ID) {
+	if (val != IMX577_CHIP_ID) {
 		dev_err(imx577->dev, "chip id mismatch: %x!=%x",
-			IMX577_ID, val);
+			IMX577_CHIP_ID, val);
 		return -ENXIO;
 	}
 
-- 
2.34.1

