Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26453F5FA3
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 16:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfKIPHv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 10:07:51 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:47453 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726282AbfKIPHv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Nov 2019 10:07:51 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id TSKriLLBPXYiTTSKui2v4a; Sat, 09 Nov 2019 16:07:48 +0100
Subject: Re: [PATCH v10 00/11] Rockchip ISP Driver
To:     Helen Koike <helen.koike@collabora.com>,
        linux-rockchip@lists.infradead.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
        jeffy.chen@rock-chips.com, zyc@rock-chips.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        robh+dt@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        kernel@collabora.com, ezequiel@collabora.com,
        linux-media@vger.kernel.org, jacob-chen@iotwrt.com,
        zhengsq@rock-chips.com
References: <20191107005617.12302-1-helen.koike@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <7c81145d-ffe5-351a-2b82-d9bb63f3c0cc@xs4all.nl>
Date:   Sat, 9 Nov 2019 16:07:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107005617.12302-1-helen.koike@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGegz4zSjrbMAN6bwhzyLX53f7EGoOZlvMc4a5Cpd7nT+yDj9q4OtdtEKUqXVHNtGukYsZUCmJws6Q+Uubi2CSmJUl3sb+13+yq8AuXJCeE2knYNPev5
 XGFp9mlLHLfPZMRvfgkKAonDSiugi1460mtgjMh1HP/aQTf92Cgfv3hPayr25PprGP5PEAN6Lr4KI9InxYM2KXlWO1cfmItSarEN28xNdCJddhVPm19Su6P3
 OoosGQgMTkxwCuLSMiarNPqrhxaYI0hAEMqsL1hjZ5NG/xIZeuUpe5g7RxKal1YlDFjw0aET3GsGVajEIMDkXb7UGWynwpVntQKIlGBtHMPTQJ0bfpwjOr67
 8VcOTActmhZw7POEH7lO2pfYHc4DG6p3xXzdVlA9wOEl4dXiT3yZMZ8ohulE7n9riuYhQrqgX17vovhGB4ucWi0N5CmdNeAOslSN/QPO/f5B9/eCkcMvQcOA
 xhjARhjuTVKm6HS162Q3p7f8g843yZA97fkkr2e5LvTLv9zrKfSN19Fgvd9aqhZwgYyxb/+Rw//wSpsVd33EkkeNBibo7n2rZ8tqZt8zFQEnto+UxEB7W+3v
 V0ohqZw8GwR+1+VMMI15xU1UEXtaPaaXnCJDAEfV1fOye2cUsZUpxgMRCvz0S6MES2j+GYg1VHlqh1hwSpCDzj2pOYGX4LkUm8HwMcnanrtMQphSU7tLz6FA
 NJZ4BBeXZrg4xorOs85KvxdpDrYJsisglAXyMHL4d1/LyCs0X7x6ZsUZtGtqwS8mhOF3nKuIg2KJMHaOeEIYqxg8QZmRMTdVql0xBh+Z8Ryg5MR99cnYi1er
 Z6HNK1XbUU51K3ATuuKXZ34XABTZZgKwXgsw3wiK2oKGJ5e2vQ11ige3dX62iy+hqT9KGJv0s4ThxxKT+/8lV3U6VhQPJRRNhdEk7qYEkcA8v8vulxNQKLx7
 jezGlw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Helen,

