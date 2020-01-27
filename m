Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0095414A390
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2020 13:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730512AbgA0MNI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jan 2020 07:13:08 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:46267 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728733AbgA0MNI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jan 2020 07:13:08 -0500
Received: from [IPv6:2001:983:e9a7:1:3881:8f74:9b39:1bb7]
 ([IPv6:2001:983:e9a7:1:3881:8f74:9b39:1bb7])
        by smtp-cloud9.xs4all.net with ESMTPA
        id w3GKiKyr4T6sRw3GLi7pWO; Mon, 27 Jan 2020 13:13:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1580127186; bh=v22a27Kg0GkzRTa8P8cNHnqcgYirHDS5rEIa2jO1SSI=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=t+UbDDk0yNHCj0nky+9ST9ECYpVU3cG09s2toKpGZS6lBpWEQC9MC8TzXrCWvGxIN
         qFZuDoF75YGVU5R5jVEuZoYPMmPuHtdOY9VDaUiASLmrIS8tW9ATLIEsj4XMbbu3X4
         nBePo5C8uJMoBDRzAuU1bvtwxfJGjKbX2pxCWiFmxPCvjDPr1X74Enn8t30rrqGAbm
         HtG0AdXYFX6xPYK95OLDrAom2s3ViyJboNLPMyWUaNImg2C1f38VzmuIuUIhYt9D1s
         noe62liLhBGem3xubO1gYt0xTGRtCvhvLZ8IXjY+84QPZlIjKl0dJR+pN4ARBGr3Yr
         6XnZ8IOCle4Aw==
Subject: Re: 14-bit pixel/media bus formats for i.MX8QM/QXP CSI
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        =?UTF-8?Q?Daniel_Gl=c3=b6ckner?= <dg@emlix.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
References: <8885ed8c-6121-d40e-bc45-3ed58f800a95@emlix.com>
 <20200127104233.GC21275@kekkonen.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <de8f9a84-ed1e-5f1d-5e63-5d2ecd949144@xs4all.nl>
Date:   Mon, 27 Jan 2020 13:13:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200127104233.GC21275@kekkonen.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIhdDH9XwL5Vfy1OTOHAlK6vmpK75vKl81SkunfT6AOyhJy5yL4jQ470BTnEaVawCrAw7VoK5Eg4OLDsNkT+fQYAbSB5WskC4AoVAq41y7l25eCxZx4f
 IHFzBDtyU5nU/7qLZ9gImwYSqjG+zkOTJQABWQ5oUX2OKkcyrKuVa1nNI/qu6qzOG/ZYezKHoIY1AMDOE0Q+f30E4z21cncspHcF609OoAS4K7H03MmfgSKF
 4WQMlj430zCaQQZwXZQ5759rI1w1x9iCQDxVGkzYUc/C6Z/bgBa3GpBqm08z32IwGpXtO9Xr42BGK9hA6kZ5Qqf0F7WjgaOkY2VfhZBAkxFRv3Voub65zvbv
 HwyxewZRsygqCvS/ckro/kXojr5yrw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/27/20 11:42 AM, Sakari Ailus wrote:
> Hi Daniel,
> 
> On Fri, Jan 24, 2020 at 09:36:25PM +0100, Daniel Glöckner wrote:
>> Hello,
>>
>> the i.MX8QM and i.MX8QXP contain MIPI CSI-2 controllers that forward the
>> received data on a parallel bus to the Image Sensing Interface (ISI) of
>> the chip. If the data on the MIPI bus is in any of the six RAW formats
>> defined for CSI-2, the CSI controller will shift the values so that the
>> msb is always in bit 13. This was most likely done to allow following
>> hardware to process the data as RAW14 regardless of the actual RAW format.
>> Unfortunately the ISI is not able to shift the bits back before writing it
>> to memory. RAW8 data therefore has to be saved in two bytes per sample with
>> two unused bits at the top and six unused bits at the bottom.
> 
> That's a rather peculiar implementation, indeed.
> 
>>
>> The drivers for the hardware are still being developed in NXP's repository
>> at CodeAurora. We have extended them to support greyscale and Bayer
>> cameras. Now all we need are stable defines for the pixel and media bus
>> formats for use in libraries and applications and documentation for people
>> to know their meaning.
>>
>> To keep the number of needed formats low, we would like to ignore that
>> there might be unused bits at the bottom. Then we can use the existing
>> MEDIA_BUS_FMT_S{BGGR,GBRG,GRBG,RGGB}14_1X14 formats between the CSI
>> controller and the ISI and just have to add a MEDIA_BUS_FMT_Y14_1X14
>> format. For the pixel formats we would add V4L2_PIX_FMT_Y14 and rebase
>> e38d5f254ad8 from Sakari's packed12-postponed branch for Bayer.
>>
>> Now the questions:
>>
>>  - Is it acceptable to use MEDIA_BUS_FMT_Y14_1X14 in this case instead of
>>    using MEDIA_BUS_FMT_Y12_1X14_PADLO, MEDIA_BUS_FMT_Y10_1X14_PADLO,
>>    MEDIA_BUS_FMT_Y8_1X14_PADLO, MEDIA_BUS_FMT_Y7_1X14_PADLO,
>>    MEDIA_BUS_FMT_Y6_1X14_PADLO? Another 20 _PADLO formats would have to
>>    be added for Bayer.
> 
> I think I'd say yes, you could do this, *if* you're fully certain you'll
> *never* see this CSI-2 receiver paired with any other hardware than the
> ISI, which is the case for instance if it's part of the same device. As if
> there is hardware that can make use of the information on how many bits are
> actually used there, you'd need to expose that information on the uAPI as
> well. Changing that would be an uAPI change, something that should be
> avoided if at all possible.
> 
>>
>>  - Given the history of Sakari's packed12-postponed branch, is there a
>>    chance to get these definitions merged into mainline although the
>>    driver is not? I fear that NXP's drivers will not hit mainline for a
>>    long time.
> 
> Cc'ing Hans.
> 
> We have a practice not merging the format definitions (or other API
> additions) before there are users. That's partly because often API
> additions merged before the user have ended never being used because it
> turned out to be something else that the driver actually needed, or the
> driver was never merged.
> 
> That said, I don't foresee that problem here: these (14-bit raw Bayer
> pixel) formats are pretty standard stuff albeit still rare for 14 bits is
> more than you usually need, but we started off with 8 bits per pixel and 12
> isn't uncommon nowadays.
> 
> I'd be leaning towards merging them --- it's just a question of time when
> they'll be needed somewhere else.

I see no problem with adding MEDIA_BUS_FMT_Y14_1X14.

Regards,

	Hans

> 
>>
>>  - Sakari, do you mind me adding the same license header to your
>>    pixfmt-y14.rst that is used by all other pixfmt-y*.rst files?
> 
> Feel free to do so.
> 

