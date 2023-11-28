Return-Path: <linux-media+bounces-1281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F047FBD65
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 15:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 293481C214A4
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 14:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF53E5C08C;
	Tue, 28 Nov 2023 14:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3217B5C084
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 14:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4EF7C433C7;
	Tue, 28 Nov 2023 14:55:08 +0000 (UTC)
Message-ID: <78dd2d05-5634-459b-82d7-bb125f873703@xs4all.nl>
Date: Tue, 28 Nov 2023 15:55:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL FOR 6.8] V4L2 sub-device API changes plus new drivers
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@iki.fi>, Hugues Fruchet <hugues.fruchet@st.com>
References: <ZWXVYqYXYQvUnEjp@valkosipuli.retiisi.eu>
Cc: linux-media@vger.kernel.org
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 xsFNBFQ84W0BEAC7EF1iL4s3tY8cRTVkJT/297h0Hz0ypA+ByVM4CdU9sN6ua/YoFlr9k0K4
 BFUlg7JzJoUuRbKxkYb8mmqOe722j7N3HO8+ofnio5cAP5W0WwDpM0kM84BeHU0aPSTsWiGR
 yw55SOK2JBSq7hueotWLfJLobMWhQii0Zd83hGT9SIt9uHaHjgwmtTH7MSTIiaY6N14nw2Ud
 C6Uykc1va0Wqqc2ov5ihgk/2k2SKa02ookQI3e79laOrbZl5BOXNKR9LguuOZdX4XYR3Zi6/
 BsJ7pVCK9xkiVf8svlEl94IHb+sa1KrlgGv3fn5xgzDw8Z222TfFceDL/2EzUyTdWc4GaPMC
 E/c1B4UOle6ZHg02+I8tZicjzj5+yffv1lB5A1btG+AmoZrgf0X2O1B96fqgHx8w9PIpVERN
 YsmkfxvhfP3MO3oHh8UY1OLKdlKamMneCLk2up1Zlli347KMjHAVjBAiy8qOguKF9k7HOjif
 JCLYTkggrRiEiE1xg4tblBNj8WGyKH+u/hwwwBqCd/Px2HvhAsJQ7DwuuB3vBAp845BJYUU3
 06kRihFqbO0vEt4QmcQDcbWINeZ2zX5TK7QQ91ldHdqJn6MhXulPKcM8tCkdD8YNXXKyKqNl
 UVqXnarz8m2JCbHgjEkUlAJCNd6m3pfESLZwSWsLYL49R5yxIwARAQABzSFIYW5zIFZlcmt1
 aWwgPGh2ZXJrdWlsQHhzNGFsbC5ubD7CwZUEEwECACgFAlQ84W0CGwMFCRLMAwAGCwkIBwMC
 BhUIAgkKCwQWAgMBAh4BAheAACEJEL0tYUhmFDtMFiEEBSzee8IVBTtonxvKvS1hSGYUO0wT
 7w//frEmPBAwu3OdvAk9VDkH7X+7RcFpiuUcJxs3Xl6jpaA+SdwtZra6W1uMrs2RW8eXXiq/
 80HXJtYnal1Y8MKUBoUVhT/+5+KcMyfVQK3VFRHnNxCmC9HZV+qdyxAGwIscUd4hSlweuU6L
 6tI7Dls6NzKRSTFbbGNZCRgl8OrF01TBH+CZrcFIoDgpcJA5Pw84mxo+wd2BZjPA4TNyq1od
 +slSRbDqFug1EqQaMVtUOdgaUgdlmjV0+GfBHoyCGedDE0knv+tRb8v5gNgv7M3hJO3Nrl+O
 OJVoiW0G6OWVyq92NNCKJeDy8XCB1yHCKpBd4evO2bkJNV9xcgHtLrVqozqxZAiCRKN1elWF
 1fyG8KNquqItYedUr+wZZacqW+uzpVr9pZmUqpVCk9s92fzTzDZcGAxnyqkaO2QTgdhPJT2m
 wpG2UwIKzzi13tmwakY7OAbXm76bGWVZCO3QTHVnNV8ku9wgeMc/ZGSLUT8hMDZlwEsW7u/D
 qt+NlTKiOIQsSW7u7h3SFm7sMQo03X/taK9PJhS2BhhgnXg8mOa6U+yNaJy+eU0Lf5hEUiDC
 vDOI5x++LD3pdrJVr/6ZB0Qg3/YzZ0dk+phQ+KlP6HyeO4LG662toMbFbeLcBjcC/ceEclII
 90QNEFSZKM6NVloM+NaZRYVO3ApxWkFu+1mrVTXOwU0EVDzhbQEQANzLiI6gHkIhBQKeQaYs
 p2SSqF9c++9LOy5x6nbQ4s0X3oTKaMGfBZuiKkkU6NnHCSa0Az5ScRWLaRGu1PzjgcVwzl5O
 sDawR1BtOG/XoPRNB2351PRp++W8TWo2viYYY0uJHKFHML+ku9q0P+NkdTzFGJLP+hn7x0RT
 DMbhKTHO3H2xJz5TXNE9zTJuIfGAz3ShDpijvzYieY330BzZYfpgvCllDVM5E4XgfF4F/N90
 wWKu50fMA01ufwu+99GEwTFVG2az5T9SXd7vfSgRSkzXy7hcnxj4IhOfM6Ts85/BjMeIpeqy
 TDdsuetBgX9DMMWxMWl7BLeiMzMGrfkJ4tvlof0sVjurXibTibZyfyGR2ricg8iTbHyFaAzX
 2uFVoZaPxrp7udDfQ96sfz0hesF9Zi8d7NnNnMYbUmUtaS083L/l2EDKvCIkhSjd48XF+aO8
 VhrCfbXWpGRaLcY/gxi2TXRYG9xCa7PINgz9SyO34sL6TeFPSZn4bPQV5O1j85Dj4jBecB1k
 z2arzwlWWKMZUbR04HTeAuuvYvCKEMnfW3ABzdonh70QdqJbpQGfAF2p4/iCETKWuqefiOYn
 pR8PqoQA1DYv3t7y9DIN5Jw/8Oj5wOeEybw6vTMB0rrnx+JaXvxeHSlFzHiD6il/ChDDkJ9J
 /ejCHUQIl40wLSDRABEBAAHCwXwEGAECAA8FAlQ84W0CGwwFCRLMAwAAIQkQvS1hSGYUO0wW
 IQQFLN57whUFO2ifG8q9LWFIZhQ7TA1WD/9yxJvQrpf6LcNrr8uMlQWCg2iz2q1LGt1Itkuu
 KaavEF9nqHmoqhSfZeAIKAPn6xuYbGxXDrpN7dXCOH92fscLodZqZtK5FtbLvO572EPfxneY
 UT7JzDc/5LT9cFFugTMOhq1BG62vUm/F6V91+unyp4dRlyryAeqEuISykhvjZCVHk/woaMZv
 c1Dm4Uvkv0Ilelt3Pb9J7zhcx6sm5T7v16VceF96jG61bnJ2GFS+QZerZp3PY27XgtPxRxYj
 AmFUeF486PHx/2Yi4u1rQpIpC5inPxIgR1+ZFvQrAV36SvLFfuMhyCAxV6WBlQc85ArOiQZB
 Wm7L0repwr7zEJFEkdy8C81WRhMdPvHkAIh3RoY1SGcdB7rB3wCzfYkAuCBqaF7Zgfw8xkad
 KEiQTexRbM1sc/I8ACpla3N26SfQwrfg6V7TIoweP0RwDrcf5PVvwSWsRQp2LxFCkwnCXOra
 gYmkrmv0duG1FStpY+IIQn1TOkuXrciTVfZY1cZD0aVxwlxXBnUNZZNslldvXFtndxR0SFat
 sflovhDxKyhFwXOP0Rv8H378/+14TaykknRBIKEc0+lcr+EMOSUR5eg4aURb8Gc3Uc7fgQ6q
 UssTXzHPyj1hAyDpfu8DzAwlh4kKFTodxSsKAjI45SLjadSc94/5Gy8645Y1KgBzBPTH7Q==
