Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13FF37ADC20
	for <lists+linux-media@lfdr.de>; Mon, 25 Sep 2023 17:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233226AbjIYPro (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Sep 2023 11:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233024AbjIYPrg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Sep 2023 11:47:36 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3649B6
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 08:47:26 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3200bc30666so5663307f8f.2
        for <linux-media@vger.kernel.org>; Mon, 25 Sep 2023 08:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695656845; x=1696261645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xDdHYwLfg0JHODBOnX5/PYY4PGuDuMNIjsuATRv640=;
        b=yi39ZKbwvkkRU1QBDvj6QMHYmLSVA/E1dXe57UugoqF6n9nqJWeWweRdaDtvQnylV7
         Ci0GeN8jZ4VtWa0xZIHNHmDwEuLzjogNfdtmqiQ0ldcFFhToFg07oRQs+mn0HlgStrcw
         fJ4KXwtr2TIpCjACpRJmeQglXFjbIhyTpGR5ObEpqrUxUOr6nEqnbcGpbeZjfs70B9a5
         BhqSatkKdmOr9+8tiwr535JvLWRmkjVJ+pffC5CvibPTEznDXVd9WnhRDryOqTYexHkT
         8oa6rsrVR1ftDyW66PH+3T6zXGIcFHGC6JFrBYXY6MTd47qWvyWxiVyhSBU0jmt97OPB
         sKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695656845; x=1696261645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xDdHYwLfg0JHODBOnX5/PYY4PGuDuMNIjsuATRv640=;
        b=wPTAYc8ywlO8yVfiTHzuo0iEZZ1hyO2BvTnM/2uxup4XwFuaiPb/enOtbSunRkGOrC
         dQLZfTcYdIRqSNu+cQDsv/iAezRLKRm/DZq9bvVjcuEiD/0BwujfW1vJkbloAWXTIPw3
         ozINvVmeKOOv6OjpDgjJngqC23UECVBPJvp6janZCz4FwW06R0QwD830mzN5l/+Ew6hr
         GPSqN+TcpeHPt6aB4YSO9IvKxQuGU8WovhaIhmpEULy60nXrcuypS3q2aR6ILr9JxSzO
         XToTVIIOaBELutlybrmN2k9eW1FDkOl/NSsluK3SoT4CjXcc4n/n4Ywn38373ERRYaZr
         DaDA==
X-Gm-Message-State: AOJu0Yz4kvQFTZ7ZvyuWUthoC+TS0AbpfpUpJB4TH5dvupSF8UoYArej
        +kVfBSoG7wHsnGlSOA0BjB+meQ==
X-Google-Smtp-Source: AGHT+IHSCTlbHdkPGAqDOco6h4l/Y2ePHoAE9D7YIGnMLawkb6DROeXAHd6DcQpVRXOfaDnDr4TRvw==
X-Received: by 2002:adf:f485:0:b0:317:f046:25ef with SMTP id l5-20020adff485000000b00317f04625efmr6665188wro.44.1695656845402;
        Mon, 25 Sep 2023 08:47:25 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d4-20020adffd84000000b0031f34a395e7sm12077536wrr.45.2023.09.25.08.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 08:47:25 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        rfoss@kernel.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, andrey.konovalov@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [RESEND PATCH v6 13/17] media: qcom: camss: Fix support for setting CSIPHY clock name csiphyX
Date:   Mon, 25 Sep 2023 16:47:03 +0100
Message-ID: <20230925154707.837542-14-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925154707.837542-1-bryan.odonoghue@linaro.org>
References: <20230925154707.837542-1-bryan.odonoghue@linaro.org>
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

Right now the CAMSS code will fail to set the csiphyX clock even if we have
declared it in our list of clocks. For sdm845 and sm8250 we appear to "get
away" with this error, however on sc8280xp we don't.

The right approach here is to set the clock when it is declared. If a SoC
doesn't require or a SoC driver implementer doesn't think we need, then the
clock ought to simply be omitted from the clock list.

Include csiphyX in the set of permissible strings which will subsequently
lead to the csiphyX clock being set during csiphy_set_clock_rates() phase.

sdm845 and sm8250 will work with the code as-is so I've omitted this from a
suggested Fixes list.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 20bb361e9ad05..edd573606a6ae 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -677,6 +677,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
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
2.42.0

