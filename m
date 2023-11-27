Return-Path: <linux-media+bounces-1076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E67A17F9CEB
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 10:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2385B1C20C96
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 09:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4991775A;
	Mon, 27 Nov 2023 09:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC193125
	for <linux-media@vger.kernel.org>; Mon, 27 Nov 2023 01:48:57 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7YEa-0005Mr-78; Mon, 27 Nov 2023 10:48:56 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7YET-00BuXP-I6; Mon, 27 Nov 2023 10:48:49 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1r7YET-0006As-1V;
	Mon, 27 Nov 2023 10:48:49 +0100
Message-ID: <2725e6d206e2bbab589baf9191ec8b8707d52d2b.camel@pengutronix.de>
Subject: Re: [PATCH v4 1/1] media: v4l2-subdev: Rename .init_cfg() operation
 to .init_state()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Lars-Peter Clausen <lars@metafoo.de>, Tomi
 Valkeinen <tomi.valkeinen@ideasonboard.com>, Martin Kepplinger
 <martink@posteo.de>, Ricardo Ribalda <ribalda@kernel.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Michael Riesch <michael.riesch@wolfvision.net>, Jacopo Mondi
 <jacopo@jmondi.org>, Bingbu Cao <bingbu.cao@intel.com>, Rui Miguel Silva
 <rmfrfs@gmail.com>, Hans de Goede <hansg@kernel.org>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Steve Longerbeam <slongerbeam@gmail.com>,
 Nicholas Roth <nicholas@rothemail.net>, Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>, Sylvain Petinot
 <sylvain.petinot@foss.st.com>, Tim Harvey <tharvey@gateworks.com>, Maxime
 Ripard <mripard@kernel.org>, Eugen Hristev <eugen.hristev@collabora.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Dafna Hirschfeld
 <dafna@fastmail.com>,  Yong Deng <yong.deng@magewell.com>, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>, Benoit Parrot
 <bparrot@ti.com>, Shuah Khan <skhan@linuxfoundation.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 27 Nov 2023 10:48:49 +0100
In-Reply-To: <20231127090744.30012-2-laurent.pinchart@ideasonboard.com>
References: <20231127090744.30012-1-laurent.pinchart@ideasonboard.com>
	 <20231127090744.30012-2-laurent.pinchart@ideasonboard.com>
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

Hi Laurent,

On Mo, 2023-11-27 at 11:07 +0200, Laurent Pinchart wrote:
> The subdev .init_cfg() operation is affected by two issues:
>=20
> - It has long been extended to initialize a whole v4l2_subdev_state
>   instead of just a v4l2_subdev_pad_config, but its name has stuck
>   around.
>=20
> - Despite operating on a whole subdev state and not being directly
>   exposed to the subdev users (either in-kernel or through the userspace
>   API), .init_cfg() is categorized as a subdev pad operation.
>=20
> This participates in making the subdev API confusing for new developers.
> Fix it by renaming the operation to .init_state(), and make it a subdev
> internal operation.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Michael Riesch <michael.riesch@wolfvision.net> # for imx415
> Acked-by: Shuah Khan <skhan@linuxfoundation.org> # for vimc

Thank you for cleaning this up,


Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp


