Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7BA76BBB2
	for <lists+linux-media@lfdr.de>; Tue,  1 Aug 2023 19:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbjHARvv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Aug 2023 13:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjHARvt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Aug 2023 13:51:49 -0400
Received: from mgamail.intel.com (unknown [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00046126
        for <linux-media@vger.kernel.org>; Tue,  1 Aug 2023 10:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690912308; x=1722448308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=23Wc3k0mFLbrQycUcEsHy3FEUV7003iJlGRdyTKc6ms=;
  b=WRT98ZQu3pv8AFD8jErVRk4p2F2YMeWXWW4WZXNHoottfqAMptBK5Eb3
   SY7S6f5DbP8QZKFOGEBYgSLBpRvZ3NpBX8kCRC0TgY8ftrric6qPuCdhv
   RR3A8n4ArcwdEgYUWEj6J97lgtwKPzEggdkXqia+CAYuHWrDQge6TlDOu
   6Q5ZjtFQk9igu4TZENavKNnBKL56d8tupVsGGvXh76WkmZXrJyxiyhpsH
   r8BZhamH1Nk8F9xDBHfatuuJHXhgSIu7uRopfe08w8/rKpNs6F2TFOmBD
   J91LpdzkFobur3VDVF74fxG/mJPvq4X5vzTAlRNvZ38t1D2yfdyNEPsOL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="368273817"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="368273817"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 10:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="758441153"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="758441153"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 01 Aug 2023 10:51:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qQtX2-00DKb2-0b;
        Tue, 01 Aug 2023 20:51:40 +0300
Date:   Tue, 1 Aug 2023 20:51:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        Andrey Utkin <andrey_utkin@fastmail.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Ismael Luceno <ismael@iodev.co.uk>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-media@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/24] ALSA: Generic PCM copy ops using sockptr_t
Message-ID: <ZMlGKy7ibjkQ6ii7@smile.fi.intel.com>
References: <20230731154718.31048-1-tiwai@suse.de>
 <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
 <87h6pjj2ui.wl-tiwai@suse.de>
 <a02cf5c3-1fac-4ec6-9d9c-f8e8d0c067e0@sirena.org.uk>
 <87leeugbxm.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87leeugbxm.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 01, 2023 at 02:54:45PM +0200, Takashi Iwai wrote:
> On Mon, 31 Jul 2023 21:40:20 +0200,
> Mark Brown wrote:
> > On Mon, Jul 31, 2023 at 09:30:29PM +0200, Takashi Iwai wrote:
> > > Mark Brown wrote:
> > 
> > > > It really feels like we ought to rename, or add an alias for, the type
> > > > if we're going to start using it more widely - it's not helping to make
> > > > the code clearer.
> > 
> > > That was my very first impression, too, but I changed my mind after
> > > seeing the already used code.  An alias might work, either typedef or
> > > define genptr_t or such as sockptr_t.  But we'll need to copy the
> > > bunch of helper functions, too...
> > 
> > I would predict that if the type becomes more widely used that'll happen
> > eventually and the longer it's left the more work it'll be.
> 
> That's true.  The question is how more widely it'll be used, then.
> 
> Is something like below what you had in mind, too?

I agree with your proposal (uniptr_t also works for me), but see below.

...

> +#include <linux/slab.h>
> +#include <linux/uaccess.h>

But let make the list of the headers right this time.

It seems to me that

err.h
minmax.h // maybe not, see a remark at the bottom
string.h
types.h

are missing.

More below.

...

> +	void *p = kmalloc_track_caller(len, GFP_USER | __GFP_NOWARN);
> +
> +	if (!p)
> +		return ERR_PTR(-ENOMEM);

This can use cleanup.h.

> +	if (copy_from_uniptr(p, src, len)) {
> +		kfree(p);
> +		return ERR_PTR(-EFAULT);
> +	}
> +	return p;
> +}
> +
> +static inline void *memdup_uniptr_nul(uniptr_t src, size_t len)
> +{
> +	char *p = kmalloc_track_caller(len + 1, GFP_KERNEL);

Ditto.

> +	if (!p)
> +		return ERR_PTR(-ENOMEM);
> +	if (copy_from_uniptr(p, src, len)) {
> +		kfree(p);
> +		return ERR_PTR(-EFAULT);
> +	}
> +	p[len] = '\0';
> +	return p;
> +}

...

> +static inline long strncpy_from_uniptr(char *dst, uniptr_t src, size_t count)
> +{
> +	if (uniptr_is_kernel(src)) {
> +		size_t len = min(strnlen(src.kernel, count - 1) + 1, count);

I didn't get why do we need min()? To check the count == 0 case?

Wouldn't

		size_t len;

		len = strnlen(src.kernel, count);
		if (len == 0)
			return 0;

		/* Copy a trailing NUL if found */
		if (len < count)
			len++;

be a good equivalent?

> +		memcpy(dst, src.kernel, len);
> +		return len;
> +	}
> +	return strncpy_from_user(dst, src.user, count);
> +}

...

> +static inline int check_zeroed_uniptr(uniptr_t src, size_t offset, size_t size)
> +{
> +	if (!uniptr_is_kernel(src))

Why not to align all the functions to use same conditional (either always
positive or negative)?

> +		return check_zeroed_user(src.user + offset, size);
> +	return memchr_inv(src.kernel + offset, 0, size) == NULL;
> +}

...

Taking all remarks into account I would rather go with sockptr.h being
untouched for now, just a big

/* DO NOT USE, it's obsolete, use uniptr.h instead! */

to be added.

-- 
With Best Regards,
Andy Shevchenko


