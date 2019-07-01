Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 157325B60B
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 09:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727165AbfGAHu6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 03:50:58 -0400
Received: from mga04.intel.com ([192.55.52.120]:55648 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727050AbfGAHu6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Jul 2019 03:50:58 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Jul 2019 00:50:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,438,1557212400"; 
   d="scan'208";a="186311029"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004.fm.intel.com with ESMTP; 01 Jul 2019 00:50:56 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4E4022080B; Mon,  1 Jul 2019 10:50:55 +0300 (EEST)
Date:   Mon, 1 Jul 2019 10:50:55 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH for v5.3] v4l2-subdev: fix regression in check_pad()
Message-ID: <20190701075054.7rxcv4rocubl52v6@paasikivi.fi.intel.com>
References: <5686be05-660e-ee01-06a0-5505479c34c8@xs4all.nl>
 <6794762.LFFAoRDyN6@z50>
 <afc93b30-f91a-2bf0-6793-08efca59a300@xs4all.nl>
 <a4d4f164-0b9d-0917-3a48-fc97ae6730bf@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4d4f164-0b9d-0917-3a48-fc97ae6730bf@xs4all.nl>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Sat, Jun 29, 2019 at 03:08:23PM +0200, Hans Verkuil wrote:
> On 6/29/19 2:57 PM, Hans Verkuil wrote:
> > On 6/29/19 2:06 PM, Janusz Krzysztofik wrote:
> >> Hi Hans,
> >>
> >> On Saturday, June 29, 2019 12:00:24 P.M. CEST Hans Verkuil wrote:
> >>> sd->entity.graph_obj.mdev can be NULL when this function is called, and
> >>> that breaks existing drivers (rcar-vin, but probably others as well).
> >>>
> >>> Check if sd->entity.num_pads is non-zero instead since that doesn't depend
> >>> on mdev.
> >>>
> >>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> >>> Reported-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >>> Fixes: a8fa55078a77 ("media: v4l2-subdev: Verify arguments in
> >>> v4l2_subdev_call()") ---
> >>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c
> >>> b/drivers/media/v4l2-core/v4l2-subdev.c index 21fb90d66bfc..bc32fc1e0c0b
> >>> 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >>> @@ -124,16 +124,11 @@ static inline int check_which(__u32 which)
> >>>  static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
> >>>  {
> >>>  #if defined(CONFIG_MEDIA_CONTROLLER)
> >>> -	if (sd->entity.graph_obj.mdev) {
> >>> -		if (pad >= sd->entity.num_pads)
> >>> -			return -EINVAL;
> >>> -		return 0;
> >>> -	}
> >>> +	if (sd->entity.num_pads)
> >>
> >> This reverts a change introduced on Sakari's request in v7 of the series which 
> >> is the source of the regression.  The intention was to fail if num_pads == 0 
> >> on a valid media entity. Maybe we should still keep that restriction and fail 
> >> in case mdev is not NULL? In other words: 
> >>
> >> -	if (sd->entity.num_pads)
> >> +	if (sd->entity.num_pads || sd->entity.graph_obj.mdev)
> > 
> > If an entity has no pads, then it doesn't have pad ops either and this function
> > would never be called.
> 
> Sakari, do you think it is ever possible that an entity may have pad ops,
> but num_pads goes at some point to 0?
> 
> If so, then we can check for sd->entity.function != 0. All MC subdevs must
> set that to a non-0 value, otherwise the core will issue a WARN_ON. I think
> it is the only reliable indicator that can be used.

I don't think checking the num_pads field is is a great way to test whether
an entity supports the pad ops; I don't have a better proposal either as it
seems that some drivers call these ops before registering the subdev.

There are sub-device drivers that expose their own device node and thus
work with MC-enabled master drivers but have no pad ops: this is what makes
the fundamental difference in API support, it's not the number of pads. We
just happen to see this in pad ops only (I guess).

Currently the drivers may set the HAS_DEVNODE flag (that really tells about
MC compatibility) just before registering the sub-device. This might be a
better test for allowing pad ops, but the name of the flag is somewhat
misleading. I wouldn't want to start testing this now however, it'd risk
exposing these issues to a much wider audience.

I guess in practice testing for num_pads still works; it however does leave
some gray area between MC-enabled sub-device drivers and the rest. Perhaps
something to improve in the future, but for a later kernel release.

So,

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
