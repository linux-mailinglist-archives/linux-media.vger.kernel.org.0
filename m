Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1CDA2D1AB7
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 21:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgLGUlf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 15:41:35 -0500
Received: from mga17.intel.com ([192.55.52.151]:5016 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726074AbgLGUlf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 15:41:35 -0500
IronPort-SDR: 4hnm6pilTa3FNC+m1YnMVzeQ8F6xGSja6C43EWeCBtCrSjp0VUWaXq1MsOWz4MGqPNNijYskf8
 ooBQ2rtf3mTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="153583227"
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="153583227"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 12:39:47 -0800
IronPort-SDR: eca6rq/1/9UHkbKa/EztYHIS7h9Xl2+okaneTj2niFaRZ35TqtTQm/yPghBL4kIfwsVX0BuJE0
 KtyvGRdmD5Og==
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; 
   d="scan'208";a="407293837"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2020 12:39:46 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 2A05F2073B; Mon,  7 Dec 2020 22:39:44 +0200 (EET)
Date:   Mon, 7 Dec 2020 22:39:44 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Sebastian Fricke <sebastian.fricke.linux@gmail.com>
Cc:     linux-media@vger.kernel.org, martinax.krasteva@linux.intel.com
Subject: Re: [PATCH 2/2] Documentation: v4l: Document that link_validate op
 is valid for sink only
Message-ID: <20201207203944.GA25763@paasikivi.fi.intel.com>
References: <20201202181955.18165-1-sakari.ailus@linux.intel.com>
 <20201202181955.18165-3-sakari.ailus@linux.intel.com>
 <20201203050040.godctaxtvafpvaw3@basti.Speedport_W_724V_Typ_A_05011603_06_001>
 <20201204122054.GU852@paasikivi.fi.intel.com>
 <20201204150648.gf5dwuda636p427b@basti.Speedport_W_724V_Typ_A_05011603_06_001>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201204150648.gf5dwuda636p427b@basti.Speedport_W_724V_Typ_A_05011603_06_001>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 04, 2020 at 04:06:48PM +0100, Sebastian Fricke wrote:
> On 04.12.2020 14:20, Sakari Ailus wrote:
> > Hi Sebastian,
> > 
> > On Thu, Dec 03, 2020 at 06:00:40AM +0100, Sebastian Fricke wrote:
> > > Thank you.
> > > 
> > > On 02.12.2020 20:19, Sakari Ailus wrote:
> > > > The link_validate pad op will only be called on sink pads. Document this.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > > Documentation/driver-api/media/v4l2-subdev.rst | 11 ++++++-----
> > > > 1 file changed, 6 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> > > > index d4cba0d6c4ca..6d5c799c49fe 100644
> > > > --- a/Documentation/driver-api/media/v4l2-subdev.rst
> > > > +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> > > > @@ -122,11 +122,12 @@ Don't forget to cleanup the media entity before the sub-device is destroyed:
> > > >
> > > > 	media_entity_cleanup(&sd->entity);
> > > >
> > > > -In that case, the subdev driver may set the link_validate field to provide
> > > > -its own link validation function. The link validation function is called for
> > > > -every link in the pipeline where both of the ends of the links are V4L2
> > > > -sub-devices. The driver is still responsible for validating the correctness
> > > > -of the format configuration between sub-devices and video nodes.
> > > > +If a sub-device driver implements sink pads, the subdev driver may set the
> > > > +link_validate field in :c:type:`v4l2_subdev_pad_ops`to provide its own link
> > > > +validation function. For every link in the pipeline, the link_validate pad
> > > > +operation of the sink end of the link is called. In both cases the driver is
> > > 
> > > s/In both cases the driver/In both cases, the driver/
> > 
> > Is there any particular reason for this change? I think it's fine as it
> > was. :-)
> 
> I was just proof reading the change and thought that a comma would fit
> here quite well. It really isn't anything important, so if you
> don't agree, that is totally fine for me.

Ack. Thanks, Sebastian.

-- 
Sakari Ailus
