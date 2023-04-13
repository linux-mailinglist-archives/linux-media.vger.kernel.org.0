Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 163D16E08B0
	for <lists+linux-media@lfdr.de>; Thu, 13 Apr 2023 10:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbjDMINh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Apr 2023 04:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbjDMINf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Apr 2023 04:13:35 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFB03AA6
        for <linux-media@vger.kernel.org>; Thu, 13 Apr 2023 01:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681373615; x=1712909615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KhtDW34C3P+eHDB+NkWRQcfBTH7whLQ/+mKRckld2GQ=;
  b=C3DlFynXjQHqua9b0rEJxk4dMoK2qLj/Wk1hRTkQnPdbHkZTjXDFPoUM
   bb1QRmk8JjtITcYqdT6ntaQh6Bgi99wDNO1BKKpESSTSWtFROl4/j180C
   OLIoqR+BYo+AAnd23Y9CrPaWgVzCQDHVOcAgVJlixs8eVFMUjPojdVEqX
   2cMmtv/U0tTBS/FxD/Ak5xAGlQIhyzDnkTSJxNgZd2ppkQydZ5qmk2zv6
   D56N3NKoTZuIkCldNPiVQbZWYKc+E2dmfTS26fWs0q4aGLHeotCsK+bjj
   exG8x7xLHaV0gDFk06s1fXot5DgmJliJ6PlNpxR6iwEFO0YRWVZxsY0Ke
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="324478084"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="324478084"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 01:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="800710435"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="800710435"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 01:13:32 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id A747A1207DF;
        Thu, 13 Apr 2023 11:13:29 +0300 (EEST)
Date:   Thu, 13 Apr 2023 11:13:29 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: add ov01a10 image sensor driver
Message-ID: <ZDe5qZMDVEWAxuTj@kekkonen.localdomain>
References: <1675941758-21433-1-git-send-email-bingbu.cao@intel.com>
 <CAPY8ntBiBS+_TH2BgkBF9dCD8nnJnEyMaxSbOvDkW4g3Kgs-Gg@mail.gmail.com>
 <8f797f25-4824-a5ff-bb19-cf25c6c80463@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f797f25-4824-a5ff-bb19-cf25c6c80463@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Thu, Apr 13, 2023 at 03:58:30PM +0800, Bingbu Cao wrote:
> 
> Thanks for your review.
> 
> On 2/9/23 8:40 PM, Dave Stevenson wrote:
> > Hi Bingbu
> > 
> > Thanks for the patch. Just a couple of observations as I read through it.
> > 
> > On Thu, 9 Feb 2023 at 11:39, Bingbu Cao <bingbu.cao@intel.com> wrote:
> >>
> >> Add v4l2 device driver for OmniVision ov01a10 image sensor, ov01a10
> >> image sensor can deliver 1280x800 resolution BGGR10 images at 60 fps.
> >>
> >> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> >> Signed-off-by: Yating Wang <yating.wang@intel.com>
> >> ---
> >>  drivers/media/i2c/Kconfig   |  13 +
> >>  drivers/media/i2c/Makefile  |   1 +
> >>  drivers/media/i2c/ov01a10.c | 906 ++++++++++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 920 insertions(+)
> >>  create mode 100644 drivers/media/i2c/ov01a10.c
> >>
> 
> snip
> 
> >> +static int ov01a10_init_controls(struct ov01a10 *ov01a10)
> >> +{
> >> +       struct v4l2_ctrl_handler *ctrl_hdlr;
> >> +       const struct ov01a10_mode *cur_mode;
> >> +       s64 exposure_max, h_blank;
> >> +       u32 vblank_min, vblank_max, vblank_default;
> >> +       int size;
> >> +       int ret = 0;
> >> +
> >> +       ctrl_hdlr = &ov01a10->ctrl_handler;
> >> +       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       ctrl_hdlr->lock = &ov01a10->mutex;
> >> +       cur_mode = ov01a10->cur_mode;
> >> +       size = ARRAY_SIZE(link_freq_menu_items);
> >> +
> >> +       ov01a10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
> >> +                                                   &ov01a10_ctrl_ops,
> >> +                                                   V4L2_CID_LINK_FREQ,
> >> +                                                   size - 1, 0,
> >> +                                                   link_freq_menu_items);
> >> +       if (ov01a10->link_freq)
> >> +               ov01a10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >> +
> >> +       ov01a10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
> >> +                                               V4L2_CID_PIXEL_RATE, 0,
> >> +                                               OV01A10_SCLK, 1, OV01A10_SCLK);
> >> +
> >> +       vblank_min = cur_mode->vts_min - cur_mode->height;
> >> +       vblank_max = OV01A10_VTS_MAX - cur_mode->height;
> >> +       vblank_default = cur_mode->vts_def - cur_mode->height;
> >> +       ov01a10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
> >> +                                           V4L2_CID_VBLANK, vblank_min,
> >> +                                           vblank_max, 1, vblank_default);
> >> +
> >> +       h_blank = cur_mode->hts - cur_mode->width;
> >> +       ov01a10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
> >> +                                           V4L2_CID_HBLANK, h_blank, h_blank,
> >> +                                           1, h_blank);
> >> +       if (ov01a10->hblank)
> >> +               ov01a10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >> +
> >> +       v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
> >> +                         OV01A10_ANAL_GAIN_MIN, OV01A10_ANAL_GAIN_MAX,
> >> +                         OV01A10_ANAL_GAIN_STEP, OV01A10_ANAL_GAIN_MIN);
> >> +       v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
> >> +                         OV01A10_DGTL_GAIN_MIN, OV01A10_DGTL_GAIN_MAX,
> >> +                         OV01A10_DGTL_GAIN_STEP, OV01A10_DGTL_GAIN_DEFAULT);
> >> +       exposure_max = cur_mode->vts_def - OV01A10_EXPOSURE_MAX_MARGIN;
> >> +       ov01a10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
> >> +                                             V4L2_CID_EXPOSURE,
> >> +                                             OV01A10_EXPOSURE_MIN,
> >> +                                             exposure_max,
> >> +                                             OV01A10_EXPOSURE_STEP,
> >> +                                             exposure_max);
> >> +       v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov01a10_ctrl_ops,
> >> +                                    V4L2_CID_TEST_PATTERN,
> >> +                                    ARRAY_SIZE(ov01a10_test_pattern_menu) - 1,
> >> +                                    0, 0, ov01a10_test_pattern_menu);
> >> +       if (ctrl_hdlr->error)
> >> +               return ctrl_hdlr->error;
> > 
> > A call to v4l2_ctrl_new_fwnode_properties to add the standard
> > V4L2_CID_CAMERA_ORIENTATION and V4L2_CID_CAMERA_SENSOR_ROTATION
> > properties?
> 
> Dave and Sakari,
> 
> Is it mandatory for all systems? Cameras don't have such 2 properties on
> some systems.

Please do add them. The values will be just 0 in those cases, and this is
good for the user space to know as well.

-- 
Kind regards,

Sakari Ailus
