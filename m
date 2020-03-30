Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F286D1975F3
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 09:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729473AbgC3Hq7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 03:46:59 -0400
Received: from mga03.intel.com ([134.134.136.65]:49457 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729420AbgC3Hq6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 03:46:58 -0400
IronPort-SDR: ZMoDgXt4VlQCyzjdQxQItoM+P9qhHYPsL2tvI7BZSY8R7E8eKMXvwiJVpZ2jE4tPEqBxc/B7K0
 4DbSE02ZpVEw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 00:46:57 -0700
IronPort-SDR: 9ULmXjXRTB4l9jWIgw0brFshLPgrRupUdLWpd0luUnWFodBFitCe9s8iGU+yHsColgI3S15csF
 7cwH+CQVU+SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,323,1580803200"; 
   d="scan'208";a="248622489"
Received: from unknown (HELO kekkonen.fi.intel.com) ([10.252.36.158])
  by orsmga003.jf.intel.com with ESMTP; 30 Mar 2020 00:46:56 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 0E6C921E9E; Mon, 30 Mar 2020 10:46:52 +0300 (EEST)
Date:   Mon, 30 Mar 2020 10:46:52 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 15/22] media: Kconfig: move media controller core
 select to main Kconfig
Message-ID: <20200330074652.GC26969@kekkonen.localdomain>
References: <cover.1585129041.git.mchehab+huawei@kernel.org>
 <ac58d0e580d93a190e44c79507dd4969679ecb36.1585129041.git.mchehab+huawei@kernel.org>
 <20200325100059.GB22904@kekkonen.localdomain>
 <20200325110834.1e204e20@coco.lan>
 <20200325112129.5579ef45@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325112129.5579ef45@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 25, 2020 at 11:21:29AM +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 25 Mar 2020 11:08:34 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
> > Em Wed, 25 Mar 2020 12:00:59 +0200
> > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> > 
> > > Hi Mauro,
> > > 
> > > On Wed, Mar 25, 2020 at 10:49:29AM +0100, Mauro Carvalho Chehab wrote:
> > > > Let's place the main API selections at the media/Kconfig file,
> > > > as this way we can better organize things.
> > > > 
> > > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > > ---
> > > >  drivers/media/Kconfig    | 9 +++++++++
> > > >  drivers/media/mc/Kconfig | 9 ---------
> > > >  2 files changed, 9 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> > > > index d6766085c91b..3872e46545e6 100644
> > > > --- a/drivers/media/Kconfig
> > > > +++ b/drivers/media/Kconfig
> > > > @@ -144,6 +144,15 @@ config VIDEO_DEV
> > > >  	depends on MEDIA_SUPPORT
> > > >  	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT || MEDIA_PLATFORM_SUPPORT
> > > >  
> > > > +config MEDIA_CONTROLLER
> > > > +	bool "Media Controller API"
> > > > +	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
> > > > +	help
> > > > +	  Enable the media controller API used to query media devices internal
> > > > +	  topology and configure it dynamically.
> > > > +
> > > > +	  This API is mostly used by camera interfaces in embedded platforms.
> > > > +
> > > >  source "drivers/media/v4l2-core/Kconfig"
> > > >  
> > > >  #
> > > > diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
> > > > index 3b9795cfcb36..b3579d6c9e32 100644
> > > > --- a/drivers/media/mc/Kconfig
> > > > +++ b/drivers/media/mc/Kconfig
> > > > @@ -3,15 +3,6 @@
> > > >  #	Selectable only for webcam/grabbers, as other drivers don't use it
> > > >  #
> > > >  
> > > > -config MEDIA_CONTROLLER
> > > > -	bool "Media Controller API"
> > > > -	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT
> > > > -	help
> > > > -	  Enable the media controller API used to query media devices internal
> > > > -	  topology and configure it dynamically.
> > > > -
> > > > -	  This API is mostly used by camera interfaces in embedded platforms.
> > > > -
> > > >  config MEDIA_CONTROLLER_DVB
> > > >  	bool "Enable Media controller for DVB (EXPERIMENTAL)"
> > > >  	depends on MEDIA_CONTROLLER && DVB_CORE  
> > > 
> > > This moves the main MC configuration out of the directory but leaves the
> > > rest of the MC configuration under the mc directory. All MC related
> > > configuration is currently in a single place, which makes sense.
> > > 
> > > I guess you can always have arguments for and against, but my preference is
> > > keeping it as-is.
> > 
> > Well, the advantage (after applying the entire series), is that it can now
> > present two separate menus:
> > 
> > the first one with the core stuff (MC, V4L and DVB), and a second one
> > with the extra features for those three.
> > 
> > Btw, it just occurred to me that perhaps we could map it on a different way,
> > using a menu for MC, another one for V4L and a third one for DVB.
> 
> What occurred to me is shown at the patch below (applied after this patch
> series).
> 
> IMHO, it is a way better to present things like that.

Ok; makes sense. I only thought of this Kconfig organisation point of view,
in terms of files.

It seems there's a more active discussion going on elsewhere, and perhaps
it's better to continue there.

-- 
Kind regards,

Sakari Ailus
