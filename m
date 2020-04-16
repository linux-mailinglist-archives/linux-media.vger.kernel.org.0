Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07BE91ACE75
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 19:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729261AbgDPRK6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 13:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727795AbgDPRK5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 13:10:57 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF65C061A0C
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2020 10:10:57 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id o1so1628915pjs.4
        for <linux-media@vger.kernel.org>; Thu, 16 Apr 2020 10:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=58pHG2bsilHoxbXzTvaYmuRBHYdPh5E9LJvAOui981E=;
        b=NzpCs5M42fvcT2gIiBRbJRh42VeT83eNPmmfnv0Fi5+MHyEAhG5PEyHWnSJ4snsKz6
         D1iFxH8ZhB/T96qWxAcuNyd9fN8SmVE84TxXJuYjrIwt6y3sifC6YnE0Weqsls6CAZTP
         VaoXT4shbWHrURXyFx7cGazYJjw+m7Zn0Vhjj46N0Q+vqXgOOh7/2mooqLIg1AJoLiOc
         J1/S4cNBdxF4CwdrGCRnMAtPXxaWb8RHsLb5+dEIVeq8/8Z6FkQ4AqPpWLwwQoi/6InP
         VpsTmW4vGe25S16g+SVpUiTlWrWPq/XFcR2zW89BGtScSZdCjM9uCZ64Wx2Fwxzs8Frc
         PgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=58pHG2bsilHoxbXzTvaYmuRBHYdPh5E9LJvAOui981E=;
        b=e2GbvchlGSzc+q9rL1Vu8o2rsr4jEV4KAS5LNzxG+MD0pXhNtcnwBprNPKBxNuS2md
         s52SuLdvLI8/FbWpXTe++wltrWx71giQ/ZVibXgmJvmuTleeqAvtXlcs3VcVF7KBbpID
         9X6Z2NDBgbASC07D+5SlYeEhS5nbNc0bZE5iCzASmUIbUNX4E6o/xn8Ip+LImcxuWUNP
         f8DobOWTlrf0ySSLDvg8ZIcCdKU5sf7IxNk2qzuMaFA5zOlh3R/x1GOB2iMBw6S0+pI5
         mQZH9bWgbGctLFnA/tC7tn7DzVMUbAhlE8KUZB3gQ2wNGOy9hS+QVS2iigUdLw94N9rn
         UCAA==
X-Gm-Message-State: AGi0PuYZa0WC5vxGlFT+eIcKFF28rdSkKbXAX5W1baKxCVu7ocbaKI4E
        IOKnUU9gnc7RqEwOjzy/630=
X-Google-Smtp-Source: APiQypIYre45NZh1KvAoOw0DFpBYlJa9wOxC5Frzkko7noUmnchAfSpFaETAjy+kgtsMlyIHefqkTw==
X-Received: by 2002:a17:902:8c88:: with SMTP id t8mr10549675plo.176.1587057056583;
        Thu, 16 Apr 2020 10:10:56 -0700 (PDT)
Received: from [172.30.88.172] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id j24sm3080563pji.20.2020.04.16.10.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 10:10:55 -0700 (PDT)
Subject: Re: [PATCH] media: imx: utils: Default colorspace to SRGB
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20200325173456.21455-1-slongerbeam@gmail.com>
 <9cea8cb9-b127-6ff0-a240-be338e081eaa@xs4all.nl>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <11327092-e06c-a739-cbd2-ef44177fbc6a@gmail.com>
Date:   Thu, 16 Apr 2020 10:10:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9cea8cb9-b127-6ff0-a240-be338e081eaa@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 4/16/20 3:52 AM, Hans Verkuil wrote:
> Hi Steve,
>
> On 25/03/2020 18:34, Steve Longerbeam wrote:
>> The function init_mbus_colorimetry() is used to initialize the imx
>> subdevice mbus colorimetry to some sane defaults when the subdevice is
>> registered. Currently it guesses at a colorspace based on the passed
>> mbus pixel format. If the format is RGB, it chooses colorspace
>> V4L2_COLORSPACE_SRGB, and if the format is YUV, it chooses
>> V4L2_COLORSPACE_SMPTE170M.
>>
>> While that might be a good guess, it's not necessarily true that a RGB
>> pixel format encoding uses a SRGB colorspace, or that a YUV encoding
>> uses a SMPTE170M colorspace. Instead of making this dubious guess,
>> just default the colorspace to SRGB.
>>
>> Reported-by: Hans Verkuil <hverkuil@xs4all.nl>
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>> ---
>>   drivers/staging/media/imx/imx-media-utils.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
>> index fae981698c49..8344675bfd05 100644
>> --- a/drivers/staging/media/imx/imx-media-utils.c
>> +++ b/drivers/staging/media/imx/imx-media-utils.c
>> @@ -236,8 +236,7 @@ static const struct imx_media_pixfmt ipu_rgb_formats[] = {
>>   static void init_mbus_colorimetry(struct v4l2_mbus_framefmt *mbus,
>>   				  const struct imx_media_pixfmt *fmt)
>>   {
>> -	mbus->colorspace = (fmt->cs == IPUV3_COLORSPACE_RGB) ?
>> -		V4L2_COLORSPACE_SRGB : V4L2_COLORSPACE_SMPTE170M;
>> +	mbus->colorspace = V4L2_COLORSPACE_SRGB;
>>   	mbus->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(mbus->colorspace);
>>   	mbus->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(mbus->colorspace);
>>   	mbus->quantization =
> The quantization is probably wrong as well since it checks fmt->cs.
> The first argument should just be 'true'.

I don't think so. The default quantization depends in part on whether 
the pixel format is RGB or YUV, which is the reason for passing boolean 
(fmt->cs == IPUV3_COLORSPACE_RGB) as the first argument.

I realize "fmt->cs" is a misnomer, but it is borrowing from earlier 
misnomers, i.e. the 'enum ipu_color_space' enumerations. Fixing those 
names would touch lots of imx driver code.


>
> In any case, this patch no longer applies after the imx utils patch series.

Ok, I'll re-submit after the utils patch series is merged.

Steve

