Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F2E369CCD
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 00:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244174AbhDWWfQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Apr 2021 18:35:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44178 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237181AbhDWWe6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Apr 2021 18:34:58 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32130EE;
        Sat, 24 Apr 2021 00:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619217253;
        bh=m8jU5cGoHGOkeaMv9EUUiN3kHzevaIEauHuY+D+3dcM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WxNSOSj8Xe/r+p4+nD13oM35hKhui0vGKWBbMaJwxjqvDpJTmS2Hy8fEwCl+XpLDz
         ozu/AieKqO9GnKvWY6yke5O8ETxN5VkRVJtF8GcUmU95OzthVljPzNsqEA6ip3uedc
         Gkso+f7ibvjnYZEOTVSFyo9F3kWGr2D4J/akl+pk=
Date:   Sat, 24 Apr 2021 01:34:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Gregor Jasny <gjasny@googlemail.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl, sean@mess.org,
        p.zabel@pengutronix.de, ezequiel@collabora.com,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com,
        xavier.claessens@collabora.com, nicolas.dufresne@collabora.com,
        user.vdr@gmail.com, sakari.ailus@iki.fi
Subject: Re: [v4l-utils v4 2/5] Add support for meson building
Message-ID: <YINLX5xd8/16gNYZ@pendragon.ideasonboard.com>
References: <20210317172227.620584-1-ariel.dalessandro@collabora.com>
 <20210317172227.620584-3-ariel.dalessandro@collabora.com>
 <7096f897-1e48-c1e5-5503-008fff60d2b2@googlemail.com>
 <20210320203209.14c65453@coco.lan>
 <YFZUf9RfS6rdD8Il@pendragon.ideasonboard.com>
 <5eb90b59-8896-ae22-690f-340f4ec9d8db@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5eb90b59-8896-ae22-690f-340f4ec9d8db@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ariel,

On Fri, Apr 23, 2021 at 07:31:01PM -0300, Ariel D'Alessandro wrote:
> Hi Mauro, Laurent,
> 
> I can see this thread didn't follow up.
> 
> Regarding Mauro's reasons about why not switching to meson, I totally 
> agree with this response from Laurent's. I don't see any of those 
> aspects being really an argument on why not supporting meson, but in any 
> case, discussion can follow up from there.
> 
> On 3/20/21 5:01 PM, Laurent Pinchart wrote:
> > Hi Mauro,
> > 
> > On Sat, Mar 20, 2021 at 08:32:09PM +0100, Mauro Carvalho Chehab wrote:
> [snip]
> >>
> >> I'm not a lover of autoconf tools. Yet, replacing from it on this
> >> project sounds a bad idea, for a couple of reasons.
> >>
> >> The main one is that nobody has yet provided any real reason about
> >> *why* auto-tools should be replaced.
> 
> IMHO, switching from autotools to meson has many advantages, like a 
> clear syntax, an active community and *faster* build speed than autotools.
> 
> On a cold cache:
> 
>    $ time (meson setup build/ -Ddefault_library=both ; ninja -j4 -C build/)
>    real 0m15.945s ; user 0m51.235s ; sys 0m6.914s
> 
>    $ time (./configure ; make -j4)
>    real 0m45.985s ; user 1m57.454s ; sys 0m9.404s
> 
> Although I haven't been involved in v4l-utils previously, I can see some 
> people interested on having meson build support, I'm not the only one 
> involved in this patchset.
> 
> I understand that every change comes with a cost, but I believe meson's 
> been adopted for some time now, other projects have already done the 
> move, and the advantages overcome the possible negative aspects 
> mentioned. Again, this is just my humble opinion, and to me that's the 
> *why* porting to meson is a good idea :-)
> 
> I'd like to hear for other reasons.

Gregor, you've provided feedback on the implementation (thanks about
that), but I don't think I've seen your opinion about the switch to
meson itself. Have I missed it, and if I haven't, could you share your
thoughts ?

-- 
Regards,

Laurent Pinchart
