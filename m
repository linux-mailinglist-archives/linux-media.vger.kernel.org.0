Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78618627D28
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 12:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236475AbiKNL5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 06:57:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237114AbiKNL5A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 06:57:00 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AA4E2181A
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 03:53:59 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="295312256"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="295312256"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 03:53:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="727497671"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="727497671"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2022 03:53:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1ouY2D-00C9SJ-2i;
        Mon, 14 Nov 2022 13:53:53 +0200
Date:   Mon, 14 Nov 2022 13:53:53 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 06/17] media: atomisp: Also track buffers in a list
 when submitted to the ISP
Message-ID: <Y3IsUUUjonfNclcb@smile.fi.intel.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-7-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020195533.114049-7-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_SOFTFAIL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 20, 2022 at 09:55:22PM +0200, Hans de Goede wrote:
> Instead of using an integer to keep count of how many buffers have
> been handed over to the ISP (buffers_in_css) move buffers handed
> over to the ISP to a new buffers_in_css list_head so that we can
> easily loop over them.
> 
> This removes the need for atomisp_flush_video_pipe() to loop over
> all buffers and then (ab)use the state to figure out if they
> were handed over to the ISP.
> 
> Since the buffers are now always on a list when owned by the driver
> this also allows the buffer_done path on flush vs normal completion
> to be unified (both now need a list_del()) and this common code can
> now be factored out into a new atomisp_buffer_done() helper.
> 
> This is a preparation patch for moving the driver over to
> the videobuf2 framework.

...

> +int atomisp_buffers_in_css(struct atomisp_video_pipe *pipe)
>  {
>  	unsigned long irqflags;
> +	struct list_head *pos;
> +	int buffers_in_css = 0;
>  
> +	spin_lock_irqsave(&pipe->irq_lock, irqflags);
>  
> +	list_for_each(pos, &pipe->buffers_in_css)
> +		buffers_in_css++;
> +
> +	spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
> +
> +	return buffers_in_css;
> +}

Looking at this I come up with the
https://lore.kernel.org/r/20221114112842.38565-1-andriy.shevchenko@linux.intel.com

But I think your stuff will be earlier in upstream, so feel free to create
a followup later on.

...

> +		vb = list_first_entry_or_null(&pipe->activeq, struct videobuf_buffer, queue);
> +		if (vb) {

Wouldn't simply list_empty() work here? (Yes, you would need to have else
branch under spin lock, but codewise seems better to me).

> +			list_move_tail(&vb->queue, &pipe->buffers_in_css);
> +			vb->state = VIDEOBUF_ACTIVE;
>  		}

>  		spin_unlock_irqrestore(&pipe->irq_lock, irqflags);
>  
> +		if (!vb)
> +			return -EINVAL;


-- 
With Best Regards,
Andy Shevchenko


