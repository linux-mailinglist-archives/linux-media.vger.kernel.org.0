Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D0144D9DD
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbhKKQLb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:11:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbhKKQLa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:11:30 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0B78C061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:40 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id c4so10606372wrd.9
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dnig2IPTh90KBv5ZX4mBEnFFgFNjvN5Da3FyLxd4Hj8=;
        b=ZhzvyCqaHlrzCYaJeCzb2E5UAAbVl4bm+lRIbde90BsdAJBGXBMBgT9NmrMEBWNvSr
         KNdyMbLn2I/smJeVEhi8vQBSRE7M3bmciS6shiZoQgHoD5QTfzRAlbDIzPDBJ9Ss3Dks
         el/sgSKl8o5zE76UD4TeWG6ugLsWs71tJMNJ32YwHhZAzwR7NGJ8ClDUwRKjKqeacaVl
         9u/1Eaex4k2JbUg3zWO86GHg7HIGBbcQ0FZCiqQI6VL6K2gCdiWZzFlOU37t1jHfntdu
         FkYgMRTwRMzwE3Yw4U7PBl5VDW2KGgmpxeMr58afnZtWR9+09gPmNObio2TbrTsfYF3o
         bmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dnig2IPTh90KBv5ZX4mBEnFFgFNjvN5Da3FyLxd4Hj8=;
        b=H6ZivHmMOdYgsuzdyIw0U/M4wNAQubCjEy/0AKVa8wqjGvqulOBhTvJBbrN/DgfJKk
         eavQ5LAre2u83RXaeHTUrL2ACPB8rvcCiTN63lAcN7d2EDRKWC5Xjt488DPN8kcxxg7j
         O7J+6zuSraHBBP9cHp+yeToqSANdlasC3hTnkzqUlJ+LXixJ2K7W0btt6RX3H6/Fi7GK
         hZop2vQEgIO8skjEgF0XkaRKZSjAd90/faROHODf5BtvH9l8CMLYGHfONyusXPfUcBaU
         HZ4jHPfSFCbifWw+sley8x8a77zNn36H7ttUeegjnRoV/KObvmGlbFS+5w92sbGVnVK6
         aXvQ==
X-Gm-Message-State: AOAM530m4Hlhj6YFb7YsZla9hyUF4ZWIArOzpeK2S/cPSKo/QhBwkk0/
        ZzWk615ynb7iJ534Rp21dHH5AQ==
X-Google-Smtp-Source: ABdhPJwELEmrmyBEOWzVr9IL8QwR4NZZH2Z7YoO+nYfDf0LznV7YAFFoDJwfxCZY2Z2m3/oQH6XtPg==
X-Received: by 2002:a5d:694a:: with SMTP id r10mr9966752wrw.170.1636646919477;
        Thu, 11 Nov 2021 08:08:39 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm3245558wrw.6.2021.11.11.08.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:08:38 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     inux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 00/18] CAMSS: Add SM8250 support
Date:   Thu, 11 Nov 2021 16:10:20 +0000
Message-Id: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
imx577 main sensor is availble here, with this series being a sub-set of
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

Bryan O'Donoghue (2):
  media: camss: Add SM8250 bandwdith configuration support
  media: camss: Do vfe_get/vfe_put for csid on sm8250

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
 .../media/platform/qcom/camss/camss-csid.c    |  55 +-
 .../media/platform/qcom/camss/camss-csid.h    |   2 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 184 ++++--
 .../media/platform/qcom/camss/camss-csiphy.c  |   9 +-
 .../media/platform/qcom/camss/camss-vfe-170.c |  12 +-
 .../media/platform/qcom/camss/camss-vfe-480.c | 548 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |  17 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |   4 +
 .../media/platform/qcom/camss/camss-video.c   |   5 +-
 drivers/media/platform/qcom/camss/camss.c     | 298 +++++++++-
 drivers/media/platform/qcom/camss/camss.h     |  18 +
 14 files changed, 1533 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
 rename drivers/media/platform/qcom/camss/{camss-csid-170.c => camss-csid-gen2.c} (95%)
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-480.c

-- 
2.33.0

