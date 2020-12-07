Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412262D1268
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 14:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726249AbgLGNos (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 08:44:48 -0500
Received: from mga04.intel.com ([192.55.52.120]:29588 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgLGNor (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 08:44:47 -0500
IronPort-SDR: DzoC3Ks07h/ZytwKbwi+fqjcKpKpq1g4RzaSqQOeIZPbphPEdvTANbdh1DJTIVx1ObP+lg8tiq
 f1TfTyWSl9Kw==
X-IronPort-AV: E=McAfee;i="6000,8403,9827"; a="171127434"
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; 
   d="scan'208";a="171127434"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 05:43:01 -0800
IronPort-SDR: tQpXjAH9s1uKpXrvTCiEI6HiaWEGsUrkVe7s5eyagYL08aVxVjDDeF526Jm7kGYE+EiSIHu+cs
 4X/Xjwt3QHdw==
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; 
   d="scan'208";a="317179777"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 05:43:00 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id A5A4A20901; Mon,  7 Dec 2020 15:42:58 +0200 (EET)
Date:   Mon, 7 Dec 2020 15:42:58 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH] imx274: remove composition support, add
 V4L2_SEL_TGT_CROP_DEFAULT
Message-ID: <20201207134258.GB852@paasikivi.fi.intel.com>
References: <7940b65c-b5d8-0167-3262-4282f10e873c@xs4all.nl>
 <20201207124655.GY852@paasikivi.fi.intel.com>
 <a61e6644-cb94-6ec9-f0e0-1c256bedb0ed@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a61e6644-cb94-6ec9-f0e0-1c256bedb0ed@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Mon, Dec 07, 2020 at 02:16:39PM +0100, Hans Verkuil wrote:
> On 07/12/2020 13:46, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > Thanks for the patch.
> > 
> > On Mon, Dec 07, 2020 at 12:18:55PM +0100, Hans Verkuil wrote:
> >> This driver does not support composition, only cropping.
> >> Composition means that the sensor can output e.g. 1920x1080,
> >> but can compose a cropped 1280x720 image in the middle of the
> >> 1920x1080 canvas, filling in the unused area with a background
> >> color.
> > 
> > That's how this would work on V4L2 video nodes...
> > 
> >>
> >> That's not supported at all. So drop the bogus composition support.
> > 
> > But this is a sub-device driver. On sub-devices the COMPOSE target is used
> > for configuring scaling, binning and sub-sampling. I don't know about the
> > capabilities of this particular driver but the code
> > (__imx274_change_compose function in particular) looks very much such that
> > it does support binning.
> > 
> 
> That should be done via set_fmt. There you select the output width and height.
> 
> So if set_fmt sets 1920x1080, and the crop is 960x540, then you scale (or
> do binning/sub-sampling). Compose means composing the image into a larger
> canvas. For this driver the compose rectangle is always equal to the
> format, so set_selection(COMPOSE) is identical to set_fmt().
> 
> If it was real composition, then there would have to be a try_compose as
> well, just as there is a try_crop. Instead set_selection(COMPOSE) fills in

On sub-devices there's a try context that's file handle specific.

> try_fmt. Clearly wrong.

Not more than using set_fmt if you look at the documentation:

<URL:https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/dev-subdev.html#order-of-configuration-and-format-propagation>

In this case it's just on the sink pad, as the sub-device exports no source
pads. I think there are probably a few such drivers around.

Which sub-device drivers configure scaling based on set_fmt? I'm only aware
of omap3isp which pre-dates the selection API.

-- 
Kind regards,

Sakari Ailus
