Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5483F46EEE
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2019 10:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfFOII4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Jun 2019 04:08:56 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:54321 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725825AbfFOIIz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Jun 2019 04:08:55 -0400
Received: from [IPv6:2001:983:e9a7:1:cc45:ac5:3048:e495] ([IPv6:2001:983:e9a7:1:cc45:ac5:3048:e495])
        by smtp-cloud7.xs4all.net with ESMTPA
        id c3k0hgjMK5qKac3k2hPzyG; Sat, 15 Jun 2019 10:08:53 +0200
Subject: Re: [PATCHv4 0/2] Document memory-to-memory video codec interfaces
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Pawel Osciak <posciak@chromium.org>
References: <20190603112835.19661-1-hverkuil-cisco@xs4all.nl>
 <259bb812-9cc9-8fe7-8fc6-2cbd5ef44ac3@xs4all.nl>
 <615f53383f8f65011d1ce3ec49f6d78b67b8ddea.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <74c25415-01d4-eed6-c277-124a8ef1bf3e@xs4all.nl>
Date:   Sat, 15 Jun 2019 10:08:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <615f53383f8f65011d1ce3ec49f6d78b67b8ddea.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLGBM5gcGisHSFXeUWBoGOyrd/k9//nlnQCEgl0PnzJxYLAMR2DeUyh0usoMdOw0diyNRO0ElanCRr03NS3YOeO2L1aBXlcHWTFV7/VK222c3hpqJldO
 oQSUCBmrUs3bSqOIueyqMz/cMiVek5R1/ja9DrcWG/BZ9wx5XEhFMTXcpqtvLsd5GAXcxYNNWEan0hFFeM3OdiI2DDC4fquyipRbrmbG2MV2N0iJiz2iSVym
 /hd80vnsQkdBAa8Q7JnVZ9vfojPnkd7q6wJkw5wBD2LUm02sn9Xkaob34F1/qkYHYpZtBycTUsgYKEHPl1mqw7KSKr+W0ejq0h/YBJY6cLo35tKkIc5bjb5J
 iSSbb7ht5qFKHzeAghoOkGGdnrNiuvzMXBPJIr8o8Cx/1oib7C8Cj5arYgHh/W7CQJttE/xsM9DxFkS3eTP+7SN8c+Cqb8PKb3gK4PY3u7x4KO2bIlKVHIRS
 D/8Pa2e30qybgU1sQR7ccBSO+HvLrg7/rMjjAjpMxXytlbLfT/Y6GTbnZMwxsUbSzZPbMhIJsYY0fq8UfgaELWQgwvHYrnk4aes64NSQJ2xY+TNOLEbdtlAM
 kQ6v9YT77P54RdfX3pRV0lsZ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/14/19 3:09 AM, Nicolas Dufresne wrote:
> Le jeudi 13 juin 2019 à 08:48 +0200, Hans Verkuil a écrit :
>> On 6/3/19 1:28 PM, Hans Verkuil wrote:
>>> Since Tomasz was very busy with other things, I've taken over this
>>> patch series. This v4 includes his draft changes and additional changes
>>> from me.
>>>
>>> This series attempts to add the documentation of what was discussed
>>> during Media Workshops at LinuxCon Europe 2012 in Barcelona and then
>>> later Embedded Linux Conference Europe 2014 in Düsseldorf and then
>>> eventually written down by Pawel Osciak and tweaked a bit by Chrome OS
>>> video team (but mostly in a cosmetic way or making the document more
>>> precise), during the several years of Chrome OS using the APIs in
>>> production.
>>>
>>> Note that most, if not all, of the API is already implemented in
>>> existing mainline drivers, such as s5p-mfc or mtk-vcodec. Intention of
>>> this series is just to formalize what we already have.
>>>
>>> Thanks everyone for the huge amount of useful comments to previous
>>> versions of this series. Much of the credits should go to Pawel Osciak
>>> too, for writing most of the original text of the initial RFC.
>>>
>>> This v4 incorporates all known comments (let me know if I missed
>>> something!) and should be complete for the decoder.
>>>
>>> For the encoder there are two remaining TODOs for the API:
>>>
>>> 1) Setting the frame rate so bitrate control can make sense, since
>>>    they need to know this information.
>>>
>>>    Suggested solution: require support for ENUM_FRAMEINTERVALS for the
>>>    coded pixelformats and S_PARM(OUTPUT). Open question: some drivers
>>>    (mediatek, hva, coda) require S_PARM(OUTPUT), some (venus) allow both
>>>    S_PARM(CAPTURE) and S_PARM(OUTPUT). I am inclined to allow both since
>>>    this is not a CAPTURE vs OUTPUT thing, it is global to both queues.
>>
>> Alternative proposal:
>>
>> 1) Add support for fractions (struct v4l2_fract) as a control type:
>>    V4L2_CTRL_TYPE_FRACT.
>>
>> 2) Add a new V4L2_CID_MPEG_FRAME_INTERVAL control.
> 
> Is the MPEG namespace historical ? That might be confusing for users.

