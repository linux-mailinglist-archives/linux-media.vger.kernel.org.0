Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7363E5DE7
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 16:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237788AbhHJOaF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 10:30:05 -0400
Received: from mga02.intel.com ([134.134.136.20]:12553 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230308AbhHJOaE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 10:30:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="202094748"
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="202094748"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 07:29:41 -0700
X-IronPort-AV: E=Sophos;i="5.84,310,1620716400"; 
   d="scan'208";a="570798506"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2021 07:29:37 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 1259820364;
        Tue, 10 Aug 2021 17:29:35 +0300 (EEST)
Date:   Tue, 10 Aug 2021 17:29:35 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        andy.shevchenko@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 08/12] media: i2c: Add hblank control to ov8865
Message-ID: <20210810142934.GE3@paasikivi.fi.intel.com>
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-9-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809225845.916430-9-djrscally@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Mon, Aug 09, 2021 at 11:58:41PM +0100, Daniel Scally wrote:
> @@ -2542,6 +2544,13 @@ static int ov8865_ctrls_init(struct ov8865_sensor *sensor)
>  				     0, 0, ov8865_test_pattern_menu);
>  
>  	/* Blanking */
> +	hblank = mode->hts < mode->output_size_x ? 0 : mode->hts - mode->output_size_x;

Is the result in relation with the analogue crop size? Based on the above
it wouldn't seem like that.

> +	ctrls->hblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_HBLANK, hblank,
> +					  hblank, 1, hblank);
> +
> +	if (ctrls->hblank)
> +		ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
>  	vblank_max = OV8865_TIMING_MAX_VTS - mode->output_size_y;
>  	vblank_def = mode->vts - mode->output_size_y;
>  	ctrls->vblank = v4l2_ctrl_new_std(handler, ops, V4L2_CID_VBLANK,

-- 
Sakari Ailus
