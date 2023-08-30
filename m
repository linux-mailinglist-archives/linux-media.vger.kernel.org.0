Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC0078D7FF
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 20:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbjH3S3M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Aug 2023 14:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245432AbjH3PQW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Aug 2023 11:16:22 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E1D91A2
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 08:16:19 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso50691975e9.3
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 08:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693408578; x=1694013378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=15QT7FaWOs6RuBKa+Vz9gCDzoPPBTXEEtlQ0POIH58Q=;
        b=fy6XrOjgj2LIt5Y3ZnhYopKUMJPyYP5CpBiQoXh6ywLi7cFSXmpyyNfqIfnVN7z5Cw
         a407lOJwn6pD61+sxpdw7mcRgzaXmIkiKx9gHz0VNsbch7e4VSRU6Ey8s8ooszxbknfI
         DYS0zPFHTDdtOmbaqwEVPa4fqfLlvk5nn8lYBJ+w7Tsxj2Iqn02nNXY45WZ33ZPIJTKq
         GmaGNhHaYlH4YtZlUUur/YUVEsGlhEDCjtCpuSjAlGn4+QAa5M5Lf6x2k7E1bp6XJGW0
         wm1Ho4gKnx5wncbBtP8U1FUjpcF38Hu0x8my9XVxBPjz9tXYmACOxLloNfGB1SM6J8H0
         qt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693408578; x=1694013378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15QT7FaWOs6RuBKa+Vz9gCDzoPPBTXEEtlQ0POIH58Q=;
        b=JUuaAsK7wcCE2IAkhSAph8kzMrJGQtLZbZVFHllxIgvR50vObEWCv+cZAo60EklIpB
         osyKAVDPjafvNRNb1plIt9ShKCt0LFwPIOyNqrBQcyauHjL5/Qife53MAaMmpOMdhf9R
         mcYEL1HzV5D38Iue63irdt7sX/i32F3dm6j1/Mi7GXX6LIUxNk/1ktVhEXCYOxOkmv/Q
         v98Qz+OaQnyzug/V098QBshljzxxkL7jdosQ6LYsC6y9yvJY0yvFkSxUv+vrIPKc+Y5V
         LrUR1ehVmANl92IHQY87Q7Me4t0ir/dhDBnQfTTHBQYNGmtp1014a6Y6ZLkZvVOqC2rf
         yuoA==
X-Gm-Message-State: AOJu0Yx3n4fX4Uqd5K2QbD4rMuu2sJcjO8+t6jXK/PCWvs7E5JHX3vyS
        A6bhsg3pdihddfaXsiX4Z1iYFw==
X-Google-Smtp-Source: AGHT+IE6588PqEkrgn+wjL++tLnfWxX9DzYo0tqWXZEgHSAexO9ogm7ql+owEjT4/MIYqQlp2GEWWA==
X-Received: by 2002:a05:600c:20d:b0:400:57d1:4913 with SMTP id 13-20020a05600c020d00b0040057d14913mr2022835wmi.9.1693408577965;
        Wed, 30 Aug 2023 08:16:17 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b16-20020a5d4d90000000b0030fd03e3d25sm16989961wru.75.2023.08.30.08.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 08:16:17 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/10] media: qcom: camss: Bugfix series
Date:   Wed, 30 Aug 2023 16:16:05 +0100
Message-ID: <20230830151615.3012325-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V3:
- Adds Reviewed-by where indicated - Laurent
- Adds a new patch for genpd cleanup. TBH I completely missed this so thanks ! - Laurent
- "media: qcom: camss: Fix V4L2 async notifier error path" stays the same fixes spalt in -next
  Fixes: 51397a4ec75d ("media: qcom: Initialise V4L2 async notifier later")
- I like the suggesting of using a common fix for vfe-17x and vfe-480 however, I believe
  we need to support multiple write-master/RDI => VCs in 17x which currently we only do
  in vfe-480 so sharing the code between the two here right now, is	n't possible.
- Included other suggestions on vfe-17x and vfe-480 - Laurent
- I didn't change the val |= 1 << CSI2_RX_CFG1_VC_MODE to BIT(2)
  The reason for that is all of the code uses this odd bit-shifting and I'd rather do
  the conversion from shifting to BIT(x) as a distinct series instead of piecemeal - bod

V2:
- Amends commit log for TPG fix to cover dropping of fixed
  VC when setting up a TPG - Konrad

- Leaves GENMASK etc out. I'm happy to do a "make it pretty"
  series later on. - bod

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/commits/Bugfix-series-v2?ref_type=tags

V1:
- Drops dt_id = vc * 4 in favour of a patch in a later series - Hans
  Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/d4c382c5d6ee153b410a01e172b3e811011d0b14
- Adds Konrad's Acked-by as indicated

V0:
This series covers a number of Fixes: all of which are for application to
stable as well as -next with the exception of the second patch which is a
fix for a SHA that is still in -next.

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-08-07-db410c-rb3-camss-dts-v3

This series is part of a larger set of fixes, improvements developed/found
when adding a new SoC.

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/lenovo-x13s-v6.5-rc4-x13s-camss-patches

First pass on that larger series is to get all of the current Fixes: in the
branch out.

Andrey Konovalov (1):
  media: qcom: camss: Fix csid-gen2 for test pattern generator

Bryan O'Donoghue (9):
  media: qcom: camss: Fix pm_domain_on sequence in probe
  media: qcom: camss: Fix V4L2 async notifier error path
  media: qcom: camss: Fix genpd cleanup
  media: qcom: camss: Fix vfe_get() error jump
  media: qcom: camss: Fix VFE-17x vfe_disable_output()
  media: qcom: camss: Fix VFE-480 vfe_disable_output()
  media: qcom: camss: Fix missing vfe_lite clocks check
  media: qcom: camss: Fix invalid clock enable bit disjunction
  media: qcom: camss: Fix set CSI2_RX_CFG1_VC_MODE when VC is greater
    than 3

 .../platform/qcom/camss/camss-csid-gen2.c     | 11 ++--
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  2 +-
 .../media/platform/qcom/camss/camss-vfe-170.c | 22 +-------
 .../media/platform/qcom/camss/camss-vfe-480.c | 22 +-------
 drivers/media/platform/qcom/camss/camss-vfe.c |  5 +-
 drivers/media/platform/qcom/camss/camss.c     | 55 +++++++++++--------
 6 files changed, 46 insertions(+), 71 deletions(-)

-- 
2.41.0

