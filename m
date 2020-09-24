Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E5B2771C5
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 15:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbgIXNFq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Sep 2020 09:05:46 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:32939 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727704AbgIXNFp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Sep 2020 09:05:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id LQwNk4uzo4gEjLQwRkbIIC; Thu, 24 Sep 2020 15:05:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1600952743; bh=TCXIx5+SaQ9/bcU2dMdJfdFWmHyW0wBDAyu7iWaeulw=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cUkCz7b1nSViB5JZh/Rkyt3qdB2lFOEWWtLblnWsr+f5UKrZ+J6sYrm9h7Eg7h8w4
         uaNOvoXXSmW8J1jhWvdtJC7ZvR19laVSg6BtAZ0sz8l0Qf0J5ur95piLcao14026JP
         nZs5Ly+anJAMCMICAiOBLBcmx6u+F7LjOPr5fMaLQobskzJ/NtuCDvv+NE4R5Lqzv/
         dx3u81ZWD78za7Wow984mvTBD2rqaj+YE1ffJSHWcG64e9N+ZfWmR4mvc1n4rECbb1
         x3CLug4C0Urx1h9gGInfIWyesO1d39tnGlclrTPsouH2nW0qdtFwcAZ8HCO1CIdRgy
         wgvTl96D6OWdg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.10] Various fixes, mostly rkisp1
Message-ID: <339ccd6d-9296-084a-d4fb-53fc40f7fd42@xs4all.nl>
Date:   Thu, 24 Sep 2020 15:05:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfB/15FQtAllkjGHvuEJUKU1QEmIW6RXU+I5JsRAwy0eH2nn39A7SKN9ohIFewiY37EKgojnQvFMNLtSrdpk3eCO5pVaQWwIiCodFb2oJ04CI74V1CFWz
 1+6P8Xyt23lWpTPQK9ZMNgEWFX8+rpiOpIsovd8e8AcTpNifIbgn5AxDrqm03mvZdb+dYCrayJ0yV/tprnvMGyXbMWlVRZw8/Iv62/6gvoUjaREXTqGsEjGx
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 01cc2ec6ea044731e939e5e47f7e115b86f49465:

  media: atomisp: cleanup __printf() atributes on printk messages (2020-09-23 10:19:19 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.10e

for you to fetch changes up to 20d7aaedb30785a3e706493a9f65abd0cdbfae3f:

  MAINTAINERS: remove Maxime Jourdan as maintainer of Amlogic VDEC (2020-09-24 10:46:52 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dafna Hirschfeld (12):
      media: staging: rkisp1: params: upon stream stop, iterate a local list to return the buffers
      media: staging: rkisp1: params: in the isr, return if buffer list is empty
      media: staging: rkisp1: params: use the new effect value in cproc config
      media: staging: rkisp1: params: avoid using buffer if params is not streaming
      media: staging: rkisp1: params: set vb.sequence to be the isp's frame_sequence + 1
      media: staging: rkisp1: remove atomic operations for frame sequence
      media: staging: rkisp1: isp: add a warning and debugfs var for irq delay
      media: staging: rkisp1: isp: don't enable signal RKISP1_CIF_ISP_FRAME_IN
      media: staging: rkisp1: stats: protect write to 'is_streaming' in start_streaming cb
      media: staging: rkisp1: params: no need to lock default config
      media: staging: rkisp1: use the right variants of spin_lock
      media: staging: rkisp1: cap: protect access to buf with the spin lock

Julia Lawall (1):
      saa7146: drop double zeroing

Luca Ceresoli (4):
      media: docs: v4l2-subdev: fix typo
      media: docs: v4l2-subdev: fix typo
      media: docs: v4l2-subdev: move "Subdev registration" to a subsection
      media: docs: v4l2-subdev: move calling ops to a subsection

Neil Armstrong (1):
      MAINTAINERS: remove Maxime Jourdan as maintainer of Amlogic VDEC

Niklas Söderlund (2):
      rcar-csi2: Extend RAW8 support to all RGB layouts
      rcar-vin: Extend RAW8 support to all RGB layouts

Pavel Machek (1):
      media: firewire: fix memory leak

 Documentation/driver-api/media/v4l2-subdev.rst |  95 ++++++++++++++++++++++--------------------
 MAINTAINERS                                    |   1 -
 drivers/media/common/saa7146/saa7146_core.c    |   2 +-
 drivers/media/firewire/firedtv-fw.c            |   6 ++-
 drivers/media/platform/rcar-vin/rcar-csi2.c    |   3 ++
 drivers/media/platform/rcar-vin/rcar-dma.c     |  28 ++++++++++++-
 drivers/media/platform/rcar-vin/rcar-v4l2.c    |  27 ++++++++++++
 drivers/staging/media/rkisp1/TODO              |   1 -
 drivers/staging/media/rkisp1/rkisp1-capture.c  |  19 ++++-----
 drivers/staging/media/rkisp1/rkisp1-common.h   |   7 +---
 drivers/staging/media/rkisp1/rkisp1-dev.c      |   2 +
 drivers/staging/media/rkisp1/rkisp1-isp.c      |  22 +++++-----
 drivers/staging/media/rkisp1/rkisp1-params.c   | 118 +++++++++++++++++++++++------------------------------
 drivers/staging/media/rkisp1/rkisp1-stats.c    |   5 ++-
 14 files changed, 189 insertions(+), 147 deletions(-)
