Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36B0918F471
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 13:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbgCWMYx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 08:24:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47360 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727508AbgCWMYx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 08:24:53 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2938B308;
        Mon, 23 Mar 2020 13:24:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584966291;
        bh=fYrO17nHPKqzL8PPnuGfhX7S38RVaT63tXdVPjmw3M8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IDFdIFAv6tNA8yjOP0kRnDkW28ltV8QsrqKuuMecxBL4+75Gjl0SJB8bGhvT9cTs3
         ux1+pldFEE//IZLIsJzQPvvfQp4TamjdDyIItYkV/KnTdaAZDMGXE3FaeYwe+IyXrW
         HOS92xzx09hLODH8InBv/9/FeRaYhJGF3o8HdMAY=
Date:   Mon, 23 Mar 2020 14:24:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     sean@mess.org, hverkuil-cisco@xs4all.nl,
        mchehab+samsung@kernel.org, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] Minimal libv4l2 support for complex cameras
Message-ID: <20200323122442.GD12103@pendragon.ideasonboard.com>
References: <20200323114727.GA31063@amd>
 <20200323115753.GC12103@pendragon.ideasonboard.com>
 <20200323122216.GA18697@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200323122216.GA18697@duo.ucw.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Pavel,

On Mon, Mar 23, 2020 at 01:22:17PM +0100, Pavel Machek wrote:
> > On Mon, Mar 23, 2020 at 12:47:27PM +0100, Pavel Machek wrote:
> >> Hi!
> >> 
> >> We now have easy-to-install support for complex camera in form of
> >> Maemo Leste on N900.... Unfortunately we don't have anything in
> >> userspace that can be used to work with the camera.
> >> 
> >> This attempts to be minimal solution to get libv4l2 to work.
> > 
> > libv4l2 is mostly deprecated. How about contributing an OMAP3 ISP
> > pipeline handler to libcamera instead ? :-)
> 
> Why should it be instead?
> 
> I need something for kernel testing, and there is ton of apps using
> it. Let me do this. libcamera might be future, but...

Sure, if it's useful for you, I won't prevent you from developing any
code you want :-) But there's very little chance of getting it merged,
and it would be useful to more people to have a support for that
platform in libcamera. It's really your decision, and I'm not blaming
you.

> >> It enables passing camera pipeline description to libv4l2, so that
> >> controls are mapped to appopriate devices, and libv4l2 can be used
> >> with complex camera.
> >> 
> >> It is useful for testing kernel parts of N900 subsystem, and it will
> >> serve as a basis for autofocus work and autogain improvements.
> >> 
> >> Signed-off-by: Pavel Machek <pavel@ucw.cz>

-- 
Regards,

Laurent Pinchart
