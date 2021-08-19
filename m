Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A136D3F2080
	for <lists+linux-media@lfdr.de>; Thu, 19 Aug 2021 21:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbhHSTXN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Aug 2021 15:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233662AbhHSTXK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Aug 2021 15:23:10 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A69C061575;
        Thu, 19 Aug 2021 12:22:33 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id x7so13197757ljn.10;
        Thu, 19 Aug 2021 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qc9LqY40K8VPn4cy7lXDOl3TOv1El5e3Y/gxS7m5eME=;
        b=hC3osBVkhAHFY6ijA6tj/ZVEXj4mm8C8qiJBBDxHLLcT8QIpLtIjIOV0ap391G013K
         Pjvm6isGfE0IwRoha96eBGZuTwmRw4EOxaLITdwGu2CUqodUm/0fMoZX69Su6rXdoPSW
         KnDAT230jzPPA8v82CDwpuoPIo5oBWYWJzZkYFS/HL0nhlyxsH4zHNuNtoW7kXTbaXpx
         vmDG0d2QEfSeroRj3esvk6VhJ3en5OZG7TJpillXmaTV1uzg1fxdILl41+2vBhKeGvTN
         sI9RbhAEyZcsvBl3VGjBYKDs4Xn17+HgZ2dGbyF21vXJQjPXVuh1/A31kB/W87moKGGV
         /6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qc9LqY40K8VPn4cy7lXDOl3TOv1El5e3Y/gxS7m5eME=;
        b=shelP46CBLKOIUmRGcmI02l5silUdTdyCE5TdsBY+wr00mNNigaV/DZyqWcjqbEHrV
         FLDxBQWhNRJAbFYTJT9BhZxxRX8SJsVR58O6O+iGU7NTw1/lILZf7t3gL/vrUuRffFbA
         +Mi9iBD+0IANtRVFpXtZjV8Yccnk9tfsUpLEegxW3XnS2c7Kak/5vyepQdzNq9+z/S6q
         2bvY/JfXBsD1kO5vR6iu/9kYyL1f/A96MZarNxwS/C0JNsH7b7rCakkUC4zQxXJ4IKi3
         sEygAzw6AhQFPGxaaYSWp1Y0UjNjirdR0JAKY4AVxwogS1cP0fLahJYCPgnVpjbpfiXr
         7oZA==
X-Gm-Message-State: AOAM530qtV1CnneIU+B2tqNcN3iQL3i4RTlF/OUdEOtADMpvzvK3VoSF
        0DCWklel9NZ2syd2lNcP5pW58cvYBaOOEQ==
X-Google-Smtp-Source: ABdhPJwGLyngUILRxgRSJY+hMei4hEmtobUYEQW7BIvBHy1De95gmZgtLzSC6rTVlej1TL9zNmWJCQ==
X-Received: by 2002:a05:651c:11c7:: with SMTP id z7mr8404563ljo.464.1629400951459;
        Thu, 19 Aug 2021 12:22:31 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id y16sm435130lfl.50.2021.08.19.12.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 12:22:31 -0700 (PDT)
Subject: Re: [PATCH] media: atomisp: restore missing 'return' statement
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Kees Cook <keescook@chromium.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20210802143820.1150099-1-arnd@kernel.org>
 <202108130937.7848F6B318@keescook>
 <CAHp75VdkAO+fiiCVs=dyc2C83mZuLCQCvqs9C+6PF6JnhKDxCA@mail.gmail.com>
From:   Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <49b53061-f04a-3ed8-e957-5d40a0413a63@gmail.com>
Date:   Thu, 19 Aug 2021 22:22:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdkAO+fiiCVs=dyc2C83mZuLCQCvqs9C+6PF6JnhKDxCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/19/21 8:24 PM, Andy Shevchenko wrote:
> On Fri, Aug 13, 2021 at 7:39 PM Kees Cook <keescook@chromium.org> wrote:
>>
>> On Mon, Aug 02, 2021 at 04:38:14PM +0200, Arnd Bergmann wrote:
>> > From: Arnd Bergmann <arnd@arndb.de>
>> >
>> > The input_system_configure_channel_sensor() function lost its final
>> > return code in a previous patch:
>> >
>> > drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function 'input_system_configure_channel_sensor':
>> > drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
>> >
>> > Restore what was there originally.
>> >
>> > Fixes: 728a5c64ae5f ("media: atomisp: remove dublicate code")
>> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>
>> I hit this too. Thanks!
>>
>> Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> Me too,
> Tested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> Pavel, how have you tested it?
> 

To he honest, I didn't test it at all. It was part of application 
processes to LFX mentoship. I really don't like style changes. Anyway, I 
have to do it to pass the task, so, yeah, I messed up with this one ;(

Also, I didn't notice when patch was applied, because I was like 2 month 
after v3 posted. I am so sorry for this situation. Nowadays I always 
test my patches.

I was young and foolish :)


With regards,
Pavel Skripkin
