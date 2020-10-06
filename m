Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEE3284EF6
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 17:28:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgJFP2p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Oct 2020 11:28:45 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:39865 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726131AbgJFP2o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Oct 2020 11:28:44 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PotIkKzz2v4gEPotLk6BsV; Tue, 06 Oct 2020 17:28:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601998122; bh=5KynLgjMuJo6iZF4Wg0a5dPED93Ifidwe+18af1ViSE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=UgCAwuqZ61QBCYV4oYv9rPuIWfmvZlJ2+o+C4yvRwZypQO9qHVY6aUn7hfxk7h2M7
         F7tTQW5C5R+9Sn+FtwSP/856lkJPCRhVO6QoZTZYDaLhN66YYeL3y8E/TAQoQqRLll
         GB/QhIOd5uKAUVHu9wLLd6YKdMehpxfvrRqCRcUYrqOL3RpSeaJ9O5VXgxHzdDE3Co
         YjssGXctyGK4w0Ygwbwzk5y4tf2YqjDj8O+TK7f0wrzSdtq+ZQT1K8fvFDNHOx18ua
         EpjTR31owc2uLwemyx1/cbcwg2fo6BDmbyZM3CEW2cPkKBjao2LmfslQfu9WPfncJL
         wZ8h1hOoZCdeg==
Subject: Re: [PATCH 0/8] media: v4l2: simplify compat ioctl handling
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200917152823.1241599-1-arnd@arndb.de>
 <cbbed130-3329-85a5-f360-3537391c1569@xs4all.nl>
 <CAK8P3a3KCxSJyfoBe40_=Qjsmc_e-yJFVE9jzaTGBz7t76GBHQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <04808d02-e919-b804-14bf-79e529cf997a@xs4all.nl>
Date:   Tue, 6 Oct 2020 17:28:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3KCxSJyfoBe40_=Qjsmc_e-yJFVE9jzaTGBz7t76GBHQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFDUwICEgFxk3rFFDAguDoYph+8pkE1FHoao8BBZszhHYX8JU+tvgcR9bXDL10Fji1xnT1T6O8U/dwBwelWWfKXnhaEm4QtFGSYP+y2zjm/ZWzY9dD9+
 nCFJN1paM+nxS6QnbzyowcLWld51dbLNjz4r8mxsJUfm5yy2qG40Di5dIsbM2uXziEtWKLPKLdySgnMhfjsvAlzkWVPP1MVcuQZzKH80NbLsClJyxJ8G7sVH
 nVn8X3HJ2Gv0yLVh3ut2LmjkMzITUZmuCJodRkD6qNS/MpBF7Ib/0BiK30T+NsVV
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

On 06/10/2020 17:14, Arnd Bergmann wrote:
> On Fri, Oct 2, 2020 at 4:32 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>> On 17/09/2020 17:28, Arnd Bergmann wrote:
> 
>> While testing I found a lot of bugs. Below is a patch that sits on top
>> of your series and fixes all the bugs:
>>
>> - put_v4l2_standard32: typo: p64->index -> p64->id
>> - get_v4l2_plane32: typo: p64 -> plane32
>>                     typo: duplicate bytesused: the 2nd should be 'length'
>> - put_v4l2_plane32: typo: duplicate bytesused: the 2nd should be 'length'
>> - get_v4l2_buffer32/get_v4l2_buffer32_time32: missing compat_ptr for vb32.m.userptr
>> - get_v4l2_buffer32/get_v4l2_buffer32_time32: drop querybuf bool
>> - put_v4l2_buffer32/put_v4l2_buffer32_time32: add uintptr_t cast for vb->m.userptr
>> - get_v4l2_ext_controls32: typo: error_idx -> request_fd
>> - put_v4l2_ext_controls32: typo: error_idx -> request_fd
>> - v4l2_compat_translate_cmd: missing case VIDIOC_CREATE_BUFS32
>> - v4l2_compat_translate_cmd: #ifdef CONFIG_COMPAT_32BIT_TIME for
>>   case VIDIOC_DQEVENT32_TIME32 and return VIDIOC_DQEVENT
>> - v4l2_compat_put_user: #ifdef CONFIG_COMPAT_32BIT_TIME for case VIDIOC_DQEVENT32_TIME32
>> - v4l2_compat_get_array_args: typo: p64 -> b64
>> - v4l2_compat_put_array_args: typo: p64 -> b64
>> - video_get_user: make sure INFO_FL_CLEAR_MASK is honored, also when in_compat_syscall()
>> - video_usercopy: err = v4l2_compat_put_array_args overwrote the original ioctl err value.
>>   Handle this correctly.
>>
>> I've tested this as well with the y2038 compat mode (i686 with 64-bit time_t)
>> and that too works fine.
> 
> I'm not too surprised that there were bugs, but I am a little shocked
> at how much
> I got wrong in the end. Thanks a lot for testing my series and fixing all of the
> above!

