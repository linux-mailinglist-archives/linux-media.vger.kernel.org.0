Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1C6B1879
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 08:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbfIMGux (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 02:50:53 -0400
Received: from mga17.intel.com ([192.55.52.151]:53638 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725446AbfIMGux (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 02:50:53 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Sep 2019 23:50:52 -0700
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; 
   d="scan'208";a="386302958"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Sep 2019 23:50:52 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 04C3720BD1; Fri, 13 Sep 2019 09:50:49 +0300 (EEST)
Date:   Fri, 13 Sep 2019 09:50:49 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 6/6] smiapp: Avoid fall-through in switch
Message-ID: <20190913065049.GK5781@paasikivi.fi.intel.com>
References: <20190819124728.10511-1-sakari.ailus@linux.intel.com>
 <20190819124728.10511-7-sakari.ailus@linux.intel.com>
 <74b049a8-9f03-c7c0-94db-0a1e5db4d07a@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74b049a8-9f03-c7c0-94db-0a1e5db4d07a@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 12, 2019 at 03:17:54PM +0200, Hans Verkuil wrote:
> On 8/19/19 2:47 PM, Sakari Ailus wrote:
> > Remove switch fall-through cases in the driver.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/smiapp/smiapp-core.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
> > index 76d7d204ec17..61de8cdccc4b 100644
> > --- a/drivers/media/i2c/smiapp/smiapp-core.c
> > +++ b/drivers/media/i2c/smiapp/smiapp-core.c
> > @@ -1674,13 +1674,12 @@ static void smiapp_propagate(struct v4l2_subdev *subdev,
> >  				sensor->binning_vertical = 1;
> >  			}
> >  		}
> > -		/* Fall through */
> > -	case V4L2_SEL_TGT_COMPOSE:
> 
> This doesn't look right: for this target you now enter the default case.
> 
> You probably want to do:
> 
> 		break;
> 	case V4L2_SEL_TGT_COMPOSE:
> 		break;

Yes; thanks. I've just sent v2.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
