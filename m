Return-Path: <linux-media+bounces-43531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05368BB2AD7
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 09:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA32A3A96AC
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 07:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2808329B8C0;
	Thu,  2 Oct 2025 07:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FedTeRKV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9863E33F6
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 07:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759389503; cv=none; b=nlmMZmB5FH22QS6TvuCi9CnCc7KvPz15uo58xRl/dcHolq/1LT0nIgAUiNSx74FaUKXMWKIW6D5FBPQXycPNd9e1vPkp8tBOgj4j+E/XslXXuuxO0EMEe7U+tIvcKR2Xv4/bCHu9N2U5hChYYFN0sndgbijPWA5dBAtDWo9Eits=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759389503; c=relaxed/simple;
	bh=1bUjZNddREoNLlz8shEZr5nLJlhqFtKmw9knnEpwR8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EEnvQmOV5dP6t5wdd+lnB4OtrGinn6T6MHsuJeNxhMh9rQ5+me8T+Dl3SE/l58bSs5/KCeTcDWAQR6g4+NqjlHx4zNAz8kcB9iIiq36L/s5rPB29yYJlM3uiYIUWFx4vyXV5G/ViWIHalMYXdlBPmdBVzFxXXRloJb+InbLFUyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FedTeRKV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B479E01;
	Thu,  2 Oct 2025 09:16:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759389407;
	bh=1bUjZNddREoNLlz8shEZr5nLJlhqFtKmw9knnEpwR8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FedTeRKVXhSuXKZz+/DhO6gpgfEfVNhQUGYH8w/tB5NkpURCLnv6lbaVx0gysKEEM
	 TrIDD6PBL1kUfEw90HkCrRI3f9swDDoPz3QlUPG3XZGA9cNLwYMldgfpnYmLQ/fjRE
	 GuiPZzuFT/Q/MvZSNsm/Uv1Avq4+3V6L81rLQyao=
Date: Thu, 2 Oct 2025 09:18:13 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, 
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v11 41/66] media: Documentation: Add scaling and
 post-scaler crop for common raw
Message-ID: <jqatizt4lfad2gqliiyaldebekf5kze6rt2qjysptlmt7kgjbw@uo2vautcrxon>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-42-sakari.ailus@linux.intel.com>
 <mqouvw4ecezulohznuovrg4zcqcnugp6l77mdqqgogdawygu24@j5c3mgvf757x>
 <aM1Pv0oXpmw8sVn8@kekkonen.localdomain>
 <fgcmwxfbeavfv2m7gs36ck7rzsncfj2k27k7upb3rt6fyrxz5i@5mvd5mmdz3fn>
 <aN4l1S6C8t2fenyJ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aN4l1S6C8t2fenyJ@kekkonen.localdomain>

Hi Sakari

On Thu, Oct 02, 2025 at 10:12:21AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Thu, Sep 25, 2025 at 12:45:46PM +0200, Jacopo Mondi wrote:
> > Hi Sakari
> >
> > On Fri, Sep 19, 2025 at 03:42:39PM +0300, Sakari Ailus wrote:
> > > Hi Jacopo,
> > >
> > > On Mon, Sep 01, 2025 at 07:12:23PM +0200, Jacopo Mondi wrote:
> > > > Hi Sakari
> > > >
> > > > On Mon, Aug 25, 2025 at 12:50:42PM +0300, Sakari Ailus wrote:
> > > > > Document scaling and post-scaler digital crop operations for the common
> > > > > raw sensor model.
> > > > >
> > > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > > > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > ---
> > > > >  .../media/v4l/subdev-config-model.rst         | 24 +++++++++++++++----
> > > > >  1 file changed, 19 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > > > index 1e6c58931ea0..c1b9b74cbcef 100644
> > > > > --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > > > +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > > > > @@ -139,11 +139,18 @@ sub-sampling to achieve the desired size.
> > > > >
> > > > >  The digital crop operation takes place after binning and sub-sampling. It is
> > > > >  configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
> > > > > -0/0. The resulting image size is further output by the sensor.
> > > > > +0/0.
> > > > > +
> > > > > +The scaling operation is performed after the digital crop. It is configured by
> > > > > +setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on (pad, stream) pair 0/0,
> > > > > +relative to the digital crop.
> > > > >
> > > > >  The sensor's output mbus code is configured by setting the format on the (pad,
> > > > > -stream) pair 0/0. When setting the format, always use the same width and height
> > > > > -as for the digital crop setting.
> > > > > +stream) pair 0/0. The width and height fields are used to configure post-scaler
> > > > > +digital crop if supported by the driver, affecting the right and bottom edges of
> > > > > +the frame. If post-scaler digital crop is not supported, the width and height
> > > > > +fields of the format will match the compose rectangle sizes applied on the same
> > > > > +0/0 (pad, stream) pair.
> > > > >
> > > > >  Drivers may only support some or even none of these configurations, in which
> > > > >  case they do not expose the corresponding selection rectangles. If any selection
> > > > > @@ -201,12 +208,19 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
> > > > >        - X
> > > > >        - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_COMPOSE``
> > > > >          rectangle on (pad, stream) pair 1/0.
> > > > > +    * - 0/0
> > > > > +      - ``V4L2_SEL_TGT_COMPOSE``
> > > > > +      - \-
> > > > > +      - X
> > > > > +      - Scaling. This rectangle is relative to the ``V4L2_SEL_TGT_CROP``
> > > > > +        rectangle on (pad, stream) pair 0/0.
> > > > >      * - 0/0
> > > > >        - Format
> > > > >        - X
> > > > >        - X
> > > > > -      - Image data source format. Always assign the width and height fields of
> > > > > -        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
> > > > > +      - Image data source format and post-scaler crop. The width and height
> > > > > +        fields of the format, used to configure post-scaler crop on the right
> > > > > +        and bottom edges of the image, are related to the ``V4L2_SEL_TGT_COMPOSE``
> > > >
> > > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > >
> > > > Why not squashing it with #40 that has just introduced the section you
> > > > are here modifying ?
> > >
> > > One of the matters that was open regarding this set was whether to include
> > > scaling. I'm fine with squashing this patch once we conclude that.
> > >
> >
> > I recall there were discussion initially, but I don't remember the
> > exact issue :)
> >
> > Was it because this is feature rarely available and we just want to
> > wait for more users to standardize on an API or was there something
> > else I'm missing ?
>
> It's rare. I'd like to have Laurent's opinion on this, too.
>
> What's also possible is that we don't apply it now but only do so if we get
> a device that benefits from it. It may well be we won't; only sensors I've
> ever seen supporting this are CCS compliant and they won't use the common
> raw sensor model.

I see. I agree this feature can be added later, on without any impact
on existing users, so if you prefer to wait, I'm ok with that!

Thanks
  j

>
> --
> Regards,
>
> Sakari Ailus

