Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3EBB18F526
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 13:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbgCWM75 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 08:59:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60646 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727326AbgCWM75 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 08:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=usfIE2fsx0DiKqOCX+1BK7SdAqjrfpyvoqPsNch3qEQ=; b=I4HNjjiv8I1GOq+AVZLURulh9O
        rS6Qx/AVd6PyFDheDzXhOpZi1PJJHtBFMQ35x0UMPQW2dtM+uZ7xv+D1gZ5/etmPelhhukIrz4jmx
        6kisnfyQHswxF5zJ3GIYTMhZpKvYW3JYm2qZnr22a4bGPDOS7SjPolVLVUuzZjqm2REsubolUeLNI
        jNN1M+rGwnM1nR7J0ESBHohSdQ+3pm2MLMJXJIU+Lg0XJH0huDZx9xR/a2lGZjOLORUH4mnFZE4oQ
        YNN+vUM08R7rG1IvBkiUY7VfM4W7vn4auSjK6bxpd04sDZJ66hrVG3acmxCg0POwCqdf+O7tp5r20
        /mPJYxMQ==;
Received: from ip5f5ad4e9.dynamic.kabel-deutschland.de ([95.90.212.233] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGMgB-0002gW-UR; Mon, 23 Mar 2020 12:59:44 +0000
Date:   Mon, 23 Mar 2020 13:59:33 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Pavel Machek <pavel@ucw.cz>, sean@mess.org,
        hverkuil-cisco@xs4all.nl, mchehab+samsung@kernel.org,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] Minimal libv4l2 support for complex cameras
Message-ID: <20200323135933.6ddbe4c3@coco.lan>
In-Reply-To: <20200323122442.GD12103@pendragon.ideasonboard.com>
References: <20200323114727.GA31063@amd>
        <20200323115753.GC12103@pendragon.ideasonboard.com>
        <20200323122216.GA18697@duo.ucw.cz>
        <20200323122442.GD12103@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 23 Mar 2020 14:24:42 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Pavel,
> 
> On Mon, Mar 23, 2020 at 01:22:17PM +0100, Pavel Machek wrote:
> > > On Mon, Mar 23, 2020 at 12:47:27PM +0100, Pavel Machek wrote:
> > >> Hi!
> > >> 
> > >> We now have easy-to-install support for complex camera in form of
> > >> Maemo Leste on N900.... Unfortunately we don't have anything in
> > >> userspace that can be used to work with the camera.
> > >> 
> > >> This attempts to be minimal solution to get libv4l2 to work.
> > > 
> > > libv4l2 is mostly deprecated.

Well, not really... I guess lots of userspace apps rely on it
(qv4l2, xawtv, tvtime, camorama, zbar, ...).

In order to be able to deprecate it, we need to add some code there
to let them bind via libcamera and test them with different hardware,
including the non-UVC ones.

> > > How about contributing an OMAP3 ISP
> > > pipeline handler to libcamera instead ? :-)
> > 
> > Why should it be instead?
> > 
> > I need something for kernel testing, and there is ton of apps using
> > it. Let me do this. libcamera might be future, but...
> 
> Sure, if it's useful for you, I won't prevent you from developing any
> code you want :-) But there's very little chance of getting it merged,
> and it would be useful to more people to have a support for that
> platform in libcamera. It's really your decision, and I'm not blaming
> you.

I created some time ago a fork of v4l-utils in order to be able to
merge the N900 work from Pavel. We can add the N900 work there - or 
on a separate branch at the main v4l-utils tree.

Thanks,
Mauro
