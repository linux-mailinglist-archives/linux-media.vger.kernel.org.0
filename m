Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81DFD5BAECC
	for <lists+linux-media@lfdr.de>; Fri, 16 Sep 2022 16:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbiIPOCr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Sep 2022 10:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbiIPOC0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Sep 2022 10:02:26 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509BCB029D
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 07:02:19 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id r3-20020a05600c35c300b003b4b5f6c6bdso2500544wmq.2
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 07:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=GUa0XKA9lcfy9ySuz/cVC+rtnb2zwu8L/1C57aaXEZg=;
        b=PCyrRan5VF1KEM/XmmQbDdQaV57DhL/Jk4W7D9yE3eUvkWMsLotxYW+Erdi/DVf0Os
         Y+o8zlyD/gAAT1Fe9xPEz9gt3Fdt3xwTSdAMHdMvZTGkTugeHnW5r0eSX3AWKFgmcfjy
         sfrG3YUk45FmlMqcMF9I9amuh/ZgVoEUsx6O1sH6T7EAfF23kT3hGQK9q33L76OyxkKl
         v/Nd/MLSSgpzOOM+7Vx/VgdTl/PIGrapofGvToVp9BCf8FyhrOGc/1HAqGmphsQW/+Rr
         i3xsYgrHS/Jo4d7BTEQCY/vmIvmmdaV6PpoSeUCFQO7wniELt6PzEu3JJGSTvjcUepl3
         XtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=GUa0XKA9lcfy9ySuz/cVC+rtnb2zwu8L/1C57aaXEZg=;
        b=sXaOQMEEJlEIhcGGWcvwwzc8XR2tFZjeY1uvzrk6pVVq2v00DknBG3cSQvblN9VtkG
         Bu8Lt1naHNcJTtM71ikGCZHI3tQzT+jmUalFna1/Hfd2t8B75gnOLMFS9r6HBXz/WzkF
         Q+qm8a7KmfLBzQxNr7o8axeOKOJWTtbkc+YoTnusXw9Ao3VHNyJTBhRs6MM/+cz37ZFw
         ei8LHd+lyNgOOazWxFeGczLXzZYOFii5lJrlBi250fmNgtdaiJZvRFdHRcJHJAJEptlZ
         ETcqHJFK5M5V9EBbHBG1O3o5sbH/Ez4gdZOt9jhXX0uDAindggcgVTVLTCTzK2RxngI4
         lHHQ==
X-Gm-Message-State: ACgBeo38xh0vgsEsF+V3rh7INeHET29cvyjiIj2IgTpADbDK59r184Jx
        JqoXMjo7R7Fs0myMB5NY9wg8/g==
X-Google-Smtp-Source: AA6agR7+mdyguEy2bYm7cV8+uTRS306hzdEhA3C4PQ23TIhPH6SGKKAnM48ug1Q1KXFgYcjOF/tm/A==
X-Received: by 2002:a05:600c:2e52:b0:3b4:622c:1b4b with SMTP id q18-20020a05600c2e5200b003b4622c1b4bmr10523620wmf.153.1663336937626;
        Fri, 16 Sep 2022 07:02:17 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f17-20020a1cc911000000b003a61306d79dsm2615041wmb.41.2022.09.16.07.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 07:02:17 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v4 0/3] Add imx577 and imx477 compatible to imx412
Date:   Fri, 16 Sep 2022 15:02:10 +0100
Message-Id: <20220916140213.1310304-1-bryan.odonoghue@linaro.org>
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

 .../devicetree/bindings/media/i2c/sony,imx412.yaml     |  6 +++++-
 drivers/media/i2c/imx412.c                             | 10 +++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.34.1

