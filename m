Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD2C850294A
	for <lists+linux-media@lfdr.de>; Fri, 15 Apr 2022 14:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240648AbiDOMDU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Apr 2022 08:03:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352850AbiDOMDN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Apr 2022 08:03:13 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C5547390
        for <linux-media@vger.kernel.org>; Fri, 15 Apr 2022 04:59:58 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id y21so3343942wmi.2
        for <linux-media@vger.kernel.org>; Fri, 15 Apr 2022 04:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2SWC/SJWmZ9iFFqElDn63GSUGZfFEdpfbfFmWOmUfkM=;
        b=YTFHFh/Pa9ukDCplg7nP1lF6g12rxs8YTwtIiFZGi2Fmt2q/Oah7v67tddyvlnbLjt
         A3V5SpQgo0Y246zcAgMOLByPjBqHPSUKrwxNJOQexnCznXMCH5BQsaV+4IpJaPMaFsTe
         vkjRQCy3AJ6rP/TuGnXHBuMbFdCUHbvDyLJsyHXKpBtIxpMAc5lXYPa7XwtzE4/dTG+r
         jtaG2rtgLdxUryscIV4DlMq74Y9oiB/w3L7iFaxvBKDnb6Q+Zrr3emDgJhuCKh3CSmMO
         AGk2RIuMc718MDZDxqrA5HqUiEZG3Lt8NWEuFf/qXuTM9/2c0ZgaxXXn4efT8h5qHG0y
         YQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2SWC/SJWmZ9iFFqElDn63GSUGZfFEdpfbfFmWOmUfkM=;
        b=N2dy1iqB72cuHkAIxr9jdNApx7pA49fiYC6iL3XyIB/fCzWbu8yZRLPEafQtZaXgNf
         pGYOEQjcvK2JbAD+Wg0yI7ek+VYIKHjn9DBrQfqRQqUnWTUtcvl8tXaTzPDvBtW2+lJG
         0i20AwDd8Y85H3rnFMIimLwGcllImc75gwOTRmsSMSRdtwlthLFenIJb+FfVWv7D1Hmq
         b82MlzcYuwrmWgIOd1EX1gQfJCQuif3oxKHf5R65af+CklCK7aL0MNBbKjl+eH7OacKp
         YY6XX1jIQpD6g2/lgRnxJsj/6mu+3COnRX8ZTA7+IhBYcpsf5Thx4aMzipwkh/X/vKTM
         9Usw==
X-Gm-Message-State: AOAM531TX8i/9jZ2oCd0RItJ9brGyzGbnY7uKrxyJ/1sLO1j4UG6Iq2d
        Fgp2VhiCDz1ab574AKZak/NCXQ==
X-Google-Smtp-Source: ABdhPJyAc/Mn/eVOyfMNufyPVrli9vi++dsMa/2zMcHL7pdArzR7jPEI1BskbY0gsWaZViBbc47Gpw==
X-Received: by 2002:a1c:7415:0:b0:38e:bbbf:52d9 with SMTP id p21-20020a1c7415000000b0038ebbbf52d9mr3045434wmc.104.1650023997459;
        Fri, 15 Apr 2022 04:59:57 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg8-20020a05600c3c8800b0038e4c5967besm5328568wmb.3.2022.04.15.04.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 04:59:56 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robert.foss@linaro.org, hfink@snap.com, jgrahsl@snap.com,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v5 0/4] media: i2c: imx412: Add regulator control to imx412
Date:   Fri, 15 Apr 2022 12:59:50 +0100
Message-Id: <20220415115954.1649217-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V5:
- Adds in a fix for the GPIO reset. I was a bit worried that this change
  would negatively affect the Intel people. Looking around on Google I
  found that the imx412 is/was used on a system called Keem Bay which is a
  DTS based system so TL;DR its both safe and right to make this change.
- Front loads the clock/gpio ordering fix.
- Adds "Fixes" and Cc: stable for the two associated fixes
- Changes num_supplies to ARRAY_SIZE(supplies) - Jacopo

V4:
- Further asks on placing arguments on the same line - Saraki
- Moves regulator_bulk_disable() to common error path - Saraki
- Fixes power_off ordering so that power_off and power_on have the same
  flow - Bryan

V3:
- int num_supplies -> unsigned int num_supplied - Saraki
- Move imx412->num_supplies to same line as devm_regulator_bulk_get - Saraki
- Return ret on regulator_bulk_enable() - Saraki
- Remember to regulator_bulk_disable() on !clk_prepare_enable() - Saraki

V2:
- Drops redundant verbage "Definition of the" from each of the newly defined
  regulators - Krzysztof Kozlowski
- Adds Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
- "description: thing described" to the same line in new additions
  following the established way of doing it in this file - bod

V1:
The imx412 has three regulators which depending on platform may need to be
individually enabled.

- dovdd
- avdd
- dvdd

Existing code for an Intel platform doesn't appear to need to enable these
rails directly. On my reference hardware, a Qualcomm Thundercomm RB5 some
of these rails do need to be enabled individually.

Add in the above named rails as optional in the YAML in the first patch
along with code to switch them on in the second patch.

Existing imx412 users should get dummy regulators populated which the
regulator_bulk_enable()/regulator_bulk_disable() code can safely ignore.

Bryan O'Donoghue (4):
  media: i2c: imx412: Fix reset GPIO polarity
  media: i2c: imx412: Fix power_off ordering
  media: dt-bindings: imx412: Add regulator descriptions
  media: i2c: imx412: Add bulk regulator support

 .../bindings/media/i2c/sony,imx412.yaml       |  9 +++++
 drivers/media/i2c/imx412.c                    | 38 +++++++++++++++++--
 2 files changed, 43 insertions(+), 4 deletions(-)

-- 
2.35.1

