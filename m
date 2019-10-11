Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5DAAD3B9D
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 10:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbfJKIug (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 04:50:36 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:39047 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726397AbfJKIug (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 04:50:36 -0400
Received: from [IPv6:2001:983:e9a7:1:611e:26b3:263e:a49f] ([IPv6:2001:983:e9a7:1:611e:26b3:263e:a49f])
        by smtp-cloud7.xs4all.net with ESMTPA
        id Iqd5ixRMQjZ8vIqd6iR58R; Fri, 11 Oct 2019 10:50:34 +0200
Subject: Re: [PATCHv3 6/8] media: cedrus: Detect first slice of a frame
To:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>
Cc:     linux-media@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        mripard@kernel.org, tfiga@chromium.org, jonas@kwiboo.se,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <20191010131152.68984-1-hverkuil-cisco@xs4all.nl>
 <20191010131152.68984-7-hverkuil-cisco@xs4all.nl>
 <2841216.fgL18TTB4F@jernej-laptop>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <403fd495-e458-418c-5d00-f229afa92f25@xs4all.nl>
Date:   Fri, 11 Oct 2019 10:50:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2841216.fgL18TTB4F@jernej-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPif5U+CR7I2R92KOLyOann/QcoZ1iWpPnUxELHG1wCpxD5FPgSbgA4E7uQIoYh4i6aqST4pAQnr7oAeUJDZ/IG9XTJaDCCRQoEsjd21Ui5EC8Aegt3O
 j1WRbICTHmu51e2NnAqIiuhLcYTN0+nnuHw/iaU/T0AMBQfcMIbuWJbuHt1LTLuWyTyG42jYNn87JaGiJA2q4LlfX1xj5vFcz5p2aFv1n+7P3v/diojNi9Et
 jC4bCoVFp0uVncWj28Ez4Vo51ait4CPoIjioXc9QcOHjCTfbg61hEt/ouKJM9tS908WEwIYncJO1BDfT8CK0lqbNhoB8VaPQPcR2I1A+ryx/DpAPoJgWCiIF
 c3aDaEG9ZcFlG48HWwRW0Btslrm6ZF5pCMO6UOfKkfkqo7C7+FKN8ahfLvbyZh7/+glYdQRL0h+G5cR6iaD1C6vHV7wya1YKbTICrg4OQ2RFN2Qn67ZGmF+J
 /HQ6yIkUetouzobs
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/11/19 10:49 AM, Jernej Škrabec wrote:
> Dne četrtek, 10. oktober 2019 ob 15:11:50 CEST je Hans Verkuil napisal(a):
>> From: Jernej Skrabec <jernej.skrabec@siol.net>
>>
>> When codec supports multiple slices in one frame, VPU has to know when
>> first slice of each frame is being processed, presumably to correctly
>> clear/set data in auxiliary buffers.
>>
>> Add first_slice field to cedrus_run structure and set it according to
>> the new_frame boolean of the context.
>>
>> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>> [hverkuil-cisco@xs4all.nl: rewritten to use the new_frame bool]
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/staging/media/sunxi/cedrus/cedrus.h     | 1 +
>>  drivers/staging/media/sunxi/cedrus/cedrus_dec.c | 1 +
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h
>> b/drivers/staging/media/sunxi/cedrus/cedrus.h index
>> 2f017a651848..32cb38e541c6 100644
>> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
>> @@ -70,6 +70,7 @@ struct cedrus_mpeg2_run {
>>  struct cedrus_run {
>>  	struct vb2_v4l2_buffer	*src;
>>  	struct vb2_v4l2_buffer	*dst;
>> +	bool first_slice;
>>
>>  	union {
>>  		struct cedrus_h264_run	h264;
>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
>> b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c index
>> 56ca4c9ad01c..7d3dd31e8190 100644
>> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
>> @@ -31,6 +31,7 @@ void cedrus_device_run(void *priv)
>>
>>  	run.src = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>>  	run.dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>> +	run.first_slice = ctx->fh.m2m_ctx->new_frame;
> 
> I'm not sure if this patch makes sense anymore now that the flag is part of the 
> core. I think we can drop this patch and access new_frame directly in next 
> patch. Any thoughts?

I agree, I just was lazy :-)

If this series works, then I'll post a v4 fixing this.

Regards,

	Hans

> 
> Best regards,
> Jernej
> 
>>
>>  	/* Apply request(s) controls if needed. */
>>  	src_req = run.src->vb2_buf.req_obj.req;
> 
> 
> 
> 