Without the compliance and regression tests it would be impossible to get this
right, it is *so* hard to verify just by looking at the code. That's always been
an issue with this compat code.

Luckily, with the test-media script in v4l-utils it is fairly easy to get
almost complete coverage. Ping me on irc if you are interested in testing this
series yourself, it's not too difficult to do. All the issues mentioned above
were all found by this test. Sometimes it failed in fairly obscure ways and
it took quite some time to figure out the underlying cause. The 'typo: p64 -> b64'
in particular wasn't easy to find: I must have read over that typo a dozen times :-)

> 
> I've carefully studied your changes and folded them into my series now.
> Most of the changes were obvious in hindsight, just two things to comment on:
> 
>>  #ifdef CONFIG_COMPAT_32BIT_TIME
>>  static int get_v4l2_buffer32_time32(struct v4l2_buffer *vb,
>> -                                   struct v4l2_buffer32_time32 __user *arg,
>> -                                   bool querybuf)
>> +                                   struct v4l2_buffer32_time32 __user *arg)
>>  {
>>         struct v4l2_buffer32_time32 vb32;
>>
>> @@ -489,8 +484,6 @@ static int get_v4l2_buffer32_time32(struct v4l2_buffer *vb,
>>         if (V4L2_TYPE_IS_MULTIPLANAR(vb->type))
>>                 vb->m.planes = (void __force *)
>>                                 compat_ptr(vb32.m.planes);
>> -       if (querybuf)
>> -               vb->request_fd = 0;
>>
>>         return 0;
> 
> It took me too long to understand what you changed here, as this depends
> on your rewrite of video_get_user(). 

Sorry, I should have mentioned that.

> The new version definitely looks
> cleaner. After folding in the video_get_user() changes, I've amended
> that changelog of the "media: v4l2: prepare compat-ioctl rework" commit
> with:
> 
> |    [...]
> |    provide a location for reading and writing user space data from inside
> |    of the generic video_usercopy() helper.
> |
> |    Hans Verkuil rewrote the video_get_user() function here to simplify
> |    the zeroing of the extra input fields and fixed a couple of bugs in
> |    the original implementation.
> |
> |    Co-developed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> |    Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> |    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> I could split that out into a separate patch if you prefer.

No, don't split it. I prefer to have an as-clean-as-possible series to ease reviewing.

> 
>> @@ -1025,8 +1020,10 @@ int v4l2_compat_put_user(void __user *arg, void *parg, unsigned int cmd)
>>  #ifdef CONFIG_X86_64
>>         case VIDIOC_DQEVENT32:
>>                 return put_v4l2_event32(parg, arg);
>> +#ifdef CONFIG_COMPAT_32BIT_TIME
>>         case VIDIOC_DQEVENT32_TIME32:
>>                 return put_v4l2_event32_time32(parg, arg);
>> +#endif
>>  #endif
>>         }
>>         return 0;
> 
> I think this change requires adding another #ifdef around the
> put_v4l2_event32_time32() definition, to avoid an "unused function"
> warning. The #ifdef was already missing in the original version, but I
> agree it makes sense to add it.

You're probably right. I should remember to do a test compilation next
time with CONFIG_COMPAT_32BIT_TIME set to n.

> 
> As you suggested earlier, I will resend the fixed series after -rc1
> is out.

Looking forward to that.

Regards,

	Hans
