Return-Path: <linux-media+bounces-1209-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3D17FB6B8
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 11:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC197B21AD2
	for <lists+linux-media@lfdr.de>; Tue, 28 Nov 2023 10:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891CE4D587;
	Tue, 28 Nov 2023 10:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A19CDC
	for <linux-media@vger.kernel.org>; Tue, 28 Nov 2023 02:06:18 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7uyX-0006Iy-JU; Tue, 28 Nov 2023 11:05:53 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7uyT-00C8vc-R9; Tue, 28 Nov 2023 11:05:49 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7uyT-0005Fe-2Q;
	Tue, 28 Nov 2023 11:05:49 +0100
Message-ID: <a50e1be1430ad1e84290df53a13c6c696632456c.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/4] media: v4l2-subdev: Turn .[gs]_frame_interval
 into pad operations
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
Date: Tue, 28 Nov 2023 11:05:49 +0100
In-Reply-To: <20231127111359.30315-2-laurent.pinchart@ideasonboard.com>
References: <20231127111359.30315-1-laurent.pinchart@ideasonboard.com>
	 <20231127111359.30315-2-laurent.pinchart@ideasonboard.com>
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
> The subdev .[gs]_frame_interval are video operations, but they operate
> on pads (and even on streams). Not only is this confusing, it causes
> practical issues for drivers as the operations don't receive a subdev
> state pointer, requiring manual state handling.
>=20
> To improve the situation, turn the operations into pad operations, and
> extend them to receive a state pointer like other pad operations.
>=20
> While at it, rename the operations to .[gs]et_frame_interval at the same
> time to match the naming scheme of other pad operations. This isn't
> strictly necessary, but given that all drivers using those operations
> need to be modified, handling the rename separately would generate more
> churn for very little gain (if at all).
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de> # for imx-media

regards
Philipp

