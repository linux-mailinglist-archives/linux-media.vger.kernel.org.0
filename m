Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48D1710A012
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2019 15:15:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbfKZOPK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Nov 2019 09:15:10 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:36673 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726536AbfKZOPJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Nov 2019 09:15:09 -0500
Received: from [IPv6:2001:420:44c1:2577:f03d:3627:b74f:a4d0]
 ([IPv6:2001:420:44c1:2577:f03d:3627:b74f:a4d0])
        by smtp-cloud8.xs4all.net with ESMTPA
        id ZbcLiaC6nksqeZbcPiYNpX; Tue, 26 Nov 2019 15:15:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1574777707; bh=p4SfveAWVw5/cNiUsShV+w7SGWaY3jahJd1NddhEb2w=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=EmGDfmGbLHhE/QnEbCDFSqZed1/Xjzrcctg0DDAOu0qANbVQLWDA7L8y7txJpRbkd
         BNKF1/WWfG6JAG+DhVeaB4/GY2QLCidZX4Jpeh0ARWQmT5G5NFgOUymIIJhyEVnopL
         VwvsEMaS/Nz330NpD2jFlNAKN4MW+bnPqb2tJBt82wcWz4SgbikJp5v+0EQ9wxLpb5
         pmUW4CXQfSXTX3MmSLFVUNUQNEyA/KOakwpyM9I8C/KPbu7Qo0OHWTqJwbg8bPCgNV
         vcDVqa3cqNx9DEGuGUW+MN53Q+S4JDc+10QhBjTcFgr5ZZtSenTfJ1V+0TdOtp3cAC
         7tEoeiLVGIcXA==
Subject: Re: [PATCH v4 6/8] media: v4l2-core: fix v4l2_buffer handling for
 time64 ABI
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>
References: <20191111203835.2260382-1-arnd@arndb.de>
 <20191111203835.2260382-7-arnd@arndb.de>
 <d54c82b5-21b7-2d5e-ad0b-206527ad2768@xs4all.nl>
 <CAK8P3a0rom6x4X8eH0zknfZ5=6_rrXGKGR4H+RiY4SWKbXfp=g@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2271665b-f890-802f-eba8-0da43867d81f@xs4all.nl>
