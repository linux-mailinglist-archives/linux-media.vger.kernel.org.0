Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14932FE707
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 11:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbhAUKCd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 05:02:33 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:59581 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728324AbhAUJyi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 04:54:38 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 2WeqlaRy1yutM2WetlgfcZ; Thu, 21 Jan 2021 10:53:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611222823; bh=K6rNhnDxeeTsqdMiv2tJcjLeXv41h7g7u11/X7msR1Q=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=m+HrI34bcefDetmshtOZ7HnBR/SxQuknbxf1t9r4SARXYw1WvW/3LJOLFgGKzrtrc
         tB5uvLfftgvx0RVRoZAS9/YHz9bj6WEXAYRSs5KENH5H3oUN4anwx/+JDsji745SCP
         muC8llBxTZu5icslJhZ7L02ZoRY5Bp0DLLSIso30hmrl/OXKxmvRH1R5l5xcxzPUYe
         0u6tHKtQvxwJ1DuKNDQOmhKnayUWwqf7vj3xvw6XxbxMwu4PtdBkgn5wggrXSzbYoA
         HCi3hE53Lokx6nHlnbrx4ASUw70zRs676PsF/ukWdzTcA3++l5LCfMgoDDOuzEb3Uj
         CQi+uAc88nr2Q==
Subject: Re: [PATCH 5/9] media: jpu: Do not zero reserved fields
To:     kieran.bingham+renesas@ideasonboard.com,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
References: <20210111145445.28854-1-ribalda@chromium.org>
 <20210111145445.28854-6-ribalda@chromium.org>
 <faacd5b3-949e-54bd-0ab8-bd43100809b0@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <63e16013-43f7-0ad5-76d1-a4d10c666382@xs4all.nl>
Date:   Thu, 21 Jan 2021 10:53:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <faacd5b3-949e-54bd-0ab8-bd43100809b0@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDqQLMGHHOnIl9p2EtW0A1upeLBdfxINItgfAzO2ijb0TA7j6RetrHEaZNrfAad4vXa6LhfwtwsTi8CnItZCE3RYfO74jjMN4sek9Vl8p/dPJHoV2UV8
 a0/VCui6az3loozealCLCJP4CNuhxkhCgoX/xin9uSinrrMx3g7iBgaQM8AGM5K/Z3PEelwhmW4ZgvT/o/DXvxXjn6HqEhKvV/lOCB5AhqWxZ8KIHYstL8C3
 DkakfVflGFqsHupWV6MnWlntnugVlAXUF4RM4RZE7lUjCcImklF2UBPV/pinCalKwA9rEruDjn+u8P8A3QUF0OsOvnzndNggH24Klbw7HahXus49wu9FvYth
 FdahRTOm0+8KQmYqZKQinOLXjzC4kw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/01/2021 12:07, Kieran Bingham wrote:
> Hi Ricardo,
> 
> On 11/01/2021 14:54, Ricardo Ribalda wrote:
>> Core code already clears reserved fields of struct
>> v4l2_pix_format_mplane, check: 4e1e0eb0e074 ("media: v4l2-ioctl: Zero
>> v4l2_plane_pix_format reserved fields").
>>
>> Cc: Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/platform/rcar_jpu.c | 5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/rcar_jpu.c b/drivers/media/platform/rcar_jpu.c
>> index 9b99ff368698..2bddc957cb87 100644
>> --- a/drivers/media/platform/rcar_jpu.c
>> +++ b/drivers/media/platform/rcar_jpu.c
> 
> There's a memset(cap->reserved...) in jpu_querycap()
> 
> Is that also applicable and covered by the core?

Yes: VIDIOC_QUERYCAP is a read-only ioctl: the core will always zero
the struct in that case before handing it over to the driver.

This is something for a separate patch, though. There may well be
more drivers that do this for querycap.

Regards,

	Hans

> 
> Looking at v4l_querycap() it doesn't seem to be so:
> 
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
>> @@ -793,7 +793,6 @@ static int __jpu_try_fmt(struct jpu_ctx *ctx, struct jpu_fmt **fmtinfo,
>>  	pix->colorspace = fmt->colorspace;
>>  	pix->field = V4L2_FIELD_NONE;
>>  	pix->num_planes = fmt->num_planes;
>> -	memset(pix->reserved, 0, sizeof(pix->reserved));
>>  
>>  	jpu_bound_align_image(&pix->width, JPU_WIDTH_MIN, JPU_WIDTH_MAX,
>>  			      fmt->h_align, &pix->height, JPU_HEIGHT_MIN,
>> @@ -808,8 +807,6 @@ static int __jpu_try_fmt(struct jpu_ctx *ctx, struct jpu_fmt **fmtinfo,
>>  			pix->plane_fmt[0].sizeimage = JPU_JPEG_HDR_SIZE +
>>  				(JPU_JPEG_MAX_BYTES_PER_PIXEL * w * h);
>>  		pix->plane_fmt[0].bytesperline = 0;
>> -		memset(pix->plane_fmt[0].reserved, 0,
>> -		       sizeof(pix->plane_fmt[0].reserved));
>>  	} else {
>>  		unsigned int i, bpl = 0;
>>  
>> @@ -822,8 +819,6 @@ static int __jpu_try_fmt(struct jpu_ctx *ctx, struct jpu_fmt **fmtinfo,
>>  		for (i = 0; i < pix->num_planes; ++i) {
>>  			pix->plane_fmt[i].bytesperline = bpl;
>>  			pix->plane_fmt[i].sizeimage = bpl * h * fmt->bpp[i] / 8;
>> -			memset(pix->plane_fmt[i].reserved, 0,
>> -			       sizeof(pix->plane_fmt[i].reserved));
>>  		}
>>  	}
>>  
>>
> 

