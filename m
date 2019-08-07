Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA5788483B
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 10:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfHGIye (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 04:54:34 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:44459 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfHGIye (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Aug 2019 04:54:34 -0400
Received: by mail-vk1-f201.google.com with SMTP id m1so38771877vkl.11
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2019 01:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=P3eLQEGg/5NiddMYrnwvwLhn9pAyZ6i8lRSwURucRrg=;
        b=t9Ft8dMYyvsVaDJ1jEwjKaA/1vTK14jhSFfB0anN4LTU6ejQkEXOe92nLeKsKSLclL
         OLIAF9PtCpIfuwaOwZh+5sDjqAbANSQMtVUlHT2zYrKr8Z6Yk/tE5nw8fUmWqt9aEYNg
         +02bmHVMQNfr+gcmqwIf/BUEtRN2nwJOhk1ryq8W6CWPMSiefaiwzEuLhv/NfXLtebW4
         HMmV968RyLKgMUO3e0hNF7SYqKYiOeCJUvjI4bvFitLzKbTCKFZRhCmP6xjczcYD83pi
         QjrLyJZJBU2bGA0n9+xclFDWG03Fg8yJw/CCdrDjuGJwveul1w7ihXuBZ8Uh8RT/xFJa
         u7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=P3eLQEGg/5NiddMYrnwvwLhn9pAyZ6i8lRSwURucRrg=;
        b=mPdFmY3dzfRebHNteYwigZjGzhiUSEdz3lqZxHz2JJWZ6AsBjdggDPhPPkgEg040LB
         tsoGQMq+2DJHZIGyjDmq+ZD3avWoNvpOFOyg8sW51fKlQTgQoD/D+3upLKsQ1kLZVb9k
         Df5NO3PCQ4J+VwRB5+AZOB8M2zYO4r2yKNXUpGkMI5oeEKzfoUZoSf47ci+VJg5gSJs+
         Q1FWtVtSSwzmFNBHq0pxcUa+ZhHRHtcaoVx19QpxYZI52bDdbo7zdt65zRQJe7mXjvWi
         Sl7L8GMq2379rMOMBdthuOb3S2XYtZ8etd+DZguOxynxtEDlYB+gP3aq2m9hHYLN+yrm
         Iwpw==
X-Gm-Message-State: APjAAAVGZfqrTXfoFYb7cx+SDhT1ShgKdJc662ZXRqg9RrxG0XWD0Trv
        AWOOKQBgNBQXvjLkjs+SrkK/lYZihauVKIrVg2C6CWhfg22qHMxyYf8izv+ZDc5eWOWRTAGSku9
        k162MMr1Lht+RPiefbfTZkZq/cMWTSlXqz/k5/PSJLlPsjwSpR/KDiNoaBOCz7tU7h+j7
X-Google-Smtp-Source: APXvYqyS0k8L4mZem7cbwrm8EI00PEyB579cqDsatqYhpgnWWWAExtoM05r6yX861z1vF77RQ5anXfBopY4=
X-Received: by 2002:a1f:1288:: with SMTP id 130mr2992565vks.12.1565168073498;
 Wed, 07 Aug 2019 01:54:33 -0700 (PDT)
Date:   Wed,  7 Aug 2019 10:52:23 +0200
Message-Id: <20190807085232.151260-1-darekm@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
Subject: [PATCH v5 0/9] drm: cec: convert DRM drivers to the new notifier API
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

Changes since v4:
	Addressing review comments.
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 13 ++++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 36 +++++++++++--------
 drivers/gpu/drm/drm_dp_cec.c                  | 25 ++++++++-----
 drivers/gpu/drm/exynos/exynos_hdmi.c          | 31 +++++++++-------
 drivers/gpu/drm/i2c/tda9950.c                 | 12 +++----
 drivers/gpu/drm/i2c/tda998x_drv.c             | 33 +++++++++++------
 drivers/gpu/drm/i915/intel_dp.c               |  4 +--
 drivers/gpu/drm/i915/intel_hdmi.c             | 13 ++++---
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  3 +-
 drivers/gpu/drm/sti/sti_hdmi.c                | 19 ++++++----
 drivers/gpu/drm/tegra/output.c                | 28 +++++++++++----
 include/drm/drm_dp_helper.h                   | 14 ++++----
 13 files changed, 143 insertions(+), 90 deletions(-)

-- 
2.22.0.770.g0f2c4a37fd-goog

