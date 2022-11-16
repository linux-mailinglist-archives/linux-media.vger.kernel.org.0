Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3291A62C496
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 17:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233475AbiKPQgA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 11:36:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233555AbiKPQfc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 11:35:32 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 885C05B5A4
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:28:06 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id h9so30804104wrt.0
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pNFHDkn6ncnlygTA2saZMCRROi8LNNLnuC/3Q5k3vSo=;
        b=bfLhrL4tNGeDEAWaOYNAAs4mUSpqOy0W5a3lbFF6EQS8ojp3Zy28i8NkTB2/D1fhr0
         2ly8RziHT+jwoTKMxAYR9aSzn9GzU0PvhIk5OOQE0jTlvru3M20k0pQt2in1p6C4tvMt
         EfbuU+Zt2r8WmUSXsrIHoHTwNfQpAuLThC9WuNEOd/+tlN5lP5CaEQKtCPSp92at1+/J
         Gn2mT9KZcGHaewqAMcXixD5memmT3Wqqj7sGQ9mhFb2jeuUDQ4bRcf4S4orn3To2s+zE
         Pjb2Ggk4A3i1kkx8gw7csGx3sjWKnTcJfmMNK6Q/7vsALiKHNKD0bnD2DTxiIVy12sw0
         +yvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pNFHDkn6ncnlygTA2saZMCRROi8LNNLnuC/3Q5k3vSo=;
        b=JRR9mxJMkD3Ns6z++ourFOmcCvoZbAQaiQjdBeKwrbkjU1qCNsS9lFKPIJOPHG5CPX
         iLyS06hr+EBVjoDawqP8NDcKeWTa3rox0462MYi6ZIE54G0gkaPFl4LlUzV4HtXQeW4T
         MeCLX77CPO+9YXgDmqU9YZmGa0WHUSP199jCOv6dlaaKtVKeAfr7han0apAHRTr/i723
         9FWM0PnlD1fejMSTRxI+83VC+9A0DZwMPQKiT4LzIm60v/pbTkDv2EAZdaS664nRndOc
         qU/3HC6P8LEqjAPiVD1e+cTqDZPINe2Cepo03VX4DkGWIR1hictfUfTPdv2bV9Xi/OcD
         gX8g==
X-Gm-Message-State: ANoB5pnjpvqDGLdOeaF36KKu3awUU389BpUELyLay60RltFbsnJcKEAp
        ljM7JMDTeSv/Nqbrl59Gn1jMHA==
X-Google-Smtp-Source: AA0mqf7+DB0FtqxZYnK760Z7jKL2/gwCEwPmIAXMya3QlVEVEgd48oqgym6b/T4Tt32gfWmyG825kQ==
X-Received: by 2002:adf:e892:0:b0:228:c1a8:6ef0 with SMTP id d18-20020adfe892000000b00228c1a86ef0mr14267698wrm.584.1668616085099;
        Wed, 16 Nov 2022 08:28:05 -0800 (PST)
Received: from localhost.localdomain (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s3-20020adfecc3000000b0022e653f5abbsm15459168wro.69.2022.11.16.08.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:28:04 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v6 0/7] CAMSS fixes for rb3, switch on IMX577 for RB5
Date:   Wed, 16 Nov 2022 16:27:54 +0000
Message-Id: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
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

V6:
- Squashes down ok/okay disable/disabled
- Adds Rb as indicated by Laurent, Konrad
- Alphabetizes existing rb3 dts and new rb5 dts for camera
- Adds in ports@ definition per Laurent's suggestion for sm8250
- Adds in ports@ in dtsi for sdm845
- Drops reg = <x> in port definition of sdm845-db845c
- ov9282 for rb5 is omitted as more work needs to be done to
  get this sensor delivering CSI data.
- ov7251 left as-is upstream, disabled on rb3
- Plan to look at overlaying both of these in the future
  but there may be bootloader blockages for that so left alone
  for the moment.
- Tested on linux-next as at today

