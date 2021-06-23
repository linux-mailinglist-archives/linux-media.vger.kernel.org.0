Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B718E3B11CB
	for <lists+linux-media@lfdr.de>; Wed, 23 Jun 2021 04:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbhFWChD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 22:37:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57224 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbhFWChC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 22:37:02 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B80E59B1;
        Wed, 23 Jun 2021 04:34:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624415684;
        bh=a1qAz4naVPFQxqmQv8h1qqRY1OKCRqYiNXwmWjEzQrw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QN5QhE+TD6Dqb/JUi0B+WL99wkM9zCSjJ/kacttviDcSQJtlJTc5yTxBJPiydnQTp
         +xS3YZk5byL3127dpy3Kf+MSWu++MTByo2EsXgrOQDfImhv5U0Fwo8rsygTzyjxsTL
         nb9j4SWPgn+eTf9Q2o1e1xMgUmCl+8MgLKuVSExI=
Date:   Wed, 23 Jun 2021 05:34:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-subdev: fix some NULL vs IS_ERR() checks
Message-ID: <YNKdqFNSrSBXVNqo@pendragon.ideasonboard.com>
References: <YNH0WU7BcQ/60UNG@mwanda>
 <YNH87qd4eJOR296R@pendragon.ideasonboard.com>
 <20210622155858.GN1861@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210622155858.GN1861@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

On Tue, Jun 22, 2021 at 06:58:58PM +0300, Dan Carpenter wrote:
> On Tue, Jun 22, 2021 at 06:08:30PM +0300, Laurent Pinchart wrote:
> > On Tue, Jun 22, 2021 at 05:31:53PM +0300, Dan Carpenter wrote:
> > > The v4l2_subdev_alloc_state() function returns error pointers, it
> > > doesn't return NULL.
> > 
> > It's funny you send this patch today, I've been thinking about the exact
> > same issue yesterday, albeit more globally, when trying to figure out if
> > a function I called returned NULL or an error pointer on error.
> > 
> > Would it make to create an __err_ptr annotation to mark functions that
> > return an error pointer ? This would both give a simple indication to
> > the user and allow tools such as smatch to detect errors.
> 
> If you have the cross function DB enabled then Smatch can figure out if
> it returns error pointers or NULL.  The big problem is that Smatch works
> on the precompiled code and doesn't understand ifdeffed code.
> 
> I haven't pushed all the Smatch checks.  I told someone last month, I'd
> give them a month to fix any bugs since it was their idea.  But I'll
> push it soon.
> 
> #if IS_ENABLED(CONFIG)
> function returns error pointer or valid
> #else
> struct foo *function() { return NULL; }
> #endif

Ouch, that hurts.

> I believe that there are also people who use a two pass Coccinelle
> system where they make a list of functions that return error pointers
> and then check the callers.
> 
> The Huawei devs find a bunch of these bugs through static analysis but
> I don't know which tools they are using.
> 
> Today, I accidentally introduced a bug by converting a call that can
> "in theory/the future return error pointers" but also returns NULL at
> the end of a list.  I thought it was only supposed to be checked for
> NULLs.  Fortunately Colin King found it right away.  That was just
> sloppiness on my part :/ and it's pretty rare to find code like that.

Do you think an annotation could still help, by making it explicit in
headers whether a function returns NULL or an error pointer, thus
helping developers get it right in the first place ?

-- 
Regards,

Laurent Pinchart
