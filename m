Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD36B2A970A
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 14:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgKFNf6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Nov 2020 08:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727214AbgKFNf6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Nov 2020 08:35:58 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80234C0613CF
        for <linux-media@vger.kernel.org>; Fri,  6 Nov 2020 05:35:56 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id q3so1258242edr.12
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2020 05:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=GLoS9H1CAwTsQc2kcdM/RQWCw8WmtKeua26oAihI5Ng=;
        b=egCCB8Z56AccxhKfHFUnrIfE8mcx789gr8drooe4UW5RAnUfoFrvBYc+Ho3TaI4lQc
         Y8Mi1fJZzzjTMceLrWpUK0OR7q/LImGC9X7yg51YwS1AR4NUU7s98nX8owbbdcy1gd2K
         bE75AEL/gd0ITxrZWDwGq32Gg6YSSAINqcByoAVEdLxstFDkwm4CcMNISyGTBitpFVVz
         w1NxSpY96eNnU/kTPL8u/17IFXxXF39FBX8QZGD/lBFZGEeHgxb38DDcHmzsNLgQYOOX
         xgK0RQrVenzW8TLvywmzkxVImXqaMGmaaqxwH5AvJuzk8c2ARDzgNesCiYiHJTTlzt/N
         h8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=GLoS9H1CAwTsQc2kcdM/RQWCw8WmtKeua26oAihI5Ng=;
        b=HPu98/+ZC6dKpF5wHCkWuw4I4pACqH96S94/h9QF/7ZxGyyxXYkiD5mnzgkLQbSFdi
         x7HTSVlZmQ5rFYSUfaw6/dvBA/AK2SlstM/hgxh8ACIk6KJTa+9dbMVQzZxvu0lbG6ws
         gfVHU/zlDK+r1KMS828dnFYqiqwCpYlp3wvJxNCFmOpHynN8KL6HvUMiA1vaB18zFf6G
         WDRVEP2VBkYL+3zLGZDxAtxg0pk5DJddDmkg0Yd9nKKLBk80p5HX7IGf+OB/H719Bmx4
         wHTKKZiyuV8KbEtXbLk0uGyxygL0kZyrrWc6DNypcjajXivcs75kDDU29itfyoI2hGuD
         99Pg==
X-Gm-Message-State: AOAM530a1BVBBxsh4L8QjX2z9RopUgrawYMre2rFS6LTrPXLnQqxP/Oj
        G/ihx11kiKOXNrRCWcqfFHMfJWyaQe8fok4l
X-Google-Smtp-Source: ABdhPJwXvOxEe06J5XomYbNJkmEZHBYe69I5IjtfAhMo3XcRHby5fOfXhy34WpnF8NdLPzITZULWdg==
X-Received: by 2002:a50:fd15:: with SMTP id i21mr1797761eds.127.1604669754803;
        Fri, 06 Nov 2020 05:35:54 -0800 (PST)
Received: from localhost.localdomain (hst-221-81.medicom.bg. [84.238.221.81])
        by smtp.gmail.com with ESMTPSA id a3sm1102325edl.89.2020.11.06.05.35.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 05:35:54 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.11] Venus updates
Date:   Fri,  6 Nov 2020 15:35:36 +0200
Message-Id: <20201106133536.1050-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Venus driver updates for v5.11 includes:

 * Encoder fix for default capture format.
 * Return decoder parsed crop from bitstream.
 * Add shutdown callback.
 * Interconnect vote fixes. 
 * A fix when calculating macroblocks per second.

Please pull.

regards,
Stan

The following changes since commit 0ab4f9087ea94ff92dc2ae68180faaf6bd443021:

  media: platform: add missing put_device() call in mtk_jpeg_probe() and mtk_jpeg_remove() (2020-11-05 18:03:11 +0100)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-v5.11

for you to fetch changes up to 3723e65edbf93f12ec2e78fb22e26a2baa6a5d66:

  venus: core: add shutdown callback for venus (2020-11-06 15:15:51 +0200)

----------------------------------------------------------------
Venus updates for v5.11

----------------------------------------------------------------
Alexandre Courbot (1):
      venus: vdec: return parsed crop information from stream

Mansur Alisha Shaik (8):
      venus: core: change clk enable and disable order in resume and suspend
      venus: core: vote for video-mem path
      venus: core: vote with average bandwidth and peak bandwidth as zero
      venus: put dummy vote on video-mem path after last session release
      venus: fix calculating mbps in calculate_inst_freq()
      venus: core: handle race condititon for core ops
      venus: handle use after free for iommu_map/iommu_unmap
      venus: core: add shutdown callback for venus

Stanimir Varbanov (1):
      venus: venc: Fix default capture format

 drivers/media/platform/qcom/venus/core.c       | 41 +++++++++++++++++++++-----
 drivers/media/platform/qcom/venus/core.h       |  1 +
 drivers/media/platform/qcom/venus/firmware.c   | 17 ++++++++---
 drivers/media/platform/qcom/venus/hfi.c        | 12 ++++++++
 drivers/media/platform/qcom/venus/pm_helpers.c | 12 +++++++-
 drivers/media/platform/qcom/venus/vdec.c       | 32 ++++++++++++++++----
 drivers/media/platform/qcom/venus/venc.c       |  2 +-
 7 files changed, 99 insertions(+), 18 deletions(-)
