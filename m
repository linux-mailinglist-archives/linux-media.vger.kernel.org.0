Return-Path: <linux-media+bounces-2315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2644E810E04
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 11:14:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4D321F21237
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 10:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C62224DD;
	Wed, 13 Dec 2023 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dH5F+2tR"
X-Original-To: linux-media@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C42AC;
	Wed, 13 Dec 2023 02:14:49 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF19FC000A;
	Wed, 13 Dec 2023 10:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702462488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MLFvzHrlurDDiJ9fwrCennWA8j0DQ+B1g0medVOvn24=;
	b=dH5F+2tRMK76OGGohcrS/NXdCDmBhV4EcdF0FjTlYeE+OPGDutcYd2hZ0U/vEAPL94Zfs1
	ERc34e9cqi5gFzja5y8RmIBHI+GLT9lJZTNSFGbiXiv2mfnH8HEE3G37dWMeXqppewq61h
	1nCEC1LjB25k+YGNr3OEK5Elp+d/e0B+soZ0XaVb0VkXbfDO+6twicSZgf4YWmMrnfoUw5
	y9uidhUdgU4vHoPyBnWWoGYtz8X4TuWNGsUlSlOBvQFvDCjWW2OL+miYI1RwhGskjaIaAq
	zcSWRtLiYa1SLt9+GW+qBWt4WZCR7MaElSg1CSDiHcpYpNQXRYqbKWNwMwcaYw==
Date: Wed, 13 Dec 2023 11:14:44 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Scally
 <djrscally@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans de
 Goede <hansg@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Leon Luo <leonl@leopardimaging.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Niklas =?UTF-8?Q?S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Paul Elder
 <paul.elder@ideasonboard.com>, Pavel Machek <pavel@ucw.cz>, Philipp Zabel
 <p.zabel@pengutronix.de>, Ricardo Ribalda <ribalda@kernel.org>, Rui Miguel
 Silva <rmfrfs@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, Steve Longerbeam
 <slongerbeam@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 3/8] media: v4l2-subdev: Add which field to struct
 v4l2_subdev_frame_interval
Message-ID: <20231213111444.34145eab@booty>
In-Reply-To: <20231208181648.13568-3-laurent.pinchart@ideasonboard.com>
References: <20231208181442.13356-1-laurent.pinchart@ideasonboard.com>
	<20231208181648.13568-3-laurent.pinchart@ideasonboard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Laurent,

On Fri,  8 Dec 2023 20:16:43 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Due to a historical mishap, the v4l2_subdev_frame_interval structure
> is the only part of the V4L2 subdev userspace API that doesn't contain a
> 'which' field. This prevents trying frame intervals using the subdev
> 'TRY' state mechanism.
> 
> Adding a 'which' field is simple as the structure has 8 reserved fields.
> This would however break userspace as the field is currently set to 0,
> corresponding to V4L2_SUBDEV_FORMAT_TRY, while the corresponding ioctls
> currently operate on the 'ACTIVE' state. We thus need to add a new
> subdev client cap, V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL, to indicate
> that userspace is aware of this new field.
> 
> All drivers that implement the subdev .get_frame_interval() and
> .set_frame_interval() operations are updated to return -EINVAL when
> operating on the TRY state, preserving the current behaviour.
> 
> While at it, fix a bad copy&paste in the documentation of the struct
> v4l2_subdev_frame_interval_enum 'which' field.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de> # for imx-media
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

...

>  drivers/staging/media/tegra-video/csi.c       |  3 +++

For tegra-video:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

