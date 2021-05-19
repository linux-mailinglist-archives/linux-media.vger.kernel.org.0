Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8680389576
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 20:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbhESSg2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 14:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhESSg1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 14:36:27 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 264C4C06175F;
        Wed, 19 May 2021 11:35:08 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id q6so7783661pjj.2;
        Wed, 19 May 2021 11:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OXGExEV9DKzHJXkbbNu+OVKImQdQyVv51ZhcABCoj+c=;
        b=VZnQB3TxN9YgO/dIaFVc2+8H4/rfLP27UtLLUyHSQnGpnObGKzI49EYOFNj55HB1Ib
         KDN3mpnAfRCZWzYXRhCZfmOHesq7zvueE9s9hkhFZvaRmd7Dan9VeXNl9u+jLqheXsbV
         XqOPaKcxraAO9TpALhWIaLd0hW/+IR3k3yhcH6ScPBCHyejoghtRjIM2TkjFPHt8qOCZ
         cPIFpSi8EtmD5buBu4Uc47iP7kXsMzEu8/wuwHyhxePBEdKVQ/v9URBCJSlPZdAr4pHa
         RI3v65vcbzc2BQ1Z6MVuOCjZOaCS7NQq/ygVahpH8PbmiyFbGcH+pfW9xTrk1y7v3GR3
         2olQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OXGExEV9DKzHJXkbbNu+OVKImQdQyVv51ZhcABCoj+c=;
        b=czV7x2HHWQeMbRgE/Eu87DMJIzcB8CodSHxeXI69gjKE1LOUu4B/lWbCMUgmqPT2Q6
         eP8WUpdZwS2G6RsG70Fkhk0iBM9M4S6yiTTiKDLxgTX6Zd3iOA0S2evYe1ny18BaVUAf
         1BoBeFHKxamywUTEavoCj9yBbNk8rHb3/O4jTSJcSS8nHmwUxjFQ1DY7sqM0tdtqwrTb
         XU6iHzyRBQSBfEAW2YM7def9sjcNArXWaSl57peZnMpaTcWcfVmf3wGTohO48vAL+lZV
         jFt//uYhEQdxWXCN3O6IPXsh3srlKHScwtbBl9z4HjCT2i1EeEfjl7H/anbGgUtwtIza
         8hcw==
X-Gm-Message-State: AOAM531mX4q1qZbbfEeilqhlVfNU0eNpOC1tb/JsbKgu1s5NpdbVoNYf
        oMpROQE5N0K5JyWURI/ah7E=
X-Google-Smtp-Source: ABdhPJzT41yLbhtZB7tJviu8pahUyGJsXxTpFBsuKRqM6hf3433QzAmTmbncbwVd3iCvrem4aPOSdA==
X-Received: by 2002:a17:90b:1041:: with SMTP id gq1mr697596pjb.224.1621449307682;
        Wed, 19 May 2021 11:35:07 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id k7sm4759153pjj.46.2021.05.19.11.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 11:35:06 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK), linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK)
Subject: [RFC 0/3] dma-fence: Add a "boost" mechanism
Date:   Wed, 19 May 2021 11:38:51 -0700
Message-Id: <20210519183855.1523927-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

In some cases, like double-buffered rendering, missing vblanks can
trick the GPU into running at a lower frequence, when really we
want to be running at a higher frequency to not miss the vblanks
in the first place.

This is partially inspired by a trick i915 does, but implemented
via dma-fence for a couple of reasons:

1) To continue to be able to use the atomic helpers
2) To support cases where display and gpu are different drivers

The last patch is just proof of concept, in reality I think it
may want to be a bit more clever.  But sending this out as it
is as an RFC to get feedback.

Rob Clark (3):
  dma-fence: Add boost fence op
  drm/atomic: Call dma_fence_boost() when we've missed a vblank
  drm/msm: Wire up gpu boost

 drivers/gpu/drm/drm_atomic_helper.c | 11 +++++++++++
 drivers/gpu/drm/msm/msm_fence.c     | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.c       | 13 +++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h       |  2 ++
 include/linux/dma-fence.h           | 26 ++++++++++++++++++++++++++
 5 files changed, 62 insertions(+)

-- 
2.30.2

