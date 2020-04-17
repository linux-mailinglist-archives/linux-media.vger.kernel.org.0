Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25A541AD781
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 09:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbgDQHfk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 03:35:40 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:48997 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728419AbgDQHfk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 03:35:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PLXDjhjzf7xncPLXGj9fPQ; Fri, 17 Apr 2020 09:35:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587108938; bh=o8U3pXYZ0/e100B70V5S/22+PtbeEPaEMsEahcOXC8U=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ckb5LeodlKbwCzVCi2urqUV6PxcXLm43HMrb98Wa2EUB8gFCx6HalGtpWJAz+tinU
         26Xyxoq73+KeF8mBK0RFY6pfzCspPmRCY/4DBCQJ7BcZAVoB+EoLk62FiGvk1LQpag
         0uRnUsy9h8fV4dUfFHNP1mkOGMWrVpjhOb4vCCLuD/bqmYh1Owa0N8u3Oo8+6Q4/DD
         cW8u/3MBoDpHmPbXjMBz7LHml/SPDYqAVreo4z8zVFebNBkG2QgNao7fHFtf92EXO1
         WmOTPYU21Rg3QIEHghAcYbw8j/ATWoLFwJXcqX86+5ukyG8Xb5Q5GE4Pmvs9wN2chj
         cRNd/KVxcBDCg==
Subject: Re: [PATCH] vimc: Report a colorspace
To:     Helen Koike <helen.koike@collabora.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200316221606.2648820-1-niklas.soderlund+renesas@ragnatech.se>
 <779b6314-31a6-76df-6dd3-1a24f577a5d3@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <60c2d33c-e999-d4e3-0bea-64574b08cade@xs4all.nl>
Date:   Fri, 17 Apr 2020 09:35:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <779b6314-31a6-76df-6dd3-1a24f577a5d3@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPmNwipRnd8sVZFSXQyGKh0hEgcB1ctfCEHj1lwdqH+Y7ze0xoA6veGjGuMd98OzdE8JvMw758pWFiFYwtM+j+jdkvSM5d/dcMfaMJFqDMNn8OxzCqk6
 Z/4PAfI7HYNEVLSEojO2kOvdTZAW8hd9TQhVKCUJR+NKtwOsnDKAB+Qa98w+rr0mMeSXarT70F8uJ5jP89vZ+1KFjTaG3K7vWisqky0XeH4vb2ktvvx5ZRXM
 mm2AKFGlO3jEj6N3wRspRS3bqOROu3O7DtEMHS4FoqOQcJKGhDE3rp/rtlSmrNL4olWxMkU1TTP4FZVM/B5eVg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/03/2020 12:27, Helen Koike wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> I would just change the title of the commit to start with the tags:
> 
> media: vimc: cap:
> 
> On 3/16/20 7:16 PM, Niklas Söderlund wrote:
>> The colorspace reported by a video nodes should not be
>> V4L2_COLORSPACE_DEFAULT. Instead a default colorspace should be picked
>> by the driver if V4L2_COLORSPACE_DEFAULT is given by userspace to
>> {G,S,TRY}_FMT.
>>
>> The colorspace V4L2_COLORSPACE_SRGB is arbitrary chosen as the vimc
>> default format to report as it's used for most webcams.
>>
>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Acked-by: Helen Koike <helen.koike@collabora.com>
> 
> Do the subdevices also need this change?
> They also use V4L2_COLORSPACE_DEFAULT in their default format.

The sensor specifically should report a non-default colorspace.

Ideally the colorimetry information should propagate from the source (sensor)
to the capture device. To be honest, I'm not sure how existing MC drivers
handle this.

Regards,

	Hans

> 
> Regards,
> Helen
> 
>> ---
>>  drivers/media/platform/vimc/vimc-capture.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>> ---
>> Hi,
>>
>> This was found while adding V4L2_CAP_IO_MC support to vimc and adding 
>> tests to v4l2-compliance. The issue will hence only show up in 
>> v4l2-compliance if V4L2_CAP_IO_MC series is enabled for vimc.
>>
>> Best regards,
>> Niklas Söderlund
>>
>> diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
>> index 23e740c1c5c00802..747ea9cc1bd7cb12 100644
>> --- a/drivers/media/platform/vimc/vimc-capture.c
>> +++ b/drivers/media/platform/vimc/vimc-capture.c
>> @@ -37,7 +37,7 @@ static const struct v4l2_pix_format fmt_default = {
>>  	.height = 480,
>>  	.pixelformat = V4L2_PIX_FMT_RGB24,
>>  	.field = V4L2_FIELD_NONE,
>> -	.colorspace = V4L2_COLORSPACE_DEFAULT,
>> +	.colorspace = V4L2_COLORSPACE_SRGB,
>>  };
>>  
>>  struct vimc_cap_buffer {
>> @@ -107,6 +107,9 @@ static int vimc_cap_try_fmt_vid_cap(struct file *file, void *priv,
>>  
>>  	vimc_colorimetry_clamp(format);
>>  
>> +	if (format->colorspace == V4L2_COLORSPACE_DEFAULT)
>> +		format->colorspace = fmt_default.colorspace;
>> +
>>  	return 0;
>>  }
>>  
>>

