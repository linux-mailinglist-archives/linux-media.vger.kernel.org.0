Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4AD933C0B5
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 17:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbhCOQAf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 12:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhCOQAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 12:00:07 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A1BC06174A
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:00:07 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id y6so17911447eds.1
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=50xHxezjzw7xJhXahYnFlBbGxgi/84SjzVV5xs7wano=;
        b=Nxb7NJTCCSZzbQDMzrqPfJRdOFeKnM2L3PYHSagpPMwzfl7PTHacPs+zpf63lYzUW3
         y47gyHvm6tp3A0uq1tbKMtXYGVJl5uhW5GcRcBetcv7CF97a/Q44anJncoyEsPG3xEgQ
         LN5wQt+66O8YixNQyZscsW/ka7ZvEzRadPVhLWxpoIXo97wXjPBX8ESYsZXTc9MGwlZ9
         SZkTr+gquNGUsuY4F/byhlT2ccIuUncaWz1DvdgmjazDAKT1s/FKh5Ee9SB2WHsgCbh7
         dVyt7hECajZSHmussjMkZo++jJnpf1tVDe7Q081nq7IlajwxoaHHn35nHCzQ5BBRHMt6
         jMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=50xHxezjzw7xJhXahYnFlBbGxgi/84SjzVV5xs7wano=;
        b=nBO8Sg6zGD7tYKKDA2uYlqq+4nVaTkdYycbgN1AnyCmsXk2OFNH2Qsu9+PYeBHaQan
         kOa+CAdSK5osvdmZCRLIWsfSLVT4WzC+Ht5v5NFyMCRZHtliBM4BBIcs4EwZRklpVafH
         oCNNrRHCGQq6OsQ9OB7P3QQx2ldsViK1l/pB7FbyszDQ0OoWLCzzIwQLvnjUsMblrSkD
         xdzuVdpi+6Q3C+zIXVxFbp8Oc3mcB3jEcP+9GTcBabIVEgAsMGf7y97WNd+Tji1yybIC
         PaK+7zG1q6ujo0mKN7lXk0o1AzLzlOKFEn4w3WsU7T9YS2j7VtCODA0gn05CqNMhUh3V
         zjaQ==
X-Gm-Message-State: AOAM530+I3Uu974MV2AN/FLWo5FDyZwTqHYmePZ4Bnz7sDxU8Fbm6LJM
        SO6pVKznWdn+dzAM7aJOV8EEZQ==
X-Google-Smtp-Source: ABdhPJyoTOgiRduD7HS9li7lPl3JPwMVCsff5a5Ta/RyIHcrUiEL43Nl724ZUL8xd+8rCZDE+shGpw==
X-Received: by 2002:a05:6402:4415:: with SMTP id y21mr11635493eda.70.1615824005749;
        Mon, 15 Mar 2021 09:00:05 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id r5sm8456445eds.49.2021.03.15.09.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:00:05 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v8 00/22] Add support for the SDM845 Camera Subsystem
Date:   Mon, 15 Mar 2021 16:59:21 +0100
Message-Id: <20210315155942.640889-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series implements support for the camera subsystem found in
the SDM845 SOCs and the Titan 170 ISP. The support is partial
in that it implements CSIPHY, CSID, and partial VFE support.

The Titan generation of the ISP diverges a fair amount from the
design of the previous architecture generation, CAMSS. As a result
some pretty invasive refactoring is done in this series. It also
means that at this time we're unable to implement support for all
of the IP blocks contained. This is due to a combination of legal
considerations with respect to the IP and its owner Qualcomm and
time & man hour constrains on the Linaro side.

The CSIPHY (CSI Physical Layer) & CSID (CSI Decoder) support is
complete, but the VFE (Video Front End, which is referred to as IFE
(Image Front End) in the Titan generation of ISPs) only has support
for the RDI (Raw Dump Interface) which allows the raw output of
the CSID to be written to memory.

The 2nd interface implemented in the VFE silicon is the PIX
interface, and camss does not support it for this generation of ISPs.
The reason for this is that the PIX interface is used for sending
image data to the BPS (Bayer Processing Section) & IPE (Image
Processing Engine), but both of these units are beyond the scope
of enabling basic ISP functionality for the SDM845.

