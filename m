Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3056847D364
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 15:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236949AbhLVOLO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Dec 2021 09:11:14 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.170]:53737 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236943AbhLVOLN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Dec 2021 09:11:13 -0500
X-KPN-MessageId: de0f1f4c-6330-11ec-8a6e-005056ab378f
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id de0f1f4c-6330-11ec-8a6e-005056ab378f;
        Wed, 22 Dec 2021 15:10:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:subject:from:to:mime-version:date:message-id;
        bh=iBNGeNNQ4C9SuXQM/RraYP8z9CRbTJo2RF8mUlFwJss=;
        b=T6iHpQSESFJw0CWtkeUitAw1NdgA0LbiuosI0SPnlRQPjZmnmMAdS9MOJ/arWwwG1P3oVRkaGNU/n
         rRsNQyMj6EWPwJDIQz10j9y5s+llYkCBpsL3ZKbjijKZU24wZZ+lQO65waxzbdzLTKjODjvrKvkd5U
         DDkXn6lXjmR8iH/+3Xjxj+p9fex0IYXSM7dMlmw6scCTYHk8PaDZBn5L1PTDE0q7y4LKyfWOrwVz9h
         bRaWlx0pl7vqRY9912CuU+kIeRcJRWdHE2tW7YjYBAkOxbOtMT14dCt5GoSZuCmogE8Rmu3Bn8QFtN
         bR9OXIyrxs6Ipwuc3UWNDvXw/DE9FhQ==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|raYnV5xq0aRVaQ0gted3LKlJS6RSSbDu9SeylQuO2IBwOtFJv3XeGz8w3eCzE45
 wmw/YySxTj4tfkMtAhsfT4Q==
X-Originating-IP: 80.101.105.217
Received: from [192.168.1.10] (marune.xs4all.nl [80.101.105.217])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 02a822d8-6331-11ec-81f5-005056ab7447;
        Wed, 22 Dec 2021 15:11:09 +0100 (CET)
Message-ID: <423720e1-d3e5-b440-490c-74ec298b77a3@xs4all.nl>
Date:   Wed, 22 Dec 2021 15:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <robert.foss@linaro.org>, jonathan@marek.ca
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.17] CAMSS: Add SM8250 support
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c:

  media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs (2021-12-16 20:58:56 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.17j

for you to fetch changes up to a21e8883618c96e196982dd6359d84abd6f1a23d:

  media: camss: Apply vfe_get/vfe_put fix to SDM845 (2021-12-22 15:01:03 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
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

 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml            | 450 ++++++++++++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/Makefile                                |   3 +-
 drivers/media/platform/qcom/camss/{camss-csid-170.c => camss-csid-gen2.c} |  32 +--
 drivers/media/platform/qcom/camss/camss-csid.c                            |  56 ++++-
 drivers/media/platform/qcom/camss/camss-csid.h                            |   2 +-
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c                  | 184 +++++++++++----
 drivers/media/platform/qcom/camss/camss-csiphy.c                          |   9 +-
 drivers/media/platform/qcom/camss/camss-vfe-170.c                         |  12 +-
 drivers/media/platform/qcom/camss/camss-vfe-480.c                         | 564 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c                             |  17 +-
 drivers/media/platform/qcom/camss/camss-vfe.h                             |   4 +
 drivers/media/platform/qcom/camss/camss-video.c                           |   5 +-
 drivers/media/platform/qcom/camss/camss.c                                 | 306 ++++++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss.h                                 |  18 ++
 14 files changed, 1558 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
 rename drivers/media/platform/qcom/camss/{camss-csid-170.c => camss-csid-gen2.c} (95%)
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-480.c
