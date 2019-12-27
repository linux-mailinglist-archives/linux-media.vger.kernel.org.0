Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0841C12BAD3
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2019 21:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfL0UBj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Dec 2019 15:01:39 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46532 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbfL0UBj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Dec 2019 15:01:39 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 18B52283C43
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-rockchip@lists.infradead.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        gregkh@linuxfoundation.org, andrey.konovalov@linaro.org,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        robh+dt@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        joacim.zetterling@gmail.com, kernel@collabora.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        jacob-chen@iotwrt.com, linux-arm-kernel@lists.infradead.org,
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v12 00/11] Rockchip ISP Driver
Date:   Fri, 27 Dec 2019 17:01:05 -0300
Message-Id: <20191227200116.2612137-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

This patchset adds support for the Image signal processor unit version 1.0 of
the Rockchip RK3399 SoC in the staging tree.
There are still some missing things to move it from staging (please, see
TODO file), but the driver is already being used by several people
(libcamera, for instance, already supports an older version of the driver)
and adding in staging make the work flow easier for collaboration within
the community.
I plan to be actively working on the driver to move it out of staging asap.

It is also available at
https://gitlab.collabora.com/koike/linux/tree/rockchip/isp/v12

NOTE: This series only touches MAINTAINERS file and drivers/staging/

Major changes in V12
--------------------
* Cleanups
For this version of the patchset, several cleanups were made, including renaming
functions, variables, structs, enum and files to have the "rkisp1" prefix.
Some print and comments were re-written, and several of them that were unecessary
were removed.
regs.c and all the headers besides rkisp1-common.h were removed.
Several unecessary functions were removed, parts of the code were re-written to
be readable, reduce indentation, and remove redundant code.
More helper functions from the media core is being used.
Header files were removed, except for rkisp1-common.h and rkisp1-regs.h,
there are not that much shared code, keep then in a single place instead
of spreading it through several header files, it is easier to navigate.
More cleanups are still possible, but at least now we have a more organized and
standardized code, which makes it easier to read and to maintain.

* An entry in Debugfs was added to keep track of errors and data loss.

* A new subdevice entity for the resizer was added.
Previously, resizer was being implemented in the capture devices, but since
capture devices don't have pad operations, the code was accepting unmatching
links between ISP and the capture.
Separating the resizer to it's own entity removed several hacks from the
capture, besides simplifying the code, making it easier to read.
Cropping was also moved out from the capture to the resizer subdevices.
This also changes userspace API (as the topology changed), but now resizing is
more explicitly represented instead of hided in the capture.

* Format propagation between pads was fixed.

* Ascii art block diagram to remove the http link reference.

* More items in the TODO file, including reviewing the locks.

* Fix Jacob Chen's email address, keep the original jacob2.chen@rock-chips.com
email.

* yaml Device Tree bindings: the txt bindings docs got replaced, so it
can be verified with make dt_bindings_check and make dtbs_check

NOTE: the changes were focused on the main loop sensor->isp->capture, I almost
didn't touch params and stats, mostly because I didn't setup a testing framework
yet for those, so they have lots of space for improvements.

Commands output:
----------------
media-ctl -p : http://ix.io/25DG
media-ctl --print-dot: http://col.la/rkisp1v12dot
v4l2-compliance -m0: http://ix.io/25DI
NOTE: there is a failure in v4l2-compliance, but comes from the sensor, not from the ISP.

Testing:
--------
SEN_DEV=/dev/v4l-subdev3
ISP_DEV=/dev/v4l-subdev0
RSZ_SP_DEV=/dev/v4l-subdev2
RSZ_MP_DEV=/dev/v4l-subdev1
CAP_SP_DEV=/dev/video1
CAP_MP_DEV=/dev/video0

WIDTH=1280
HEIGHT=960

v4l2-ctl --set-subdev-fmt pad=0,width=$WIDTH,height=$HEIGHT,code=0x3001 -d $SEN_DEV

v4l2-ctl --set-subdev-fmt pad=0,width=$WIDTH,height=$HEIGHT,code=0x3001 -d $ISP_DEV
v4l2-ctl --set-subdev-selection pad=0,target=crop,top=0,left=0,width=$WIDTH,height=$HEIGHT -d $ISP_DEV

v4l2-ctl --set-subdev-selection pad=2,target=crop,top=0,left=0,width=$WIDTH,height=$HEIGHT -d $ISP_DEV
v4l2-ctl --set-subdev-fmt pad=2,width=$WIDTH,height=$HEIGHT,code=0x2008 -d $ISP_DEV

v4l2-ctl --set-subdev-fmt pad=0,width=$WIDTH,height=$HEIGHT,code=0x2008 -d $RSZ_SP_DEV
v4l2-ctl --set-subdev-fmt pad=1,width=$WIDTH,height=$HEIGHT,code=0x2008 -d $RSZ_SP_DEV

v4l2-ctl --set-subdev-selection pad=0,target=crop,top=0,left=0,width=$WIDTH,height=$HEIGHT -d $RSZ_SP_DEV

