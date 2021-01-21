Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337C62FE652
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 10:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbhAUJ0Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 04:26:24 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:58061 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728575AbhAUJ0U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 04:26:20 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 2WDXlaIxdyutM2WDalgaM5; Thu, 21 Jan 2021 10:25:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611221130; bh=rvGj+voU6w5z/ax+sCMOHrJNR0wcbkYszKNTQc/zV7k=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=a+1XN3FX6/JfQmaDGhDB9TgBIWj3oMUhK2A+uKniRS5FHCZfI0UCTJ1y4AF4plt1V
         Qua/RE92t9nMqQExNiCGPLzwWZYYbHDRM0wTmzsD0yrv4x/NQoJM9JPaihw59c8LMw
         9cKY6bJer0Q1VNlJwuSoYAvApKs3F450uOpIEcrrbxFICGaMHed6iJkRtD/YLkp0F2
         HUVTVyM3qRCgMcu32of8NnB55oL27c938ZRAKHkxdkSNYm2TNGLZqQtKu8vDQqtKNK
         jkI2KxLbXf+Pti9j8KmhqmaBkXNWbilVH9k+Jj/Bo9ShfjKDip7Op6fsHxiBrzr/6Y
         mubw2/B6mLTcg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.12] Fixes for compiler/smatch/sparse/syzbot warnings
Message-ID: <87bafb44-360b-204e-068b-f63fd3bd1055@xs4all.nl>
Date:   Thu, 21 Jan 2021 10:25:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBsbtvDH+ppX9LP7oxpxiXFB2da8D+mJuA6QfSJNkR1zI2mWyZpec9tPdlf+K33HxCB0GTzN2MkcMJFwdMqMSXSb66SQwsmhK/XYhHDkZQncoTTOV0S2
 e1ieMZLfLl1J2f5scX6RWtim1i011i2vqrU27f5ORpS3uUG0Xiukm/DQoPiD75A3PnIadPwDbEnD6skPLinFTbXrJyEmsaa+Nwo=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 321af22a3d2f6ed1fb1737c8588c01f6fec8a7b8:

  media: atomisp: convert comma to semicolon (2021-01-14 13:59:46 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.12c

for you to fetch changes up to eebc975255b33f5bfc99c2b480bb423d08c1521c:

  i2c/ov02a10.c: add cast to fix type mismatch (2021-01-20 10:40:33 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
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

 drivers/media/dvb-frontends/af9033.c                  |  2 ++
 drivers/media/dvb-frontends/rtl2832.c                 |  1 +
 drivers/media/i2c/ov02a10.c                           |  2 +-
 drivers/media/i2c/ov8865.c                            |  6 +++---
 drivers/media/pci/ivtv/ivtv-driver.c                  |  5 +++++
 drivers/media/platform/davinci/vpbe.c                 |  2 +-
 drivers/media/platform/meson/ge2d/ge2d.c              |  1 +
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c |  1 +
 drivers/media/platform/sti/hva/hva-hw.c               |  1 +
 drivers/media/tuners/it913x.c                         |  1 +
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c               | 35 +++++++++++++----------------------
 drivers/media/v4l2-core/v4l2-ctrls.c                  |  3 ++-
 drivers/staging/media/atomisp/pci/hmm/hmm.c           |  2 +-
 drivers/staging/media/atomisp/pci/ia_css_firmware.h   |  1 +
 14 files changed, 34 insertions(+), 29 deletions(-)
