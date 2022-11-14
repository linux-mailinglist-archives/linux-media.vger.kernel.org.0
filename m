Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C33C6627D41
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 13:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236753AbiKNMDL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 07:03:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237039AbiKNMCj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 07:02:39 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB24220F9
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 04:00:55 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="311954836"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="311954836"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 04:00:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="707288213"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="707288213"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 14 Nov 2022 04:00:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1ouY8v-00C9bt-0x;
        Mon, 14 Nov 2022 14:00:49 +0200
Date:   Mon, 14 Nov 2022 14:00:49 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 09/17] media: atomisp: Add ia_css_frame_get_info()
 helper
Message-ID: <Y3It8afev5+8vjpo@smile.fi.intel.com>
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-10-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020195533.114049-10-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 20, 2022 at 09:55:25PM +0200, Hans de Goede wrote:
> Several places rely on the [frame_]info member being the first member of
> struct ia_css_frame, so that &frame->info will yield NULL when frame is
> NULL (some places already explicitly check for a NULL frame pointer but
> not nearly all).
> 
> For videobuf2 support the vb2_v4l2_buffer struct needs to be embedded
> in the frame struct and it needs to be the first member. Breaking the
> assumption that &frame->info will yield NULL when frame is NULL.
> 
> Add a ia_css_frame_get_info() helper to return either the ia_css_frame_info
> struct embedded in the frame, or NULL when the frame pointer is NULL and
> use this in places where a ia_css_frame_info ptr or NULL is expected.
> 
> To make sure that we catch all uses of the info field this patch also
> renames the info field to frame_info.
> 
> This is a preparation patch for converting the driver to videobuf2.

...

> +	const struct ia_css_frame_info *in_frame_info = ia_css_frame_get_info(in_frame);
>  	const unsigned int ddr_bits_per_element = sizeof(short) * 8;

Side note: BITS_PER_TYPE().

...

> +	const struct ia_css_frame_info *in_frame_info = ia_css_frame_get_info(in_frame);
>  	const unsigned int ddr_bits_per_element = sizeof(short) * 8;

Ditto.

>  	const unsigned int ddr_elems_per_word = ceil_div(HIVE_ISP_DDR_WORD_BITS,
>  						ddr_bits_per_element);

-- 
With Best Regards,
Andy Shevchenko


