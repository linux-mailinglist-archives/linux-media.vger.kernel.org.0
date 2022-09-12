Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC3945B5986
	for <lists+linux-media@lfdr.de>; Mon, 12 Sep 2022 13:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbiILLnq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Sep 2022 07:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbiILLno (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Sep 2022 07:43:44 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34D43C8F9
        for <linux-media@vger.kernel.org>; Mon, 12 Sep 2022 04:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662983023; x=1694519023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K8wjR7XrLw/ghno2pkZYT2g65/NP/XaLvcEo8Ee8X3g=;
  b=M8Ukx5HTkmPmooE0TM3ERdyykL82ERWlmB2cYY0asRU1UssjKoRkDTgl
   M9jmbNalBSsa0PabkMviU0U6ojAcSarU8jrVUhWGXP4v6CqLiTiszpAbk
   g83yHTcW/XyQDuHCPxI49OAYaTHnd+mGyryEB8kQ+ksv3tqMwkjqB7ZCT
   xtXv4oqGKvcfV6ZCklccb046s75lh3naSrUKP28XnmNBNn/je2nh6ZD+X
   5uFPr3OQqVFSYXw3rZjVOJ2io5zZ80VjgD9jU1Mpc4eDVHaGbSJWDBjlY
   K8ANqxGHu4xTr6OsPKgE+Vg8zcrkaYa0c4FRB3g+VfZr6eSRJZoS7XVdR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="297845447"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="297845447"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 04:43:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="684400965"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 04:43:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1oXhqh-001KUn-2L;
        Mon, 12 Sep 2022 14:43:35 +0300
Date:   Mon, 12 Sep 2022 14:43:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 16/17] media: atomisp: Remove
 atomisp_source_pad_to_stream_id()
Message-ID: <Yx8bZ4h8wrCGy80m@smile.fi.intel.com>
References: <20220911171653.568932-1-hdegoede@redhat.com>
 <20220911171653.568932-17-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220911171653.568932-17-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 11, 2022 at 07:16:52PM +0200, Hans de Goede wrote:
> atomisp_source_pad_to_stream_id() returns ATOMISP_INPUT_STREAM_GENERAL
> unconditionally now. Drop it and directly use ATOMISP_INPUT_STREAM_GENERAL
> in its callers.

...

> -				atomisp_css_capture_enable_online(asd, stream_index, false);
> +				atomisp_css_capture_enable_online(
> +					asd, ATOMISP_INPUT_STREAM_GENERAL, false);

asd can be left on the same line. no?


...

> +		ret = atomisp_css_copy_get_output_frame_info(
> +			asd, ATOMISP_INPUT_STREAM_GENERAL, output_info);

Ditto.

...

> -		atomisp_css_input_set_effective_resolution(isp_sd, stream_id,
> +		atomisp_css_input_set_effective_resolution(
> +			isp_sd, ATOMISP_INPUT_STREAM_GENERAL,
>  			crop[pad]->width, crop[pad]->height);

In the similar way...

-- 
With Best Regards,
Andy Shevchenko


