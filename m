Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD56A21B12
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2019 17:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729332AbfEQP6o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 May 2019 11:58:44 -0400
Received: from mga11.intel.com ([192.55.52.93]:23501 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728664AbfEQP6n (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 May 2019 11:58:43 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 May 2019 08:58:43 -0700
X-ExtLoop1: 1
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006.jf.intel.com with ESMTP; 17 May 2019 08:58:41 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 3E7DB21145; Fri, 17 May 2019 18:58:40 +0300 (EEST)
Date:   Fri, 17 May 2019 18:58:40 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] media: v4l2-subdev: Verify arguments in
 v4l2_subdev_call()
Message-ID: <20190517155839.khjyor4cy6vg5vwf@paasikivi.fi.intel.com>
References: <20190514224823.11564-1-jmkrzyszt@gmail.com>
 <20190514224823.11564-2-jmkrzyszt@gmail.com>
 <20190515071601.knfdhwofz6ukjmxt@paasikivi.fi.intel.com>
 <1943741.XiKEDqKQ7m@z50>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1943741.XiKEDqKQ7m@z50>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Janusz,

On Wed, May 15, 2019 at 10:56:36PM +0200, Janusz Krzysztofik wrote:
> Hi Sakari,
> 
> On Wednesday, May 15, 2019 9:16:02 AM CEST Sakari Ailus wrote:
> > Hi Janusz,
> > 
> > On Wed, May 15, 2019 at 12:48:21AM +0200, Janusz Krzysztofik wrote:
> > > -static int check_crop(struct v4l2_subdev *sd, struct v4l2_subdev_crop 
> *crop)
> > > +static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
> > >  {
> > > -	if (crop->which != V4L2_SUBDEV_FORMAT_TRY &&
> > > -	    crop->which != V4L2_SUBDEV_FORMAT_ACTIVE)
> > > +#if defined(CONFIG_MEDIA_CONTROLLER)
> > > +	if (sd->entity.num_pads && pad >= sd->entity.num_pads)
> > 
> > One more comment.
> > 
> > The num_pads doesn't really tell whether a given op is valid for a device.
> > Well, in this case it would have to be a bug in the driver, but those do
> > happen. How about checking for sd->entity.graph_obj.mdev instead? It's
> > non-NULL if the entity is registered with a media device, i.e. when these
> > callback functions are supposed to be called.
> 
> Before I do that, let me undestand your point better.
> 
> My intentions were:
> 1) to provide a check for validity of a pad ID passed to an operation, not ann 
> eligibility of a driver to support the operation,
> 2) to not break drivers which don't set pad_num, especially when building them 
> with CONFIG_MEDIA_CONTROLLER turned on for whatever reason.

Indeed.

But these checks still allow calling the pad operations on sub-devices that
have no pads. That should not be allowed. Pads are a Media controller
concept, they do not exist outside it; therefore checking for pads only if
the subdev is a part of the media device would be entirely correct.

It should probably accompany a check that requires the pad number is zero
if the subdev doesn't have a graph object, even if the pad field isn't
supposedly used for any purpose. Would that address your concern?

> 
> Since pad IDs are verified against pad_num which may be not set, we should 
> obviously check validity of pad_num before comparing against it.  Since media 
> controller compatible subdevices need at least one pad, I think the check for 
> non-zero pad_num is quite reasonable.
> 
> Moreover, old drivers are actually using those pad operations you describe as 
> not supposed to be called.  They are using them because they were converted to 
> use them in place of former video ops.  Already dealing with pad IDs, they may 
> decide to turn on CONFIG_MEDIA_CONTROLLER and use selected functionality, for 
> example register pads, without implementing fulll media controller support.  
> Why should we refuse to perform pad ID verification for them?

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
