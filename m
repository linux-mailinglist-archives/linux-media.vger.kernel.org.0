Return-Path: <linux-media+bounces-2313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C47810DCF
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 11:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72359281AB9
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 10:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560B82209F;
	Wed, 13 Dec 2023 10:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FeuddR8g"
X-Original-To: linux-media@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D1EA4;
	Wed, 13 Dec 2023 02:02:00 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27B4160003;
	Wed, 13 Dec 2023 10:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702461719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nzq47vFlv97cazTquttyDrHhz//pHKUF4LDlvhQgbK8=;
	b=FeuddR8grSkUeA+v5ZTM+a/fzRBdjj6sOJAYGGxdsWfw+lQ1/aY+jL0UALte6wGRqEUd1t
	1HFRLyh/Io9ijAL9ZDbryHUYHOXdJOmdvfrBQcGCAP6Mr1GsCR2N/lfRRsnvptIIcytA16
	KKJdUr5uHCVftzX2qfJa9jav20TraCwvyXvvhNNKdC4bMxmwLdKVrw3TpFJ9aALmtTFKW3
	pTM9MaUqOqsk7ViGBVjyRSgZK1cWBD+yYPf2W1u0YG/iJwceIs9jvIkaCEEgYikgYJFm37
	ruoF4C8h3+Fk4eqlLM1yyK3p5/VyOhV6dRNVPsVEXEDOy9d2KpBYyhu3ohaw4A==
Date: Wed, 13 Dec 2023 11:01:54 +0100
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
Subject: Re: [PATCH v4 2/8] media: v4l2-subdev: Turn .[gs]_frame_interval
 into pad operations
Message-ID: <20231213110154.21024f41@booty>
In-Reply-To: <20231208181648.13568-2-laurent.pinchart@ideasonboard.com>
References: <20231208181442.13356-1-laurent.pinchart@ideasonboard.com>
	<20231208181648.13568-2-laurent.pinchart@ideasonboard.com>
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

On Fri,  8 Dec 2023 20:16:42 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

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
> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de> # for imx-media
...
>  drivers/media/v4l2-core/v4l2-common.c         |  8 +--
>  drivers/media/v4l2-core/v4l2-subdev.c         | 63 +++++++++++--------
...
>  drivers/staging/media/tegra-video/csi.c       |  9 +--
>  include/media/v4l2-common.h                   |  4 +-
>  include/media/v4l2-subdev.h                   | 22 ++++---

For tegra-video:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I'm afraid I cannot test it as the tegra-video hardware I have has a
parallel camera only, no CSI.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

