Return-Path: <linux-media+bounces-451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 207E57EE467
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 16:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4346A1C20847
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 15:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B86358B7;
	Thu, 16 Nov 2023 15:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5666E34574
	for <linux-media@vger.kernel.org>; Thu, 16 Nov 2023 15:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1917FC433C7;
	Thu, 16 Nov 2023 15:29:59 +0000 (UTC)
Message-ID: <e414e2e8-d098-4315-bd45-67a16d144648@xs4all.nl>
Date: Thu, 16 Nov 2023 16:29:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL v3 FOR 6.8] V4L2 subdev patches
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
References: <ZVEyCfzm4ninES6K@valkosipuli.retiisi.eu>
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
In-Reply-To: <ZVEyCfzm4ninES6K@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 12/11/2023 21:14, Sakari Ailus wrote:
> Hi Mauro, Hans,
> 
> Here's a bunch of patches from myself and Laurent, cleaning up V4L2
> sub-device state information access API, drivers using it plus fixing IVSC
> driver firmware parsing and IMX319 driver. A few CCS driver fixes and
> documentation improvement are included, too.
> 
> Please pull.
> 
> since v2:
> 
> - Fix sub-device state access conditional compilation (was dependent on
>   sub-device UAPI).
> 
> since v1:
> 
> - Fix IVSC driver patch error handling.
> 
> 
> The following changes since commit 3e238417254bfdcc23fe207780b59cbb08656762:
> 
>   media: nuvoton: VIDEO_NPCM_VCD_ECE should depend on ARCH_NPCM (2023-10-27 11:44:19 +0200)
> 
> are available in the Git repository at:
> 
>   git://linuxtv.org/sailus/media_tree.git tags/for-6.8-1.2-signed
> 
> for you to fetch changes up to 61ab89c1916219ccbeca9f6cefb1680212de8d1c:
> 
>   media: v4l: subdev: Return NULL from pad access functions on error (2023-11-12 20:51:35 +0200)

As mentioned on irc, this PR no longer applies after the starfive driver
was merged.

I did a run for this PR with the starfive patches dropped, and I got a few
kerneldoc warnings:

include/media/v4l2-subdev.h:1425: warning: Excess function parameter 'state' description in 'v4l2_subdev_state_get_format'
include/media/v4l2-subdev.h:1425: warning: Excess function parameter 'pad' description in 'v4l2_subdev_state_get_format'
include/media/v4l2-subdev.h:1445: warning: Excess function parameter 'state' description in 'v4l2_subdev_state_get_crop'
include/media/v4l2-subdev.h:1445: warning: Excess function parameter 'pad' description in 'v4l2_subdev_state_get_crop'
include/media/v4l2-subdev.h:1465: warning: Excess function parameter 'state' description in 'v4l2_subdev_state_get_compose'
include/media/v4l2-subdev.h:1465: warning: Excess function parameter 'pad' description in 'v4l2_subdev_state_get_compose'

Can you fix this for the next version?

Regards,

	Hans

