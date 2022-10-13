Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76D9A5FD992
	for <lists+linux-media@lfdr.de>; Thu, 13 Oct 2022 14:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbiJMMvt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Oct 2022 08:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiJMMvr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Oct 2022 08:51:47 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F3566874
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 05:51:46 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id c7-20020a05600c0ac700b003c6cad86f38so3180765wmr.2
        for <linux-media@vger.kernel.org>; Thu, 13 Oct 2022 05:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rxfpDGH2jictIlxwoGFsHkbOXsSe8KCW4mTv6iXzYh8=;
        b=qGpCxFcUSzS5ecj+v070jF6EwpwIbFtQoxzPPySIpy3pK41p9Pqc8TFp3Nb+7m1rpD
         8uSlcbDKtguWZBwChL607b9LNKJHXfz846WsJeEYWxRUiTwge9Hxr+qkLGnRbJsFY1jw
         Qa0PajzW/kr7lzSrQuQXT4S5jmgwnu8GZU+3QvRq2AGW0ayUcLjSEpYAXQt/WH3w/k4J
         VyrlzgYEfUXJSHx42T4MqPeqPQWK/cKShbDBcGvdlqt4XdOHeIWmuswGlaTQOZw+J6ch
         n5XBcKXtNS8AnylLvaE+dd3mM8mY147cVmoifGS/Hwu73KYdZTKWFkgH+XukYOaHPN+W
         R3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxfpDGH2jictIlxwoGFsHkbOXsSe8KCW4mTv6iXzYh8=;
        b=QABNvAGBlKt+fVPeLrpP8SqWkzCRWrfZOnyfhZiidq05vyJ3iDFSN2QThJegcgmr1W
         gCFXe3jSF5zfhCKuPDQeBNfPe4N2mKeZV3zYUyTbXmko/sos6a2Pp4V1+8tL9yoKA1lf
         vV3ybM4IflfRBxqoBybrp/Ha8TiM0D3WUNmn4u6oNKkGJ/pj5qVA63HcDUCAweySfN6M
         hplpaxS2mJnekMZ//MC4sstXXG8yoEmOOSvJC0wJ0nF5dWT4aBvm29VlWoAJCla+dfBE
         CkULMTRILjX4FPl1c5oiBm/6jm6UBg79Cuws9DgT/14aiEFEW+vOnGv1kbc3fHHLjroP
         S4LA==
X-Gm-Message-State: ACrzQf02fFzceNmGs6QIa3BtO/8JIQqknWb/THcrvO2hpVh6ZThjltFn
        pFSD0ItlsLvMCJzOLkcQQPyuInVq0QnkTQ==
X-Google-Smtp-Source: AMsMyM7z4aSFJSNDpbizcJt856zBi297uw/52V2M3kdits0ad4AUW1uT7810zzaZ9rE92raJWbJoBA==
X-Received: by 2002:a05:600c:35cb:b0:3c6:e382:62fb with SMTP id r11-20020a05600c35cb00b003c6e38262fbmr278351wmq.22.1665665504986;
        Thu, 13 Oct 2022 05:51:44 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m3-20020a056000024300b0022e3e7813f0sm1332292wrz.107.2022.10.13.05.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 05:51:44 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v5 0/3] Add imx577 compatible to imx412
Date:   Thu, 13 Oct 2022 13:51:39 +0100
Message-Id: <20221013125142.3321405-1-bryan.odonoghue@linaro.org>
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

 .../devicetree/bindings/media/i2c/sony,imx412.yaml       | 5 ++++-
 drivers/media/i2c/imx412.c                               | 9 ++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.34.1

