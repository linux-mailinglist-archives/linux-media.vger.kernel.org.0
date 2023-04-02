Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F52B6D37E8
	for <lists+linux-media@lfdr.de>; Sun,  2 Apr 2023 14:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbjDBMmw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Apr 2023 08:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjDBMmu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Apr 2023 08:42:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F16E86B8
        for <linux-media@vger.kernel.org>; Sun,  2 Apr 2023 05:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680439323;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1UFywKmJCh/dH+J1dNKAlPeVeb9RVoeM21gHDg/rCAw=;
        b=Zuhki6wA1SmqFMg2NEnbHi64FyRoCQ9IzkguFEzRfUp5z2nDD79K6G7YQAl/HQ1eaqqIoo
        XA3sh0Ziqanjlzemk3OGo6fhDg0FBDcSRqx86QOLzQlJihHsFolEymOggz47r913A0F0nO
        pOzf3dXGjeD1BDizr9cTQL8NzSkQgBg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-EWc2GRGFPF2tkTJfcjit4Q-1; Sun, 02 Apr 2023 08:42:01 -0400
X-MC-Unique: EWc2GRGFPF2tkTJfcjit4Q-1
Received: by mail-ed1-f69.google.com with SMTP id j21-20020a508a95000000b004fd82403c91so37170676edj.3
        for <linux-media@vger.kernel.org>; Sun, 02 Apr 2023 05:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680439320;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1UFywKmJCh/dH+J1dNKAlPeVeb9RVoeM21gHDg/rCAw=;
        b=C6YGU2jyhkWgwBp3o54//huOEHx1xC1chqJxsYf+8tocSfD5A96sVOpgIi+svx0msL
         qBHsxyTJpHmj1YMn8jetU8Es+RAi7SaZOSnsYpy24PZ+HDMBnH6nV3XcCqU9Ii0RiANr
         x/AkmOkLaSyNHvrHMKuyBJMdmT0AMwpWsx3iMP1xiT0Tm/F2Dff388Drr7CHjG7A5AsE
         uyW1GkyYK4/zmuNIxuEcSouECvFprBqtDGvPxuj5ec+zRIBRAihzrH3C7yC/u4tP6I9E
         WHQWMdiqsz0k54BxgAQwdRZ+X3wW25huXqa9tbcKXeFpfIK8Wm/wN/+HjDb0pWBa1FMv
         jxkQ==
X-Gm-Message-State: AAQBX9cG+kA5IyBSWB0AYgunt3TACopIOspW3v0+5OY38KEie35ioS+b
        mrvwuQkLHxifAs9fghPW/H6puRyj3HD0M0itzs0T3qTMENMMfWCtHyJClej4H2jmGhZCeRC4qOi
        v8Ij+IW8QLKGnnS5aX3JOs/s=
X-Received: by 2002:a05:6402:b37:b0:502:91c6:d776 with SMTP id bo23-20020a0564020b3700b0050291c6d776mr4142254edb.11.1680439320439;
        Sun, 02 Apr 2023 05:42:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350agRhrwAvV3oV7MopgFqLQJJYZB9wFQunVGH9UNrd7fmBfahLVGNdRcJRXA9I8tuZgoQu60gg==
X-Received: by 2002:a05:6402:b37:b0:502:91c6:d776 with SMTP id bo23-20020a0564020b3700b0050291c6d776mr4142233edb.11.1680439320167;
        Sun, 02 Apr 2023 05:42:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bq18-20020a056402215200b00501c2a9e16dsm3165264edb.74.2023.04.02.05.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 05:41:59 -0700 (PDT)
