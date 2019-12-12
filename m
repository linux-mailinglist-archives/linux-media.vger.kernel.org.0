Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D191C11CCEF
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 13:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbfLLMUF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 07:20:05 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:32881 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729156AbfLLMUF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 07:20:05 -0500
Received: from [IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65]
 ([IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fNRpiZOhkGyJwfNRqiy5Ki; Thu, 12 Dec 2019 13:20:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576153203; bh=K7J33kGuCFR3WReObJKwX6HXTCKXPC9yjsmOUuX8OYE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cPvc2VNIQEiI2+9xnjUDgCxQ8HTPoyAWMC1STKD0mZa7vfLoJkDDbyO4CMhB1sTAu
         FuUo8OPgNszhU9YbPgRffjZXtLQ9Ys2Nn3MnMRgu/tJme08NcfGTubbOyYo6mlpY+c
         qGm2QuRW3dFbgyeBIAbivyAJ4rUaBBM1932scsIIMHhWZJtFGD9lIWIWdiDDZZpeW2
         F/E1g3eWE4ge+EcuTp5aVS98mJ8ucq/A4wYvFMoxRrc9OKV377FlRnrldZK5v5Z7qd
         W0ikvZmkLRrKdgJNh7Ii1kKIlm1j8A7QBL91uUkY6HeYOF7AjW2wRzDTCIkfak7d2I
         AyfOZnuMGvRwg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Vandana BN <bnvandana@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.6] Various fixes/enhancements
Message-ID: <4c524bd4-e8bb-89b5-3898-a969a72266ad@xs4all.nl>
Date:   Thu, 12 Dec 2019 13:20:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJtrwezrt90AZ05ClcWT3K8XKnw4A+3V08LPBLPosTNoB8GEZC7JE2mHko3HiUOYUGrsdNBzDMsEdrueIMati16J9ne8Hwp/Zhl8du3ZjNTt9TAoC7Lt
 /M7/mnlC9pfGc20liXrEI4lRKnbGewVyp/SNNOtfmmOqV5ZWyqXYP/kTI9TgLh46djnziNkPuqa9bFp6PjRdaF8gSnVWWTY9nPaVc/dgIQAlubAOFrww4z6d
 4ByE5LV53/m0GpSgQS73uGuzaRIbwj6EHydsatt5ganV6507j4TDPkqE8tG3obnzx6hpYFcr/fVABs/uKTA14A==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 2099ef02c6c024751e4d16ace67dd6b910c875e4:

  media: dt-bindings: media: cal: convert binding to yaml (2019-12-09 11:43:47 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.6b

for you to fetch changes up to f1fbd760c608320341c69d04973a8932794a801e:

  media: go7007: fix a miss of snd_card_free (2019-12-12 12:48:08 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benoit Parrot (1):
      media: ti-vpe: csc: fix single vs multiplanar format handling

Chuhong Yuan (5):
      media: bdisp: add missed destroy_workqueue in remove and probe failure
      media: platform: mtk-mdp: add missed destroy_workqueue in remove
      media: usb: go7007: s2250-board: add missed i2c_unregister_device
      media: pxa_camera: add missed tasklet_kill
      media: go7007: fix a miss of snd_card_free

Colin Ian King (1):
      media: meson: add missing allocation failure check on new_buf

Daniel Gomez (1):
      media: v4l2: Fix fourcc names for BAYER12P

Forest Crossman (1):
      media: cx23885: Add support for AVerMedia CE310B

Gustavo A. R. Silva (1):
      media: i2c: adv748x: Fix unsafe macros

Hans Verkuil (5):
      gspca: zero usb_buf
      dvb-usb/dvb-usb-urb.c: initialize actlen to 0
      vidioc-g-dv-timings.rst: fix wrong porch
      ivtv/cx18: remove ivtvdriver.org references
      cec-ioc-g-mode.rst: remove trailing 'i'

Vandana BN (1):
      vivid: Add touch support

Wolfram Sang (1):
      media: v4l2-subdev: remove wrong @cond from kdocs

 Documentation/media/uapi/cec/cec-ioc-g-mode.rst      |   2 +-
 Documentation/media/uapi/v4l/pixfmt-reserved.rst     |   3 +-
 Documentation/media/uapi/v4l/pixfmt-srggb12p.rst     |   2 +-
 Documentation/media/uapi/v4l/vidioc-g-dv-timings.rst |   2 +-
 Documentation/media/v4l-drivers/cx18.rst             |  39 ------
 Documentation/media/v4l-drivers/index.rst            |   1 -
 MAINTAINERS                                          |   6 +-
 drivers/media/i2c/adv748x/adv748x.h                  |   8 +-
 drivers/media/pci/cx18/cx18-cards.c                  |   8 +-
 drivers/media/pci/cx18/cx18-driver.c                 |   2 +-
 drivers/media/pci/cx23885/cx23885-cards.c            |  24 ++++
 drivers/media/pci/cx23885/cx23885-video.c            |   3 +-
 drivers/media/pci/cx23885/cx23885.h                  |   1 +
 drivers/media/pci/ivtv/Kconfig                       |   5 +-
 drivers/media/pci/ivtv/ivtv-driver.c                 |   3 +-
 drivers/media/pci/ivtv/ivtv-driver.h                 |   1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c        |   3 +
 drivers/media/platform/pxa_camera.c                  |   2 +
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c        |  13 +-
 drivers/media/platform/ti-vpe/csc.c                  |  32 ++---
 drivers/media/platform/vivid/Makefile                |   3 +-
 drivers/media/platform/vivid/vivid-core.c            | 164 +++++++++++++++++++++++--
 drivers/media/platform/vivid/vivid-core.h            |  20 ++++
 drivers/media/platform/vivid/vivid-ctrls.c           |  11 ++
 drivers/media/platform/vivid/vivid-kthread-touch.c   | 181 ++++++++++++++++++++++++++++
 drivers/media/platform/vivid/vivid-kthread-touch.h   |  13 ++
 drivers/media/platform/vivid/vivid-touch-cap.c       | 322 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/vivid/vivid-touch-cap.h       |  38 ++++++
 drivers/media/usb/dvb-usb/dvb-usb-urb.c              |   2 +-
 drivers/media/usb/go7007/s2250-board.c               |   1 +
 drivers/media/usb/go7007/snd-go7007.c                |  35 +++---
 drivers/media/usb/gspca/gspca.c                      |   2 +-
 drivers/staging/media/meson/vdec/vdec.c              |   2 +
 include/media/v4l2-subdev.h                          |   2 +-
 34 files changed, 832 insertions(+), 124 deletions(-)
 delete mode 100644 Documentation/media/v4l-drivers/cx18.rst
 create mode 100644 drivers/media/platform/vivid/vivid-kthread-touch.c
 create mode 100644 drivers/media/platform/vivid/vivid-kthread-touch.h
 create mode 100644 drivers/media/platform/vivid/vivid-touch-cap.c
 create mode 100644 drivers/media/platform/vivid/vivid-touch-cap.h
