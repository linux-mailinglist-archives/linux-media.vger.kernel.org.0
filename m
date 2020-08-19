Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F184F24A144
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 16:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgHSOIG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 10:08:06 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:59279 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726858AbgHSOIF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 10:08:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8OkzkdEsDuuXO8Ol0khT7h; Wed, 19 Aug 2020 16:08:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1597846082; bh=hy+V1NOblWLH8aYZMPbFZNBcgkQSkIN5hhnQlljKF24=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Twg4BMrxADBXFtJZpbwDlD1J8A7G2iPxKI9JBL5mMd36JD5lztdyR//Cv8EAV0ROC
         VoPmYKnWOnorAdA20G6bEc4bTcPwEQ79lRuuOt5NrGXLfplAJM6SnQDbaGIsSYk7Qn
         MtNt86yYVWEvIQpWj+MxO3+808sb/v1WEXRulaOCh3A22HuIIICgX1mIqVBFYcVR4W
         ++TN8Drb6HuumaFKgL9viNBchlF7Pt1Bj/qPFPUvLkEaumHKL98wi3rzurkVLap1ne
         CDeOTOv6+x+w4bDeVlYTZ78DnRsA/VzGFNvWAI0R/vDBZqo6shIbrUzQnwavtxSpA7
         +VvFcfE1AcsHA==
Subject: Re: [PATCH] media: rcar-vin: Update crop and compose settings for
 every s_fmt call
To:     Niklas <niklas.soderlund@ragnatech.se>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <1596187745-31596-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200801090456.GB1379367@oden.dyn.berto.se>
 <CA+V-a8sOHct_JetCsug8Z2BQpMLH2p39hj2XNw_1N5gkBQp1Gg@mail.gmail.com>
 <20200803192108.GB2297236@oden.dyn.berto.se>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6d659e56-1e1f-c9c7-2e66-4ddc4e7fad15@xs4all.nl>
Date:   Wed, 19 Aug 2020 16:08:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803192108.GB2297236@oden.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfD66bE590ro+1a2VaasmDx/4aw7E5J1jWU11L5dOfQH30XSzIS3D9iCxmkaatuqhUNKm5YWPBQ0NPpwqNg2qx1SI7so47rsszk6QFcb3dvFgEaCxtShy
 SE/P9VEBaKT/+AJD4b/vNQ8aaGq1QGnNn9iQ5faaME4WH6csqsFg05afHkkyOHELawwTXKCiWijZnPoN1XhfrEQJgnNIYsYiTUhyeQKMa4njRfrtqvy8Uixh
 RvVC0MUqStiyrr8KuQRadAH6Denkl8HVXrjJkt51RbSNDdmQOIKrRkQUdidEMopyyNgq+/0fxNAAYXXpgoW3WEAMUT2xzFyJLCHCrs40vWus3tsDQKEdaG1+
 XHosV4IcAoLOA59vnLWx26sP8Lr5YrsVafJA8QN9HCtvFRtuVSfq1pr/0Bsh0r5I2wg0so8D3q96F71iGwJaz+bFRnmDWNw9c8X85S6tgqDfzzA2ZGqs1Daz
 l9AqdLPt56JjpU2V1bJu4ZnIVjtt3wMdNSd/RN/TxjyFO062S7ICsgSg+HhIFPp8K0p8Z7Z3+MgGT6e/eUkWo8S9pIbh3lQAGWsdHN40K8lU+dC1n/k/Un4P
 g/eWmH+YNgM/JyUT/pt8sCMaDYOIg6Upj5OhhccwnxQ9lGqnVFizGi/6ib5s8Tc6cwAgpuQiyuamgpuDgxjzVkyOjv1posvd6zOxr7GVsn/euQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/08/2020 21:21, Niklas wrote:
> Hi Lad, Hans,
> 
> On 2020-08-03 19:11:32 +0100, Lad, Prabhakar wrote:
>> Hi Hans,
>>
>> On Sat, Aug 1, 2020 at 10:04 AM Niklas <niklas.soderlund@ragnatech.se> wrote:
>>>
>>> Hi Lad,
>>>
>>> Thanks for your work.
>>>
>>> On 2020-07-31 10:29:05 +0100, Lad Prabhakar wrote:
>>>> The crop and compose settings for VIN in non mc mode werent updated
>>>> in s_fmt call this resulted in captured images being clipped.
>>>>
>>>> With the below sequence on the third capture where size is set to
>>>> 640x480 resulted in clipped image of size 320x240.
>>>>
>>>> high(640x480) -> low (320x240) -> high (640x480)
>>>>
>>>> This patch makes sure the VIN crop and compose settings are updated.
>>>
>>> This is clearly an inconsistency in the VIN driver that should be fixed.
>>> But I think the none-mc mode implements the correct behavior. That is
>>> that S_FMT should not modify the crop/compose rectangles other then make
>>> sure they don't go out of bounds. This is an area we tried to clarify in
>>> the past but I'm still not sure what the correct answer to.
>>>
>> What should be the exact behaviour of the bridge driver  for s_fmt
>> call. Should the crop/compose settings be updated for every s_fmt
>> callback or should they be only updated on s_selection callback.
>> Currently the non-mc rcar-vin doesnt update the crop/compose setting
>> in s_fmt callback due to which I see the above issue as mentioned.
> 
> This is not entirely correct. It does update the crop and compose 
> rectangles on s_fmt, it makes sure they are not out-of-bounds for the 
> new format if it's accepted by s_fmt. See v4l2_rect_map_inside() calls 
> in the snippet bellow.

For non-mc mode s_fmt must update any crop/compose rectangles to ensure that
they are not out-of-bounds. But for mc mode the validation is done when you
start streaming, so I think s_fmt won't make any changes in that mode.

Double-check that with Laurent, though...

Regards,

	Hans

> 
> That being said there is a difference how this is handled in the VIN 
> driver between it's MC and non-MC modes and I would love to learn the 
> correct mode of operation and seeing VIN being updated to doing it 
> correct in both cases. Thanks Lad for dealing with this!
> 
>>
>> Cheers,
>> Prabhakar
>>
>>>>
>>>> Fixes: 104464f573d ("media: rcar-vin: Do not reset the crop and compose rectangles in s_fmt")
>>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>> ---
>>>>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>>>> index f421e25..a9b13d9 100644
>>>> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
>>>> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
>>>> @@ -319,6 +319,12 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
>>>>       fmt_rect.width = vin->format.width;
>>>>       fmt_rect.height = vin->format.height;
>>>>
>>>> +     vin->crop.top = 0;
>>>> +     vin->crop.left = 0;
>>>> +     vin->crop.width = vin->format.width;
>>>> +     vin->crop.height = vin->format.height;
>>>> +     vin->compose = vin->crop;
>>>> +
>>>>       v4l2_rect_map_inside(&vin->crop, &src_rect);
>>>>       v4l2_rect_map_inside(&vin->compose, &fmt_rect);
>>>>       vin->src_rect = src_rect;
>>>> --
>>>> 2.7.4
>>>>
>>>
>>> --
>>> Regards,
>>> Niklas Söderlund
> 