Since the Titan architecture generation diverges quite a bit from
the CAMSS generation, a lot of pretty major refactoring is carried
out in this series. Both the CSID & VFE core paths are made more
general and hardware version specific parts are broken out.
The CSIPHY didn't require quite as radical changes and therefore
keeps its current form.

Tested on:
 - Qcom RB3 / db845c + camera mezzanine, which is SDM845 based
 - db410c + D3 Camera mezzanine, which is APQ8016 based
 
Branch:
 - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v1
 - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v2
 - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v3
 - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v4
 - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v5
 - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v6
 - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v7
 - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v8



Robert Foss (22):
  media: camss: Fix vfe_isr_comp_done() documentation
  media: camss: Fix vfe_isr comment typo
  media: camss: Replace trace_printk() with dev_dbg()
  media: camss: Add CAMSS_845 camss version
  media: camss: Make ISPIF subdevice optional
  media: camss: Refactor VFE HW version support
  media: camss: Add support for VFE hardware version Titan 170
  media: camss: Add missing format identifiers
  media: camss: Refactor CSID HW version support
  media: camss: Add support for CSID hardware version Titan 170
  media: camss: Add support for CSIPHY hardware version Titan 170
  media: camss: Refactor VFE power domain toggling
  media: camss: Enable SDM845
  dt-bindings: media: camss: Add qcom,msm8916-camss binding
  dt-bindings: media: camss: Add qcom,msm8996-camss binding
  dt-bindings: media: camss: Add qcom,sdm660-camss binding
  dt-bindings: media: camss: Add qcom,sdm845-camss binding
  MAINTAINERS: Change CAMSS documentation to use dtschema bindings
  media: dt-bindings: media: Remove qcom,camss documentation
  arm64: dts: sdm845: Add CAMSS ISP node
  arm64: dts: sdm845-db845c: Configure regulators for camss node
  arm64: dts: sdm845-db845c: Enable ov8856 sensor and connect to ISP

 .../devicetree/bindings/media/qcom,camss.txt  |  236 ----
 .../bindings/media/qcom,msm8916-camss.yaml    |  256 ++++
 .../bindings/media/qcom,msm8996-camss.yaml    |  387 ++++++
 .../bindings/media/qcom,sdm660-camss.yaml     |  398 ++++++
 .../bindings/media/qcom,sdm845-camss.yaml     |  371 +++++
 MAINTAINERS                                   |    2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |   23 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  135 ++
 drivers/media/platform/qcom/camss/Makefile    |    6 +
 .../platform/qcom/camss/camss-csid-170.c      |  599 +++++++++
 .../platform/qcom/camss/camss-csid-4-1.c      |  328 +++++
 .../platform/qcom/camss/camss-csid-4-7.c      |  404 ++++++
 .../platform/qcom/camss/camss-csid-gen1.h     |   27 +
 .../platform/qcom/camss/camss-csid-gen2.h     |   39 +
 .../media/platform/qcom/camss/camss-csid.c    |  627 +--------
 .../media/platform/qcom/camss/camss-csid.h    |  161 ++-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  179 ++-
 .../media/platform/qcom/camss/camss-csiphy.c  |   66 +-
 .../media/platform/qcom/camss/camss-ispif.c   |  119 +-
 .../media/platform/qcom/camss/camss-ispif.h   |    3 +-
 .../media/platform/qcom/camss/camss-vfe-170.c |  786 +++++++++++
 .../media/platform/qcom/camss/camss-vfe-4-1.c |  144 +-
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  277 ++--
 .../media/platform/qcom/camss/camss-vfe-4-8.c | 1195 +++++++++++++++++
 .../platform/qcom/camss/camss-vfe-gen1.c      |  742 ++++++++++
 .../platform/qcom/camss/camss-vfe-gen1.h      |  117 ++
 drivers/media/platform/qcom/camss/camss-vfe.c |  847 +-----------
 drivers/media/platform/qcom/camss/camss-vfe.h |  128 +-
 .../media/platform/qcom/camss/camss-video.c   |   52 +
 drivers/media/platform/qcom/camss/camss.c     |  410 +++++-
 drivers/media/platform/qcom/camss/camss.h     |   15 +-
 31 files changed, 7027 insertions(+), 2052 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/qcom,camss.txt
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-170.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-1.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-7.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen1.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-gen2.h
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-170.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-4-8.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.h

-- 
2.27.0

