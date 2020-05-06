Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52BE01C7983
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2020 20:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730383AbgEFSfF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 May 2020 14:35:05 -0400
Received: from mga04.intel.com ([192.55.52.120]:40061 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729757AbgEFSfF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 May 2020 14:35:05 -0400
IronPort-SDR: 9d5zfi1cGDfyQz+SSOGhHFE8ysc+OP8zdfFuN0BRtBPlFF7a7dwjFF0uJsRqDyiDXlK+OwI7O2
 Gsi6fPGehHJQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2020 11:35:04 -0700
IronPort-SDR: Cx6KS5BlRXQUDRWWNZWh0OohDRgyNkn+SwfXSPjE+isB6JyxUaohzUNk02gMWLfcFfy/lKLYEq
 5eCk1R6BmQOw==
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; 
   d="scan'208";a="278314152"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2020 11:35:01 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 9F9692074F; Wed,  6 May 2020 21:34:59 +0300 (EEST)
Date:   Wed, 6 May 2020 21:34:59 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org, mchehab@kernel.org,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: Re: [PATCH v5 5/6] v4l2-subdev: add VIDIOC_SUBDEV_QUERYCAP ioctl
Message-ID: <20200506183459.GA9190@paasikivi.fi.intel.com>
References: <20200428210609.6793-1-jacopo@jmondi.org>
 <20200428210609.6793-6-jacopo@jmondi.org>
 <20200428212858.GC5381@paasikivi.fi.intel.com>
 <20200429080949.walimwkrth3ixn2o@uno.localdomain>
 <20200429081859.GA9190@paasikivi.fi.intel.com>
 <15053210-8d02-afbd-0d02-b08f9b5f4378@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15053210-8d02-afbd-0d02-b08f9b5f4378@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Jacopo,

On Wed, May 06, 2020 at 03:29:03PM +0200, Hans Verkuil wrote:
> On 29/04/2020 10:18, Sakari Ailus wrote:
> > Hi Jacopo,
> > 
> > On Wed, Apr 29, 2020 at 10:09:49AM +0200, Jacopo Mondi wrote:
> >> Hi Sakari,
> >>
> >> On Wed, Apr 29, 2020 at 12:28:58AM +0300, Sakari Ailus wrote:
> >>> Hi Jacopo,
> >>>
> >>> On Tue, Apr 28, 2020 at 11:06:08PM +0200, Jacopo Mondi wrote:
> >>>> From: Hans Verkuil <hans.verkuil@cisco.com>
> >>>>
> >>>> While normal video/radio/vbi/swradio nodes have a proper QUERYCAP ioctl
> >>>> that apps can call to determine that it is indeed a V4L2 device, there
> >>>> is currently no equivalent for v4l-subdev nodes. Adding this ioctl will
> >>>> solve that, and it will allow utilities like v4l2-compliance to be used
> >>>> with these devices as well.
> >>>>
> >>>> SUBDEV_QUERYCAP currently returns the version and subdev_caps of the
> >>>> subdevice. Define as the initial set of subdev_caps the read-only or
> >>>> read/write flags, to signal to userspace which set of IOCTLs are
> >>>> available on the subdevice.
> >>>>
> >>>> Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> >>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>>> ---
> >>>>  drivers/media/v4l2-core/v4l2-subdev.c | 12 ++++++++++++
> >>>>  include/uapi/linux/v4l2-subdev.h      | 15 +++++++++++++++
> >>>>  2 files changed, 27 insertions(+)
> >>>>
> >>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> >>>> index f3fe515b8ccb..b8c0071aa4d0 100644
> >>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >>>> @@ -15,6 +15,7 @@
> >>>>  #include <linux/types.h>
> >>>>  #include <linux/videodev2.h>
> >>>>  #include <linux/export.h>
> >>>> +#include <linux/version.h>
> >>>>
> >>>>  #include <media/v4l2-ctrls.h>
> >>>>  #include <media/v4l2-device.h>
> >>>> @@ -331,6 +332,17 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >>>>  	int rval;
> >>>>
> >>>>  	switch (cmd) {
> >>>> +	case VIDIOC_SUBDEV_QUERYCAP: {
> >>>> +		struct v4l2_subdev_capability *cap = arg;
> >>>> +
> >>>> +		memset(cap, 0, sizeof(*cap));
> >>>> +		cap->version = LINUX_VERSION_CODE;
> >>>> +		cap->subdev_caps |= ro_subdev ? V4L2_SUBDEV_CAP_RO_SUBDEV
> >>>> +					      : V4L2_SUBDEV_CAP_RW_SUBDEV;
> >>>> +
> >>>> +		return 0;
> >>>> +	}
> >>>> +
> >>>>  	case VIDIOC_QUERYCTRL:
> >>>>  		/*
> >>>>  		 * TODO: this really should be folded into v4l2_queryctrl (this
> >>>> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
> >>>> index 03970ce30741..89dc8f2ba6b3 100644
> >>>> --- a/include/uapi/linux/v4l2-subdev.h
> >>>> +++ b/include/uapi/linux/v4l2-subdev.h
> >>>> @@ -155,9 +155,24 @@ struct v4l2_subdev_selection {
> >>>>  	__u32 reserved[8];
> >>>>  };
> >>>>
> >>>> +/**
> >>>> + * struct v4l2_subdev_capability - subdev capabilities
> >>>> + * @device_caps: the subdev capabilities, see V4L2_SUBDEV_CAP_*.
> >>>> + */
> >>>> +struct v4l2_subdev_capability {
> >>>> +	__u32 version;
> >>>> +	__u32 subdev_caps;
> >>>
> >>> How do you intend to address additional fields being added to the struct in
> >>> the future? Something else than what's been done in V4L2 traditionally?
> >>>
> >>
> >> I'm not sure I get what you mean here, so I assume I don't know what
> >> "has been done in V4L2 traditionally" and why what I have here goes
> >> against it...
> > 
> > I can't help noticing you have no reserved fields in your IOCTL argument
> > struct. That has generally been the way V4L2 IOCTLs have been extended when
> > there's been a need to.
> > 
> > Media controller adopted a different approach to that recently, based on
> > the argument size. We've discussed doing that on V4L2 but I don't think
> > a decision has been made.
> > 
> 
> While I agree that using the argument size to do 'versioning' of the API
> is a better solution, the fact is that historically we always used a 'reserved'
> field. And I think we need to do that here as well. It's consistent with
> the existing subdev ioctls, so I would be in favor of adding a 'u32 reserved[6];'
> field.

Agreed. Could be even 14, in practice it matters little performance-wise.

> 
> If there are such strong feelings against it that it wouldn't be merged, then
> we can always just leave it as-is. It's not worth blocking this patch just
> because of that.

I'm not (strongly) pushing either here; just that we need to make a
decision. I'm in favour of the reserved field for the same reason. I was
just wondering whether it was intentional. :-)

> 
> BTW, one thing that should be changed is the name 'subdev_caps': just name it
> 'capabilities'. It's a field in a struct v4l2_subdev_capability, so it is
> already obvious that this is subdev specific.

-- 
Regards,

Sakari Ailus
