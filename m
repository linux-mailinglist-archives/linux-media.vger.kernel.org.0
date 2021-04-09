Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F76035A23D
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 17:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbhDIPse (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 11:48:34 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:52893 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229665AbhDIPse (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 11:48:34 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id UtMllNf7043ycUtMplViqD; Fri, 09 Apr 2021 17:48:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617983299; bh=aqh+Zzn1hJxWjSU5XkbWDsKzOnI7VAizCnPDczASZnk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=c2Xk+Dy8MeJH6eTYC8AXCvgwUa3R1InH8x1U6rkbADbo7ZMPGhPGhQXMYlRLwyRMu
         xxqdnSYFb+msD4Z6j1vh7nQgJr2O6qHcnbt+AMBQnhyjD+zQBn8I/NT7Y1uo/GWivP
         fiIa5V3RIZSqlkbmvhIgsxYL8Xw5ytmEdL4E47Rgpeoer6Qm74c5fSxKFKSAdNRz5c
         0347nSEDf6MkVFXIZAdMmOOEtuGHatvCkBHS2IEptv0YoawWRRvDREbTDJxcisE3pC
         z4qxtj/f+zwqT2ghsd76/PAvWQLIFY4kz54MolVE/dfOwyklcOLADVOFqDgeBLSrPz
         bRlksDXBeK6nQ==
Subject: Re: [PATCH 1/2] media: zoran: add spaces around '<<'
To:     Mitali Borkar <mitaliborkar810@gmail.com>
Cc:     clabbe@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
References: <cover.1617912177.git.mitaliborkar810@gmail.com>
 <8e8ac690d97478f7cbb9b91d46ef7a95e4444e5f.1617912177.git.mitaliborkar810@gmail.com>
 <f196d8ff-e8bf-360e-ee7b-cd2dcafd9742@xs4all.nl> <YHBukmdxSiRc+K6I@kali>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <5b187aca-8793-bfcb-e52a-c1e03c94b5c9@xs4all.nl>
Date:   Fri, 9 Apr 2021 17:48:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHBukmdxSiRc+K6I@kali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOCYqn9OV1kkiKur35I3Q16pWydZ4LMkDJVwg6ZUS5V3RxMVXRbD2OgrjFwY+YBsXWPb1fS92d4rQJj0XUonUmZT+gJlIIcRh06iXtZfOTd2gZ21vj/3
 ogPpMuA6bUlDV3PWKrYqMh8YXAWLiY9HxjRq0zPpFO25ie4hQea4KIV+C9LTm6Ue7uGBTEe6ARqAvamwd01/L+HbeFoDeHda5J7qOI1tsHz/8s6i2VIqOr9h
 Uh2hntroHrBwMimM5lS+4zoJwbtWNxbg5nMn1TvJymB26sEdKK/DcvMqQS3Nqqj3vf6vlU40iStWQvkdXqtcKvxvh9FDBK927xW7NnAV0rbOSKPFvNfUb0Ln
 0qb9f1vcLvUi/0opfT8RJ28cZxRgXK4FhdCqWp7YffH8D2iNlN1SlOj+8vM8cWIYemAFk3dhHLpISe5magAqzFbjmS/NhoxcI0g+53v8TtqhaBM1yu8rTlWS
 pBNlFAXpomjnb5wxhiTqQwxdLRcKUok7NhUn4A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/04/2021 17:11, Mitali Borkar wrote:
> On Fri, Apr 09, 2021 at 09:23:22AM +0200, Hans Verkuil wrote:
>> Hi Mitali,
>>
>> On 08/04/2021 22:38, Mitali Borkar wrote:
>>> Added spaces around '<<' operator to improve readability and meet linux
>>> kernel coding style.
>>> Reported by checkpatch
>>>
>>> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
>>> ---
>>>  drivers/staging/media/zoran/zr36057.h | 14 +++++++-------
>>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
>>> index 71b651add35a..a2a75fd9f535 100644
>>> --- a/drivers/staging/media/zoran/zr36057.h
>>> +++ b/drivers/staging/media/zoran/zr36057.h
>>> @@ -30,13 +30,13 @@
>>>  #define ZR36057_VFESPFR_HOR_DCM          14
>>>  #define ZR36057_VFESPFR_VER_DCM          8
>>>  #define ZR36057_VFESPFR_DISP_MODE        6
>>> -#define ZR36057_VFESPFR_YUV422          (0<<3)
>>> -#define ZR36057_VFESPFR_RGB888          (1<<3)
>>> -#define ZR36057_VFESPFR_RGB565          (2<<3)
>>> -#define ZR36057_VFESPFR_RGB555          (3<<3)
>>> -#define ZR36057_VFESPFR_ERR_DIF          (1<<2)
>>> -#define ZR36057_VFESPFR_PACK24          (1<<1)
>>> -#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1<<0)
>>> +#define ZR36057_VFESPFR_YUV422          (0 << 3)
>>> +#define ZR36057_VFESPFR_RGB888          (1 << 3)
>>> +#define ZR36057_VFESPFR_RGB565          (2 << 3)
>>> +#define ZR36057_VFESPFR_RGB555          (3 << 3)
>>> +#define ZR36057_VFESPFR_ERR_DIF          (1 << 2)
>>> +#define ZR36057_VFESPFR_PACK24          (1 << 1)
>>> +#define ZR36057_VFESPFR_LITTLE_ENDIAN    (1 << 0)
>>>  
>>>  #define ZR36057_VDTR            0x00c	/* Video Display "Top" Register */
>>>  
>>>
>>
>> I looked at that header and it is very messy.
>>
>> Can you make two new patches? The first aligns every nicely, e.g. this:
>>
>> #define ZR36057_VFEHCR          0x000   /* Video Front End, Horizontal Configuration Register */
>> #define ZR36057_VFEHCR_HS_POL             BIT(30)
>> #define ZR36057_VFEHCR_H_START           10
>> #define ZR36057_VFEHCR_H_END            0
>> #define ZR36057_VFEHCR_HMASK            0x3ff
>>
>> should become:
>>
>> /* Video Front End, Horizontal Configuration Register */
>> #define ZR36057_VFEHCR			0x000
>> #define ZR36057_VFEHCR_HS_POL		BIT(30)
>> #define ZR36057_VFEHCR_H_START		10
>> #define ZR36057_VFEHCR_H_END		0
>> #define ZR36057_VFEHCR_HMASK		0x3ff
>>
>> Same for all the other register blocks. Use tabs to do the alignment
>> instead of spaces, as is currently the case.
>>
> Okay Sir, will do this.
> 
>> The second patch can replace the (0<<3) etc. to BIT(0).
>>
> Sir may I know how to write (2<<3) in BIT() form? Like I am still
> learning and not sure how to convert this. Should it be BIT(2)? But this
> is only possible for (1<<nr), PLease help me out. 

The << notation is kept for that. So this would be kept as-is:

#define ZR36057_VFESPFR_YUV422          (0 << 3)
#define ZR36057_VFESPFR_RGB888          (1 << 3)
#define ZR36057_VFESPFR_RGB565          (2 << 3)
#define ZR36057_VFESPFR_RGB555          (3 << 3)

BIT() is only used for single bits.

Regards,

	Hans

> 
> Thanks.
> 
>> That would be a nice cleanup of this rather messy header.
>>
>> Thanks!
>>
>> 	Hans

