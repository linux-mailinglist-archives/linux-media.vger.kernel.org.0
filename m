Return-Path: <linux-media+bounces-14101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8903D9165F0
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 13:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42FEB285D7C
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 11:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F0A6CDBA;
	Tue, 25 Jun 2024 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wQ+k+u/O"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C930E149C4F
	for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 11:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719314112; cv=none; b=CxLDEAMil2JiFEQUESxdaZjeb5LFRst+YhZb7Tb3EfFtzaY0NCs0Kwh7JNlZzfEBELiFltAT0+vyYHUA17ORb7Cyoa/HYmvk7P5gbX+0LBOTo6cetfHsv2dhodSrRVKQmjZXmxk/rd4oA+N0yTM/Ex6Vs6WaRR7D6YcYmFZ2M1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719314112; c=relaxed/simple;
	bh=DdRX2irNgLa7ijHaNxUaWqOjDCdWjlK1zIw+FAvFWQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGV+FufyuO+FGTSCUckZFx+D/6tVoArV8myOf9M5iqRSEDBQGxmVt8JcjBPsKhmR0Kj1Ts4Efd/KzHZv0OrnmJI5If/z+7Kjxm1HZTZCl4vU4w/l0zzsoqiy0uoxpVjs7hTFmRKuLaq/vnZAv2R3bz9oQqb1lihTAHK0VqIVSys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wQ+k+u/O; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F1908C62;
	Tue, 25 Jun 2024 13:14:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719314086;
	bh=DdRX2irNgLa7ijHaNxUaWqOjDCdWjlK1zIw+FAvFWQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wQ+k+u/OAIWwYip6lAkDOtsfR09tDGBZ6m3pqoCsYIgga7WExvX6rBw79SLFoliGT
	 DXt21qfsFQlBmRNwhNPiF5QPUFXxwFrYWNltEw46UfgpiVtfIpYJez5AjJBERTVbsh
	 VQHXoANT2ZExaBln2KO+72KaUuMi+D4SZ7wg8+6U=
Date: Tue, 25 Jun 2024 13:15:05 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, David Plowman <david.plowman@raspberrypi.com>, 
	Naushir Patuck <naush@raspberrypi.com>, Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v9 3/8] media: uapi: Add Raspberry Pi PiSP Back End uAPI
Message-ID: <eg2k2zjqw5n65zdp33zpzpli5qrvtrsj5yykkn5e7wukoap5uv@adcsxiffppbg>
References: <20240531080707.34568-1-jacopo.mondi@ideasonboard.com>
 <20240531080707.34568-4-jacopo.mondi@ideasonboard.com>
 <baeb2085-1db2-4eb0-a399-a5a35672801c@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <baeb2085-1db2-4eb0-a399-a5a35672801c@xs4all.nl>

Hello again,

On Mon, Jun 24, 2024 at 03:52:41PM GMT, Hans Verkuil wrote:
> Hi Jacopo,
>
> On 31/05/2024 10:07, Jacopo Mondi wrote:
> > Add the Raspberry Pi PiSP Back End uAPI header.
> >
> > The header defines the data type used to configure the PiSP Back End
> > ISP.
> >
> > The detailed description of the types and of the ISP configuration
> > procedure is available at
> > https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  MAINTAINERS                                   |   7 +
> >  .../linux/media/raspberrypi/pisp_be_config.h  | 927 ++++++++++++++++++
> >  .../linux/media/raspberrypi/pisp_common.h     | 199 ++++
> >  3 files changed, 1133 insertions(+)
> >  create mode 100644 include/uapi/linux/media/raspberrypi/pisp_be_config.h
> >  create mode 100644 include/uapi/linux/media/raspberrypi/pisp_common.h
> >
>
> <snip>
>
> > diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> > new file mode 100644
> > index 000000000000..3eb4be03c5f4
> > --- /dev/null
> > +++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> > @@ -0,0 +1,927 @@
>
> <snip>
>
> > +/**
> > + * struct pisp_be_tiles_config - Raspberry Pi PiSP Back End configuration
> > + * @tiles:	Tile descriptors
> > + * @num_tiles:	Number of tiles
> > + * @config:	PiSP Back End configuration
> > + */
> > +struct pisp_be_tiles_config {
> > +	struct pisp_tile tiles[PISP_BACK_END_NUM_TILES];
> > +	int num_tiles;
>
> Everything else is nicely __u8/16/32, and then there is suddenly an 'int'
> where I would expect to see a __u32.
>
> I think a v10 is needed anyway (see next review), so it would be nice to
> pick up this change for v10.

Sure I can change it.

While at it I passed ' struct pisp_be_tiles_config' through pahole.

struct pisp_be_tiles_config {
	struct pisp_tile           tiles[64];            /*     0 10240 */
	/* --- cacheline 160 boundary (10240 bytes) --- */
	__u32                      num_tiles;            /* 10240     4 */
	struct pisp_be_config      config;               /* 10244  6276 */

	/* size: 16520, cachelines: 259, members: 3 */
	/* last cacheline: 8 bytes */
};

if 'config' gets accessed by pointer on aarch64 it will result in an
unaligned access ?

Do we need to insert a 32 bits padding between 'num_tiles' and
'config' ?

>
> Regards,
>
> 	Hans
>
> > +	struct pisp_be_config config;
> > +} __attribute__((packed));
> > +
> > +#endif /* _UAPI_PISP_BE_CONFIG_H_ */
>

