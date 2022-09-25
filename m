Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 333AA5E92C0
	for <lists+linux-media@lfdr.de>; Sun, 25 Sep 2022 13:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbiIYLcY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Sep 2022 07:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbiIYLcW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Sep 2022 07:32:22 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F9819593
        for <linux-media@vger.kernel.org>; Sun, 25 Sep 2022 04:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664105541; x=1695641541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SjDJh1XjklleZ50S2XlAb1jc6GIsIZF6i8QI5r9V8jo=;
  b=J33a4vfECOLZMtVd0VhzmBICCyEWnYZ9W8jkzvs9vm06dwBER9TthoGP
   43LMs8+Hzo0oNRAJZC1i18oROnbvj5q58BzxZFtRPZMnzNOWhUje7ilp4
   fPmzJ6bZLGUuYE5ybGR4dWXPuezfoou+8IzXQjzy3qvCeaMOxS+UK49f9
   LvQorRxvzJeAlk03Uwv1S7DL03uTESsEho0fr8kyEbq1vsnA1LcF/Dzhu
   cgoIaMmj/ZVht7RedbjqX3Nlj4LQ4+pMc17/1q8KYByDsKHS6rOS+C5R9
   LcFQTed95LL/I8uCF2MquAPa/UAL0PXpbephg39n+AmsDwc6p6RSZbMPl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10480"; a="281223552"
X-IronPort-AV: E=Sophos;i="5.93,344,1654585200"; 
   d="scan'208";a="281223552"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2022 04:32:21 -0700
X-IronPort-AV: E=Sophos;i="5.93,344,1654585200"; 
   d="scan'208";a="724706575"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2022 04:32:18 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id E043F20124;
        Sun, 25 Sep 2022 14:32:16 +0300 (EEST)
Date:   Sun, 25 Sep 2022 11:32:16 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
Cc:     linux-media@vger.kernel.org, alain.volmat@foss.st.com,
        hugues.fruchet@foss.st.com, sylvain.petinot@foss.st.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 5/5] media: i2c: Add driver for ST VGXY61 camera sensor
Message-ID: <YzA8QEBXmwlwpHqV@paasikivi.fi.intel.com>
References: <20220512074037.3829926-1-benjamin.mugnier@foss.st.com>
 <20220512074037.3829926-6-benjamin.mugnier@foss.st.com>
 <YwNUqE0f0hSOh0ul@paasikivi.fi.intel.com>
 <52dc65fd-6120-286c-1314-d7af1e8360df@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52dc65fd-6120-286c-1314-d7af1e8360df@foss.st.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Fri, Aug 26, 2022 at 04:12:22PM +0200, Benjamin MUGNIER wrote:
> > > +	int rot_term;
> > 
> > rot_term value is always the same. No need for a field here for that.
> > 
> 
> It changes according to the sensor's model id and could be either
> VGX761_SHORT_ROT_TERM or VGX661_SHORT_ROT_TERM. See the
> vgxy61_fill_sensor_param function.

Ah, thanks for the explanation. I somehow had missed that earlier.

> > > +	struct i2c_client *client = sensor->i2c_client;
> > > +	/* Correction factor for time required between 2 lines */
> > > +	const int mipi_margin = 1056;
> > 
> > What does this value signify? Is it really constant or somehow dependent by
> > the configuration set by the driver?
> 
> It is a simplification of time needed to send short packets and for the MIPI
> to add transition times (EoT, LPS, and SoT packet delimiters) needed by the
> protocol to go in low power between 2 packets of data. This is a mipi IP
> constant for the sensor.

Ok. A comment elaborating this as above would be nice.

> > > +	ctrl = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ, ARRAY_SIZE(link_freq) - 1, 0,
> > > +				      link_freq);
> > > +	ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +	/* Custom controls */
> > > +	v4l2_ctrl_new_custom(hdl, &vgxy61_hdr_ctrl, NULL);
> > > +	/* Keep a pointer to these controls as we need to update them when setting the format */
> > > +	sensor->pixel_rate_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE, 1, INT_MAX, 1,
> > > +						    get_pixel_rate(sensor));
> > > +	sensor->pixel_rate_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +	sensor->expo_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, sensor->expo_min,
> > > +					      sensor->expo_max, 1, sensor->expo_long);
> > > +	sensor->vblank_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK, sensor->vblank_min,
> > > +						0xffff - sensor->current_mode->crop.height, 1,
> > > +						sensor->vblank);
> > > +	sensor->vflip_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, 1, 1, sensor->vflip);
> > > +	sensor->hflip_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, 1, 1, sensor->hflip);
> > 
> > You don't seem to have the link frequency control. I suppose you should, as
> > well as have it in DT.
> > 
> > <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#handling-clocks>
> > 
> 
> Are you referring to V4L2_CID_LINK_FREQ? I defined it above as a read only
> control as it is fixed for this sensor.

Ah, it was of course the first control.

Anyway, in general case, the frequencies that can be used on the board
should come from DT, as using other frequencies may interfere with other
devices in the same system.

...

> > > +	sensor->slave_mode = of_property_read_bool(dev->of_node, "slave-mode");
> > 
> > What does this actually do?
> > 
> > On parallel bus the slave mode tells the synchronisation signals originate
> > from the receiver. On CSI-2 there are no specific synchronisation signals.
> > 
> 
> We discussed about this on v1 a while ago:
> 
> https://lore.kernel.org/all/c610a2c9-31b1-1950-00fa-a6b3fd3517a1@foss.st.com/
> 
> Tell me if there is any changes to be made, or maybe some documentation to
> clarify?

Ah, yes, I hadn't had time to read that reply yet. :-(

I think we should have a generic solution for this. You may not have two
similar kinds of sensors you're synchronising this way. One option could be
to drop this functionality from the driver now to get it in sooner.

Something to consider:

- how to convey where the signal comes from (phandle),

- capture start signal polarity,

- whether it's input/output and

- pull-down / pull-up configuration?

These are similar to what GPIOs have. Hardware support may vary of course.

-- 
Kind regards,

Sakari Ailus
