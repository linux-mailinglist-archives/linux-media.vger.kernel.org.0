Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C0A413387
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 14:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232685AbhIUMu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 08:50:27 -0400
Received: from mga18.intel.com ([134.134.136.126]:20277 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230052AbhIUMu1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 08:50:27 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="210426351"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; 
   d="scan'208";a="210426351"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 05:48:58 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; 
   d="scan'208";a="556917250"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 05:48:56 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 03A9020656; Tue, 21 Sep 2021 15:48:53 +0300 (EEST)
Date:   Tue, 21 Sep 2021 15:48:53 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kieran.bingham@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com
Subject: Re: [PATCH v3 2/2] media: i2c: Add support for ov5693 sensor
Message-ID: <YUnUtdXpYdoIyb4s@paasikivi.fi.intel.com>
References: <20210920225422.42618-1-djrscally@gmail.com>
 <20210920225422.42618-3-djrscally@gmail.com>
 <YUmhuYiFoSL21bj4@paasikivi.fi.intel.com>
 <6fda38af-2556-4796-b3c5-a80a864466f4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fda38af-2556-4796-b3c5-a80a864466f4@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Tue, Sep 21, 2021 at 12:47:56PM +0100, Daniel Scally wrote:
> > +
> > +static int ov5693_get_exposure(struct ov5693_device *ov5693, s32 *value)
> > +{
> > +	u8 exposure_hh = 0, exposure_h = 0, exposure_l = 0;
> > +	int ret;
> > +
> > +	ret = ov5693_read_reg(ov5693, OV5693_EXPOSURE_L_CTRL_HH_REG, &exposure_hh);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = ov5693_read_reg(ov5693, OV5693_EXPOSURE_L_CTRL_H_REG, &exposure_h);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = ov5693_read_reg(ov5693, OV5693_EXPOSURE_L_CTRL_L_REG, &exposure_l);
> > +	if (ret)
> > +		return ret;
> > Does the sensor not allow reading this register as a single operation?
> >
> > Just a question. Some sensors from the vendor do not. Same for the writes.
> 
> 
> It does; if I'm honest I just preferred the individual read/writes. I
> find it's easier to see exactly what's going on. Happy to change it if
> you prefer though - it's less important now that the work is mostly done.

It's certainly not wrong to do that but it takes a longer time. So you're
much, much more likely to miss the frame you intended the settings to take
effect. Also note the device could have a specific order in which to write
them for the update to be atomic. Missing this could cause wildly
misexposed frames. I don't know if this one does.

-- 
Regards,

Sakari Ailus
