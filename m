Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1BBA2D5989
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 12:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbgLJLno (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 06:43:44 -0500
Received: from mx2.suse.de ([195.135.220.15]:40654 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727043AbgLJLnj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 06:43:39 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1607600572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=b5dIRaLNX6aRE22CFde/Fg59anE9N6upllD4rSYJw5o=;
        b=ELHSvPFtseK9UMLnXhb2ow62vSI8w05u9PAFKm0KHoq7zWYpKtNbKhCKd2pll+hOhQ75zx
        bjPzNTc8x/ZG965OrAustYCiXDFh654zaDVSi9AQziGZaluHdplpaSHI9z3FVvpRax9iwT
        j9BmKFaFHeu+K3MqOUpbqM24+9jN8zI=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 339BAAD6B;
        Thu, 10 Dec 2020 11:42:51 +0000 (UTC)
Date:   Thu, 10 Dec 2020 09:34:11 +0100
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
Message-ID: <X9Hdg3lJm+TZAQGX@alley>
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

Andy, Rasmus,

the last version looks fine to me. I am going to push it.
Please, speak up if you are against it.

Best Regards,
Petr
