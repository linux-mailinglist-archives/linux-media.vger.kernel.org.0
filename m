Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3707458B45
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 10:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239037AbhKVJ3W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 04:29:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:59064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229906AbhKVJ3W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 04:29:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8C6760F22;
        Mon, 22 Nov 2021 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637573176;
        bh=SIQ0D8zMU4kb7RRNdo9eoFMTBqAbpXxk4Wy3vA4efh0=;
        h=From:To:Cc:Subject:Date:From;
        b=I49ddTH4x+xPjVzthYILfPB/ThZ97LQKT8RLeeRWG8vNJkfziyXITMFUKtzKMADWw
         nRk/qvhEruFWLo+FJfZhsMP8Nlic+rKmYa/rmT1+rd0EXKUKGFlCqZAacTAyRXKprK
         dNvBYy06LsTt2d/xudtYRP3HZRM3R/t3HLet9BEh9kMqMT4LUxNPBqNvJnV25rec6K
         hv+3/WM8bkAbm+DTaLzE04JEKgsErwcoyV4LQ3u7ovYxe6BPuwCdtjyS/rx92F0/j5
         Vm23Wy4AybjaMkEW94xDj8i0/hrHMW7cwxLlHmhnGAaAi6S+gCZwoSOFmkTTVmtVl5
         8zHsmb9eVHH1A==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mp5aX-003hiA-1T; Mon, 22 Nov 2021 09:26:13 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Walls <awalls@md.metrocast.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        llvm@lists.linux.dev
Subject: [PATCH 00/10] Address some clang W=1 warnings
Date:   Mon, 22 Nov 2021 09:26:02 +0000
Message-Id: <cover.1637573097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Clang is more pedantic than gcc with W=1. This is currently causing
builder.linuxtv.org errors due to CONFIG_WERROR.

Address some of those.

Mauro Carvalho Chehab (10):
  media: cx25821: drop duplicated i2c_slave_did_ack()
  media: ivtv: drop an unused macro
  media: cx18: drop an unused macro
  media: stb6100: mark a currently unused function as such
  media: mc: mark a debug function with __maybe_unused
  media: dvb-core: dvb_frontend: address some clang warnings
  media: cx25840: drop some unused inline functions
  media: marvell-ccic: drop to_cam() unused function
  media: omap3isp: mark isp_isr_dbg as __maybe_unused
  media: omap3isp: avoid warnings at IS_OUT_OF_BOUNDS()

 drivers/media/dvb-core/dvb_frontend.c         | 13 +++++-------
 drivers/media/dvb-frontends/stb6100.c         |  2 +-
 drivers/media/i2c/cx25840/cx25840-ir.c        | 20 -------------------
 drivers/media/mc/mc-entity.c                  |  2 +-
 drivers/media/pci/cx18/cx18-alsa-main.c       |  6 ------
 drivers/media/pci/cx25821/cx25821-core.c      |  7 -------
 drivers/media/pci/ivtv/ivtv-alsa-main.c       |  6 ------
 .../media/platform/marvell-ccic/cafe-driver.c |  7 -------
 drivers/media/platform/omap3isp/isp.c         |  3 ++-
 drivers/media/platform/omap3isp/isph3a_af.c   |  2 +-
 10 files changed, 10 insertions(+), 58 deletions(-)

-- 
2.33.1


