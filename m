Return-Path: <linux-media+bounces-1208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 580E57FB6B5
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8893E1C2125E
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE644D11F;
	Tue, 28 Nov 2023 10:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85211BF
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 02:06:18 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7uyX-0006Iw-JM; Tue, 28 Nov 2023 11:05:53 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7uyS-00C8vZ-Iu; Tue, 28 Nov 2023 11:05:48 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7uyS-0005FM-0z;
	Tue, 28 Nov 2023 11:05:48 +0100
Message-ID: <1840fa86aa1451f7ab8c982d706fe3ad2459080f.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/4] media: v4l2-subdev: Add which field to struct
 v4l2_subdev_frame_interval
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Daniel Scally <djrscally@gmail.com>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Jonathan Hunter
 <jonathanh@nvidia.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Leon Luo <leonl@leopardimaging.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Niklas =?ISO-8859-1?Q?S=F6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,  Paul Elder
 <paul.elder@ideasonboard.com>, Pavel Machek <pavel@ucw.cz>, Ricardo Ribalda
 <ribalda@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sowjanya Komatineni
 <skomatineni@nvidia.com>,  Steve Longerbeam <slongerbeam@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>,  linux-tegra@vger.kernel.org
Date: Tue, 28 Nov 2023 11:05:48 +0100
In-Reply-To: <20231127111359.30315-3-laurent.pinchart@ideasonboard.com>
References: <20231127111359.30315-1-laurent.pinchart@ideasonboard.com>
	 <20231127111359.30315-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Mo, 2023-11-27 at 13:13 +0200, Laurent Pinchart wrote:
> Due to a historical mishap, the v4l2_subdev_frame_interval structure
> is the only part of the V4L2 subdev userspace API that doesn't contain a
> 'which' field. This prevents trying frame intervals using the subdev
> 'TRY' state mechanism.
>=20
> Adding a 'which' field is simple as the structure has 8 reserved fields.
> This would however break userspace as the field is currently set to 0,
> corresponding to V4L2_SUBDEV_FORMAT_TRY, while the corresponding ioctls
> currently operate on the 'ACTIVE' state. We thus need to add a new
> subdev client cap, V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL, to indicate
> that userspace is aware of this new field.
>=20
> All drivers that implement the subdev .get_frame_interval() and
> .set_frame_interval() operations are updated to return -EINVAL when
> operating on the TRY state, preserving the current behaviour.
>=20
> While at it, fix a bad copy&paste in the documentation of the struct
> v4l2_subdev_frame_interval_enum 'which' field.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de> # for imx-media

regards
Philipp

