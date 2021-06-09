Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800003A124B
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 13:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238919AbhFILWS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 07:22:18 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:36684 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236239AbhFILWK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 07:22:10 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 322EA1FD2A;
        Wed,  9 Jun 2021 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623237614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=oCiBA5IQR9wf4+Cc+r3nE+xIhszdcMtCPYXz7tk1DUc=;
        b=fY/lBPn1RzheTsgcxOOcUlu2A6QxXJzVzaZKYGY8dQ/N9dkPZxAh+IzMlWy3Mdw4YcifeB
        euR+HK45GJ3f0u+/7nmbJqJDLXGEJmIB2cOWMU93FBBin5A1MqrE27Y9jBklc67vNLz8q3
        MEB05kirgOr7hJDXocRIMCqdq+d45FY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623237614;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=oCiBA5IQR9wf4+Cc+r3nE+xIhszdcMtCPYXz7tk1DUc=;
        b=qtPzutLGd6X37XBCAvAZ4AuMX1bEEdUc0wqN5VeNSoa0OrIM4LVgceME8x2WEfyyR258wQ
        Jhvg0YtWBnitxsBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 8991F118DD;
        Wed,  9 Jun 2021 11:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623237614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=oCiBA5IQR9wf4+Cc+r3nE+xIhszdcMtCPYXz7tk1DUc=;
        b=fY/lBPn1RzheTsgcxOOcUlu2A6QxXJzVzaZKYGY8dQ/N9dkPZxAh+IzMlWy3Mdw4YcifeB
        euR+HK45GJ3f0u+/7nmbJqJDLXGEJmIB2cOWMU93FBBin5A1MqrE27Y9jBklc67vNLz8q3
        MEB05kirgOr7hJDXocRIMCqdq+d45FY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623237614;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=oCiBA5IQR9wf4+Cc+r3nE+xIhszdcMtCPYXz7tk1DUc=;
        b=qtPzutLGd6X37XBCAvAZ4AuMX1bEEdUc0wqN5VeNSoa0OrIM4LVgceME8x2WEfyyR258wQ
        Jhvg0YtWBnitxsBg==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id Pn27IO2jwGBTUgAALh3uQQ
        (envelope-from <tzimmermann@suse.de>); Wed, 09 Jun 2021 11:20:13 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, l.stach@pengutronix.de,
        linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@canonical.com, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        robdclark@gmail.com, sean@poorly.run, airlied@redhat.com,
        kraxel@redhat.com, hjc@rock-chips.com, heiko@sntech.de,
        oleksandr_andrushchenko@epam.com, sumit.semwal@linaro.org,
        christian.koenig@amd.com
Cc:     dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/9] drm: Implement gem_prime_mmap with drm_gem_prime_mmap()
Date:   Wed,  9 Jun 2021 13:20:03 +0200
Message-Id: <20210609112012.10019-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace all remaining implementations of struct drm_driver.gem_prime_mmap
with use drm_gem_prime_mmap(). For each affected driver, put the mmap code
into struct drm_gem_object_funcs.mmap. With the latter change in place,
create struct file_operations via DEFINE_DRM_GEM_FOPS().

As next steps, remaining drivers can be converted to use drm_gem_prime_mmap()
and drm_gem_mmap() (e.g., Tegra). The default mmap code in drm_gem_prime_mmap()
can be pushed into affected drivers or a helper function. The gem_prime_mmap
hook can probably be removed at some point.

Testing is welcome. I don't have all the necessary hardware.

Thomas Zimmermann (9):
  drm/etnaviv: Implement mmap as GEM object function
  drm/exynox: Implement mmap as GEM object function
  drm/mediatek: Implement mmap as GEM object function
  drm/msm: Implement mmap as GEM object function
  drm/qxl: Remove empty qxl_gem_prime_mmap()
  drm/vgem: Implement mmap as GEM object function
  drm/xen: Implement mmap as GEM object function
  drm/rockchip: Implement mmap as GEM object function
  drm: Update documentation and TODO of gem_prime_mmap hook

 Documentation/gpu/todo.rst                    |  11 --
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  14 +--
 drivers/gpu/drm/etnaviv/etnaviv_drv.h         |   3 -
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  18 +--
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  13 ---
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |  13 +--
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  20 +---
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |  43 ++-----
 drivers/gpu/drm/exynos/exynos_drm_gem.h       |   5 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  13 +--
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        |  44 ++-----
 drivers/gpu/drm/mediatek/mtk_drm_gem.h        |   3 -
 drivers/gpu/drm/msm/msm_drv.c                 |  14 +--
 drivers/gpu/drm/msm/msm_drv.h                 |   1 -
 drivers/gpu/drm/msm/msm_fbdev.c               |  10 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  67 +++++------
 drivers/gpu/drm/msm/msm_gem.h                 |   3 -
 drivers/gpu/drm/msm/msm_gem_prime.c           |  11 --
 drivers/gpu/drm/qxl/qxl_drv.c                 |   1 -
 drivers/gpu/drm/qxl/qxl_drv.h                 |   2 -
 drivers/gpu/drm/qxl/qxl_prime.c               |   6 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  13 +--
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c |   3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  44 ++-----
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h   |   7 --
 drivers/gpu/drm/vgem/vgem_drv.c               |  46 +-------
 drivers/gpu/drm/xen/xen_drm_front.c           |  16 +--
 drivers/gpu/drm/xen/xen_drm_front_gem.c       | 108 +++++++-----------
 drivers/gpu/drm/xen/xen_drm_front_gem.h       |   7 --
 include/drm/drm_drv.h                         |  11 +-
 30 files changed, 136 insertions(+), 434 deletions(-)


base-commit: 70e4d80795934312a3853a4f4f49445ce6db1271
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
--
2.31.1

