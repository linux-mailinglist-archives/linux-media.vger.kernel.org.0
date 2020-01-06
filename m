Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1AF131305
	for <lists+linux-media@lfdr.de>; Mon,  6 Jan 2020 14:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbgAFNgs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jan 2020 08:36:48 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:57267 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726292AbgAFNgs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Jan 2020 08:36:48 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud8.xs4all.net with ESMTPA
        id oSYkivvP2FqKBoSYniLcLd; Mon, 06 Jan 2020 14:36:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578317805; bh=i5A7axpa643SYAAR/S4TRQjpMB3ID83PmnTHnMY6hgQ=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hys/RXOLmCfBT6UvKFrQZZIz8Ox18qzsZM0wTGLiSBMcM95rwDQT0qj0QFGa/oOSY
         zD7FEHCzr4P6EZOqyC68L6MFSufo18yId47XaZKqV3Em9bavuvfXLbGXLZV12NkSD4
         JPwc94bp7szvDszAGxlKWp7uvbkT4tJSsfWxqNDxqut0CCWV71xzwojlL0vTwjWwWk
         aRaOiQg/BJ0J7/taXw68cWw45BC736YZ9c0S17MQ8cojsxJgwXTjXuW01ERfbyiqJg
         CIiXIqD/9QtD8lrz1aaWhF4Oj6qyVSO9h9PSlPbsi61yvHjTuvtH6YHKc9c8D+5Kd0
         rxrGDsb+diUYg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Daniel Gomez <daniel@qtec.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.6] Various fixes
Message-ID: <2337b954-6d92-319f-91d9-caa66713571e@xs4all.nl>
Date:   Mon, 6 Jan 2020 14:36:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEwCEUMUFJxeqaNt6ix2CdNw+WT5AbU+xWmQfkxdC4kZwq528OmSAm3a1mSSZY8IWEpl23sFOKbnQ4cU7g/mi9iW3ORqj08CmopLxSYdPnDLjA7XUaTb
 yFaR1T7nESIVs25AsAVZ1sTB1d08Q9Clj7+WtzgxhLgoiJG1HFJCSZ1seg1Sl5XblNYEQSR8sExuNOzxlpfBO5YukldfmVC6Z8doBgcj1cHkeNg1+xipriGy
 crKKN+y4z4UOpzbpmu++mg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 51e40a0dbe53cebe1f4b85bb47e250dc5a89b254:

  media: sun4i-csi: Add support for A10 CSI1 camera sensor interface (2020-01-04 08:21:35 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.6h

for you to fetch changes up to ab568ba9fc3fd0b262e925fefa199320584a7d98:

  cec: remove unused functions (2020-01-06 14:06:05 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Aditya Pakki (2):
      media: cx231xx: replace BUG_ON with recovery code
      media: saa7146: Avoid using BUG_ON as an assertion

Daniel Gomez (1):
      media: v4l2: Fix fourcc names for 12b and 14b packed bayer

Dmitry Osipenko (3):
      media: staging: tegra-vde: Select IOVA unconditionally in Kconfig
      media: staging: tegra-vde: Sort headers alphabetically
      media: staging: tegra-vde: Use __maybe_unused attribute instead of ifdef

Hans Verkuil (2):
      Revert "media: v4l2: Fix fourcc names for BAYER12P"
      cec: remove unused functions

Helen Koike (1):
      media: v4l2-rect.h: fix v4l2_rect_map_inside() top/left adjustments

Jia-Ju Bai (1):
      media: sti: bdisp: fix a possible sleep-in-atomic-context bug in bdisp_device_run()

Ma Feng (1):
      media: pvrusb2: Remove unneeded semicolon and add newline

Wolfram Sang (5):
      media: pci: cx23885: convert to i2c_new_scanned_device
      media: pci: cx88: convert to i2c_new_scanned_device
      media: pci: bt8xx: convert to i2c_new_scanned_device
      media: pci: cx18: convert to i2c_new_scanned_device
      media: pci: ivtv: convert to i2c_new_scanned_device

 Documentation/media/uapi/v4l/pixfmt-srggb12p.rst |  2 +-
 Documentation/media/uapi/v4l/pixfmt-srggb14p.rst |  2 +-
 drivers/media/cec/cec-core.c                     | 21 +--------------------
 drivers/media/cec/cec-notifier.c                 | 37 ++-----------------------------------
 drivers/media/cec/cec-priv.h                     |  2 +-
 drivers/media/common/saa7146/saa7146_video.c     |  6 ++++--
 drivers/media/pci/bt8xx/bttv-input.c             |  6 +++---
 drivers/media/pci/cx18/cx18-i2c.c                |  2 +-
 drivers/media/pci/cx23885/cx23885-i2c.c          |  4 ++--
 drivers/media/pci/cx88/cx88-input.c              |  2 +-
 drivers/media/pci/ivtv/ivtv-i2c.c                |  6 +++---
 drivers/media/pci/ivtv/ivtv-i2c.h                |  2 +-
 drivers/media/platform/sti/bdisp/bdisp-hw.c      |  6 +++---
 drivers/media/usb/cx231xx/cx231xx-i2c.c          |  3 ++-
 drivers/media/usb/pvrusb2/pvrusb2-encoder.c      |  4 ++--
 drivers/staging/media/tegra-vde/Kconfig          |  2 +-
 drivers/staging/media/tegra-vde/vde.c            |  6 ++----
 drivers/staging/media/tegra-vde/vde.h            |  2 +-
 include/media/cec-notifier.h                     | 27 ---------------------------
 include/media/cec.h                              | 46 ----------------------------------------------
 include/media/v4l2-rect.h                        |  8 ++++----
 21 files changed, 36 insertions(+), 160 deletions(-)