In-Reply-To: <ZWXVYqYXYQvUnEjp@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 28/11/2023 12:56, Sakari Ailus wrote:
> Hi Mauro, Hans,
> 
> Here are a bunch of new drivers (Thine ISP, gc2145 sensor driver, dcmipp
> camera interface driver) and an init_cfg pad op change to init_state
> internal op. Included is also the media tree portion of the DisCo for
> Imaging support and a new fwnode property API function, needed by the Thine
> ISP driver. Also a number of fixes and improvements to the mipid02 and
> vgxy61 drivers are included --- they also depend on the sub-device API
> changes.
> 
> Please pull.
> 
> 
> The following changes since commit 3b8551e73271fc375b15c887db54ad31686eb2ea:
> 
>   media: wave5: add OF and V4L_MEM2MEM_DRIVERS dependencies (2023-11-24 14:11:22 +0100)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/sailus/media_tree.git tags/for-6.8-4-signed
> 
> for you to fetch changes up to 710fd99e818be5dc946f689a05971c2a9a1c3b8d:
> 
>   media: stm32-dcmipp: STM32 DCMIPP camera interface driver (2023-11-28 12:31:47 +0200)
> 
> ----------------------------------------------------------------
> V4L2 patches for 6.8
> 
> ----------------------------------------------------------------
> Alain Volmat (15):
>       dt-bindings: vendor-prefixes: Add prefix for GalaxyCore Inc.
>       dt-bindings: media: i2c: add galaxycore,gc2145 dt-bindings
>       media: i2c: gc2145: Galaxy Core GC2145 sensor support
>       media: i2c: st-mipid02: correct format propagation
>       media: i2c: st-mipid02: add usage of v4l2_get_link_freq
>       media: i2c: st-mipid02: don't keep track of streaming status
>       media: i2c: st-mipid02: use cci_* helpers for register access.
>       media: i2c: st-mipid02: use active state to store pad formats
>       media: i2c: st-mipid02: use mipi-csi macro for data-type
>       media: i2c: st-mipid02: removal of unused link_frequency variable
>       media: i2c: st-mipid02: add Y8 format support
>       media: i2c: st-vgxy61: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
>       media: i2c: st-vgxy61: add v4l2_fwnode ctrls parse and addition
>       dt-bindings: media: add bindings for stm32 dcmipp
>       media: MAINTAINERS: add entry for STM32 DCMIPP driver
> 
> Hugues Fruchet (1):
>       media: stm32-dcmipp: STM32 DCMIPP camera interface driver

