Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 635E449AF3
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 09:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfFRHns (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 03:43:48 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:48493 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725913AbfFRHns (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 03:43:48 -0400
Received: from [IPv6:2001:983:e9a7:1:9450:c90a:3140:14fc] ([IPv6:2001:983:e9a7:1:9450:c90a:3140:14fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id d8mPhzmcj5qKad8mQhZHVU; Tue, 18 Jun 2019 09:43:47 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Johan Korsnes <johan.korsnes@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v5.3] vivid: add HDMI (dis)connect emulation
Message-ID: <67e77eec-0692-3358-7906-01ff01735ad8@xs4all.nl>
Date:   Tue, 18 Jun 2019 09:43:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHXi+3E706GYBQG7vRVZeYU4qQSmjUZfwamh+f9VOziGXOmhqHgfpNeAGOYxhmkBrZG3ZNKJLS0vOd8LwmKnvUIwUES9KXSvnBQqRYetcAxGaw6DDNm+
 5P5XCJCc7KKxO3KCGbgMC122Y8PEb/ljAFgAifl2LuCLoDrC5S22XDJV5jQldfZ2uQxgGR00emqmo7hdo4CamqbMyjDwF4ljUFtkRqGGe21qzmLgDlU6gmIG
 kUuu5S705HYP5NcWc/2wyo4DWT61825EJJRNaQbCK2+RWTIj2gInJb/FQWfpqdvuz1ugy0ID+lTt3Y/coSiBfw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Many thanks to my colleague Johan Korsnes for working on this: after this
series is applied v4l2-compliance passes vivid without any warnings.

This series also prepares for the next step where vivid allows the user to
explicitly connect an input with an output. That would allow us to emulate
a dis/reconnect completely accurately.

Regards,

	Hans

The following changes since commit 513dbd35b5d93c45fa7291147f21fc0227a9f999:

  media: add SPDX headers to some files (2019-06-12 11:42:27 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-vivid

for you to fetch changes up to 32a48df7cac22577173fdedddb642bc2d827c8b5:

  media: vivid.rst: describe display present control (2019-06-18 09:33:38 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Johan Korsnes (9):
      media: vivid: make input dv_timings per-input
      media: vivid: make input std_signal per-input
      media: vivid: add display present control
      media: vivid: add number of HDMI ports to device state
      media: vivid: add HDMI (dis)connect TX emulation
      media: vivid: add HDMI (dis)connect RX emulation
      media: vivid: reorder CEC allocation and control set-up
      media: vivid: add CEC support to display present ctrl
      media: vivid.rst: describe display present control

 Documentation/media/v4l-drivers/vivid.rst        |   5 +++
 drivers/media/platform/vivid/vivid-core.c        | 120 ++++++++++++++++++++++++++++++++++++++-----------------------
 drivers/media/platform/vivid/vivid-core.h        |  32 +++++++++++------
 drivers/media/platform/vivid/vivid-ctrls.c       | 108 ++++++++++++++++++++++++++++++++++++++++++++++++-------
 drivers/media/platform/vivid/vivid-kthread-cap.c |   8 ++---
 drivers/media/platform/vivid/vivid-vbi-cap.c     |  16 ++++-----
 drivers/media/platform/vivid/vivid-vid-cap.c     | 135 ++++++++++++++++++++++++++++++++++++++++++++++-----------------------
 drivers/media/platform/vivid/vivid-vid-common.c  |   8 +++--
 drivers/media/platform/vivid/vivid-vid-out.c     |   6 ++++
 9 files changed, 312 insertions(+), 126 deletions(-)
