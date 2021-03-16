Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2C533DA8B
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 18:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239155AbhCPRUg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 13:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbhCPRUI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 13:20:08 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 152A0C061756
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:20:07 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id o19so22490720edc.3
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yy+1bHyJtmx5n+by/ONyQouqzKd7EexH9do15QnngYU=;
        b=TCwcfY9E0MgwN93XzU9nCecQ/KdPRpPSXaBE9bERjFm6J7v3fvlPPqn5NyM/xfDYbg
         Jly1SIIsmtxKNXpBz8O8kc3+QNXs+I0sogxi4SaayAwGdR7Vkm+adR5V64wLWf/wsZY7
         eFmN/Q+SNpL9US8JRSSq0H9XFSe0CalR/tLnqbVfTJoyQm0+Qyv2IxuWh2JFht2o+8qd
         YEuVstEVTGiN/LQX/sTTxlvVMF0mLY3VzmUi/2RH8KSXawZOTfR/WkeoqL83sOWVUfJi
         ZfehkxD2Fm9k7//yRSUJdDP3O0qFrgTK7b7oatRR/7ApxVbbZhnjfu/6sMUczVm3WsSk
         9Ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yy+1bHyJtmx5n+by/ONyQouqzKd7EexH9do15QnngYU=;
        b=Ve+SXPWA0dtrO+oqO/ZKRPnxoW/U8Id8AIlNT4b1BXM6jtuzAX9CwxyIuZUBMmIrEB
         glf/GUaAk9x+8c2eIE/6BtE6ELRq5L5Ejxyih3khrqIIYQ7dTMab5/P3Pb52eDMx8f34
         PJ4cDCcE1UDg8LO8aXGHpPZEn0/xWe8LTeIlyuyVMqG7KXlb+GqCRBL1Zt/P8e/Li4h9
         m3db1fbx32tH6aTWCODBOQfZLzKB+YGhgRr9USuTdTZi0F8ByiDhqIejoTnRZ27hObUY
         cxfFjOIUZUm6XJKeMzg9Ydd+ZDpyaISsJDIezw6UEe3GmKFZHn7bFG5BmF2zWyKXuyY5
         awlg==
X-Gm-Message-State: AOAM533bYKEijbYKwpyi3S7c09s+XVELwhg4q9NBweVLGxWQUscetuem
        Xpro4bWqDIxtFy8y003bCtHyTQ==
X-Google-Smtp-Source: ABdhPJwasvjdxNz21QgFdWgtBlobZqRJXm1Y1zmbrV+M1Z+IoeCbelCfm7InC5zMtAk017rR5R1XLw==
X-Received: by 2002:a50:e882:: with SMTP id f2mr37456806edn.184.1615915205794;
        Tue, 16 Mar 2021 10:20:05 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id u1sm10571584edv.90.2021.03.16.10.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 10:20:05 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v9 00/22] Add support for the SDM845 Camera Subsystem
Date:   Tue, 16 Mar 2021 18:19:09 +0100
Message-Id: <20210316171931.812748-1-robert.foss@linaro.org>
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
 - https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_sdm845_v9


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
 .../media/platform/qcom/camss/camss-csid.c    |  637 +--------
 .../media/platform/qcom/camss/camss-csid.h    |  150 ++-
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
 31 files changed, 7028 insertions(+), 2050 deletions(-)
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

