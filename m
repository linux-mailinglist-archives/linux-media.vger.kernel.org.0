Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0BA16A360
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 09:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730545AbfGPH6i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 03:58:38 -0400
Received: from mail-qk1-f202.google.com ([209.85.222.202]:41046 "EHLO
        mail-qk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbfGPH6h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 03:58:37 -0400
Received: by mail-qk1-f202.google.com with SMTP id d9so16098035qko.8
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 00:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=8sggUP9D93+xwqdVyeKou72hWGRM240B7llkVJWz1Xo=;
        b=p5xYrApNFA7JZQ9mZAv6k2vCQ4zbLLeuj/169IkzDPhe1cE84z8qXel9tjIhoxyOup
         iu7G+sQXZ0kvm/wEsLKbpRpwseeqruBQwegvUkYb3ZYalHRH8tGxs+nAx2VFBHX8p4IT
         qqq37rLEaNTGo6mmxR17+o4kBCHgdXWDtcGgH/ZWSjQN1Twecyz/PSUHhx5WGvvwbPoX
         3di/tVkXYxTXQHQBhUDxDGy23fVAyrI+KvLJqDmHcK2u1Iwi2tRtdu+Kjzo2HRFrYHM/
         qgqgdQC8zSYOtfO7Qro4EJpmlgkl8rWIkku0ksuVCW6oNRQuF+nkDH1SWEyopAR20kSO
         trwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=8sggUP9D93+xwqdVyeKou72hWGRM240B7llkVJWz1Xo=;
        b=s8zcdcat3hxKu9bR+Br4az9bvd/sZAgzxh7l5810sP1Que16g8D/4TJfNUZ9L5QvRt
         P2UrpNgh3unj+ZOUHOG0RbcuzoE8Fm/yvygNA3DUzJEhhb+lerQJw4cjr7sfxkrBhBOw
         VXEAJ6AtTDnur7Lei0W/YOT0Rs9WHtMhNWo3m5WYIIG5KmTGiYYig+CnV659138xkS1J
         B4FRJNk+9t9UQ9wEH6V/LRtKd43jwhCxXq94rfmynu+W5tIi9txnfzVjoY4H1rvqZuGX
         U3tKYGGpfklF1ggMgQyP9lUnDcbI4+BkfSn4DMa99EA18YDAJhEqWxr93tQjroOw6wNp
         aK+w==
X-Gm-Message-State: APjAAAVG04vlV3ZWDeyXAMaeifGV1H5BW8Jy+KglKtln/tG7yNPECSfb
        PM5CoyL24LnGVQy74uzY74sK2ZvXCNSaT3TFlFeBcyx3t89QFSYzkKyhDWfVas/IW7+R9hO4y7M
        h3YNtuYh5oTjn1eRcTN89SdX8UX9EMHtjQBD6YWbFQO1rzQyVhgK2rMrEpqno+FRqw+YF
X-Google-Smtp-Source: APXvYqywulxIpLyJxWl1aAeWloLY/K+tzYbyEIkcEHKKCfgL9rWes1CprfR3zU6sllKuFb9jkLMC5qnQQCk=
X-Received: by 2002:ae9:edcf:: with SMTP id c198mr17978875qkg.79.1563263916817;
 Tue, 16 Jul 2019 00:58:36 -0700 (PDT)
Date:   Tue, 16 Jul 2019 09:58:11 +0200
Message-Id: <20190716075820.260202-1-darekm@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v3 0/9] drm: cec: convert DRM drivers to the new notifier API
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        hverkuil@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series updates DRM drivers to use new CEC notifier API.

Only first two patches were tested.

Changes since v2:
	Include all DRM patches from "cec: improve notifier support,
	add connector info connector info" series. Updated commit
	message.
Changes since v1:
	Some of the patches delay creation of notifiers until respective
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

