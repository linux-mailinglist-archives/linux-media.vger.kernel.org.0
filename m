Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C09E3545180
	for <lists+linux-media@lfdr.de>; Thu,  9 Jun 2022 18:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240461AbiFIQEQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 12:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231679AbiFIQEP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 12:04:15 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709FD33EA9
        for <linux-media@vger.kernel.org>; Thu,  9 Jun 2022 09:04:13 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id g17-20020a9d6491000000b0060c0f0101ffso5394948otl.7
        for <linux-media@vger.kernel.org>; Thu, 09 Jun 2022 09:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=88RlV/23vqZrHG4tjTD7dufeXojsnc4QFj/Hfn9/pOk=;
        b=IrmdEmgEc1thQwEOzqx1STCdlPFml4mJvb/WZP4FBNIn+uKvSnngI4F1AaThtW5ZG9
         RzkPCdCdFox5wNJqcv5qyy1AcnvQ9kh5yY2X0WjBYsjKL6etq6fMrKZIsbfyWu/I0uyn
         dZLlWOKdWwVnAGajRvIanP3BJvf3JS55xKdOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=88RlV/23vqZrHG4tjTD7dufeXojsnc4QFj/Hfn9/pOk=;
        b=3jp1xNU8nhq/PAm+TCxmFLNiTJqdv72FXAZ/i3vKn7vRGmHh3/3T1uA5u85Frz/Kik
         +s/MmjSqY+zeQIuVBhGqefJnQ/rUnCgNJyw8LVgsv2zRlN4QTq8Imd0fRR6X/T1WH/LV
         TFyIqhxtvDiSOgm/qt27/HqWhxtgyYxSwLpWOhaBAnEpO0d2utOGRz7OFhljx7A3OUEL
         UohvvUmGpdhebwXPA9sjsMUOnaxR0zDc328uQZLzOdTkcesiUr2Gl48WSG3gpawRAzO4
         yVNttfxnaqfDcgObcDd/nIPsowAZbz6ydO0T13CfgGS5Ap+Dj/8jb/KD4A8ChQm+uf/e
         h44Q==
X-Gm-Message-State: AOAM533JGpnLlU4jhd+W6Z6FLBQNTV8bNGaiphtow1x5mzWvhV4V+nUj
        7T+LZCQc6pSbvqKhD1bH513F8A==
X-Google-Smtp-Source: ABdhPJxuF2vfr0VjMD5bvScFSCurljsnHEx0YjkOjdFOpskA/iweXYj96QFOQdi7JJfOUis3iK9dWw==
X-Received: by 2002:a05:6830:1e53:b0:60b:e998:f337 with SMTP id e19-20020a0568301e5300b0060be998f337mr12401840otj.108.1654790652696;
        Thu, 09 Jun 2022 09:04:12 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id k6-20020a9d1986000000b0060603221268sm12256686otk.56.2022.06.09.09.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 09:04:11 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] media: vimc: add ancillary lens
To:     Yunke Cao <yunkec@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20220415023855.2568366-1-yunkec@google.com>
 <20220415023855.2568366-2-yunkec@google.com>
 <165037056336.2548121.16870543641391713634@Monstersaurus>
 <CANqU6Fc63UJ8rwr5v0Yz7OVgDZynFC5pn-RGLcw94B2MzW5j1w@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <26aac3e9-7a83-0d47-20d0-40f848d3908e@linuxfoundation.org>
Date:   Thu, 9 Jun 2022 10:04:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CANqU6Fc63UJ8rwr5v0Yz7OVgDZynFC5pn-RGLcw94B2MzW5j1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/8/22 6:57 PM, Yunke Cao wrote:
> Hi Kieran,
> 
> Thanks for the review!
> I wonder what's the status of this. Will this patch get merged?
> 
> Best,
> Yunke
> 
> On Tue, Apr 19, 2022 at 9:16 PM Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
>>
>> Hi Yunke,
>>
>> This is a very interesting development!
>>
>> Quoting Yunke Cao (2022-04-15 03:38:54)
>>> Add a basic version of vimc lens.
>>> Link lens with sensors using ancillary links.
>>>
>>> Signed-off-by: Yunke Cao <yunkec@google.com>
>>> ---
>>>   drivers/media/test-drivers/vimc/Makefile      |   2 +-
>>>   drivers/media/test-drivers/vimc/vimc-common.h |   1 +
>>>   drivers/media/test-drivers/vimc/vimc-core.c   |  86 +++++++++++----
>>>   drivers/media/test-drivers/vimc/vimc-lens.c   | 102 ++++++++++++++++++
>>>   4 files changed, 170 insertions(+), 21 deletions(-)
>>>   create mode 100644 drivers/media/test-drivers/vimc/vimc-lens.c
>>>

Hmm. Couldn't find this patch in my Inbox and spam folder. Explains the
delay on my side.

Please resend so I can do a proper review.

thanks,
-- Shuah

