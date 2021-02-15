Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0653731BA8D
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 14:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhBONux (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Feb 2021 08:50:53 -0500
Received: from mga04.intel.com ([192.55.52.120]:3452 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229805AbhBONui (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Feb 2021 08:50:38 -0500
IronPort-SDR: BaL9/nUIttOaIv7FOT7OpJSxM2jDEBrk7Qm+TQTycle6UniRyHE5JmPJz9gjEYMKfv0nABD0/Y
 GiUS+YpbIUpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9895"; a="180123256"
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="180123256"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 05:48:37 -0800
IronPort-SDR: R+vTNA8KsI7v/v3QB9ncTDcyBiWLW0KQZIWz8nfziTZynxrchxmy56k75BSox1RrD4HxmfOCSd
 esSfNbQ2d5sA==
X-IronPort-AV: E=Sophos;i="5.81,180,1610438400"; 
   d="scan'208";a="400656303"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2021 05:48:33 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id D1CBE20345;
        Mon, 15 Feb 2021 15:48:30 +0200 (EET)
Date:   Mon, 15 Feb 2021 15:48:30 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Petr Mladek <pmladek@suse.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joe Perches <joe@perches.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v7 3/3] drm: Switch to %p4cc format modifier
Message-ID: <20210215134830.GG3@paasikivi.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-4-sakari.ailus@linux.intel.com>
 <YCp5+okZ2M0SLTY9@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YCp5+okZ2M0SLTY9@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On Mon, Feb 15, 2021 at 03:41:14PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 15, 2021 at 01:40:30PM +0200, Sakari Ailus wrote:
> > Switch DRM drivers from drm_get_format_name() to %p4cc. This gets rid of a
> > large number of temporary variables at the same time.
> 
> What a nice clean up!
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks!

> after addressing nit-picks below.
> 
> Side note (no need to implement esp. right now): it seems often it's coupled
> with modifier, would be nice to have them together that %p4ccM or so can do it
> in one go.

...

> > diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> > index 03262472059c..5cf45aa6eedc 100644
> > --- a/drivers/gpu/drm/drm_fourcc.c
> > +++ b/drivers/gpu/drm/drm_fourcc.c
> > @@ -30,11 +30,6 @@
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_fourcc.h>
> >  
> > -static char printable_char(int c)
> > -{
> > -	return isascii(c) && isprint(c) ? c : '?';
> > -}
> 
> If it goes as an ABI than your dot is incompatible with this and '?' should be
> used instead in the patch 1. And I bend towards suggested '?' rather than '.'.
> 
> Also it means that you probably would need different specifiers for full and
> short formats.

I thought of that, but then the resulting string would be indeed different
and comparing short and long formats would be harder. Remember this is for
debug prints. If the format is too long, then it should be made shorter,
but during the earlier review rounds people have expressed interest in
having this information there.

"?" can be expanded by the shell whereas "." is not. If DRM folks think we
should go back to "?" I'm fine with that. Also note that there's something
wrong with the fourcc code to begin with if it's got either "." or "?".

-- 
Regards,

Sakari Ailus
