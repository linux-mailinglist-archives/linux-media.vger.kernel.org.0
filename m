Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6F1B2FCE64
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387420AbhATKjo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:39:44 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:44247 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731644AbhATJny (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:43:54 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2A14lJCTVftvz2A17l8jDt; Wed, 20 Jan 2021 10:43:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611135790; bh=6LGxA5WBLgXBOwMVcq9pjOftrhauWjC2h9oPKKHoJDE=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=RKjicG01syX/2yiOG+D1LkqXsUp0GULwKaI9A0kNrtkLb4QPpc4k5S4C2NgIS/erT
         3NRMRAc5g5GxO2gM/bkvc5PWlfldbj0O9i/t0IBNvcA1Ry1yXmhthxQz+tSJCNM135
         JuyTTakpGD8gQ2yB1+5ZdHWYjRyZxCxWPDeVsx8b0hKR39qZcRmHSrtIy7vY+4FLUz
         3sCNAKuFnUclgBF+INwG/Z/EOWXOwUslVWX6yOGPVEQpx1h5SfwnzG7OOyKZvryL9f
         bLI0ByESozFr3U1EDwVkKayI27jCStp7ndRRmXGaqR2eWRx9SIk9f7JQL6wYDTKCsi
         Wg2lyDaBi5RNA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 00/14] Fixes for smatch/sparse/sysbot/compiler warnings
Date:   Wed, 20 Jan 2021 10:42:52 +0100
Message-Id: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGCYqhuwV3+Yk1rv2QJDZScmo32gHmrOGHUW680tMvz8mG7tCBVf9OnohmtN4nL1GUNY/zfLKBZtYzV8Xbr2NOg5rrxGzfqKLgJgrvnqWJC4O9RuLB9k
 4+VfNDbmV2VhmiocUDJEUTkE6j8PfLoikiLAtkB/Ip/WM8S7VZznmsQJm2Y7dFTFCJ9cpyCfu9LGs2GIOXDrwD4YXI4wlJCqTSc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The first patch fixes a compiler warning for i686, the second
patch fixes a sysbot error, the last patch fixes a sparse warning
and all others fix smatch warnings.

Regards,

	Hans

Hans Verkuil (14):
  atomisp/pci/hmm: fix wrong printk format
  v4l2-ctrls.c: fix shift-out-of-bounds in std_validate
  meson/ge2d: set ret to -ENOMEM
  davinci/vpbe.c: ret contains the return code, not err
  tuners/it913x.c: fix missing error code
  i2c/ov8865.c: fix error checks using wrong variable
  sti/c8sectpfe: set correct return code
  sti/hva: add missing clk_disable_unprepare()
  pci/ivtv: release memory regions on error
  usb/dvb-usb-v2/rtl28xxu.c: clean up code to fix smatch warning
  dvb-frontends/rtl2832.c: fix missing error code
  dvb-frontends/af9033.c: fix missing error codes
  atomisp/pci: add missing include
  i2c/ov02a10.c: add cast to fix type mismatch

 drivers/media/dvb-frontends/af9033.c          |  2 ++
 drivers/media/dvb-frontends/rtl2832.c         |  1 +
 drivers/media/i2c/ov02a10.c                   |  2 +-
 drivers/media/i2c/ov8865.c                    |  6 ++--
 drivers/media/pci/ivtv/ivtv-driver.c          |  5 +++
 drivers/media/platform/davinci/vpbe.c         |  2 +-
 drivers/media/platform/meson/ge2d/ge2d.c      |  1 +
 .../platform/sti/c8sectpfe/c8sectpfe-core.c   |  1 +
 drivers/media/platform/sti/hva/hva-hw.c       |  1 +
 drivers/media/tuners/it913x.c                 |  1 +
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c       | 35 +++++++------------
 drivers/media/v4l2-core/v4l2-ctrls.c          |  3 +-
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |  2 +-
 .../media/atomisp/pci/ia_css_firmware.h       |  1 +
 14 files changed, 34 insertions(+), 29 deletions(-)

-- 
2.29.2

