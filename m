Return-Path: <linux-media+bounces-21155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1404E9C1D71
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 13:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B819928508F
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 12:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0ED1EABB1;
	Fri,  8 Nov 2024 12:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jJ1fxWk7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890601E5000
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 12:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731070637; cv=none; b=l2jr51Q2MAgl5FDxrB3fuEBZ5nQTtgCDxYgFHRdKUh+39CnayeZ5h2orb/9a6uIKmuEQ/JKEr9qLJ4McpNhAVGOTsBZqzAaQiJovAQp2Z+gIApdhw+q4DehRsmm9nqMm6l38G/vvucnfFnrBA8t1AKj0SqdRpMdameOGzEttJnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731070637; c=relaxed/simple;
	bh=HLmfCz4pUIpNPruido1qPervB3fx735+Ccy8vrgPKac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dllm7/MpQbMIqggE/Ev6JK5HifZ4bBh4bOJwrlzak+EYI1BXOpFZwDV06hVXxxCP/HKTuXYaYfjrq3PJ31pT43DhaxXSRefZ4r/tbi7m5z+f2Y/0Ai/p2v9/OmDJ1q7dafB+fvivfhkiWF//jAt+yR6/TwkrW6Z4BxTrYyks3Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jJ1fxWk7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBC6F3D5;
	Fri,  8 Nov 2024 13:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731070623;
	bh=HLmfCz4pUIpNPruido1qPervB3fx735+Ccy8vrgPKac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jJ1fxWk73sSWvVZl46HYfGrA5qHGGmsWViXzF0ofwNOoU30cyGOe2CUAKwJiwR1of
	 u9HjLr3z8go8mm/+fHupt7G5OTNzVGSTrS6NRO2cEWY5UoVXZcL18eat0rViaMeOXB
	 BYQ23b/Nljxtcy5hb7zpqA5ep8yqc6ecYCcS4LAQ=
Date: Fri, 8 Nov 2024 14:57:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [RFC 2/4] media: Documentation: Reword split of sensor driver to
 two classes
Message-ID: <20241108125705.GA31396@pendragon.ideasonboard.com>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <20241011075535.588140-3-sakari.ailus@linux.intel.com>
 <x2ho2gb7v45a5dyj4urs6czbfftpalsb4kpg3ypq657nodfq5u@st74gzew454p>
 <20241022193958.GD9497@pendragon.ideasonboard.com>
 <Zy4GgLRlige9wG87@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zy4GgLRlige9wG87@kekkonen.localdomain>

On Fri, Nov 08, 2024 at 12:39:28PM +0000, Sakari Ailus wrote:
> Hi Laurent, Jacopo,
> 
> On Tue, Oct 22, 2024 at 10:39:58PM +0300, Laurent Pinchart wrote:
> > On Tue, Oct 22, 2024 at 05:12:58PM +0200, Jacopo Mondi wrote:
> > > On Fri, Oct 11, 2024 at 10:55:33AM +0300, Sakari Ailus wrote:
> > > > The sensor drivers do not configure the output size of the sensors but the
> > > > entire internal pipeline. Reflect this in the documentation.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  .../userspace-api/media/drivers/camera-sensor.rst      | 10 ++++++----
> > > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > index d82cd803e337..ad4049ff7eec 100644
> > > > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > > > @@ -10,11 +10,13 @@ used to control the camera sensor drivers.
> > > >
> > > >  You may also find :ref:`media_writing_camera_sensor_drivers` useful.
> > > >
> > > > -Frame size
> > > > -----------
> > > > +Sensor internal pipeline configuration
> > > > +--------------------------------------
> > > >
> > > > -There are two distinct ways to configure the frame size produced by camera
> > > > -sensors.
> > > > +The camera sensors have an internal processing pipeline including cropping and
> > > 
> > > As a non native speaker I'm probably wrong, but "The" followed by a plural
> > > name to identify a category sounds weird to me.
> > > 
> > > What about just
> > > "Camera sensors have"
> > 
> > That's better, yes.
> 
> Agreed.
> 
> > 
> > > > +binning functionality. The sensor drivers belong to two distinct classes, freely
> > > 
> > > functionalities ?
> > 
> > "functionality" is uncountable when it means "The ability to do a task,
> > performance, or execution; a set of functions that something is able or
> > equipped to perform".
> > 
> > > Same question for "The sensor drivers", just "Sensor drivers" ?
> > >
> > > > +configurable and register list based drivers, depending on how the driver
> > 
> > s/ based/-based/
> 
> There are about four other instances of this, I can change those too...

https://english.stackexchange.com/questions/65630/you-should-be-well-organised-or-you-should-be-well-organised

Those are register list-based drivers. Those drivers are register list
based.

> > > 
> > > s/drivers/ones ?
> > 
> > The English language is less concerned about repetitions than French,
> > and I assume also Italian. "[...] and register list-based ones" sound
> > less natural to me.
> 
> Yes, yes, yes, yes.
> 
> > > > +configures this functionality.
> > > 
> > > configures the pipeline.
> > 
> > Ack on this change.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!

-- 
Regards,

Laurent Pinchart

