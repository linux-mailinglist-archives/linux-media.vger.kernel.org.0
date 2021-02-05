Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B06310971
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 11:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbhBEKr6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 05:47:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231538AbhBEKpk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 05:45:40 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A941C06178C
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 02:44:51 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id j11so5611947wmi.3
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 02:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PscHFxOMqgQynPYB8wJSydBOtl1mB/ZENgiaMJXnBNg=;
        b=Xnwy6Stvyl7d4mKYFauSzv4Ov4mLtGai8oShxV8Wzv7cqw2yCwQ3bVX43bFIPPnBFV
         axNNOqrQiHNBZ/HsdXiar0jdpxQCUAYtkn3S/VL1BCznwnKQJS0Lqj/vXKV/q9arYQqL
         FjpcjUrWWxDv0aGM716N7nsK633aaqZ4dWKRUUwXOGNs4HOWgbg3meFv5qrrjq1WI6OY
         CVco7R9OdXitqKx+IbjVCDsXGwBdKbXHyAr0rCR/JzcqRkL60OX/KiOwfjsSFlABxIDE
         TV7YAuq16tEpdsJuLElNu1MJUbXBmxQ2/Fvd4pUlBqYENcn/jiA6aQCltNiBsGIl8D+c
         e/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PscHFxOMqgQynPYB8wJSydBOtl1mB/ZENgiaMJXnBNg=;
        b=EHr8EgrPvm5QinP7pYy5f44H/D3IuC+TIfnORwEtmQgrBh2LB1p0rhxXMe14Zto6Ct
         AuC9HB/NNZAwhu0XgbVnGAuCZ0cwMv2Hl26axcYD4YmAfFm3Y2TUJXvVzfew5qHFa/Wj
         PoL2Yem7faw0YftgxCl7DqZR2vz/wo4fm9QXF/3iV7iUYSlyHDQW8OHYe4YUzoyWrmga
         J5DX5ZFtIt5iicwKaOomfX+vsa/Gd5fyPBlctKr05q6hvoORgsA+urZ7itQeGJ9PhweF
         dIFoWAzfnUG/hRljftfsOXr0+mukP/IWMb6vw+ITaUH57zv6deDUPK+7f0Tn+6o71prR
         BcdA==
X-Gm-Message-State: AOAM533xgRU0Ke7BflGQn6EVuIcM/4E9k5Ay8/o7zIgpfmvXYode30Lv
        9+W2JkA/TqL1WS4XW2z/B2HlJw==
X-Google-Smtp-Source: ABdhPJwCYhuOndrmaR6NkwZDOMSptgFNZUKBjUqRiHuxhmTMygAkfKARJfqiGnPk4elsLNgYvTqeLQ==
X-Received: by 2002:a05:600c:4f0d:: with SMTP id l13mr3055927wmq.92.1612521889780;
        Fri, 05 Feb 2021 02:44:49 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:38fd:e0db:ea01:afc8])
        by smtp.gmail.com with ESMTPSA id u4sm11300233wrr.37.2021.02.05.02.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 02:44:49 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v4 00/22] Add support for the SDM845 Camera Subsystem
Date:   Fri,  5 Feb 2021 11:43:52 +0100
Message-Id: <20210205104414.299732-1-robert.foss@linaro.org>
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


Due to the dt-bindings supporting sdm660-camss, this series depends
the sdm660 clock driver being upstreamed. I've linked this series below.

SDM630/660 Multimedia and GPU clock controllers
https://lkml.org/lkml/2020/9/26/166


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
 .../bindings/media/qcom,sdm845-camss.yaml     |  370 ++++++
 MAINTAINERS                                   |    2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |   23 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  135 ++
 drivers/media/platform/qcom/camss/Makefile    |    6 +
 .../platform/qcom/camss/camss-csid-170.c      |  602 +++++++++
 .../platform/qcom/camss/camss-csid-4-1.c      |  338 +++++
 .../platform/qcom/camss/camss-csid-4-7.c      |  406 ++++++
 .../media/platform/qcom/camss/camss-csid.c    |  620 +--------
 .../media/platform/qcom/camss/camss-csid.h    |  178 ++-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  182 ++-
 .../media/platform/qcom/camss/camss-csiphy.c  |   66 +-
 .../media/platform/qcom/camss/camss-ispif.c   |  117 +-
 .../media/platform/qcom/camss/camss-ispif.h   |    3 +-
 .../media/platform/qcom/camss/camss-vfe-170.c |  804 ++++++++++++
 .../media/platform/qcom/camss/camss-vfe-4-1.c |  123 +-
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  244 ++--
 .../media/platform/qcom/camss/camss-vfe-4-8.c | 1164 +++++++++++++++++
 .../platform/qcom/camss/camss-vfe-gen1.c      |  763 +++++++++++
 .../platform/qcom/camss/camss-vfe-gen1.h      |  110 ++
 drivers/media/platform/qcom/camss/camss-vfe.c |  840 +-----------
 drivers/media/platform/qcom/camss/camss-vfe.h |  118 +-
 .../media/platform/qcom/camss/camss-video.c   |  100 ++
 drivers/media/platform/qcom/camss/camss.c     |  419 ++++--
 drivers/media/platform/qcom/camss/camss.h     |   17 +-
 29 files changed, 6965 insertions(+), 2062 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/qcom,camss.txt
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-170.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-1.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-7.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-170.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-4-8.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.h

-- 
2.27.0

