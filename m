Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDD22BBC89
	for <lists+linux-media@lfdr.de>; Sat, 21 Nov 2020 04:08:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgKUDFu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 22:05:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgKUDFu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 22:05:50 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22367C0613CF;
        Fri, 20 Nov 2020 19:05:50 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id w4so8956217pgg.13;
        Fri, 20 Nov 2020 19:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gYKT1GDgUHKwabD+/L4YI6p0Bq1tA9NESqAu6acmN7k=;
        b=Jt12FkG08jW5RD6a+8HuZt/j09dxpXvkQQf6aOg1kA8ZZ1pRCURlI7aWvDRftqIiMo
         zwrDrO+Nzn3V2Nmp0phJPm5XEuAg61iNmaL1Uf9DhoAYH/MWjyypLjdFdL5Cfzl/4DXb
         ZFYcb0wpf5L3Y7uAiW04ePUbTG3C7fQbEiaU4MMPsHLuThNfCu2afSRcN7s8fKsYaL6I
         UC2Fpb4UTxE/TGHXHVhpV6fqt+7fTOh7VmwJjwEVmw2uAZqaEq/CMm84atPSsMofZzzW
         q1Xc4zunk/oxApuuWOQu7Yj6x7F2DJn7b/rWlIqp7BCm0zKH7h6E2k7pRhA4FMi0YBTH
         4Syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gYKT1GDgUHKwabD+/L4YI6p0Bq1tA9NESqAu6acmN7k=;
        b=fD/Z7M6YY0SuG2Hh7Kzwsjw1J67dUYGPs3umpGwpkT934G8rIrU98yk08wOa83vF7w
         PjqOUnUXghU1c3bEewWc0Fe1s8ymjny1XmWqbgWPLri1qGb1/NpM4q3s6i+CI5BI7NLV
         Y/Als7cBVVPg8NPvjhciXY5ujpNWVU0fDkWb7F7rb/+4HyLOIUeJqAGxWfOd2Qyze24a
         gGtikJr/l9k/ZK2BFu2ZZGp9dawuepHRlOPA4B0aPslYYXFCjVh373BlHYacPI5UVtt4
         EBy93C5Q/vIOgcXB+Qa7tmypdcJGw1z2W5ceuMnLVDDIF/op6WIDg1daMUNfNkbBnmX+
         eh9g==
X-Gm-Message-State: AOAM53255yKOD1Xa7J2Hj8RRJw+k8O6UDk/o7e67+rMKplgraKjQaIUZ
        VriF9z8cMya2wXno/Nm+ums=
X-Google-Smtp-Source: ABdhPJyGZGZ+jhkUFhHyn0H6d+ko+ffJV0IZvahprxmJuX505stpS6p4RUoZz7RmUdOJI4PtVv1PKw==
X-Received: by 2002:a17:90b:150c:: with SMTP id le12mr13795556pjb.139.1605927949355;
        Fri, 20 Nov 2020 19:05:49 -0800 (PST)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id p4sm5582693pjo.6.2020.11.20.19.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 19:05:47 -0800 (PST)
Date:   Sat, 21 Nov 2020 12:05:46 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
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
Message-ID: <X7iECnYR+GpXp7xO@jagdpanzerIV.localdomain>
References: <20201113105441.1427-1-sakari.ailus@linux.intel.com>
 <X7fnc+xsVXPg4Op6@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X7fnc+xsVXPg4Op6@alley>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/11/20 16:57), Petr Mladek wrote:
> On Fri 2020-11-13 12:54:41, Sakari Ailus wrote:
> > Add a printk modifier %p4cc (for pixel format) for printing V4L2 and DRM
> > pixel formats denoted by fourccs. The fourcc encoding is the same for both
> > so the same implementation can be used.
> > 
> > Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> The last version looks fine to me.
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss
