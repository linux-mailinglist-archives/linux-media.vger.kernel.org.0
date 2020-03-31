Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63BFD199871
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 16:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731093AbgCaO3y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Mar 2020 10:29:54 -0400
Received: from retiisi.org.uk ([95.216.213.190]:49948 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731053AbgCaO3y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Mar 2020 10:29:54 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 0D417634C87;
        Tue, 31 Mar 2020 17:29:15 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jJHtC-0001Io-3s; Tue, 31 Mar 2020 17:29:14 +0300
Date:   Tue, 31 Mar 2020 17:29:14 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCHv2 0/2] Add helper functions to print a fourcc
Message-ID: <20200331142913.GK2394@valkosipuli.retiisi.org.uk>
References: <20190916100433.24367-1-hverkuil-cisco@xs4all.nl>
 <20190916115207.GO843@valkosipuli.retiisi.org.uk>
 <2c0da850-7073-0fc6-7246-9e530a54cf26@xs4all.nl>
 <CAPY8ntCOAeq1OLS4dn846ubujnbUxSwMu-Tfb9fcNgaDcn3_JQ@mail.gmail.com>
 <CAPY8ntCL+j=hia=WHJnpcGosD7hTxR2-aJWYrY+E3qpT-+g=0Q@mail.gmail.com>
 <20200331102742.GH2394@valkosipuli.retiisi.org.uk>
 <CAPY8ntAfgZQpjVpV4G13sBiGPX1eQ9pMZ7=6vvq32SMkTXOYDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntAfgZQpjVpV4G13sBiGPX1eQ9pMZ7=6vvq32SMkTXOYDA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Mar 31, 2020 at 03:05:59PM +0100, Dave Stevenson wrote:
> Hi Sakari
> 
> On Tue, 31 Mar 2020 at 11:28, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> > Hi Dave,
> >
> > On Wed, Mar 25, 2020 at 01:50:44PM +0000, Dave Stevenson wrote:
> > > On Wed, 29 Jan 2020 at 11:52, Dave Stevenson
> > > <dave.stevenson@raspberrypi.com> wrote:
> > > >
> > > > Hi Hans.
> > > >
> > > > On Mon, 16 Sep 2019 at 13:00, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> > > > >
> > > > > On 9/16/19 1:52 PM, Sakari Ailus wrote:
> > > > > > On Mon, Sep 16, 2019 at 12:04:31PM +0200, Hans Verkuil wrote:
> > > > > >> It turns out that Sakari posted a newer patch in 2018. I used that
> > > > > >> for this v2: https://patchwork.linuxtv.org/patch/48372/
> > > > > >>
> > > > > >> Mauro commented on that original patch that there was no need to
> > > > > >> have this available for userspace.
> > > > > >>
> > > > > >> I disagree: why wouldn't userspace want to report pixelformats?
> > > > > >>
> > > > > >> It happens in several places in v4l-utils, and there the pixelformats are
> > > > > >> printed in different ways as well. Providing a standard way of reporting
> > > > > >> a V4L2 fourcc is very useful.
> > > > > >
> > > > > > Thanks, Hans!
> > > > > >
> > > > > > Can you take these to your tree (perhaps pending some sort of agreement
> > > > > > with Mauro)?
> > > > > >
> > > > >
> > > > > Certainly.
> > > > >
> > > > >         Hans
> > > >
> > > > What happened to these? Patchwork is flagging them as rejected[1], but
> > > > there's only been positive responses to them on the mailing list.
> > >
> > > Ping. Why were these patches rejected?
> >
> > This was discussed on media-maint channel. The log is here:
> >
> > <URL:https://linuxtv.org/irc/irclogger_log/media-maint?date=2020-02-06,Thu&raw=on>
> 
> Thanks, it's useful to know what's going on. The patchwork information
> was pretty opaque.
> 
> The log includes
> [12:41] <sailus> If you insist, I can write a patch, and put your
> Suggested-by: tag there. :^)
> [12:41] <mchehab> yeah, please do so
> [12:42] <mchehab> the best is to also c/c drm ML
> Has that happened and I've missed it, or is it still on the pending queue?

Looking at the log reminded me to write it. :-)

I'll test it first and then send it --- I'll cc you as well.

-- 
Regards,

Sakari Ailus
