Return-Path: <linux-media+bounces-1189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8343A7FB548
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E745B2152D
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 09:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16713DB8D;
	Tue, 28 Nov 2023 09:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F58932C62;
	Tue, 28 Nov 2023 09:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0612CC433C8;
	Tue, 28 Nov 2023 09:11:54 +0000 (UTC)
Message-ID: <39c5d16d-8f24-436c-b3d2-6f27765ef164@xs4all.nl>
Date: Tue, 28 Nov 2023 10:11:53 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: v4l2-subdev: Turn .[gs]_frame_interval into
 pad operations
Content-Language: en-US, nl
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Scally
 <djrscally@gmail.com>, Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Leon Luo <leonl@leopardimaging.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Paul Elder <paul.elder@ideasonboard.com>, Pavel Machek <pavel@ucw.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Ricardo Ribalda
 <ribalda@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-tegra@vger.kernel.org
References: <20231127111359.30315-1-laurent.pinchart@ideasonboard.com>
 <20231127111359.30315-2-laurent.pinchart@ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231127111359.30315-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2023 12:13, Laurent Pinchart wrote:
> The subdev .[gs]_frame_interval are video operations, but they operate
> on pads (and even on streams). Not only is this confusing, it causes
> practical issues for drivers as the operations don't receive a subdev
> state pointer, requiring manual state handling.
> 
> To improve the situation, turn the operations into pad operations, and
> extend them to receive a state pointer like other pad operations.
> 
> While at it, rename the operations to .[gs]et_frame_interval at the same
> time to match the naming scheme of other pad operations. This isn't
> strictly necessary, but given that all drivers using those operations
> need to be modified, handling the rename separately would generate more
> churn for very little gain (if at all).
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
> Changes since v1:
> 
> - Rebase on the latest media tree
> ---
>  drivers/media/i2c/adv7180.c                   |  7 ++-
>  drivers/media/i2c/et8ek8/et8ek8_driver.c      |  6 +-
>  drivers/media/i2c/imx214.c                    |  9 +--
>  drivers/media/i2c/imx274.c                    | 48 +++++---------
>  drivers/media/i2c/max9286.c                   | 14 +++--
>  drivers/media/i2c/mt9m111.c                   | 14 +++--
>  drivers/media/i2c/mt9m114.c                   | 14 +++--
>  drivers/media/i2c/mt9v011.c                   | 18 +++---
>  drivers/media/i2c/mt9v111.c                   | 16 ++---
>  drivers/media/i2c/ov2680.c                    |  7 ++-
>  drivers/media/i2c/ov5640.c                    | 16 ++---
>  drivers/media/i2c/ov5648.c                    | 59 ++++++++---------
>  drivers/media/i2c/ov5693.c                    |  7 ++-
>  drivers/media/i2c/ov6650.c                    | 16 ++---
>  drivers/media/i2c/ov7251.c                    |  6 +-
>  drivers/media/i2c/ov7670.c                    | 18 +++---
>  drivers/media/i2c/ov772x.c                    | 14 +++--
>  drivers/media/i2c/ov7740.c                    | 40 +++++-------
>  drivers/media/i2c/ov8865.c                    | 51 +++++++--------
>  drivers/media/i2c/ov9650.c                    | 14 +++--
>  drivers/media/i2c/s5c73m3/s5c73m3-core.c      | 14 +++--
>  drivers/media/i2c/s5k5baf.c                   | 20 +++---
>  drivers/media/i2c/thp7312.c                   | 22 +++----
>  drivers/media/i2c/tvp514x.c                   | 29 +++------
>  drivers/media/usb/em28xx/em28xx-video.c       |  6 +-
>  drivers/media/v4l2-core/v4l2-common.c         |  8 +--
>  drivers/media/v4l2-core/v4l2-subdev.c         | 63 +++++++++++--------
>  .../media/atomisp/i2c/atomisp-gc0310.c        |  7 ++-
>  .../media/atomisp/i2c/atomisp-gc2235.c        |  7 ++-
>  .../media/atomisp/i2c/atomisp-mt9m114.c       |  7 ++-
>  .../media/atomisp/i2c/atomisp-ov2722.c        |  7 ++-
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  4 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  4 +-
>  drivers/staging/media/imx/imx-ic-prp.c        | 14 +++--
>  drivers/staging/media/imx/imx-ic-prpencvf.c   | 14 +++--
>  drivers/staging/media/imx/imx-media-capture.c |  6 +-
>  drivers/staging/media/imx/imx-media-csi.c     | 14 +++--
>  drivers/staging/media/imx/imx-media-vdic.c    | 14 +++--
>  drivers/staging/media/tegra-video/csi.c       |  9 +--
>  include/media/v4l2-common.h                   |  4 +-
>  include/media/v4l2-subdev.h                   | 22 ++++---
>  41 files changed, 348 insertions(+), 341 deletions(-)
> 



