Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB9903D5BDB
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 16:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234477AbhGZN7X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 09:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233206AbhGZN7W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 09:59:22 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC198C061757;
        Mon, 26 Jul 2021 07:39:49 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id mt6so13197269pjb.1;
        Mon, 26 Jul 2021 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yYvK9aTzc6a6mw4NkjoqvsdrfloQMHrbtNcPQkcDqvs=;
        b=sNrV1hIjNLb+jarQ5Td+Ia164crR90C5uz98OgfCVUBSZZB7/clHXhcPJv6x8DJbuN
         rKAl8/Ar8I6pkKdPNSovPLl7JlOOgFjvJXzAuW26ut/CUiuT1JWum4Hevp1VNL0gph5m
         GmmJSTraAZ+BgqAIvbTV6c1bYkAKqAsESejOKo/kIlGO5LEBQJpHURthQyl65kK0s2vs
         TdMMaM4c4ifKl6/FWHeBy4+0vUT59SfiX1RCnXvuXjBbVqCohj7oQObXCI/3vERRIifH
         K6xvLCFG790+7pwl0Wr+ujMKC14Q3gls9yn+gHe4y7PvpALLJSMTDYylu+L2Ut6CFo+4
         jGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yYvK9aTzc6a6mw4NkjoqvsdrfloQMHrbtNcPQkcDqvs=;
        b=ZOnPajQJHWOOMeZ1gmGnP9XSMitSjtHy/djJErzRnpOCXQn4wMK9zqPyjpvNVit6cj
         /viDXQ+X1KcpyKgocma1ewcVLMta358mpk0QYlLRNP7kPT1fuar3q5jINz49Qy9vYCzC
         S1UyzVjNycXU+ldifCkf/MTEwYx7sig0nyhxO1JDaXcDT498NtPD4UBaJgQGZcbo2vFu
         pP68PZ8zuXNaBwBBDHUcT3J1e8ftCjV6F0qfdQz+eToruAMcPUXdvJmFdtBHnhG95zQu
         C8T0UiG43RYdAC31Aht7MFmjh8iyjyf2EC/7vOCUtYq5JtBaOXQMsYlxLt1LFP3IkrsH
         XjKg==
X-Gm-Message-State: AOAM531IpUXmjuSTyLb1J3+MnNMQKcFows5VVllxs90zE9uKBFipmJyY
        aElaHNXKBXqNu0aKGaJTk+U=
X-Google-Smtp-Source: ABdhPJyANxBEIcujpjY/aUnkk7Nm6OAiHljjrusdLSVto/jwB7ZIzT4K22rrIQ3wqUrjA6/cHXMBeg==
X-Received: by 2002:a17:90b:1e46:: with SMTP id pi6mr8048098pjb.57.1627310389230;
        Mon, 26 Jul 2021 07:39:49 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id d31sm28342226pgd.33.2021.07.26.07.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 07:39:48 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK),
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK)
Subject: [PATCH 0/2] drm/msm: Reduce fence signal latency
Date:   Mon, 26 Jul 2021 07:43:56 -0700
Message-Id: <20210726144359.2179302-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

A couple tweaks to reduce fence signal latency.

Rob Clark (2):
  drm/msm: Let fences read directly from memptrs
  drm/msm: Signal fences sooner

 drivers/gpu/drm/msm/msm_fence.c      | 11 +++++--
 drivers/gpu/drm/msm/msm_fence.h      | 41 +++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_gpu.c        | 44 ++++++++++++++++------------
 drivers/gpu/drm/msm/msm_ringbuffer.c |  2 +-
 4 files changed, 73 insertions(+), 25 deletions(-)

-- 
2.31.1

