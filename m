Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA9F30488C
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 20:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388446AbhAZFob (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:44:31 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:56247 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727829AbhAYMK5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 07:10:57 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 40h3lTplciWRg40h6lgHFL; Mon, 25 Jan 2021 13:10:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611576608; bh=Q5X3B1Te4Mb+IDzqiZMD2xy4CELtNWArhyjsw6kAegw=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=B8waQxmf0DWmgVM1hzh6VqPH+B4H/FQ6IV0mYiXYww2wjwLHjsKtkV77tTlZ5oPZz
         GCurJUpLGz9gQ3YtAW6euvbeZe+zX6mQKBiutE6N40grKtT8FQ8JF/uupE+tFV5nA8
         hYWymdQ3oXXWouBEN/y/TWovydWPtTiEkhtHU9+KVIr2Zw60APrvBiaFGpc+NRyCZE
         K3XBVBZHcm4sKbpd6YfjIkAQzIBlOWF9OmJlT2LD15T2Vsh5V92WDtnzNG8prlNoOM
         RgEALeluAn3wFrjh8kNAEj1ELiku90lxQf4ILmlYngfKWcxsaTui8ri3prX9eN4Q8S
         bB3Kh2YOyWJjg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.12] Various fixes
Message-ID: <5660c371-6020-bae8-aa19-38e3ec4f09b9@xs4all.nl>
Date:   Mon, 25 Jan 2021 13:10:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfAGFJxYuN+1P9t75HS63BcryiI1uJCK2MAK1nz0Et9VhKF8LhjWNwwdOmRHQHKFk0bcpI7viobdx2q9AVPsx4+26IPCmHvCc+jsKBoCyTtv2XyI7dGMm
 fncLKWxgpNw5tLGVhAu7bbfFAnIa0z0varEVjUIkOGyV6L7wuE7aPSIuvbY/n1jXIkdJgQdJy0vcSzSRKL4fLevn3URchBCHX8k=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 066a94e28a23e04c0e9cb293f9ead56d409d7e41:

  media: dt-bindings: media: Use graph and video-interfaces schemas (2021-01-22 22:40:15 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.12f

for you to fetch changes up to 1e3b18ea1f0926ee9ad4f7706d9443e1374eb772:

  media: zr364xx: fix memory leaks in probe() (2021-01-25 12:27:20 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Christophe JAILLET (1):
      media: smipcie: switch from 'pci_' to 'dma_' API

Dan Carpenter (1):
      media: zr364xx: fix memory leaks in probe()

Ezequiel Garcia (1):
      media: imx6-mipi-csi2: Call remote subdev get_mbus_config to get active lanes

Helen Koike (2):
      media: v4l2-ioctl: print capabilities in v4l_print_create_buffers()
      media: videobuf2-v4l2: remove redundant error test

Maxim Plotnikov (1):
      Fix RTL2832 not depending on REGMAP_I2C

Niklas Söderlund (2):
      rcar-vin: Do not try to stop stream if not running
      rcar-vin: Route events to correct video device

ivan tkachenko (1):
      media: hdmi: cec: replace broken link to HDMI specs

 Documentation/driver-api/media/cec-core.rst     |   2 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c |   5 ---
 drivers/media/dvb-frontends/Kconfig             |   2 +-
 drivers/media/pci/smipcie/smipcie-main.c        |  26 +++++++------
 drivers/media/platform/rcar-vin/rcar-dma.c      |   5 +++
 drivers/media/platform/rcar-vin/rcar-v4l2.c     |  42 +++++++++++++++++---
 drivers/media/usb/zr364xx/zr364xx.c             |  49 +++++++++++++++---------
 drivers/media/v4l2-core/v4l2-ioctl.c            |   6 +--
 drivers/staging/media/imx/imx6-mipi-csi2.c      | 108 ++++++++++++++++++++++++++++++++++++++++++++++------
 9 files changed, 189 insertions(+), 56 deletions(-)
