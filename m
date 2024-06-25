Return-Path: <linux-media+bounces-14104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E307916708
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 14:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 389831C20DD6
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2024 12:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD208153567;
	Tue, 25 Jun 2024 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K++g1zpq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8519E14E2D4
	for <linux-media@vger.kernel.org>; Tue, 25 Jun 2024 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719317494; cv=none; b=MVp8IwukM3AjA2C9Z0me8KPPFgrtDFCMQO70aUpwQCU2NhnvN+JLeMRsWreCyqee4jEYavJpa4+j64zHElfo4vhPA1WcfQZMAEwee2ADRKrVxai9SiDT8+LI6jabe5L5aobUfNlISojZdXmIV3EN+wZ76Z5+J8p27wUHNr0XCsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719317494; c=relaxed/simple;
	bh=lL3ptC0xNt0qRIxUY7elzoGQ04HB1YR5tASen7J7tKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ygyg/9FqYDVIlD5xXknO7f3V6YxBMdw0zW2J5XQojPATHaM/IEdpRPVcXjgEAhwhoyi0X0DWEeMZwWMwLh/O8dl+8XTaUmzH2JYNvjw6xnlHjb2FkDOyRgu2Oa0mGUrfBzxCVQ8aSFBjorxyncECUn0uHLmyFd9N5scHxVdCgZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K++g1zpq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBA0C7E0;
	Tue, 25 Jun 2024 14:11:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719317468;
	bh=lL3ptC0xNt0qRIxUY7elzoGQ04HB1YR5tASen7J7tKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K++g1zpqeNbjRoFm5zJoaTPUQI3eWx/Q/4KmWrqhng8RB0pkZv+p8k7W7AU+K8IBV
	 UI9Yjhl91BwW/wIRQqztf02a4g1xO+vnVtVYT2Yfhm2rNxjoPoD81w8DqmUaTWGi2W
	 jSghnKvC/tMaamHIZN3b5rWwIUl6XDY5X+jNZClc=
Date: Tue, 25 Jun 2024 14:11:27 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, 
	David Plowman <david.plowman@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v9 3/8] media: uapi: Add Raspberry Pi PiSP Back End uAPI
Message-ID: <sryvilbnktnxwq5ww3ihfwclst5wxf3pqytbrmau7cl5peszfh@mxj7phhsolfx>
References: <20240531080707.34568-1-jacopo.mondi@ideasonboard.com>
 <20240531080707.34568-4-jacopo.mondi@ideasonboard.com>
 <baeb2085-1db2-4eb0-a399-a5a35672801c@xs4all.nl>
 <eg2k2zjqw5n65zdp33zpzpli5qrvtrsj5yykkn5e7wukoap5uv@adcsxiffppbg>
 <cb4763da-a5e3-4c95-9233-28605e0cbef2@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cb4763da-a5e3-4c95-9233-28605e0cbef2@xs4all.nl>

Hi Hans

On Tue, Jun 25, 2024 at 01:56:46PM GMT, Hans Verkuil wrote:
> On 6/25/24 13:15, Jacopo Mondi wrote:
> > Hello again,
> >
> > On Mon, Jun 24, 2024 at 03:52:41PM GMT, Hans Verkuil wrote:
> >> Hi Jacopo,
> >>
> >> On 31/05/2024 10:07, Jacopo Mondi wrote:
> >>> Add the Raspberry Pi PiSP Back End uAPI header.
> >>>
> >>> The header defines the data type used to configure the PiSP Back End
> >>> ISP.
> >>>
> >>> The detailed description of the types and of the ISP configuration
> >>> procedure is available at
> >>> https://datasheets.raspberrypi.com/camera/raspberry-pi-image-signal-processor-specification.pdf
> >>>
> >>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >>> ---
> >>>  MAINTAINERS                                   |   7 +
> >>>  .../linux/media/raspberrypi/pisp_be_config.h  | 927 ++++++++++++++++++
> >>>  .../linux/media/raspberrypi/pisp_common.h     | 199 ++++
> >>>  3 files changed, 1133 insertions(+)
> >>>  create mode 100644 include/uapi/linux/media/raspberrypi/pisp_be_config.h
> >>>  create mode 100644 include/uapi/linux/media/raspberrypi/pisp_common.h
> >>>
> >>
> >> <snip>
> >>
> >>> diff --git a/include/uapi/linux/media/raspberrypi/pisp_be_config.h b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> >>> new file mode 100644
> >>> index 000000000000..3eb4be03c5f4
> >>> --- /dev/null
> >>> +++ b/include/uapi/linux/media/raspberrypi/pisp_be_config.h
> >>> @@ -0,0 +1,927 @@
> >>
> >> <snip>
> >>
> >>> +/**
> >>> + * struct pisp_be_tiles_config - Raspberry Pi PiSP Back End configuration
> >>> + * @tiles:	Tile descriptors
> >>> + * @num_tiles:	Number of tiles
> >>> + * @config:	PiSP Back End configuration
> >>> + */
> >>> +struct pisp_be_tiles_config {
> >>> +	struct pisp_tile tiles[PISP_BACK_END_NUM_TILES];
> >>> +	int num_tiles;
> >>
> >> Everything else is nicely __u8/16/32, and then there is suddenly an 'int'
> >> where I would expect to see a __u32.
> >>
> >> I think a v10 is needed anyway (see next review), so it would be nice to
> >> pick up this change for v10.
> >
> > Sure I can change it.
> >
> > While at it I passed ' struct pisp_be_tiles_config' through pahole.
> >
> > struct pisp_be_tiles_config {
> > 	struct pisp_tile           tiles[64];            /*     0 10240 */
> > 	/* --- cacheline 160 boundary (10240 bytes) --- */
> > 	__u32                      num_tiles;            /* 10240     4 */
> > 	struct pisp_be_config      config;               /* 10244  6276 */
> >
> > 	/* size: 16520, cachelines: 259, members: 3 */
> > 	/* last cacheline: 8 bytes */
> > };
> >
> > if 'config' gets accessed by pointer on aarch64 it will result in an
> > unaligned access ?
>
> Where do you see that? AFAICT it is perfectly fine to have
> a struct pisp_be_config pointer set to &foo.config.

'config' is at 10244 bytes from the struct beginning. If accessed as
u64 this is not 8-bytes aligned (which afaik is legit but more
expensive on aarch64). But as the driver accesses it as
32-bits integers:

	unsigned int begin, end;

	begin =	offsetof(struct pisp_be_config, global.bayer_order) /
		sizeof(u32);
	end = sizeof(struct pisp_be_config) / sizeof(u32);
	for (unsigned int u = begin; u < end; u++)
		pispbe_wr(pispbe, PISP_BE_CONFIG_BASE_REG + sizeof(u32) * u,
			  ((u32 *)job->config)[u]);

this should be fine yes

>
> Regards,
>
> 	Hans
>
> >
> > Do we need to insert a 32 bits padding between 'num_tiles' and
> > 'config' ?
> >
> >>
> >> Regards,
> >>
> >> 	Hans
> >>
> >>> +	struct pisp_be_config config;
> >>> +} __attribute__((packed));
> >>> +
> >>> +#endif /* _UAPI_PISP_BE_CONFIG_H_ */
> >>
>

