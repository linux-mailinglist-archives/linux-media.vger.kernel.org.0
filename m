Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69B4A1A7E37
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2020 15:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732378AbgDNNfV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 09:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732330AbgDNNey (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 09:34:54 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BEABC061A0C;
        Tue, 14 Apr 2020 06:34:54 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 6BF442A14C7
Message-ID: <e4753106e1a18b18728dbcf7720d805c362b6f3f.camel@collabora.com>
Subject: Re: [PATCH] media: Kconfig: Don't expose API options
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>
Date:   Tue, 14 Apr 2020 10:34:44 -0300
In-Reply-To: <20200414152147.053b4b29@coco.lan>
References: <20200414130210.18970-1-ezequiel@collabora.com>
         <20200414152147.053b4b29@coco.lan>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2020-04-14 at 15:21 +0200, Mauro Carvalho Chehab wrote:
> Em Tue, 14 Apr 2020 10:02:10 -0300
> Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> 
> > There is no need to expose API options; instead,
> > drivers that support a given API are expected to just select it.
> > 
> > Happily, this is currently the case, so simply stop
> > exposing the options.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/media/Kconfig           | 2 +-
> >  drivers/media/mc/Kconfig        | 3 +--
> >  drivers/media/v4l2-core/Kconfig | 2 +-
> >  3 files changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> > index a8def1591352..eef4c6761ffb 100644
> > --- a/drivers/media/Kconfig
> > +++ b/drivers/media/Kconfig
> > @@ -173,7 +173,7 @@ config VIDEO_DEV
> >  	  radio devices and by some input devices.
> >  
> >  config MEDIA_CONTROLLER
> > -	bool "Media Controller API"
> > +	bool
> 
> This is not true here... non-embedded drivers like DVB and UVC can work
> with or without the media controller. For them, the API is experimental.
> 

Fair enough.

> >  	default MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_DIGITAL_TV_SUPPORT || MEDIA_PLATFORM_SUPPORT
> >  	help
> >  	  Enable the media controller API used to query media devices internal
> > diff --git a/drivers/media/mc/Kconfig b/drivers/media/mc/Kconfig
> > index 002a918c4c75..0cdf885ce24d 100644
> > --- a/drivers/media/mc/Kconfig
> > +++ b/drivers/media/mc/Kconfig
> > @@ -2,7 +2,6 @@
> >  
> >  #
> >  # Media controller
> > -#	Selectable only for webcam/grabbers, as other drivers don't use it
> >  #
> >  
> >  config MEDIA_CONTROLLER_DVB
> > @@ -14,7 +13,7 @@ config MEDIA_CONTROLLER_DVB
> >  	  This is currently experimental.
> >  
> >  config MEDIA_CONTROLLER_REQUEST_API
> > -	bool "Enable Media controller Request API (EXPERIMENTAL)"
> > +	bool
> 
> This sounds OK.
> 
> The only reason why I didn't make this change is because of the 
> "EXPERIMENTAL" warning. 
> 
> At least while this API is considered experimental, it sounds
> wise to have a warning.
> 
> Perhaps we could apply this hunk, and add something like 
> this to media/Kconfig:
> 
> comment "Please notice that the enabled Media controller Request API is EXPERIMENTAL"
> 	depends on MEDIA_CONTROLLER_REQUEST_API
> 

Let me post a separate patch, since I believe we also
need to select the request API on the test drivers
that use it.

Thanks,
Ezequiel

