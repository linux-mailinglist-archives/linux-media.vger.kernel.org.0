Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2481E5FF35B
	for <lists+linux-media@lfdr.de>; Fri, 14 Oct 2022 20:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbiJNSEZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Oct 2022 14:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiJNSEY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Oct 2022 14:04:24 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 425EB1C25E5
        for <linux-media@vger.kernel.org>; Fri, 14 Oct 2022 11:04:23 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id f11so8745667wrm.6
        for <linux-media@vger.kernel.org>; Fri, 14 Oct 2022 11:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v5TJ7eVZ9/Jzp18mDe6DZZBcaEg8INk7JzGhJhf9IKE=;
        b=iG6m3BkGzVj1dJZ/6Y66jATEnRUG7hYSiPtwstaHrxvffvDzR+O5G2JtR4ITH2InOv
         JG1yYl8u0MvO/RiwKnAVQrRf6+cA/g7nMC30Ytp6YKqEi9dWrA2UEZWfG2jFDH/nle+Z
         zbTz1lpV1zDCfvS7F0jBVpVLZi2xceAxcIxcv+urB415ZEBROFWTGdm3oblRk2PH49S2
         vygoYdQiGvTszWfXaoLvddkP3ptEoaogU4l8h9dAYXKsm6Mjnwtk4UhbNKNviECxuH90
         IxOCHC6ZbsXtSdJa2Zrl09yHCRuSyV6bSN6xYY3vaMPvzLyyVeA9yRbOGiIuKKFdwKys
         xtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5TJ7eVZ9/Jzp18mDe6DZZBcaEg8INk7JzGhJhf9IKE=;
        b=PMnnuevNwxkOvr3l5lo5ts21yg/pZeldVGOflqF8uWqm2J1BkDbXimiBYPX3CVN8mQ
         lGWfUyTog07r4dXbmc3AyahCKVD1pVZEI0+2DJMcUEoDmGRrJyE/BZ/wlu9QikQsd9Kd
         IplmaQivPObUBtVX7hcgwPjD6sTuJxdNqGNev1RR9eJcWw+SFWrF+wL6aCUhhtNloXcw
         gyabEh38yfWYckGP+aGjiHpnvubnLvPrYNPaMqo14PigRyjq4d7fr3zUC3F4XfZYgQ4F
         eFWCWs1SgYqXD3AsxLQVG0grwbWevIfKnbCR/jAIndSgl7nqabT4PPA0jB27SB/nwa5/
         Y5pg==
X-Gm-Message-State: ACrzQf0x46ArtlSMFa82xBTIY9ATeR1ZkL9O8Aaz4Nt0+/GaeNgq9nDy
        GeMPU9xStO/u0+xvbWi1pQ66Qg==
X-Google-Smtp-Source: AMsMyM6mSUxRqBbBxBIi8hr0PpvDeu9lbPoHqM6+hcpwTIZ2R4INliHFGhRKSNfgO79J4jtGz0dhXg==
X-Received: by 2002:a5d:65c6:0:b0:22e:36aa:65be with SMTP id e6-20020a5d65c6000000b0022e36aa65bemr4218918wrw.531.1665770661371;
        Fri, 14 Oct 2022 11:04:21 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c001100b003c6bbe910fdsm8950346wmc.9.2022.10.14.11.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 11:04:20 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v6 0/3] Add imx577 compatible to imx412
Date:   Fri, 14 Oct 2022 19:04:14 +0100
Message-Id: <20221014180417.3683285-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
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

v6:
- Drops -items encapsulating compatible - Krzysztof

v5:
- Drops imx477 from compat strings
  After Dave's comments I went and got the official imx477 sensor for the
  RPI and fired up the upstream imx412 usptream.

  Aside from the chip-id, the # of mipi-data lanes doesn't match and as
  Dave subsequently pointed out, neither do the PLL settings.

  I think it is possible to import a lot of the imx477.c code in the RPI
  tree into imx412/imx577 and potentially unify the code base. Even if its
  not possible to unify the code in the RPI imx477 can probably be adapted
  to imx412 for some combination of test patterns, data-lanes or PLLs.

  Anyway dropping imx477 is the right thing here since there's more work
  than a simple compat string to unify with imx412.c

Resend:
- Cc Rob and Krzysztof

v4:
- Squashes dt-bindings addition - Sakari
- Squashes compat string addition to driver - Sakari
- Drops checking fwnode(&client->dev), checks for !name - Sakari
- Retains imx477 compat
  I think we have established that imx477 and imx577 do have additional
  settings and modes over the imx412 which, we can and hopefully will add
  in as time goes by. What we have upstream will work for all three parts.

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

Bryan O'Donoghue (3):
  media: dt-bindings: imx412: Extend compatible strings
  media: i2c: imx412: Assign v4l2 device subname based on compat string
  media: i2c: imx412: Add new compatible strings

 .../devicetree/bindings/media/i2c/sony,imx412.yaml       | 4 +++-
 drivers/media/i2c/imx412.c                               | 9 ++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.34.1

