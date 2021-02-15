Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61DE131C020
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 18:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbhBORIs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 12:08:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:43396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231982AbhBORGb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 12:06:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51DC961493;
        Mon, 15 Feb 2021 17:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613408751;
        bh=qlDEjTny/wih/sMMQqRl+8DVcQluidusnPRkNYSDRK0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Z+zD1bzotvDEc5rnwTtfxq3cpHiWjbnHJ1ikgNfgV7uzxHVq5/JhTLf6L/pGHCVqK
         RtttacCk4yzbTNBjpe4TxYQRwh1Lu5bNCeiZLPVQX0NRjT8FliRnnxq76hpqF/lsT4
         j85GWP0KYWrHYyJ9qhqQBDX1aYZY4U7ltdN6VfLlvamJGxHJg6ga/6tFodxcGlLh9F
         akb8jUyQ+q8UubxPudJCRCov2h/94HIkAsOwDahsjixOQ9VfgObkWgT3TCwX1knfGt
         vxRgDQym4qXq78NVzDcaW4k7FfGm7VEs73gQuO+4BWquWaUnbFrB5Wk+7vaQUMDimD
         rIqaIRBWp9QDQ==
Date:   Mon, 15 Feb 2021 18:05:45 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v7 2/3] v4l: ioctl: Use %p4cc printk modifier to print
 FourCC codes
Message-ID: <20210215180545.7178e180@coco.lan>
In-Reply-To: <YCqnu61J2Q8rsrZa@alley>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
        <20210215114030.11862-3-sakari.ailus@linux.intel.com>
        <YCqnu61J2Q8rsrZa@alley>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 15 Feb 2021 17:56:27 +0100
Petr Mladek <pmladek@suse.com> escreveu:

> On Mon 2021-02-15 13:40:29, Sakari Ailus wrote:
> > Now that we can print FourCC codes directly using printk, make use of the
> > feature in V4L2 core.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>  
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> 
> I am curious whether I could take this via printk tree or if Mauro
> would prefer to take this via his tree.

IMO, the best would be if the entire series gets merged via a single
tree.

Feel free to merge via the printk one.

Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> 
> Anyway, there will be v8 with small changes in the 1st patch.
> 
> Best Regards,
> Petr



Thanks,
Mauro
