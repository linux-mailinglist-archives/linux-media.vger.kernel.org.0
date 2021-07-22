Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB6C3D1F08
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 09:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbhGVGvI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 02:51:08 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:48891 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230298AbhGVGvI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 02:51:08 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6TBFm8Bl7W9Qy6TBGmluFB; Thu, 22 Jul 2021 09:31:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626939102; bh=FmlGXm0i40zK5+eat4ws3Pj731erlwHcm6fkw6fSv0s=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=SWw6rS0mKLH9Lpz/PkdUJ/R9hZ0EnL0L+np87RfFN1Xst458wyOF2MEEI85GMLy3A
         GUAZrl7z9IvWQ9OjK/1P1QI7L2TEI4sWhjK6QBUbS2KFsCbisQ+CD1fsuyTqYEtZl5
         fcW1hjc78tJFNNqDtZHuKVyF18PMbrkeNqFS22/GMr8RjZRYSHmGkwnZSNm0VD5vuL
         /rO8uKGqjxkH4Gw5SWn47ndKqB3YzU0WoAbyA/u3jPv2WM7b3RCIcctcleCkBKd4dD
         35zfANY6UrAmVPzb9UtmkqbsTew3TLD+dcfYPrlK2TAuCXGxf52TOTY9MBT6GOTAEn
         d8QOHn+d8X8pA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.15] v2: Various fixes
Message-ID: <1a6fe05c-9391-3888-445c-5b5bf66ee62e@xs4all.nl>
Date:   Thu, 22 Jul 2021 09:31:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCSXvrWSRpI4vvzDjCkExnmxBZYsoQKSnUCbsUfIX+clMyO7YGIOTn+upKbWhUQexvMZQfStyYAd5CwphRElO9UBOvuLtNsloZtz1D5e5FTHxgZzusUB
 IifV1YCGVMaozZGNXCWxplyyLX8t31/co8XWr5Qogaqt6dAf4jVgMdUA6tIIvJEejZiIcFzuubvNGGjDNLGOBHuOKxklAxyugIuxENOxcDbxmhGf6lSMnvDZ
 B0jP5SQiOnT2xdLq3LuSGx+/tNSNqp+0VhOm+o1VthMyp9xQcc0TLkgV2NIkLO2S
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This time with my SoB.

Regards,

	Hans

The following changes since commit 379e205dab9d7f9761984728e7d6f5f8305cc424:

  media: usb: dvb-usb-v2: af9035: let subdrv autoselect enable si2168 and si2157 (2021-07-12 14:28:49 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.15a

for you to fetch changes up to 3331f577374fa948b1ac6876105b94e26bc8f524:

  media: coda: fix frame_mem_ctrl for YUV420 and YVU420 formats (2021-07-22 09:29:27 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dafna Hirschfeld (3):
      media: mtk-jpeg: fix setting plane paylod
      media: rkisp1: remove field 'vaddr' from 'rkisp1_buffer'
      media: rkisp1: cap: initialize dma buf address in 'buf_init' cb

Dan Carpenter (2):
      media: v4l2-subdev: fix some NULL vs IS_ERR() checks
      media: rockchip/rga: fix error handling in probe

Evgeny Novikov (1):
      media: platform: stm32: unprepare clocks at handling errors in probe

Fabio Estevam (3):
      dt-bindings: adv7180: Introduce the 'reset-gpios' property
      media: i2c: adv7180: Print the chip ID on probe
      dt-bindings: adv7180: Introduce 'adv,force-bt656-4' property

Frieder Schrempf (1):
      media: adv7180: Add optional reset GPIO

Hans Verkuil (1):
      media/cec-core.rst: update adap_enable doc

Matthew Michilot (1):
      media: i2c: adv7180: fix adv7280 BT.656-4 compatibility

Pavel Skripkin (3):
      media: go7007: fix memory leak in go7007_usb_probe
      media: go7007: remove redundant initialization
      media: stkwebcam: fix memory leak in stk_camera_probe

Philipp Zabel (1):
      media: coda: fix frame_mem_ctrl for YUV420 and YVU420 formats

Tom Rix (1):
      media: ti-vpe: cal: fix indexing of cal->ctx[] in cal_probe()

 Documentation/devicetree/bindings/media/i2c/adv7180.yaml |  8 ++++++
 Documentation/driver-api/media/cec-core.rst              |  9 ++++---
 drivers/media/cec/platform/stm32/stm32-cec.c             | 26 +++++++++++++------
 drivers/media/i2c/adv7180.c                              | 66 ++++++++++++++++++++++++++++++++++++++++++-----
 drivers/media/platform/coda/coda-bit.c                   | 18 +++++++++----
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c          | 20 +++++++-------
 drivers/media/platform/rcar-vin/rcar-v4l2.c              |  4 +--
 drivers/media/platform/rockchip/rga/rga.c                | 27 +++++++++++++++----
 drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c  | 12 ++++++++-
 drivers/media/platform/rockchip/rkisp1/rkisp1-common.h   |  6 +----
 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c   |  3 +--
 drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c    |  6 ++---
 drivers/media/platform/ti-vpe/cal.c                      |  6 ++---
 drivers/media/platform/vsp1/vsp1_entity.c                |  4 +--
 drivers/media/usb/go7007/go7007-driver.c                 | 26 -------------------
 drivers/media/usb/go7007/go7007-usb.c                    |  2 +-
 drivers/media/usb/stkwebcam/stk-webcam.c                 |  6 +++--
 drivers/staging/media/tegra-video/vi.c                   |  4 +--
 18 files changed, 167 insertions(+), 86 deletions(-)
