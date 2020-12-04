Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3F62CEDFF
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 13:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbgLDMWj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 07:22:39 -0500
Received: from mga07.intel.com ([134.134.136.100]:3476 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbgLDMWi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Dec 2020 07:22:38 -0500
IronPort-SDR: krJX55iqO7GdhJHN/jEosKG/Y05OvKVv7eX8eRxTMWrS4vilDBzrCe51rEMKHdDwfR1q4TRcB6
 DH6U+VmWX8Xg==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="237482896"
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; 
   d="scan'208";a="237482896"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2020 04:20:58 -0800
IronPort-SDR: /d+LXz0A4iHgXP9FL2gNhnGvq2HAX63+fQEJaUryJGu/FU/f8hln+ALdNOOu53tsDKuZsHqz4q
 pnAXAT4oxS2g==
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; 
   d="scan'208";a="336355415"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2020 04:20:56 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 9326320676; Fri,  4 Dec 2020 14:20:54 +0200 (EET)
Date:   Fri, 4 Dec 2020 14:20:54 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Sebastian Fricke <sebastian.fricke.linux@gmail.com>
Cc:     linux-media@vger.kernel.org, martinax.krasteva@linux.intel.com
Subject: Re: [PATCH 2/2] Documentation: v4l: Document that link_validate op
 is valid for sink only
Message-ID: <20201204122054.GU852@paasikivi.fi.intel.com>
References: <20201202181955.18165-1-sakari.ailus@linux.intel.com>
 <20201202181955.18165-3-sakari.ailus@linux.intel.com>
 <20201203050040.godctaxtvafpvaw3@basti.Speedport_W_724V_Typ_A_05011603_06_001>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203050040.godctaxtvafpvaw3@basti.Speedport_W_724V_Typ_A_05011603_06_001>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sebastian,

On Thu, Dec 03, 2020 at 06:00:40AM +0100, Sebastian Fricke wrote:
> Thank you.
> 
> On 02.12.2020 20:19, Sakari Ailus wrote:
> > The link_validate pad op will only be called on sink pads. Document this.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Documentation/driver-api/media/v4l2-subdev.rst | 11 ++++++-----
> > 1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > index d4cba0d6c4ca..6d5c799c49fe 100644
> > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > @@ -122,11 +122,12 @@ Don't forget to cleanup the media entity before the sub-device is destroyed:
> > 
> > 	media_entity_cleanup(&sd->entity);
> > 
> > -In that case, the subdev driver may set the link_validate field to provide
> > -its own link validation function. The link validation function is called for
> > -every link in the pipeline where both of the ends of the links are V4L2
> > -sub-devices. The driver is still responsible for validating the correctness
> > -of the format configuration between sub-devices and video nodes.
> > +If a sub-device driver implements sink pads, the subdev driver may set the
> > +link_validate field in :c:type:`v4l2_subdev_pad_ops`to provide its own link
> > +validation function. For every link in the pipeline, the link_validate pad
> > +operation of the sink end of the link is called. In both cases the driver is
> 
> s/In both cases the driver/In both cases, the driver/

Is there any particular reason for this change? I think it's fine as it
was. :-)

> 
> > +still responsible for validating the correctness of the format configuration
> > +between sub-devices and video nodes.
> > 
> > If link_validate op is not set, the default function
> > :c:func:`v4l2_subdev_link_validate_default` is used instead. This function

-- 
Regards,

Sakari Ailus
