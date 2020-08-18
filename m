Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE2E248043
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 10:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgHRIOt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 04:14:49 -0400
Received: from mga02.intel.com ([134.134.136.20]:39688 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbgHRIOt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 04:14:49 -0400
IronPort-SDR: Rr7LyUsjvQF8qm7fDxqT1GViSdLKyOSFWhxnXrLlkAKNQAhv7p384LvlreIHtCk+cM4iE62kh+
 Fbb7qHJjnJKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="142689285"
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="142689285"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 01:14:48 -0700
IronPort-SDR: HZO4S2gLG8tIwzkzNQiibRVVN/4jib24kwjpgU9CJb1syLYSYeyw3p1qNUzaEo4hq357ETKo/V
 7ddmLAdbNmtQ==
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="320008310"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 01:14:46 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 901DD2064F; Tue, 18 Aug 2020 11:14:44 +0300 (EEST)
Date:   Tue, 18 Aug 2020 11:14:44 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
        libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 1/4] media: docs: Describe pixel array properties
Message-ID: <20200818081444.GP24582@paasikivi.fi.intel.com>
References: <20200805105721.15445-1-jacopo@jmondi.org>
 <20200805105721.15445-2-jacopo@jmondi.org>
 <184f8787-ebf1-90e3-82b3-44fa66e65a84@xs4all.nl>
 <20200806095038.tc6mmwknqdinaeth@uno.localdomain>
 <f4e50cbb-8b25-1269-d8b9-9c81fa73b7e1@xs4all.nl>
 <20200806125445.GA16270@paasikivi.fi.intel.com>
 <1ee9f378-8df1-7c03-2136-ce7870934443@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ee9f378-8df1-7c03-2136-ce7870934443@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 06, 2020 at 03:22:34PM +0200, Hans Verkuil wrote:
> On 06/08/2020 14:54, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Thu, Aug 06, 2020 at 11:58:31AM +0200, Hans Verkuil wrote:
> >> On 06/08/2020 11:50, Jacopo Mondi wrote:
> >>> Hi Hans,
> >>>
> >>> On Thu, Aug 06, 2020 at 10:05:37AM +0200, Hans Verkuil wrote:
> >>>> Hi Jacopo,
> >>>>
> >>>> Some review comments below:
> >>>>
> >>>> On 05/08/2020 12:57, Jacopo Mondi wrote:
> >>>>> +Analog crop rectangle
> >>>>
> >>>> Why analog? It's just the crop rectangle, nothing analog about it.
> >>>>
> >>>
> >>> We used the 'analogCrop' term in libcamera to differentiate the
> >>> cropping which happens on the sensor pixel array matrix to select the
> >>> region to process and produce image from. Sensor with an on-board
> >>> scaler can perform other cropping steps to implement, in example digital
> >>> zoom, so we expect to have a 'digital crop' phase as well. RAW
> >>> sensors, in example, will only have an analogCrop rectangle.
> >>>
> >>> Quoting the libcamera definition of analog crop:
> >>>
> >>>  * horizontal and vertical sizes define the portion of the pixel array which
> >>>  * is read-out and provided to the sensor's internal processing pipeline, before
> >>>  * any pixel sub-sampling method, such as pixel binning, skipping and averaging
> >>>  * take place.
> >>>
> >>> should I keep it or remove it ?
> >>
> >> It's a very confusing term. Especially since this API can also be used with analog
> >> video capture devices (Composite/S-Video) where the video signal actually is analog.
> >>
> >> In the V4L2 API there is no such thing as 'analog crop', so please remove it.
> > 
> > There isn't in the V4L2 API but I don't see why we couldn't document it
> > here. Analogue crop is an established term related to raw (perhaps others,
> > too?) camera sensors which describes cropping that is implemented by not
> > reading parts of the pixel array.
> > 
> > As this documentation only applies to camera sensors, I think it's entirely
> > appropriate to document this here, and using that term.
> > 
> 
> It's always been called just 'crop' in the V4L2 API, so renaming it suddenly
> to something else is IMHO confusing. What you can do, however, is that in the

This has been actually implemented a decade ago but it seems the
documentation has either never been there or has disappeared.

Most drivers hide this as they work on the frame interval and output size
alone, ignoring the rest. Despite that, generally camera sensors do have
both analogue and digital cropping capabilities with differing features
(granularity and dependency to frame interval).

> description of the "crop rectangle" you mention that "it is also known as
> "analog crop" in the context of camera sensors.

Just saying it's a crop rectangle isn't exactly wrong but it's incomplete.
The frame interval calculation requires that information so this should be
more than just a side note.

> 
> With perhaps some more extensive explanation of the term.

-- 
Sakari Ailus
