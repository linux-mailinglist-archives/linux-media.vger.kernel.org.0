Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 530B9488764
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 03:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235098AbiAICrD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 8 Jan 2022 21:47:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235095AbiAICrD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 8 Jan 2022 21:47:03 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABCA2C061401
        for <linux-media@vger.kernel.org>; Sat,  8 Jan 2022 18:47:02 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id r9so17737341wrg.0
        for <linux-media@vger.kernel.org>; Sat, 08 Jan 2022 18:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ahieVunNz1L5RwgZkbcTvDbrJmk7YBTvpA8mBTZ3k+w=;
        b=QNH+e9xHF5CHb0AhCOJkT0sZr07SvYDmV5wpnlrxnTqi91QFCvG2G5GtOkANztVjAj
         ayfeWDE/Rs5VAMPalT5a5Tu6peyNG2gXejDAkIc/VWi1zmezWQ29TbzwlvTp11JM68Qg
         ozulzbnPAinMNzS8gKBEI+dxW44RLbI62q50cCp84AFX8CPx+XeyJ6/4KbwgEE7dXieD
         K/pejXi710oy3rRSRhsw0s+YCLVP1EEolgeSrRPBZWfB/BDLjKJdWi/2KBiKRqMs+3aU
         oGkmkFnuFZDmYHZauWlsK7dr+uhf0D6k5aOFWveSfEu4dr+niZl2pqAfivd7WEfVxtUE
         NFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ahieVunNz1L5RwgZkbcTvDbrJmk7YBTvpA8mBTZ3k+w=;
        b=M5TZVmmuNzfIJLWWu2K/ldCiGd5Cue+yRaf3ZRfhD9dZQXzkwxTObwbOiwt7BB9LiA
         HHjU9FtGc+s8fL+mxyofrU4IODmAlXWJ7JLNWH2RcXTCuxb4iEUqkNCQwg30xs7KHmss
         3iJTGfsTiJ8eA5tEeYgIbrEnjixzIznF1+4tIf4XAqR6WSjPOnUuUjMjzlo4/l7B/0py
         JvL3NvggIx+idRsdNtm/Z7CxJJ1mrKTIVKLqYKFPRDC3DEGZh2Ir2/S3RpSlmhhz94Wt
         Fx5BV34RZInwoHOElc1mcwQghAkSdZrluJfw23R2sVi/L+pZkUXvNxD4KpLfndoE0eQL
         k3Mg==
X-Gm-Message-State: AOAM5321TlnO1P+6Qj97PhX+cNixnAydzRzOV/wMTrw6mrUMOTn+5GW7
        rdRiXGErK44qastpxScuCwUbyQ==
X-Google-Smtp-Source: ABdhPJwI3Ik3ndftSWgxF1nbKPaxjahuvvpNwDymNwgKl48haPX8IhPBIIw1WQfLaU64LWWAfqgitQ==
X-Received: by 2002:a5d:64eb:: with SMTP id g11mr29376202wri.135.1641696421236;
        Sat, 08 Jan 2022 18:47:01 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l13sm3341748wrs.73.2022.01.08.18.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 18:47:00 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 0/8] camss: Fixup multiple VDDA regulator support
Date:   Sun,  9 Jan 2022 02:49:02 +0000
Message-Id: <20220109024910.2041763-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

