Return-Path: <linux-media+bounces-3408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 014C582864E
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 13:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F00E1C242AB
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 12:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F047381D1;
	Tue,  9 Jan 2024 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E/da+//D"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A08381CF
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCBFD124F;
	Tue,  9 Jan 2024 13:51:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1704804699;
	bh=F3hLV6ZdOADASI5Fm2tPa86du+s4AWrcW5E+3+hRSFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/da+//DncfVNQgPnThmG11kmDRK1ZFyFF+UMe42fHBxvscDJ8hl2U/SflVy9S3Zh
	 wGOpMu9CBBXokuLyhhlV92bBtl/x93iNZloRjGwZ1uGxKVeB1qvW2v1mqhiFaE1549
	 gJwGmxtLrFMsZwOwm8rHTtt/wYRqmZ7cskckLb8E=
Date: Tue, 9 Jan 2024 13:52:40 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: Re: [PATCH v2 2/4] media: imx334: Use v4l2_link_freq_to_bitmap
 helper
Message-ID: <uflo5tji6lw3km56il6hcu6isahfb3ytf5rgwz3k4vt5debpzv@bxjxs3yp3p2z>
References: <20240108075221.15757-1-sakari.ailus@linux.intel.com>
 <20240108075221.15757-3-sakari.ailus@linux.intel.com>
 <qw6gn2ayctlaeeuetjnr6uhgd6tyzetlc5lgop7cz56cije52d@qeadyecb3evp>
 <ZZ06A5XM8qsRct96@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZZ06A5XM8qsRct96@kekkonen.localdomain>

Hi Sakari