> 
> ----------------------------------------------------------------
> V4L2 patches for 6.8
> 
> ----------------------------------------------------------------
> Laurent Pinchart (16):
>       media: v4l2-subdev: Fix indentation in v4l2-subdev.h
>       media: atmel-isi: Use accessors for pad config 'try_*' fields
>       media: microchip-isc: Use accessors for pad config 'try_*' fields
>       media: atmel-isc: Use accessors for pad config 'try_*' fields
>       media: atomisp: Use accessors for pad config 'try_*' fields
>       media: tegra-video: Use accessors for pad config 'try_*' fields
>       media: i2c: Use accessors for pad config 'try_*' fields
>       media: v4l2-subdev: Rename pad config 'try_*' fields
>       media: v4l2-subdev: Drop outdated comment for v4l2_subdev_pad_config
>       media: ipu3-cio2: Drop comment blocks for subdev op handlers
>       media: xilinx: csi2rxss: Drop comment blocks for subdev op handlers
>       media: v4l2-subdev: Fix references to pad config
>       media: qcom: camss: Fix references to pad config
>       media: ti: omap3isp: Fix references to pad config
>       media: ti: omap4iss: Fix references to pad config
>       media: i2c: Fix references to pad config
> 
> Sakari Ailus (19):
>       media: ccs: Ensure control handlers have been set up after probe
>       media: ivsc: csi: Don't parse remote endpoints
>       media: ivsc: csi: Clean up V4L2 async notifier on error
>       media: ivsc: csi: Clean up notifier set-up
>       media: ivsc: csi: Clean up parsing firmware and setting up async notifier
>       media: ivsc: csi: Don't mask v4l2_fwnode_endpoint_parse return value
>       media: ivsc: csi: Check number of lanes on source, too
>       media: ccs: Print ireal and float limits converted to integers
>       media: imx319: Enable runtime PM before registering async sub-device
>       media: Documentation: Initialisation finishes before subdev registration
>       media: v4l: subdev: Store the sub-device in the sub-device state
>       media: v4l: subdev: Also return pads array information on stream functions
>       media: v4l: subdev: Rename sub-device state information access functions
>       media: v4l: subdev: v4l2_subdev_state_get_format always returns format now
>       media: v4l: subdev: Make stream argument optional in state access functions
>       media: v4l: subdev: Always compile sub-device state access functions
>       media: v4l: subdev: Switch to stream-aware state functions
>       media: v4l: subdev: Remove stream-unaware sub-device state access
>       media: v4l: subdev: Return NULL from pad access functions on error
> 
>  Documentation/driver-api/media/camera-sensor.rst   |   3 +-
>  Documentation/driver-api/media/v4l2-subdev.rst     |  11 +-
>  drivers/media/i2c/adv7180.c                        |   4 +-
>  drivers/media/i2c/adv7183.c                        |   2 +-
>  drivers/media/i2c/adv748x/adv748x-afe.c            |   6 +-
>  drivers/media/i2c/adv748x/adv748x-csi2.c           |   2 +-
>  drivers/media/i2c/adv748x/adv748x-hdmi.c           |   6 +-
>  drivers/media/i2c/adv7511-v4l2.c                   |   4 +-
>  drivers/media/i2c/adv7604.c                        |   4 +-
>  drivers/media/i2c/adv7842.c                        |   4 +-
>  drivers/media/i2c/ar0521.c                         |   5 +-
>  drivers/media/i2c/ccs/ccs-core.c                   |  44 ++--
>  drivers/media/i2c/ccs/ccs.h                        |   1 +
>  drivers/media/i2c/ds90ub913.c                      |   3 +-
>  drivers/media/i2c/ds90ub953.c                      |   3 +-
>  drivers/media/i2c/ds90ub960.c                      |  12 +-
>  drivers/media/i2c/et8ek8/et8ek8_driver.c           |   3 +-
>  drivers/media/i2c/hi556.c                          |  13 +-
>  drivers/media/i2c/hi846.c                          |  11 +-
>  drivers/media/i2c/hi847.c                          |   9 +-
>  drivers/media/i2c/imx208.c                         |   9 +-
>  drivers/media/i2c/imx214.c                         |   4 +-
>  drivers/media/i2c/imx219.c                         |  12 +-
>  drivers/media/i2c/imx258.c                         |   9 +-
>  drivers/media/i2c/imx274.c                         |  12 +-
>  drivers/media/i2c/imx290.c                         |   8 +-
>  drivers/media/i2c/imx296.c                         |  18 +-
>  drivers/media/i2c/imx319.c                         |  19 +-
>  drivers/media/i2c/imx334.c                         |  12 +-
>  drivers/media/i2c/imx335.c                         |  12 +-
>  drivers/media/i2c/imx355.c                         |   7 +-
>  drivers/media/i2c/imx412.c                         |  12 +-
>  drivers/media/i2c/imx415.c                         |   6 +-
>  drivers/media/i2c/isl7998x.c                       |   6 +-
>  drivers/media/i2c/max9286.c                        |   4 +-
>  drivers/media/i2c/mt9m001.c                        |   6 +-
>  drivers/media/i2c/mt9m111.c                        |   6 +-
>  drivers/media/i2c/mt9m114.c                        |  58 +++---
>  drivers/media/i2c/mt9p031.c                        |   6 +-
>  drivers/media/i2c/mt9t112.c                        |   2 +-
>  drivers/media/i2c/mt9v011.c                        |   2 +-
>  drivers/media/i2c/mt9v032.c                        |  10 +-
>  drivers/media/i2c/mt9v111.c                        |   4 +-
>  drivers/media/i2c/og01a1b.c                        |  10 +-
>  drivers/media/i2c/ov01a10.c                        |   2 +-
>  drivers/media/i2c/ov02a10.c                        |   6 +-
>  drivers/media/i2c/ov08d10.c                        |   9 +-
>  drivers/media/i2c/ov08x40.c                        |   7 +-
>  drivers/media/i2c/ov13858.c                        |  10 +-
>  drivers/media/i2c/ov13b10.c                        |  10 +-
>  drivers/media/i2c/ov2640.c                         |   6 +-
>  drivers/media/i2c/ov2659.c                         |   6 +-
>  drivers/media/i2c/ov2680.c                         |  10 +-
>  drivers/media/i2c/ov2685.c                         |   4 +-
>  drivers/media/i2c/ov2740.c                         |   4 +-
>  drivers/media/i2c/ov4689.c                         |   2 +-
>  drivers/media/i2c/ov5640.c                         |   9 +-
>  drivers/media/i2c/ov5645.c                         |   4 +-
>  drivers/media/i2c/ov5647.c                         |  12 +-
>  drivers/media/i2c/ov5648.c                         |   6 +-
>  drivers/media/i2c/ov5670.c                         |  13 +-
>  drivers/media/i2c/ov5675.c                         |   9 +-
>  drivers/media/i2c/ov5693.c                         |   4 +-
>  drivers/media/i2c/ov5695.c                         |   8 +-
>  drivers/media/i2c/ov6650.c                         |  34 ++--
>  drivers/media/i2c/ov7251.c                         |   4 +-
>  drivers/media/i2c/ov7670.c                         |   7 +-
>  drivers/media/i2c/ov772x.c                         |   2 +-
>  drivers/media/i2c/ov7740.c                         |   7 +-
>  drivers/media/i2c/ov8856.c                         |   9 +-
>  drivers/media/i2c/ov8858.c                         |   6 +-
>  drivers/media/i2c/ov8865.c                         |   8 +-
>  drivers/media/i2c/ov9282.c                         |  14 +-
>  drivers/media/i2c/ov9640.c                         |   2 +-
>  drivers/media/i2c/ov9650.c                         |   7 +-
>  drivers/media/i2c/ov9734.c                         |   9 +-
>  drivers/media/i2c/rj54n1cb0c.c                     |   2 +-
>  drivers/media/i2c/s5c73m3/s5c73m3-core.c           |  37 ++--
>  drivers/media/i2c/s5k5baf.c                        |  35 ++--
>  drivers/media/i2c/s5k6a3.c                         |   8 +-
>  drivers/media/i2c/saa6752hs.c                      |   2 +-
>  drivers/media/i2c/st-mipid02.c                     |  11 +-
>  drivers/media/i2c/st-vgxy61.c                      |   5 +-
>  drivers/media/i2c/tc358746.c                       |  12 +-
>  drivers/media/i2c/tda1997x.c                       |   6 +-
>  drivers/media/i2c/tvp5150.c                        |   2 +-
>  drivers/media/i2c/tvp7002.c                        |   6 +-
>  drivers/media/i2c/tw9910.c                         |   2 +-
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c           |  24 +--
>  drivers/media/pci/intel/ivsc/mei_csi.c             |  73 ++++---
>  drivers/media/platform/atmel/atmel-isi.c           |  12 +-
>  drivers/media/platform/cadence/cdns-csi2rx.c       |   4 +-
>  drivers/media/platform/cadence/cdns-csi2tx.c       |   3 +-
>  .../media/platform/microchip/microchip-csi2dc.c    |  15 +-
>  .../media/platform/microchip/microchip-isc-base.c  |  10 +-
>  .../platform/microchip/microchip-isc-scaler.c      |  16 +-
>  drivers/media/platform/nxp/imx-mipi-csis.c         |  10 +-
>  drivers/media/platform/nxp/imx7-media-csi.c        |  16 +-
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |  10 +-
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  18 +-
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   |   2 +-
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c      |  13 +-
>  drivers/media/platform/qcom/camss/camss-csid.c     |  15 +-
>  drivers/media/platform/qcom/camss/camss-csiphy.c   |  15 +-
>  drivers/media/platform/qcom/camss/camss-ispif.c    |  15 +-
>  drivers/media/platform/qcom/camss/camss-vfe.c      |  34 ++--
>  drivers/media/platform/renesas/rcar-isp.c          |   4 +-
>  .../media/platform/renesas/rcar-vin/rcar-csi2.c    |   4 +-
>  .../media/platform/renesas/rzg2l-cru/rzg2l-csi2.c  |   6 +-
>  .../media/platform/renesas/rzg2l-cru/rzg2l-ip.c    |   6 +-
>  drivers/media/platform/renesas/vsp1/vsp1_brx.c     |   2 +-
>  drivers/media/platform/renesas/vsp1/vsp1_entity.c  |   8 +-
>  drivers/media/platform/renesas/vsp1/vsp1_rwpf.c    |   3 +-
>  .../media/platform/rockchip/rkisp1/rkisp1-csi.c    |  16 +-
>  .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 103 +++++-----
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c      |  53 ++---
>  .../platform/samsung/exynos4-is/fimc-capture.c     |  12 +-
>  .../media/platform/samsung/exynos4-is/fimc-isp.c   |  24 +--
>  .../media/platform/samsung/exynos4-is/fimc-lite.c  |  16 +-
>  .../media/platform/samsung/exynos4-is/mipi-csis.c  |   3 +-
>  .../platform/samsung/s3c-camif/camif-capture.c     |   8 +-
>  .../media/platform/sunxi/sun4i-csi/sun4i_v4l2.c    |   8 +-
>  .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c    |   8 +-
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c        |   8 +-
>  .../sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c    |   8 +-
>  drivers/media/platform/ti/cal/cal-camerarx.c       |  18 +-
>  drivers/media/platform/ti/cal/cal-video.c          |   2 +-
>  drivers/media/platform/ti/omap3isp/ispccdc.c       |  19 +-
>  drivers/media/platform/ti/omap3isp/ispccp2.c       |  13 +-
>  drivers/media/platform/ti/omap3isp/ispcsi2.c       |   9 +-
>  drivers/media/platform/ti/omap3isp/isppreview.c    |  18 +-
>  drivers/media/platform/ti/omap3isp/ispresizer.c    |  21 +-
>  drivers/media/platform/video-mux.c                 |  18 +-
>  drivers/media/platform/xilinx/xilinx-csi2rxss.c    |  64 +-----
>  drivers/media/platform/xilinx/xilinx-tpg.c         |   9 +-
>  drivers/media/platform/xilinx/xilinx-vip.c         |   4 +-
>  drivers/media/test-drivers/vimc/vimc-debayer.c     |  10 +-
>  drivers/media/test-drivers/vimc/vimc-scaler.c      |   9 +-
>  drivers/media/test-drivers/vimc/vimc-sensor.c      |   6 +-
>  drivers/media/v4l2-core/v4l2-subdev.c              | 181 ++++++++++-------
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c |   2 +-
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c |   2 +-
>  .../staging/media/atomisp/i2c/atomisp-mt9m114.c    |   2 +-
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c |   2 +-
>  drivers/staging/media/atomisp/pci/atomisp_csi2.c   |   3 +-
>  drivers/staging/media/atomisp/pci/atomisp_subdev.c |   6 +-
>  drivers/staging/media/atomisp/pci/atomisp_tpg.c    |   2 +-
>  .../media/deprecated/atmel/atmel-isc-base.c        |  10 +-
>  drivers/staging/media/imx/imx-ic-prp.c             |   4 +-
>  drivers/staging/media/imx/imx-ic-prpencvf.c        |   4 +-
>  drivers/staging/media/imx/imx-media-csi.c          |   8 +-
>  drivers/staging/media/imx/imx-media-utils.c        |   2 +-
>  drivers/staging/media/imx/imx-media-vdic.c         |   2 +-
>  drivers/staging/media/imx/imx6-mipi-csi2.c         |   2 +-
>  drivers/staging/media/ipu3/ipu3-v4l2.c             |  14 +-
>  drivers/staging/media/omap4iss/iss_csi2.c          |   9 +-
>  drivers/staging/media/omap4iss/iss_ipipe.c         |  11 +-
>  drivers/staging/media/omap4iss/iss_ipipeif.c       |  11 +-
>  drivers/staging/media/omap4iss/iss_resizer.c       |  11 +-
>  .../staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c |   8 +-
>  drivers/staging/media/tegra-video/vi.c             |  14 +-
>  include/media/v4l2-subdev.h                        | 222 ++++++++-------------
>  include/uapi/linux/v4l2-subdev.h                   |   2 +-
>  163 files changed, 1005 insertions(+), 1136 deletions(-)
> 


