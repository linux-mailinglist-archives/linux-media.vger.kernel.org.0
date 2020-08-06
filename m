Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C693823DEA9
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729501AbgHFR2f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:28:35 -0400
Received: from mga11.intel.com ([192.55.52.93]:4196 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729617AbgHFR20 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Aug 2020 13:28:26 -0400
IronPort-SDR: d0m3szX+C0hwHogpia8F99ESEXqvxCKSMxDKJ4T/uQARoQGqHqVwD5Yeu9TVZdR1dD1e74tyld
 ouoWWGr8TiUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="150529192"
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; 
   d="scan'208";a="150529192"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2020 05:55:19 -0700
IronPort-SDR: YX3VVoSLAH25zeI826HufpuAkgBKlYI1Rzw1c6QT37yHvVX1mYKl2U2FENI2LpBDswB117SBzj
 g0sc8ZCWTvag==
X-IronPort-AV: E=Sophos;i="5.75,441,1589266800"; 
   d="scan'208";a="323421183"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2020 05:55:17 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 31AF22063B; Thu,  6 Aug 2020 15:54:45 +0300 (EEST)
Date:   Thu, 6 Aug 2020 15:54:45 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 1/4] media: docs: Describe pixel array properties
Message-ID: <20200806125445.GA16270@paasikivi.fi.intel.com>
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200805105721.15445-2-jacopo@jmondi.org>
 <184f8787-ebf1-90e3-82b3-44fa66e65a84@xs4all.nl>
 <20200806095038.tc6mmwknqdinaeth@uno.localdomain>
 <f4e50cbb-8b25-1269-d8b9-9c81fa73b7e1@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4e50cbb-8b25-1269-d8b9-9c81fa73b7e1@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Aug 06, 2020 at 11:58:31AM +0200, Hans Verkuil wrote:
> On 06/08/2020 11:50, Jacopo Mondi wrote:
> > Hi Hans,
> > 
> > On Thu, Aug 06, 2020 at 10:05:37AM +0200, Hans Verkuil wrote:
> >> Hi Jacopo,
> >>
> >> Some review comments below:
> >>
> >> On 05/08/2020 12:57, Jacopo Mondi wrote:
> >>> +Analog crop rectangle
> >>
> >> Why analog? It's just the crop rectangle, nothing analog about it.
> >>
> > 
> > We used the 'analogCrop' term in libcamera to differentiate the
> > cropping which happens on the sensor pixel array matrix to select the
> > region to process and produce image from. Sensor with an on-board
> > scaler can perform other cropping steps to implement, in example digital
> > zoom, so we expect to have a 'digital crop' phase as well. RAW
> > sensors, in example, will only have an analogCrop rectangle.
> > 
> > Quoting the libcamera definition of analog crop:
> > 
> >  * horizontal and vertical sizes define the portion of the pixel array which
> >  * is read-out and provided to the sensor's internal processing pipeline, before
> >  * any pixel sub-sampling method, such as pixel binning, skipping and averaging
> >  * take place.
> > 
> > should I keep it or remove it ?
> 
> It's a very confusing term. Especially since this API can also be used with analog
> video capture devices (Composite/S-Video) where the video signal actually is analog.
> 
> In the V4L2 API there is no such thing as 'analog crop', so please remove it.

There isn't in the V4L2 API but I don't see why we couldn't document it
here. Analogue crop is an established term related to raw (perhaps others,
too?) camera sensors which describes cropping that is implemented by not
reading parts of the pixel array.

As this documentation only applies to camera sensors, I think it's entirely
appropriate to document this here, and using that term.

-- 
Kind regards,

Sakari Ailus
