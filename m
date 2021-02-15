Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B79F31BFFF
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 18:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232210AbhBORAx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 12:00:53 -0500
Received: from mx2.suse.de ([195.135.220.15]:50898 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230382AbhBOQ7s (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 11:59:48 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1613408336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FPSG3A8oDrYdxsCr7hOsAwO6YJ83QxuxyjyxdATwhNw=;
        b=GIgzkU6WIVxRdGj0YMauIeuveky7xciSDMxYts2cUcN5BD7aDzpl+Bh+Xefcj/dNmkvsLL
        OlTQQS74eCV9+XjmjzsawITwtZZGwou/Xw4sbu21xQ+WRsHbpAKjDVGt4aqSJoiKFuU7Jp
        BzNb/Gv2Q85pCbSOp8w2d/g9ExI1ky4=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 18F4AACD9;
        Mon, 15 Feb 2021 16:58:56 +0000 (UTC)
Date:   Mon, 15 Feb 2021 17:58:40 +0100
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
Subject: Re: [PATCH v7 3/3] drm: Switch to %p4cc format modifier
Message-ID: <YCqoQMQPWVOzEN//@alley>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215114030.11862-4-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon 2021-02-15 13:40:30, Sakari Ailus wrote:
> Switch DRM drivers from drm_get_format_name() to %p4cc. This gets rid of a
> large number of temporary variables at the same time.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

I wonder if I could this via printk tree. Or if should rather go
via DRM tree.

Anyway, there will be v8 with small changes in the 1st patch.

Best Regards,
Petr
