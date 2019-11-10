Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD92BF6924
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 14:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfKJNgZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Nov 2019 08:36:25 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:42909 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726390AbfKJNgZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Nov 2019 08:36:25 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id TnO6iPWRKXYiTTnOAi4JGW; Sun, 10 Nov 2019 14:36:22 +0100
Subject: Re: [git:media_tree/master] media: mtk-vcodec: Remove extra area
 allocation in an input buffer on encoding
To:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linuxtv-commits@linuxtv.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hirokazu Honda <hiroh@chromium.org>
References: <E1iTgvs-0004qe-3k@www.linuxtv.org>
 <CAAFQd5C+X+b1BMVicwXRXWZZ=t8SCJDgFQcd3hFs2zWuzUstKg@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ef927bf9-57ad-3be0-c9af-30da4751fdb8@xs4all.nl>
Date:   Sun, 10 Nov 2019 14:36:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5C+X+b1BMVicwXRXWZZ=t8SCJDgFQcd3hFs2zWuzUstKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfI71CdaPrg7pVmTkqvf6PxxQMcLIuhp6wDfDk+Em4Kl/zobfimiOaROU6ngDAI7vgnreuCDezwzVWxbBv6ErGuGoABEv1DbO3xSzaxWJ46Cu2yJFiaqh
 8APwSQoKTiX4tn84tyjhEwG25trWXV9Ta6xPiODpFt2iolLZzgXU4HHkV9ktImHQYGhSZ4VzcOFPBDTaC6cj2yTziBMMun18d/6b46Jlvi3Vrts2BLF29+iA
 us0lDKqNMp1dFC/MwM4HFvEHNgA6j87Xw7mUPYa0bC9WLlGMXLOFett3/g4yzgoD8r8Vowj/3+WFk5VoasZ++g==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/10/19 2:13 PM, Tomasz Figa wrote:
> Hi Mauro and Hans,
> 
> On Sun, Nov 10, 2019 at 3:42 PM Mauro Carvalho Chehab
> <mchehab@kernel.org> wrote:
>>
>> This is an automatic generated email to let you know that the following patch were queued:
>>
>> Subject: media: mtk-vcodec: Remove extra area allocation in an input buffer on encoding
>> Author:  Hirokazu Honda <hiroh@chromium.org>
>> Date:    Sun Nov 10 07:25:34 2019 +0100
> 
> I asked for some more testing on different platforms in my review
> reply and we got some offline signals that it might not work on some
> platforms, due to some hardware prefetch. (Would be better if that was
> reported to the mailing list instead.) We're trying to figure out the
> exact requirements here, because half of the frame doesn't sound like
> something reasonable. Let's hold off the patch for the time being.

I'll repost my last pull request, including a revert of this patch.

The state of this patch in patchwork is changed back to New.

I'll wait for your feedback on what to do with this patch.

Regards,

	Hans

> 
> Best regards,
> Tomasz
> 
>>
>> MediaTek encoder allocates non pixel data area for an input buffer every
>> plane. As the input buffer should be read-only, the driver should not write
>> anything in the buffer. Therefore, the extra data should be unnecessary.
>>
>> Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
>> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>>
>>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 +++------
>>  1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> ---
>>
>> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
>> index fd8de027e83e..6aad53d97d74 100644
>> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
>> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
>> @@ -332,14 +332,12 @@ static int vidioc_try_fmt(struct v4l2_format *f,
>>
>>                 pix_fmt_mp->num_planes = fmt->num_planes;
>>                 pix_fmt_mp->plane_fmt[0].sizeimage =
>> -                               pix_fmt_mp->width * pix_fmt_mp->height +
>> -                               ((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
>> +                       pix_fmt_mp->width * pix_fmt_mp->height;
>>                 pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
>>
>>                 if (pix_fmt_mp->num_planes == 2) {
>>                         pix_fmt_mp->plane_fmt[1].sizeimage =
>> -                               (pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
>> -                               (ALIGN(pix_fmt_mp->width, 16) * 16);
>> +                               (pix_fmt_mp->width * pix_fmt_mp->height) / 2;
>>                         pix_fmt_mp->plane_fmt[2].sizeimage = 0;
>>                         pix_fmt_mp->plane_fmt[1].bytesperline =
>>                                                         pix_fmt_mp->width;
>> @@ -347,8 +345,7 @@ static int vidioc_try_fmt(struct v4l2_format *f,
>>                 } else if (pix_fmt_mp->num_planes == 3) {
>>                         pix_fmt_mp->plane_fmt[1].sizeimage =
>>                         pix_fmt_mp->plane_fmt[2].sizeimage =
>> -                               (pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
>> -                               ((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
>> +                               (pix_fmt_mp->width * pix_fmt_mp->height) / 4;
>>                         pix_fmt_mp->plane_fmt[1].bytesperline =
>>                                 pix_fmt_mp->plane_fmt[2].bytesperline =
>>                                 pix_fmt_mp->width / 2;

