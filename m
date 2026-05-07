Return-Path: <linux-media+bounces-60802-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMAVFZ6S/Gn3RQAAu9opvQ
	(envelope-from <linux-media+bounces-60802-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:24:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDEF4E933D
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7DD54301F22F
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CC03F660E;
	Thu,  7 May 2026 13:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q8Q6ufIc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EC53EBF36
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 13:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159988; cv=none; b=RNg2harQ4Qsy6f7zLhOtub4J2rdyFWpmqtaPPeNBpR447/oJ10zy2VoEYgOkLNDIpKxdYhizcT2Gi2EIVRj94NMMSn+vudLusgRD4Xg6NIpFvOKML2fQh5mVR4kG7v2IWPpI4hAhxTlRtQs4sAQMnQI2WP3sRjY1Ampe2L/TCsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159988; c=relaxed/simple;
	bh=PO6kVfaJ8rg4S08XC2QvTp1o9VtWDjOu7TJBo24hH6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+vokGSFMZ10zistogbzH2eUxLGN2Hd3EgHhCQbSAxfnKeJ1eAd3F5jNgAETe6WBmrdSTNMnw5sx0KEO8VxAQSHaMTs/rSU+ezooPTyz/IcoqQImdZg7Ny2e4/vbCaCT5+WN/kNf1uuLyp5WZ8S239u1eaz2Ul7EZ+BrWB3DJDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q8Q6ufIc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD25E9CE;
	Thu,  7 May 2026 15:19:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778159978;
	bh=PO6kVfaJ8rg4S08XC2QvTp1o9VtWDjOu7TJBo24hH6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q8Q6ufIcByFNCiqRhEZK3NNFFq+q/Z3+R6sH7pKc1kqsT363OKVA5szlOc4zPE82F
	 5mTblq/aitKqsQwhbi80Nm2uMMuEHLKyo56b1SdXdRpA5XqKUbK/s31QcLHO7oEwhH
	 Zai8qjHo4l7Gab+H4TeWO4qhcOced/xgY5XOA8c0=
Date: Thu, 7 May 2026 16:19:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: arash golgol <arash.golgol@gmail.com>, linux-media@vger.kernel.org,
	mchehab@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, linux-sunxi@lists.linux.dev,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v3] media: sun6i-mipi-csi2: Use V4L2 subdev active state
Message-ID: <20260507131941.GD1938994@killaraus.ideasonboard.com>
References: <20260214050943.6306-1-arash.golgol@gmail.com>
 <CAMxPZkhkjqd2Y91TUpZsTJT2SppPqLrQpdYi5LWmzM8tLxV8Tg@mail.gmail.com>
 <aejCrrf_XA7CkINS@shepard>
 <20260424144227.GA3182467@killaraus.ideasonboard.com>
 <afx_KO5aRXgqwS66@collins>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afx_KO5aRXgqwS66@collins>
X-Rspamd-Queue-Id: 5CDEF4E933D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,sholland.org,lists.linux.dev,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-60802-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 02:01:44PM +0200, Paul Kocialkowski wrote:
> Le Fri 24 Apr 26, 17:42, Laurent Pinchart a écrit :
> > On Wed, Apr 22, 2026 at 02:44:30PM +0200, Paul Kocialkowski wrote:
> > > On Wed 22 Apr 26, 08:23, arash golgol wrote:
> > > > I was hoping this patch would make its way into media-tree, but it seems
> > > > it hasn't been applied yet.
> > > > 
> > > > Is there anything missing or any modifications needed from my side?
> > > > I'd appreciate any feedback.
> > > 
> > > I would like to test this patch before it gets in, but didn't manage to find
> > > the time. The same should probably also apply to the a83t mipi csi-2 driver,
> > > which is structured the same way.
> > 
> > Do you think you would have time to test it in the next few weeks ? It
> > would be good to merge this for v7.2.
> 
> Finally took some time to test this patch and the sun6i-csi series.
> I must apologize again for the delay here.
> 
> Both series are working fine with my test setup (an Olimex S3-OLinuXino with
> a mipi csi-2 imx219 sensor).

Thank you for testing. Can we add a Tested-by tag ?

