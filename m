Return-Path: <linux-media+bounces-34267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE59AD061B
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 17:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E37EF16D1AF
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 15:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A41289825;
	Fri,  6 Jun 2025 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GphpJ9oc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C35C13DBA0;
	Fri,  6 Jun 2025 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224833; cv=none; b=RxSFoXpaIkPU7uzIQ1Pwq/6LjuBB7SWowFWbnXVDcJk6DtprRJNGhAm6uzy59QSyygJmIxYl8bg94SMZCxY1/03Yhliz7NKdbzaTC+U7RimVfFTuMkDTEHjDqbJQJqfDdpKjX9es4EMr9uiC1z5hLGQi6RMCIWSUaVca03mfUMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224833; c=relaxed/simple;
	bh=RdiDBtVhuf4nlhpFoArx/0tGuceAeEnMRGYWVVGgEW8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tvK58hcs+pOLzdyT25tWG7pgANJEdFFgW09g9b1yr3obalDe+Xl/RgjbZtUzuBMReBXtYBAlAxixLoKhqrm7QHVWF1VGEFp7fOD9pU0mvsym0AVS03KxwRADjIHr2ezMn6zc8jvkh6uEflPm8aFFKMGqsk7eNzoMlKYXofKNk54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GphpJ9oc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.localdomain (cpc90716-aztw32-2-0-cust408.18-1.cable.virginm.net [86.26.101.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A74A8DB;
	Fri,  6 Jun 2025 17:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749224824;
	bh=RdiDBtVhuf4nlhpFoArx/0tGuceAeEnMRGYWVVGgEW8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GphpJ9ocRRaSKmBGaMe0GY9T6CO1Vr1c30fqd1NVudiCktufhnnq7f2rRPh2/hAxF
	 8DvNnG5L25nYfAg8FnDOBMJXOQGZy9iAs6aoMq0rfQZIYt+XYxoJk9T+MMkiXM004e
	 +R3mMgu+29H29kJnrlqV3LEhgSd8rdxh2HOlEZqQ=
Message-ID: <8e950dd3c54a363d8e2d7252e3f3d93301076b50.camel@ideasonboard.com>
Subject: Re: [PATCH 1/2] media: platform: Refactor interrupt status registers
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, laurent.pinchart@ideasonboard.com
Cc: kieran.bingham@ideasonboard.com, martink@posteo.de, kernel@puri.sm, 
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 06 Jun 2025 16:47:04 +0100
In-Reply-To: <DAFI37JD827I.KWPZ7XCTWPBD@linaro.com>
References: <20250606121403.498153-1-isaac.scott@ideasonboard.com>
	 <20250606121403.498153-2-isaac.scott@ideasonboard.com>
	 <DAFI37JD827I.KWPZ7XCTWPBD@linaro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Rui,

On Fri, 2025-06-06 at 14:56 +0100, Rui Miguel Silva wrote:
> Hey Isaac,
> Thanks for the patch.
>=20
> On Fri Jun 6, 2025 at 1:14 PM WEST, Isaac Scott wrote:
>=20
> > The NXP i.MX 8 MP CSI-2 receiver features multiple interrupt and
> > debug
> > status sources which span multiple registers. The driver currently
> > supports two interrupt source registers, and attributes the
> > mipi_csis_event event entries to those registers through a boolean
> > debug
> > field that indicate if the event relates to the main interrupt
> > status
> > (false) or debug interrupt status (true) register. To make it
> > easier to
> > add new event fields, replace the debug bool with a 'status index'
> > integer than indicates the index of the corresponding status
> > register.
> >=20
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> > =C2=A0drivers/media/platform/nxp/imx-mipi-csis.c | 64 +++++++++++------=
-
> > ----
> > =C2=A01 file changed, 31 insertions(+), 33 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c
> > b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index d060eadebc7a..bbc549c22aff 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -249,7 +249,7 @@
> > =C2=A0#define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
> > =C2=A0
> > =C2=A0struct mipi_csis_event {
> > -	bool debug;
> > +	unsigned int status_index;
> > =C2=A0	u32 mask;
> > =C2=A0	const char * const name;
> > =C2=A0	unsigned int counter;
> > @@ -257,30 +257,30 @@ struct mipi_csis_event {
> > =C2=A0
> > =C2=A0static const struct mipi_csis_event mipi_csis_events[] =3D {
> > =C2=A0	/* Errors */
> > -	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT
> > Error" },
> > -	{ false,
> > MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
> > -	{ false,
> > MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
> > -	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO
> > Overflow Error" },
> > -	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong
> > Configuration Error" },
> > -	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC
> > Error" },
> > -	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC
> > Error" },
> > -	{ false,
> > MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
> > -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type
> > Not Supported" },
> > -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type
> > Ignored" },
> > -	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame
> > Size Error" },
> > -	{ true,
> > MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame" },
> > -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,	"Early
> > Frame End" },
> > -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,	"Early
> > Frame Start" },
> > +	{ 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT
> > Error"},
>=20
> Maybe instead of 0,1,2 (magic indexes)... we could give a meaningful
> index
> enums names, don't know, like: main, debug, user??? or something that
> you think is better.

Thanks for the review! I have updated v2 to include an enum instead of
magic numbers.

Best wishes,

Isaac

>=20
> Cheers,
> =C2=A0=C2=A0=C2=A0 Rui
>=20
> > +	{ 0, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost
> > Frame Start Error"},
> > +	{ 0, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost
> > Frame End Error"},
> > +	{ 0, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO
> > Overflow Error"},
> > +	{ 0, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,		"Wrong
> > Configuration Error"},
> > +	{ 0,
> > MIPI_CSIS_INT_SRC_ERR_ECC,			"ECC Error"},
> > +	{ 0,
> > MIPI_CSIS_INT_SRC_ERR_CRC,			"CRC Error"},
> > +	{ 0, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown
> > Error"},
> > +	{ 1, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type
> > Not Supported"},
> > +	{ 1, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,		"Data Type
> > Ignored"},
> > +	{ 1, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame
> > Size Error"},
> > +	{ 1, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated
> > Frame"},
> > +	{ 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,		"Early
> > Frame End"},
> > +	{ 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,		"Early
> > Frame Start"},
> > =C2=A0	/* Non-image data receive events */
> > -	{ false,
> > MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame" },
> > -	{ false, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image
> > data after even frame" },
> > -	{ false, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image
> > data before odd frame" },
> > -	{ false, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image
> > data after odd frame" },
> > +	{ 0, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image
> > data before even frame"},
> > +	{ 0, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image
> > data after even frame"},
> > +	{ 0, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image
> > data before odd frame"},
> > +	{ 0, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image
> > data after odd frame"},
> > =C2=A0	/* Frame start/end */
> > -	{ false,
> > MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start" },
> > -	{ false, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame
> > End" },
> > -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC
> > Falling Edge" },
> > -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC
> > Rising Edge" },
> > +	{ 0, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame
> > Start"},
> > +	{ 0, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame
> > End"},
> > +	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC
> > Falling Edge"},
> > +	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC
> > Rising Edge"},
> > =C2=A0};
> > =C2=A0
> > =C2=A0#define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
> > @@ -765,32 +765,30 @@ static irqreturn_t mipi_csis_irq_handler(int
> > irq, void *dev_id)
> > =C2=A0	struct mipi_csis_device *csis =3D dev_id;
> > =C2=A0	unsigned long flags;
> > =C2=A0	unsigned int i;
> > -	u32 status;
> > -	u32 dbg_status;
> > +	u32 status[2];
> > =C2=A0
> > -	status =3D mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
> > -	dbg_status =3D mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
> > +	status[0] =3D mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
> > +	status[1] =3D mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
> > =C2=A0
> > =C2=A0	spin_lock_irqsave(&csis->slock, flags);
> > =C2=A0
> > =C2=A0	/* Update the event/error counters */
> > -	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis-
> > >debug.enable) {
> > +	if ((status[0] & MIPI_CSIS_INT_SRC_ERRORS) || csis-
> > >debug.enable) {
> > =C2=A0		for (i =3D 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
> > =C2=A0			struct mipi_csis_event *event =3D &csis-
> > >events[i];
> > =C2=A0
> > -			if ((!event->debug && (status & event-
> > >mask)) ||
> > -			=C2=A0=C2=A0=C2=A0 (event->debug && (dbg_status & event-
> > >mask)))
> > +			if (status[event->status_index] & event-
> > >mask)
> > =C2=A0				event->counter++;
> > =C2=A0		}
> > =C2=A0	}
> > =C2=A0
> > -	if (status & MIPI_CSIS_INT_SRC_FRAME_START)
> > +	if (status[0] & MIPI_CSIS_INT_SRC_FRAME_START)
> > =C2=A0		mipi_csis_queue_event_sof(csis);
> > =C2=A0
> > =C2=A0	spin_unlock_irqrestore(&csis->slock, flags);
> > =C2=A0
> > -	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status);
> > -	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, dbg_status);
> > +	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status[0]);
> > +	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, status[1]);
> > =C2=A0
> > =C2=A0	return IRQ_HANDLED;
> > =C2=A0}
> > --=20
> > 2.43.0
>=20
>=20

