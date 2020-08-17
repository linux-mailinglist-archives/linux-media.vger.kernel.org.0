Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE54246034
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 10:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbgHQIcH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 04:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgHQIcG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 04:32:06 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E55C061388;
        Mon, 17 Aug 2020 01:32:06 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id i10so2235672pgk.1;
        Mon, 17 Aug 2020 01:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=/sULagr6LTMBEuIph56ozIPDd5gsq8y7yywDtmV0n1o=;
        b=L+0tZ+XEaNx7E4bbqWdgnVsz05mRxd2IID1oB4iucIHmz+ujI3Yx7XYTlP58S0u0Bs
         hvA98jxKbeUnp7ewygHv4JhNMDqhmtol9thap/we92EJ3kgL0thCI+sCo+9ol3bF7Cfu
         luS2MhiK0sY0slNz8U8v9FWJDAyab63xhcMdSjnUbng1he2CZJoAY6euA8eU8D8+JyJs
         BNvDGK1hqgnj8xLS1u58UMPF1x3yNQ39214Hzv4jxYiOgJESKTYfVwON80pdEa7Kr45I
         mOAqR+CwlEsx9v3cFYF2W3C4iMDGVe1AhntkLUnhfIyh2GPFw7OKQ3oWgqtyHXS7KxGB
         HUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/sULagr6LTMBEuIph56ozIPDd5gsq8y7yywDtmV0n1o=;
        b=QEL/oPHRQGK4rTEPZwbRKURQ3cindteTebchh2oDPFnNH3gUJ9iwrFm72z97lXtHMb
         0UyhupCQ7hqVUDyFLUPJIPC+01uLwbhL30iGamukaT1fLIRFBOenZMPIctHhfWMLF2YG
         ZYrBqTVtbGTy8DZM0MBde8wGCHLs7VtA6Un3/fjl1dOBfv7NdU6OFWTqxJC6+pnaRZA9
         3TQn55BKVzJkDX51cYjU4+AfM2xs4yimQE82VZ5LqXKaJ/s0hC5TmgX4al3zx++Rpv12
         NJtGDpjg98ZU6TQSRMxCznPOZMeKloJC9oklvERO+2pxP1WtdU5bGQNXX2u2A3YumLMi
         cGVw==
X-Gm-Message-State: AOAM532QiGuM7Nb7/wJ1oSwS8FqqKLXwWzeu6er3PanluPb3pfbQu5lV
        nFv3yiJfs5FoZ7+ZfNG3j/E=
X-Google-Smtp-Source: ABdhPJxCXAqHcjructN7rnGdX9eJEKESjUkpSJjxGaqlz5tyib3O8nNtJ04PWKPZf3ou8Fjkw1YSiA==
X-Received: by 2002:aa7:9712:: with SMTP id a18mr10020822pfg.197.1597653126219;
        Mon, 17 Aug 2020 01:32:06 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
        by smtp.gmail.com with ESMTPSA id b15sm18448351pft.116.2020.08.17.01.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:32:05 -0700 (PDT)
From:   Allen Pais <allen.lkml@gmail.com>
To:     mchehab@kernel.org, maintainers@bluecherrydvr.com,
        patrice.chotard@st.com
Cc:     keescook@chromium.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Allen Pais <allen.lkml@gmail.com>
Subject: [PATCH 00/11] media: convert tasklets to use new tasklet_setup()
Date:   Mon, 17 Aug 2020 14:01:42 +0530
Message-Id: <20200817083153.22218-1-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 12cc923f1ccc ("tasklet: Introduce new initialization API")'
introduced a new tasklet initialization API. This series converts 
all the media drivers to use the new tasklet_setup() API

Allen Pais (11):
  media: bt8xx: convert tasklets to use new tasklet_setup() API
  media: mantis: convert tasklets to use new tasklet_setup() API
  media: ngene: convert tasklets to use new tasklet_setup() API
  media: smipcie: convert tasklets to use new tasklet_setup() API
  media: ttpci: convert tasklets to use new tasklet_setup() API
  media: tw5864: convert tasklets to use new tasklet_setup() API
  media: marvell-ccic: convert tasklets to use new tasklet_setup() API
  media: pxa_camera: convert tasklets to use new tasklet_setup() API
  media: sti: convert tasklets to use new tasklet_setup() API
  media/radio: wl128x: convert tasklets to use new tasklet_setup() API
  media: ttusb-dec: convert tasklets to use new tasklet_setup() API

 drivers/media/pci/bt8xx/dvb-bt8xx.c           |  7 ++++---
 drivers/media/pci/mantis/mantis_dma.c         |  4 ++--
 drivers/media/pci/mantis/mantis_dma.h         |  2 +-
 drivers/media/pci/mantis/mantis_dvb.c         |  2 +-
 drivers/media/pci/ngene/ngene-core.c          | 12 +++++------
 drivers/media/pci/smipcie/smipcie-main.c      |  6 +++---
 drivers/media/pci/ttpci/av7110.c              | 20 +++++++++----------
 drivers/media/pci/ttpci/budget-ci.c           | 15 +++++++-------
 drivers/media/pci/ttpci/budget-core.c         |  6 +++---
 drivers/media/pci/tw5864/tw5864-video.c       |  9 ++++-----
 .../media/platform/marvell-ccic/mcam-core.c   |  7 +++----
 drivers/media/platform/pxa_camera.c           |  6 +++---
 .../platform/sti/c8sectpfe/c8sectpfe-core.c   | 10 ++++------
 drivers/media/radio/wl128x/fmdrv_common.c     | 12 +++++------
 drivers/media/usb/ttusb-dec/ttusb_dec.c       |  7 +++----
 15 files changed, 61 insertions(+), 64 deletions(-)

-- 
2.17.1