Date:   Tue, 26 Nov 2019 15:15:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0rom6x4X8eH0zknfZ5=6_rrXGKGR4H+RiY4SWKbXfp=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGhFPAyWd7Q36L+6lbGa52+sN5W9Cw9CQKrvetpwEo236YNJV14Y1rebGVJKsTrMlgycmYQNFpjnR+N6cD262JELhq1i8qkc5k8PM584NwgH2zxS2FwB
 3/Gs/AoP72eVz0dcMzPHUUYlaCs7YgeHl+IrZ1Y7dDSk7p1zUTkf2o48DTDziPu/wcBRpAndNm2z0LTxI5rdDq3lxu2XP1okSGdPeiV01eA7ZEqjFemTULGL
 j8Pj8JDY6A4sfQqxKVv8yTOi85b3dlmgZBgf8w4wP3D/if21MIXWNobpzqdFgJRVEan0wg2Cl+ITFeRH+pdWH+BljoDoioKpL80uV2RpT/Fk4YQ+72QxOAxd
 mm0HncTmKSIDerQbfPRF89mgEVDxOjcnc+Jg2jWNQNS+cD1ZogGxQiVwa+7F1PdkPr/vlJOQ
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/26/19 2:50 PM, Arnd Bergmann wrote:
> On Mon, Nov 25, 2019 at 3:57 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>> On 11/11/19 9:38 PM, Arnd Bergmann wrote:
> 
>>>       switch (cmd) {
>>> +#ifdef COMPAT_32BIT_TIME
>>> +     case VIDIOC_QUERYBUF_TIME32:
>>> +     case VIDIOC_QBUF_TIME32:
>>> +     case VIDIOC_DQBUF_TIME32:
>>> +     case VIDIOC_PREPARE_BUF_TIME32: {
>>> +             struct v4l2_buffer_time32 vb32;
>>> +             struct v4l2_buffer *vb = parg;
>>> +
>>> +             if (copy_from_user(&vb32, arg, sizeof(vb32)))
>>> +                     return -EFAULT;
>>> +
>>> +             memcpy(vb, &vb32, offsetof(struct v4l2_buffer, timestamp));
>>> +             vb->timestamp.tv_sec = vb32.timestamp.tv_sec;
>>> +             vb->timestamp.tv_usec = vb32.timestamp.tv_usec;
>>> +             memcpy(&vb->timecode, &vb32.timecode,
>>> +                    sizeof(*vb) - offsetof(struct v4l2_buffer, timecode));
>>
>> I have similar concerns as with dqevent about whether this memcpy is the right approach.
>> Unless you can prove with a utility like pahole that this memcpy is safe.
> 
> This is the video_get_user() function, so the input data comes from user
> space and gets copied into the kernel, which has to check each field for
> validity already, so I think this is safe regardless of the padding (which
> exists before the 64-bit timestamp on 32-bit architectures). The fields
> match because the definition of all members other than the timeval is
> the same.
> 
> On the other hand, I agree it's not obvious from the code why this
> is correct. I've changed my copy to this version below now, do you like
> that better?
> 
>                 struct v4l2_buffer_time32 vb32;
>                 struct v4l2_buffer *vb = parg;
> 
>                 if (copy_from_user(&vb32, arg, sizeof(vb32)))
>                         return -EFAULT;
> 
>                 *vb = (struct v4l2_buffer) {
>                         .index          = vb32.index,
>                         .type           = vb32.type,
>                         .bytesused      = vb32.bytesused,
>                         .flags          = vb32.flags,
>                         .field          = vb32.field,
>                         .timestamp.tv_sec       = vb32.timestamp.tv_sec,
>                         .timestamp.tv_usec      = vb32.timestamp.tv_usec,
>                         .timecode       = vb32.timecode,
>                         .memory         = vb32.memory,
>                         .m.userptr      = vb32.usercopy,
>                         .length         = vb32.length,
>                         .request_fd     = vb32.request_fd,
>                 };
> 
>                 if (cmd == VIDIOC_QUERYBUF_TIME32)
>                         memset(&vb->length, 0, sizeof(*vb) -
>                                offsetof(struct v4l2_buffer, length));
> 
> This way, all padding is zeroed out, and it's obvious to human
> readers that each field gets set in the correct location.
> 
>>> +             memcpy(&vb32, vb, offsetof(struct v4l2_buffer, timestamp));
>>> +             vb32.timestamp.tv_sec = vb->timestamp.tv_sec;
>>> +             vb32.timestamp.tv_usec = vb->timestamp.tv_usec;
>>> +             memcpy(&vb32.timecode, &vb->timecode,
>>> +                    sizeof(*vb) - offsetof(struct v4l2_buffer, timecode));
>>
>> Ditto.
> 
> This is my new version:
> 
>                 struct v4l2_buffer *vb = parg;
>                 struct v4l2_buffer_time32 vb32 = {
>                         .index          = vb->index,
>                         .type           = vb->type,
>                         .bytesused      = vb->bytesused,
>                         .flags          = vb->flags,
>                         .field          = vb->field,
>                         .timestamp.tv_sec       = vb->timestamp.tv_sec,
>                         .timestamp.tv_usec      = vb->timestamp.tv_usec,
>                         .timecode       = vb->timecode,
>                         .memory         = vb->memory,
>                         .m.userptr      = vb->usercopy,
>                         .length         = vb->length,
>                         .request_fd     = vb->request_fd,
>                 };

That looks clean.

> 
>                 if (copy_to_user(arg, &vb32, sizeof(vb32)))
>                         return -EFAULT;
> 
>>>       __u32                   field;
>>> +#ifdef __KERNEL__
>>> +     /* match glibc timeval64 format */
>>> +     struct {
>>> +             long long       tv_sec;
>>> +# if defined(__sparc__) && defined(__arch64__)
>>> +             int             tv_usec;
>>> +             int             __pad;
>>> +# else
>>> +             long long       tv_usec;
>>> +# endif
>>> +     } timestamp;
>>
>> Ewww!
>>
>> Are there more places where this is needed? If so, then I very much prefer
>> that a __kernel_timeval struct is defined somewhere, with appropriate
>> comments.
> 
> I was trying hard to avoid adding a modern version of timeval, because
> all new code should be encouraged to use __kernel_timespec instead.
> 
> There are not many users of timeval in the uapi, and this is the last one
> after the others all got invididual treatment.
> 
> Usually what I would do is to have a kernel-internal type based
> on timespec or u64, and then define three uapi types:
> old native (based on __kernel_old_timeval), old compat (using
> old_timeval32) and the new type with 64-bit time_t.
> 
> The problem with v4l2_buffer is that it includes another
> compat-incompatible field (m.userptr) and that it's passed
> between kernel functions, so then I'd probably need five variants
> of it in total, and it would slow down the common case (64-bit
> native) because it would require an extra copy.
> 
> I can try a few more things here, but I don't expect to find anything
> much better than this.

How about something like this in videodev2.h:

Split off the ugly kernel timeval definition in a separate struct:

#ifdef __KERNEL__
	/* match glibc timeval64 format */
	struct __kernel_v4l2_timeval {
		long long	tv_sec;
# if defined(__sparc__) && defined(__arch64__)
		int		tv_usec;
		int		__pad;
# else
		long long	tv_usec;
# endif
	};
#endif

Then use that in the struct v4l2_buffer definition:

struct v4l2_buffer {
...
#ifdef __KERNEL__
 	struct __kernel_v4l2_timeval timestamp;
#else
 	struct timeval		     timestamp;
#endif

That keeps struct v4l2_buffer fairly clean. And it also makes it
possible to have a bit more extensive documentation for the
struct __kernel_v4l2_timeval without polluting the actual struct
v4l2_buffer definition.

The videodev2.h header is something users of the API look at a
lot and having this really ugly kernel timestamp in there is
not acceptably IMHO. But splitting it off should work.

> 
>>> +#ifdef __KERNEL__
>>> +struct v4l2_buffer_time32 {
>>> +     __u32                   index;
>>> +     __u32                   type;
>>> +     __u32                   bytesused;
>>> +     __u32                   flags;
>>> +     __u32                   field;
>>> +     struct old_timeval32    timestamp;
>>>       struct v4l2_timecode    timecode;
>>>       __u32                   sequence;
>>>
>>> @@ -1009,6 +1049,7 @@ struct v4l2_buffer {
>>>               __u32           reserved;
>>>       };
>>>  };
>>> +#endif
>>
>> Can this be moved to v4l2-ioctls.h?
> 
> done.
> 
>>>  #ifndef __KERNEL__
>>>  /**
>>> @@ -2446,12 +2487,15 @@ struct v4l2_create_buffers {
>>>  #define VIDIOC_S_FMT         _IOWR('V',  5, struct v4l2_format)
>>>  #define VIDIOC_REQBUFS               _IOWR('V',  8, struct v4l2_requestbuffers)
>>>  #define VIDIOC_QUERYBUF              _IOWR('V',  9, struct v4l2_buffer)
>>> +#define VIDIOC_QUERYBUF_TIME32       _IOWR('V',  9, struct v4l2_buffer_time32)
>>
>> And all these should be moved there as well.
> 
> done.
> 
>       Arnd
> 

Regards,

	Hans
