Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B63692BAF69
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 16:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729966AbgKTP5m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 10:57:42 -0500
Received: from mx2.suse.de ([195.135.220.15]:51608 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729911AbgKTP5m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 10:57:42 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1605887860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=USMB2Oora/OLgO94kKepkF0GaoTAGWU9NisPoIPkkqg=;
        b=q/moGA/bK2sKeDvBbfEkntpJdbns+bY/vXpEOE0JtTKwNwHvuxWKS9RVyq55QbKF/tpv7y
        JABpMkFz69lxH2n+9ym1DvD9OWJTYiHQLxePs8ItANAKq2xetUg1AhTxa7bCeCuhBhnYCe
        PKUwuTmFKMeZGvcANi4Bn4NNQQoZni0=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3C3AFACBA;
        Fri, 20 Nov 2020 15:57:40 +0000 (UTC)
Date:   Fri, 20 Nov 2020 16:57:39 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v5 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
Message-ID: <X7fnc+xsVXPg4Op6@alley>
References: <20201113105441.1427-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113105441.1427-1-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri 2020-11-13 12:54:41, Sakari Ailus wrote:
> Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> pixel formats denoted by fourccs. The fourcc encoding is the same for both
> so the same implementation can be used.
> 
> Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

The last version looks fine to me.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
