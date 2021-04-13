Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E4235E1EE
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 16:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241478AbhDMOx6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 10:53:58 -0400
Received: from mga03.intel.com ([134.134.136.65]:35617 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239760AbhDMOxp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 10:53:45 -0400
IronPort-SDR: 4zbmDKmFO3HhIwpxU7FQ2HAiBAfVf0LEgoEyeWIOpw4Cd8Sew0ylVxFJXwlYr3LC+FGWOP0lgL
 cgIyseZscN6g==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="194456666"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="194456666"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 07:53:22 -0700
IronPort-SDR: ThDZnDaLHvuc3kj4p9CLOj8eCMjDN7c9Gh2EuxNxgL6sIYP7mPiWT3hhP/eptiuAKNHHa6pZn0
 geGfOVXQD4Gg==
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="521623505"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 07:53:18 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 5D7352082C;
        Tue, 13 Apr 2021 17:53:15 +0300 (EEST)
Date:   Tue, 13 Apr 2021 17:53:15 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        Mitali Borkar <mitaliborkar810@gmail.com>,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH 1/1] staging: ipu3-imgu: Move the UAPI header from
 include under include/uapi
Message-ID: <20210413145315.GW3@paasikivi.fi.intel.com>
References: <20210412111120.31625-1-sakari.ailus@linux.intel.com>
 <YHWgbZTDAWBX9EpR@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YHWgbZTDAWBX9EpR@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Apr 13, 2021 at 04:45:17PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Apr 12, 2021 at 02:11:20PM +0300, Sakari Ailus wrote:
> > The header defines the user space interface but may be mistaken as
> > kernel-only header due to its location. Add "uapi" directory under
> > driver's include directory and move the header there.
> > 
> > Suggested-by: Greg KH <gregkh@linuxfoundation.org>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  Documentation/admin-guide/media/ipu3.rst      | 35 ++++++++++---------
> >  .../media/v4l/pixfmt-meta-intel-ipu3.rst      |  2 +-
> >  .../ipu3/include/{ => uapi}/intel-ipu3.h      |  0
> >  drivers/staging/media/ipu3/ipu3-abi.h         |  2 +-
> >  4 files changed, 20 insertions(+), 19 deletions(-)
> >  rename drivers/staging/media/ipu3/include/{ => uapi}/intel-ipu3.h (100%)
> > 
> > diff --git a/Documentation/admin-guide/media/ipu3.rst b/Documentation/admin-guide/media/ipu3.rst
> > index f59697c7b374..d6454f637ff4 100644
> > --- a/Documentation/admin-guide/media/ipu3.rst
> > +++ b/Documentation/admin-guide/media/ipu3.rst
> > @@ -234,22 +234,23 @@ The IPU3 ImgU pipelines can be configured using the Media Controller, defined at
> >  Running mode and firmware binary selection
> >  ------------------------------------------
> >  
> > -ImgU works based on firmware, currently the ImgU firmware support run 2 pipes in
> > -time-sharing with single input frame data. Each pipe can run at certain mode -
> > -"VIDEO" or "STILL", "VIDEO" mode is commonly used for video frames capture, and
> > -"STILL" is used for still frame capture. However, you can also select "VIDEO" to
> > -capture still frames if you want to capture images with less system load and
> > -power. For "STILL" mode, ImgU will try to use smaller BDS factor and output
> > -larger bayer frame for further YUV processing than "VIDEO" mode to get high
> > -quality images. Besides, "STILL" mode need XNR3 to do noise reduction, hence
> > -"STILL" mode will need more power and memory bandwidth than "VIDEO" mode. TNR
> > -will be enabled in "VIDEO" mode and bypassed by "STILL" mode. ImgU is running at
> > -“VIDEO” mode by default, the user can use v4l2 control V4L2_CID_INTEL_IPU3_MODE
> > -(currently defined in drivers/staging/media/ipu3/include/intel-ipu3.h) to query
> > -and set the running mode. For user, there is no difference for buffer queueing
> > -between the "VIDEO" and "STILL" mode, mandatory input and main output node
> > -should be enabled and buffers need be queued, the statistics and the view-finder
> > -queues are optional.
> > +ImgU works based on firmware, currently the ImgU firmware support run 2 pipes
> > +in time-sharing with single input frame data. Each pipe can run at certain mode
> > +- "VIDEO" or "STILL", "VIDEO" mode is commonly used for video frames capture,
> > +and "STILL" is used for still frame capture. However, you can also select
> > +"VIDEO" to capture still frames if you want to capture images with less system
> > +load and power. For "STILL" mode, ImgU will try to use smaller BDS factor and
> > +output larger bayer frame for further YUV processing than "VIDEO" mode to get
> > +high quality images. Besides, "STILL" mode need XNR3 to do noise reduction,
> > +hence "STILL" mode will need more power and memory bandwidth than "VIDEO" mode.
> > +TNR will be enabled in "VIDEO" mode and bypassed by "STILL" mode. ImgU is
> > +running at “VIDEO” mode by default, the user can use v4l2 control
> > +V4L2_CID_INTEL_IPU3_MODE (currently defined in
> > +drivers/staging/media/ipu3/include/uapi/intel-ipu3.h) to query and set the
> > +running mode. For user, there is no difference for buffer queueing between the
> > +"VIDEO" and "STILL" mode, mandatory input and main output node should be
> > +enabled and buffers need be queued, the statistics and the view-finder queues
> > +are optional.
> 
> The reflow of the whole paragraph is a bit painful to review.

Yes. The only difference there is still the addition of "/uapi". :-)

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you!

-- 
Sakari Ailus
