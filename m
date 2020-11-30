Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF6242C85FD
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 14:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbgK3NzU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 08:55:20 -0500
Received: from mga17.intel.com ([192.55.52.151]:29006 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726737AbgK3NzT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 08:55:19 -0500
IronPort-SDR: ZcpUTZ7YSJhmyl1ZRw3msG66XeVayhVjlcyXoA9WeWYrRUA435n6kRFoS+IeyJxVEB00VrqFLX
 Ach4TbMIIxTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="152469864"
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; 
   d="scan'208";a="152469864"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 05:53:38 -0800
IronPort-SDR: Ao8RXvPmDEAz0Ds/itDE6rFJeK3ffp0ww976qNBmYThfMVH9nOR0jPRlWneQX1FQMxXiWm79uV
 B4d8NxJ8kEEQ==
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; 
   d="scan'208";a="549105746"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2020 05:53:35 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 58269208FD; Mon, 30 Nov 2020 15:53:31 +0200 (EET)
Date:   Mon, 30 Nov 2020 15:53:31 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 2/2] media: i2c: Add support for the OV5648 image
 sensor
Message-ID: <20201130135331.GW3940@paasikivi.fi.intel.com>
References: <20201128143350.531460-1-paul.kocialkowski@bootlin.com>
 <20201128143350.531460-3-paul.kocialkowski@bootlin.com>
 <20201130092802.GU3940@paasikivi.fi.intel.com>
 <X8T4FH/QjRdLu0hS@aptenodytes>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8T4FH/QjRdLu0hS@aptenodytes>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

On Mon, Nov 30, 2020 at 02:48:04PM +0100, Paul Kocialkowski wrote:
> Hi Sakari,
> 
> On Mon 30 Nov 20, 11:28, Sakari Ailus wrote:
> > Hi Paul,
> > 
> > Thanks for the update. I have a few comments on the driver, too.
> 
> Thanks for the review!
> 
> [...]
> 
> > > +	ret = ov5648_write(sensor, OV5648_GAIN_BLUE_MAN_L_REG,
> > > +			   OV5648_GAIN_BLUE_MAN_L(blue_balance));
> > 
> > return ...
> > 
> > Same below (and above).
> 
> Well I don't think that makes any functional difference, right?
> My personal preference is to have explicit checks even at the end of functions
> for symetry and alignment with other blocks.
> 
> If it's okay, it'd like to keep it as-is. But if that's against kernel coding
> style guidelines, I won't argue more.

Please do change them.

It's useless code, repeated at the end of a number of functions in this
driver. I wouldn't mind otherwise, but people do take examples from
existing drivers so such patterns tend to repeat in other places.

-- 
Regards,

Sakari Ailus
