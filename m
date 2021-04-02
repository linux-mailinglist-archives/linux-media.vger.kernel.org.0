Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E4D35294B
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbhDBKF2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhDBKFZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:25 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1B81C061788
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:17 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id d191so2283504wmd.2
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6zJWHtZafQkmNHzIy8WJmKYyifUKPPqdoRblWTdOLLI=;
        b=BQ8gvEHHx+wbL9GE/mEHH294kKOCWvcdHN21myfo7HC0W6q1POtZP52BdsMldeiMoe
         qATA/n+RmOxAboWuhzhBijFqyVrR8EE/P0vIEciSvjUBH00FZ1ojf9V5qQwjWZzS7cHv
         7L3C9AolpN4pyu3htGJav2Dr6epPz9YpVjtiMIPFvnvW0+IcbFCLFGTKdiQN7IQaygsD
         GSFwSurdSclCO7KNFWEGIIFN9I3F0vSNi1O+O5c5qX4LqJ2ekziH8UhyjwxOL64vYNl1
         TGVxL4X+cTRQlhgP1UAb4Ly8jpoR0QpAcII6Po5AbohkKS3GgUlTe6IaAsySYI/L5TuS
         3/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6zJWHtZafQkmNHzIy8WJmKYyifUKPPqdoRblWTdOLLI=;
        b=n5DIPOjzZjXbrkfg6OzICbLAHh6nbThgbrcva3HxfOL/jkKZhWO6vpiYj2gGgSA2Re
         T4A9vccGLfpSn3HDlhFacYp7cwKX/2BvGcaI802qOjHQ3XdTI4X0lHSdETOAGDooYAWi
         t33eCcW7EZl1URZTU5F076NQlcyPrjg6JvsIza9sY/nOmxWmmPoZmxtcbutXQdRgz/Qe
         y0XCNHjByywskkwMJStxWGPrMxdHXtTG1lT+BDYMwhd2Ep1JPQn3mhMt4kr9bDULL0GN
         QOSXEpN6u9fr+yOQUy2QVbOoHqiqeWmcV1yaNmQYL8RLVsYIpabuRxr61uDBJzkm7uxn
         jYvw==
X-Gm-Message-State: AOAM532IG5IB2MVYO+n6RCZKx7QdSja9Yn2SKWhRtejiSCu9w3g1reUz
        /EYdL8/+fTj6GExL6/7asTyUeA==
X-Google-Smtp-Source: ABdhPJxV8RgbXxsVwRY/VbP1H/pwOTPg85ZtH3pv9alMGVtqE+Vkd6UUMNQjoKwFmFBd5XJZLkKdjA==
X-Received: by 2002:a1c:5416:: with SMTP id i22mr11976007wmb.146.1617357916394;
        Fri, 02 Apr 2021 03:05:16 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:15 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 00/25] media: venus: Enable 6xx support
Date:   Fri,  2 Apr 2021 11:06:23 +0100
Message-Id: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V3:
- Adds Acked-by as indicated - Stan
- Sets bufreq->size = 0 instead of returning -EINVAL
  in hfi_plat_bufs_v6.c when a buffer type is unknown - Dikshita
- Applies work-mode fix to 4xx and 6xx - Stan

Tested on rb5, rb3 and db410c
https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=tracking-qcomlt-sm8250-venus-integrated-sm8250

yaml: in robh/dt/next
8d3a1cb32124 - (robh/for-next, robh/dt/next) dt-bindings: media: venus: Add sm8250 dt schema (17 hours ago)

dts: Resent based on above robh/dt/next application
https://lore.kernel.org/linux-arm-msm/20210401174256.1810044-1-bryan.odonoghue@linaro.org/T/#t

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
 drivers/media/platform/qcom/venus/helpers.c   |  71 +++++++-
 drivers/media/platform/qcom/venus/helpers.h   |   3 +-
 drivers/media/platform/qcom/venus/hfi_cmds.c  |  15 +-
 .../media/platform/qcom/venus/hfi_helper.h    |   9 +-
 .../platform/qcom/venus/hfi_plat_bufs_v6.c    |   6 +-
 .../platform/qcom/venus/hfi_platform_v6.c     | 138 +++++++--------
 drivers/media/platform/qcom/venus/hfi_venus.c | 164 +++++++++++++-----
 .../media/platform/qcom/venus/hfi_venus_io.h  | 118 ++++++++-----
 .../media/platform/qcom/venus/pm_helpers.c    |  92 +++++++++-
 drivers/media/platform/qcom/venus/vdec.c      |  17 +-
 drivers/media/platform/qcom/venus/venc.c      |   2 +-
 14 files changed, 567 insertions(+), 199 deletions(-)

-- 
2.30.1

