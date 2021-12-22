Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F2247CA48
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 01:35:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239541AbhLVAfr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 19:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbhLVAfr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 19:35:47 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A459C061574
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:35:46 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id a9so1300190wrr.8
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h0Zf2gzsRp6VToYpioLi3lBcajNOnixbJvqv5xa970A=;
        b=E2xnd5V1gcfsBxcT854U585uRoyaHgypaSGkMNpTTMaoxUiFeCU0CEaDEUc9b9dFHD
         N1lEDo+n71vV54Yw1phLnCiACCELfpCW/OCd60yw2NMdgcFEx8aQBU8u+u7VZ7sd6a/C
         m+1cy/dfI0hnywI9Z4dkdR2ErF4pv3zJDGiQFzVfQjbse7QU9PpWsKBTV4ocSfTQecaV
         t+YTn9GGmLMWFjTop0jwIAKjgFxhYNJC6GLQpPredldsHiIs3zPKzg1XAM73IE7ABaaL
         s4o1lXBoDILC65p9celfJpTsyLLlg4ALeK9aqtUtJxIUdg0fcgBPGqljeYDueFnuuTy6
         1Jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h0Zf2gzsRp6VToYpioLi3lBcajNOnixbJvqv5xa970A=;
        b=fuyjv0lv6TAtgfuvVd2kgflGWHVA1AAy4MhHr6eXjUS11voRmk+ArnFt6Bt5L8dhqK
         VyqpKWZQ+29YiCnK+diFtlal72w/kN/3qUw+G5Nl/2MYpoKZlO6reV0EIg2IvHyaya6F
         xgwOO0LClTXuVBuYd42TDAvNKWw40ENh/QXSNnBqUMbr6vxvp4FBeiF+wpki911L3P3T
         oDz7ilcn/zVp7T+gGgdqFVdSo+e2kY61OY5k4xB1t/8j3nsEC11U6yhKGAzE6iILGnMI
         vyTaxjVSJRSsFxcn7fmOG95iTSt0z+MdXUoJyyxLt5twET9xlhHEji2yexgFCirE2omP
         o39A==
X-Gm-Message-State: AOAM532YR3e9pniKbpMqSyfmvhCA4aw4fa/SDHJxNFDTSdDHkZoLb9r9
        O+uRBEj4T7nQ6ME4c+Sdu0PxQw==
X-Google-Smtp-Source: ABdhPJzI5drqgK1FK9bE4CvuPsB4Q6LQrcv2bork+oSgmf7BpuuIDu/wHHTpzdyVWPeXDboYyBRq0A==
X-Received: by 2002:adf:d1ef:: with SMTP id g15mr416871wrd.198.1640133345151;
        Tue, 21 Dec 2021 16:35:45 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:35:44 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 00/19] CAMSS: Add SM8250 support 
Date:   Wed, 22 Dec 2021 00:37:32 +0000
Message-Id: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V3:
Publishing this V3 to make it a bit easier to merge

- Adds Rob Herring's RB for the first DTS change
- Adds Robert Foss' RB for the final three patches
- Validated on latest 5.16-rc6 on rb3 and rb5
- No functional changes to v2

Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=v5.16-rc6-sm8250-camss-imx577-only-v3
Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=v5.16-rc3-sm8250-camss-imx577-only-v2

RESEND V2:
+ Cc: devicetree@vger.kernel.org on first patch

V2:
- Adds Tested-by Julian Grahsl as indicated.
- Fixes low-level noise checkpatch --strict
  I ended up having to push defines into static inlines for this.
- Adds Reviewed-by Robert Foss.
- Adds VFE/CSID fix for sdm845 as explicit additional sdm845 specific
  patch per Robert's suggestion.

I took the time then to test out on sdm845 to ensure the new patch breaks
nothing "./cam -c 1 --capture=1 --file=capture.raw" continues to produce
expected data.

Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=v5.16-rc1-sm8250-camss-imx577-only
Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=v5.16-rc3-sm8250-camss-imx577-only-v2

