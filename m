Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1B8192524
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 11:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgCYKIk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 06:08:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:37946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726043AbgCYKIk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 06:08:40 -0400
Received: from coco.lan (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BEC2F2077D;
        Wed, 25 Mar 2020 10:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585130919;
        bh=9aWhGM571Mi8W9NQFL7yrbiKfUkDXUyARU/MIwWev8Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AWViXvWdZ7bbclrrnzJaIqg/LYcAw3tF9mCtlF8ddQ7wpGH1oqirUa4l+75Jhplge
         7sFxaCqf2OAFaHbtdF9mGTSWqtzAFjQdqoAhVuzkbgz0/SSA4mrRQI+AISEHN/xGHr
         ou/Lr/yHHetEjhWWxOOHo0txMWmjLzbn4j8huuF4=
Date:   Wed, 25 Mar 2020 11:08:34 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 15/22] media: Kconfig: move media controller core
 select to main Kconfig
Message-ID: <20200325110834.1e204e20@coco.lan>
In-Reply-To: <20200325100059.GB22904@kekkonen.localdomain>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
        <ac58d0e580d93a190e44c79507dd4969679ecb36.1585129041.git.mchehab+huawei@kernel.org>
        <20200325100059.GB22904@kekkonen.localdomain>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 25 Mar 2020 12:00:59 +0200
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Hi Mauro,
> 
> On Wed, Mar 25, 2020 at 10:49:29AM +0100, Mauro Carvalho Chehab wrote:
> > Let's place the main API selections at the media/Kconfig file,
> > as this way we can better organize things.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/media/Kconfig    | 9 +++++++++
> >  drivers/media/mc/Kconfig | 9 ---------
> >  2 files changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> > index d6766085c91b..3872e46545e6 100644
> > --- a/drivers/media/Kconfig
> > +++ b/drivers/media/Kconfig
> > @@ -144,6 +144,15 @@ config VIDEO_DEV
> >  	depends on MEDIA_SUPPORT
> >  	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || MEDIA_PLATFORM_SUPPORT
> >  
> > +config MEDIA_CONTROLLER
> > +	bool "Media Controller API"
> > +	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
> > +	help
> > +	  Enable the media controller API used to query media devices internal
> > +	  topology and configure it dynamically.
> > +
> > +	  This API is mostly used by camera interfaces in embedded platforms.
> > +
> >  source "drivers/media/v4l2-core/Kconfig"
> >  
> >  #
> > diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
> > index 3b9795cfcb36..b3579d6c9e32 100644
> > --- a/drivers/media/mc/Kconfig
> > +++ b/drivers/media/mc/Kconfig
> > @@ -3,15 +3,6 @@
> >  #	Selectable only for webcam/grabbers, as other drivers don't use it
> >  #
> >  
> > -config MEDIA_CONTROLLER
> > -	bool "Media Controller API"
> > -	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
> > -	help
> > -	  Enable the media controller API used to query media devices internal
> > -	  topology and configure it dynamically.
> > -
> > -	  This API is mostly used by camera interfaces in embedded platforms.
> > -
> >  config MEDIA_CONTROLLER_DVB
> >  	bool "Enable Media controller for DVB (EXPERIMENTAL)"
> >  	depends on MEDIA_CONTROLLER && DVB_CORE  
> 
> This moves the main MC configuration out of the directory but leaves the
> rest of the MC configuration under the mc directory. All MC related
> configuration is currently in a single place, which makes sense.
> 
> I guess you can always have arguments for and against, but my preference is
> keeping it as-is.

Well, the advantage (after applying the entire series), is that it can now
present two separate menus:

the first one with the core stuff (MC, V4L and DVB), and a second one
with the extra features for those three.

Btw, it just occurred to me that perhaps we could map it on a different way,
using a menu for MC, another one for V4L and a third one for DVB.

In any case, in order to do that, we need to have the "extra" features
on a separate file than the main ones.

Thanks,
Mauro