Message-ID: <058628fe-8ade-4ab6-1822-9edb4152fe6a@redhat.com>
Date:   Sun, 2 Apr 2023 14:41:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 02/10] media: atomisp: Remove continuous mode support
Content-Language: en-US, nl
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20230221145906.8113-1-hdegoede@redhat.com>
 <20230221145906.8113-3-hdegoede@redhat.com>
 <Y/TqBBdU7dbYPIsW@smile.fi.intel.com>
 <109be822-9439-cd5a-c7f7-c63516f92099@redhat.com>
 <CAHp75Vd+sgvgQRQhi9FZOL9=ura9g8+xr8ez73XcmRf7Uy11LQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vd+sgvgQRQhi9FZOL9=ura9g8+xr8ez73XcmRf7Uy11LQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy,

On 4/2/23 08:06, Andy Shevchenko wrote:
> On Sat, Apr 1, 2023 at 12:59 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Andy,
>>
>> Thank you for the reviews!
>>
>> On 2/21/23 16:57, Andy Shevchenko wrote:
>>> On Tue, Feb 21, 2023 at 03:58:58PM +0100, Hans de Goede wrote:
>>>> Continues mode is a special mode where 2 /dev/video devices can be active
>>>> at the same time. Either the video-preview + video nodes or the
>>>> viewfinder (for still capture) + capture nodes.
>>>>
>>>> For the video-preview + video-recording case modern userspace will
>>>> use a single stream multiplexed by pipewire.
>>>>
>>>> The still-capture case is extra special only starting the preview
>>>> stream and then relying on a custom ATOMISP_IOC_S_CONT_CAPTURE_CONFIG
>>>> ioctl to set things up followed by a second stream on to capture
>>>> the amount of configured still pictures. While running the sensor
>>>> at full resolution all the time. This case too is better handled
>>>> with dma-buf + GPU downscaling for the view-finder rather then all this
>>>> custom special code. Besises this the ioctl expects a bunch of special
>>>> non error checked conditions to be met otherwise things will crash/hang.
>>>>
>>>> The continues mode also involves a special cases all over the code
>>>> getting in the way of further cleanups and simplifying the code to
>>>> using just 1 /dev/video# node. So lets remove it and the
>>>> related custom ATOMISP_IOC_S_CONT_CAPTURE_CONFIG ioctl.
>>>
>>> ...
>>>
>>>> +    ret = atomisp_set_fmt_to_snr(vdev, &s_fmt,
>>>> +                                 f->fmt.pix.pixelformat, padding_w,
>>>
>>> At least one parameter can be moved to the previous line.
>>
>> Ack, fixed in my local tree which I will push to:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp
>>
>> When I'm done processing your other review remarks.
>>
>>>
>>>> +                                 padding_h, dvs_env_w, dvs_env_h);
>>>> +    if (ret) {
>>>> +            dev_warn(isp->dev,
>>>> +                     "Set format to sensor failed with %d\n", ret);
>>>> +            return -EINVAL;
>>>
>>> ...
>>>
>>>>      case ATOMISP_RUN_MODE_PREVIEW:
>>>> -            if (!asd->continuous_mode->val) {
>>>> -                    if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
>>>> -                            return true;
>>>> +            if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
>>>> +                    return true;
>>>>
>>>> -                    return false;
>>>> -            }
>>>> -            fallthrough;
>>>> +            return false;
>>>
>>>               return pipe_id == IA_CSS_PIPE_ID_PREVIEW;
>>
>> I agree that that is cleaner, but there are a bunch of other cases
>> in this switch case which are not touched by this patch and
>> they all follow the same pattern as which the modified cases
>> use after this patch, e.g. :
>>
>>         case ATOMISP_RUN_MODE_STILL_CAPTURE:
>>                 if (pipe_id == IA_CSS_PIPE_ID_CAPTURE)
>>                         return true;
>>
>>                 return false;
>>
>> So this patch basically makes all of them consistent with
>> each other. So I'm going to keep this as is.
> 
> So, I haven't checked the patch series of 28, but perhaps the above is
> a good candidate to have across the entire code, so we reduce the
> codebase.
> ...

I agree I have added a note about this to my list of possible code
cleanups (which is quite long) but there are many higher priority
issues to solve first.

Regards,

Hans


