Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB33C1BA283
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2020 13:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbgD0LiH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 07:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgD0LiH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 07:38:07 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B31BC0610D5
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2020 04:38:07 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id r17so13514589lff.2
        for <linux-media@vger.kernel.org>; Mon, 27 Apr 2020 04:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id;
        bh=u7uyCRFUo4pcF2Qpz5gLQ+/JnITro+TE2p+35fbUNJY=;
        b=azkBHvQoeF2tyPZ9ctsO20hKS5vZtJSQxA1JA/8O1n81pQN1pwNED1ErVF4+aPM6z9
         7yiHIEg0zMXk3BdVVgMznnVOTi5ycveVRKG9EKS4WfWiAM+Es/0iw8tuZ7cFcersK2Ga
         oUebCzjc5F8DQyjpRGlmFDPrNvytldDtznK2lDLtiFniYnr9cuWoQzSzrSBH1obCbzqM
         b+FdFMTDrgKab22eo1sVBA9+VinxuWhBBKgXnBGFTnWe5IaMR7SwvXOl05ODPTz7VoBB
         5UNduGmQIdHZo+WP1HE5fC0WrK2BNc2aWYt2Y0A0h5hedTMDSmwtsXFOX00aiDCAH43q
         2aRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=u7uyCRFUo4pcF2Qpz5gLQ+/JnITro+TE2p+35fbUNJY=;
        b=MehXBQVdT9KV9lOyfE66UIy1bqU0XSF2eJYbbns/1kKL1YAbGSSn7q9QprHR2h8Ifd
         O3Bn952GUWkO4Zjyt0qlcK7hxlhH2GzQSI4oNqNStwOOkXIhy3iJxESb/cThYE9jWJBH
         mD3aM4q3khDMh7nWy8UyQqrZh7Otl6bhQPpWUGAsM7CgiHv7jCTy36eez4m5II7mdy9H
         3IWg+GKXzEc+uDz7tv2Ni2s66yb1fI2vbL7t0ywmQ+V2maDy64xDlMHWvDsrvixvi/bA
         1gB/QVvrTwbxg/bAUOLPcxxvPGzhyg71tlWHxhzIZ/H172yHKxlihkPbv4uu91cskYGn
         MYeA==
X-Gm-Message-State: AGi0PuZBQ+KFFu02p+oug8vSDLGHjlxGQjJ/11DbagjHCsv6a0p7311o
        0Tl5tFmzRfDJ3jF1uJcM/sXOTYHtpPZg+A==
X-Google-Smtp-Source: APiQypJvFOavHoomErzIQDwiZ6lLYMhE8gWfBvT1azjcxrAeyHV3lGiVA5fAJJg/X/5R2yBNnwk+aA==
X-Received: by 2002:a19:f806:: with SMTP id a6mr15307935lff.201.1587987485291;
        Mon, 27 Apr 2020 04:38:05 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-103.ip.btc-net.bg. [212.5.158.103])
        by smtp.gmail.com with ESMTPSA id k6sm10958587lfm.91.2020.04.27.04.38.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 04:38:04 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for v5.8] Venus updates - part2
Date:   Mon, 27 Apr 2020 14:35:38 +0300
Message-Id: <20200427113538.26489-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Venus driver updates for v5.8 part2 includes:

  * Missing mutex destroy, reorder platform driver .remove
    to avoid mutex usage after mutex destroy.
  * Done buffers per queue and init registered list unconditionally - 
    those fixes an issue with dynamic-resolution-change.
  * Return EBUSY in S_FMT during streamon.
  * Add a mechanism to mark LAST buffer from before resolution
    change event.

Please pull.

regards,
Stan

The following changes since commit 4bdbff4da40584ec2225bb429b7c66ad54d19cda:

  media: tuners: Kconfig: add some missing VIDEO_V4L2 dependencies (2020-04-23 07:57:27 +0200)

are available in the Git repository at:

  git://linuxtv.org/svarbanov/media_tree.git tags/venus-tag-for-v5.8-part2

for you to fetch changes up to e95173a155cdb60a01b03d88f7b0c38f069e2dd0:

  venus: venc,vdec: Return EBUSY on S_FMT while streaming (2020-04-25 16:25:28 +0300)

----------------------------------------------------------------
Venus updates for v5.8 part2

----------------------------------------------------------------
Stanimir Varbanov (8):
      venus: core: Add missing mutex destroy
      venus: core: Fix mutex destroy in remove
      venus: core: Constify codec frequency data array
      venus: helpers: Done buffers per queue type
      venus: vdec: Mark flushed buffers with error state
      venus: vdec: Init registered list unconditionally
      venus: Mark last capture buffer
      venus: venc,vdec: Return EBUSY on S_FMT while streaming

 drivers/media/platform/qcom/venus/core.c     |  6 ++-
 drivers/media/platform/qcom/venus/core.h     |  5 ++-
 drivers/media/platform/qcom/venus/helpers.c  | 18 +++++---
 drivers/media/platform/qcom/venus/helpers.h  |  2 +-
 drivers/media/platform/qcom/venus/hfi.c      | 10 +++--
 drivers/media/platform/qcom/venus/hfi.h      |  3 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c |  2 +
 drivers/media/platform/qcom/venus/vdec.c     | 66 +++++++++++++++++++++++-----
 drivers/media/platform/qcom/venus/venc.c     | 10 ++++-
 9 files changed, 96 insertions(+), 26 deletions(-)
