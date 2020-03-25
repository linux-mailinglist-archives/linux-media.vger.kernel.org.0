Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE16192499
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 10:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbgCYJtm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 05:49:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:51218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726262AbgCYJtl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 05:49:41 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C00CB20772;
        Wed, 25 Mar 2020 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585129779;
        bh=0L5/4akZXY5LB40xEc7qz+oawtF19ej6cb8LiS4g06o=;
        h=From:To:Cc:Subject:Date:From;
        b=Z8+ydmM3Uj++QHneD6jE0urK4/fCRO+2PRJWn45UE9ukWOBTGU+ogZOyVMIjVFlkB
         GqqYadaK73+h1XDQIBh4aCCpVmLJD5FSXlPII7pWiqmb2SVGC8BKipEXkJQ5Vxw3DA
         ka2Ubac9hjxaxtLfWxRC+6BDlB9I/tHYqFPKbTbA=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jH2fJ-003HT2-VA; Wed, 25 Mar 2020 10:49:37 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mike Isely <isely@pobox.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        linux1394-devel@lists.sourceforge.net,
        Andy Walls <awalls@md.metrocast.net>,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 00/22] Reorganize media Kconfig
Date:   Wed, 25 Mar 2020 10:49:14 +0100
Message-Id: <cover.1585129041.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series do lots of reorg at the media Kconfig options.
It also move test drivers from platform dir to a new one.

After this change, the main config is organized on menus, allowing to
select:

	- type of devices selection - the filtering options
	- Media core options - with API and other core stuff
	- Media core extra options
	- Media drivers
	- Media ancillary drivers

The "type of devices" menu has the filtering options for:

	- Cameras and video grabbers
	- Analog TV
	- Digital TV
	- AM/FM radio receivers/transmitters
	- SDR
	- CEC
	- Embeded devices (SoC)
	- Test drivers

This way, one interested only on embedded devices can unselect
everything but "Embedded devices (SoC)" option.

Distros for PC/Laptops can enable everything but 
"Embedded devices (SoC)" and "Test drivers".

Users can select just what they want, without bothering with
hundreds of options that he won't have any clue about their
meanings.

-

v3: 

  - as suggested by Ezequiel, fix dependencies for M2M and use
    MEDIA_PLATFORM_SUPPORT to cover all platform drivers;
  - Fix a longstanding issue related to hybrid devices filtering:
    for those, both DVB and V4L cores are needed.

    (well, in fact, it could be fine-grained, but that may require
     some changes inside some drivers, so let's postpone such
     changes for some future patch series)

