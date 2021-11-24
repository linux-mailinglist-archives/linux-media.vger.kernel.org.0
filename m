Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1044A45CCEA
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 20:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351216AbhKXTQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 14:16:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:52782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351097AbhKXTQl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 14:16:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F3C061058;
        Wed, 24 Nov 2021 19:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637781211;
        bh=ShVkegqqlX9t3NgDlpdxjJkZAHHvUFAOs0QktUXWaRU=;
        h=From:To:Cc:Subject:Date:From;
        b=JIPgVQG3LDY5LNEy7Z/faVPS18QIVYSpCdrmNV0RLG6Q1njtwPhcvrv7OBO3+7Wi5
         fg5JlbrEm2Wg6L/E8YSB0hKu20+VA1KuMhtyRVALaxKGjWbRFBjGIFlJhHi9wf9S4R
         auZDiv2kx5dj6jSh53Zq6PZ21yjcsxzVzdQHUQgSGNjUKctEUU09E9oRip3y4igX1K
         cwLDePxNW8/es+iXmX5r3az0ypdnogpJP9lh7RceFlHG3Wa+fAJeknC3SdyHHKXZum
         ZRdsPu+gqIz1mchnAbaI07zLtdwBCVXNdO4Vriy113unQ1nq61PimTpY3SDS44zW2x
         C9rQwPqdmBvGg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mpxhs-004Q50-Eq; Wed, 24 Nov 2021 20:13:24 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Andy Gross <agross@kernel.org>, Antti Palosaari <crope@iki.fi>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Malcolm Priestley <tvboxspy@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        llvm@lists.linux.dev
Subject: [PATCH 00/20] Solve the remaining issues with clang and W=1 on media
Date:   Wed, 24 Nov 2021 20:13:03 +0100
Message-Id: <cover.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, using clang with W=1 and CONFIG_WERROR causes media to break.
This is reported by builder.linuxtv.org.

This series solve the remaining issues.

Mauro Carvalho Chehab (20):
  media: adv7842: get rid of two unused functions
  media: saa7134-go7007: get rid of to_state() function
  media: davinci: get rid of an unused function
  media: drxd: drop offset var from DownloadMicrocode()
  media: drxk: drop operation_mode from set_dvbt()
  media: m88ds3103: drop reg11 calculus from m88ds3103b_select_mclk()
  media: si21xx: report eventual errors at set_frontend
  media: solo6x10: add _maybe_unused to currently unused functions
  media: si470x: fix printk warnings with clang
  media: radio-si476x: drop a container_of() abstraction macro
  media: lmedm04: don't ignore errors when setting a filter
  media: au0828-i2c: drop a duplicated function
  media: adv7604 add _maybe_unused to currently unused functions
  media: adv7511: drop unused functions
  media: imx290: mark read reg function as __maybe_unused
  media: davinci: vpbe_osd: mark read reg function as __maybe_unused
  media: qcom: camss: mark read reg function as  __maybe_unused
  media: mtk-mdp: address a clang warning
  media: cobalt: drop an unused variable
  media: mxl5005s: drop some dead code

 drivers/media/dvb-frontends/drxd_hard.c       |  8 -------
 drivers/media/dvb-frontends/drxk_hard.c       |  6 -----
 drivers/media/dvb-frontends/m88ds3103.c       |  6 +----
 drivers/media/dvb-frontends/si21xx.c          |  7 +++---
 drivers/media/i2c/adv7511-v4l2.c              | 22 -------------------
 drivers/media/i2c/adv7604.c                   | 18 +++++++--------
 drivers/media/i2c/adv7842.c                   | 10 ---------
 drivers/media/i2c/imx290.c                    |  2 +-
 drivers/media/pci/cobalt/cobalt-cpld.c        |  5 +----
 drivers/media/pci/saa7134/saa7134-go7007.c    |  7 +-----
 .../media/pci/solo6x10/solo6x10-v4l2-enc.c    | 12 +++++-----
 drivers/media/platform/davinci/vpbe_osd.c     |  2 +-
 drivers/media/platform/davinci/vpif_capture.c | 11 ----------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  2 +-
 .../media/platform/qcom/camss/camss-vfe-170.c |  2 +-
 drivers/media/radio/radio-si476x.c            |  6 -----
 drivers/media/radio/si470x/radio-si470x-i2c.c |  4 ++--
 drivers/media/radio/si470x/radio-si470x-usb.c |  8 +++----
 drivers/media/tuners/mxl5005s.c               | 14 +-----------
 drivers/media/usb/au0828/au0828-i2c.c         |  7 ------
 drivers/media/usb/dvb-usb-v2/lmedm04.c        |  3 +++
 21 files changed, 36 insertions(+), 126 deletions(-)

-- 
2.33.1


