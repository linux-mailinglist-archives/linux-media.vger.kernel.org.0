Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 609C37D471E
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 07:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbjJXFyu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 01:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232458AbjJXFyr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 01:54:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E8A89D
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 22:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698126885; x=1729662885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xbpl6AbZCCnqQeVzNUEyQcgVpOw+N7TGe4RF6TGACwI=;
  b=iWlxOA3guh51viRcQ44NsedEl2Q2hx9kkJBUJvaaaSFqsDP4h43nDdeT
   pdm29iqN+dSHwYRNINwVuzhPWBKtFz9kBXjiYpj2tVimcwXytuD3WPd2n
   HWpDLuHHnkJaTU7a9+hVnDE3DUxZiExBR/Mh0fbJCXOV4cHIRbdSjESoI
   vN17lIMFSg8F6TEOEMN5FtETt+fW7ZlqDgWCrDm8wvum8AKLiSdUOq0Vm
   FDmZENPzvnmSY5AkF40TzbX5XlBKJ5GONHbH5PkdLwbEYkv8/2FIog8HZ
   D2IZE/oDwZkWS+X+OLQA89WrsOV45WeozlJV3cfk7Qjm1sg7qkqfnsxcI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="367220323"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="367220323"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 22:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="793381519"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="793381519"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 22:54:41 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 1C7661202BB;
        Tue, 24 Oct 2023 08:54:39 +0300 (EEST)
Date:   Tue, 24 Oct 2023 05:54:39 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 6/8] media: v4l: subdev: Switch to stream-aware state
 functions
Message-ID: <ZTdcHwhwNwCm3Q_r@kekkonen.localdomain>
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
 <20231023174408.803874-7-sakari.ailus@linux.intel.com>
 <20231023221339.GE18687@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023221339.GE18687@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Oct 24, 2023 at 01:13:39AM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Mon, Oct 23, 2023 at 08:44:06PM +0300, Sakari Ailus wrote:
> > Switch all drivers accessing sub-device state to use the stream-aware
> > functions. We will soon remove the old ones.
> > 
> > This patch has been generated using the following Coccinelle script:
> > 
> > ---------8<------------
> > @@
> > expression E1, E2, E3;
> > 
> > @@
> > 
> > - v4l2_subdev_get_pad_format(E1, E2, E3)
> > + v4l2_subdev_state_get_format(E2, E3)
> > 
> > @@
> > expression E1, E2, E3;
> > 
> > @@
> > 
> > - v4l2_subdev_get_pad_crop(E1, E2, E3)
> > + v4l2_subdev_state_get_crop(E2, E3)
> > 
> > @@
> > expression E1, E2, E3;
> > 
> > @@
> > 
> > - v4l2_subdev_get_pad_compose(E1, E2, E3)
> > + v4l2_subdev_state_get_compose(E2, E3)
> > 
> > @@
> > expression E1, E2, E3;
> > 
> > @@
> > 
> > - v4l2_subdev_get_try_format(E1, E2, E3)
> > + v4l2_subdev_state_get_format(E2, E3)
> > 
> > @@
> > expression E1, E2, E3;
> > 
> > @@
> > 
> > - v4l2_subdev_get_try_crop(E1, E2, E3)
> > + v4l2_subdev_state_get_crop(E2, E3)
> > 
> > @@
> > expression E1, E2, E3;
> > 
> > @@
> > 
> > - v4l2_subdev_get_try_compose(E1, E2, E3)
> > + v4l2_subdev_state_get_compose(E2, E3)
> > ---------8<------------
> > 
> > Additionally drivers/media/i2c/s5k5baf.c and
> > drivers/media/platform/samsung/s3c-camif/camif-capture.c have been
> > manually changed as Coccinelle didn't.
> 
> Strange, I wonder why.

I wondered that, too, and I guess in some cases Coccinelle doesn't
recognise these as function calls as they're in variable declaration but
some are just odd.

> 
> > Further local variables have been
> > removed as they became unused as a result of the other changes. The diff
> > from Coccinelle-generated changes are:
> > 
> > diff --git b/drivers/media/i2c/imx319.c a/drivers/media/i2c/imx319.c
> > index e549692ff478..420984382173 100644
> > --- b/drivers/media/i2c/imx319.c
> > +++ a/drivers/media/i2c/imx319.c
> 
> I can imagine git am getting confused :-)

Hopefully no-one uses it with this patch.

