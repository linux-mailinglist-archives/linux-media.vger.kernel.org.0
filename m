Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA6F32D23C
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 13:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239789AbhCDMFh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 07:05:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239854AbhCDMFS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 07:05:18 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75193C061763
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 04:04:38 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id do6so48934950ejc.3
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 04:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QP1/x9snU1LCNLiXpn1pwFVJ6HIyLKKcgrv8t9uRcMA=;
        b=sZQl+ZfwumBEN/b0V5Cwzdr7c8DnvJ5cSx23o6sRg4m2wp9RGSHXUZKfxJ+TIb8fY7
         Kg3GFO8AOgHPyiLjQKKhtWTN8r3aPmNYjFlyRWhFl4d5RKO2pFDWheecELAC6U2hx0Vn
         S0mGZdtPZxAmsuXtMVvudzeW3MbbH08O8ezgMndduj/x4jmolCQlu/wJv9JyBBXrjT0U
         ery436XJTjKT6B2UYB+EynATfhlZIcpuo39LM43eLMWQvYqxySqRhBBriXwxL8das9ON
         HvccqQhMu8vBRSCwWUo55Br6fd8w6KQJPDe+Gq3dKH0VLGGDPgusvN13tlVxHzE4V6HL
         Z1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QP1/x9snU1LCNLiXpn1pwFVJ6HIyLKKcgrv8t9uRcMA=;
        b=lpJq9aSzi+oYLOZ+BT8b8aS54EUbcXlL05xlrvYuW2Ivo9iy7bihMg0QV48b92qwOt
         W07d4ZD/3aFArnFLgd4PNLjfPh+F61ccoBzqCIkzr0BbMS25qB+qNYozRMrdehLnRXKu
         lIP3oHHkkGhAdpgpu5klAZW9prBy7aKtkUO6fPC/V9NNA88Vl9Pj9stPsM9FabZUfpAX
         zzIMqQ7NssfqWuOkX1qUc+H6zgdSSwtUWhQrbZJkf5xS8gHzeTihm43Zfk5JUwKHiGRE
         oepQ+vHkDlike0yQQWvSR2hGDhw1mUjFto0QPO0X+4nhOnSaVhMc+Ercc845uIBq+4WH
         /gPQ==
X-Gm-Message-State: AOAM531eTGRADGXmqK407rMc6OB3H3BUnpu4t3cc4nKARc2vEMKJQV77
        7jPeBO6Fw32N5OJlxuHKoxnrxQ==
X-Google-Smtp-Source: ABdhPJy5JL98ENBeRN4iUzbVNg92fq+Vrvr6LSt3mSOAulrZLrLSZEAAHb4HxZSSsF/1bDugH6/vLg==
X-Received: by 2002:a17:907:3e8b:: with SMTP id hs11mr3799113ejc.117.1614859477033;
        Thu, 04 Mar 2021 04:04:37 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:470a:340b:1b:29dd])
        by smtp.gmail.com with ESMTPSA id cf6sm20464447edb.92.2021.03.04.04.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 04:04:36 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v6 00/22] Add support for the SDM845 Camera Subsystem
Date:   Thu,  4 Mar 2021 13:03:05 +0100
Message-Id: <20210304120326.153966-1-robert.foss@linaro.org>
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


Due to the dt-bindings supporting sdm660-camss, this series depends
the sdm660 clock driver being upstreamed. I've linked this series below.

SDM630/660 Multimedia and GPU clock controllers
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=366077


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
  media: camss: Remove per VFE power domain toggling
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
 .../platform/qcom/camss/camss-csid-170.c      |  601 +++++++++
 .../platform/qcom/camss/camss-csid-4-1.c      |  329 +++++
 .../platform/qcom/camss/camss-csid-4-7.c      |  405 ++++++
 .../platform/qcom/camss/camss-csid-gen1.h     |   27 +
 .../platform/qcom/camss/camss-csid-gen2.h     |   39 +
 .../media/platform/qcom/camss/camss-csid.c    |  621 +--------
 .../media/platform/qcom/camss/camss-csid.h    |  165 ++-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  181 ++-
 .../media/platform/qcom/camss/camss-csiphy.c  |   66 +-
 .../media/platform/qcom/camss/camss-ispif.c   |  119 +-
 .../media/platform/qcom/camss/camss-ispif.h   |    3 +-
 .../media/platform/qcom/camss/camss-vfe-170.c |  806 +++++++++++
 .../media/platform/qcom/camss/camss-vfe-4-1.c |  144 +-
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  277 ++--
 .../media/platform/qcom/camss/camss-vfe-4-8.c | 1200 +++++++++++++++++
 .../platform/qcom/camss/camss-vfe-gen1.c      |  763 +++++++++++
 .../platform/qcom/camss/camss-vfe-gen1.h      |  110 ++
 drivers/media/platform/qcom/camss/camss-vfe.c |  847 +-----------
 drivers/media/platform/qcom/camss/camss-vfe.h |  129 +-
 .../media/platform/qcom/camss/camss-video.c   |   52 +
 drivers/media/platform/qcom/camss/camss.c     |  407 +++++-
 drivers/media/platform/qcom/camss/camss.h     |   15 +-
 31 files changed, 7071 insertions(+), 2049 deletions(-)
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

