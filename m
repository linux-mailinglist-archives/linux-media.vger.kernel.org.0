Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEF8341E59
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 09:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436658AbfFLHzO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 03:55:14 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:55213 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2408167AbfFLHzM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 03:55:12 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud9.xs4all.net with ESMTPA
        id ay65hAbrKbiAgay68hBlId; Wed, 12 Jun 2019 09:55:09 +0200
Subject: Re: [PATCH v4 00/10] Rename Rockchip VPU driver to Hantro, add
 initial i.MX8M support
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
References: <20190611125058.13470-1-p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <aa108619-2c1b-56af-0db7-cf27b3e66c29@xs4all.nl>
Date:   Wed, 12 Jun 2019 09:55:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190611125058.13470-1-p.zabel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAPQ1yT8+Np0v1hldk2rlEAbki/8ILM8Jlt/HNUEhfl3IaVZ3knb9iZSm2LJKLWdnJOCu82lrvc9xsSZd23hEcJoaHlaRD8OmqpGsfz4uqkNBE5POAOP
 /bufMZJuv/CMblFauVzNjOTTQOG7521r+8zjTWkmTYqJJJDN4PtH03PlWEpmqyEtYfXRq/CZ9JjNj16RdJRNdyRObngXoAG3w0vz+9S1mTjd6GrMDFWdTvve
 v4RYPsIas5/HuWOYbOZrBbvvWeZiMM3zYcXhV4FhpN8gkCUd+Y+eG9JqhDfDJqOVuLiVw6JmDm97w0YsnOxDtbwoT3V5rmMn3ZQzEpNXiujEZCVc74kB1KAO
 E8fgBsNHysvc/iiS6G2F30N/NVenUj5Ihgauz8cMHWNz4nZD/iu19A7ZWB4uZ2MOHo7MNbdif5uGDPIplVUXs1DoVYMEsA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/11/19 2:50 PM, Philipp Zabel wrote:
> There are several other SoCs that contain Hantro IP based VPUs, such as
> NXP i.MX8MQ (Hantro G1 and G2) and i.MX8MM (Hantro G1, G2, and H1). To
> maximize code sharing, add initial support for these SoCs to the
> Rockchip VPU driver, after renaming it to Hantro VPU.
> 
> This series is based on the br-v5.3g tag, commit e568d2cc1ef6
> ("rockchip/vpu: Add support for MPEG-2 decoding on RK3288") with
> https://patchwork.linuxtv.org/patch/56402/ ("rockchip/vpu: Add support
> for MPEG-2 decoding on RK3328") applied on top. It supports MPEG-2
> decoding on i.MX8MQ. MPEG-2 decoding and JPEG encoding on i.MX8MM may
> or may not work, I don't have the hardware to test.
> 
> Changes since v3:
>  - Split rk3288_vpu_regs.h into hantro_g1_regs.h and hantro_h1_regs.h,
>    rename VDPU register defines to G1 and VEPU register defines to H1.
>  - Make Rockchip / i.MX8M support configurable.
>  - Keep staging/media Kconfig in alphabetic order.
>  - Rename bases to reg_bases
>  - Move dynamic clocks before i.MX8M support.

Can you please rebase this on top of the media_tree master? This series
doesn't apply there.

I'd like to get this rename series in asap since keeping this out-of-tree
is a pain.

It looks in good shape in general.

Regards,

	Hans

