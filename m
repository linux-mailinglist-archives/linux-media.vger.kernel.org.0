Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 817DA626964
	for <lists+linux-media@lfdr.de>; Sat, 12 Nov 2022 13:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234875AbiKLMlm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Nov 2022 07:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbiKLMlk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Nov 2022 07:41:40 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314BD12771
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 04:41:39 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id y14so18126455ejd.9
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 04:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6LvVDvMmoL+PDPHAp80VdwGtzPjns/iH0XN66sbugS4=;
        b=ol6WVho72jaI/7y1NAP52iS2HMz1UK3dsK5sQoauJNJExDeF5QYG7q2AY/rpM5hH2f
         x1My35XgBIQzASI/ekS/nc1uCVSZDe0ktttUWsld0tEvE9fVYlB4CocGEA4VzzMBQKLk
         2NR73HO8jTBKLeU8vC8FUvIWPXrNByvCwaDm6dTClxSbEGEgnpepoL9IKy5YtvT4krSc
         LnR6rey0fKaJqhy4KNbxnWbxAqqH7uOf5YznTNTBj5Fl4lR50UFT9hFh+G7N835QEKlc
         cWtjWE8rgHF4Hs0kYUwPk/fO2vpUSMhFyE6Qtz/Mk5+o2u3Np8wlg1Dfa//8qLvE23Qj
         EqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6LvVDvMmoL+PDPHAp80VdwGtzPjns/iH0XN66sbugS4=;
        b=M2MJa1HVHe+ZrcRsN0zadnjFVT6hwnX4cmBUSXL/VVP0hg75WVnao0YbbuGG2feCY1
         i1AFzLIejjAJxI++u4Ywxalx3zMtpv63XeG9mVVQ2bBmANcktTwq81EV7YWFZymtwrhc
         FTLpsqZXXi/dOLzwDe6ncJe2QbGfIJEthoFmcZD6/a4YtGpXl3oR0gfAPMliZdUZIdMO
         mFFIHWhx98JQLDjZ/MO5lKXttQ92o8bpLmkPEu+gtxgEqus735hCj4fLSy/C1NP+D4nt
         0fdgRz9EPySdwVIRmmUWbJMlIj3S6dZrtVGDx9kk+ZXXtoYBartkF0g7sRHW2w5rgjU4
         xkWA==
X-Gm-Message-State: ANoB5pm7NBZR5fnYWgliiYYS3YjEPkIHCwALyKILuKvOoSR1D1+vlsDN
        fwlgSXZUwabBg3lhRPbxHm+/MQ==
X-Google-Smtp-Source: AA0mqf50PrfbdePSyjwnZEDIDtiddro2cHlerxuaGdBT5E54f4nOHl0EI6nN0Yi7vHxTTPWM5ZUZPw==
X-Received: by 2002:a17:906:3089:b0:78a:383a:e714 with SMTP id 9-20020a170906308900b0078a383ae714mr5075560ejv.105.1668256897732;
        Sat, 12 Nov 2022 04:41:37 -0800 (PST)
Received: from localhost.localdomain (2001-1c06-2302-5600-7e82-4de3-e7e5-df38.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7e82:4de3:e7e5:df38])
        by smtp.gmail.com with ESMTPSA id h23-20020a170906585700b007317f017e64sm1882915ejs.134.2022.11.12.04.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 04:41:29 -0800 (PST)
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
Subject: [PATCH v4 0/3] Switch on IMX577 on RB5
Date:   Sat, 12 Nov 2022 12:41:23 +0000
Message-Id: <20221112124126.86815-1-bryan.odonoghue@linaro.org>
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

Bryan O'Donoghue (3):
  arm64: dts: qcom: sm8250: camss: Define ports address/size cells
  arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Add vision mezzanine
  arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Add navigation
    mezzanine dts

 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts |  63 ++++++++++
 .../sdm845-db845c-navigation-mezzanine.dts    | 109 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 101 ----------------
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  38 ++++++
 5 files changed, 212 insertions(+), 101 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts

-- 
2.34.1

