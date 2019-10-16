Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2BEAD91E0
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 15:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393404AbfJPNB6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 09:01:58 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:45961 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2393401AbfJPNB6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 09:01:58 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Kiw5iHjriPduvKiw8ir5bW; Wed, 16 Oct 2019 15:01:56 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.5] Various fixes/improvements
Message-ID: <cb6f7dfe-8e7c-5fa9-e287-22daa356bbbe@xs4all.nl>
Date:   Wed, 16 Oct 2019 15:01:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBThlernRAe81h9lEXvIwj+dcr5gGDDSAwHbJWq6NUyAEL+2AaxWsj/s1+5S+lidRVoSXoVygW2Qa4aKLog2r1fyo2/tos1KBGsVwaJYG2kAHqgrD4qO
 5E/uKaIkVOqm+t98Z2tZPmLd5H/4jlVRXOT75o7tMuS9m6u5wdb28UKTSc4Yj7dbm2LluTpWIGztbw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 3ff3a712a9eabb3d7bf52c263dd1ece054345df4:

  media: ti-vpe: vpe: don't rely on colorspace member for conversion (2019-10-10 13:54:22 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5k

for you to fetch changes up to 8e56688b19f963844ee93991a863e048abda2f3e:

  media: cec-gpio: Use CONFIG_PREEMPTION (2019-10-16 14:38:29 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexandre Courbot (1):
      media: Documentation: v4l: fix section depth

Christophe JAILLET (1):
      media: i2c: adv7842: make array cri static and const, makes object smaller

Colin Ian King (2):
      media: ti-vpe: vpe: use r2y instead of y2r, copy-paste error
      media: gspca: remove redundant assignment to variable ret

Fabio Estevam (5):
      media: adv7180: Only print 'chip found' message on successful probe
      media: imx.rst: Specify the sabreauto variant
      media: imx.rst: Provide a real example for the output format
      media: imx.rst: Provide instructions for the i.MX6DL sabreauto
      media: imx.rst: Pass the v4l2-ctl configuration

Hans Verkuil (1):
      cec-pin: add 'received' callback

Jae Hyun Yoo (3):
      media: aspeed: refine hsync/vsync polarity setting logic
      media: aspeed: set hsync and vsync polarities to normal before starting mode detection
      media: aspeed: clear garbage interrupts

Navid Emamdoost (1):
      media: usb: fix memory leak in af9005_identify_state

Sebastian Andrzej Siewior (1):
      media: cec-gpio: Use CONFIG_PREEMPTION

 Documentation/media/uapi/mediactl/request-api.rst |  4 +--
 Documentation/media/v4l-drivers/imx.rst           | 75 ++++++++++++++++++++++++++++++++++++++++++++-------
 drivers/media/cec/cec-pin.c                       | 10 +++++++
 drivers/media/i2c/adv7180.c                       |  6 ++---
 drivers/media/i2c/adv7842.c                       |  4 +--
 drivers/media/platform/Kconfig                    |  2 +-
 drivers/media/platform/aspeed-video.c             | 55 ++++++++++++++++++++++---------------
 drivers/media/platform/ti-vpe/csc.c               |  2 +-
 drivers/media/usb/dvb-usb/af9005.c                |  5 ++--
 drivers/media/usb/gspca/stv0680.c                 |  2 +-
 include/media/cec-pin.h                           | 10 +++++--
 11 files changed, 130 insertions(+), 45 deletions(-)
