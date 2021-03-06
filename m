Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD94032FBED
	for <lists+linux-media@lfdr.de>; Sat,  6 Mar 2021 17:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbhCFQa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Mar 2021 11:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbhCFQaC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Mar 2021 11:30:02 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD3CC06174A
        for <linux-media@vger.kernel.org>; Sat,  6 Mar 2021 08:30:02 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id ci14so10318057ejc.7
        for <linux-media@vger.kernel.org>; Sat, 06 Mar 2021 08:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5etTq80et0KN+cNnIQiX157YJIW49YIvX8FW1pMqD2c=;
        b=o21hJOmoZIXGPmsK45E/VYh7cj4oEmuoVDGZZ/b8heMMpR5h/tE+GrRzsZrwcEB9tg
         lViueLA4IDMffgg1XcBrEiB7lIjEb22mdsba8aO+6LzU81lhIjzaUgws9WCSFUw+Jahj
         dvKmgIWwUGsY5nJgTm9TVofoHuC8kocq88bGSrPhZAVIL+CgtoqAnxo3gFylKOmCjGcD
         IxGKwrGeU6xTnup51JLae30ZYReKD9jfkmCglHPslHfJgNJyEO8odm1YONYhx3Fxposa
         WrPMTcIE3bTRB0ijZtaM2n5V6gLOBSEJ4pt2GjmUd6uymIfIC4aMtpsdmzZQWxQTRwiq
         Hpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5etTq80et0KN+cNnIQiX157YJIW49YIvX8FW1pMqD2c=;
        b=K3KaW5umjnuugTzOzBHNmfWK6pI+3dPAZWled3CumnB0NO+FSVJtLLXmDxqviqjbH+
         hwXBLoDwGekPgCDJXtK2Iwrpl7/6l5d+lLHeISIEoUJLrMpNuV4tIdUfxdqRMBXp1YjH
         g/ma8CPwRtMaCnmTN+MoDAxgfdd33mw4LiC3mSLPEfKYDshfzlYX+g6gAwIvOTpno5+6
         KX/Qt40tU4Dossllt5ajnBza38ksBqsbE8+uFA8Os9oYRf5ckkrx+NppYHgGRF+Gbq2/
         OjYtfH/idUAdJ5d4FdfiVHyQEjDnFasI+reje9SxjKAL0vmLL2oCe6FpngDV12FcZS18
         rexQ==
X-Gm-Message-State: AOAM531ZDMsq7r7saaFkjzZnMwC8WWCSGS9yjo72WBcXq8dktu8k1KTt
        j4KOJtao3y9zUGlnu29dLlRiul5u6+kM7g==
X-Google-Smtp-Source: ABdhPJzbq2i5DzrI8+LwvuRGrr3u9WXwg9k7Wq5fZ61Hc4r3/WS43qFAYCpsWjDfSx7Xzi0Tc1r3dg==
X-Received: by 2002:a17:906:f2d2:: with SMTP id gz18mr7490392ejb.454.1615048200758;
        Sat, 06 Mar 2021 08:30:00 -0800 (PST)
Received: from localhost.localdomain (95-43-196-84.ip.btc-net.bg. [95.43.196.84])
        by smtp.gmail.com with ESMTPSA id u16sm3905641edq.4.2021.03.06.08.29.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 08:30:00 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.13] Venus updates
Date:   Sat,  6 Mar 2021 18:29:03 +0200
Message-Id: <20210306162903.221668-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Venus driver updates for v5.13 includes:

 * Make display-delay and display-delay-enable standard controls and support
 for them in Venus driver.
 * Add new AUD generation control and support for it in Venus driver.
 * Parse firmware-name DT property in the Venus driver.
 * Fix probe dependency error in case of built-in Venus driver.
 * Fix interconnect resource in .probe.

Please pull.

regards,
Stan

The following changes since commit 2842027ffb066b62467fde803ecac8024b0fc51e:

  media: imx: imx7_mipi_csis: Print shadow registers in mipi_csis_dump_regs() (2021-03-05 15:31:03 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.13

for you to fetch changes up to 95e3ef7c75edf613dc9f1e46ce5ff0fbc9a75551:

  venus: core: Parse firmware-name DT property (2021-03-06 17:31:12 +0200)

----------------------------------------------------------------
Venus updates for v5.13

----------------------------------------------------------------
Bryan O'Donoghue (1):
      media: venus: core, venc, vdec: Fix probe dependency error

Christophe JAILLET (1):
      media: venus: core: Fix some resource leaks in the error path of 'venus_probe()'

Stanimir Varbanov (7):
      v4l2-ctrl: Make display delay and display enable std controls
      venus: vdec: Add support for display delay and delay enable controls
      s5p-mfc: Use display delay and display enable std controls
      docs: Deprecate mfc display delay controls
      media: v4l2-ctrls: Add control for AUD generation
      venus: venc: Add support for AUD NALU control
      venus: core: Parse firmware-name DT property

Stephen Boyd (1):
      media: venus: Include io.h for memremap()

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 30 +++++++++++++++++
 drivers/media/platform/qcom/venus/core.c           | 38 ++++++++++++----------
 drivers/media/platform/qcom/venus/core.h           |  3 ++
 drivers/media/platform/qcom/venus/firmware.c       |  8 ++++-
 drivers/media/platform/qcom/venus/pm_helpers.c     | 30 ++++++++---------
 drivers/media/platform/qcom/venus/pm_helpers.h     |  7 ++--
 drivers/media/platform/qcom/venus/vdec.c           | 10 +++++-
 drivers/media/platform/qcom/venus/vdec_ctrls.c     | 16 ++++++++-
 drivers/media/platform/qcom/venus/venc.c           | 14 ++++++++
 drivers/media/platform/qcom/venus/venc_ctrls.c     |  8 ++++-
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c       | 16 +++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c               |  6 ++++
 include/uapi/linux/v4l2-controls.h                 |  4 +++
 13 files changed, 148 insertions(+), 42 deletions(-)
