Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0D4716AFA
	for <lists+linux-media@lfdr.de>; Tue, 30 May 2023 19:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233248AbjE3Rav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 May 2023 13:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232524AbjE3Rat (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 May 2023 13:30:49 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D4F114
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:36 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f61530506aso50380805e9.1
        for <linux-media@vger.kernel.org>; Tue, 30 May 2023 10:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1685467834; x=1688059834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WFaIYnk2SxWO8HPk/17JcKFPMoYuPsU6m7UH1DigPK0=;
        b=jEmHW8qA55ajMKFpqBncY7BDrPvpxhKZBmMG0uUOQycFIC7a3LPoOV0SxUt5EB6cm9
         rnRViiJUjw06Hw/d3HUmSmnwP076JmWPPKHs4mdwdvlicSQPSpO7SbQZe4u6NBR3uH4P
         PFGSbElskIBne7seWEWSK3OjFqLLDzMBjFNFdQjxHxmCzU7hWVc9kUJ3kfi8Ti7cnkZg
         Zl/UyOOpgS6WNlTVdZ20kygqQ/YpxgT6l0zODJIu3SdTWXagkzMT7DaubXeMRHEjgs6X
         JHTPY5Q/AOzi11N/3o8yjgjGDKpMsw/oTY054Imgcr0hPnLMlyZ35zN/Pk9vUGo7I+21
         46mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685467834; x=1688059834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFaIYnk2SxWO8HPk/17JcKFPMoYuPsU6m7UH1DigPK0=;
        b=etdqkm4ZHe5cBNCUSly5TuNeLgPwL26n54fGh9i3YeV6y6FxUROLUH+izJmeI5HnIa
         5lxlEXGevfnEHM2JiBdOGjjP6gLIU357C2GZTPi7g3fM0PvOy+S+L5qapIVwkaYI1xJR
         vw8PYHTk5YlKRzi3atWwG7KjvkbXbcxPavpq9eHCzxTNRALCHUyUXh6VqVB2adDUQQ2T
         14DWz7JPRfS/QcTCKFBo+xtR9G7T9bXFmJ+fBPTftvBYH5+5as64CanxnMdMrF2NyPfk
         szruKBxT8PjGd5hC7ePmvMoVkvosPSpDjJkJDwYd2Vr7RZiAmEGyjeI3sdJrQ4DfP0NO
         22fw==
X-Gm-Message-State: AC+VfDxqobPufd64OjCHMVFocKBHJsgAh0FG7V0znc+pXxvZwwFwwbOt
        ME8WLJEl9b3/51IrKsKy+K6YyA==
X-Google-Smtp-Source: ACHHUZ5pxKgQgEyrUAL9iERmM3A/xnPql/gWhG/NF6ym8V8fu4BQxne0sTpczWfygQBrzREvgmIByg==
X-Received: by 2002:a05:600c:210e:b0:3f6:906:b659 with SMTP id u14-20020a05600c210e00b003f60906b659mr2220452wml.33.1685467834610;
        Tue, 30 May 2023 10:30:34 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id h14-20020a056000000e00b0030ae901bc54sm3964823wrx.62.2023.05.30.10.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 10:30:34 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 00/21] imx258 improvements series
Date:   Tue, 30 May 2023 18:29:39 +0100
Message-Id: <20230530173000.3060865-1-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a set of patches for imx258 that allow it to work with alternate clock
frequencies, over either 2 or 4 lanes, and generally adding flexibility to the
driver.

Tested with an IMX258 module from Soho Enterprises that has a 24MHz oscillator.
Both 2 and 4 lane configurations work with correct link frequencies and pixel
rates.

Jacopo has tested on a PinePhone Pro which has an ~19.2MHz clock fed from the SoC,
He confirms that the two lower resolution modes work, but not the full res mode.
Comparing to the BSP it looks like they have some weird clock configuration in
the 4208x3120 mode (nominally 1224Mb/s/lane instead of 1267).
As it has never previously worked directly with the mainline driver this isn't a
regression but may indicate that there is a need for support of additional link
frequencies in the future.

The last patch that makes HFLIP and VFLIP configurable may be contentious as I've
retained the default configuration of inverted from the original driver. I know
this was discussed recently, but I can't recall the final outcome.

I am relying on someone from Intel testing this out, as correcting the cropping
and supporting flips has changed the Bayer order. Seeing as this is all above
board in V4L2 terms I really hope that the layers above it behave themselves.

Cheers
  Dave

Dave Stevenson (21):
  media: i2c: imx258: Remove unused defines
  media: i2c: imx258: Make image geometry meet sensor requirements
  media: i2c: imx258: Disable digital cropping on binned modes
  media: i2c: imx258: Remove redundant I2C writes.
  media: i2c: imx258: Add regulator control
  media: i2c: imx258: Make V4L2_CID_VBLANK configurable.
  media: i2c: imx258: Split out common registers from the mode based
    ones
  media: i2c: imx258: Add support for 24MHz clock
  media: i2c: imx258: Add support for running on 2 CSI data lanes
  media: i2c: imx258: Follow normal V4L2 behaviours for clipping
    exposure
  media: i2c: imx258: Add get_selection for pixel array information
  media: i2c: imx258: Allow configuration of clock lane behaviour
  media: i2c: imx258: Correct max FRM_LENGTH_LINES value
  media: i2c: imx258: Add support for long exposure modes
  media: i2c: imx258: Issue reset before starting streaming
  media: i2c: imx258: Set pixel_rate range to the same as the value
  media: i2c: imx258: Support faster pixel rate on binned modes
  dt-bindings: media: imx258: Rename to include vendor prefix
  dt-bindings: media: imx258: Add alternate compatible strings
  media: i2c: imx258: Change register settings for variants of the
    sensor
  media: i2c: imx258: Make HFLIP and VFLIP controls writable

 .../i2c/{imx258.yaml => sony,imx258.yaml}     |   9 +-
 MAINTAINERS                                   |   2 +-
 drivers/media/i2c/imx258.c                    | 994 ++++++++++++------
 3 files changed, 675 insertions(+), 330 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{imx258.yaml => sony,imx258.yaml} (90%)

-- 
2.25.1

