Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A74124F171
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 05:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728208AbgHXDOr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Aug 2020 23:14:47 -0400
Received: from mga14.intel.com ([192.55.52.115]:39937 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728174AbgHXDOj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Aug 2020 23:14:39 -0400
IronPort-SDR: 2Up91Tm8JcjhtgqywypsEEH0cIU8QZ4wn7H00ZfHOEM2lLOm4k5VT1IWmxwfSRoD+TcihDWYor
 VKbY9L70y3vA==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="155091159"
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="155091159"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2020 20:14:38 -0700
IronPort-SDR: FfBok+Zf/kCbY2y8X+oYMdFBBL38v/M56igj1GcRNQspid2vFVjuR+GyDs/iZWUKddNQAlQXbc
 R+EhdoV6+8IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="322003877"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by fmsmga004.fm.intel.com with ESMTP; 23 Aug 2020 20:14:36 -0700
Subject: Re: [PATCH v2] media: ov5675: correct the maximum exposure value
To:     Tomasz Figa <tfiga@chromium.org>, Bingbu Cao <bingbu.cao@intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        shawnx.tu@intel.com, Sergey Senozhatsky <senozhatsky@chromium.org>,
        hongju.wang@intel.com
References: <1597996790-21121-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5DQR-HmFkgPk5mhTcoODEoAamhP0EO_YQR04SGQnuZp_w@mail.gmail.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <caac1db9-412c-bb92-9670-dbef35d09374@linux.intel.com>
Date:   Mon, 24 Aug 2020 11:13:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5DQR-HmFkgPk5mhTcoODEoAamhP0EO_YQR04SGQnuZp_w@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/22/20 11:03 PM, Tomasz Figa wrote:
> Hi Bingbu,
> 
> On Fri, Aug 21, 2020 at 10:00 AM Bingbu Cao <bingbu.cao@intel.com> wrote:
>>
>> The unit of exposure value is different from other OmniVision sensors,
>> driver will divide by 2 before set register, the exposure range exposed
>> by v4l2 ctrl to user should be same as others, so the calculation for
>> the maximum exposure value in current driver need be fixed.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
>>  drivers/media/i2c/ov5675.c | 15 ++++++++++-----
>>  1 file changed, 10 insertions(+), 5 deletions(-)
>>
> 
> Thanks for the patch! Please see my comments inline.
> 
>> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
>> index 8537cc4ca108..9540ce8918f0 100644
>> --- a/drivers/media/i2c/ov5675.c
>> +++ b/drivers/media/i2c/ov5675.c
>> @@ -666,8 +666,8 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
>>         /* Propagate change of current control to all related controls */
>>         if (ctrl->id == V4L2_CID_VBLANK) {
>>                 /* Update max exposure while meeting expected vblanking */
>> -               exposure_max = (ov5675->cur_mode->height + ctrl->val -
>> -                              OV5675_EXPOSURE_MAX_MARGIN) / 2;
>> +               exposure_max = ov5675->cur_mode->height + ctrl->val -
>> +                       OV5675_EXPOSURE_MAX_MARGIN;
>>                 __v4l2_ctrl_modify_range(ov5675->exposure,
>>                                          ov5675->exposure->minimum,
>>                                          exposure_max, ov5675->exposure->step,
>> @@ -689,7 +689,13 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
>>                 break;
>>
>>         case V4L2_CID_EXPOSURE:
>> -               /* 3 least significant bits of expsoure are fractional part */
>> +               /* 4 least significant bits of expsoure are fractional part
> 
> exposure
> 
>> +                * val = val << 4
>> +                * for ov5675, the unit of exposure is differnt from other
> 
> different
> 
>> +                * OmniVision sensors, its exposure value is twice of the
>> +                * register value, the exposure should be divided by 2 before
>> +                * set register, e.g. val << 3.
>> +                */
>>                 ret = ov5675_write_reg(ov5675, OV5675_REG_EXPOSURE,
>>                                        OV5675_REG_VALUE_24BIT, ctrl->val << 3);
> 
> How about turning this code into (ctrl->val << 4) / 2 ? It will be
> compiled into exactly the same code, but will be obvious that we are
> handling two different factors in the computation.
> 
> Another question: Since the V4L2_CID_EXPOSURE control is not specified
> to be in a particular unit and hardware supports fractional exposures,
> why not expose the exposure exactly as it is in the register?
My understanding is that the exposure calculation in userspace is commonly based
on the unit of exposure - line, as some sensor did not support fractional
exposures, so the common calculation only care the integral part. For ov5675, it
is different from others, its register value unit is 2lines instead of lines.

Sakari, do you have some idea?

> 
> Best regards,
> Tomasz
> 
>>                 break;
>> @@ -770,8 +776,7 @@ static int ov5675_init_controls(struct ov5675 *ov5675)
>>         v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
>>                           OV5675_DGTL_GAIN_MIN, OV5675_DGTL_GAIN_MAX,
>>                           OV5675_DGTL_GAIN_STEP, OV5675_DGTL_GAIN_DEFAULT);
>> -       exposure_max = (ov5675->cur_mode->vts_def -
>> -                       OV5675_EXPOSURE_MAX_MARGIN) / 2;
>> +       exposure_max = (ov5675->cur_mode->vts_def - OV5675_EXPOSURE_MAX_MARGIN);
>>         ov5675->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov5675_ctrl_ops,
>>                                              V4L2_CID_EXPOSURE,
>>                                              OV5675_EXPOSURE_MIN, exposure_max,
>> --
>> 2.7.4
>>

-- 
Best regards,
Bingbu Cao
