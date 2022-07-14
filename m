Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA89574A0E
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 12:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237922AbiGNKEZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 06:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237845AbiGNKEW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 06:04:22 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB18EE0B0
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 03:04:21 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id r18so1713429edb.9
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 03:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3gJCgtGNZiORtLkYjwhKz4qTM8uZfME9uCiyiRcJ6JI=;
        b=kp8DJhxb7tZs8geuKd0TULnRiJRFOzCGQjbcKqBHV4gl82BdcvoYqucB0K9haI3uzJ
         GKrM91vonwwwzgaSXcFPkhrvAm2DL5MyypRp80s3m1SFtxpMR4pcFeuMuwijOaro8WSm
         Wn3yOEqQlt6FHoX1ltLmySTD2bb8xJ/c62wK+fMMm/QMh7M5IWCqdxQTVV2tWs8vuHfO
         OFGil9XXQ/vKO0VRBXiom6H6PGK0Sazgbv+Dv0/4EhuWE6alvmJPi9SML0c35/ZfYj0Y
         9/Pe39uAHhX7AlOHjAJ6L5IPpYQVo/9zfjhtvbZs586uwp+a/HWv7QXtca+vEcobA8Sy
         4Gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3gJCgtGNZiORtLkYjwhKz4qTM8uZfME9uCiyiRcJ6JI=;
        b=6iIThjdLOhgDPBb0z/RN0M927zzHhwiABKcAPR5zi+/7baWuTMB8QWy4HndCUlrmXL
         /tJMvXKDb9Y9AS17DfnI9ynPzZbyInWVjIymrfshbVmb74jmb6BOXv175CgoTvigKle0
         LPfWwsyKt/kOJart/9fEARGJGjgOPe7imnAJw1nSF6iKBx2AJISxGnZ+d6SjIiKjZWa2
         Q3/ZI4E5tACZsyy1Bk4XKbdIuzegRtSL5f1g/ZCcajyTv4En78/mXV54uc4r2SBFzo7h
         jgeezkTGEeGsG3+dr62qeRNCpBdOLVrjU+wM27bLEOMTb/+eu3QWi/rf89yceF/SSQH5
         bvOA==
X-Gm-Message-State: AJIora9Bpb6Mep8hVxk1dfnrvaN1+6AO67zdjsVz1vBRWlvWOY9IESMg
        T5b5NsuiEb84/hQjNC4v9dLHsm6DnbPhYYUn
X-Google-Smtp-Source: AGRyM1sRWDng2+U3s6i7lds3adM8cjnf8RTv3i8yWDTsLicQocniHW0SS/qx+45PlAAucYzqGAkrkg==
X-Received: by 2002:a05:6402:e8b:b0:439:7a9d:f39d with SMTP id h11-20020a0564020e8b00b004397a9df39dmr11253985eda.295.1657793060178;
        Thu, 14 Jul 2022 03:04:20 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906201200b006f3ef214e13sm498541ejo.121.2022.07.14.03.03.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 03:04:19 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.20] Venus updates - part2
Date:   Thu, 14 Jul 2022 13:02:19 +0300
Message-Id: <20220714100219.897127-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Two more patches for 5.20:

 * Fix smatch error.
 * Add UBWC configuration for sc7280.

Please pull.

regards,
Stan

The following changes since commit d8e8aa866ed8636fd6c1017c3d9453eab2922496:

  media: mediatek: vcodec: Report supported bitrate modes (2022-06-27 09:31:41 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.20-part2

for you to fetch changes up to 0e936b5c9b4dc475be9292b7d42f6e87f1459b2b:

  media: venus: set ubwc configuration on specific video hardware (2022-07-14 12:16:58 +0300)

----------------------------------------------------------------
Venus updates for v5.20 part2

----------------------------------------------------------------
Hans Verkuil (1):
      media: venus: venus_helper_get_bufreq(): req is never NULL

Vikash Garodia (1):
      media: venus: set ubwc configuration on specific video hardware

 drivers/media/platform/qcom/venus/core.c       |  5 +++++
 drivers/media/platform/qcom/venus/core.h       |  2 ++
 drivers/media/platform/qcom/venus/helpers.c    |  6 ++----
 drivers/media/platform/qcom/venus/hfi_cmds.c   |  9 +++++++++
 drivers/media/platform/qcom/venus/hfi_cmds.h   |  1 +
 drivers/media/platform/qcom/venus/hfi_helper.h | 20 ++++++++++++++++++++
 drivers/media/platform/qcom/venus/hfi_venus.c  | 26 ++++++++++++++++++++++++++
 7 files changed, 65 insertions(+), 4 deletions(-)
