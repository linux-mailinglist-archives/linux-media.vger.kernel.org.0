Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 594446C36DC
	for <lists+linux-media@lfdr.de>; Tue, 21 Mar 2023 17:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjCUQY6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Mar 2023 12:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjCUQY5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Mar 2023 12:24:57 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3906229155
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 09:24:56 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l15-20020a05600c4f0f00b003ed58a9a15eso9825528wmq.5
        for <linux-media@vger.kernel.org>; Tue, 21 Mar 2023 09:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679415894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=opkX3jaafWpKhxMPtlc1zx+TOoj1Mup4qtr1hbDpll8=;
        b=QELmMSAPla+tlUYxWKPYtIuaT3BtgRrmMD8IYam7bjgCk6t+nK/1WOJ0vMxG+LIrTo
         XUaz5zqwEW8zwoWu96RmW/wddwCZi/MS8ftMwmzOKjBJPUcJWQEde9xy56+HwLmO908k
         dwNv0h5ObxUGLaKGcOBzCrszBDCIJDEFlZ+BMJJMphcFm5J1LttNaeIh7Sn4TBiS086h
         VIro8csaxjIQhtsKd8xe18xqok1YQBcHf4f0lsZ0Ien3SQcrukND6QtMNMKtXingk16L
         VV6odcYrH3bqv1Ms4bNyCb4FhQq6ybk3HmD0s+i3PtHtvSshSwZ0Yls9oqh/n8GIQ21T
         pdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679415894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opkX3jaafWpKhxMPtlc1zx+TOoj1Mup4qtr1hbDpll8=;
        b=Z0Kmyo6svfIvbMb42BWBAnYZdueh3TL8NWyaSWWR2NyeADUlfDxS0LhmUDdTCqqb2Y
         oyMTdP93ToMHHhDy5b3Eqrycj6TTI0rXXZhIhhFIBm8Og/h4QHFEp0FaBAX+RIn8LaR8
         rfn/IkM28y+lOV7/rWOy7o4Uv3163JJx6hQeyfCiWM7XnDvmzzTYBZtcTGX0mTU3b/aT
         VFtNM3La/EdQvIhtWvDa55Oohk9tJro8vshFMfi+UPCddZeNupmW6x7wt2dPQ2ZKUeao
         07ahms9/F9PaLKWwcdOG56WW8iz4CUclXK4NqHx+E4QKv71clz7FsiKc1IMaP+9SsfWb
         48Ag==
X-Gm-Message-State: AO0yUKW2xEzzt5KeAXQoHCmRqPEnH2nEoqQLB6C1AJXLCXHMHJjr0lHz
        Adrn8u/VTYasgNJTfzwKgnjQWBscmts=
X-Google-Smtp-Source: AK7set8c5DniFTT6VeChuFO3gPzPPVidoRitcn5LCsdCjyYgEz0pd6ZzzfqCISSuOb3ixPaXcMDNfw==
X-Received: by 2002:a1c:cc13:0:b0:3ee:da1:1346 with SMTP id h19-20020a1ccc13000000b003ee0da11346mr3021992wmb.36.1679415894432;
        Tue, 21 Mar 2023 09:24:54 -0700 (PDT)
Received: from [10.228.210.75] ([80.156.160.146])
        by smtp.gmail.com with ESMTPSA id s12-20020adfeb0c000000b002c57384dfe0sm11685628wrn.113.2023.03.21.09.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 09:24:54 -0700 (PDT)
Message-ID: <f5124161-2048-1813-f23b-fc88f11bc3b4@googlemail.com>
Date:   Tue, 21 Mar 2023 17:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: v4l-utils: dvb_frontend.h is copied to lib/include for some
 reason
Content-Language: en-US
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        hselasky@FreeBSD.org
References: <72058b54-6d85-cd91-b557-f9f8b54ab3a7@xs4all.nl>
From:   Gregor Jasny <gjasny@googlemail.com>
In-Reply-To: <72058b54-6d85-cd91-b557-f9f8b54ab3a7@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On 20.03.23 10:35, Hans Verkuil wrote:
> When I tried to sync v4l-utils to the latest kernel I noticed that the
> dvb-frontend.h header was copied by lib/libdvbv5/gen_dvb_structs.pl
> from lib/include/libdvbv5/dvb-frontend.h to lib/include/dvb-frontend.h.
> 
> But no code uses it, and it does not seem to be installed anywhere either.
> 
> This was added in this commit:
> 
> commit cc4651d52dfea736cc7d6e32c939793da707ea1a
> Author: Gregor Jasny <gjasny@googlemail.com>
> Date:   Sun May 20 19:46:35 2012 +0200
> 
>      libdvbv5: Correct output paths of gen_dvb_structs and write missing header
> 
> Can I remove the copy line in gen_dvb_structs.pl? Or is it used for something
> that I am not aware of?

I don't remember exactly why I did that change. But back in the days 
Debian still build for kFreeBSD (FreeBSD kernel with GNU userland). It 
could be that the change was somehow related to that.

Feel free to clean it up.

Thanks,
Gregor
