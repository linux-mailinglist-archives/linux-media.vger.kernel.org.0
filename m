Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F77B12026A
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2019 11:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfLPK2v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Dec 2019 05:28:51 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:49241 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727099AbfLPK2v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Dec 2019 05:28:51 -0500
Received: from [IPv6:2001:983:e9a7:1:319d:6a65:b2d0:e9e9]
 ([IPv6:2001:983:e9a7:1:319d:6a65:b2d0:e9e9])
        by smtp-cloud8.xs4all.net with ESMTPA
        id gncMiGMZ7TsDegncNitaAo; Mon, 16 Dec 2019 11:28:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576492128; bh=QPnekEio2eThFzmwX19CtbP8Vk3CElMRXAog+X32YZc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nMPFxrJ/YFHqsdP4cNnu+1macDSQfWE+HLP79rXsmms6eLpCN8k0qJEkMHWIFivSJ
         CvUopW9erOyGwYFnwm/6/ELVQNP570NdFdKv6BJ0vAn1Qda4SfgZmt3GjpH0uC5tDy
         TVabtbV1AjJQclI7ctF8WfnQuTW88AI0BJHkv3Tf2tUSFJZKNPBFq95HgbQUVLNjcN
         zSUSQG53h9cz7YMPgm4pCHj1hRFeAgh9//WIG5yAz9UocaiLDvhlX+egyFlY15wpJY
         VKX9OLmtgVz6w4jacNdfu/11+NNMw1MdUxIWmwJ2SnB2PIzs9AkvdKYUfsjoqkkuW0
         5kTxNCk+aT3mg==
Subject: Re: [PATCH v5 6/8] media: v4l2-core: fix v4l2_buffer handling for
 time64 ABI
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        me@zv.io
References: <20191126161824.337724-1-arnd@arndb.de>
 <20191126161824.337724-7-arnd@arndb.de>
 <09c664fd-87fb-4fac-f104-9afbe7d33aa2@xs4all.nl>
 <CAK8P3a1TvFCJf8t9T1yOXjsp088s9dbEOKLVDPinfwJe2B-27g@mail.gmail.com>
 <81bb5da1-6b84-8473-4ada-c174f43bbae2@xs4all.nl>
 <0843718f-1391-3379-38be-41fa9558ea6d@xs4all.nl>
 <CAK8P3a1-xLUn368Lajia1=2GEXa92srQ2s9wH--MrRHj+kSTtQ@mail.gmail.com>
 <bfc18778-0777-ad49-619b-39e1b9b536f3@xs4all.nl>
 <CAK8P3a0ZwMgXqjAjh7P8B2BR4THd-rMZM0jt5KvxHtxNF_8Nqw@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <064e8099-9b5d-94cc-a69a-0a71cb814cfb@xs4all.nl>
Date:   Mon, 16 Dec 2019 11:28:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0ZwMgXqjAjh7P8B2BR4THd-rMZM0jt5KvxHtxNF_8Nqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOCDUoACuLeAN0RcNpJFyKptLoOMQoeUitQXe5r7jp33g/qsigpDCzIIhiL7ei3U0QLm9SGujcz7rAVcA16LMvdS9C5nQt5apaM65nyDMmkyycKW3BC5
 vdUYvtidyJ1y9erJfUxQqPBnToKxZ7OT6TMR1PipPlZIJZSWa0iGRtLeyKcfkf5zzOeJUKUARrRwRxmDw2HN9SXiivcbhe0H5QQainS9/luxovizi4PZkNmn
 FyGb4TZFKJ5cR/9Moenx+KThjNmQ1rcRi50dWr5hXMj+CxFbLNHsoz2G0VpSnE8qJHM3ADUOr8sS1ErdfdxhOks8yDitEOb6ZmSex5Wrgp9G+UulUZkp+5u7
 G2QF1elEEgr0p2QbwpcYbKc7eMqfL3Sho0rOnaoFGGdhfQifLhyoV5/ieGOCewTNm9zUQgja
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/16/19 10:29 AM, Arnd Bergmann wrote:
> On Sun, Dec 15, 2019 at 6:26 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Ah, great, that worked, after applying the patch below.
>>
>> Both struct v4l2_buffer32 and v4l2_event32 need to be packed, otherwise you would
>> get an additional 4 bytes since the 64 bit compiler wants to align the 8 byte tv_secs
>> to an 8 byte boundary. But that's not what the i686 compiler does.
> 
> Thanks so much for the testing and finding this issue. It would be much more
> embarrassing to find it later, given that I explained how it's supposed to work
> in the comment above v4l2_event32 and in the documentation I just submitted
> but got it wrong anyway ;-)
> 
>> If I remember correctly, packed is only needed for CONFIG_X86_64.
> 
> Correct.
> 
>> diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
>> index 3bbf47d950e0..c01492cf6160 100644
>> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
>> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
>> @@ -492,7 +492,11 @@ struct v4l2_buffer32 {
>>         __u32                   length;
>>         __u32                   reserved2;
>>         __s32                   request_fd;
>> +#ifdef CONFIG_X86_64
>> +} __attribute__ ((packed));
>> +#else
>>  };
>> +#endif
> 
> I would prefer to write it like this instead to avoid the #ifdef, the
> effect should
> be the same:
> 
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -475,8 +475,8 @@ struct v4l2_buffer32 {
>         __u32                   flags;
>         __u32                   field;  /* enum v4l2_field */
>         struct {
> -               long long       tv_sec;
> -               long long       tv_usec;
> +               compat_s64      tv_sec;
> +               compat_s64      tv_usec;
>         }                       timestamp;
>         struct v4l2_timecode    timecode;
>         __u32                   sequence;
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -1277,7 +1277,10 @@ struct v4l2_event32 {
>         } u;
>         __u32                           pending;
>         __u32                           sequence;
> -       struct __kernel_timespec        timestamp;
> +       struct {
> +               compat_s64              tv_sec;
> +               compat_s64              tv_usec;
> +       } timestamp;
>         __u32                           id;
>         __u32                           reserved[8];
>  };
> 
> If you agree, I'll push out a modified branch with that version and send out
> that series to the list again.

That's fine. I did a quick test with this and it looks fine.

> 
> There is one more complication that I just noticed: The "struct v4l2_buffer32"
> definition has always been defined in a way that works for i386 user space
> but is broken for x32 user space. The version I used accidentally fixed x32
> while breaking i386. With the change above, it's back to missing x32 support
> (so nothing changed).
> 
> There is no way to fix the uapi definition of v4l2_buffer to have x32 and i386
> use the same format, because applications may be using old headers, but
> I suppose I could add yet another version of the struct to correctly deal with
> x32, or just add a comment like
> 
> --- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> +++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
> @@ -468,6 +468,10 @@ struct v4l2_plane32 {
>         __u32                   reserved[11];
>  };
> 
> +/*
> + * This is correct for all architectures including i386, but not x32,
> + * which has different alignment requirements for timestamp
> + */
>  struct v4l2_buffer32 {
>         __u32                   index;
>         __u32                   type;   /* enum v4l2_buf_type */
> 
> 
>       Arnd
> 

Go with a comment. We've never tested with x32 to be honest. There were discussions
about a year ago of dropping x32 altogether, but that hasn't happened yet.

Regards,

	Hans
