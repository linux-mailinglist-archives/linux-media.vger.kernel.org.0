Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCEB1627D70
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 13:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236278AbiKNMOZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 07:14:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbiKNMOY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 07:14:24 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A4CE1ADBD
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 04:14:24 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="292351861"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="292351861"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 04:14:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="701981449"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="701981449"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 14 Nov 2022 04:14:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1ouYLz-00C9ug-2w;
        Mon, 14 Nov 2022 14:14:19 +0200
Date:   Mon, 14 Nov 2022 14:14:19 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 10/17] media: atomisp: Convert to videobuf2
Message-ID: <Y3IxGxZuJEO+yfcp@smile.fi.intel.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-11-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020195533.114049-11-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 20, 2022 at 09:55:26PM +0200, Hans de Goede wrote:
> Convert atomisp to use videobuf2.
> 
> This fixes mmap not working and in general moving over to
> the more modern videobuf2 is a good plan.

...

> -				/* The is the end, stop further loop */
> +			if (list_entry_is_head(param, &pipe->per_frame_params, list)) {
> +				/* The is the end, stop outer loop */
>  				break;
>  			}

You can drop {} by writing this as

			/* If this is the end, stop further loop */
			if (list_entry_is_head(param, &pipe->per_frame_params, list))
				break;

...

> +		if (!list_empty(&pipe->buffers_waiting_for_param))

Why not positive conditional?

> +			atomisp_handle_parameter_and_buffer(pipe);
> +		else
> +			atomisp_qbuffers_to_css(asd);

...

> +	/*
> +	 * Workaround: Due to the design of HALv3,
> +	 * sometimes in ZSL or SDV mode HAL needs to
> +	 * capture multiple images within one streaming cycle.
> +	 * But the capture number cannot be determined by HAL.
> +	 * So HAL only sets the capture number to be 1 and queue multiple
> +	 * buffers. Atomisp driver needs to check this case and re-trigger
> +	 * CSS to do capture when new buffer is queued.

Indentation of the above seems arbitrary.

> +	 */

...

> +	/*
> +	 * FIXME This if is copied from _vb2_fop_release, this cannot use that

 _vb2_fop_release() ?

> +	 * because that calls v4l2_fh_release() earlier then this function.
> +	 * Maybe we can release the fh earlier though, it does not look like
> +	 * anything needs it after this.
> +	 */

...

> +out:

In some cases you use 'unlock' in some 'out' for the same, I would suggest to
unify as

out_unlock:

in all affected locations.

> +	mutex_unlock(&isp->mutex);
> +	return ret;

-- 
With Best Regards,
Andy Shevchenko


