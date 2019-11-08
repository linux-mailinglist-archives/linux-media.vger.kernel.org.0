Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5CA8F4DB6
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 15:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbfKHOGd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 09:06:33 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:60767 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726101AbfKHOGc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Nov 2019 09:06:32 -0500
Received: from [IPv6:2001:420:44c1:2577:2d08:b535:4aeb:85f0]
 ([IPv6:2001:420:44c1:2577:2d08:b535:4aeb:85f0])
        by smtp-cloud8.xs4all.net with ESMTPA
        id T4u9iG8nuXYiTT4uDi0g6M; Fri, 08 Nov 2019 15:06:30 +0100
Subject: Re: [EXT] Re: [PATCH 0/5] Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
To:     Mirela Rabulea <mirela.rabulea@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
 <87d80882-b032-f332-0808-d669600f844f@xs4all.nl>
 <1573058741.16477.18.camel@nxp.com>
 <2ad1718b-2556-ea7c-27e0-9e60445a5b71@xs4all.nl>
 <1573220200.16477.32.camel@nxp.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ffbc7501-bb56-b5f2-cd43-209f099be594@xs4all.nl>
Date:   Fri, 8 Nov 2019 15:06:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1573220200.16477.32.camel@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFtHvLism700l44mHiTDlkoGsJR8q8LtIaDRa1DTgNp3cGSGFuG+AfyW/O4wXjgBv9ZLWv4URjd4wl6Ld6p/gwsGJxnWGp20bWz/6JCpoSqH7AfIuHTa
 ko5FOBAcEuspTdRHfTEWIIBPwebHCR0plxObGh8VO3pHLAXmXsiPhAchMpiRF2I72k0CY9VUDc0r9eVZQWZP7C6X/vgzmxbfNvcJaRop+LaUfu/QvglqhImF
 3PnqaDVkI/ZRF07ckuObAqr2pdWFVQ1MLPbruqHftvev2ZE9NNo6ndK6iXGbfB4TA3O05C/uJFh9HsXYPgfjXdRwQU5lHgLRpEcJxFrQ9YzS2VQUtJCTtnNY
 KFntJPQ+ZhBYMM59lK0blIf6/EbT/GL43IapW2TdzeXlLQ7+zTE0oCVa+O2tIDawNnRgc7ueJkX8wtQwHYvMyRvOx7MWgoeRMoT9sm7CllGCd+7Q/hgmJKeE
 OnA6GdTx/MUnTKfiIIpbfYGvSpUt70w5+la0pi/srt7sa5XGyIlaPCo8IpSwNJZq5L/v4aH26o1kcoAnqNhthX8+djE+K+VBOfJpW1/rar/vs4+EnndeR15C
 gYHqQuvgMx2FaQrwHYyDzCy/e8AvLRyk9FIQsjzwolWN2jguexMmrq2D8+KGSS1faroHSlcSQQRvAY3gXdsQh0/26m2YbFE/R5Gs4nk2UWScrcZvAfbT65hy
 dVl0QDXA9bNdkOi6uOuYg0X6N9xL5oHrtZz9oH55dFGL5lVdnl1WQupFDw32A/PXRQBJ0VskbuOIUzUb/Y+53iSKrO22s7zmc/HeWiGoPmBBPjxkfIKNm3R9
 lt0TPkuqDUc93an56uMutzsa8CXyzBxdEvPFP2HcicYMfo4bsJhY3T5GIDB6vxCbPayE0S9HRMVgGQAR/vXDahkF0d1aLqLO081Iuno8BAmRx95KI8OybP8F
 vNTOaIlrmHzf731D6tf6cXPMqGIk/RdjyLfOeFAiWEbBKpCMcAtxREUDIh2v1KuEbob8VVFNrN2yKq5wzmho9rqihlA=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/8/19 2:36 PM, Mirela Rabulea wrote:
> Hi Hans,
> 
> On Mi, 2019-11-06 at 17:52 +0100, Hans Verkuil wrote:
>>       test Scaling: OK
>> The presence of a scaler is suspicious: is the encoder indeed
>> capable of scaling? I suspect this is a bug.
> 
> No, it's not capable of scaling. You suspect a bug in the driver or the
> tests?

Actually, I think that's an outstanding bug in v4l-utils. It doesn't
correctly handle the m2m case with respect to scaling. I think. I'll
look into this a bit more.

> 
>> Codec ioctls:
>>>       test VIDIOC_(TRY_)ENCODER_CMD: OK
>> The presence of this...
>>
>>>
>>>       test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>       test VIDIOC_(TRY_)DECODER_CMD: OK
>> ...and this is also strange for a JPEG codec. These ioctls are
>> typically only
>> needed for MPEG/H264/etc. codecs, and not for a simple JPEG codec.
>>
>> The same issues are found for the JPEG decoder.
> 
> I implemented the CMD_STOP for both encoder & decoder, because it was
> requested by our developer for gstreamer plugin for this codec.
> The context in which this was requested was for playing MJPEG videos (a
> concatenation of JPEG frames).

This ioctl makes no sense for JPEG codecs, and in fact jpeg drivers like
s5p-jpeg or mtk-jpeg do not implement this. This sounds like a gstreamer bug.
Nicolas, do you know anything about this?

> 
>> Streaming ioctls:
>>>       test read/write: OK (Not Supported)
>>>       test blocking wait: OK
>>>               fail: v4l2-test-buffers.cpp(254): g_field() ==
>>> V4L2_FIELD_ANY
>> The driver shall never return FIELD_ANY. This needs to be FIELD_NONE.
> 
> Is there a "good example" of a v4l m2m driver that passes these

vim2m. Also drivers/media/platform/mtk-jpeg/ (although I'm not sure when
it was last tested with v4l2-compliance, so it might be a bit out of date).

> streaming tests? That would save some time on my side.
> For the FIELD_ANY issue, I got inspired from your commit:
> ab7afaf3 media: vim2m: add buf_out_validate callback
> But there's a lot more to go...
> 
> Thanks,
> Mirela
> 

Regards,

	Hans
