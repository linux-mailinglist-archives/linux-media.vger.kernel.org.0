Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8BB486E15
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 00:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343569AbiAFXxf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 18:53:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245661AbiAFXxd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jan 2022 18:53:33 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A8BC061212
        for <linux-media@vger.kernel.org>; Thu,  6 Jan 2022 15:53:32 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id s1so7843109wra.6
        for <linux-media@vger.kernel.org>; Thu, 06 Jan 2022 15:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MxTgX/T4Utod2KZDrFfy1v9Xj8U2o1FdEpdtHIXf/tc=;
        b=VveWvexS79tlh3xTyCuziU0DJrT/8bd0ZDdVhhn5Vvd2c8pW7ZpF5+74My+aQ4C5bM
         lTiHSrek91iiuEmpa78dS7ISiPN0YYdZlLn0DA2xLhW6kesLQ6ZmWfgdOrqJt7taYJod
         zSW0QTkSNvKoiupXpTGgjp3UUf2094gvHPgqpMFERabyKuYW+Pyim/++hdQfGnsotedF
         UN1VAmSQ3YmP2RqPhRs1f911NOr9eFeNjKGNI7TTVARdw7PVWWWnfEEsKOJN1C859DYy
         OdlSBBScXqbHD1pKXbGJsZeEGHuLe2DrBD0P9ZM1du0EJfML7xvagPaYOk6hEJZKH+tN
         lPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MxTgX/T4Utod2KZDrFfy1v9Xj8U2o1FdEpdtHIXf/tc=;
        b=678AxyOLQoDYflrcPlTM2m4a+2h5x25RFK8Aojzohb9cc3Qw7N33N3R0LTSY9+y0vK
         07PHV6iNDvr01Ve1pw3BGtE2ql4pdsv10I8q0ccRqWw4LzrxynYMk7FutKLc1LEsFyaG
         Pzr6WJl9yAyDHcekw+KhPdBBIiAYh5yJoqCAg8nZPy0JIKH6L6GUjfl7WIbr+KLb6QEC
         FEkoQyI6tiyICBwXb+Y8/RbkFIUduFTVJIj/6rs63cmqdCcvFACujDOAXPiTR8a7reYi
         h8T0rJ7tjWcvcGOpVJVSMgGJ1Hf68V9PGmtW0A86Y45gO854y7iAEEkODwfuK0SKxd+9
         tRHw==
X-Gm-Message-State: AOAM531S+DeZyh25M7Iem6i+aUa2l7wfWp16UkAh1rLGjLV7rmnN6V1E
        y7wmvAzSrTTSW83GQPhX7jCXNw==
X-Google-Smtp-Source: ABdhPJw3Dfccs1phmLL74BlOgzIIEhit9dxt/GP15nBfKiHac2L/oOJVj6t9G2WJ9A1ktG5c+VEY3w==
X-Received: by 2002:a05:6000:1acb:: with SMTP id i11mr51015251wry.244.1641513211224;
        Thu, 06 Jan 2022 15:53:31 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a71sm335893wme.39.2022.01.06.15.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 15:53:30 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH 0/7] camss: Fixup multiple VDDA regulator support
Date:   Thu,  6 Jan 2022 23:55:33 +0000
Message-Id: <20220106235540.1567839-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

Bryan O'Donoghue (7):
  media: dt-bindings: media: camss: Fixup vdda regulator descriptions
    sdm845
  media: dt-bindings: media: camss: Add vdda supply declarations sm8250
  arm64: dts: qcom: sdm845: Rename camss vdda-supply to vdda-phy-supply
  arm64: dts: qcom: sdm845: Add camss vdda-pll-supply
  media: camss: Add regulator_bulk support
  media: camss: Point sdm845 at the correct vdda regulators
  media: camss: Point sm8250 at the correct vdda regulators

 .../bindings/media/qcom,sdm845-camss.yaml     | 14 ++-
 .../bindings/media/qcom,sm8250-camss.yaml     | 13 +++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  3 +-
 .../media/platform/qcom/camss/camss-csid.c    | 40 +++++---
 .../media/platform/qcom/camss/camss-csid.h    |  3 +-
 drivers/media/platform/qcom/camss/camss.c     | 94 +++++++++----------
 drivers/media/platform/qcom/camss/camss.h     |  2 +-
 7 files changed, 100 insertions(+), 69 deletions(-)

-- 
2.33.0

