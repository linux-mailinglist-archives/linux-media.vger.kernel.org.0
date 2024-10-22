Return-Path: <linux-media+bounces-20059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A05529AB70D
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 21:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24B9D1F22904
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 19:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8621CB511;
	Tue, 22 Oct 2024 19:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bgOM4/Dp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7541C9EC7
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 19:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729626009; cv=none; b=gyYRQ47M6EpGt57O8Bt2Dd2Qrw1OnBIiRV7RQPl5do7N8FpFz1Xm7aqlUzS67C6oF07U52LHtr9g1wXvA9KaKbAB7N1MDslgNHOFXiaJG4zTfpd4QlTt1voY7pzqWdwW+b+BgYPhLGXcAqvzhi4f80SSFW4I6mnNycsPG5q0prY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729626009; c=relaxed/simple;
	bh=nKveb8PPPJka2k9gXjmGb1M4Ld58gn3RlcFhfnPessI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CD2mwIboBfp1wozRSfhX95XIg2ewkmLT7qhML2tEENxQhLdrU2nWY0r7EhEBzJqmm8Z2470ISt7PnHBz6kzNXpSscP8T0ciQYpStrCd1I4BWya2GTae05+Zw+Ogw3+7qcjf8wykJiIfEubVz+fr1CAdm+qLhMyhX4OczBw2zSQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bgOM4/Dp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7756752;
	Tue, 22 Oct 2024 21:38:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729625898;
	bh=nKveb8PPPJka2k9gXjmGb1M4Ld58gn3RlcFhfnPessI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgOM4/Dpef30lTBG5Cpsev6A7jtV17kyhQXenrAh7MQ1xGE1oY7oN+XFUsTJhd2aH
	 9N/4P6PtaTwkTckeBnF0EMr8Xm71dTg8l2OPVvbNbpVqCnudDfzv7EYDH13M6uF4DT
	 2KZrHBduFfe44qElr+d4JUunLpWbAu2vuzFpawNw=
Date: Tue, 22 Oct 2024 22:39:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
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
Message-ID: <20241022193958.GD9497@pendragon.ideasonboard.com>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <20241011075535.588140-3-sakari.ailus@linux.intel.com>
 <x2ho2gb7v45a5dyj4urs6czbfftpalsb4kpg3ypq657nodfq5u@st74gzew454p>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <x2ho2gb7v45a5dyj4urs6czbfftpalsb4kpg3ypq657nodfq5u@st74gzew454p>

On Tue, Oct 22, 2024 at 05:12:58PM +0200, Jacopo Mondi wrote:
> On Fri, Oct 11, 2024 at 10:55:33AM +0300, Sakari Ailus wrote:
> > The sensor drivers do not configure the output size of the sensors but the
> > entire internal pipeline. Reflect this in the documentation.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../userspace-api/media/drivers/camera-sensor.rst      | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index d82cd803e337..ad4049ff7eec 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -10,11 +10,13 @@ used to control the camera sensor drivers.
> >
> >  You may also find :ref:`media_writing_camera_sensor_drivers` useful.
> >
> > -Frame size
> > -----------
> > +Sensor internal pipeline configuration
> > +--------------------------------------
> >
> > -There are two distinct ways to configure the frame size produced by camera
> > -sensors.
> > +The camera sensors have an internal processing pipeline including cropping and
> 
> As a non native speaker I'm probably wrong, but "The" followed by a plural
> name to identify a category sounds weird to me.
> 
> What about just
> "Camera sensors have"

That's better, yes.

> > +binning functionality. The sensor drivers belong to two distinct classes, freely
> 
> functionalities ?

"functionality" is uncountable when it means "The ability to do a task,
performance, or execution; a set of functions that something is able or
equipped to perform".

> Same question for "The sensor drivers", just "Sensor drivers" ?
>
> > +configurable and register list based drivers, depending on how the driver

s/ based/-based/

> 
> s/drivers/ones ?

The English language is less concerned about repetitions than French,
and I assume also Italian. "[...] and register list-based ones" sound
less natural to me.

> > +configures this functionality.
> 
> configures the pipeline.

Ack on this change.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ?
> 
> >
> >  Freely configurable camera sensor drivers
> >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
Regards,

Laurent Pinchart

