Return-Path: <linux-media+bounces-3397-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 902808285F4
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 13:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B347286D7B
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 12:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD38381B8;
	Tue,  9 Jan 2024 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4YkydAQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A247F374FE
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704802824; x=1736338824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kjOgpjLcfgoZEHFikoHeimc/0apIUQsjiudh7bP/lfU=;
  b=U4YkydAQ5AoC7T6CEWQZleRXJC6gBGPK0d9EUk3biMrUl/Ap0LwcKsFb
   AnXvEdXpDPKxpDrS0mN7eZAil+zHTxMdbTam3aF3gEQQkdjVOQ+glP8aq
   6cW/1tbmEQLzom7/a0RAJ/E8lnQU9+rmzn8itoKWdgs9qlhChf9bZf65N
   Fq5y/yWcCni8eJx9ViucFFC1v3VoKkq/TrV9dkdLF5515v0PJHYN7AFxO
   0kb20f+yCw5ou+78H32A4dWdsOgfDDzgub4SZVcqDF+23nsQaY6g1H+DM
   aRiusOlwU6wMPDQcI/z7XQFc8/yg94bKa4MHjMpc4kak10WcxQ8P1SBvG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="464578956"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="464578956"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 04:20:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="925252315"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="925252315"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 04:20:21 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 378EB11F913;
	Tue,  9 Jan 2024 14:20:19 +0200 (EET)
Date: Tue, 9 Jan 2024 12:20:19 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v2 2/4] media: imx334: Use v4l2_link_freq_to_bitmap helper
Message-ID: <ZZ06A5XM8qsRct96@kekkonen.localdomain>
References: <20240108075221.15757-1-sakari.ailus@linux.intel.com>
 <20240108075221.15757-3-sakari.ailus@linux.intel.com>
 <qw6gn2ayctlaeeuetjnr6uhgd6tyzetlc5lgop7cz56cije52d@qeadyecb3evp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qw6gn2ayctlaeeuetjnr6uhgd6tyzetlc5lgop7cz56cije52d@qeadyecb3evp>

Hi Jacopo,

On Tue, Jan 09, 2024 at 12:56:44PM +0100, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Mon, Jan 08, 2024 at 09:52:19AM +0200, Sakari Ailus wrote:
> > Use the v4l2_link_freq_to_bitmap() helper to figure out which
> > driver-supported link frequencies can be used on a given system.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/imx334.c | 41 +++++++++++---------------------------
> >  1 file changed, 12 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > index 6725b3e2a73e..40863d87d341 100644
> > --- a/drivers/media/i2c/imx334.c
> > +++ b/drivers/media/i2c/imx334.c
> > @@ -136,7 +136,7 @@ struct imx334_mode {
> >   * @vblank: Vertical blanking in lines
> >   * @cur_mode: Pointer to current selected sensor mode
> >   * @mutex: Mutex for serializing sensor controls
> > - * @menu_skip_mask: Menu skip mask for link_freq_ctrl
> > + * @link_freq_bitmap: Menu bitmap for link_freq_ctrl
> >   * @cur_code: current selected format code
> >   */
> >  struct imx334 {
> > @@ -158,7 +158,7 @@ struct imx334 {
> >  	u32 vblank;
> >  	const struct imx334_mode *cur_mode;
> >  	struct mutex mutex;
> > -	unsigned long menu_skip_mask;
> > +	unsigned long link_freq_bitmap;
> >  	u32 cur_code;
> >  };
> >
> > @@ -954,9 +954,9 @@ static int imx334_init_state(struct v4l2_subdev *sd,
> >  	imx334_fill_pad_format(imx334, imx334->cur_mode, &fmt);
> >
> >  	__v4l2_ctrl_modify_range(imx334->link_freq_ctrl, 0,
> > -				 __fls(imx334->menu_skip_mask),
> > -				 ~(imx334->menu_skip_mask),
> > -				 __ffs(imx334->menu_skip_mask));
> > +				 __fls(imx334->link_freq_bitmap),
> > +				 ~(imx334->link_freq_bitmap),
> > +				 __ffs(imx334->link_freq_bitmap));
> >
> >  	mutex_unlock(&imx334->mutex);
> >
> > @@ -1112,7 +1112,6 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
> >  	};
> >  	struct fwnode_handle *ep;
> >  	unsigned long rate;
> > -	unsigned int i, j;
> >  	int ret;
> >
> >  	if (!fwnode)
> > @@ -1157,26 +1156,10 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
> >  		goto done_endpoint_free;
> >  	}
> >
> > -	if (!bus_cfg.nr_of_link_frequencies) {
> > -		dev_err(imx334->dev, "no link frequencies defined");
> > -		ret = -EINVAL;
> > -		goto done_endpoint_free;
> > -	}
> > -
> > -	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {
> > -		for (j = 0; j < ARRAY_SIZE(link_freq); j++) {
> > -			if (bus_cfg.link_frequencies[i] == link_freq[j]) {
> > -				set_bit(j, &imx334->menu_skip_mask);
> > -				break;
> > -			}
> > -		}
> > -
> > -		if (j == ARRAY_SIZE(link_freq)) {
> > -			ret = dev_err_probe(imx334->dev, -EINVAL,
> > -					    "no supported link freq found\n");
> > -			goto done_endpoint_free;
> > -		}
> > -	}
> > +	ret = v4l2_link_freq_to_bitmap(imx334->dev, bus_cfg.link_frequencies,
> > +				       bus_cfg.nr_of_link_frequencies,
> > +				       link_freq, ARRAY_SIZE(link_freq),
> > +				       &imx334->link_freq_bitmap);
> >
> >  done_endpoint_free:
> >  	v4l2_fwnode_endpoint_free(&bus_cfg);
> > @@ -1310,8 +1293,8 @@ static int imx334_init_controls(struct imx334 *imx334)
> >  	imx334->link_freq_ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr,
> >  							&imx334_ctrl_ops,
> >  							V4L2_CID_LINK_FREQ,
> > -							__fls(imx334->menu_skip_mask),
> > -							__ffs(imx334->menu_skip_mask),
> > +							__fls(imx334->link_freq_bitmap),
> > +							__ffs(imx334->link_freq_bitmap),
> 
> How does this work if
> 
> driver_freqs = {
>         FREQ1,
>         FREQ2,
>         FREQ3,
>         FREQ4
> };
> 
> fw_freqs = {
>         FREQ2,
>         FREQ4
> };
> 
> Will FREQ3 be selectable by userspace ?

That's a good question. Drivers that support more than two frequencies
should use v4l2_ctrl_modify_range() to provide a bitmap of supported
frequencies, v4l2_ctrl_new_int_menu() doesn't have an argument for that.

Maybe we could add one? :-)

> 
> >  							link_freq);
> >
> >  	if (imx334->link_freq_ctrl)
> > @@ -1386,7 +1369,7 @@ static int imx334_probe(struct i2c_client *client)
> >  	}
> >
> >  	/* Set default mode to max resolution */
> > -	imx334->cur_mode = &supported_modes[__ffs(imx334->menu_skip_mask)];
> > +	imx334->cur_mode = &supported_modes[__ffs(imx334->link_freq_bitmap)];
> >  	imx334->cur_code = imx334_mbus_codes[0];
> >  	imx334->vblank = imx334->cur_mode->vblank;
> >

-- 
Regards,

Sakari Ailus

