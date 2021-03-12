Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4C33394BA
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232501AbhCLR3X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:29:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232666AbhCLR3N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:13 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD1CC061574
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:12 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id d15so5240718wrv.5
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rtvU59b5jVXmiYk6dHivdIzIIS4qcgdEH/0+Tg0TZ9k=;
        b=RrrxWYGcl/sG9VhQ0IF/yuDgR+5EMMEuLiYwSvgLVdA/EXXDHmanAtL18E3CCI6OBz
         xMSFRQJfhpRTSER8DLjd3EfwlMdtiTAWtAs69h3RhmmHIoMX2naKF5UInjH9VnEqGj4v
         g5QIoUTWCTQFs6Xr66+uwlDMaihh6W/u0hTbQuNfHntKGWvnrwHJjqDQIYJvHm95krrV
         yeyuC23l+RTDtVeGRW2MwDEzYbGaOne/3ynKbEFdSpBe7zpkGUgs21F1XJ1Af/y1IrWn
         RlyDOb7CEnuq9kIv8AH3bNRrglzBRuh9wc/wWPMQDyM8n6WBLWmMz1+14ZNoLi89mzYT
         T88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rtvU59b5jVXmiYk6dHivdIzIIS4qcgdEH/0+Tg0TZ9k=;
        b=Ed5PUhW/gZyKi1kTKekWUOUaxqGZTsyctV8rFLMyCO2YcRb6TmvSmqYOj5NeLIemfj
         GcGcAQIoq33DZ6AzkR7JxuSXIBfFogqDzbvjEG1Tl6+DTJUjqTPs7RpnZ2DD8QAbLE22
         21p3q1f/CV34ITxQaasKS809Un4MnoViDloix6UsbRM0g9zXfGGKnN90TkPeD7ugxTOk
         V4LnVtkQUw1xgZ63sE2sUrC4C3RV4qjFRwxJm5Ck9gEfFiAWYbYmEuA341chtCVBSCVk
         /3XQpnhUZrMWkqFyc76dRfZCz0gJUb9cjMiEopVYdvceZT/qT9H0d+rF6hwPKnsggu/a
         q6HQ==
X-Gm-Message-State: AOAM530o+/B37mA21NfQJa2mM/UY1s4k7ZBLU6v9jK2RYco9+kKPukcF
        yR9/HBWB4HVB3QXi1ZeTkP5Zsw==
X-Google-Smtp-Source: ABdhPJwIv5n3suGrFzXsEsjQdyEk0FPinT9zF7BGzOQo1EIZZuIb6uvqvdzkoTjmyGCWuMrd3mvcjg==
X-Received: by 2002:a05:6000:188b:: with SMTP id a11mr14901713wri.151.1615570151295;
        Fri, 12 Mar 2021 09:29:11 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:10 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 00/25] media: venus: Enable 6xx support
Date:   Fri, 12 Mar 2021 17:30:14 +0000
Message-Id: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V2:
- Adds Acked-by as indicated - Stan
- Fixes typo in patch #1 22000000 -> 220000000 - Stan
- Fixes setting of clk_set_rate in core_clks_enable
  unbreaks regression for 1xx/db410c - Stan
- "Add 6xx AXI halt logic"
  * Polled read removed - Stan
  * Redundant comments removed - Stan
  * Delay assocaited with LPI write removed entirely
    experimentation shows a delay is not required - Stan/Bryan
- Unifies intbuf_types_6xx_enc and intbuf_types_6xx_dec into
  intbuf_types_6xx
  Looking at the code the separate arrays was a NOP anyway - Stan/Bryan
- Ensures venus_helper_set_format_constraints() runs for 6xx only
- Differentiates stop address between 6xx and >= 4xx
  0xdeadb000 >= 4xx
  0x00000000 == 6xx - Stan

With the fixes in place for db410c I've verified this code now on
sm8250/rb5 sdm845/rb3 and msm8916/db410c

yaml: pending - acked waiting application
https://www.spinics.net/lists/devicetree/msg406892.html

dts: pending - will resend when above is applied
https://lore.kernel.org/linux-arm-msm/20210222132817.1807788-1-bryan.odonoghue@linaro.org/T/#t

Reference tree:

ssh://git@git.linaro.org/people/bryan.odonoghue/kernel.git / tracking-qcomlt-sm8250-venus

