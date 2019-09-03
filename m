Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76E63A6949
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 15:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729353AbfICNGb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 09:06:31 -0400
Received: from mga14.intel.com ([192.55.52.115]:10075 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729259AbfICNGb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Sep 2019 09:06:31 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Sep 2019 06:06:30 -0700
X-IronPort-AV: E=Sophos;i="5.64,463,1559545200"; 
   d="scan'208";a="194335307"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Sep 2019 06:06:28 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id BBAE62057C; Tue,  3 Sep 2019 16:06:26 +0300 (EEST)
Date:   Tue, 3 Sep 2019 16:06:26 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 09/10] media: i2c: ov5670: Report native size and crop
 bounds
Message-ID: <20190903130626.GR5475@paasikivi.fi.intel.com>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-12-jacopo@jmondi.org>
 <db08aa45-922e-e477-9836-cbbc3f17ad8e@xs4all.nl>
 <20190829124055.zxiu7x6abxfhkzch@uno.localdomain>
 <0df4ef45-ba3f-98b9-878e-8cdd2bf307f6@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0df4ef45-ba3f-98b9-878e-8cdd2bf307f6@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Jacopo,

On Thu, Aug 29, 2019 at 02:55:30PM +0200, Hans Verkuil wrote:
> On 8/29/19 2:40 PM, Jacopo Mondi wrote:
> > HI Hans,
> > 
> > On Thu, Aug 29, 2019 at 12:20:18PM +0200, Hans Verkuil wrote:
> >> On 8/27/19 11:23 AM, Jacopo Mondi wrote:
> >>> Report the native pixel array size and the crop bounds for the ov5670
> >>> sensor driver.
> >>>
> >>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>> ---
> >>>  drivers/media/i2c/ov5670.c | 20 ++++++++++++++++++++
> >>>  1 file changed, 20 insertions(+)
> >>>
> >>> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> >>> index 2bc57e85f721..3e22fe9ccad1 100644
> >>> --- a/drivers/media/i2c/ov5670.c
> >>> +++ b/drivers/media/i2c/ov5670.c
> >>> @@ -2258,6 +2258,25 @@ static int ov5670_set_pad_format(struct v4l2_subdev *sd,
> >>>  	return 0;
> >>>  }
> >>>
> >>> +static int ov5670_get_selection(struct v4l2_subdev *sd,
> >>> +				struct v4l2_subdev_pad_config *cfg,
> >>> +				struct v4l2_subdev_selection *sel)
> >>> +{
> >>> +	switch (sel->target) {
> >>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> >>> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> >>> +		sel->r.left = 0;
> >>> +		sel->r.top = 0;
> >>> +		sel->r.width = 2592;
> >>> +		sel->r.height = 1944;
> >>
> >> Why do you need this?
> >>
> > 
> > I need to expose the pixel array size and the active pixel area size,
> > and I interpreted the two above targets as the right place where to do
> > so.
> 
> That didn't answer my question :-)
> 
> Why do you need to expose this? Who uses it for what purpose?
> 
> > 
> > At least for NATIVE_SIZE the documentation seems to match my
> > understanding:
> > 
> > "The native size of the device, e.g. a sensor’s pixel array. left and top
> > fields are zero for this target."
> 
> Correct.
> 
> > 
> > 
> >> Since the format can change for this and the next driver I think CROP_BOUNDS
> >> at least should match the current format.
> >>
> > 
> > Ah, does it? It was not clear to me from the documentation, as it
> > suggested to me that target actually identifies the active pixel area
> > 
> > "Bounds of the crop rectangle. All valid crop rectangles fit inside the
> > crop bounds rectangle."
> > 
> > It does not mention format, should this be updated?
> 
> The problem is that for sensors it is indeed not clear.
> 
> In principle the crop bounds matches the resolution that the sensor uses
> pre-scaling. So yes, that means that it is equal to the native size.
> 
> But many sensors have a discrete list of supported formats and it is not
> clear how they map each format to the actual sensor. If it is clearly just
> done through binning or averaging, then all is fine.

Sensor drivers do; sensors themselves support much, much more than most
drivers allow. But this is due to the nature of information available to
the sensor driver developers, not really something that is trivial to
change.

> 
> If the formats have different aspect ratios, then it becomes a bit more
> difficult how to relate the crop bounds with the format since you may not
> know to which sensor area the current format corresponds.
> 
> I have no clear answer for you, to be honest, but it can get tricky.

I've suggested earlier that the crop and compose selection targets to be
used to convey the cropping and binning (or scaling) that is done on the
sensor, in that order. In reality, there are usually more than one
(sometimes three) inside a sensor to crop, and often more than one place to
scale as well. So the driver would need to accommodate this.

The modes come with both cropping and scaling configuration, and V4L2 only
allows specifying one at a time. In principle an output size may be
achieved by scaling and cropping by different amounts, and as most drivers
use only the output format (size) in mode selection, the result could be
ambiguous. In practice this hasn't been an actual issue.

Better sensor drivers (such as smiapp) do not have this problem as the
configurations (cropping in three different places as well as binning and
scaling) can be all independently configured. So with some luck this
problem could disappear in time with newer hardware and better hardware
documentation.

I have no objections to providing the cropping and scaling information to
the user space using the selection rectangles, albeit it's somewhat against
the semantics currently. This approach would also require using compose
rectangles on the source pads which is not supported (documentation-wise)
at the moment, but it's better that way: it can be added now. There are
other, older, drivers such as omap3isp that configure scaling based on the
source format configuration only.

Perhaps a new selection flag telling the selection is read-only?

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
