Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C30313597
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 15:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbhBHOuQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 09:50:16 -0500
Received: from mga09.intel.com ([134.134.136.24]:24042 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232839AbhBHOtU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 09:49:20 -0500
IronPort-SDR: 7ZgDWqXiT9IIlV6nI3oT9z9B2wlwIVCDbvuhaKJIaMQtFw8lC7Kq92eC1jxUeUbgAcwXV9WrNU
 WuwFFbOmUNGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="181867690"
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; 
   d="scan'208";a="181867690"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 06:47:32 -0800
IronPort-SDR: b1VbLEL2wY8yKR//s6K0YuxpUuMlNgo6s2SDORv0BJViJm9FJky2XPwi+qlmmQxMBv7pcffjlT
 /wu/rBO/sTZg==
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; 
   d="scan'208";a="487444092"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 06:47:31 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 46C422082C; Mon,  8 Feb 2021 16:46:59 +0200 (EET)
Date:   Mon, 8 Feb 2021 16:46:59 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] media: atomisp: Remove unused header
Message-ID: <20210208144659.GW32460@paasikivi.fi.intel.com>
References: <20210122123303.41190-1-andriy.shevchenko@linux.intel.com>
 <YCFIbwXv8+SDnZwO@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCFIbwXv8+SDnZwO@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Mon, Feb 08, 2021 at 04:19:27PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 22, 2021 at 02:33:03PM +0200, Andy Shevchenko wrote:
> > sfi.h is not anyhow used by the driver. Remove it.
> 
> Mario, Sakari, any comments on this?
> Can you give your Ack to get this thru another tree?

Feel free to go ahead on my behalf; I see no issue with that.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  drivers/staging/media/atomisp/include/linux/atomisp_platform.h | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> > index 5a5121d958ed..8c65733e0255 100644
> > --- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> > +++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> > @@ -22,7 +22,6 @@
> >  #include <asm/processor.h>
> >  
> >  #include <linux/i2c.h>
> > -#include <linux/sfi.h>
> >  #include <media/v4l2-subdev.h>
> >  #include "atomisp.h"
> >  
> > -- 
> > 2.29.2
> > 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Kind regards,

Sakari Ailus
