Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D88066E749A
	for <lists+linux-media@lfdr.de>; Wed, 19 Apr 2023 10:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbjDSIEb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Apr 2023 04:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjDSIEa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Apr 2023 04:04:30 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B307AB9
        for <linux-media@vger.kernel.org>; Wed, 19 Apr 2023 01:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681891454; x=1713427454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jz08CWX6Z3snXPCSgCz2t6on4+hTitdRupm7t9n5/mo=;
  b=nMqDB+Vml42GZK9zbM5mc1T78PzjRd+ajCvdf0pxSLbjGGN7VW1xKdkQ
   ZudI6LMiJQcG8F2kWJtUHATG8qgrEivqwgOWAoYMPG2BVf42butTYkrul
   ieHJcShI5oPtq5as51nNGpieFBHkQdP7CEmKLoypaVm0MrJhNIswlnJhj
   qTs0evHVPXUIsFXxgq07U2H/eEEnVM3O3zdnRn8K7Z7LcJszIyBeynO9w
   xkL3DDeMX5fhGSOeUp4I9+fYY47tjQiA4AUmD2DZwYNsrJtuKv6tJO0ah
   hHy5rGrATH8k7uBqf6RZNdf1aMYso5Qs1mnQwV7CRWsD8221GG/Us9R7/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="334191393"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="334191393"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 01:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="756011529"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="756011529"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 01:04:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 13ACB11FAD0;
        Wed, 19 Apr 2023 11:04:09 +0300 (EEST)
Date:   Wed, 19 Apr 2023 11:04:09 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] media: i2c: add ov01a10 image sensor driver
Message-ID: <ZD+geUBBvqHQ1Ssy@kekkonen.localdomain>
References: <1675941758-21433-1-git-send-email-bingbu.cao@intel.com>
 <Y+TvvbfRSGUNKBCf@kekkonen.localdomain>
 <793aa7a4-0b8b-dc55-2d91-9aa58e6735fd@linux.intel.com>
 <ZDahyjzMD/LvOjlG@kekkonen.localdomain>
 <caac8f63-1506-1e84-87fc-4556c2f7e369@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caac8f63-1506-1e84-87fc-4556c2f7e369@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Wed, Apr 19, 2023 at 03:44:25PM +0800, Bingbu Cao wrote:
> Sakari,
> 
> On 4/12/23 8:19 PM, Sakari Ailus wrote:
> > Hi Bingbu,
> > 
> > On Wed, Apr 12, 2023 at 07:40:19PM +0800, Bingbu Cao wrote:
> >>>> +static int ov01a10_set_format(struct v4l2_subdev *sd,
> >>>> +			      struct v4l2_subdev_state *sd_state,
> >>>> +			      struct v4l2_subdev_format *fmt)
> >>>> +{
> >>>> +	struct ov01a10 *ov01a10 = to_ov01a10(sd);
> >>>> +	const struct ov01a10_mode *mode;
> >>>> +	s32 vblank_def, h_blank;
> >>>> +
> >>>> +	mode = v4l2_find_nearest_size(supported_modes,
> >>>> +				      ARRAY_SIZE(supported_modes), width,
> >>>> +				      height, fmt->format.width,
> >>>> +				      fmt->format.height);
> >>>> +
> >>>> +	mutex_lock(&ov01a10->mutex);
> >>>> +	ov01a10_update_pad_format(mode, &fmt->format);
> >>>
> >>> Could you switch to the sub-device state? That is now the preferred way to
> >>> serialise access to e.g. the format.
> >>>
> >>> See e.g.
> >>> <URL:https://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git/tree/drivers/media/i2c/ov1063x.c?h=streams/work-v16>.
> >>>
> >>> The control handler's mutex doubles as a sub-device state mutex.
> >>
> >> Is it fine to use v4l2_subdev_get_fmt()? Or will it be deprecated soon?
> > 
> > Sure, it's fine to use it.
> >
> 
> I tried to use the v4l2_subdev_state_get_stream_format() in set_fmt, but I
> see that the pad format of camera sensor was missing in media information.
> 
> - entity 105: ov01a10 3-0036 (1 pad, 1 link)
>               type V4L2 subdev subtype Sensor flags 0
>               device node name /dev/v4l-subdev8
> 	pad0: Source
> 		-> "Intel IPU6 CSI2 2":0 [ENABLED]
> 
> And the link validation cannot work as expected, is there something
> missing? My kernel head is Linux 6.3-rc2.
> 
> static int ov01a10_set_format(struct v4l2_subdev *sd,
> 			      struct v4l2_subdev_state *sd_state,
> 			      struct v4l2_subdev_format *fmt)
> {
> ...
> 	format = v4l2_subdev_state_get_stream_format(sd_state, fmt->pad,
> 						     fmt->stream);
> 	if (!format) {
> 		dev_err(&client->dev, "Failed to get stream format\n");
> 		return -EINVAL;
> 	}
> 
> ...
> 	ov01a10_update_pad_format(mode, &fmt->format);
> 	*format = fmt->format;
> 
> 	return 0;
> }

v4l2_subdev_state_get_stream_format() will access streams and I presume you
won't have any in this case (not even streams support right now as it's a
sensor driver with a single sub-device).

-- 
Kind regards,

Sakari Ailus
