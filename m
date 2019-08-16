Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD178FB6F
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 08:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbfHPGwa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 02:52:30 -0400
Received: from mga14.intel.com ([192.55.52.115]:2912 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbfHPGw3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 02:52:29 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 23:52:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,391,1559545200"; 
   d="scan'208";a="377331966"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.193]) ([10.238.232.193])
  by fmsmga006.fm.intel.com with ESMTP; 15 Aug 2019 23:52:27 -0700
Subject: Re: [PATCH] media: staging: imgu: make imgu work on low frequency for
 low input
To:     Tomasz Figa <tfiga@chromium.org>,
        Cao Bing Bu <bingbu.cao@intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Yeh, Andy" <andy.yeh@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
References: <1565926419-2228-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5Db7_cridF5KzuUOujgiUT8fqczRX6T-yyM5P9W9Ut-Mw@mail.gmail.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <f8f4e40a-b3ae-d75e-d2c2-0c667b0e8b52@linux.intel.com>
Date:   Fri, 16 Aug 2019 15:00:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAAFQd5Db7_cridF5KzuUOujgiUT8fqczRX6T-yyM5P9W9Ut-Mw@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Tomasz

Thanks for your review.

On 8/16/19 2:10 PM, Tomasz Figa wrote:
> Hi Bingbu,
> 
> On Fri, Aug 16, 2019 at 12:25 PM <bingbu.cao@intel.com> wrote:
>>
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> Currently, imgu is working on 450MHz for all cases, however
>> in some cases (input frame less than 2.3MP), the imgu
>> did not need work in high frequency.
>> This patch make imgu work on 200MHz if the imgu input
>> frame is less than 2.3MP to save power.
>>
> 
> Thanks for the patch! Please see my comments inline.
> 
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> ---
>>  drivers/staging/media/ipu3/ipu3-css.c  | 7 ++++---
>>  drivers/staging/media/ipu3/ipu3-css.h  | 3 ++-
>>  drivers/staging/media/ipu3/ipu3-v4l2.c | 6 ++++++
>>  drivers/staging/media/ipu3/ipu3.c      | 6 ++++--
>>  drivers/staging/media/ipu3/ipu3.h      | 1 +
>>  5 files changed, 17 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
>> index fd1ed84c400c..590ed7e182a6 100644
>> --- a/drivers/staging/media/ipu3/ipu3-css.c
>> +++ b/drivers/staging/media/ipu3/ipu3-css.c
>> @@ -210,12 +210,13 @@ static int imgu_hw_wait(void __iomem *base, int reg, u32 mask, u32 cmp)
>>
>>  /* Initialize the IPU3 CSS hardware and associated h/w blocks */
>>
>> -int imgu_css_set_powerup(struct device *dev, void __iomem *base)
>> +int imgu_css_set_powerup(struct device *dev, void __iomem *base, bool low_power)
>>  {
>> -       static const unsigned int freq = 450;
>> +       unsigned int freq;
> 
> How about making freq the argument to this function rather than
> introducing some artificial boolean?
Let me try to move the check into imgu_powerup().
> 
>>         u32 pm_ctrl, state, val;
>>
>> -       dev_dbg(dev, "%s\n", __func__);
>> +       freq = low_power ? 200 : 450;
>> +       dev_dbg(dev, "%s with freq %u\n", __func__, freq);
>>         /* Clear the CSS busy signal */
>>         readl(base + IMGU_REG_GP_BUSY);
>>         writel(0, base + IMGU_REG_GP_BUSY);
>> diff --git a/drivers/staging/media/ipu3/ipu3-css.h b/drivers/staging/media/ipu3/ipu3-css.h
>> index 6b8bab27ab1f..882936a9dae9 100644
>> --- a/drivers/staging/media/ipu3/ipu3-css.h
>> +++ b/drivers/staging/media/ipu3/ipu3-css.h
>> @@ -187,7 +187,8 @@ bool imgu_css_is_streaming(struct imgu_css *css);
>>  bool imgu_css_pipe_queue_empty(struct imgu_css *css, unsigned int pipe);
>>
>>  /******************* css hw *******************/
>> -int imgu_css_set_powerup(struct device *dev, void __iomem *base);
>> +int imgu_css_set_powerup(struct device *dev, void __iomem *base,
>> +                        bool low_power);
>>  void imgu_css_set_powerdown(struct device *dev, void __iomem *base);
>>  int imgu_css_irq_ack(struct imgu_css *css);
>>
>> diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
>> index 3c7ad1eed434..dcc2a0476e49 100644
>> --- a/drivers/staging/media/ipu3/ipu3-v4l2.c
>> +++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
>> @@ -182,6 +182,12 @@ static int imgu_subdev_set_fmt(struct v4l2_subdev *sd,
>>                 fmt->format.height = clamp(fmt->format.height,
>>                                            IPU3_INPUT_MIN_HEIGHT,
>>                                            IPU3_INPUT_MAX_HEIGHT);
>> +
>> +               /* input less than 2.3MP, ask imgu to work with low freq */
>> +               if ((fmt->format.width * fmt->format.height) < (2048 * 1152))
> 
> Why 2048 * 1152 specifically if we just care about the number of
> pixels? Also it's slightly more than 2.3Mpix (2.359296 Mpix) making
> the comment inaccurate.
2048 *1152 is the smallest common 16:9/4:3 resolution that larger than
1080p, we try to use this resolution as the start point to make imgu
work on high frequency.
> 
>> +                       imgu->low_power = true;
>> +               else
>> +                       imgu->low_power = false;
> 
> There should be no need to store this, as we should have access to the
> exact format when we start streaming. Could you move the check there?
> 
> Also, we have 2 pipes. How do they play together?
We want to guarantee 2 pipes can always work on each frequency, there is
no precise calculation which can be used to make more finer granularity.
> 
> Best regards,
> Tomasz
> 
