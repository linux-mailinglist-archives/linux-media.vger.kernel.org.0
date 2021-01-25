Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 924FE304857
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 20:23:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388695AbhAZFp2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729854AbhAYPgH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 10:36:07 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82AD4C0613D6;
        Mon, 25 Jan 2021 07:03:02 -0800 (PST)
Received: from [IPv6:2804:214:81d7:a6cc:f83c:66c3:4225:e59d] (unknown [IPv6:2804:214:81d7:a6cc:f83c:66c3:4225:e59d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6CEE71F44F13;
        Mon, 25 Jan 2021 15:02:58 +0000 (GMT)
Subject: Re: [PATCH 2/3] media: videodev2.h: clarify
 v4l2_pix_format_mplane.sizeimage docs when to set to zero
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com, kernel@collabora.com,
        linux-kernel@vger.kernel.org, tfiga@chromium.org
References: <20210114180149.1755892-1-helen.koike@collabora.com>
 <20210114180149.1755892-3-helen.koike@collabora.com>
 <acae9f51-f8ca-b5f6-9af0-f0acc04e911d@xs4all.nl>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <2afcfc92-eaec-6175-cfc4-0cfe760bed9f@collabora.com>
Date:   Mon, 25 Jan 2021 12:02:53 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <acae9f51-f8ca-b5f6-9af0-f0acc04e911d@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 1/25/21 6:31 AM, Hans Verkuil wrote:
> On 14/01/2021 19:01, Helen Koike wrote:
>> sizeimage field should be set to zero for unused planes, even when
>> v4l2_pix_format_mplane.num_planes is smaller then the index of planes.
> 
> then -> than

Ack.

> 
>>
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>
>> ---
>>
>> I caught this with v4l2-compliance, which throws an error if we dirty
>> planes, even if invalid, so I would like to make it clear in the docs.
> 
> What is the error? And with which driver?

I was implementing conversions to/from Ext API, and I thought v4l2-compliance
wasn't happy if I didn't zero the other entries, but I'm trying to reproduce
it now by adding a non-zero value to sizeimage and I can't reproduce it, so
it was probably my mistake.
Please ignore this patch and sorry for the noise.

> 
> I wonder if this isn't a v4l2-compliance bug. And if we want this to be
> zeroed, then it wouldn't it be better to do that in the V4L2 core rather
> than bother drivers with this?
> 
>> ---
>>  include/uapi/linux/videodev2.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
>> index 79dbde3bcf8d..d9b7c9177605 100644
>> --- a/include/uapi/linux/videodev2.h
>> +++ b/include/uapi/linux/videodev2.h
>> @@ -2227,6 +2227,7 @@ struct v4l2_mpeg_vbi_fmt_ivtv {
>>   * struct v4l2_plane_pix_format - additional, per-plane format definition
>>   * @sizeimage:		maximum size in bytes required for data, for which
>>   *			this plane will be used
>> + *			Drivers should be set it zero for unused planes.
> 
> This sentence is a bit garbled.
> 
> You probably meant: Drivers must set this to zero for unused planes.
> 
> But it makes no sense to just zero this field. I would zero the whole struct
> contents for the unused planes.
> 
>>   * @bytesperline:	distance in bytes between the leftmost pixels in two
>>   *			adjacent lines
>>   */
>>
> 
> The API doesn't mention whether unused plane formats should be zeroed or not,
> but it does make sense that they are. I don't think that the userspace API
> should be changed (esp. since there are apparently already drivers that do
> not zero these unused plane formats), but it makes sense that the compliance
> test does verify this, and that the V4L2 core would zero unused plane formats.
> 
> I never like it when undefined values are allowed in an API, so it makes sense
> that this is done.


Ack.

Thanks
Helen


> 
> Regards,
> 
> 	Hans
> 