> 
> regards
> Philipp
> 
> Philipp Zabel (10):
>   rockchip/vpu: rename from rockchip to hantro
>   media: hantro: print video device name in addition to device node
>   media: hantro: add PM runtime resume callback
>   media: hantro: make irq names configurable
>   media: hantro: add support for named register ranges
>   media: hantro: add support for separate control block
>   media: hantro: allow arbitrary number of clocks
>   media: dt-bindings: Document i.MX8MQ and i.MX8MM VPU bindings
>   media: hantro: add initial i.MX8MQ support
>   media: hantro: add initial i.MX8MM support (untested)
> 
>  .../devicetree/bindings/media/imx8m-vpu.txt   |  56 +++
>  MAINTAINERS                                   |   4 +-
>  drivers/staging/media/Kconfig                 |   4 +-
>  drivers/staging/media/Makefile                |   2 +-
>  drivers/staging/media/hantro/Kconfig          |  31 ++
>  drivers/staging/media/hantro/Makefile         |  18 +
>  .../media/{rockchip/vpu => hantro}/TODO       |   0
>  .../vpu/rockchip_vpu.h => hantro/hantro.h}    | 167 ++++---
>  .../hantro_drv.c}                             | 335 ++++++-------
>  .../media/hantro/hantro_g1_mpeg2_dec.c        | 260 ++++++++++
>  drivers/staging/media/hantro/hantro_g1_regs.h | 301 ++++++++++++
>  .../staging/media/hantro/hantro_h1_jpeg_enc.c | 125 +++++
>  drivers/staging/media/hantro/hantro_h1_regs.h | 154 ++++++
>  drivers/staging/media/hantro/hantro_hw.h      | 104 ++++
>  .../hantro_jpeg.c}                            |  18 +-
>  drivers/staging/media/hantro/hantro_jpeg.h    |  13 +
>  .../hantro_mpeg2.c}                           |  14 +-
>  .../hantro_v4l2.c}                            | 234 +++++----
>  .../hantro_v4l2.h}                            |  16 +-
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   | 311 ++++++++++++
>  drivers/staging/media/hantro/rk3288_vpu_hw.c  | 187 ++++++++
>  .../{rockchip/vpu => hantro}/rk3399_vpu_hw.c  |  92 ++--
>  .../vpu => hantro}/rk3399_vpu_hw_jpeg_enc.c   |  32 +-
>  .../vpu => hantro}/rk3399_vpu_hw_mpeg2_dec.c  |  37 +-
>  .../vpu => hantro}/rk3399_vpu_regs.h          |   2 +-
>  drivers/staging/media/rockchip/vpu/Kconfig    |  14 -
>  drivers/staging/media/rockchip/vpu/Makefile   |  14 -
>  .../media/rockchip/vpu/rk3288_vpu_hw.c        | 177 -------
>  .../rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c     | 125 -----
>  .../rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c    | 261 -----------
>  .../media/rockchip/vpu/rk3288_vpu_regs.h      | 443 ------------------
>  .../media/rockchip/vpu/rockchip_vpu_hw.h      | 103 ----
>  .../media/rockchip/vpu/rockchip_vpu_jpeg.h    |  14 -
>  33 files changed, 2061 insertions(+), 1607 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/imx8m-vpu.txt
>  create mode 100644 drivers/staging/media/hantro/Kconfig
>  create mode 100644 drivers/staging/media/hantro/Makefile
>  rename drivers/staging/media/{rockchip/vpu => hantro}/TODO (100%)
>  rename drivers/staging/media/{rockchip/vpu/rockchip_vpu.h => hantro/hantro.h} (66%)
>  rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_drv.c => hantro/hantro_drv.c} (69%)
>  create mode 100644 drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
>  create mode 100644 drivers/staging/media/hantro/hantro_g1_regs.h
>  create mode 100644 drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
>  create mode 100644 drivers/staging/media/hantro/hantro_h1_regs.h
>  create mode 100644 drivers/staging/media/hantro/hantro_hw.h
>  rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_jpeg.c => hantro/hantro_jpeg.c} (95%)
>  create mode 100644 drivers/staging/media/hantro/hantro_jpeg.h
>  rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_mpeg2.c => hantro/hantro_mpeg2.c} (79%)
>  rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_v4l2.c => hantro/hantro_v4l2.c} (69%)
>  rename drivers/staging/media/{rockchip/vpu/rockchip_vpu_v4l2.h => hantro/hantro_v4l2.h} (53%)
>  create mode 100644 drivers/staging/media/hantro/imx8m_vpu_hw.c
>  create mode 100644 drivers/staging/media/hantro/rk3288_vpu_hw.c
>  rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw.c (62%)
>  rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw_jpeg_enc.c (86%)
>  rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_hw_mpeg2_dec.c (92%)
>  rename drivers/staging/media/{rockchip/vpu => hantro}/rk3399_vpu_regs.h (99%)
>  delete mode 100644 drivers/staging/media/rockchip/vpu/Kconfig
>  delete mode 100644 drivers/staging/media/rockchip/vpu/Makefile
>  delete mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw.c
>  delete mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_jpeg_enc.c
>  delete mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_hw_mpeg2_dec.c
>  delete mode 100644 drivers/staging/media/rockchip/vpu/rk3288_vpu_regs.h
>  delete mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_hw.h
>  delete mode 100644 drivers/staging/media/rockchip/vpu/rockchip_vpu_jpeg.h
> 

