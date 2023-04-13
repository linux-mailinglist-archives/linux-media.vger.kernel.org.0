Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3E656E0879
	for <lists+linux-media@lfdr.de>; Thu, 13 Apr 2023 09:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjDMH7J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Apr 2023 03:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjDMH7I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Apr 2023 03:59:08 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AF9469E
        for <linux-media@vger.kernel.org>; Thu, 13 Apr 2023 00:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681372746; x=1712908746;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=uOrGFnPI2FeuAvbvts0Hgi6l9KiuEpj9UDRZaIb1O3E=;
  b=FYDlE0gvi7yoEHTUacw4ELiR0S92Z4XNnld2+1u3ZD2U1fb4aSNvZx5I
   1hKzHZ+KKaGk6/KnMJd0ce5CxKDvgZJW9kprbCw0FBR+p1dD4z95PSZ+A
   nthBd5JZydsAqQCWiaAH/csf0BKQ3NDUzwCpEUkDWNj8FEHpEujsBf83Z
   yPMVFHW2GfMMiVFQP0TEuoeIfso9g3eEcv/Ud3tv0k4dtVA1WekMzV/pS
   w3bKKcBvF2MT+IEEvgEJrMuW1hMtLfVuKaKhT6XZhSWFlJEAiru57/Rl1
   txhz5I5ehjBB++JRha3K8Vj0ZR70yU3cVTULLUg1f6vH55VeZHuR93u/7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="341614096"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="341614096"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 00:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="753901928"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; 
   d="scan'208";a="753901928"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.139]) ([10.238.232.139])
  by fmsmga008.fm.intel.com with ESMTP; 13 Apr 2023 00:59:04 -0700
Subject: Re: [PATCH] media: i2c: add ov01a10 image sensor driver
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com
References: <1675941758-21433-1-git-send-email-bingbu.cao@intel.com>
 <CAPY8ntBiBS+_TH2BgkBF9dCD8nnJnEyMaxSbOvDkW4g3Kgs-Gg@mail.gmail.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <8f797f25-4824-a5ff-bb19-cf25c6c80463@linux.intel.com>
Date:   Thu, 13 Apr 2023 15:58:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntBiBS+_TH2BgkBF9dCD8nnJnEyMaxSbOvDkW4g3Kgs-Gg@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Thanks for your review.

On 2/9/23 8:40 PM, Dave Stevenson wrote:
> Hi Bingbu
> 
> Thanks for the patch. Just a couple of observations as I read through it.
> 
> On Thu, 9 Feb 2023 at 11:39, Bingbu Cao <bingbu.cao@intel.com> wrote:
>>
>> Add v4l2 device driver for OmniVision ov01a10 image sensor, ov01a10
>> image sensor can deliver 1280x800 resolution BGGR10 images at 60 fps.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> Signed-off-by: Yating Wang <yating.wang@intel.com>
>> ---
>>  drivers/media/i2c/Kconfig   |  13 +
>>  drivers/media/i2c/Makefile  |   1 +
>>  drivers/media/i2c/ov01a10.c | 906 ++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 920 insertions(+)
>>  create mode 100644 drivers/media/i2c/ov01a10.c
>>

snip

>> +static int ov01a10_init_controls(struct ov01a10 *ov01a10)
>> +{
>> +       struct v4l2_ctrl_handler *ctrl_hdlr;
>> +       const struct ov01a10_mode *cur_mode;
>> +       s64 exposure_max, h_blank;
>> +       u32 vblank_min, vblank_max, vblank_default;
>> +       int size;
>> +       int ret = 0;
>> +
>> +       ctrl_hdlr = &ov01a10->ctrl_handler;
>> +       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ctrl_hdlr->lock = &ov01a10->mutex;
>> +       cur_mode = ov01a10->cur_mode;
>> +       size = ARRAY_SIZE(link_freq_menu_items);
>> +
>> +       ov01a10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
>> +                                                   &ov01a10_ctrl_ops,
>> +                                                   V4L2_CID_LINK_FREQ,
>> +                                                   size - 1, 0,
>> +                                                   link_freq_menu_items);
>> +       if (ov01a10->link_freq)
>> +               ov01a10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +
>> +       ov01a10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
>> +                                               V4L2_CID_PIXEL_RATE, 0,
>> +                                               OV01A10_SCLK, 1, OV01A10_SCLK);
>> +
>> +       vblank_min = cur_mode->vts_min - cur_mode->height;
>> +       vblank_max = OV01A10_VTS_MAX - cur_mode->height;
>> +       vblank_default = cur_mode->vts_def - cur_mode->height;
>> +       ov01a10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
>> +                                           V4L2_CID_VBLANK, vblank_min,
>> +                                           vblank_max, 1, vblank_default);
>> +
>> +       h_blank = cur_mode->hts - cur_mode->width;
>> +       ov01a10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
>> +                                           V4L2_CID_HBLANK, h_blank, h_blank,
>> +                                           1, h_blank);
>> +       if (ov01a10->hblank)
>> +               ov01a10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +
>> +       v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
>> +                         OV01A10_ANAL_GAIN_MIN, OV01A10_ANAL_GAIN_MAX,
>> +                         OV01A10_ANAL_GAIN_STEP, OV01A10_ANAL_GAIN_MIN);
>> +       v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
>> +                         OV01A10_DGTL_GAIN_MIN, OV01A10_DGTL_GAIN_MAX,
>> +                         OV01A10_DGTL_GAIN_STEP, OV01A10_DGTL_GAIN_DEFAULT);
>> +       exposure_max = cur_mode->vts_def - OV01A10_EXPOSURE_MAX_MARGIN;
>> +       ov01a10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov01a10_ctrl_ops,
>> +                                             V4L2_CID_EXPOSURE,
>> +                                             OV01A10_EXPOSURE_MIN,
>> +                                             exposure_max,
>> +                                             OV01A10_EXPOSURE_STEP,
>> +                                             exposure_max);
>> +       v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov01a10_ctrl_ops,
>> +                                    V4L2_CID_TEST_PATTERN,
>> +                                    ARRAY_SIZE(ov01a10_test_pattern_menu) - 1,
>> +                                    0, 0, ov01a10_test_pattern_menu);
>> +       if (ctrl_hdlr->error)
>> +               return ctrl_hdlr->error;
> 
> A call to v4l2_ctrl_new_fwnode_properties to add the standard
> V4L2_CID_CAMERA_ORIENTATION and V4L2_CID_CAMERA_SENSOR_ROTATION
> properties?

Dave and Sakari,

Is it mandatory for all systems? Cameras don't have such 2 properties on
some systems.

> 
>> +
>> +       ov01a10->sd.ctrl_handler = ctrl_hdlr;
>> +
>> +       return 0;
>> +}
>> +
...

>> --
>> 2.7.4
>>

-- 
Best regards,
Bingbu Cao
