Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E7A2EF1C3
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 13:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbhAHMFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 07:05:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726733AbhAHMFa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 07:05:30 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11912C0612F5
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 04:04:50 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id t16so14094461ejf.13
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 04:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=asWxFY0f6/Inx6rPHpsAJiBWcsPrumNhnqo0mf0c6II=;
        b=M1ZgjcdXul7+t7ICsKkbmaoMBiD4b4XCGxZuVkFJH8EdCSKwvBEPKMaElX/fWGSbWd
         MwyosPhwS/oQhskLw76mxJWRDizhPRJP70Qb1X7rlCfr6pLS4FvJXGtdav+RtKN6/4Ru
         ZY4Z6OC04j32hDVcYeDYMsIGw6/OsdRXTBktKkyVd3PxKHcNu5ut9csR4rNdN0DuwsIx
         AJorSzYlN14yLSpIh+vJNSrobLHWBaSCdCnvFc2qlzr8teEyWUorR+xhq9ndtUWDYxam
         K0ER8LxRH7OtDkytmgk2uDTUZVVodOFn01HWOQeaGex2xeBhyXpEAJU7vSW/9bPq7+nB
         4Hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=asWxFY0f6/Inx6rPHpsAJiBWcsPrumNhnqo0mf0c6II=;
        b=Dmslb2b6Mm6yhUMaDbq+Lf4o+8v82fyUUaEJyTpRL7Sqf07EjQhdDG47Pn+21lCMFe
         ehrFU4Kw4BjWQ2Ti72WSh/LoAXsb35Ps47Iu/2iJxktXByfYAOlNldImTaLvi4GcwDez
         1so1QpP9eda5cyuVnBw+MfrAaO4KuAxkFNNzM4v49aOui/Gh+R1nQdjNWWVE39O84ciU
         V5AXazoC2JVKpIfjDHl9SYDYbl/TxJRfx5cRODgnKID02UlitNY4sSY9lZeTFLRp9mTn
         Lj6uBaBuuke96UFl4PeSQuL6OaSopzhULn1fI0/NXLp+8E320SqlSOngT865/ipbdzWu
         wrCQ==
X-Gm-Message-State: AOAM533OzOQpdcVWyxazBjOONDOZiMjd6ri8BEPebEie6HlGaOMYy6ah
        e2ELNJ5AenlsYcxG+ZyqxfBsvw==
X-Google-Smtp-Source: ABdhPJwDX9sqLk6ILtXbn402DuG+30QRQym/ut51FgHROgwjNeJ5iJoGFDe3UFj8N/it+VHW57x1Uw==
X-Received: by 2002:a17:906:c83b:: with SMTP id dd27mr2518214ejb.356.1610107488699;
        Fri, 08 Jan 2021 04:04:48 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:bb2e:8b50:322a:1b9a])
        by smtp.gmail.com with ESMTPSA id i18sm3674498edt.68.2021.01.08.04.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 04:04:47 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 00/17] Add support for SDM845 Camera Subsystem
Date:   Fri,  8 Jan 2021 13:04:12 +0100
Message-Id: <20210108120429.895046-1-robert.foss@linaro.org>
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


Robert Foss (17):
  media: camss: Fix comment using wrong function name
  media: camss: Fix vfe_isr comment typo
  media: camss: Add CAMSS_845 camss version
  media: camss: Make ISPIF subdevice optional
  media: camss: Refactor VFE HW version support
  media: camss: Add support for VFE hardware version Titan 170
  media: camss: Add missing format identifiers
  media: camss: Refactor CSID HW version support
  media: camss: Add support for CSID hardware version Titan 170
  media: camss: Add support for CSIPHY hardware version Titan 170
  media: camss: Remove per VFE power domain toggling
  media: dt-bindings: media: qcom,camss: Add bindings for SDM845 camss
  media: camss: Enable SDM845
  arm64: defconfig: Build Qcom CAMSS as module
  arm64: dts: sdm845: Add CAMSS ISP node
  arm64: dts: sdm845-db845c: Add CAMSS ISP node
  arm64: dts: sdm845-db845c: Enable ov8856 sensor and connect to ISP

 .../devicetree/bindings/media/qcom,camss.txt  |   51 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |   28 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  151 +++
 arch/arm64/configs/defconfig                  |    1 +
 drivers/media/platform/qcom/camss/Makefile    |    6 +
 .../platform/qcom/camss/camss-csid-170.c      |  602 +++++++++
 .../platform/qcom/camss/camss-csid-4-1.c      |  338 +++++
 .../platform/qcom/camss/camss-csid-4-7.c      |  406 ++++++
 .../media/platform/qcom/camss/camss-csid.c    |  620 +--------
 .../media/platform/qcom/camss/camss-csid.h    |  177 ++-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  182 ++-
 .../media/platform/qcom/camss/camss-csiphy.c  |   66 +-
 .../media/platform/qcom/camss/camss-ispif.c   |  147 ++-
 .../media/platform/qcom/camss/camss-ispif.h   |    3 +-
 .../media/platform/qcom/camss/camss-vfe-170.c |  808 ++++++++++++
 .../media/platform/qcom/camss/camss-vfe-4-1.c |  119 +-
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  240 ++--
 .../media/platform/qcom/camss/camss-vfe-4-8.c | 1166 +++++++++++++++++
 .../platform/qcom/camss/camss-vfe-gen1.c      |  760 +++++++++++
 .../platform/qcom/camss/camss-vfe-gen1.h      |  110 ++
 drivers/media/platform/qcom/camss/camss-vfe.c |  838 +-----------
 drivers/media/platform/qcom/camss/camss-vfe.h |  118 +-
 .../media/platform/qcom/camss/camss-video.c   |  100 ++
 drivers/media/platform/qcom/camss/camss.c     |  421 ++++--
 drivers/media/platform/qcom/camss/camss.h     |   17 +-
 25 files changed, 5630 insertions(+), 1845 deletions(-)
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-170.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-1.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-4-7.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-170.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-4-8.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.h

-- 
2.27.0

