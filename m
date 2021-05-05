Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52438373AF9
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 14:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbhEEMSz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 08:18:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49744 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231921AbhEEMSR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 08:18:17 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 4058E1F42DF4
Subject: Re: [PATCH] media: rkvdec: Fix .buf_prepare
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel@collabora.com, Adrian Ratiu <adrian.ratiu@collabora.com>
References: <20210504113714.30612-1-andrzej.p@collabora.com>
 <2db7709801107dbacd464a919451bbafbd335748.camel@collabora.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <58791717-b7a9-d057-a998-a4440fcbe783@collabora.com>
Date:   Wed, 5 May 2021 14:17:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2db7709801107dbacd464a919451bbafbd335748.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

W dniu 04.05.2021 o 13:56, Ezequiel Garcia pisze:
> Hi Andrzej,
> 
> Thanks a lot for picking this up.
> 
> On Tue, 2021-05-04 at 13:37 +0200, Andrzej Pietrasiewicz wrote:
>> From: Ezequiel Garcia <ezequiel@collabora.com>
>>
>> The driver should only set the payload on .buf_prepare if the
>> buffer is CAPTURE type. If an OUTPUT buffer has a zero bytesused
>> set by userspace then v4l2-core will set it to buffer length.
>>
>> Fixes: cd33c830448ba ("media: rkvdec: Add the rkvdec driver")
>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>>
>> ---
>> @Hans: I haven't had anyone complain about the issue. The fix is needed for
>> the rkvdec vp9 work, so I think 5.14 is fine.
>>
>>   drivers/staging/media/rkvdec/rkvdec.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
>> index d821661d30f3..ef2166043127 100644
>> --- a/drivers/staging/media/rkvdec/rkvdec.c
>> +++ b/drivers/staging/media/rkvdec/rkvdec.c
>> @@ -481,7 +481,15 @@ static int rkvdec_buf_prepare(struct vb2_buffer *vb)
>>                  if (vb2_plane_size(vb, i) < sizeimage)
>>                          return -EINVAL;
>>          }
>> -       vb2_set_plane_payload(vb, 0, f->fmt.pix_mp.plane_fmt[0].sizeimage);
>> +
>> +       /*
>> +        * Buffer bytesused is written by driver for CAPTURE buffers.
>> +        * (if userspace passes 0 bytesused for OUTPUT buffers, v4l2-core sets
>> +        * it to buffer length).
>> +        */
>> +       if (!V4L2_TYPE_IS_OUTPUT(vq->type))
> 
> Please use V4L2_TYPE_IS_CAPTURE here.
> 
> Also, why is this change needed in rkvdec, but not in cedrus
> or hantro?
> 

As a matter of fact I think it is needed in all three, because later on,
whenever a driver uses vb2_get_plane_payload(), without such a patch it
will get an invalid number and write that to a hardware register, causing
incorrect behavior.

I will respond with a v2 series.

Regards,

Andrzej
