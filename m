Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074E835F64C
	for <lists+linux-media@lfdr.de>; Wed, 14 Apr 2021 16:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233921AbhDNOkA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Apr 2021 10:40:00 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:61568
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233936AbhDNOjw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Apr 2021 10:39:52 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AKyHtCaqWOi4LOXVnh17Oa/waV5rKeYIsi2QD?=
 =?us-ascii?q?101hICF9WMqeisyogbAnxQb54QxhPE0ItNicNMC7Kk/02oVy5eAqV4uKfA6jg2?=
 =?us-ascii?q?ewKZEn0I2K+VzdMgnf0sIY6qt6aah5D7TLfD1HpOL3+hOxHdpl4PTvysCVrNzT?=
 =?us-ascii?q?xXtsUg1mApsIhztRMQqVHlZ7QwNLH/MCZfmhz/BarDmtc2l/VKqGL0QCNtKum/?=
 =?us-ascii?q?T2jp78JTYJCxk7gTP+7w+A2frKVyKV2RoTSFp0rIsK+2KtqWPE2pk=3D?=
X-IronPort-AV: E=Sophos;i="5.82,222,1613430000"; 
   d="scan'208";a="378655164"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 16:39:20 +0200
Date:   Wed, 14 Apr 2021 16:39:20 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: Re: [Outreachy kernel] Re: [PATCH 1/2] staging: media: atomisp: pci:
 Correct identation in block of conditional statements in file
 atomisp_v4l2.c
In-Reply-To: <20210414143011.GV6021@kadam>
Message-ID: <alpine.DEB.2.22.394.2104141638140.25259@hadrien>
References: <cover.1618409028.git.alinesantanacordeiro@gmail.com> <0ef18a36d6905628fa596fd5e0a32fdb9c6a8ada.1618409028.git.alinesantanacordeiro@gmail.com> <20210414143011.GV6021@kadam>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On Wed, 14 Apr 2021, Dan Carpenter wrote:

> On Wed, Apr 14, 2021 at 11:06:02AM -0300, Aline Santana Cordeiro wrote:
> > Correct identation in block of conditional statements.
> > The function "v4l2_device_unregister_subdev()" depends on
> > the results of the macro function "list_for_each_entry_safe()".
> >
> > Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
> > ---
> >  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > index 0295e2e..6d853f4 100644
> > --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> > @@ -1178,7 +1178,7 @@ static void atomisp_unregister_entities(struct atomisp_device *isp)
> >  		atomisp_mipi_csi2_unregister_entities(&isp->csi2_port[i]);
> >
> >  	list_for_each_entry_safe(sd, next, &isp->v4l2_dev.subdevs, list)
> > -	v4l2_device_unregister_subdev(sd);
> > +		v4l2_device_unregister_subdev(sd);
> >
>
> It's really more common to use curly braces for list_for_each() one
> liners.
>
> 	list_for_each_entry_safe(sd, next, &isp->v4l2_dev.subdevs, list) {
> 		v4l2_device_unregister_subdev(sd);
> 	}

A quick test with grep shows 4000 lines containing list_for_each that
contain no {, out of 15000 lines containing list_for_each in all.

julia


>
> regards,
> dan carpenter
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/20210414143011.GV6021%40kadam.
>
