Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF7D48ADD1
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 13:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239717AbiAKMuE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 07:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239712AbiAKMuE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 07:50:04 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DAD6C06173F
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:50:04 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id w26so5070148wmi.0
        for <linux-media@vger.kernel.org>; Tue, 11 Jan 2022 04:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HZu+XYEsjbueNhznWMgeg/MhUN48/8yO9Vh5XBvtfk4=;
        b=SXmSodVCWLnufVu7UQxx5n8B1rmm84dK79wKQaAs8boBSazOANcHGhyrWXrvSh2eNn
         /l1tSvcwWRuNkvxRCY1VRHp7qushNYrOsqgEX8WMIVoxXt6evQftBep4KWLlZ1s0ct83
         4Lf4v+nq7GnZqub0kNt6b0SECcgKEdkGAFinqSL8rh2A089eSb0XbzX9Md3vWyPx8LJk
         bB1Zy2BQmhKCfJpMYxJpIeamzXUIIOZA9WAXEL7v9e+vDpMaNVBOkBePOOJK9l7yVRcn
         +wf1KI+Jh1GKOh7zXB7pDHAx59DUxobWgKCR1GCm4I9qEhTdwyRtLw6z71rSF8nnjl+B
         yeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HZu+XYEsjbueNhznWMgeg/MhUN48/8yO9Vh5XBvtfk4=;
        b=2RoYLkbYRJf0muayEbQ40zZpUmkOCSLubxpjIJpp3ffAqWdWvbu9Q9R6KpCVTPSRvF
         eYkzeNzAGxQmP6W+5d3xitCVWekF8GR+DIta1oPbbvQMhsjt1SDX7ELkTx3TuKO5Nxkx
         8bQaXqalYXJ2GoNPwLNFMTq2nVw5D0pTuXan9Pqy9AtMTym41U5e4CRy03j56PdxtFM5
         A2uvxkEM+VVH3Jm3XaEyNyCgDw1QoqR14k834tT+iDqWM3L0ph+D0Kerr39fWCOXmEnU
         RROn2PR/PqvOglvgkFRvqoE84+jFvABr6rt0E51T8Eqd7FShF6FC6WzsOifOf5aKjLcH
         BIiQ==
X-Gm-Message-State: AOAM531pkmlOha1O4X5iaXcZa3eZUmjzCP2m78+jg0LrdkbANYb4sIsi
        Ab2YWsv9uSwYTaWabVVNWMsYZQ==
X-Google-Smtp-Source: ABdhPJwM83eUcvDyhliM2EvQSkmmLXHHzECdbobAIlgvsesJ6ugRJduUW/kj4ecRHbdb+pCdssFSSA==
X-Received: by 2002:a7b:cbc1:: with SMTP id n1mr1403423wmi.188.1641905402609;
        Tue, 11 Jan 2022 04:50:02 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bg19sm1915252wmb.47.2022.01.11.04.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 04:50:02 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 0/8] camss: Fixup multiple VDDA regulator support
Date:   Tue, 11 Jan 2022 12:52:04 +0000
Message-Id: <20220111125212.2343184-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V3:
- Adds Robert's R-B for 7/8 patches
- 5/8 should be a NOP, for the sake of procedure left out Robert's RB

V2:
- Only do array allocation when num_supplies > 0 - Bjorn
- Set unused regulators to {} instead of { NULL } - Bjorn

Bootable and testable tree for both RB3 and RB5 here:
git.linaro.org/people/bryan.odonoghue/kernel.git / br-v5.17j+camss-fixes-v2

V1:
Following on from comments from Vladimir on the sm8250 CAMSS patches I had
a look through the RB3 and RB5 schematics.

Here we see the CSI PHY connects to the same VDDA power-rails as USB, PCIe,
UFS and the DSI PHYs.

Right now CAMSS works on SDM845 and SM8250 because one of the USB, PCIe,
or UFS has enabled the relevant VDDA supplies, prior to the CAMSS driver
running.

The solution is to
- Fix the describing YAML
- Add in regulator_bulk_enable()/regulator_bulk_disable()
- Update the DTS to point at the necessary regulators

I have an SDM660 board on-order so when it arrives I can also look into the
vdda_sec regulator if nobody else has.

For now this series addresses the fundamental gap in the CSI PHY power
rails and remediates the situation for the two boards I have schematics for
and can test, RB3/SDM845 and RB5/SM8250.

This patch applies on top of
git.linuxtv.org/hverkuil/media_tree.git  / br-v5.17j

Bootable and testable tree for both RB3 and RB5 here:
git.linaro.org/people/bryan.odonoghue/kernel.git / br-v5.17j+camss-fixes

Bryan O'Donoghue (8):
  media: dt-bindings: media: camss: Fixup vdda regulator descriptions
    sdm845
  media: dt-bindings: media: camss: Add vdda supply declarations sm8250
  arm64: dts: qcom: sdm845: Rename camss vdda-supply to vdda-phy-supply
  arm64: dts: qcom: sdm845: Add camss vdda-pll-supply
  media: camss: Add regulator_bulk support
  media: camss: Set unused regulators to the empty set
  media: camss: Point sdm845 at the correct vdda regulators
  media: camss: Point sm8250 at the correct vdda regulators

 .../bindings/media/qcom,sdm845-camss.yaml     | 14 ++-
 .../bindings/media/qcom,sm8250-camss.yaml     | 13 +++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  3 +-
 .../media/platform/qcom/camss/camss-csid.c    | 43 ++++++---
 .../media/platform/qcom/camss/camss-csid.h    |  3 +-
 drivers/media/platform/qcom/camss/camss.c     | 94 +++++++++----------
 drivers/media/platform/qcom/camss/camss.h     |  2 +-
 7 files changed, 104 insertions(+), 68 deletions(-)

-- 
2.33.0