> 
> > @@ -2001,7 +2001,6 @@ static int imx319_do_get_pad_format(struct imx319 *imx319,
> >  				    struct v4l2_subdev_format *fmt)
> >  {
> >  	struct v4l2_mbus_framefmt *framefmt;
> > -	struct v4l2_subdev *sd = &imx319->sd;
> > 
> >  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> >  		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
> > diff --git b/drivers/media/i2c/imx355.c a/drivers/media/i2c/imx355.c
> > index 96bdde685d65..e1b1d2fc79dd 100644
> > --- b/drivers/media/i2c/imx355.c
> > +++ a/drivers/media/i2c/imx355.c
> > @@ -1299,7 +1299,6 @@ static int imx355_do_get_pad_format(struct imx355 *imx355,
> >  				    struct v4l2_subdev_format *fmt)
> >  {
> >  	struct v4l2_mbus_framefmt *framefmt;
> > -	struct v4l2_subdev *sd = &imx355->sd;
> > 
> >  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> >  		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
> > diff --git b/drivers/media/i2c/ov08x40.c a/drivers/media/i2c/ov08x40.c
> > index ca799bbcfdb7..abbb0b774d43 100644
> > --- b/drivers/media/i2c/ov08x40.c
> > +++ a/drivers/media/i2c/ov08x40.c
> > @@ -2774,7 +2774,6 @@ static int ov08x40_do_get_pad_format(struct ov08x40 *ov08x,
> >  				     struct v4l2_subdev_format *fmt)
> >  {
> >  	struct v4l2_mbus_framefmt *framefmt;
> > -	struct v4l2_subdev *sd = &ov08x->sd;
> > 
> >  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> >  		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
> > diff --git b/drivers/media/i2c/ov13858.c a/drivers/media/i2c/ov13858.c
> > index 7816d9787c61..09387e335d80 100644
> > --- b/drivers/media/i2c/ov13858.c
> > +++ a/drivers/media/i2c/ov13858.c
> > @@ -1316,7 +1316,6 @@ static int ov13858_do_get_pad_format(struct ov13858 *ov13858,
> >  				     struct v4l2_subdev_format *fmt)
> >  {
> >  	struct v4l2_mbus_framefmt *framefmt;
> > -	struct v4l2_subdev *sd = &ov13858->sd;
> > 
> >  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> >  		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
> > diff --git b/drivers/media/i2c/ov13b10.c a/drivers/media/i2c/ov13b10.c
> > index 268cd4b03f9c..c06411d5ee2b 100644
> > --- b/drivers/media/i2c/ov13b10.c
> > +++ a/drivers/media/i2c/ov13b10.c
> > @@ -1001,7 +1001,6 @@ static int ov13b10_do_get_pad_format(struct ov13b10 *ov13b,
> >  				     struct v4l2_subdev_format *fmt)
> >  {
> >  	struct v4l2_mbus_framefmt *framefmt;
> > -	struct v4l2_subdev *sd = &ov13b->sd;
> > 
> >  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> >  		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
> > diff --git b/drivers/media/i2c/s5c73m3/s5c73m3-core.c a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
> > index 47605e36bc60..8f9b5713daf7 100644
> > --- b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
> > +++ a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
> > @@ -819,7 +819,6 @@ static void s5c73m3_oif_try_format(struct s5c73m3 *state,
> >  				   struct v4l2_subdev_format *fmt,
> >  				   const struct s5c73m3_frame_size **fs)
> >  {
> > -	struct v4l2_subdev *sd = &state->sensor_sd;
> >  	u32 code;
> > 
> >  	switch (fmt->pad) {
> > diff --git b/drivers/media/i2c/s5k5baf.c a/drivers/media/i2c/s5k5baf.c
> > index a36b310b32e1..3f3005cca9d0 100644
> > --- b/drivers/media/i2c/s5k5baf.c
> > +++ a/drivers/media/i2c/s5k5baf.c
> > @@ -1473,12 +1473,10 @@ static int s5k5baf_set_selection(struct v4l2_subdev *sd,
> >  	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
> >  		rects = (struct v4l2_rect * []) {
> >  				&s5k5baf_cis_rect,
> > -				v4l2_subdev_get_try_crop(sd, sd_state,
> > -							 PAD_CIS),
> > -				v4l2_subdev_get_try_compose(sd, sd_state,
> > -							    PAD_CIS),
> > -				v4l2_subdev_get_try_crop(sd, sd_state,
> > -							 PAD_OUT)
> > +				v4l2_subdev_state_get_crop(sd_state, PAD_CIS),
> > +				v4l2_subdev_state_get_compose(sd_state,
> > +							      PAD_CIS),
> 
> A single line would be more readable I think.

But over 80.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you!

-- 
Kind regards,

Sakari Ailus
