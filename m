Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 524203A0706
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 00:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234489AbhFHWjy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 18:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235164AbhFHWjv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 18:39:51 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAEC2C061574
        for <linux-media@vger.kernel.org>; Tue,  8 Jun 2021 15:37:43 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id 93so9207788qtc.10
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 15:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f8KKZp9p4T52mWssg/ioLod7mgnjoZBlX8q2vGwB4Gs=;
        b=dANiAJZSTKr2CdLU0E2rgby4U9Ue2OGJ/CdRtL7FQg56FEjDpFcPCzzAJOTq2+WQHT
         PXIOzfyTzqTJelhComj0bsW29SNpwRQmySGsrunGQ2iiSHPNU7KjNm4RinuKx/8GtPaE
         YMjM7Z4CAxWRxBW5MXIQ34N/bXrjk/UTMmpIvq/rvhFWOFZZH2SDZY2zFUGt4B5IYEPt
         +UvYVrRwWvEpRHAuoW2HHnWoLV4ZRk3valvN3zFkghkjmkJwCtf87jupih0dsojWubE0
         n40saO5M/AZ/0ZR3yrCMU8pQgdz2zrqbCqwzXfmIqIVWXBQjI0KflLNL0RKON7BF32IE
         2qBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f8KKZp9p4T52mWssg/ioLod7mgnjoZBlX8q2vGwB4Gs=;
        b=UVi52cMJDyykk5TA0AofCVSHN7nQZRDip3ww9q4hcQRuwdADViqXlArDiyU7ng7ZpY
         bqDB8oHd5gfIvSzO79bGl8nTOvIGDPV38DRDySKIQI1jD6dzs+YAkkiPVkzRLjCayFXQ
         7bgagGW0xqgDPILIU7uOaSJLaE2TV84pAK9e/nnnkeN9qpADRB9jekz9P0bddgA1IjPH
         Brtj8ZR5oH1cPcCi8INNTfbVG0dL4VKrI/RIsMOu6OS9xhyEPunC4oCXyLKjH1qeihBJ
         fMsFIJRvkcpQNqjCklEH4d0K4hmwzi9kriVDyzUlXHXFn555ZZ4ZgZ3p03fpjgCkMSig
         eWWw==
X-Gm-Message-State: AOAM5323YiiDVNJnSZSVZrg0TtkPPbivuyotPzhE51Ec8iSND5R4BLzE
        0WQ5w7eFSGU3FlPwYrmQqehtcw==
X-Google-Smtp-Source: ABdhPJyUHL2nFV7DwXU0kKPHWeKA7OJKnN40XVZ4z8YyT8LkDvLCsYuQ+iAuC+4HyGsiBxAzJa4Qng==
X-Received: by 2002:ac8:5bca:: with SMTP id b10mr1164997qtb.270.1623191862905;
        Tue, 08 Jun 2021 15:37:42 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m3sm2324266qkh.135.2021.06.08.15.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 15:37:42 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Todor Tomov <todor.too@gmail.com>
Subject: [PATCH 00/17] CAMSS: SM8250 support (and some fixes)
Date:   Tue,  8 Jun 2021 18:34:49 -0400
Message-Id: <20210608223513.23193-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds initial support for SM8250 and its 4 VFEs and 6 CSIPHYs.
The only big change is the added camss-vfe-480.c to support the
Titan 480 VFE.

v2:
 - Fixed some typos in commit messages (patches 02 and 08)
 - patch 03 ("media: camss: csiphy-3ph: add support for SM8250 CSI DPHY"):
   - moved definition of CAMSS_8250 to this patch,
   - removed unused lane_enable variable
   - added a default unreachable case to avoid a warning
   - added a is_gen2 variable (minor rework)
 - Undo DECODE_FORMAT_PAYLOAD_ONLY change, add comment instead (patch 04)
 - "ops" reworks in addition to removing dead code (patch 12)
 - renamed csid-170 to csid-gen2, added defines for offsets, add missing
   camnoc_axi clock to sm8250 vfe resources (patch 16/17)

Jonathan Marek (17):
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
  media: camss: remove some vfe ops and clean up dead vfe-170 code
  media: camss: vfe-170: fix "VFE halt timeout" error
  media: camss: Add initial support for VFE hardware version Titan 480
  media: camss: add support for V4L2_PIX_FMT_GREY for sdm845 HW
  media: camss: add support for SM8250 camss
  media: dt-bindings: media: camss: Add qcom,sm8250-camss binding

 .../bindings/media/qcom,sm8250-camss.yaml     | 399 +++++++++++++
 drivers/media/platform/qcom/camss/Makefile    |   3 +-
 .../{camss-csid-170.c => camss-csid-gen2.c}   |  32 +-
 .../media/platform/qcom/camss/camss-csid.c    |  45 +-
 .../media/platform/qcom/camss/camss-csid.h    |   2 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 184 ++++--
 .../media/platform/qcom/camss/camss-csiphy.c  |   9 +-
 .../media/platform/qcom/camss/camss-vfe-170.c | 101 +---
 .../media/platform/qcom/camss/camss-vfe-4-1.c |  25 +-
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  63 +-
 .../media/platform/qcom/camss/camss-vfe-4-8.c |  65 +--
 .../media/platform/qcom/camss/camss-vfe-480.c | 545 ++++++++++++++++++
 .../platform/qcom/camss/camss-vfe-gen1.c      |  94 +--
 .../platform/qcom/camss/camss-vfe-gen1.h      |  39 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |  29 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |  17 +-
 .../media/platform/qcom/camss/camss-video.c   |   5 +-
 drivers/media/platform/qcom/camss/camss.c     | 205 ++++++-
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 19 files changed, 1523 insertions(+), 340 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
 rename drivers/media/platform/qcom/camss/{camss-csid-170.c => camss-csid-gen2.c} (95%)
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-480.c

-- 
2.26.1

