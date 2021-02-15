Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E88C31C078
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 18:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbhBOR0K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 12:26:10 -0500
Received: from mga05.intel.com ([192.55.52.43]:38865 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232355AbhBORYd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 12:24:33 -0500
IronPort-SDR: 5p6Ry4wqy1Lgh5KRhoWxZy8uS35Iwz+pLKIMxuHOd+06YRHP2u+hWX5N/74gM0wUNrCyJHIaR2
 yoZR+VxQxThw==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="267575380"
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; 
   d="scan'208";a="267575380"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 09:22:41 -0800
IronPort-SDR: xefnQJpzJ5DrCRisWmrD7Ac76UF3NqQhUSqIibI+Hqxl0EtDmoiGjuNP5Gw0b8QHVoBMltecHQ
 PbcSzLnZCenA==
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; 
   d="scan'208";a="438637738"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 09:22:37 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id D590F20518;
        Mon, 15 Feb 2021 19:22:35 +0200 (EET)
Date:   Mon, 15 Feb 2021 19:22:35 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
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
Message-ID: <20210215172235.GK3@paasikivi.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-3-sakari.ailus@linux.intel.com>
 <YCqnu61J2Q8rsrZa@alley>
 <20210215180545.7178e180@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210215180545.7178e180@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 15, 2021 at 06:05:45PM +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 15 Feb 2021 17:56:27 +0100
> Petr Mladek <pmladek@suse.com> escreveu:
> 
> > On Mon 2021-02-15 13:40:29, Sakari Ailus wrote:
> > > Now that we can print FourCC codes directly using printk, make use of the
> > > feature in V4L2 core.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>  
> > 
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > 
> > I am curious whether I could take this via printk tree or if Mauro
> > would prefer to take this via his tree.
> 
> IMO, the best would be if the entire series gets merged via a single
> tree.
> 
> Feel free to merge via the printk one.
> 
> Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks, Mauro!

-- 
Sakari Ailus
