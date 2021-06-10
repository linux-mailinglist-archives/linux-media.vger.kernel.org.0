Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 908FD3A2B3F
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 14:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhFJMSj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 08:18:39 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:57679 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230380AbhFJMSi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 08:18:38 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rJbxl869MhqltrJc0lXwJJ; Thu, 10 Jun 2021 14:16:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623327400; bh=KdZFpN/tm8QeM8huep0AlpEi6w/hFEZ6bIvGsonEZPM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fnxUKGOC1zVDUV77Ql6q0JBI1cQASRxt75Gxtb4VUpHUZgmvo0argn65nzRMuf3P6
         osofoKST8anm7qMQKPBidTFwGI6MKsmPC/lHHTy6+N0tqrySPuwKg75M85eFzTwAQC
         w71buNyP9fiKiZcAB+BpNAqgq60d5sHlt9hTlQLHctiFUBPmc5MhghZttLoZLSPxa0
         SlZ0Dt4B1+YX9dhhNmCzqljNLZMIXu6nV1A7nkxjO6cL5vABvZ56Y5vnDaBNoDr5e1
         QonKoUakCZ0CSH/lyO6sDSt48qHaQwCx78e36P8HS3Lh025HtfTTzVs8jtwZ7COBOu
         SMXvTM/FY0INQ==
Subject: Re: [PATCH v4 0/1] media: v4l2-subdev: add subdev-wide state struct
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210610115453.2578621-1-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <48bb3595-f541-2dfa-aabb-8040c4e1425d@xs4all.nl>
Date:   Thu, 10 Jun 2021 14:16:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210610115453.2578621-1-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIlCXl7X7NxYngLxsuefS/qtPhJNBVtgwUiIH7b17J5i9EZQmE24uSMaTO7QAh7YX8VtRuq4OCC7wa0leS76ELv8HVIvF1CvTB84XOPknsm/c+3+o+mW
 nUQOqOJWFFeQ1vueG4jdeFLn47eLROTxOr3XBP6JvIUTqL+qSY4uX9B0ld5sjhES7+Op1sm/7zphN0TGAT+drpbEF4CKLfowDg7jeakccFdMRtOXkh/1/q6d
 Cm476p8BNUVr9qiHqcNy6uoQlWVlmWp0P5JavAv2K4tMcL3w6HA49kdjpK9S5RoKwJSjLlmMJn90YKL/dSEoT+oRjLn9Ao7hidOLn52EgZXx49c9GBWpQequ
 Kgj3Z7FHlfms5Mp3+AB05hvWKnZCBQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/06/2021 13:54, Tomi Valkeinen wrote:
> Hi,
> 
> v4 of the patch. Addressed comments from Hans, Sakari and Laurent:
> 
> - driver kernel-doc fixes (due to renaming cfg to sd_state)
> - v4l2_subdev_free_state to accept NULL
> - rename and fix check_cfg()
> - fix omap3isp indentations

Against what tree is this patch? It fails to apply to either media_tree/master
or media_stage/master.

Regards,

	Hans

> 
>  Tomi
> 
> Tomi Valkeinen (1):
>   media: v4l2-subdev: add subdev-wide state struct
> 
>  drivers/media/i2c/adv7170.c                   |   6 +-
>  drivers/media/i2c/adv7175.c                   |   6 +-
>  drivers/media/i2c/adv7180.c                   |  18 +--
>  drivers/media/i2c/adv7183.c                   |   8 +-
>  drivers/media/i2c/adv748x/adv748x-afe.c       |  13 +-
>  drivers/media/i2c/adv748x/adv748x-csi2.c      |  14 +-
>  drivers/media/i2c/adv748x/adv748x-hdmi.c      |  13 +-
>  drivers/media/i2c/adv7511-v4l2.c              |  10 +-
>  drivers/media/i2c/adv7604.c                   |  12 +-
>  drivers/media/i2c/adv7842.c                   |  12 +-
>  drivers/media/i2c/ak881x.c                    |   6 +-
>  drivers/media/i2c/ccs/ccs-core.c              |  84 ++++++-----
>  drivers/media/i2c/cx25840/cx25840-core.c      |   2 +-
>  drivers/media/i2c/et8ek8/et8ek8_driver.c      |  23 +--
>  drivers/media/i2c/hi556.c                     |  15 +-
>  drivers/media/i2c/imx208.c                    |  19 +--
>  drivers/media/i2c/imx214.c                    |  37 ++---
>  drivers/media/i2c/imx219.c                    |  30 ++--
>  drivers/media/i2c/imx258.c                    |  19 +--
>  drivers/media/i2c/imx274.c                    |  38 ++---
>  drivers/media/i2c/imx290.c                    |  20 +--
>  drivers/media/i2c/imx319.c                    |  18 +--
>  drivers/media/i2c/imx334.c                    |  28 ++--
>  drivers/media/i2c/imx355.c                    |  18 +--
>  drivers/media/i2c/m5mols/m5mols_core.c        |  21 ++-
>  drivers/media/i2c/max9286.c                   |  17 ++-
>  drivers/media/i2c/ml86v7667.c                 |   4 +-
>  drivers/media/i2c/mt9m001.c                   |  18 +--
>  drivers/media/i2c/mt9m032.c                   |  38 ++---
>  drivers/media/i2c/mt9m111.c                   |  18 +--
>  drivers/media/i2c/mt9p031.c                   |  45 +++---
>  drivers/media/i2c/mt9t001.c                   |  44 +++---
>  drivers/media/i2c/mt9t112.c                   |  14 +-
>  drivers/media/i2c/mt9v011.c                   |   6 +-
>  drivers/media/i2c/mt9v032.c                   |  44 +++---
>  drivers/media/i2c/mt9v111.c                   |  23 +--
>  drivers/media/i2c/noon010pc30.c               |  19 ++-
>  drivers/media/i2c/ov02a10.c                   |  17 ++-
>  drivers/media/i2c/ov13858.c                   |  18 +--
>  drivers/media/i2c/ov2640.c                    |  16 +-
>  drivers/media/i2c/ov2659.c                    |  14 +-
>  drivers/media/i2c/ov2680.c                    |  23 +--
>  drivers/media/i2c/ov2685.c                    |  10 +-
>  drivers/media/i2c/ov2740.c                    |  15 +-
>  drivers/media/i2c/ov5640.c                    |  14 +-
>  drivers/media/i2c/ov5645.c                    |  38 ++---
>  drivers/media/i2c/ov5647.c                    |  26 ++--
>  drivers/media/i2c/ov5648.c                    |  14 +-
>  drivers/media/i2c/ov5670.c                    |  19 +--
>  drivers/media/i2c/ov5675.c                    |  15 +-
>  drivers/media/i2c/ov5695.c                    |  15 +-
>  drivers/media/i2c/ov6650.c                    |  28 ++--
>  drivers/media/i2c/ov7251.c                    |  39 ++---
>  drivers/media/i2c/ov7670.c                    |  17 ++-
>  drivers/media/i2c/ov772x.c                    |  12 +-
>  drivers/media/i2c/ov7740.c                    |  17 ++-
>  drivers/media/i2c/ov8856.c                    |  15 +-
>  drivers/media/i2c/ov8865.c                    |  14 +-
>  drivers/media/i2c/ov9640.c                    |   8 +-
>  drivers/media/i2c/ov9650.c                    |  17 ++-
>  drivers/media/i2c/ov9734.c                    |  15 +-
>  drivers/media/i2c/rdacm20.c                   |   4 +-
>  drivers/media/i2c/rdacm21.c                   |   4 +-
>  drivers/media/i2c/rj54n1cb0c.c                |  12 +-
>  drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  55 +++----
>  drivers/media/i2c/s5k4ecgx.c                  |  22 +--
>  drivers/media/i2c/s5k5baf.c                   |  49 +++---
>  drivers/media/i2c/s5k6a3.c                    |  19 ++-
>  drivers/media/i2c/s5k6aa.c                    |  39 ++---
>  drivers/media/i2c/saa6752hs.c                 |   6 +-
>  drivers/media/i2c/saa7115.c                   |   2 +-
>  drivers/media/i2c/saa717x.c                   |   2 +-
>  drivers/media/i2c/sr030pc30.c                 |   8 +-
>  drivers/media/i2c/st-mipid02.c                |  21 +--
>  drivers/media/i2c/tc358743.c                  |   8 +-
>  drivers/media/i2c/tda1997x.c                  |  14 +-
>  drivers/media/i2c/tvp514x.c                   |  12 +-
>  drivers/media/i2c/tvp5150.c                   |  20 +--
>  drivers/media/i2c/tvp7002.c                   |  11 +-
>  drivers/media/i2c/tw9910.c                    |  10 +-
>  drivers/media/i2c/vs6624.c                    |   8 +-
>  drivers/media/pci/cx18/cx18-av-core.c         |   2 +-
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  17 ++-
>  drivers/media/pci/saa7134/saa7134-empress.c   |   5 +-
>  drivers/media/platform/atmel/atmel-isc-base.c |  19 ++-
>  drivers/media/platform/atmel/atmel-isi.c      |  19 ++-
>  drivers/media/platform/cadence/cdns-csi2tx.c  |  14 +-
>  .../media/platform/exynos4-is/fimc-capture.c  |  22 +--
>  drivers/media/platform/exynos4-is/fimc-isp.c  |  37 +++--
>  drivers/media/platform/exynos4-is/fimc-lite.c |  39 ++---
>  drivers/media/platform/exynos4-is/mipi-csis.c |  17 ++-
>  .../media/platform/marvell-ccic/mcam-core.c   |   5 +-
>  drivers/media/platform/omap3isp/ispccdc.c     |  85 ++++++-----
>  drivers/media/platform/omap3isp/ispccp2.c     |  49 +++---
>  drivers/media/platform/omap3isp/ispcsi2.c     |  41 ++---
>  drivers/media/platform/omap3isp/isppreview.c  |  69 +++++----
>  drivers/media/platform/omap3isp/ispresizer.c  |  70 +++++----
>  drivers/media/platform/pxa_camera.c           |   5 +-
>  .../media/platform/qcom/camss/camss-csid.c    |  35 ++---
>  .../media/platform/qcom/camss/camss-csiphy.c  |  40 ++---
>  .../media/platform/qcom/camss/camss-ispif.c   |  36 ++---
>  drivers/media/platform/qcom/camss/camss-vfe.c |  84 ++++++-----
>  drivers/media/platform/rcar-vin/rcar-csi2.c   |   8 +-
>  drivers/media/platform/rcar-vin/rcar-v4l2.c   |  10 +-
>  drivers/media/platform/renesas-ceu.c          |   7 +-
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 112 ++++++++------
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c |  95 +++++++-----
>  .../media/platform/s3c-camif/camif-capture.c  |  18 +--
>  drivers/media/platform/stm32/stm32-dcmi.c     |  14 +-
>  .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  16 +-
>  drivers/media/platform/ti-vpe/cal-camerarx.c  |  35 +++--
>  drivers/media/platform/via-camera.c           |   5 +-
>  drivers/media/platform/video-mux.c            |  22 +--
>  drivers/media/platform/vsp1/vsp1_brx.c        |  34 +++--
>  drivers/media/platform/vsp1/vsp1_clu.c        |  13 +-
>  drivers/media/platform/vsp1/vsp1_entity.c     |  59 ++++----
>  drivers/media/platform/vsp1/vsp1_entity.h     |  20 +--
>  drivers/media/platform/vsp1/vsp1_histo.c      |  51 ++++---
>  drivers/media/platform/vsp1/vsp1_hsit.c       |  14 +-
>  drivers/media/platform/vsp1/vsp1_lif.c        |  13 +-
>  drivers/media/platform/vsp1/vsp1_lut.c        |  13 +-
>  drivers/media/platform/vsp1/vsp1_rwpf.c       |  32 ++--
>  drivers/media/platform/vsp1/vsp1_rwpf.h       |   2 +-
>  drivers/media/platform/vsp1/vsp1_sru.c        |  22 +--
>  drivers/media/platform/vsp1/vsp1_uds.c        |  22 +--
>  drivers/media/platform/vsp1/vsp1_uif.c        |  27 ++--
>  .../media/platform/xilinx/xilinx-csi2rxss.c   |  26 ++--
>  drivers/media/platform/xilinx/xilinx-tpg.c    |  25 +--
>  drivers/media/platform/xilinx/xilinx-vip.c    |  12 +-
>  drivers/media/platform/xilinx/xilinx-vip.h    |   4 +-
>  .../media/test-drivers/vimc/vimc-debayer.c    |  20 +--
>  drivers/media/test-drivers/vimc/vimc-scaler.c |  36 ++---
>  drivers/media/test-drivers/vimc/vimc-sensor.c |  16 +-
>  drivers/media/usb/go7007/s2250-board.c        |   2 +-
>  drivers/media/v4l2-core/v4l2-subdev.c         | 142 ++++++++++--------
>  .../media/atomisp/i2c/atomisp-gc0310.c        |  10 +-
>  .../media/atomisp/i2c/atomisp-gc2235.c        |  10 +-
>  .../media/atomisp/i2c/atomisp-mt9m114.c       |  12 +-
>  .../media/atomisp/i2c/atomisp-ov2680.c        |  10 +-
>  .../media/atomisp/i2c/atomisp-ov2722.c        |  10 +-
>  .../media/atomisp/i2c/ov5693/atomisp-ov5693.c |  10 +-
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  33 ++--
>  .../staging/media/atomisp/pci/atomisp_csi2.c  |  28 ++--
>  .../staging/media/atomisp/pci/atomisp_csi2.h  |   2 +-
>  .../staging/media/atomisp/pci/atomisp_file.c  |  14 +-
>  .../staging/media/atomisp/pci/atomisp_fops.c  |   6 +-
>  .../media/atomisp/pci/atomisp_subdev.c        |  64 ++++----
>  .../media/atomisp/pci/atomisp_subdev.h        |   9 +-
>  .../staging/media/atomisp/pci/atomisp_tpg.c   |  12 +-
>  drivers/staging/media/imx/imx-ic-prp.c        |  19 +--
>  drivers/staging/media/imx/imx-ic-prpencvf.c   |  31 ++--
>  drivers/staging/media/imx/imx-media-csi.c     |  82 +++++-----
>  drivers/staging/media/imx/imx-media-utils.c   |   4 +-
>  drivers/staging/media/imx/imx-media-vdic.c    |  24 +--
>  drivers/staging/media/imx/imx-media.h         |   2 +-
>  drivers/staging/media/imx/imx6-mipi-csi2.c    |  12 +-
>  drivers/staging/media/imx/imx7-media-csi.c    |  33 ++--
>  drivers/staging/media/imx/imx7-mipi-csis.c    |  34 +++--
>  drivers/staging/media/ipu3/ipu3-v4l2.c        |  26 ++--
>  drivers/staging/media/omap4iss/iss_csi2.c     |  37 ++---
>  drivers/staging/media/omap4iss/iss_ipipe.c    |  37 ++---
>  drivers/staging/media/omap4iss/iss_ipipeif.c  |  47 +++---
>  drivers/staging/media/omap4iss/iss_resizer.c  |  39 ++---
>  drivers/staging/media/tegra-video/csi.c       |  10 +-
>  drivers/staging/media/tegra-video/vi.c        |  24 +--
>  include/media/v4l2-subdev.h                   |  74 +++++----
>  166 files changed, 2162 insertions(+), 1802 deletions(-)
> 

