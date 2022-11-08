Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDDCF6206A3
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 03:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233647AbiKHCTH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 21:19:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233645AbiKHCS1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 21:18:27 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D9BC748
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 18:18:24 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id w14so18799985wru.8
        for <linux-media@vger.kernel.org>; Mon, 07 Nov 2022 18:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n3YuBG33mSUg+KeevFq724BWAGH2q/j5UHj6f74K+0o=;
        b=XIgSGBaF7aSrpRM99n1KCGNNh/TWkmkEysilK7xA18Os0ue8XZqfAmRYli32GkpMC3
         FDeouVu9qFKfQwRZ68e9QX/FEpVVZuxqxbRCytrFQFna9GSwgkW6A91gSGMrrgNW5Fv8
         Awg3wKNe7/Obz77RKML5G9E01ocFdm5sQicWLtcfs4mD856ggDl0S0axNvQTyou7V57z
         lXUiATjMyjEMZU68qWICCBkx7NKN808nQ4qp03NaDjFSPbVaGtgl6x3Y1DtM77X2P6/Z
         Hj6MKLoVF5gKPhinI1H40fmagSUENWwBdRCoTLyJd3GYj7C8Jm+d/zzIs2crcnSJuf+g
         Xu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3YuBG33mSUg+KeevFq724BWAGH2q/j5UHj6f74K+0o=;
        b=xeTaTOYhhdv7+7+1MMmDHyrC1eTJdP9Bg6aUSpN0eadl4CJiCaK/UVAyjCTFWshy0+
         xIeY4P2EYTlhSo929KGT0mS1U4w8EsF57pbli9jEGdtl3ROdsqoCEH808JAmUCtcEZnO
         6h9JbRrw+qDVs+Q/BW54MFQBu/bzuCTmEMkxiRu55zPGn+uyGVTKzix4BZd8LeC3q3CR
         YbBus8wHR4sKv/E0d4IzyBOLElalc2zkeBs3DFeF91GtnOSBSr+Lma1oIirO5ogctlI5
         W54Dngti0l/1zA3HJdiITpaaL+sYb7RZCRPQJYRKNcZwbi690rHpNDPcKVzhw3nZzlDc
         LtaQ==
X-Gm-Message-State: ACrzQf32iQjaLzF3IyKFLMdjMrYh3KVJRDc8EDE9WeIgfhte9CKQxvN6
        nvsSwdF477jHVdW89hc8fq105w==
X-Google-Smtp-Source: AMsMyM7ocVCNeuSrVto89NM5Ea+1YI/hO/rjOvJ7zaFvWKkggba5RaBuKWROg5nKYKw/EGFnB5uIZQ==
X-Received: by 2002:a05:6000:1866:b0:236:715a:16c1 with SMTP id d6-20020a056000186600b00236715a16c1mr33989936wri.537.1667873903346;
        Mon, 07 Nov 2022 18:18:23 -0800 (PST)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d6-20020adfe2c6000000b0022cc6b8df5esm8890354wrj.7.2022.11.07.18.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 18:18:22 -0800 (PST)
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
Subject: [PATCH v3 0/3] Switch on IMX577 on RB5
Date:   Tue,  8 Nov 2022 02:18:13 +0000
Message-Id: <20221108021816.213084-1-bryan.odonoghue@linaro.org>
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
 .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts |  64 +++++++++++
 .../sdm845-db845c-navigation-mezzanine.dts    | 107 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  99 ----------------
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  38 +++++++
 5 files changed, 211 insertions(+), 99 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts

-- 
2.34.1

