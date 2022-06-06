Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80AFD53E76E
	for <lists+linux-media@lfdr.de>; Mon,  6 Jun 2022 19:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238751AbiFFNUg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jun 2022 09:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238745AbiFFNUf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jun 2022 09:20:35 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45DF72875BD
        for <linux-media@vger.kernel.org>; Mon,  6 Jun 2022 06:20:34 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id p5-20020a1c2905000000b003970dd5404dso7935401wmp.0
        for <linux-media@vger.kernel.org>; Mon, 06 Jun 2022 06:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vbEGunpQMZ4CoBatfPFiRO6lF47Z7bGeYfW1niLLS14=;
        b=m37Qm3abo5Qsrfsrp2kaLrYcHrLEkjiAWJcUXN/VJFXuKOZ956TWK4gFfStbO227zu
         AmLCvNRViH1vVh4NwNyOezkXc6u8gqhkOt/86JJ7Fr+rsb3pLItGgX4UgtYe4tP4ezYG
         +zTz6RIaTC+8y8TaqGPEx9LmKp8qaEq4tZyURV5N4969I89fudyalS1GlBfnCHiqxtAo
         edyrwhm4CM4Lp0vbWn1bKZ42uT+Lvo4NAdl0zh6caG1B3j/6uop1AOOPfjM/5F3eZ2W8
         j+gJdcBaT6j7VotLeyFmAcZ5/LH5LKbJmHBsOTTa0z9tQYWboC/aIpsCvtAARk25jEri
         8blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vbEGunpQMZ4CoBatfPFiRO6lF47Z7bGeYfW1niLLS14=;
        b=xZb7PjK/c8pYcuD/VaLucHhF5sISCVHNhbn1gFcYj/eBPY5RPuvJw0nb6Oyzf38F/+
         FRxRC+SqKRag4cfBbh4XkYJwFDLmISSTZ6Th7H3CsGiTXbIJOyhKYkGMZjIzssW6lmGn
         6S/OpSfA+ydWybM4G7M44f8dtdGhvyHpYl1SQ70FniRiFUFOUvBZUN1XYEYqgEy6xl/h
         C+z6+5FcLkjfqC5HXFrEcCSHqjFwYf+zuneoF+RvohG1JQxQA8G9e6OYZvyHMYD6MG5l
         mtaOUD+nYHbqVy14X6tueqx/sGejReyk19gulZfugdauQecELWzmak1zi5Xzx1GkrBM9
         d3Cg==
X-Gm-Message-State: AOAM531R1ihXuCV8s4I33LYZXV7o8nsCi6efCBiaRbjWxGdfAbsimCzV
        3QUBJ6Pvl3g9xhqK5YNowcBHpw==
X-Google-Smtp-Source: ABdhPJwsEIRYKbeg16OEppSTBAMV63kVvkF+niJ9o4l7Sa2HMtrM+KdSfImZj+2gz343FcSxGLHpBw==
X-Received: by 2002:a05:600c:3c8f:b0:39b:808c:b5cb with SMTP id bg15-20020a05600c3c8f00b0039b808cb5cbmr23353024wmb.11.1654521632837;
        Mon, 06 Jun 2022 06:20:32 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i12-20020a05600c354c00b0039765a7add4sm21077810wmq.29.2022.06.06.06.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 06:20:31 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 0/5] CAMSS updates for rb3 and rb5
Date:   Mon,  6 Jun 2022 14:20:24 +0100
Message-Id: <20220606132029.2221257-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
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

V3:
This series takes in some changes to core CAMSS/CCI and to the RB3 taking
feedback from others on the list so, I've renamed from the previous "Switch
on IMX577 on RB5 with a new CCI fix" to the new title above.

- Changes pm_runtime_put() - Vladimir
- Adds Reviewed-by as indicated - Vladimir
- Adds cc-stable for the CCI bugfix - Bryan
- Splits rb3 and rb5 into "navigation-mezzanine.dts" and
  "vision-mezzanine.dts" respecitvely - Dmitry / Bjorn

I didn't add new compatible strings for the mezzanines since it doesn't
make much sense to me how that would work concatonating two mezzaines
together but, maybe there's another better argument I haven't thought of.

Again to make verification easier I've provided a buidable and bootable
tree for rb3 and rb5 containing defconfig - you can just zap the last
commit to test with modules on rb5.

Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-next-03-06-22%2bimx577-rb5

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

Bryan O'Donoghue (4):
  i2c: qcom-cci: Fix ordering of pm_runtime_xx and i2c_add_adapter
  arm64: dts: qcom: sm8250: camss: Define ports address/size cells
  arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Add vision mezzanine
  arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Add navigation
    mezzanine dts

Vladimir Zapolskiy (1):
  arm64: dts: qcom: sm8250: Disable camcc by default

 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts |  68 +++++++++++
 .../sdm845-db845c-navigation-mezzanine.dts    | 115 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 106 ----------------
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  39 ++++++
 drivers/i2c/busses/i2c-qcom-cci.c             |  13 +-
 6 files changed, 232 insertions(+), 111 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts

-- 
2.36.1