On 11/7/19 1:56 AM, Helen Koike wrote:
> Hello,
> 
> This series adds the Rockchip Image Signal Processing Unit v1 driver to
> staging.
> 
> The main reason to be in staging is that people are already using it from the
> mailing list (including libcamera), and having it in mainlin makes the workflow
> easier. Also, it is easier for other people to contribute back (with code
> or testing the driver).
> 
> We plan to actively work on this driver to get it our of staging.
> 
> This patchset is also available at:
> https://gitlab.collabora.com/koike/linux/tree/rockchip/isp/v10
> 
> Libcamera patched to work with this version:
> https://gitlab.collabora.com/koike/libcamera
> (also sent to the mailing list)
> 
> The major difference in v10 are:
> * I splitted the patches again in different commits, since it was too big for
> the media mailing list and also it's easier to get dt-bindings approval.
> * We don't expose the metadata pixelformats to the uapi yet, so  patch
> "media: videodev2.h, v4l2-ioctl: add rkisp1 meta buffer format" was
> removed from the series.
> * TODO list was updated to remind to test uapi structs in different
> architectures.
> 
> This series only touches MAINTAINERS file and drivers/staging/
> 
> MAINTAINERS
> drivers/staging/media/Kconfig
> drivers/staging/media/Makefile
> drivers/staging/media/phy-rockchip-dphy/Kconfig
> drivers/staging/media/phy-rockchip-dphy/Makefile
> drivers/staging/media/phy-rockchip-dphy/TODO
> drivers/staging/media/phy-rockchip-dphy/phy-rockchip-dphy.c
> drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.txt
> drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
> drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
> drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
> drivers/staging/media/rkisp1/Kconfig
> drivers/staging/media/rkisp1/Makefile
> drivers/staging/media/rkisp1/TODO
> drivers/staging/media/rkisp1/capture.c
> drivers/staging/media/rkisp1/capture.h
> drivers/staging/media/rkisp1/common.h
> drivers/staging/media/rkisp1/dev.c
> drivers/staging/media/rkisp1/dev.h
> drivers/staging/media/rkisp1/isp_params.c
> drivers/staging/media/rkisp1/isp_params.h
> drivers/staging/media/rkisp1/isp_stats.c
> drivers/staging/media/rkisp1/isp_stats.h
> drivers/staging/media/rkisp1/regs.c
> drivers/staging/media/rkisp1/regs.h
> drivers/staging/media/rkisp1/rkisp1.c
> drivers/staging/media/rkisp1/rkisp1.h
> drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> 
> Two drivers were added, including a TODO list for removing it from
> staging:
> 
> * phy-rockchip-dphy: mipi dphy driver used by csi
> * rkisp1: the image signal processing unit driver
> 
> Any feedback is welcome.

I get a lot of checkpatch.pl --strict warnings for this series that for the most
part seem very trivial. Please fix these, it's much easier to maintain the driver
if this is done before merging it.

I also get these compile warnings:

drivers/staging/media/rkisp1/isp_stats.c: In function ‘rkisp1_register_stats_vdev’:
drivers/staging/media/rkisp1/isp_stats.c:452:10: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
  452 |  if (ret < 0)
      |          ^
