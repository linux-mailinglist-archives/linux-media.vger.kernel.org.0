Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CFC96A8B6
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 14:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728513AbfGPM1v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 08:27:51 -0400
Received: from mail-yb1-f202.google.com ([209.85.219.202]:37913 "EHLO
        mail-yb1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727849AbfGPM1v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 08:27:51 -0400
Received: by mail-yb1-f202.google.com with SMTP id i70so16697164ybg.5
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 05:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=d6vtHoc5WG+IltTIaRNdOIPT91MKtiy7l3DANV9ifns=;
        b=CoQfrOkTmHzJUWijtupmQ1qrcNlcQFpcc6zWdmBrvXge7Hp6VHnB4i534Nd312Zu2i
         TA7SPmYKnXUYjd3ZBrhTf8RPt+cqWyJXv92cbboiZ9RNxPSF6vz4wLLLi04/fcAwQnWG
         d60o0kQbxyqyQe8NI9mo403cRQ67hEXJmgca6UBRPNdEls2yzWeJGFcCxqL4QZSef7UC
         1/HuBNddNjWRxBgTzVkjPHbUV/SkolEI9hxTXo8zjf0tL/GGsvZ9wT/k33zr/Pwl42Ze
         P0DzqAg4/0JaFZwxWFP1Vr+AakrU2UmRaPxWd+YOxbCgjFEzyhxGwYDct8wlOO+2hgGx
         PXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=d6vtHoc5WG+IltTIaRNdOIPT91MKtiy7l3DANV9ifns=;
        b=U/+UOLAY6/SWZaqcyUQz5tZbUJPy5QFKvWATCSbnNm25Uqj3VUjDY0lU76tAo7aBMv
         a8G724EG9ZF2trRiGSqyGkKhRO74034fR5g6nez34BSJ/W4nkrBCNcDPbZSDGfNLtouq
         UTSYACucKDGDbxhEXDJQl4tqmHBeliAM0rXf1krIqKLI/4pEdY+lL3mb/GvEwXLavURg
         PS9IMhHpgVX/qlV2EaddbTsuijLDF8gsxvoHPdpasroTZBSxp6/mZNvfHHX1bxskvGxD
         nhH+EY860h/JOHKSWcoklVdYhWgoObje8HtPAOEoRNmEeutVyp/xUWBfI0fyfxbSgAQ8
         B/4w==
X-Gm-Message-State: APjAAAWFxjLajz3Mr9vl/tfLHfAEAjyAZvg6+uGRc/Z1wj0lc01JQJiY
        z8evRV6jtyteWixrzfxcwDCVMqLb1PBiHFrR8AcelER9ALV1VHSg10N3gIYodxSO0WOoHse9LHY
        6UnwdIpgeJovPxf1siLBKIN4S3mY4ox8k4k/+205GvELf5QlXQujAFRid2XdgMbkYyHRl
X-Google-Smtp-Source: APXvYqwIgbsZR6MZnCh0PlfrA1825PCY9I+TdeoBuulnqcfssGVNJsrrlgg/YMh8OSbK0chZ5IFOhmL3Afw=
X-Received: by 2002:a25:cfcd:: with SMTP id f196mr20743877ybg.344.1563280070564;
 Tue, 16 Jul 2019 05:27:50 -0700 (PDT)
Date:   Tue, 16 Jul 2019 14:27:09 +0200
Message-Id: <20190716122718.125993-1-darekm@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v4 0/9] drm: cec: convert DRM drivers to the new notifier API
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series updates DRM drivers to use new CEC notifier API.

Only first two patches were tested on the actual hardware.

Changes since v3:
        Updated adapter flags in dw-hdmi-cec.
Changes since v2:
	Include all DRM patches from "cec: improve notifier support,
	add connector info connector info" series.
Changes since v1:
	Those patches delay creation of notifiers until respective
	connectors are constructed. It seems that those patches, for a
	couple of drivers, by adding the delay, introduce a race between
	notifiers' creation and the IRQs handling threads - at least I
	don't see anything obvious in there that would explicitly forbid
	such races to occur. v2 adds a write barrier to make sure IRQ
	threads see the notifier once it is created (replacing the
	WRITE_ONCE I put in v1). The best thing to do here, I believe,
	would be not to have any synchronization and make sure that an IRQ
	only gets enabled after the notifier is created.

Dariusz Marcinkiewicz (9):
  drm_dp_cec: add connector info support.
  drm/i915/intel_hdmi: use cec_notifier_conn_(un)register
  dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
  tda9950: use cec_notifier_cec_adap_(un)register
  drm: tda998x: use cec_notifier_conn_(un)register
  drm: sti: use cec_notifier_conn_(un)register
  drm: tegra: use cec_notifier_conn_(un)register
  drm: dw-hdmi: use cec_notifier_conn_(un)register
  drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register

 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c |  9 +++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 36 +++++++++++--------
 drivers/gpu/drm/drm_dp_cec.c                  | 25 ++++++++-----
 drivers/gpu/drm/exynos/exynos_hdmi.c          | 31 +++++++++-------
 drivers/gpu/drm/i2c/tda9950.c                 | 11 +++---
 drivers/gpu/drm/i2c/tda998x_drv.c             | 33 +++++++++++------
 drivers/gpu/drm/i915/intel_dp.c               |  4 +--
 drivers/gpu/drm/i915/intel_hdmi.c             | 13 ++++---
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  3 +-
 drivers/gpu/drm/sti/sti_hdmi.c                | 19 ++++++----
 drivers/gpu/drm/tegra/output.c                | 18 ++++++----
 include/drm/drm_dp_helper.h                   | 14 ++++----
 13 files changed, 130 insertions(+), 88 deletions(-)

-- 
2.22.0.510.g264f2c817a-goog

