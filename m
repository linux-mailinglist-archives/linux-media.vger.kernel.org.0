Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0702C8B61F
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbfHMLDf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:03:35 -0400
Received: from mail-yb1-f202.google.com ([209.85.219.202]:56258 "EHLO
        mail-yb1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbfHMLDf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:03:35 -0400
Received: by mail-yb1-f202.google.com with SMTP id m4so19780950ybp.22
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2019 04:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=5GrEzYiIH/unCsaBGko1TspkMkNP+HLKhnYgNzhRAT4=;
        b=cJ1sWLezAPje8Ue86Ba2meCZXrGWldpGuZC9PGrAChxYC4BaOOjBPlTlrR436zld0j
         sauqlMGYlcV6OH4do/7YT3ZW57sbOh5ZWQk/ACkuhZsxg93be0rcnkwgf2mkAv6qABis
         ePIz4dr45qv+8Hc8Q4kQwDZHNns4RdzC3UMeIhfY9Dsq3Nhe9tcYL2jXccLMTxts2pdR
         12aw3QAASlkykVxmp+xXe/OKHSlVqNmKPeOByVys/jQp0eYvXk5rA+6SMW6XSkXLhvkH
         tcPCkdF7MvkeCFDim4FJVuHrcWvPb1fn10vzFjUeUF2j2eh8TLrVCk+aMzndotIi1xle
         weSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=5GrEzYiIH/unCsaBGko1TspkMkNP+HLKhnYgNzhRAT4=;
        b=Nbu07uPPQfgXBW/+5saFUGM8zueX57IAdHLXmcNOmVpDTNuqqmFNu0GgvK/Thn3i/B
         rsuH4+modwfBXBxq1gPjf7MY9Ty/rc3QRQiRTlX2CkyDpBePtDUSokNfAzaBTizsZIW+
         La+xQN61ABZXAJbKyApSocz7ggQsyx74ihxapRIeilA4QkcosFmZuixxgtvgj715PyCJ
         AtRIQlHsz5aYZRyi1KXCFNZgu/7cNTZWnJ+l/A3Hi/rD6eUuvIHD6LWTeDSDWtJjLUJ+
         lUJY5sR7gGORByuNDySGCRcF5AfEjhHVbV2cJssoLLvns9b22Vgu3p8JSgjlC9VljdEs
         m6+w==
X-Gm-Message-State: APjAAAX/0JCIXBOyRTGYxbns61zwuGcJkX18GQhonCvvy1BsOdsYK+/u
        TTF/zjTTBQevoRCGFxNbfUWenby2qD4=
X-Google-Smtp-Source: APXvYqyLX95KpXN3rEOFXH9arwYXUA/oLB6wYatzxBSXGEWX+FrwajWLVr74R5bJlf/QCVJsods1yg8mh6Q=
X-Received: by 2002:a81:3049:: with SMTP id w70mr18532978yww.173.1565694213999;
 Tue, 13 Aug 2019 04:03:33 -0700 (PDT)
Date:   Tue, 13 Aug 2019 13:02:32 +0200
Message-Id: <20190813110300.83025-1-darekm@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v6 0/8] drm: cec: convert DRM drivers to the new notifier API
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Allison Randal <allison@lohutok.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Colin Ian King <colin.king@canonical.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Enrico Weigelt <info@metux.net>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jani Nikula <jani.nikula@intel.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Kees Cook <keescook@chromium.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "open list:DRM DRIVERS FOR NVIDIA TEGRA" 
        <linux-tegra@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Ramalingam C <ramalingam.c@intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Sam Ravnborg <sam@ravnborg.org>,
        Shashank Sharma <shashank.sharma@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=" 
        <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series updates DRM drivers to use new CEC notifier API.

Only first two patches were tested on the actual hardware.

Changes since v5:
	Fixed a warning about a missing comment for a new member of
	drm_dp_aux_cec struct. Sending to a wider audience, including
	maintainers of respective drivers.
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

Dariusz Marcinkiewicz (8):
  drm/i915/intel_hdmi: use cec_notifier_conn_(un)register
  dw-hdmi-cec: use cec_notifier_cec_adap_(un)register
  tda9950: use cec_notifier_cec_adap_(un)register
  drm: tda998x: use cec_notifier_conn_(un)register
  drm: sti: use cec_notifier_conn_(un)register
  drm: tegra: use cec_notifier_conn_(un)register
  drm: dw-hdmi: use cec_notifier_conn_(un)register
  drm: exynos: exynos_hdmi: use cec_notifier_conn_(un)register

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 13 ++++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 36 +++++++++++--------
 drivers/gpu/drm/exynos/exynos_hdmi.c          | 31 +++++++++-------
 drivers/gpu/drm/i2c/tda9950.c                 | 12 +++----
 drivers/gpu/drm/i2c/tda998x_drv.c             | 33 +++++++++++------
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 13 ++++---
 drivers/gpu/drm/sti/sti_hdmi.c                | 19 ++++++----
 drivers/gpu/drm/tegra/output.c                | 28 +++++++++++----
 8 files changed, 117 insertions(+), 68 deletions(-)

-- 
2.23.0.rc1.153.gdeed80330f-goog