> > > > On Sat, Feb 14, 2026 at 8:40 AM Arash Golgol <arash.golgol@gmail.com> wrote:
> > > > >
> > > > > Use the V4L2 subdev active state API to store the active format.
> > > > > This simplifies the driver not only by dropping the bridge mbus_format
> > > > > field, but it also allows dropping the bridge lock, replaced with
> > > > > the state lock.
> > > > >
> > > > > The sun6i-mipi-csi2 hardware does not perform any format conversion.
> > > > > Enforce identical formats on the sink and source pads in the set_fmt()
> > > > > and init_state() callbacks.
> > > > >
> > > > > Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
> > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > ---
> > > > > Changes in v3:
> > > > >     - link to v2: https://patchwork.kernel.org/project/linux-media/patch/20260209055529.16644-1-arash.golgol@gmail.com/
> > > > >     - Keep error path jumping to error_v4l2_notifier_cleanup on
> > > > >     bridge setup failure
> > > > >
> > > > > Changes in v2:
> > > > >     - link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260206123455.46476-1-arash.golgol@gmail.com/
> > > > >     - Simplify control flow by dropping the else at end of s_stream()
> > > > >     - Call v4l2_subdev_cleanup() on bridge setup failure before
> > > > >     notifier registration
> > > > >
> > > > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 +++++++++---------
> > > > >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
> > > > >  2 files changed, 53 insertions(+), 56 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > > > > index b06cb73015cd..682bdd82098c 100644
> > > > > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > > > > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
> > > > > @@ -95,12 +95,12 @@ static void sun6i_mipi_csi2_disable(struct sun6i_mipi_csi2_device *csi2_dev)
> > > > >                            SUN6I_MIPI_CSI2_CTL_EN, 0);
> > > > >  }
> > > > >
> > > > > -static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi2_dev)
> > > > > +static void sun6i_mipi_csi2_configure(struct sun6i_mipi_csi2_device *csi2_dev,
> > > > > +                                      const struct v4l2_mbus_framefmt *mbus_format)
> > > > >  {
> > > > >         struct regmap *regmap = csi2_dev->regmap;
> > > > >         unsigned int lanes_count =
> > > > >                 csi2_dev->bridge.endpoint.bus.mipi_csi2.num_data_lanes;
> > > > > -       struct v4l2_mbus_framefmt *mbus_format = &csi2_dev->bridge.mbus_format;
> > > > >         const struct sun6i_mipi_csi2_format *format;
> > > > >         struct device *dev = csi2_dev->dev;
> > > > >         u32 version = 0;
> > > > > @@ -173,7 +173,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
> > > > >         struct v4l2_subdev *source_subdev = csi2_dev->bridge.source_subdev;
> > > > >         union phy_configure_opts dphy_opts = { 0 };
> > > > >         struct phy_configure_opts_mipi_dphy *dphy_cfg = &dphy_opts.mipi_dphy;
> > > > > -       struct v4l2_mbus_framefmt *mbus_format = &csi2_dev->bridge.mbus_format;
> > > > > +       struct v4l2_subdev_state *state;
> > > > > +       const struct v4l2_mbus_framefmt *mbus_format;
> > > > >         const struct sun6i_mipi_csi2_format *format;
> > > > >         struct phy *dphy = csi2_dev->dphy;
> > > > >         struct device *dev = csi2_dev->dev;
> > > > > @@ -183,8 +184,12 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
> > > > >         unsigned long pixel_rate;
> > > > >         int ret;
> > > > >
> > > > > -       if (!source_subdev)
> > > > > -               return -ENODEV;
> > > > > +       state = v4l2_subdev_lock_and_get_active_state(subdev);
> > > > > +
> > > > > +       if (!source_subdev) {
> > > > > +               ret = -ENODEV;
> > > > > +               goto unlock;
> > > > > +       }
> > > > >
> > > > >         if (!on) {
> > > > >                 v4l2_subdev_call(source_subdev, video, s_stream, 0);
> > > > > @@ -196,7 +201,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
> > > > >
> > > > >         ret = pm_runtime_resume_and_get(dev);
> > > > >         if (ret < 0)
> > > > > -               return ret;
> > > > > +               goto unlock;
> > > > >
> > > > >         /* Sensor Pixel Rate */
> > > > >
> > > > > @@ -222,6 +227,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
> > > > >                 goto error_pm;
> > > > >         }
> > > > >
> > > > > +       mbus_format = v4l2_subdev_state_get_format(state,
> > > > > +                                                  SUN6I_MIPI_CSI2_PAD_SINK);
> > > > >         format = sun6i_mipi_csi2_format_find(mbus_format->code);
> > > > >         if (WARN_ON(!format)) {
> > > > >                 ret = -ENODEV;
> > > > > @@ -260,7 +267,7 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
> > > > >
> > > > >         /* Controller */
> > > > >
> > > > > -       sun6i_mipi_csi2_configure(csi2_dev);
> > > > > +       sun6i_mipi_csi2_configure(csi2_dev, mbus_format);
> > > > >         sun6i_mipi_csi2_enable(csi2_dev);
> > > > >
> > > > >         /* D-PHY */
> > > > > @@ -277,7 +284,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
> > > > >         if (ret && ret != -ENOIOCTLCMD)
> > > > >                 goto disable;
> > > > >
> > > > > -       return 0;
> > > > > +       ret = 0;
> > > > > +       goto unlock;
> > > > >
> > > > >  disable:
> > > > >         phy_power_off(dphy);
> > > > > @@ -286,6 +294,8 @@ static int sun6i_mipi_csi2_s_stream(struct v4l2_subdev *subdev, int on)
> > > > >  error_pm:
> > > > >         pm_runtime_put(dev);
> > > > >
> > > > > +unlock:
> > > > > +       v4l2_subdev_unlock_state(state);
> > > > >         return ret;
> > > > >  }
> > > > >
> > > > > @@ -308,21 +318,23 @@ sun6i_mipi_csi2_mbus_format_prepare(struct v4l2_mbus_framefmt *mbus_format)
> > > > >  static int sun6i_mipi_csi2_init_state(struct v4l2_subdev *subdev,
> > > > >                                       struct v4l2_subdev_state *state)
> > > > >  {
> > > > > -       struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
> > > > > -       unsigned int pad = SUN6I_MIPI_CSI2_PAD_SINK;
> > > > > -       struct v4l2_mbus_framefmt *mbus_format =
> > > > > -               v4l2_subdev_state_get_format(state, pad);
> > > > > -       struct mutex *lock = &csi2_dev->bridge.lock;
> > > > > +       unsigned int pad;
> > > > >
> > > > > -       mutex_lock(lock);
> > > > > +       /*
> > > > > +        * This subdev does not perform format conversion,
> > > > > +        * initialize both pads identically.
> > > > > +        */
> > > > > +       for (pad = 0; pad < subdev->entity.num_pads; pad++) {
> > > > > +               struct v4l2_mbus_framefmt *mbus_format;
> > > > >
> > > > > -       mbus_format->code = sun6i_mipi_csi2_formats[0].mbus_code;
> > > > > -       mbus_format->width = 640;
> > > > > -       mbus_format->height = 480;
> > > > > +               mbus_format = v4l2_subdev_state_get_format(state, pad);
> > > > >
> > > > > -       sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > > > > +               mbus_format->code = sun6i_mipi_csi2_formats[0].mbus_code;
> > > > > +               mbus_format->width = 640;
> > > > > +               mbus_format->height = 480;
> > > > >
> > > > > -       mutex_unlock(lock);
> > > > > +               sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > > > > +       }
> > > > >
> > > > >         return 0;
> > > > >  }
> > > > > @@ -340,53 +352,32 @@ sun6i_mipi_csi2_enum_mbus_code(struct v4l2_subdev *subdev,
> > > > >         return 0;
> > > > >  }
> > > > >
> > > > > -static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
> > > > > -                                  struct v4l2_subdev_state *state,
> > > > > -                                  struct v4l2_subdev_format *format)
> > > > > -{
> > > > > -       struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
> > > > > -       struct v4l2_mbus_framefmt *mbus_format = &format->format;
> > > > > -       struct mutex *lock = &csi2_dev->bridge.lock;
> > > > > -
> > > > > -       mutex_lock(lock);
> > > > > -
> > > > > -       if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> > > > > -               *mbus_format = *v4l2_subdev_state_get_format(state,
> > > > > -                                                            format->pad);
> > > > > -       else
> > > > > -               *mbus_format = csi2_dev->bridge.mbus_format;
> > > > > -
> > > > > -       mutex_unlock(lock);
> > > > > -
> > > > > -       return 0;
> > > > > -}
> > > > > -
> > > > >  static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
> > > > >                                    struct v4l2_subdev_state *state,
> > > > >                                    struct v4l2_subdev_format *format)
> > > > >  {
> > > > > -       struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
> > > > > -       struct v4l2_mbus_framefmt *mbus_format = &format->format;
> > > > > -       struct mutex *lock = &csi2_dev->bridge.lock;
> > > > > +       struct v4l2_mbus_framefmt *fmt;
> > > > >
> > > > > -       mutex_lock(lock);
> > > > > +       /* The format on the source pad always matches the sink pad. */
> > > > > +       if (format->pad != SUN6I_MIPI_CSI2_PAD_SINK)
> > > > > +               return v4l2_subdev_get_fmt(subdev, state, format);
> > > > >
> > > > > -       sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
> > > > > +       sun6i_mipi_csi2_mbus_format_prepare(&format->format);
> > > > >
> > > > > -       if (format->which == V4L2_SUBDEV_FORMAT_TRY)
> > > > > -               *v4l2_subdev_state_get_format(state, format->pad) =
> > > > > -                       *mbus_format;
> > > > > -       else
> > > > > -               csi2_dev->bridge.mbus_format = *mbus_format;
> > > > > +       /* Set the format on the sink pad. */
> > > > > +       fmt = v4l2_subdev_state_get_format(state, format->pad);
> > > > > +       *fmt = format->format;
> > > > >
> > > > > -       mutex_unlock(lock);
> > > > > +       /* Propagate the format to the source pad. */
> > > > > +       fmt = v4l2_subdev_state_get_format(state, SUN6I_MIPI_CSI2_PAD_SOURCE);
> > > > > +       *fmt = format->format;
> > > > >
> > > > >         return 0;
> > > > >  }
> > > > >
> > > > >  static const struct v4l2_subdev_pad_ops sun6i_mipi_csi2_pad_ops = {
> > > > >         .enum_mbus_code = sun6i_mipi_csi2_enum_mbus_code,
> > > > > -       .get_fmt        = sun6i_mipi_csi2_get_fmt,
> > > > > +       .get_fmt        = v4l2_subdev_get_fmt,
> > > > >         .set_fmt        = sun6i_mipi_csi2_set_fmt,
> > > > >  };
> > > > >
> > > > > @@ -502,8 +493,6 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
> > > > >         bool notifier_registered = false;
> > > > >         int ret;
> > > > >
> > > > > -       mutex_init(&bridge->lock);
> > > > > -
> > > > >         /* V4L2 Subdev */
> > > > >
> > > > >         v4l2_subdev_init(subdev, &sun6i_mipi_csi2_subdev_ops);
> > > > > @@ -532,6 +521,12 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
> > > > >         if (ret)
> > > > >                 return ret;
> > > > >
> > > > > +       /* V4L2 Subdev finalize */
> > > > > +
> > > > > +       ret = v4l2_subdev_init_finalize(subdev);
> > > > > +       if (ret < 0)
> > > > > +               goto error_media_entity_cleanup;
> > > > > +
> > > > >         /* V4L2 Async */
> > > > >
> > > > >         v4l2_async_subdev_nf_init(notifier, subdev);
> > > > > @@ -565,6 +560,9 @@ static int sun6i_mipi_csi2_bridge_setup(struct sun6i_mipi_csi2_device *csi2_dev)
> > > > >  error_v4l2_notifier_cleanup:
> > > > >         v4l2_async_nf_cleanup(notifier);
> > > > >
> > > > > +       v4l2_subdev_cleanup(subdev);
> > > > > +
> > > > > +error_media_entity_cleanup:
> > > > >         media_entity_cleanup(&subdev->entity);
> > > > >
> > > > >         return ret;
> > > > > @@ -579,6 +577,7 @@ sun6i_mipi_csi2_bridge_cleanup(struct sun6i_mipi_csi2_device *csi2_dev)
> > > > >         v4l2_async_unregister_subdev(subdev);
> > > > >         v4l2_async_nf_unregister(notifier);
> > > > >         v4l2_async_nf_cleanup(notifier);
> > > > > +       v4l2_subdev_cleanup(subdev);
> > > > >         media_entity_cleanup(&subdev->entity);
> > > > >  }
> > > > >
> > > > > diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > > > > index 24b15e34b5e8..d72dfbd6a993 100644
> > > > > --- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > > > > +++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
> > > > > @@ -32,8 +32,6 @@ struct sun6i_mipi_csi2_bridge {
> > > > >         struct media_pad                pads[SUN6I_MIPI_CSI2_PAD_COUNT];
> > > > >         struct v4l2_fwnode_endpoint     endpoint;
> > > > >         struct v4l2_async_notifier      notifier;
> > > > > -       struct v4l2_mbus_framefmt       mbus_format;
> > > > > -       struct mutex                    lock; /* Mbus format lock. */
> > > > >
> > > > >         struct v4l2_subdev              *source_subdev;
> > > > >  };

-- 
Regards,

Laurent Pinchart

