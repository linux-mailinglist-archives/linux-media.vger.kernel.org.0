Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDC46316D0
	for <lists+linux-media@lfdr.de>; Sun, 20 Nov 2022 23:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbiKTWWu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Nov 2022 17:22:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbiKTWWj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Nov 2022 17:22:39 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9D418357
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668982904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qfU4F+9Q3fsGP7vrdj0qb4gcCJ2UWWxoYW1+PglgfTc=;
        b=JtI5AbUEIFd6Zr1Oryl2ezuXKmtDWw/Kihq8sNMsKGBPnXBlo+2HrBOSaLQteNxrXo5C1v
        XaZwXi6Oar6kffDT3iKEh+AnFDu0me4ItBnlaIE/c0HuX8/etxy3UQa9ksv4bYMDPIPLbb
        dTXE6rhrDEoHkSAvHV64texpFD7izqU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-459-PP3Y1bcGPzSdgS0ViTSh7A-1; Sun, 20 Nov 2022 17:21:43 -0500
X-MC-Unique: PP3Y1bcGPzSdgS0ViTSh7A-1
Received: by mail-ed1-f69.google.com with SMTP id r12-20020a05640251cc00b00463699c95aeso5536766edd.18
        for <linux-media@vger.kernel.org>; Sun, 20 Nov 2022 14:21:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qfU4F+9Q3fsGP7vrdj0qb4gcCJ2UWWxoYW1+PglgfTc=;
        b=60pvJtk2uTTb14ukTWnPaLgbdL/NwXfGjt+9JTr4jjR+P2y1OrWL7Rya3KlePPB0tV
         fxuLrnMQv2+TtzxhElJJy72vxsa/Q8k304z07VNfeRDMjR4VUg1meMhoad9gT/xtABMU
         +zFQv+fkrI1heQcsYDn9hQAKSxRV2k7VZivafmFxJkDHEJGMV6QCCOhYdnRVkyjt75/f
         FjKsqaqfvGcofxInyKGYXtF1hwcrY1tFeyNNODIvSZ+n/ahRgrwwNvBHjB3f/7/skoxt
         Em6pUgPJJFnTW5LiYue1azmfumbjhZ/Rqqt22KKFmp7fLwL0/yyUh/hGc+zrQ7pGRg1m
         6yQw==
X-Gm-Message-State: ANoB5plaU9K2maYONRFHDKgG8PmAk2IQ3FuVo6PeAHxCaBzX5dysIkLT
        BOD6v7pO7GBc4QFhDQ5NO9SvMNynKDhWkBtJpdepDXhw0Afu5Ccvey5Nwa/rTS/aYVnqCbBxd3z
        ZYldbdUEtY/9tCwtAGS8Y5gQ=
X-Received: by 2002:a05:6402:c0b:b0:463:a83c:e0af with SMTP id co11-20020a0564020c0b00b00463a83ce0afmr13362225edb.158.1668982902084;
        Sun, 20 Nov 2022 14:21:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf43mSBTM6qRxwG+2Z4UloEiSkuVwIpTVlFQQSyeTsT6zRAN21YviTkCZw1/6G/n9kpFXvding==
X-Received: by 2002:a05:6402:c0b:b0:463:a83c:e0af with SMTP id co11-20020a0564020c0b00b00463a83ce0afmr13362212edb.158.1668982901872;
        Sun, 20 Nov 2022 14:21:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id h14-20020a170906854e00b0073d9a0d0cbcsm4322408ejy.72.2022.11.20.14.21.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Nov 2022 14:21:41 -0800 (PST)
Message-ID: <33ee8ade-0cdd-5605-1c2a-5698510fa742@redhat.com>
Date:   Sun, 20 Nov 2022 23:21:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 12/17] media: atomisp: Fix VIDIOC_REQBUFS failing when
 VIDIOC_S_FMT has not been called yet
Content-Language: en-US, nl
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <20221020195533.114049-1-hdegoede@redhat.com>
 <20221020195533.114049-13-hdegoede@redhat.com>
 <Y3Ix0JXHxj+5ZYdq@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y3Ix0JXHxj+5ZYdq@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 11/14/22 13:17, Andy Shevchenko wrote:
> On Thu, Oct 20, 2022 at 09:55:28PM +0200, Hans de Goede wrote:
>> camorama calls VIDIOC_REQBUFS(V4L2_MEMORY_MMAP) to test if MMAP support
>> works (this was added specifically because of the previously broken
>> MMAP support in atomisp).
>>
>> Currently this fails because atomisp_get_css_frame_info() fails in this
>> case. Although it is weird to call VIDIOC_REQBUFS before VIDIOC_S_FMT,
>> it is allowed to do this.
>>
>> Fix this not working by doing a S_FMT to V4L2_PIX_FMT_YUV420 + the highest
>> supported resolution.
>>
>> Note this will cause camorama to use mmap mode, which means it will also
>> use libv4l2 to do format conversion. libv4l2 will pick V4L2_PIX_FMT_RGB565
>> as input format and this will lead to a garbled video display. This is
>> a libv4lconvert bug, the RGB565 -> RGB24 path in libv4lconvert assumes
>> that stride == width which is not true on the atomisp.
>>
>> I've already send out a libv4lconvert fix for this. Also this can be worked
> 
> Link: ?
> 

Fixed in my media-atomisp branch.

>> around by passing --dont-use-libv4l2 as argument to camorama.
> 
> ...
> 
>> +		struct v4l2_format f = {
>> +			.fmt.pix.pixelformat = V4L2_PIX_FMT_YUV420,
> 
>> +			.fmt.pix.width = 10000,
>> +			.fmt.pix.height = 10000,
> 
> If it's just an arbitrary maximum, I would suggest to use definitions from
> limits.h, so it will better show the intention.

This is duplicating existing code in another path in atomisp2 where it
does this when it needs to pick a fmt because it needs one and userspace
has not set one yet.

I have added an entry to my atomisp TODO list to writer a helper for
this so that we only have these magic 10000 values only once.

As for if 10000 really is necessary, or if e.g. 65535 might work
as well, that is unclear.

Regards,

Hans



> 
>> +		};
> 

