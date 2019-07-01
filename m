Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 724915B7F6
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 11:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728243AbfGAJYr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 05:24:47 -0400
Received: from mga07.intel.com ([134.134.136.100]:4854 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728111AbfGAJYr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Jul 2019 05:24:47 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Jul 2019 01:46:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,438,1557212400"; 
   d="scan'208";a="174157463"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002.jf.intel.com with ESMTP; 01 Jul 2019 01:46:39 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 741D72080B; Mon,  1 Jul 2019 11:46:38 +0300 (EEST)
Date:   Mon, 1 Jul 2019 11:46:38 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
Message-ID: <20190701084638.kt3bdyzfumk6ujgu@paasikivi.fi.intel.com>
References: <20190520201812.7937-1-marex@denx.de>
 <20190520201812.7937-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520201812.7937-2-marex@denx.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

One more comment...

On Mon, May 20, 2019 at 10:18:12PM +0200, Marek Vasut wrote:
...
> +static int isl7998x_set_fmt(struct v4l2_subdev *sd,
> +		struct v4l2_subdev_pad_config *cfg,
> +		struct v4l2_subdev_format *format)
> +{
> +	struct isl7998x *isl7998x = sd_to_isl7998x(sd);
> +	struct v4l2_mbus_framefmt *mf = &format->format;
> +	int ret;
> +
> +	if (format->pad != 0)
> +		return -EINVAL;
> +
> +	if (format->format.width != 720 ||
> +	    (format->format.height != 480 && format->format.height != 576))
> +		return -EINVAL;
> +
> +	if (format->format.code != MEDIA_BUS_FMT_YUYV8_2X8)
> +		return -EINVAL;
> +
> +	mf->width	= format->format.width;
> +	mf->height	= format->format.height;
> +	mf->code	= format->format.code;
> +	mf->field	= V4L2_FIELD_INTERLACED;
> +	mf->colorspace	= 0;
> +
> +	if (format->which != V4L2_SUBDEV_FORMAT_TRY) {
> +		ret = isl7998x_update_std(isl7998x);
> +		if (ret)
> +			return ret;
> +		mf->width = isl7998x->width;
> +		mf->height = isl7998x->height;
> +		isl7998x->fmt = &isl7998x_colour_fmts[0];
> +	}

Note that as the driver exposes a sub-device node to the user space, it's
responsible for serialising the access to its own data structures that are
accessed by other drivers or through its uAPI nodes. Most drivers use the
same mutex as the control handler, as controls usually deal with at least
some of the same data.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