Yes, it's historical. I have toyed with the idea of renaming all the
defines to something like V4L2_CID_CODEC_... (keeping the old defines, of
course), but I'm not sure it is worth it.

> 
>>
>> Encoders shall support this control.
>>
>> 3) For backwards compatibility reasons encoder drivers still have to
>> support G/S_PARM, but this can now be implemented by standard helpers
>> that query this control. Drivers also have to implement ENUM_FRAMEINTERVALS.
> 
> That's won't be very friendly for UI generator like qv4l2. Support for
> v4l2_fract as control should include a way to describe the supported
> values of that control the usual way I think.

Such a control will definitely have the usual min/max/step/default control
values.

> Also, long term, it would be nice to have two sets of frame rates. The
> one that the HW can handle "real-time" and the one that can be used for
> bitrate calculation. So staying away from ENUM_FRAMEINTERVALS for
> bitrate configuration would be nicer.

I'm not sure if that's feasible in practice, although the idea is nice.
The 'real-time' framerate will likely depend to a huge extent on the
frequency of various internal clocks and the content of the bitstream.

I suspect it will be very hard if not impossible to report realistic
ENUM_FRAMEINTERVAL values for codecs.

> 
>> If the range of intervals is always the same regardless of the frame size,
>> then a helper can be used that queries the min/max/step of the control, but
>> if it is dependent on the frame size, then it has to be implemented in the
>> driver itself.
>>
>> I'm sticking to frame intervals instead of frame rates for the simple reason
>> that that's what V4L2 has used since the beginning. I think it is too confusing
>> to change this to a frame rate. This is just my opinion, though.
> 
> I suggested frame rate since this is what I saw implemented by HW
> registers (if you think it's worth it, I can try and make a list).
> Also, frame-interval steps are not compatible with frame-rate steps
> (something that was raised through a venus driver bug) last year. Even
> v4l2-ctl was displaying that in a very confusing way. Something as
> simple as 1 to 30 fps cannot be exposed through ENU_FRAMEINTERVALS. You
> are forced to expose the full fractional range of interval, from 1/30
> to 1/1. For Venus it was not that much of a trouble, since its stores a
> framerate as Q16..

Since this is used for bitrate calculations, and not for determining the
exact framerate, I'm not sure it matters all that much in this particular
case. Since you still need to implement G/S_PARM in drivers for backwards
compatibility reasons I think it is easiest to keep using frame interval
instead of frame rate.

Actually, that raises a new question: are there codecs that store the frame rate
in the bitstream? I haven't heard of that, so I suspect not, but I'm not certain.

Regards,

	Hans

> 
>>
>> I also chose to make this a codec control, not a generic user control: this
>> value together with the bit rate control(s) determine the compression size,
>> it does not determine the actual time it takes for the encoder to compress
>> the raw frames. Hence it is really not the same thing as the frame interval
> 
> That's a good point.
> 
>> of a video capture device. If we want to use a control for that as well in
>> the future as a replacement for G/S_PARM, then that should be a new control.
>> And we would like need per-pad controls as well in order to implement that.
>> Which is a lot more work.
>>
>> Regards,
>>
>> 	Hans
> 
> 

