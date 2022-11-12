Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6A5626ACC
	for <lists+linux-media@lfdr.de>; Sat, 12 Nov 2022 18:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235043AbiKLR06 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Nov 2022 12:26:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbiKLR04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Nov 2022 12:26:56 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D58BA17409
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 09:26:54 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id ft34so19067424ejc.12
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 09:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wqjqQ1Vg/0IcV3TkPWiIq1SGrZdW30HijXn2AsH/aS8=;
        b=aFqe4qykN7xWbN6aiXfuOEwj+g0+sfHM/DMzghu3ceVsncETH/sVbwzN1vI6dn299R
         hbLxtEWe14Y598TWowsxr/FmWaLPnvzMyoykXHSGkJdHG0g6IR2uwXvjEkIGw2Mnxi01
         Ep7Vi8ARGGoRQNrwqSyz3Wvy9hAzoIAAi0OUjnK20o8eeDi3uP5NvpDkVaGz7Y8qv8I3
         jQNLRbcKX9XbqOD6ITegjkltjV2HfT8gZEtHmJgixNzv7MHgZxsLE01SalDyKaBIc6uK
         dUNLdDtj5QemJWWoi4LJP6mdfIjjXoBRBXkFnCu8z7U1SM/k/Lt58/ZrmMPYz4efVsuQ
         ZQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqjqQ1Vg/0IcV3TkPWiIq1SGrZdW30HijXn2AsH/aS8=;
        b=Ke96ePQq8KbIUW0rDRna30szPKKrVBSZuW4hIqx3C/8rvNQabDAcMSoG8gsRgSNF+u
         AndUae5304nTWK338R4u9JgdyD5CIVC5hGgJaYVBsQjIyefHFgBIizxnGyEY+sEcZxo8
         k5BpuvhLTYDU28LPGeEg1bHrLZPeycpYMlso+ZnwZD8zqF7o5JmknUCubp9Ig9c9TOWP
         gkoynJS00MCZT45CtX+EsTo3eqf7U8pO2RUQI5uJ8FV5el/GCwbMcK/sMCOnXFmn/PCb
         zZd8AWJHeHNLobVYhk6lqwHbd0Qfyao56zuFJjqhkbhCT7TzqbCWUNqLZZt9ukCj2iGT
         huOg==
X-Gm-Message-State: ANoB5plkiRUHtaG2Ul3ruBn5rp5OWseHJJEO9ozOHU7DejEPw0l70OEy
        SRctJ6b4kljmf1luWgnCvG+jcg==
X-Google-Smtp-Source: AA0mqf5f0yV+WvjeyOFhItlwOnTZEbu3BDhI2q7HuTubjLFYoU641NWAIvdtM1dUgp4mOyomaC6afA==
X-Received: by 2002:a17:906:814:b0:78e:ebd:bf96 with SMTP id e20-20020a170906081400b0078e0ebdbf96mr5653976ejd.625.1668274013399;
        Sat, 12 Nov 2022 09:26:53 -0800 (PST)
Received: from localhost.localdomain (2001-1c06-2302-5600-3861-6a56-0346-9c90.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:3861:6a56:346:9c90])
        by smtp.gmail.com with ESMTPSA id qo9-20020a170907874900b0078c1e174e11sm2099265ejc.136.2022.11.12.09.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 09:26:52 -0800 (PST)
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
Subject: [PATCH v5 0/6] Switch on IMX577 on RB5
Date:   Sat, 12 Nov 2022 17:26:44 +0000
Message-Id: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
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

Bryan O'Donoghue (6):
  arm64: dts: qcom: sdm845-db845c: Drop redundant address-cells,
    size-cells declaration
  arm64: dts: qcom: sdm845-db845c: Use okay not ok for status
  arm64: dts: qcom: sdm845-db845c: Use status disabled not disable
  arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Add navigation
    mezzanine dts
  arm64: dts: qcom: sm8250: camss: Define ports address/size cells
  arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Add vision mezzanine

 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts |  63 +++++++++++
 .../sdm845-db845c-navigation-mezzanine.dts    | 107 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 101 -----------------
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  38 +++++++
 5 files changed, 210 insertions(+), 101 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts

-- 
2.34.1

