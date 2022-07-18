Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88387577953
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 03:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbiGRBmW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jul 2022 21:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbiGRBmV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jul 2022 21:42:21 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C47712AF8
        for <linux-media@vger.kernel.org>; Sun, 17 Jul 2022 18:42:20 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id h17so15071254wrx.0
        for <linux-media@vger.kernel.org>; Sun, 17 Jul 2022 18:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bekOncRaPF1NxvuZVFAu6mcVMT/xzfB6dU3oKKjrlTs=;
        b=MO3SpsNBx0YdBNe4EdBAkch2ap9FSo6pYSGjO7iThVm5xswWjh7WDMVkSadj4LqS3/
         XEbrqZ2keLt2mwq15CWMQWUTtSoWNgSHo8mOpaA2AGmuc2faUAH6nGyvznlf+/x7cBDc
         ywkY85CJI3dGK7SJTMfS5Mx6K6YOoovVkqrxddkqoTc/mJcoM7OCyTRVb86SQDEC1xVg
         SfdHRw6VzVi7vb1FSgZ53YCuCApOjKLd0XkldQ17Kt3wuOmRNirwLyWHLUgVR3syXgeE
         2v8UYlsItxYNBs5DxXtoJy/+LGMNF+hU+Gx8+jCNaEFTxFGL+3ASL44OhkfTquM9c/6H
         g4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bekOncRaPF1NxvuZVFAu6mcVMT/xzfB6dU3oKKjrlTs=;
        b=txmPMUrYqHpDtn2bs/UG4JtgrU16BcQB4llSLaI/MfPhMLuI4SwzAafGjZaAAi/YtH
         wjTcQrAhcEmMjYQVIsi3WCy9dAmlP0Lg4H9UUN3zKct3Exe4e0FCVrKWX3lQ7vMTSLyt
         yr5tPoO2+V8NEgHsN5+1/XZ77P4mCoH7qGupNFl51TY136rBPgOYEE0l2dQpe9FpdVkP
         oAAY+biHXEfJA8WOkqBS2iwZsQEiEd+UuoqDeozWfHdAQ/2DT449/RI6rW8I6jrMrP8b
         dPciebrExPub+8dycFFVfO5ZH1ATe0j6mUXDEjLLCccHM9/+upyNTT0A6VQkIEZ0isjX
         3gYQ==
X-Gm-Message-State: AJIora+3CuQsSrYBxe25F3DqBINsDOwhaXQeLfSxbnN7CZIibMu7owR4
        DIjNa6Db9mZWSZcQWelyBGdhTg==
X-Google-Smtp-Source: AGRyM1s57C4gHhD81Q+RdMTOBoGWHjP2XZ59G3gBO6B/x4zTY5JRHxWtUpZgJoayvcpqChU55ZJXrg==
X-Received: by 2002:a5d:5548:0:b0:21d:69c1:c09 with SMTP id g8-20020a5d5548000000b0021d69c10c09mr20573178wrw.251.1658108538957;
        Sun, 17 Jul 2022 18:42:18 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v10-20020adfebca000000b0021d76a1b0e3sm1685139wrn.6.2022.07.17.18.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 18:42:18 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        andrey.konovalov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 0/3] Add imx577 compatible to imx412
Date:   Mon, 18 Jul 2022 02:42:12 +0100
Message-Id: <20220718014215.1240114-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
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

V2:
Sakari wasn't especially satisfied with the answer imx412 and imx577 have
the same init sequence but, suggested setting the string for imx577 as is
done in the ccs driver.

https://lore.kernel.org/all/20220607134057.2427663-3-bryan.odonoghue@linaro.org/t/

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

V1:
Right now the imx412 and imx577 are code and pin compatible however, they
are distinct pieces of silicon.

Document imx577 as a compatible enum and add the compat string to imx412.c.
This allows us to differentiate these chips in DTS and potentially to apply
any future imx412 or imx577 specific changes appropriately.

Bryan O'Donoghue (3):
  media: dt-bindings: media: Rename imx412 to imx577
  media: i2c: imx577: Rename imx412.c to imx577.c
  media: i2c: imx577: Fix chip identifier define name

 .../{sony,imx412.yaml => sony,imx577.yaml}    |  18 +-
 MAINTAINERS                                   |   6 +-
 drivers/media/i2c/Kconfig                     |   8 +-
 drivers/media/i2c/Makefile                    |   2 +-
 drivers/media/i2c/{imx412.c => imx577.c}      | 622 +++++++++---------
 5 files changed, 328 insertions(+), 328 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{sony,imx412.yaml => sony,imx577.yaml} (83%)
 rename drivers/media/i2c/{imx412.c => imx577.c} (55%)

-- 
2.34.1

