Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA515B91C7
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 02:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiIOAgM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Sep 2022 20:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbiIOAfu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Sep 2022 20:35:50 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4BCE8A1F5
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 17:35:30 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id t14so28301883wrx.8
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 17:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=FhVuUNi35oGMpFYDCv1hgAMnjJ3RDIDpjbroajtzhOQ=;
        b=clcYgehzvHTn6hEhbCMc2V/kQBzDUBFvRy7aCE7sSCt5SxUMag64Kum34I411qdLCT
         a9799QWUec+GYLJyojow09qiUy1F8TGjCWF6NIB5UWgpAA9yKj6cSBEGfKgMYcp6R/Su
         vj68jWN9s179L9M0CwRifqXGnPBoXO7SLRfcMw+5yiOOqH9HXK/QCeiYS0Z64FLCN6OQ
         PCP7gBddXj0um2v6+4nJwMbHXGlm4hpPVCaS1kPXTOz6jQvcpmBQR3p73zeSsdnJbLqT
         p4+p0jt6G9dmjkGtiImSlNChWjAnQPvPs2oqq0qvh/NWyx0Pt5OijsHNa3C3R3zV8vMY
         YH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=FhVuUNi35oGMpFYDCv1hgAMnjJ3RDIDpjbroajtzhOQ=;
        b=2Mo8ATYWIpSJqAq9SWeqiDaXpeWVXV1z2cRZnx1alyNL3LixjMJuKgQW3QUR6NMJ7w
         JQq1yWOG/4GRrRJCcKtP42sBv/9mZHkWot9tqab5C5zRcDehswud6FjCYPaq68Hbv1vF
         Xj5UTJkwPB2kItFap4vzV+J6q8FpdtqlLaDKcJZ527CHBbYFE7ZaRNUAIh70rWzQ4nSh
         veYeQk+pXHnwdBrz+G6gM61kNDYBnoTlCO2I+pGow9IXW10LQSTdspLV1PZfHdvh9RKi
         H/zmWfNeHimYZMJutx27IMktlUdVQ4kb9aSK65r7J/ft6aLMMWGOD5aHyhGT7sSWYAdZ
         mxVw==
X-Gm-Message-State: ACgBeo2peDeWpZWg1FON1GHbWTgknkm7nnnNu0oa0/PuMN39xA7ONZj2
        BQvwZDvBizRRE05dZklZ/frEk22ZS7JsAA==
X-Google-Smtp-Source: AA6agR77uynwxMHJ6sMn7819/r7wDrPPeX3r1L31ll5jaie4hTK9+kjx6T88DfgbsDQc8JRe5OT+uQ==
X-Received: by 2002:adf:dc82:0:b0:22a:2c85:e28e with SMTP id r2-20020adfdc82000000b0022a2c85e28emr20603676wrj.457.1663202129228;
        Wed, 14 Sep 2022 17:35:29 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d8-20020adff848000000b002253af82fa7sm905235wrq.9.2022.09.14.17.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 17:35:28 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v3 0/5] Add imx577 and imx477 compatible to imx412
Date:   Thu, 15 Sep 2022 01:35:17 +0100
Message-Id: <20220915003522.1227073-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
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

v3:
To really get to the bottom of what was going on with the imx412, imx477
and imx577 I got a Nvida Nano with both sensors from Leopard imaging.

Interestingly the shipped driver from Leopard is called "imx477" and is
keyed to work with imx412, imx477 and imx577 with predictably the same
register init sequence.

For me aside from the physical size difference in the modules the only
discerable difference is the imx577 has a "green tinge" which is exactly
the same experience I have with the imx577 on the Qualcomm RB5 - with both
the downstream driver stack and the usptream driver.

With the modules shipped from Leopard both the imx412 and imx577 report the
same chip id of 0x0577.

I dumped the first 32 registers on both modules using the Nvidia/Leopard
stack and as expected - all of the register values match.

So I've confirmed as far as my investigation has gone, there's no
clear register we can interrogate to differentiate the parts.

- Drops renaming of the driver to imx577.c
  I continue to think this is the right thing to do but, I'm happy to
  leave that on the back burner for another time.
- Add in compatible strings for imx477 and imx577 into the dt-bindings
- Extend the imx412 per Sakari's comment re: media device naming
  https://patchwork.kernel.org/project/linux-media/patch/20220607134057.2427663-3-bryan.odonoghue@linaro.org/#24894500
- Add imx477 and imx577 with supporting code to drive media device name

Depending then if the compat string is imx412, imx477 or imx577 the media
name of the device will be imx412, imx477 or imx577 e.g. I use the
following media-ctl command depending on the specified compatible.

media-ctl -v -d /dev/media0 -V '"imx577 '22-001a'"...
media-ctl -v -d /dev/media0 -V '"imx412 '22-001a'"...

v2:
Sakari wasn't especially satisfied with the answer imx412 and imx577 have
the same init sequence but, suggested setting the string for imx577 as is
done in the ccs driver.

https://lore.kernel.org/all/20220607134057.2427663-3-bryan.odonoghue@xxxxxxxxxx/t/

I went to look at that and asked myself "how would I tell the difference
between the two silicon parts". The obvious answer is a chip identifier.

Luckily this class of IMX sensor has a chip identifier at offset 0x0016.

That looks like this for imx258, imx319 and imx355

drivers/media/i2c/imx258.c:#define IMX258_REG_CHIP_ID    0x0016
drivers/media/i2c/imx258.c:#define IMX258_CHIP_ID        0x0258

drivers/media/i2c/imx319.c:#define IMX319_REG_CHIP_ID    0x0016
drivers/media/i2c/imx319.c:#define IMX319_CHIP_ID        0x0319

drivers/media/i2c/imx355.c:#define IMX355_REG_CHIP_ID    0x0016
drivers/media/i2c/imx355.c:#define IMX355_CHIP_ID        0x0355

but then looks like this for imx412.

drivers/media/i2c/imx412.c:#define IMX412_REG_ID         0x0016
drivers/media/i2c/imx412.c:#define IMX412_ID             0x577

This made no sense at all to me, why is the imx412 driver not named imx577 ?

I went and dug into the Qualcomm camx/chi-cdk sources to find that a file
called cmk_imx577_sensor.xml has a property called sensorId which is
constrained to 0x0577.

In the Qualcomm stack this pairing of filename and identifier is
maintained for imx258, imx376, imx476, imx576, imx519, imx362, imx481,
imx318 imx334 and imx386.

Every single example I can find of a Sony IMX sensor which returns a chip
identifier at offset 0x0016 matches the driver name to the returned sensor
id both here upstream in Linux and in Qualcomm's camx stack.

The conclusion I draw from this is that imx412.c is inappropriately named.

I think the right thing to do is to rename imx412 to imx577. It is
confusing and I think wrong to pair imx412.c with a chip which identifies
as 0x0577.

v1:
Right now the imx412 and imx577 are code and pin compatible however, they
are distinct pieces of silicon.

Document imx577 as a compatible enum and add the compat string to imx412.c.
This allows us to differentiate these chips in DTS and potentially to apply
any future imx412 or imx577 specific changes appropriately.

Bryan O'Donoghue (5):
  media: dt-bindings: imx412: Add imx477 compatible string
  media: dt-bindings: imx412: Add imx577 compatible string
  media: i2c: imx412: Assign v4l2 device subname based on compat string
  media: i2c: imx412: Add imx477 compatible string
  media: i2c: imx412: Add imx577 compatible string

 .../devicetree/bindings/media/i2c/sony,imx412.yaml    |  6 +++++-
 drivers/media/i2c/imx412.c                            | 11 ++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.34.1

