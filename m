Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C88C6195851
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 14:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgC0Nr4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Mar 2020 09:47:56 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33878 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgC0Nr4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Mar 2020 09:47:56 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C4333297E7F
Message-ID: <c82b6c7be2e2f05c6924df00256caee6c5e32b23.camel@collabora.com>
Subject: Re: [PATCH 2/2] media: Remove VIDEO_DEV unneeded dependency
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Hans Verkuil <hverkuil@xs4all.nl>, Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Michael Ira Krufky <mkrufky@gmail.com>,
        Helen Koike <helen.koike@collabora.com>
Date:   Fri, 27 Mar 2020 10:47:44 -0300
In-Reply-To: <0336a046563a3d0556c988a67be2642194831710.camel@collabora.com>
References: <20200323211022.28297-1-ezequiel@collabora.com>
         <20200323211022.28297-3-ezequiel@collabora.com>
         <20200324104722.1c605792@coco.lan>
         <0336a046563a3d0556c988a67be2642194831710.camel@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On Tue, 2020-03-24 at 07:18 -0300, Ezequiel Garcia wrote:
> On Tue, 2020-03-24 at 10:47 +0100, Mauro Carvalho Chehab wrote:
> > Em Mon, 23 Mar 2020 18:10:22 -0300
> > Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> > 
> > > Enable VIDEO_DEV (which compiles Video4Linux core)
> > > when MEDIA_SUPPORT is selected. This is needed, in order
> > > to be able to enable devices such as stateless codecs.
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > ---
> > >  drivers/media/Kconfig | 2 --
> > >  1 file changed, 2 deletions(-)
> > > 
> > > diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
> > > index b36a41332867..7de472ad07a2 100644
> > > --- a/drivers/media/Kconfig
> > > +++ b/drivers/media/Kconfig
> > > @@ -93,13 +93,11 @@ source "drivers/media/mc/Kconfig"
> > >  
> > >  #
> > >  # Video4Linux support
> > > -#	Only enables if one of the V4L2 types (ATV, webcam, radio) is selected
> > >  #
> > >  
> > >  config VIDEO_DEV
> > >  	tristate
> > >  	depends on MEDIA_SUPPORT
> > > -	depends on MEDIA_CAMERA_SUPPORT || MEDIA_ANALOG_TV_SUPPORT || MEDIA_RADIO_SUPPORT || MEDIA_SDR_SUPPORT
> > >  	default y
> > >  
> > >  config VIDEO_V4L2_SUBDEV_API
> > 
> > The rationale of the above is to exclude Digital TV and remote
> > controller.
> > 
> > Removing the above will make the V4L2 core available every time, even
> > if all the user wants is remote controller or Digital TV support.
> > 
> 
> Hm, right.
> 
> > I'm working on a patchset that should hopefully address the issues
> > you're concerning.
> > 
> 
> Thanks, I'll appreciate that.
> 

It seems the config rework you sent will undergo some
extended discussions, which is fine given it's a full rework.

I'd like to send a smaller (ideally just one or two patches)
series, so we can improve the situation on codecs on a smaller
timeframe.

Thanks!
Ezequiel

