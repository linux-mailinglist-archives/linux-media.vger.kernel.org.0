Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD58A2E8825
	for <lists+linux-media@lfdr.de>; Sat,  2 Jan 2021 18:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbhABR3f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Jan 2021 12:29:35 -0500
Received: from mga11.intel.com ([192.55.52.93]:56992 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726636AbhABR3e (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 Jan 2021 12:29:34 -0500
IronPort-SDR: AxGlnzAAHuo5xcMNJm42lbvOcrSlM+fLWOyNsHgGCi/vjgexrZrmw4LjNr5yE+3QxnjvkIUr40
 dkZHyE2QmVuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9852"; a="173321901"
X-IronPort-AV: E=Sophos;i="5.78,470,1599548400"; 
   d="scan'208";a="173321901"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2021 09:27:49 -0800
IronPort-SDR: fImBd+fl/ZH4gxKipnhR5oIZNaRSQ/76zxoC+cOXxyVoXRiwDgMArRBSUPYyP6VNpG8BSJSzMY
 BhsfZFJEUKBA==
X-IronPort-AV: E=Sophos;i="5.78,470,1599548400"; 
   d="scan'208";a="360230001"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2021 09:27:47 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 018B5207BF; Sat,  2 Jan 2021 19:27:45 +0200 (EET)
Date:   Sat, 2 Jan 2021 19:27:44 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Pavel Machek <pavel@denx.de>, andy.shevchenko@gmail.com,
        mchehab+huawei@kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu3-cio2: Fix mbus_code processing in
 cio2_subdev_set_fmt()
Message-ID: <20210102172744.GG11878@paasikivi.fi.intel.com>
References: <20201230125550.GA14074@duo.ucw.cz>
 <X+zvCZefnwfiTqoO@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X+zvCZefnwfiTqoO@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Dec 30, 2020 at 11:20:09PM +0200, Laurent Pinchart wrote:
> Hi Pavel,
> 
> Thank you for the patch.
> 
> On Wed, Dec 30, 2020 at 01:55:50PM +0100, Pavel Machek wrote:
> > Loop was useless as it would always exit on the first iteration. Fix
> > it with right condition. 
> > 
> > Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>
> > Fixes: a86cf9b29e8b ("media: ipu3-cio2: Validate mbus format in setting subdev format")
> 
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

As this should go to stable, I'm adding:

	Cc: stable@vger.kernel.org # v4.16 and up

> 
> > index 36e354ecf71e..e8ea69d30bfd 100644
> > --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> > @@ -1269,7 +1269,7 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
> >  	fmt->format.code = formats[0].mbus_code;
> >  
> >  	for (i = 0; i < ARRAY_SIZE(formats); i++) {
> > -		if (formats[i].mbus_code == fmt->format.code) {
> > +		if (formats[i].mbus_code == mbus_code) {
> >  			fmt->format.code = mbus_code;
> >  			break;
> >  		}
> > 
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Sakari Ailus
