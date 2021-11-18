Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFFD64557A5
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 10:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245029AbhKRJGA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 04:06:00 -0500
Received: from mga02.intel.com ([134.134.136.20]:25387 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244985AbhKRJF3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 04:05:29 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="221359928"
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; 
   d="scan'208";a="221359928"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 01:02:26 -0800
X-IronPort-AV: E=Sophos;i="5.87,244,1631602800"; 
   d="scan'208";a="495294468"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2021 01:02:25 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 13CB520282;
        Thu, 18 Nov 2021 11:02:23 +0200 (EET)
Date:   Thu, 18 Nov 2021 11:02:23 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Eugen.Hristev@microchip.com
Cc:     leonl@leopardimaging.com, linux-media@vger.kernel.org,
        skomatineni@nvidia.com, luca@lucaceresoli.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx274: fix s_frame_interval runtime resume
 not requested
Message-ID: <YZYWn0zY1tNcpysI@paasikivi.fi.intel.com>
References: <20211117154009.261787-1-eugen.hristev@microchip.com>
 <YZUptcn1isWQuCdq@paasikivi.fi.intel.com>
 <97fbf01c-6cfb-7ab9-f045-383a1e4053c2@microchip.com>
 <YZVuGrkKTrvQC/Qm@paasikivi.fi.intel.com>
 <17380c4a-1ab9-6bb1-a574-2e9ba7065aa6@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17380c4a-1ab9-6bb1-a574-2e9ba7065aa6@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 18, 2021 at 07:16:16AM +0000, Eugen.Hristev@microchip.com wrote:
> On 11/17/21 11:03 PM, Sakari Ailus wrote:
> > Hi Eugen,
> > 
> > On Wed, Nov 17, 2021 at 04:52:40PM +0000, Eugen.Hristev@microchip.com wrote:
> >> On 11/17/21 6:11 PM, Sakari Ailus wrote:
> >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>
> >>> Hi Eugen,
> >>>
> >>> On Wed, Nov 17, 2021 at 05:40:09PM +0200, Eugen Hristev wrote:
> >>>> pm_runtime_resume_and_get should be called when the s_frame_interval
> >>>> is called.
> >>>>
> >>>> The driver will try to access device registers to configure VMAX, coarse
> >>>> time and exposure.
> >>>>
> >>>> Currently if the runtime is not resumed, this fails:
> >>>>    # media-ctl -d /dev/media0 --set-v4l2 '"IMX274 1-001a":0[fmt:SRGGB10_1X10/3840x2
> >>>> 160@1/10]'
> >>>>
> >>>> IMX274 1-001a: imx274_binning_goodness: ask 3840x2160, size 3840x2160, goodness 0
> >>>> IMX274 1-001a: imx274_binning_goodness: ask 3840x2160, size 1920x1080, goodness -3000
> >>>> IMX274 1-001a: imx274_binning_goodness: ask 3840x2160, size 1280x720, goodness -4000
> >>>> IMX274 1-001a: imx274_binning_goodness: ask 3840x2160, size 1280x540, goodness -4180
> >>>> IMX274 1-001a: __imx274_change_compose: selected 1x1 binning
> >>>> IMX274 1-001a: imx274_set_frame_interval: input frame interval = 1 / 10
> >>>> IMX274 1-001a: imx274_read_mbreg : addr 0x300e, val=0x1 (2 bytes)
> >>>> IMX274 1-001a: imx274_set_frame_interval : register SVR = 1
> >>>> IMX274 1-001a: imx274_read_mbreg : addr 0x30f6, val=0x6a8 (2 bytes)
> >>>> IMX274 1-001a: imx274_set_frame_interval : register HMAX = 1704
> >>>> IMX274 1-001a: imx274_set_frame_length : input length = 2112
> >>>> IMX274 1-001a: imx274_write_mbreg : i2c bulk write failed, 30f8 = 884 (3 bytes)
> >>>> IMX274 1-001a: imx274_set_frame_length error = -121
> >>>> IMX274 1-001a: imx274_set_frame_interval error = -121
> >>>> Unable to setup formats: Remote I/O error (121)
> >>>>
> >>>> The device is not resumed thus the remote I/O error.
> >>>>
> >>>> Setting the frame interval works at streaming time, because
> >>>> pm_runtime_resume_and_get is called at s_stream time before sensor setup.
> >>>> The failure happens when only the s_frame_interval is called separately
> >>>> independently on streaming time.
> >>>>
> >>>> Fixes: ad97bc37426c ("media: i2c: imx274: Add IMX274 power on and off sequence"
> >>>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> >>>> ---
> >>>>    drivers/media/i2c/imx274.c | 5 +++++
> >>>>    1 file changed, 5 insertions(+)
> >>>>
> >>>> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> >>>> index e89ef35a71c5..6e63fdcc5e46 100644
> >>>> --- a/drivers/media/i2c/imx274.c
> >>>> +++ b/drivers/media/i2c/imx274.c
> >>>> @@ -1420,6 +1420,10 @@ static int imx274_s_frame_interval(struct v4l2_subdev *sd,
> >>>>         int min, max, def;
> >>>>         int ret;
> >>>>
> >>>> +     ret = pm_runtime_resume_and_get(&imx274->client->dev);
> >>>> +     if (ret < 0)
> >>>> +             return ret;
> >>>> +
> >>>>         mutex_lock(&imx274->lock);
> >>>>         ret = imx274_set_frame_interval(imx274, fi->interval);
> >>>>
> >>>> @@ -1451,6 +1455,7 @@ static int imx274_s_frame_interval(struct v4l2_subdev *sd,
> >>>>
> >>>>    unlock:
> >>>>         mutex_unlock(&imx274->lock);
> >>>> +     pm_runtime_put(&imx274->client->dev);
> >>>>
> >>>>         return ret;
> >>>>    }
> >>>
> >>> If the device is powered off in the end, could you instead not power it on
> >>> in the first place? I.e. see how this works for the s_ctrl() callback.
> >>
> >>
> >> Hi Sakari,
> >>
> >> I tried this initially, as in s_ctrl,
> >>
> >>           if (!pm_runtime_get_if_in_use(&imx274->client->dev))
> >>
> >>                   return 0;
> >>
> >>
> >> However, if the device is powered off, the s_frame_interval does not do
> >> anything (return 0), and the frame interval is not changed. Not even the
> >> internal structure frame_interval is updated (as this is updated after
> >> configuring the actual device).
> >> And in consequence media-ctl -p will still print the old frame interval.
> >>
> >> So either we power on the device to set everything, or, things have to
> >> be set in the software struct and written once streaming starts.
> >> I am in favor of the first option (hence the patch), to avoid having
> >> configuration that was requested but not written to the device itself.
> >> The second option would require some rework to move the software part
> >> before the hardware part, and to assume that the hardware part never
> >> fails in bounds or by other reason (or the software part would be no
> >> longer consistent)
> >>
> >> What do you think ?
> > 
> > Seems reasonable, but the driver is hardly doing this in an exemplary way.
> > Still the rework might not worth the small gain. I'll take this one then.
> 
> 
> Okay, thank you.
> I noticed that the fixes tag in the commit message misses the last 
> closing bracket ')' . Might break automated checkers and shout out a 
> warning. Maybe it's possible to amend it ?

Thanks, fixed it.

-- 
Sakari Ailus