This tree incorporates two sets of patches from Stan - plus the two
yaml/dts sets mentioned above.

svarbanov-linux-tv/venus-for-next-v5.13
svarbanov-linux-tv/venus-msm8916-fixes

There's a small integration error between the 5.13 and msm8916-fixes which
I resolved in favor of the bugfix in 5.13 pending - other than that this
tree and these patches apply on tip-of-tree and run as indicated on rb5/rb3
and db410c.

https://www.spinics.net/lists/linux-arm-msm/msg81291.html

V1:
This series enables support for 6xx venus encode/decode as found on the
sm8250.

The new silicon has different base addresses for existing functional blocks
within the venus address space. We add a base address offset mechanism to
handle this. The offsetting mechanism has been validated on 6xx and 4xx
hardware.

The sm8250 supports:

- h264
- h265
- vp8
- vp9

The driver changes are contingent on yaml and dts patches already
in-flight.

yaml: pending
https://www.spinics.net/lists/devicetree/msg406892.html

dts: pending
https://lore.kernel.org/linux-arm-msm/20210222132817.1807788-1-bryan.odonoghue@linaro.org/T/#t

clk: applied
https://kernel.googlesource.com/pub/scm/linux/kernel/git/clk/linux/+/clk-next

Applies on top of 

https://git.linuxtv.org/svarbanov/media_tree.git / venus-for-next-v5.12-part2

Bryan O'Donoghue (11):
  media: venus: Update v6 buffer descriptors
  media: venus: core: add sm8250 DT compatible and resource data
  media: venus: core: Add io base variables for each block
  media: venus: hfi,pm,firmware: Convert to block relative addressing
  media: venus: core: Add differentiator IS_V6(core)
  media: venus: core: Add an io base for TZ wrapper regs
  media: venus: core: Add an io base for AON regs
  media: venus: core: Hook to V6 base registers when appropriate
  media: venus: hfi: Read WRAPPER_TZ_CPU_STATUS_V6 on 6xx
  media: venus: hfi, vdec: v6 Add IS_V6() to existing IS_V4() if
    locations
  media: venus: pm: Hook 6xx pm ops into 4xx pm ops

Dikshita Agarwal (12):
  media: venus: hfi: Define block offsets for V6 hardware
  media: venus: hfi: Define additional 6xx registers
  media: venus: hfi: Add a 6xx boot logic
  media: venus: hfi: Add 6xx interrupt support
  media: venus: core,pm: Vote for min clk freq during venus boot
  media: venus: hfi: Add 6xx AXI halt logic
  media: venus: pm: Toggle 6xx wrapper power in vcodec_control
  media: venus: firmware: Do not toggle WRAPPER_A9SS_SW_RESET on 6xx
  media: venus: helpers: Add internal buffer list for v6
  media: venus: helpers, hfi, vdec: Set actual plane constraints to FW
  media: venus: hfi: Increase plat_buf_v6 o/p buffer count.
  media: venus: helper: Decide work mode

Stanimir Varbanov (2):
  media: venus: core,pm: Add handling for resets
  media: venus: vdec: Fix decoder cmd STOP issue

 drivers/media/platform/qcom/venus/core.c      |  78 +++++++++
 drivers/media/platform/qcom/venus/core.h      |  19 ++
 drivers/media/platform/qcom/venus/firmware.c  |  34 ++--
 drivers/media/platform/qcom/venus/helpers.c   |  73 +++++++-
 drivers/media/platform/qcom/venus/helpers.h   |   3 +-
 drivers/media/platform/qcom/venus/hfi_cmds.c  |  15 +-
 .../media/platform/qcom/venus/hfi_helper.h    |   9 +-
 .../platform/qcom/venus/hfi_plat_bufs_v6.c    |   2 +-
 .../platform/qcom/venus/hfi_platform_v6.c     | 138 +++++++--------
 drivers/media/platform/qcom/venus/hfi_venus.c | 164 +++++++++++++-----
 .../media/platform/qcom/venus/hfi_venus_io.h  | 118 ++++++++-----
 .../media/platform/qcom/venus/pm_helpers.c    |  92 +++++++++-
 drivers/media/platform/qcom/venus/vdec.c      |  17 +-
 drivers/media/platform/qcom/venus/venc.c      |   2 +-
 14 files changed, 567 insertions(+), 197 deletions(-)

-- 
2.30.1