v4l2-ctl --set-subdev-fmt pad=0,width=$WIDTH,height=$HEIGHT,code=0x2008 -d $RSZ_MP_DEV
v4l2-ctl --set-subdev-fmt pad=1,width=$WIDTH,height=$HEIGHT,code=0x2008 -d $RSZ_MP_DEV

v4l2-ctl --set-subdev-selection pad=0,target=crop,top=0,left=0,width=$WIDTH,height=$HEIGHT -d $RSZ_MP_DEV

v4l2-ctl -v width=$WIDTH,height=$HEIGHT,pixelformat=NV12 -d $CAP_SP_DEV
v4l2-ctl -v width=$WIDTH,height=$HEIGHT,pixelformat=NV12 -d $CAP_MP_DEV

v4l2-ctl --stream-mmap --stream-count=100 -d $CAP_SP_DEV --stream-to=/tmp/test_sp.raw
v4l2-ctl --stream-mmap --stream-count=100 -d $CAP_MP_DEV --stream-to=/tmp/test_mp.raw

ffplay -loglevel warning -v info -f rawvideo -pixel_format nv12 -video_size "1280x960" tmp/test_sp.raw
ffplay -loglevel warning -v info -f rawvideo -pixel_format nv12 -video_size "1280x960" tmp/test_mp.raw

Thanks
Helen

Ezequiel Garcia (1):
  media: staging: phy-rockchip-dphy: add Rockchip MIPI Synopsys DPHY
    driver

Helen Koike (6):
  media: staging: rkisp1: add Rockchip ISP1 base driver
  media: staging: rkisp1: add streaming paths
  media: staging: dt-bindings: add Rockchip ISP1 yaml bindings
  media: staging: dt-bindings: add Rockchip MIPI RX D-PHY yaml bindings
  media: staging: rkisp1: add TODO file for staging
  MAINTAINERS: add entry for Rockchip ISP1 driver

Jacob Chen (3):
  media: staging: rkisp1: add capture device for statistics
  media: staging: rkisp1: add output device for parameters
  media: staging: rkisp1: add document for rkisp1 meta buffer format

Jeffy Chen (1):
  media: staging: rkisp1: add user space ABI definitions

 MAINTAINERS                                   |    6 +
 drivers/staging/media/Kconfig                 |    4 +
 drivers/staging/media/Makefile                |    2 +
 .../bindings/phy/rockchip-mipi-dphy.yaml      |   75 +
 .../staging/media/phy-rockchip-dphy/Kconfig   |   11 +
 .../staging/media/phy-rockchip-dphy/Makefile  |    2 +
 drivers/staging/media/phy-rockchip-dphy/TODO  |    6 +
 .../phy-rockchip-dphy/phy-rockchip-dphy.c     |  396 ++++
 .../bindings/media/rockchip-isp1.yaml         |  193 ++
 .../uapi/v4l/pixfmt-meta-rkisp1-params.rst    |   23 +
 .../uapi/v4l/pixfmt-meta-rkisp1-stat.rst      |   22 +
 drivers/staging/media/rkisp1/Kconfig          |   13 +
 drivers/staging/media/rkisp1/Makefile         |    8 +
 drivers/staging/media/rkisp1/TODO             |   23 +
 drivers/staging/media/rkisp1/rkisp1-capture.c | 1437 +++++++++++++++
 drivers/staging/media/rkisp1/rkisp1-common.c  |   37 +
 drivers/staging/media/rkisp1/rkisp1-common.h  |  337 ++++
 drivers/staging/media/rkisp1/rkisp1-dev.c     |  574 ++++++
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 1164 ++++++++++++
 drivers/staging/media/rkisp1/rkisp1-params.c  | 1630 +++++++++++++++++
 drivers/staging/media/rkisp1/rkisp1-regs.h    | 1264 +++++++++++++
 drivers/staging/media/rkisp1/rkisp1-resizer.c |  775 ++++++++
 drivers/staging/media/rkisp1/rkisp1-stats.c   |  530 ++++++
 .../staging/media/rkisp1/uapi/rkisp1-config.h |  819 +++++++++
 24 files changed, 9351 insertions(+)
 create mode 100644 drivers/staging/media/phy-rockchip-dphy/Documentation/devicetree/bindings/phy/rockchip-mipi-dphy.yaml
 create mode 100644 drivers/staging/media/phy-rockchip-dphy/Kconfig
 create mode 100644 drivers/staging/media/phy-rockchip-dphy/Makefile
 create mode 100644 drivers/staging/media/phy-rockchip-dphy/TODO
 create mode 100644 drivers/staging/media/phy-rockchip-dphy/phy-rockchip-dphy.c
 create mode 100644 drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
 create mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
 create mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
 create mode 100644 drivers/staging/media/rkisp1/Kconfig
 create mode 100644 drivers/staging/media/rkisp1/Makefile
 create mode 100644 drivers/staging/media/rkisp1/TODO
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-capture.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-common.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-common.h
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-dev.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-isp.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-params.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-regs.h
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-resizer.c
 create mode 100644 drivers/staging/media/rkisp1/rkisp1-stats.c
 create mode 100644 drivers/staging/media/rkisp1/uapi/rkisp1-config.h

-- 
2.24.0