Mauro Carvalho Chehab (22):
  media: dvb-usb: auto-select CYPRESS_FIRMWARE
  media: Kconfig: add an option to filter in/out platform drivers
  media: Kconfig: not all V4L2 platform drivers are for camera
  media: pci: move VIDEO_PCI_SKELETON to a different Kconfig
  media: reorganize the drivers menu options
  media: Kconfig: update the MEDIA_SUPPORT help message
  media: Kconfig: use a sub-menu to select supported devices
  media: split test drivers from platform directory
  media: Kconfig: make filtering devices optional
  media: Kconfig: move CEC-specific options to cec/Kconfig
  media: Kconfig: move comment to siano include
  media: Kconfig: move DVB-specific options to dvb-core/Kconfig
  media: Kconfig: move V4L2 subdev API to v4l2-core/Kconfig
  media: Kconfig: move drivers-specific TTPCI_EEPROM Kconfig var
  media: Kconfig: move media controller core select to main Kconfig
  media: Kconfig: better organize menu items
  media: Kconfig: mode firewire comment to firewire/Kconfig
  media: Kconfig: place all options under a sub-menu
  media: Kconfig: move the position of sub-driver autoselection
  media: Kconfig: on !EMBEDDED && !EXPERT, enable driver filtering
  media: Kconfig: simplify some dependencies
  media: Kconfig: better support hybrid TV devices

 drivers/media/Kconfig                         | 239 +++++++++---------
 drivers/media/cec/Kconfig                     |  10 +
 drivers/media/common/Kconfig                  |   2 +-
 drivers/media/dvb-core/Kconfig                |  26 ++
 drivers/media/firewire/Kconfig                |   5 +-
 drivers/media/mc/Kconfig                      |   9 -
 drivers/media/mmc/Kconfig                     |   1 -
 drivers/media/mmc/siano/Kconfig               |   2 +
 drivers/media/pci/Kconfig                     |  21 +-
 drivers/media/pci/bt8xx/Kconfig               |   5 +-
 drivers/media/pci/cx18/Kconfig                |   2 +-
 drivers/media/pci/cx23885/Kconfig             |   4 +-
 drivers/media/pci/cx88/Kconfig                |   4 +-
 drivers/media/pci/saa7134/Kconfig             |   4 +-
 drivers/media/pci/saa7164/Kconfig             |   2 +-
 drivers/media/platform/Kconfig                |  26 --
 drivers/media/platform/Makefile               |   5 -
 drivers/media/test_drivers/Kconfig            |  28 ++
 drivers/media/test_drivers/Makefile           |   9 +
 .../vicodec/Kconfig                           |   0
 .../vicodec/Makefile                          |   0
 .../vicodec/codec-fwht.c                      |   0
 .../vicodec/codec-fwht.h                      |   0
 .../vicodec/codec-v4l2-fwht.c                 |   0
 .../vicodec/codec-v4l2-fwht.h                 |   0
 .../vicodec/vicodec-core.c                    |   0
 .../media/{platform => test_drivers}/vim2m.c  |   0
 .../{platform => test_drivers}/vimc/Kconfig   |   0
 .../{platform => test_drivers}/vimc/Makefile  |   0
 .../vimc/vimc-capture.c                       |   0
 .../vimc/vimc-common.c                        |   0
 .../vimc/vimc-common.h                        |   0
 .../vimc/vimc-core.c                          |   0
 .../vimc/vimc-debayer.c                       |   0
 .../vimc/vimc-scaler.c                        |   0
 .../vimc/vimc-sensor.c                        |   0
 .../vimc/vimc-streamer.c                      |   0
 .../vimc/vimc-streamer.h                      |   0
 .../{platform => test_drivers}/vivid/Kconfig  |   0
 .../{platform => test_drivers}/vivid/Makefile |   0
 .../vivid/vivid-cec.c                         |   0
 .../vivid/vivid-cec.h                         |   0
 .../vivid/vivid-core.c                        |   0
 .../vivid/vivid-core.h                        |   0
 .../vivid/vivid-ctrls.c                       |   0
 .../vivid/vivid-ctrls.h                       |   0
 .../vivid/vivid-kthread-cap.c                 |   0
 .../vivid/vivid-kthread-cap.h                 |   0
 .../vivid/vivid-kthread-out.c                 |   0
 .../vivid/vivid-kthread-out.h                 |   0
 .../vivid/vivid-kthread-touch.c               |   0
 .../vivid/vivid-kthread-touch.h               |   0
 .../vivid/vivid-meta-cap.c                    |   0
 .../vivid/vivid-meta-cap.h                    |   0
 .../vivid/vivid-meta-out.c                    |   0
 .../vivid/vivid-meta-out.h                    |   0
 .../vivid/vivid-osd.c                         |   0
 .../vivid/vivid-osd.h                         |   0
 .../vivid/vivid-radio-common.c                |   0
 .../vivid/vivid-radio-common.h                |   0
 .../vivid/vivid-radio-rx.c                    |   0
 .../vivid/vivid-radio-rx.h                    |   0
 .../vivid/vivid-radio-tx.c                    |   0
 .../vivid/vivid-radio-tx.h                    |   0
 .../vivid/vivid-rds-gen.c                     |   0
 .../vivid/vivid-rds-gen.h                     |   0
 .../vivid/vivid-sdr-cap.c                     |   0
 .../vivid/vivid-sdr-cap.h                     |   0
 .../vivid/vivid-touch-cap.c                   |   0
 .../vivid/vivid-touch-cap.h                   |   0
 .../vivid/vivid-vbi-cap.c                     |   0
 .../vivid/vivid-vbi-cap.h                     |   0
 .../vivid/vivid-vbi-gen.c                     |   0
 .../vivid/vivid-vbi-gen.h                     |   0
 .../vivid/vivid-vbi-out.c                     |   0
 .../vivid/vivid-vbi-out.h                     |   0
 .../vivid/vivid-vid-cap.c                     |   0
 .../vivid/vivid-vid-cap.h                     |   0
 .../vivid/vivid-vid-common.c                  |   0
 .../vivid/vivid-vid-common.h                  |   0
 .../vivid/vivid-vid-out.c                     |   0
 .../vivid/vivid-vid-out.h                     |   0
 drivers/media/usb/Kconfig                     |  14 +-
 drivers/media/usb/au0828/Kconfig              |   6 +-
 drivers/media/usb/cx231xx/Kconfig             |   4 +-
 drivers/media/usb/dvb-usb/Kconfig             |   1 +
 drivers/media/usb/pvrusb2/Kconfig             |   4 +-
 drivers/media/usb/tm6000/Kconfig              |   4 +-
 drivers/media/v4l2-core/Kconfig               |  19 +-
 89 files changed, 261 insertions(+), 195 deletions(-)
 create mode 100644 drivers/media/test_drivers/Kconfig
 create mode 100644 drivers/media/test_drivers/Makefile
 rename drivers/media/{platform => test_drivers}/vicodec/Kconfig (100%)
 rename drivers/media/{platform => test_drivers}/vicodec/Makefile (100%)
 rename drivers/media/{platform => test_drivers}/vicodec/codec-fwht.c (100%)
 rename drivers/media/{platform => test_drivers}/vicodec/codec-fwht.h (100%)
 rename drivers/media/{platform => test_drivers}/vicodec/codec-v4l2-fwht.c (100%)
 rename drivers/media/{platform => test_drivers}/vicodec/codec-v4l2-fwht.h (100%)
 rename drivers/media/{platform => test_drivers}/vicodec/vicodec-core.c (100%)
 rename drivers/media/{platform => test_drivers}/vim2m.c (100%)
 rename drivers/media/{platform => test_drivers}/vimc/Kconfig (100%)
 rename drivers/media/{platform => test_drivers}/vimc/Makefile (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-capture.c (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-common.c (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-common.h (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-core.c (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-debayer.c (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-scaler.c (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-sensor.c (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-streamer.c (100%)
 rename drivers/media/{platform => test_drivers}/vimc/vimc-streamer.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/Kconfig (100%)
 rename drivers/media/{platform => test_drivers}/vivid/Makefile (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-cec.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-cec.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-core.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-core.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-ctrls.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-ctrls.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-kthread-cap.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-kthread-cap.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-kthread-out.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-kthread-out.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-kthread-touch.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-kthread-touch.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-meta-cap.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-meta-cap.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-meta-out.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-meta-out.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-osd.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-osd.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-radio-common.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-radio-common.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-radio-rx.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-radio-rx.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-radio-tx.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-radio-tx.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-rds-gen.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-rds-gen.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-sdr-cap.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-sdr-cap.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-touch-cap.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-touch-cap.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vbi-cap.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vbi-cap.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vbi-gen.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vbi-gen.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vbi-out.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vbi-out.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vid-cap.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vid-cap.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vid-common.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vid-common.h (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vid-out.c (100%)
 rename drivers/media/{platform => test_drivers}/vivid/vivid-vid-out.h (100%)

-- 
2.25.1


