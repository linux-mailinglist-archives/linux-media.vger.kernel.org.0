Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD6F9119EA
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2019 15:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfEBNRB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 09:17:01 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:46391 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726197AbfEBNRB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 May 2019 09:17:01 -0400
Received: from [IPv6:2001:420:44c1:2579:7549:573e:9131:939b] ([IPv6:2001:420:44c1:2579:7549:573e:9131:939b])
        by smtp-cloud7.xs4all.net with ESMTPA
        id MBa2hHUMQZVjxMBa5h6NQg; Thu, 02 May 2019 15:16:58 +0200
Subject: Re: [PATCH v2] media/doc: Allow sizeimage to be set by v4l clients
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190412155915.16849-1-stanimir.varbanov@linaro.org>
 <20190502095550.31282c0d@coco.lan>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ee78effa-f678-5d15-3802-bb787e7057e2@xs4all.nl>
Date:   Thu, 2 May 2019 15:16:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190502095550.31282c0d@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPo5NU+FPwgCylj9J2C1/mc19GgAGRLUTy76mTdZkMKf5d4iI0KpLba7IlNqmxkTq+XbdITRbvwyD+2Mx+hWj4TMnTA3j8nCH1XfbOF6oWb7oaOB2pG7
 g6I5akTeIhwMrOp19vGv5vtDawPc+FNjFHeba3a2OjYTotWRIm4DaQOL4Cj7Y7gBS/7ZpQStl6TLbaT6raMdOsTWb6prgkHwy5iFBTr+WU17kENqMfOcRCpU
 vIem7bsqMZPr3LROEEhJj/2KDPLlGsoVnAxUS64B/jDhr7fi9+Xo8LRSIZIJaegAY9rwvRxIgDZe3aUX78MVoFaG07GS8Djo5ClP7HtIdP0dT+uFokw7ENOo
 Ns4LTBCuzE43LoQPT4zez5LvgH6NzWhDp9EqjIs/6iRfA5PYB3xoRVXDklRFP9CoNk6dl1wAomjrp1cozdW2/tX76u9zGg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/2/19 2:55 PM, Mauro Carvalho Chehab wrote:
> Em Fri, 12 Apr 2019 18:59:15 +0300
> Stanimir Varbanov <stanimir.varbanov@linaro.org> escreveu:
> 
>> This changes v4l2_pix_format and v4l2_plane_pix_format sizeimage
>> field description to allow v4l clients to set bigger image size
>> in case of variable length compressed data.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst | 13 ++++++++++++-
>>  Documentation/media/uapi/v4l/pixfmt-v4l2.rst        | 11 ++++++++++-
>>  2 files changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
>> index 5688c816e334..005428a8121e 100644
>> --- a/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
>> +++ b/Documentation/media/uapi/v4l/pixfmt-v4l2-mplane.rst
>> @@ -31,7 +31,18 @@ describing all planes of that format.
>>  
>>      * - __u32
>>        - ``sizeimage``
>> -      - Maximum size in bytes required for image data in this plane.
>> +      - Maximum size in bytes required for image data in this plane,
>> +	set by the driver. When the image consists of variable length
>> +	compressed data this is the number of bytes required by the
>> +	codec to support the worst-case compression scenario.
>> +
>> +	For uncompressed images the driver will set the value. For
>> +	variable length compressed data clients are allowed to set
>> +	the sizeimage field, but the driver may ignore it and set the
>> +	value itself, or it may modify the provided value based on
>> +	alignment requirements or minimum/maximum size requirements.
>> +	If the client wants to leave this to the driver, then it should
>> +	set sizeimage to 0.
>>      * - __u32
>>        - ``bytesperline``
>>        - Distance in bytes between the leftmost pixels in two adjacent
>> diff --git a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
>> index 71eebfc6d853..0f7771151db9 100644
>> --- a/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
>> +++ b/Documentation/media/uapi/v4l/pixfmt-v4l2.rst
>> @@ -89,7 +89,16 @@ Single-planar format structure
>>        - Size in bytes of the buffer to hold a complete image, set by the
>>  	driver. Usually this is ``bytesperline`` times ``height``. When
>>  	the image consists of variable length compressed data this is the
>> -	maximum number of bytes required to hold an image.
>> +	number of bytes required by the codec to support the worst-case
>> +	compression scenario.
>> +
>> +	For uncompressed images the driver will set the value. For
>> +	variable length compressed data clients are allowed to set
>> +	the sizeimage field, but the driver may ignore it and set the
>> +	value itself, or it may modify the provided value based on
>> +	alignment requirements or minimum/maximum size requirements.
>> +	If the client wants to leave this to the driver, then it should
>> +	set sizeimage to 0.
> 
> It is very confusing to understand what you meant by the above paragraph,
> as you inverted the sentence order and forgot a comma.
> 
> I would, instead, write the phrases using the direct order, and break
> into two paragraphs, e. g., changing the above to:
> 
> 	"The driver will set the value for uncompressed images.
> 
> 	Clients are allowed to set the sizeimage field for variable length
> 	compressed data, but the driver may ignore it and set the
> 	value itself, or it may modify the provided value based on
> 	alignment requirements or minimum/maximum size requirements.
> 	If the client wants to leave this to the driver, then it should
> 	set sizeimage to 0."
> 
> That makes it a lot easier to read, hopefully preventing mistakes from
> app and driver developers when reading about sizeimage.
> 
> Yet, I'm not too comfortable on letting this too generic. I mean,
> how an app writer would know what formats are "variable length
> compressed data", specially since libv4l may actually change that.

It's actually quite clearly defined: compressed formats set the
V4L2_FMT_FLAG_COMPRESSED flag in VIDIOC_ENUMFMT.

Also bytesperline will be 0 for compressed formats.

Regards,

	Hans

> 
> Thanks,
> Mauro
> 

