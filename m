Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8778D116
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 12:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbfHNKpc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 06:45:32 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:37375 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727237AbfHNKpb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 06:45:31 -0400
Received: by mail-qk1-f202.google.com with SMTP id d203so20958684qke.4
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 03:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=GWyXBGwmHFcGXlg8sYWmi9ISwiX/TjDTxXNJrsxIlo0=;
        b=SO9w2qWfA9s7es8tmXD3wqbpTBgbgE1DHH1ERM7v7ptLx8iAJ95y8N4Tw+xRfTgVDo
         13xnwEMU6xzG5TpnrwEkbvb8IB4VVAMk6MolT2ZOkf2TYbkpgela2WK1udMqSYuSSak5
         Q8LdwxwSdNmbsCfPqW/1A50L/ApA7o7dCxHQL6Y2ilUQe/pD/9Nn91c3LpVJIKbuVG3f
         htMPgcJTD+HpBw3QVSvs7B1iIa/DvtlWekME6zM0+MAhwABxQrewkKFJVJq3adx9qDVe
         C1f+Ddir0Bz1vfsh4GwublcxERGy6vsW5i3k2OyP6w/YcY/Yuy9icYHfcvFqq2wGVRrR
         +BXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=GWyXBGwmHFcGXlg8sYWmi9ISwiX/TjDTxXNJrsxIlo0=;
        b=KDr5sn+aJyI+y1XvGgPQIYDGhuXGL6j73tuSHkDZN+UjeOs13+oZ6vNvfXRCBMIb26
         qGKwF43qn0MzKyt2kUPQ1Krk0/YQf1ulRrRCxf3RGEPERXlk4jQxYYBuS2/qY7iF+TsS
         IUpORFQfP63P9YQNa/S1G7qznfZZvS2g3RxIvLroFRbWNhUTTkoZFZ6XA2r6hLnI8wLC
         Hm4NBPlI2J3ljrHWuj3DbPf/zFKSwcaHRkWiNH+guFNIpEyzKrBuiNxMW2SVeD1dmdCb
         vg0QDqUR1JBwjd4pEQ+a+P72Qf3U71ec0hydox+dqfNkXCMBrwea4KrJb7n8xUGUKTcm
         /P+Q==
X-Gm-Message-State: APjAAAV5bksI0aUToo+47k28sueHtCieoAT5YPPXmuBHXmHr+rHpqw66
        9h29N1W11/O7kp7XZR36MWaYQTaJyfk=
X-Google-Smtp-Source: APXvYqwhM4JMovHg2xzCJqqYJ3hsrqpakcRk8IC6SFMlsdE9qbu+1Sj05yHDBXOw9hQhCX71VwS62n5KfcM=
X-Received: by 2002:ac8:748a:: with SMTP id v10mr16346695qtq.386.1565779530315;
 Wed, 14 Aug 2019 03:45:30 -0700 (PDT)
Date:   Wed, 14 Aug 2019 12:44:58 +0200
Message-Id: <20190814104520.6001-1-darekm@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v7 0/9] drm: cec: convert DRM drivers to the new notifier API
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Allison Randal <allison@lohutok.net>,
        amd-gfx@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Colin Ian King <colin.king@canonical.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        David Francis <David.Francis@amd.com>,
        Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Enrico Weigelt <info@metux.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Harry Wentland <harry.wentland@amd.com>,
        Imre Deak <imre.deak@intel.com>,
        intel-gfx@lists.freedesktop.org,
        Jani Nikula <jani.nikula@intel.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Leo Li <sunpeng.li@amd.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Manasi Navare <manasi.d.navare@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        nouveau@lists.freedesktop.org,
        Ramalingam C <ramalingam.c@intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sean Paul <seanpaul@chromium.org>,
        Shashank Sharma <shashank.sharma@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Thomas Lim <Thomas.Lim@amd.com>,
        "=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=" 
        <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series updates DRM drivers to use new CEC notifier API.

Changes since v6:
	Made CEC notifiers' registration and de-registration symmetric
	in tda998x and dw-hdmi drivers. Also, accidentally dropped one
	patch in v6 (change to drm_dp_cec), brought it back now.
Changes since v5:
        Fixed a warning about a missing comment for a new member of
	drm_dp_aux_cec struct. Sending to a wider audience,
	including maintainers of respective drivers.
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
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 13 +++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 46 +++++++++++++------
 drivers/gpu/drm/drm_dp_cec.c                  | 25 ++++++----
 drivers/gpu/drm/exynos/exynos_hdmi.c          | 31 +++++++------
 drivers/gpu/drm/i2c/tda9950.c                 | 12 ++---
 drivers/gpu/drm/i2c/tda998x_drv.c             | 36 ++++++++++-----
 drivers/gpu/drm/i915/display/intel_dp.c       |  4 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 13 ++++--
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  3 +-
 drivers/gpu/drm/sti/sti_hdmi.c                | 19 +++++---
 drivers/gpu/drm/tegra/output.c                | 28 ++++++++---
 include/drm/drm_dp_helper.h                   | 17 ++++---
 13 files changed, 155 insertions(+), 94 deletions(-)

-- 
2.23.0.rc1.153.gdeed80330f-goog