git diff v5.16-rc1-sm8250-camss-imx577-only..v5.16-rc3-sm8250-camss-imx577-only-v2 -- drivers/media/platform/qcom/camss

V1/RESEND:
RESEND: git send-email --to=inux-arm-msm@vger.kernel.org -> --to=linux-arm-msm@vger.kernel.org

This series is imported from excellent enabling work contributed by
Jonathan Marek which we have picked up in Linaro for the RB5 project.

Link: https://patchwork.kernel.org/project/linux-arm-msm/patch/20210511180728.23781-2-jonathan@marek.ca/
Link: https://www.qualcomm.com/products/robotics-rb5-platform
Link: https://www.96boards.org/product/qualcomm-robotics-rb5
Link: https://www.thundercomm.com/app_en/product/1590131656070623?index=1&categoryId=category0&tabIndex=1

The RB5 has a slightly different sku I think to Jonathan's platform -
QRB5165 in our case with a different version of LK the relevant bootloader
for the board.

As a result we needed to make some additional updates to the provided
patcheset, included here.

The most notable changes are:

- Addition of clocks.
- Addition of bandwidth settings.
- Representing the dependency on a VFE for a given CSID so that V4L
  subdevs will come out of reset right when poked.

A full tree which is bootable and capable of producing pixel data from the
imx577 main sensor is available here, with this series being a sub-set of
the necessary patches on the SoC side only.

Link: https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=v5.16-rc1-sm8250-camss-imx577-only

media-ctl --reset
media-ctl -v -d /dev/media0 -V '"imx412 '20-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'

yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Bryan O'Donoghue (3):
  media: camss: Add SM8250 bandwdith configuration support
  media: camss: Do vfe_get/vfe_put for csid on sm8250
  media: camss: Apply vfe_get/vfe_put fix to SDM845

Jonathan Marek (16):
  media: dt-bindings: media: camss: Add qcom,sm8250-camss binding
  media: camss: csiphy-3ph: don't print HW version as an error
  media: camss: csiphy-3ph: disable interrupts
  media: camss: csiphy-3ph: add support for SM8250 CSI DPHY
  media: camss: csid-170: fix non-10bit formats
  media: camss: csid-170: don't enable unused irqs
  media: camss: csid-170: remove stray comment
  media: camss: csid-170: support more than one lite vfe
  media: camss: csid-170: set the right HALT_CMD when disabled
  media: camss: csid: allow csid to work without a regulator
  media: camss: remove vdda-csiN from sdm845 resources
  media: camss: fix VFE irq name
  media: camss: vfe-170: fix "VFE halt timeout" error
  media: camss: Add initial support for VFE hardware version Titan 480
  media: camss: add support for V4L2_PIX_FMT_GREY for sdm845 HW
  media: camss: add support for SM8250 camss

 .../bindings/media/qcom,sm8250-camss.yaml     | 450 ++++++++++++++
 drivers/media/platform/qcom/camss/Makefile    |   3 +-
 .../{camss-csid-170.c => camss-csid-gen2.c}   |  32 +-
 .../media/platform/qcom/camss/camss-csid.c    |  56 +-
 .../media/platform/qcom/camss/camss-csid.h    |   2 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 184 ++++--
 .../media/platform/qcom/camss/camss-csiphy.c  |   9 +-
 .../media/platform/qcom/camss/camss-vfe-170.c |  12 +-
 .../media/platform/qcom/camss/camss-vfe-480.c | 564 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |  17 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |   4 +
 .../media/platform/qcom/camss/camss-video.c   |   5 +-
 drivers/media/platform/qcom/camss/camss.c     | 306 +++++++++-
 drivers/media/platform/qcom/camss/camss.h     |  18 +
 14 files changed, 1558 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
 rename drivers/media/platform/qcom/camss/{camss-csid-170.c => camss-csid-gen2.c} (95%)
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-480.c

-- 
2.33.0

