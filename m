Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68C8E321C0D
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhBVQCZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbhBVQCT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:02:19 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD95FC06174A
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:37 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id 7so19653430wrz.0
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9tiKYSNVVxvrJJec/EA3lPH66CJHgRPb1f0eRGNilkQ=;
        b=wt/Z6QMd2HHnKxPYMSZ7bXm3dKEnIixS61HVHe4/kPYDk+UoKWJ47qgpQOsTVoJ0SY
         IfzK6ky4z0K5iDi+f6x9VacVTiL2u2BdzpN3HTzCAcM/Tb/Z2mUljTy9yAWiu3/2Usc1
         bCG2h+U/HUFqtI+c5OT3cV2zCSATEIRagnQHcj/bnnzNYX76ka5WiQFmjCHzCBOGFylo
         cwCS/BCJ+6cD78Et+DwqLum3AfZsRe3x1MDRgG8GDoVnz/CSR6+FqyNtoMG97a8vfMOW
         D25w0CxyKN1STNYB806nuWI7dsHWtJPT+qKemOwxTWhWjRUuOGUWxgeneZKqtzOG5Ebw
         sW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9tiKYSNVVxvrJJec/EA3lPH66CJHgRPb1f0eRGNilkQ=;
        b=IEf+hp9QRjeoPOQnMIW0QyaVva1VNThdBFm7wb+05o7AkuKwm/gx7raGKM0/fNNmP8
         wh+QZzDNMoH497W7zVY+TeeStS5g2CTRADSEtpuA7AFBBpbjkH3zTffYdcKIJJj6Ne49
         SxEJ9K606RqeMKE+zgqpeh46aGcD8U9farjNmU8wCPWNulz+KuAr+ku5YgFvDjY3NfsO
         rKv8OSlZdJxsX8jfRH9lR3pPMVkyHCgqJaypg3DMzevMC6HYAWyvjyd0aim+c1SSugZC
         ffjQa0oojI/je9tus4ojn8hwD2qw+Z0DRRep0ciIoJ45vlELrA0GVJalUdLQkCSPoxEM
         yiUw==
X-Gm-Message-State: AOAM532O2h22wgk5LXmEHotovjT0uaQA6jBzX5+BP3cfFZivshtSUZhr
        eNDs+NVemBgbhTy0XZfeoyHlmA==
X-Google-Smtp-Source: ABdhPJxVf5oDvjHbwsXFeYp+QxlKOisDByOEJ26N/KkqCIiXSF4F4y+UL02CSTBQiFW8hdA0lFYi1g==
X-Received: by 2002:a5d:6b42:: with SMTP id x2mr21834165wrw.117.1614009696665;
        Mon, 22 Feb 2021 08:01:36 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:36 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 00/25] media: venus: Enable 6xx support
Date:   Mon, 22 Feb 2021 16:02:35 +0000
Message-Id: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
  media: venus: core,pm: Vote for min clk freq during venus boot
  media: venus: hfi: Define block offsets for V6 hardware
  media: venus: hfi: Define additional 6xx registers
  media: venus: hfi: Add a 6xx boot logic
  media: venus: hfi: Add 6xx interrupt support
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

 drivers/media/platform/qcom/venus/core.c      |  78 ++++++++
 drivers/media/platform/qcom/venus/core.h      |  19 ++
 drivers/media/platform/qcom/venus/firmware.c  |  34 ++--
 drivers/media/platform/qcom/venus/helpers.c   |  80 +++++++-
 drivers/media/platform/qcom/venus/helpers.h   |   3 +-
 drivers/media/platform/qcom/venus/hfi_cmds.c  |  15 +-
 .../media/platform/qcom/venus/hfi_helper.h    |   9 +-
 .../platform/qcom/venus/hfi_plat_bufs_v6.c    |   2 +-
 .../platform/qcom/venus/hfi_platform_v6.c     | 138 +++++++-------
 drivers/media/platform/qcom/venus/hfi_venus.c | 177 +++++++++++++-----
 .../media/platform/qcom/venus/hfi_venus_io.h  | 118 ++++++++----
 .../media/platform/qcom/venus/pm_helpers.c    |  92 ++++++++-
 drivers/media/platform/qcom/venus/vdec.c      |  14 +-
 drivers/media/platform/qcom/venus/venc.c      |   2 +-
 14 files changed, 584 insertions(+), 197 deletions(-)

-- 
2.29.2

