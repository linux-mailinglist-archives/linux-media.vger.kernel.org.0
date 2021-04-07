Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D22C356EED
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 16:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235747AbhDGOkV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 10:40:21 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:54753 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232909AbhDGOkV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 10:40:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id U9LjlSZROMxedU9LmlIrrM; Wed, 07 Apr 2021 16:40:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617806410; bh=nEylqVJh5z2fj1xEqX7ydepdGhOsxnJYC4oex+krT64=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Tv11rmS25JPmzEQuHfdI/CnONWp2Hm4KeGpmK9g31qTRU/hALXMcbq4IA0O/xU/MV
         3FXUjhTvrjVFxuntmHL4sLmUGmXVqaJDHv9bd59R+5+7+Q3+9BAe1zFu/a/Wqhf8G3
         +Xa2aNolgOnM5jVw/6WIRo6onpS8M1q8jUCdbrhexvMOB9SEfyVHnHzusWvAI7tydU
         V9ObRJDZMmJGI2I7gbbhZAIWeard0RJzvj4znAtqJjskOLXR4o5qM/UZBszglW5EWu
         TMujlCC12DrVdE140f7EqptCGf+uQFyupsFD01B/IekYz9FoACtHDehVTPZrjNwoCe
         vFm80T6kFJOmQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] Various random fixes
Message-ID: <5a84f8e8-ede2-f0bd-f3be-ea12efa386c4@xs4all.nl>
Date:   Wed, 7 Apr 2021 16:40:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNV0x1bEfdv3IqPKMw6+YrgqNNtH7wIh+VQ0oevw/9enjYFtD47+GUOX6lJgcNkTF3DsAuUtT0OhoIlL6mpJ/9pM2KCuYPWjgtT4QX84C3Fwf/p42Ewz
 IpOkYfSD/FMTO0RNmNxCJVS5EUhhU3Bl5GmtGq932FE3C2UUbN/drQ1qLmuGssrCHEHzVm+Z5KSN9F5exES403Olva9RG00EZWI=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit c1c1d437b1f0a84de6b53416026f7ea1ef3df996:

  MAINTAINERS: update ovti,ov2680.yaml reference (2021-04-07 10:01:07 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13a

for you to fetch changes up to 39ff66cb46464777417246317d136cf8e8ac2fa7:

  cobalt: drop static for sd_fmt (2021-04-07 16:17:23 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dinghao Liu (2):
      media: platform: sti: Fix runtime PM imbalance in regs_show
      media: sun8i-di: Fix runtime PM imbalance in deinterlace_start_streaming

Hans Verkuil (1):
      cobalt: drop static for sd_fmt

Mirela Rabulea (1):
      media: imx-jpeg: Fix double free in mxc_jpeg_remove

Yang Yingliang (5):
      media: tc358743: fix possible use-after-free in tc358743_remove()
      media: adv7604: fix possible use-after-free in adv76xx_remove()
      media: i2c: adv7511-v4l2: fix possible use-after-free in adv7511_remove()
      media: i2c: tda1997: Fix possible use-after-free in tda1997x_remove()
      media: i2c: adv7842: fix possible use-after-free in adv7842_remove()

 drivers/media/i2c/adv7511-v4l2.c                 | 2 +-
 drivers/media/i2c/adv7604.c                      | 2 +-
 drivers/media/i2c/adv7842.c                      | 2 +-
 drivers/media/i2c/tc358743.c                     | 2 +-
 drivers/media/i2c/tda1997x.c                     | 2 +-
 drivers/media/pci/cobalt/cobalt-driver.c         | 2 +-
 drivers/media/platform/imx-jpeg/mxc-jpeg.c       | 1 -
 drivers/media/platform/sti/bdisp/bdisp-debug.c   | 2 +-
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 2 +-
 9 files changed, 8 insertions(+), 9 deletions(-)
