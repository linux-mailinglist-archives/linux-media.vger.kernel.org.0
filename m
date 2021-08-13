Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 605223EB314
	for <lists+linux-media@lfdr.de>; Fri, 13 Aug 2021 11:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239879AbhHMJCx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Aug 2021 05:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239704AbhHMJCw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Aug 2021 05:02:52 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94EE7C061756;
        Fri, 13 Aug 2021 02:02:26 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id m24-20020a17090a7f98b0290178b1a81700so15056401pjl.4;
        Fri, 13 Aug 2021 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QyadB7FpuNKWDpEAZ8pIq2q37loKngbMavtVP6UOn6M=;
        b=otuX9qtW7oO7slcAr8Qx9A7t9+t16sjcuBTl0Nz1CiCb/f+XIczvOF3wPAf72bjlA0
         eh9bVUdU+CbC57B3GtKBbNP5C3gC9FbLyiunBYxysyO+TmTxoXWr+pR8FqLuKMqy7ndv
         X42dGivelzNOJPCYdAKl5b9GYZGUPQJhA9z3g5boJaeMcB+MJCqDza6JXTKzu5V+i4Je
         pDYKKtsBFnyJ+68KHYwtwFf8z774UFQYQu8cPjX3Iuzcbas3mGrsFkhyzJ/dcN2WwrT+
         aDca6bW8UBPIF0QqZXCnPVSh4gJB4cThZ/dK+FzKoXsr7HOu+vRrnKGK3IKk8sQVZS0s
         lLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QyadB7FpuNKWDpEAZ8pIq2q37loKngbMavtVP6UOn6M=;
        b=CMApOO/Ts9kCpvk0qccO49U8SNLCKGz7vIHPnuqZ3RkJXFuGsgHbZzv0zu3TLPBK2F
         ZHz2OORT4eqHl0btMlFIGH4krikE+ueew6c8jJcS/wUEvjMg6mMB047OgTgxuCjL5LhG
         rL7xQ33hRZTvgat3e44eod+rIetCH4h0Z+wpUyelpWPx4LKb4Sg4pCQBXD+KDgEUmfOZ
         zwyWoJrRhc2XvKNK6YbFZyinZSiXyz016qBmbkXth7OSZrKhV9hWlVNjsPKBnNWm2oz/
         +OAvxoL2YGcf/NJpoqHokmr8NtkBG+4VZjKehj3dqjA1TrXhcFio0oOxSbBp7ODletHw
         nl/w==
X-Gm-Message-State: AOAM53108TzTXDGXRY7Th1178ZUp1PJb0JQNCPc383kimnQSS3Rq/J1G
        lpp6KxvQIqX+H6WDD0Kedbs=
X-Google-Smtp-Source: ABdhPJzwOPIahHcMzCFDYaA2ZSWs+PyhnrGetdTzb2NAmo63L/38ue6X0HTkv/G8tJ/ZUe0l9S34hA==
X-Received: by 2002:a65:468c:: with SMTP id h12mr1473806pgr.423.1628845346151;
        Fri, 13 Aug 2021 02:02:26 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
        by smtp.gmail.com with ESMTPSA id 31sm1818428pgy.26.2021.08.13.02.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 02:02:25 -0700 (PDT)
From:   Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH 0/2] drm: update the ioctl handler
Date:   Fri, 13 Aug 2021 16:54:48 +0800
Message-Id: <20210813085450.32494-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Finally got around to it. This patchset implements some updates to the
drm ioctl handler that were first raised by Daniel Vetter in [1].
Namely:

- Flush concurrent processes that can change the modeset when
DRM masters are set/dropped or a lease is revoked
- Unexport drm_ioctl_permit()

Thoughts and comments would be very appreciated.

Link: https://lore.kernel.org/lkml/YN9kAFcfGoB13x7f@phenom.ffwll.local/ [1]

Best wishes,
Desmond

Desmond Cheong Zhi Xi (2):
  drm: avoid races with modesetting rights
  drm: unexport drm_ioctl_permit

 drivers/gpu/drm/drm_auth.c           | 17 +++++++++---
 drivers/gpu/drm/drm_client_modeset.c | 10 ++++---
 drivers/gpu/drm/drm_drv.c            |  2 ++
 drivers/gpu/drm/drm_fb_helper.c      | 20 ++++++++------
 drivers/gpu/drm/drm_internal.h       |  5 ++--
 drivers/gpu/drm/drm_ioctl.c          | 40 +++++++++++++++-------------
 include/drm/drm_device.h             | 11 ++++++++
 include/drm/drm_ioctl.h              |  8 +++++-
 8 files changed, 77 insertions(+), 36 deletions(-)

-- 
2.25.1