On Tue, Jan 09, 2024 at 12:20:19PM +0000, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Tue, Jan 09, 2024 at 12:56:44PM +0100, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Mon, Jan 08, 2024 at 09:52:19AM +0200, Sakari Ailus wrote:
> > > Use the v4l2_link_freq_to_bitmap() helper to figure out which
> > > driver-supported link frequencies can be used on a given system.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/i2c/imx334.c | 41 +++++++++++---------------------------
> > >  1 file changed, 12 insertions(+), 29 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > > index 6725b3e2a73e..40863d87d341 100644
> > > --- a/drivers/media/i2c/imx334.c
> > > +++ b/drivers/media/i2c/imx334.c
> > > @@ -136,7 +136,7 @@ struct imx334_mode {
> > >   * @vblank: Vertical blanking in lines
> > >   * @cur_mode: Pointer to current selected sensor mode
> > >   * @mutex: Mutex for serializing sensor controls
> > > - * @menu_skip_mask: Menu skip mask for link_freq_ctrl
> > > + * @link_freq_bitmap: Menu bitmap for link_freq_ctrl
> > >   * @cur_code: current selected format code
> > >   */
> > >  struct imx334 {
> > > @@ -158,7 +158,7 @@ struct imx334 {
> > >  	u32 vblank;
> > >  	const struct imx334_mode *cur_mode;
> > >  	struct mutex mutex;
> > > -	unsigned long menu_skip_mask;
> > > +	unsigned long link_freq_bitmap;
> > >  	u32 cur_code;
> > >  };
> > >
> > > @@ -954,9 +954,9 @@ static int imx334_init_state(struct v4l2_subdev *sd,
> > >  	imx334_fill_pad_format(imx334, imx334->cur_mode, &fmt);
> > >
> > >  	__v4l2_ctrl_modify_range(imx334->link_freq_ctrl, 0,
> > > -				 __fls(imx334->menu_skip_mask),
> > > -				 ~(imx334->menu_skip_mask),
> > > -				 __ffs(imx334->menu_skip_mask));
> > > +				 __fls(imx334->link_freq_bitmap),
> > > +				 ~(imx334->link_freq_bitmap),
> > > +				 __ffs(imx334->link_freq_bitmap));
> > >
> > >  	mutex_unlock(&imx334->mutex);
> > >
> > > @@ -1112,7 +1112,6 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
> > >  	};
> > >  	struct fwnode_handle *ep;
> > >  	unsigned long rate;
> > > -	unsigned int i, j;
> > >  	int ret;
> > >
> > >  	if (!fwnode)
> > > @@ -1157,26 +1156,10 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
> > >  		goto done_endpoint_free;
> > >  	}
> > >
> > > -	if (!bus_cfg.nr_of_link_frequencies) {
> > > -		dev_err(imx334->dev, "no link frequencies defined");
> > > -		ret = -EINVAL;
> > > -		goto done_endpoint_free;
> > > -	}
> > > -
> > > -	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> > > -		for (j = 0; j < ARRAY_SIZE(link_freq); j++) {
> > > -			if (bus_cfg.link_frequencies[i] == link_freq[j]) {
> > > -				set_bit(j, &imx334->menu_skip_mask);
> > > -				break;
> > > -			}
> > > -		}
> > > -
> > > -		if (j == ARRAY_SIZE(link_freq)) {
> > > -			ret = dev_err_probe(imx334->dev, -EINVAL,
> > > -					    "no supported link freq found\n");
> > > -			goto done_endpoint_free;
> > > -		}
> > > -	}
> > > +	ret = v4l2_link_freq_to_bitmap(imx334->dev, bus_cfg.link_frequencies,
> > > +				       bus_cfg.nr_of_link_frequencies,
> > > +				       link_freq, ARRAY_SIZE(link_freq),
> > > +				       &imx334->link_freq_bitmap);
> > >
> > >  done_endpoint_free:
> > >  	v4l2_fwnode_endpoint_free(&bus_cfg);
> > > @@ -1310,8 +1293,8 @@ static int imx334_init_controls(struct imx334 *imx334)
> > >  	imx334->link_freq_ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr,
> > >  							&imx334_ctrl_ops,
> > >  							V4L2_CID_LINK_FREQ,
> > > -							__fls(imx334->menu_skip_mask),
> > > -							__ffs(imx334->menu_skip_mask),
> > > +							__fls(imx334->link_freq_bitmap),
> > > +							__ffs(imx334->link_freq_bitmap),
> >
> > How does this work if
> >
> > driver_freqs = {
> >         FREQ1,
> >         FREQ2,
> >         FREQ3,
> >         FREQ4
> > };
> >
> > fw_freqs = {
> >         FREQ2,
> >         FREQ4
> > };
> >
> > Will FREQ3 be selectable by userspace ?
>
> That's a good question. Drivers that support more than two frequencies
> should use v4l2_ctrl_modify_range() to provide a bitmap of supported
> frequencies, v4l2_ctrl_new_int_menu() doesn't have an argument for that.
>
> Maybe we could add one? :-)
>

How would you feel about v4l2_link_freq_to_bitmap() returning an s64[]
instead so that the caller can pass it to v4l2_ctrl_new_int_menu()
directly ? I know, the driver wuold then need to remember to release
it, which is not an ideal pattern (allocate in the core, release in
the driver).

Alternatively, could v4l2_fwnode_endpoint_alloc_parse() be passed the
list of driver supported frequencies and store in vep->link_frequencies[]
the intersection between the driver and firmware frequencies ? After
all, the _alloc_parse() version of v4l2_fwnode_endpoint_parse() it's
only there to support link_frequencies parsing, hence passing to it the
driver's supported frequencies might not look that weird...

> >
> > >  							link_freq);
> > >
> > >  	if (imx334->link_freq_ctrl)
> > > @@ -1386,7 +1369,7 @@ static int imx334_probe(struct i2c_client *client)
> > >  	}
> > >
> > >  	/* Set default mode to max resolution */
> > > -	imx334->cur_mode = &supported_modes[__ffs(imx334->menu_skip_mask)];
> > > +	imx334->cur_mode = &supported_modes[__ffs(imx334->link_freq_bitmap)];
> > >  	imx334->cur_code = imx334_mbus_codes[0];
> > >  	imx334->vblank = imx334->cur_mode->vblank;
> > >
>
> --
> Regards,
>
> Sakari Ailus

