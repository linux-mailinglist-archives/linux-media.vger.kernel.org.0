Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB2E51BD48
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 12:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355799AbiEEKfz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 06:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355857AbiEEKfk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 06:35:40 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B4910FEC
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 03:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651746717; x=1683282717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hV+Oz6Q49NUJwuo+ysBpEscklaHs+Yh0vaIMdarY5fw=;
  b=Z1DTJJkdNollx7UMjxhOywkho6iDtdiMTegFnq/FXz7TpoRDGWzTrSTm
   LpNVn/S+vwdEfwY6nyz2YSahIkWYXY5rzB7wNsRjPCWH5+TeaB2HNDfSJ
   4RjyxgL6H3vswBvOXWaM3GidW/XSvBVBkE7GEDJXX0tZbxCG4aP8ck3uE
   /BL1FwsaY/moHgJpsJYvrEoP7ihCfHfAf5/X2oXWXwozTq0WW0FxeM7o8
   FctFMdKe8TmXb0kj2NWoQag/YOmEF507Xki32//b/1ho6QKAdLP2GIW+b
   Esi90ZM+e4Eb2Q7fXcZTOjlI+ZVvO3tWQf3iTBxvoTiarXamdpJmKVL/+
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="266909081"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="266909081"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 03:31:57 -0700
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="537279109"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 03:31:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nmYlz-00CF7a-S4;
        Thu, 05 May 2022 13:31:51 +0300
Date:   Thu, 5 May 2022 13:31:51 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH v3 15/15] media: i2c: Add vblank control to ov7251 driver
Message-ID: <YnOnl51UTkg28/FW@smile.fi.intel.com>
References: <20220504223027.3480287-1-djrscally@gmail.com>
 <20220504223027.3480287-16-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504223027.3480287-16-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 04, 2022 at 11:30:27PM +0100, Daniel Scally wrote:
> Add a vblank control to the ov7251 driver.

> +static int ov7251_vts_configure(struct ov7251 *ov7251, s32 vblank)
> +{
> +	u8 vts[2];
> +
> +	vts[0] = ((ov7251->current_mode->height + vblank) & 0xff00) >> 8;
> +	vts[1] = ((ov7251->current_mode->height + vblank) & 0x00ff);

__be16 vts;

cpu_to_be16();

> +	return ov7251_write_seq_regs(ov7251, OV7251_TIMING_VTS_REG, vts, 2);
> +}

-- 
With Best Regards,
Andy Shevchenko