Previous
https://lore.kernel.org/all/20221112172650.127280-1-bryan.odonoghue@linaro.org/

Bootable
https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-22-11-15-sm8250-camss-vc

V5:
- Rolls three identified dts non-confirmances into three separate patches - Konrad
- Fixes the "both" left in the git log - Konrad

Previous
https://lore.kernel.org/all/20221112124126.86815-1-bryan.odonoghue@linaro.org/

V4:
- Rebases on top of Konrad's comment fixes to migrate into rb3 mezz.dts -Bjorn
- Adds -state suffix - Bjorn
- Adds -pins suffix - Bjorn
- Removes redundant newline - Krzysztof

Previous
https://lore.kernel.org/all/20221108021816.213084-1-bryan.odonoghue@linaro.org/

Dependency for the imx577 should be merged in 6.2
https://git.linuxtv.org/sailus/media_tree.git/log/?h=for-6.2-2-signed&ofs=50

V3:
- Ordering patch was applied separately, now dropped from this series.
- camcc disable patch similarly is already applied, dropped here.
- RB5 and RB3 now have separate camera specific DTSI files
  per perferences expressed on the mailing list by Konrad, Vladimir and
  Bjorn.
- Agreeing a imx412 change spiralled a bit into a wider discussion however
  after a good bit of debate and testing on different hardware there is a
  series to add imx577 as a compat string to the imx412.c driver.
  So this series depends on that series being merged.
  https://www.spinics.net/lists/linux-media/msg219989.html

  Given the addition of mezzanine specific dtsi I thought it was worthwhile
  to kick off a review now since the sensor name change is agreed but not
  yet applied and all other outstanding comments have been addressed.
 
V2:

- Adds fix for bug identified by Vladimir
  The CCI i2c_adapter_add() and pm_runtime_enable() are racy.
  This is a generic problem not related to the rb5/imx577 but, for the sake
  of our conversation/review's context I'll add it into this series.
- Include Vladimir's camcc patch
  I've also opted to include Vladimir's disable of camcc to make the enable
  of it in my patchset logical.
- Move address/size cells Konrad
- Remove newline in pin definitions - Konrad
- Remove sensor 'status = "okay"' - Konrad
- Add comment to qrb5165-rb5.dts re: imx412 and imx577 difference - Konrad
- Move pin definitions to 8250 dtsi - Vladimir
- Drop power domain from sensor definition - Vladimir
- Correct to "add to cam2" not "cam1" in commit log - bod

To make verification of the CCI race eaiser I've provided a defconfig both
with and without modules enabled.

Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-24-05-22%2bimx577-rb5
Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-24-05-22%2bimx577-rb5-compiled-in

git diff linaro/linux-next-22-05-22+imx577-rb5 linaro/linux-next-24-05-22+imx577-rb5

V1:
Linux-next now has everything we need to switch on this sensor both in the
qcom DTS and in the imx412 driver.

After this, no further dts or driver work is required to capture images on
the RB5.

Here's a bootable linux-next with a kernel config. I added Vladimir's
power-domain changes on-top to verify nothing breaks for me.

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-18-05-22%2bimx577-rb5

Bryan O'Donoghue (7):
  arm64: dts: qcom: sdm845: Define the number of available ports
  arm64: dts: qcom: sdm845-db845c: Drop redundant address-cells,
    size-cells declaration
  arm64: dts: qcom: sdm845-db845c: Drop redundant reg = in port
  arm64: dts: qcom: sdm845-db845c: Use okay not ok, disabled not disable
    for status
  arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Add navigation
    mezzanine dts
  arm64: dts: qcom: sm8250: camss: Define ports and ports address/size
    cells
  arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Add vision mezzanine

 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts |  62 +++++++++++
 .../sdm845-db845c-navigation-mezzanine.dts    | 104 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 101 -----------------
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  16 +++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  62 +++++++++++
 6 files changed, 246 insertions(+), 101 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts

-- 
2.34.1