drivers/staging/media/rkisp1/isp_stats.c:456:10: warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
  456 |  if (ret < 0) {
      |          ^
drivers/staging/media/rkisp1/rkisp1.c: In function ‘rkisp1_config_isp’:
drivers/staging/media/rkisp1/rkisp1.c:154:20: warning: variable ‘out_crop’ set but not used [-Wunused-but-set-variable]
  154 |  struct v4l2_rect *out_crop, *in_crop;
      |                    ^~~~~~~~

I also got these sparse warnings:

SPARSE:/home/hans/work/build/media-git/drivers/staging/media/rkisp1/isp_params.c
/home/hans/work/build/media-git/drivers/staging/media/rkisp1/isp_params.c:1511:29:  warning: symbol 'rkisp1_params_fops' was not declared.
Should it be static?
SPARSE:/home/hans/work/build/media-git/drivers/staging/media/rkisp1/rkisp1.c
/home/hans/work/build/media-git/drivers/staging/media/rkisp1/rkisp1.c:943:43:  warning: missing braces around initializer

Regards,

	Hans

> 
> Thanks,
> Helen
> 
> Helen Koike (1):
>   MAINTAINERS: add entry for Rockchip ISP1 driver
> 
> Jacob Chen (9):
>   media: staging: phy-rockchip-dphy: add Rockchip MIPI Synopsys DPHY
>     driver
>   media: staging: rkisp1: add document for rkisp1 meta buffer format
>   media: staging: rkisp1: add Rockchip ISP1 subdev driver
>   media: staging: rkisp1: add ISP1 statistics driver
>   media: staging: rkisp1: add ISP1 params driver
>   media: staging: rkisp1: add capture device driver
>   media: staging: rkisp1: add rockchip isp1 core driver
>   media: staging: dt-bindings: Document the Rockchip ISP1 bindings
>   media: staging: dt-bindings: Document the Rockchip MIPI RX D-PHY
>     bindings
> 
> Jeffy Chen (1):
>   media: staging: rkisp1: add user space ABI definitions
> 
>  MAINTAINERS                                   |    6 +
>  drivers/staging/media/Kconfig                 |    4 +
>  drivers/staging/media/Makefile                |    2 +
>  .../staging/media/phy-rockchip-dphy/Kconfig   |   11 +
>  .../staging/media/phy-rockchip-dphy/Makefile  |    2 +
>  drivers/staging/media/phy-rockchip-dphy/TODO  |    6 +
>  .../phy-rockchip-dphy/phy-rockchip-dphy.c     |  400 ++++
>  .../bindings/media/rockchip-isp1.txt          |   71 +
>  .../bindings/media/rockchip-mipi-dphy.txt     |   38 +
>  .../uapi/v4l/pixfmt-meta-rkisp1-params.rst    |   23 +
>  .../uapi/v4l/pixfmt-meta-rkisp1-stat.rst      |   22 +
>  drivers/staging/media/rkisp1/Kconfig          |   13 +
>  drivers/staging/media/rkisp1/Makefile         |    7 +
>  drivers/staging/media/rkisp1/TODO             |   23 +
>  drivers/staging/media/rkisp1/capture.c        | 1869 +++++++++++++++++
>  drivers/staging/media/rkisp1/capture.h        |  164 ++
>  drivers/staging/media/rkisp1/common.h         |   98 +
>  drivers/staging/media/rkisp1/dev.c            |  439 ++++
>  drivers/staging/media/rkisp1/dev.h            |   67 +
>  drivers/staging/media/rkisp1/isp_params.c     | 1604 ++++++++++++++
>  drivers/staging/media/rkisp1/isp_params.h     |   50 +
>  drivers/staging/media/rkisp1/isp_stats.c      |  494 +++++
>  drivers/staging/media/rkisp1/isp_stats.h      |   60 +
>  drivers/staging/media/rkisp1/regs.c           |  224 ++
>  drivers/staging/media/rkisp1/regs.h           | 1525 ++++++++++++++
>  drivers/staging/media/rkisp1/rkisp1.c         | 1246 +++++++++++
>  drivers/staging/media/rkisp1/rkisp1.h         |   97 +
>  .../staging/media/rkisp1/uapi/rkisp1-config.h |  819 ++++++++
>  28 files changed, 9384 insertions(+)
>  create mode 100644 drivers/staging/media/phy-rockchip-dphy/Kconfig
>  create mode 100644 drivers/staging/media/phy-rockchip-dphy/Makefile
>  create mode 100644 drivers/staging/media/phy-rockchip-dphy/TODO
>  create mode 100644 drivers/staging/media/phy-rockchip-dphy/phy-rockchip-dphy.c
>  create mode 100644 drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.txt
>  create mode 100644 drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-mipi-dphy.txt
>  create mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-params.rst
>  create mode 100644 drivers/staging/media/rkisp1/Documentation/media/uapi/v4l/pixfmt-meta-rkisp1-stat.rst
>  create mode 100644 drivers/staging/media/rkisp1/Kconfig
>  create mode 100644 drivers/staging/media/rkisp1/Makefile
>  create mode 100644 drivers/staging/media/rkisp1/TODO
>  create mode 100644 drivers/staging/media/rkisp1/capture.c
>  create mode 100644 drivers/staging/media/rkisp1/capture.h
>  create mode 100644 drivers/staging/media/rkisp1/common.h
>  create mode 100644 drivers/staging/media/rkisp1/dev.c
>  create mode 100644 drivers/staging/media/rkisp1/dev.h
>  create mode 100644 drivers/staging/media/rkisp1/isp_params.c
>  create mode 100644 drivers/staging/media/rkisp1/isp_params.h
>  create mode 100644 drivers/staging/media/rkisp1/isp_stats.c
>  create mode 100644 drivers/staging/media/rkisp1/isp_stats.h
>  create mode 100644 drivers/staging/media/rkisp1/regs.c
>  create mode 100644 drivers/staging/media/rkisp1/regs.h
>  create mode 100644 drivers/staging/media/rkisp1/rkisp1.c
>  create mode 100644 drivers/staging/media/rkisp1/rkisp1.h
>  create mode 100644 drivers/staging/media/rkisp1/uapi/rkisp1-config.h
> 

