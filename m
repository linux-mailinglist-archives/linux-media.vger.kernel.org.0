Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F91F4220E5
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233196AbhJEIhB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 04:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232108AbhJEIhA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 04:37:00 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A683AC061745
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 01:35:09 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id b8so40877090edk.2
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 01:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iZu14TU+T7kjiOq76bsDp5yI385+Vc002/mX96V4vY0=;
        b=Jr/0DCKJISE22P+KurBcyMAuiWp0b7jk1cAjMINLWem/rZeLMhNbyxTiZznBjqEpG3
         lt0qjIoCp9oTtCMjSW15QxGqoD4w3P/JVb8eRl+kUENIgsLW2CfeJTo/Zrm2GPBrfLoe
         HI8XJgAeemf2nrFnoZN/Infugn82hKFN/e4D8MaRf/3VAviF0+lVWV+4Fhzo1fX+/dtW
         KzihCu7f/C15rY3MGsedWqdpsl2OC0kX7CvofVGO9AvsRns5Vp7uH6HIpGaCdcdjiW/x
         1hXXALNY1Lgh8XC54jkpcUu/sQeUeyzZAL7E50pCHUafHM39NVL4jD3lWj4L9YKh76u+
         wvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iZu14TU+T7kjiOq76bsDp5yI385+Vc002/mX96V4vY0=;
        b=rt+fAn8t1asDAcCLh33rmMRee8YCSrSM+MpePRMO9MyrjkSe33inR0nrvU/Udensxq
         Pw/0SKo51WWE1qCl9q8aZWtCIsXTFIr01uVUgFbmPEnqMm5Eu1SginJ02sMk8yWpcgPr
         1YwTakB+fpgDD+0P672D9fdzXRoBleCjae8mud+gCchLEyTd4+CnSuFcxR01GcbEvThp
         6puHDcjXHgxGQODDrmXsAvhX23IwAEeyNWfrAm44Yb1U/GJFm/7WwJB3d2EWYJSwB5/4
         75XYS/5nMm3jagCEnSWwr7yC8YLrnEH893Oi4KlUmlamumWjpykp9BH5ncyP3gNU3rGp
         yhNA==
X-Gm-Message-State: AOAM530XVVxvwt6861YGc43Z36e+h0oYKkg8o73nJAc/ZKYJsbRH9L2q
        uNP7rm59+hNcHKYFuFYWmTG1+mJo0JCqvw==
X-Google-Smtp-Source: ABdhPJxudpoV4lxhGFmjRdwUEvwUmP5Hv90AizZPm4filXpjHrlHcoJVaaG9bHiNBO7nbr4S3rKkhQ==
X-Received: by 2002:a05:6402:3591:: with SMTP id y17mr24937667edc.343.1633422907708;
        Tue, 05 Oct 2021 01:35:07 -0700 (PDT)
Received: from localhost.localdomain ([84.238.208.199])
        by smtp.gmail.com with ESMTPSA id w13sm7330964ejc.100.2021.10.05.01.35.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 01:35:07 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.16] Venus updates
Date:   Tue,  5 Oct 2021 11:34:21 +0300
Message-Id: <20211005083421.3101499-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This time the updates include:

 * Added support for sc7280 and relevant dt-binding yaml.
 * Few fixes.

Please pull.

regards,
Stan

The following changes since commit c52e7b855b33ff2a3af57b1b1d114720cd39ec7e:

  Merge tag 'v5.15-rc4' into media_tree (2021-10-04 07:52:13 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.16

for you to fetch changes up to bab9e541740fa93e7ae3bee9f3c3ca87790138c8:

  media: venus: Set buffer to FW based on FW min count requirement. (2021-10-05 11:13:16 +0300)

----------------------------------------------------------------
Venus updates for v5.16

----------------------------------------------------------------
Dikshita Agarwal (8):
      dt-bindings: media: venus: Add sc7280 dt schema
      venus: firmware: enable no tz fw loading for sc7280
      media: venus: core: Add sc7280 DT compatible and resource data
      media: venus: Add num_vpp_pipes to resource structure
      media: venus: hfi: Skip AON register programming for V6 1pipe
      venus: vdec: set work route to fw
      media: venus: helpers: update NUM_MBS macro calculation
      media: venus: Set buffer to FW based on FW min count requirement.

Mansur Alisha Shaik (3):
      venus: helper: change log level for false warning message
      venus: vdec: update output buffer size during vdec_s_fmt()
      venus: fix vpp frequency calculation for decoder

 .../bindings/media/qcom,sc7280-venus.yaml          | 162 +++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.c           |  54 +++++++
 drivers/media/platform/qcom/venus/core.h           |   2 +
 drivers/media/platform/qcom/venus/firmware.c       |  42 ++++--
 drivers/media/platform/qcom/venus/helpers.c        |  14 +-
 drivers/media/platform/qcom/venus/hfi_cmds.c       |   7 +
 drivers/media/platform/qcom/venus/hfi_helper.h     |  14 ++
 drivers/media/platform/qcom/venus/hfi_msgs.c       |   7 +
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   |   6 +-
 drivers/media/platform/qcom/venus/hfi_platform.c   |  13 --
 drivers/media/platform/qcom/venus/hfi_platform.h   |   2 -
 .../media/platform/qcom/venus/hfi_platform_v6.c    |   6 -
 drivers/media/platform/qcom/venus/hfi_venus.c      |   4 +
 drivers/media/platform/qcom/venus/hfi_venus_io.h   |   2 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |  13 +-
 drivers/media/platform/qcom/venus/vdec.c           |  42 +++++-
 16 files changed, 340 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
