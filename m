Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04146337BD3
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 19:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbhCKSKb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 13:10:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbhCKSKA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 13:10:00 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD70DC061762
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 10:09:59 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id bm21so48151650ejb.4
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 10:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0qKhuCXlv+n43C9eJnPgAqlso12udJgOMMoLZ3TdETg=;
        b=VOos7MdQJ0/OjM1Bw4U2t1S8tj5Tr6vuTmLbpszGwMOXrdrtyQ1fjzTx8WGtBl0v5v
         4kq2aISMzwVYGCPubvv96J3VcSfQcMqgJg6IUCaNcVgsJnyQs2OOk7zfCvDCbkI/7PCH
         yevE63TPzbL7rHHfS+ClULhGV210oEDMSkKbdaVKEzLDykUkyg8/2zliwOgPfNbKVB6q
         mq765kgrgmBkoo4aq8PbGZovt0egAkX/A5DR2l8UIpUm58GOO2xSerSnlaXItEsP9eI5
         lDPTwYnKDeEPgXawVAC5+D2kW2i4oECQX4FAW2HYb9lOkpy4AG5nOissNnU5ee/9CHaq
         NieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0qKhuCXlv+n43C9eJnPgAqlso12udJgOMMoLZ3TdETg=;
        b=nYZNvq+His3KmVHdpfSjfJflg+W2mfsynv3CqlHf+kozte9Qs3KV9Qc3QHAFC81FSS
         TaFI2mht+XkVOPolQj+wGlJVpNNmtJh1sda3fePoGOyjhFovHfhaOfEIglzRKEn3yE7/
         EcSEfPQhSsLc63KjcyB28+XKt04iXruKyy/oi9XoIvP6XaukWFwevFAAohags7uSnrMg
         v0+nf+WQNe9eoz2hNWAHqyQmU5/nyF9+grrd6WnqnWx4OHcXb+9HR1ZEPk7NelLWE1RM
         3TieiIVqRUkDtrMG0WHqXJwGvNmmCcLT5SWsnQryq4x2tTompwFkO/e2Bj2zqcS+cZpS
         8e2A==
X-Gm-Message-State: AOAM53319JYcxkRvlrTXblIsGQfB1mbZSfO89uVywzscRtNjqjVk66qu
        xINPu+5bmLQAlMuTfFt9U9Mrl6dNSDumJ5op
X-Google-Smtp-Source: ABdhPJy/XzXekq7i/7PdqZJdNE46U60xpyVtTUYE8GtTVhViRD2rLzs7Jg2ddrzQpRqdKN8ZW/r4fg==
X-Received: by 2002:a17:906:bd2:: with SMTP id y18mr4330751ejg.482.1615486197383;
        Thu, 11 Mar 2021 10:09:57 -0800 (PST)
Received: from localhost.localdomain ([2a02:2454:3e3:5f00:8e01:34c:da50:eb7e])
        by smtp.gmail.com with ESMTPSA id a22sm1741290ejr.89.2021.03.11.10.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 10:09:56 -0800 (PST)
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
Subject: [PATCH v7 00/22] Add support for the SDM845 Camera Subsystem
Date:   Thu, 11 Mar 2021 19:09:26 +0100
Message-Id: <20210311180948.268343-1-robert.foss@linaro.org>
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
 .../platform/qcom/camss/camss-csid-170.c      |  601 +++++++++
 .../platform/qcom/camss/camss-csid-4-1.c      |  329 +++++
 .../platform/qcom/camss/camss-csid-4-7.c      |  405 ++++++
 .../platform/qcom/camss/camss-csid-gen1.h     |   27 +
 .../platform/qcom/camss/camss-csid-gen2.h     |   39 +
 .../media/platform/qcom/camss/camss-csid.c    |  621 +--------
 .../media/platform/qcom/camss/camss-csid.h    |  164 ++-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  179 ++-
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
 31 files changed, 7069 insertions(+), 2048 deletions(-)
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