I'm getting these kerneldoc warnings/errors in dcmipp-common:

drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h:59: error: Cannot parse struct or union!
drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h:106: warning: Function parameter or member 'pads_flag' not described in 'dcmipp_pads_init'
drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h:106: warning: Excess function parameter 'pads_flags' description in 'dcmipp_pads_init'
drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h:147: warning: Function parameter or member 'handler' not described in 'dcmipp_ent_sd_register'
drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h:147: warning: Function parameter or member 'thread_fn' not described in 'dcmipp_ent_sd_register'

It is likely best to resolve this in a follow-up patch. Hugues, can you take
a look at that?

In addition, this PR conflicts with the "[PATCH] media: vsp1: Remove unbalanced
.s_stream(0) calls" vsp1 v6.7 fix: that was merged in mainline yesterday, but this
PR was created without that patch.

I plan to merge v6.7-rc4 into staging on Monday, so perhaps the best way forward
is if you can apply that fix to your tree, then add the patches from this PR on top
of that, resolving the conflict. Then I can merge the updated PR on Monday. There
are no other issues with this PR, it passed all other tests.

Regards,

	Hans

> 
> Laurent Pinchart (3):
>       media: renesas: vsp1: Fix references to pad config
>       media: uapi: Add controls for the THP7312 ISP
>       media: v4l2-subdev: Rename .init_cfg() operation to .init_state()
> 
> Paul Elder (2):
>       dt-bindings: media: Add bindings for THine THP7312 ISP
>       media: i2c: Add driver for THine THP7312
> 
> Sakari Ailus (2):
>       device property: Add fwnode_name_eq()
>       media: v4l: fwnode: Parse MIPI DisCo for Imaging properties
> 
>  .../bindings/media/i2c/galaxycore,gc2145.yaml      |  113 +
>  .../bindings/media/i2c/thine,thp7312.yaml          |  224 ++
>  .../devicetree/bindings/media/st,stm32-dcmipp.yaml |   89 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
>  .../userspace-api/media/drivers/index.rst          |    1 +
>  .../userspace-api/media/drivers/thp7312.rst        |   39 +
>  MAINTAINERS                                        |   24 +-
>  drivers/base/property.c                            |   28 +
>  drivers/media/i2c/Kconfig                          |   27 +
>  drivers/media/i2c/Makefile                         |    2 +
>  drivers/media/i2c/adv7180.c                        |   10 +-
>  drivers/media/i2c/ccs/ccs-core.c                   |    6 +-
>  drivers/media/i2c/ds90ub913.c                      |   10 +-
>  drivers/media/i2c/ds90ub953.c                      |   10 +-
>  drivers/media/i2c/ds90ub960.c                      |   11 +-
>  drivers/media/i2c/gc2145.c                         | 1450 +++++++++++++
>  drivers/media/i2c/hi846.c                          |   10 +-
>  drivers/media/i2c/imx214.c                         |   12 +-
>  drivers/media/i2c/imx219.c                         |    9 +-
>  drivers/media/i2c/imx290.c                         |   10 +-
>  drivers/media/i2c/imx296.c                         |   10 +-
>  drivers/media/i2c/imx334.c                         |   12 +-
>  drivers/media/i2c/imx335.c                         |   12 +-
>  drivers/media/i2c/imx412.c                         |   12 +-
>  drivers/media/i2c/imx415.c                         |   10 +-
>  drivers/media/i2c/mt9m001.c                        |   10 +-
>  drivers/media/i2c/mt9m111.c                        |   10 +-
>  drivers/media/i2c/mt9m114.c                        |   16 +-
>  drivers/media/i2c/mt9p031.c                        |    8 +-
>  drivers/media/i2c/mt9v111.c                        |   10 +-
>  drivers/media/i2c/ov01a10.c                        |   10 +-
>  drivers/media/i2c/ov02a10.c                        |   10 +-
>  drivers/media/i2c/ov2640.c                         |   10 +-
>  drivers/media/i2c/ov2680.c                         |   10 +-
>  drivers/media/i2c/ov2740.c                         |   10 +-
>  drivers/media/i2c/ov5640.c                         |   10 +-
>  drivers/media/i2c/ov5645.c                         |   12 +-
>  drivers/media/i2c/ov5670.c                         |   10 +-
>  drivers/media/i2c/ov7251.c                         |   12 +-
>  drivers/media/i2c/ov8858.c                         |   10 +-
>  drivers/media/i2c/ov9282.c                         |   12 +-
>  drivers/media/i2c/st-mipid02.c                     |  480 ++---
>  drivers/media/i2c/st-vgxy61.c                      |   29 +-
>  drivers/media/i2c/tc358746.c                       |   10 +-
>  drivers/media/i2c/tda1997x.c                       |   10 +-
>  drivers/media/i2c/thp7312.c                        | 2244 ++++++++++++++++++++
>  drivers/media/i2c/tvp5150.c                        |    6 +-
>  drivers/media/pci/intel/ivsc/mei_csi.c             |   10 +-
>  drivers/media/platform/cadence/cdns-csi2rx.c       |   10 +-
>  .../media/platform/microchip/microchip-csi2dc.c    |   10 +-
>  .../platform/microchip/microchip-isc-scaler.c      |   10 +-
>  drivers/media/platform/nxp/imx-mipi-csis.c         |   10 +-
>  drivers/media/platform/nxp/imx7-media-csi.c        |    6 +-
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |   10 +-
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |   10 +-
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |   10 +-
>  .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |   10 +-
>  .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |   10 +-
>  drivers/media/platform/renesas/vsp1/vsp1_brx.c     |   41 +-
>  drivers/media/platform/renesas/vsp1/vsp1_clu.c     |    4 +-
>  drivers/media/platform/renesas/vsp1/vsp1_entity.c  |  130 +-
>  drivers/media/platform/renesas/vsp1/vsp1_entity.h  |   12 +-
>  drivers/media/platform/renesas/vsp1/vsp1_hgo.c     |    4 +-
>  drivers/media/platform/renesas/vsp1/vsp1_hgt.c     |    4 +-
>  drivers/media/platform/renesas/vsp1/vsp1_histo.c   |   24 +-
>  drivers/media/platform/renesas/vsp1/vsp1_hsit.c    |   12 +-
>  drivers/media/platform/renesas/vsp1/vsp1_lif.c     |    3 +-
>  drivers/media/platform/renesas/vsp1/vsp1_lut.c     |    1 -
>  drivers/media/platform/renesas/vsp1/vsp1_rpf.c     |    8 +-
>  drivers/media/platform/renesas/vsp1/vsp1_rwpf.c    |   38 +-
>  drivers/media/platform/renesas/vsp1/vsp1_sru.c     |   37 +-
>  drivers/media/platform/renesas/vsp1/vsp1_uds.c     |   40 +-
>  drivers/media/platform/renesas/vsp1/vsp1_uif.c     |   25 +-
>  drivers/media/platform/renesas/vsp1/vsp1_video.c   |    4 +-
>  drivers/media/platform/renesas/vsp1/vsp1_wpf.c     |   10 +-
>  .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |   10 +-
>  .../media/platform/rockchip/rkisp1/rkisp1-isp.c    |   10 +-
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c      |   10 +-
>  drivers/media/platform/st/stm32/Kconfig            |   16 +
>  drivers/media/platform/st/stm32/Makefile           |    1 +
>  .../media/platform/st/stm32/stm32-dcmipp/Makefile  |    4 +
>  .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         |  956 +++++++++
>  .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        |  565 +++++
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-common.c |  111 +
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |  216 ++
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  604 ++++++
>  .../st/stm32/stm32-dcmipp/dcmipp-parallel.c        |  440 ++++
>  drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |    1 +
>  drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h |    1 +
>  .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |    9 +-
>  .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c    |   10 +-
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c        |   10 +-
>  .../sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c    |   10 +-
>  drivers/media/platform/ti/cal/cal-camerarx.c       |   10 +-
>  drivers/media/platform/video-mux.c                 |   10 +-
>  drivers/media/platform/xilinx/xilinx-csi2rxss.c    |   10 +-
>  drivers/media/test-drivers/vimc/vimc-debayer.c     |   11 +-
>  drivers/media/test-drivers/vimc/vimc-scaler.c      |   11 +-
>  drivers/media/test-drivers/vimc/vimc-sensor.c      |   11 +-
>  drivers/media/v4l2-core/v4l2-fwnode.c              |    4 +-
>  drivers/media/v4l2-core/v4l2-subdev.c              |   20 +-
>  drivers/staging/media/imx/imx-ic-prp.c             |    2 +-
>  drivers/staging/media/imx/imx-ic-prpencvf.c        |    2 +-
>  drivers/staging/media/imx/imx-media-csi.c          |    2 +-
>  drivers/staging/media/imx/imx-media-utils.c        |    8 +-
>  drivers/staging/media/imx/imx-media-vdic.c         |    2 +-
>  drivers/staging/media/imx/imx-media.h              |    4 +-
>  drivers/staging/media/imx/imx6-mipi-csi2.c         |    2 +-
>  drivers/staging/media/starfive/camss/stf-isp.c     |    6 +-
>  .../staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c |   10 +-
>  include/linux/property.h                           |    1 +
>  include/media/v4l2-subdev.h                        |    7 +-
>  include/uapi/linux/thp7312.h                       |   19 +
>  include/uapi/linux/v4l2-controls.h                 |    6 +
>  114 files changed, 7983 insertions(+), 754 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
>  create mode 100644 Documentation/userspace-api/media/drivers/thp7312.rst
>  create mode 100644 drivers/media/i2c/gc2145.c
>  create mode 100644 drivers/media/i2c/thp7312.c
>  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
>  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
>  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
>  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.c
>  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
>  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
>  create mode 100644 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c
>  create mode 100644 include/uapi/linux/thp7312.h
> 


