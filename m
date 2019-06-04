Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0B434541
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 13:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727373AbfFDLUF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 07:20:05 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:57489 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727180AbfFDLUF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 07:20:05 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Y7TyhSHLnsDWyY7U2hwRng; Tue, 04 Jun 2019 13:20:02 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 0/7] media: set device_caps in struct video_device
Date:   Tue,  4 Jun 2019 13:19:51 +0200
Message-Id: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHaWiNjrhZITwcUOG57KXwXrHmokhtTXksPETFCntQkuJWbjnleLo6IF3NggSrl6+1CJs3kOSIveUWBTOoaIFZJ38mKimMqAtI4P5Gxn4D3zEmfYJceQ
 O0xScIQV2ODrc4CUvYSMjt8CADibBEzd+HZnltxQynxVld81XNMGvZyae27Hr5JB18XgThJVQDJR0+mAjV1BTLD7QmC5q2VsjpVutZuYAL0t3kjyqGLuvflf
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of filling in the struct v4l2_capability device_caps
field, fill in the struct video_device device_caps field.

That way the V4L2 core knows what the capabilities of the
video device are.

But this only really works if all drivers use this, so this series
converts all except pci and platform drivers.

Those will be addressed in a second phase.

Regards,

	Hans

Hans Verkuil (7):
  media/radio: set device_caps in struct video_device
  media/usb: set device_caps in struct video_device
  rtl2832_sdr: set device_caps in struct video_device
  usb/gadget/f_uvc: set device_caps in struct video_device
  touchscreen/sur40: set device_caps in struct video_device
  vc04_services/bcm2835-camera: set device_caps in struct video_device
  staging/media: set device_caps in struct video_device

 drivers/input/touchscreen/sur40.c             |  6 ++--
 drivers/media/dvb-frontends/rtl2832_sdr.c     |  5 ++-
 drivers/media/radio/dsbr100.c                 |  3 +-
 drivers/media/radio/radio-cadet.c             |  5 ++-
 drivers/media/radio/radio-isa.c               |  4 +--
 drivers/media/radio/radio-keene.c             |  3 +-
 drivers/media/radio/radio-ma901.c             |  3 +-
 drivers/media/radio/radio-miropcm20.c         |  4 +--
 drivers/media/radio/radio-mr800.c             |  5 ++-
 drivers/media/radio/radio-raremono.c          |  3 +-
 drivers/media/radio/radio-sf16fmi.c           |  3 +-
 drivers/media/radio/radio-si476x.c            | 21 +++++-------
 drivers/media/radio/radio-tea5764.c           |  3 +-
 drivers/media/radio/radio-tea5777.c           |  5 ++-
 drivers/media/radio/radio-timb.c              |  3 +-
 drivers/media/radio/radio-wl1273.c            | 12 +++----
 drivers/media/radio/si470x/radio-si470x-i2c.c |  7 ++--
 drivers/media/radio/si470x/radio-si470x-usb.c |  6 ++--
 .../radio/si4713/radio-platform-si4713.c      |  4 +--
 drivers/media/radio/si4713/radio-usb-si4713.c |  4 +--
 drivers/media/radio/tea575x.c                 |  7 ++--
 drivers/media/radio/wl128x/fmdrv_v4l2.c       | 10 ++----
 drivers/media/usb/airspy/airspy.c             |  6 ++--
 drivers/media/usb/au0828/au0828-video.c       | 21 ++++++------
 drivers/media/usb/cpia2/cpia2_v4l.c           |  9 ++----
 drivers/media/usb/cx231xx/cx231xx-video.c     | 28 ++++++++--------
 drivers/media/usb/em28xx/em28xx-video.c       | 32 +++++++++----------
 drivers/media/usb/go7007/go7007-v4l2.c        | 15 ++++-----
 drivers/media/usb/gspca/gspca.c               |  6 ++--
 drivers/media/usb/hackrf/hackrf.c             | 14 ++++----
 drivers/media/usb/hdpvr/hdpvr-video.c         |  5 ++-
 drivers/media/usb/msi2500/msi2500.c           |  5 ++-
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c      | 17 ++++------
 drivers/media/usb/pwc/pwc-if.c                |  2 ++
 drivers/media/usb/pwc/pwc-v4l.c               |  3 --
 drivers/media/usb/s2255/s2255drv.c            |  5 ++-
 drivers/media/usb/stk1160/stk1160-v4l.c       |  7 ++--
 drivers/media/usb/stkwebcam/stk-webcam.c      |  6 ++--
 drivers/media/usb/tm6000/tm6000-video.c       | 20 ++++++------
 drivers/media/usb/usbtv/usbtv-video.c         |  5 ++-
 drivers/media/usb/usbvision/usbvision-video.c | 20 ++++++------
 drivers/media/usb/zr364xx/zr364xx.c           |  7 ++--
 drivers/staging/media/bcm2048/radio-bcm2048.c |  7 ++--
 .../staging/media/davinci_vpfe/vpfe_video.c   |  9 +++---
 drivers/staging/media/omap4iss/iss_video.c    | 11 +++----
 .../bcm2835-camera/bcm2835-camera.c           |  6 ++--
 drivers/usb/gadget/function/f_uvc.c           |  1 +
 drivers/usb/gadget/function/uvc_v4l2.c        |  4 ---
 48 files changed, 161 insertions(+), 236 deletions(-)

-- 
2.20.1

