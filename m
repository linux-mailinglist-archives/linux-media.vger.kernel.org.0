Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E851F7D08
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 20:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgFLSmH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 14:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgFLSmG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 14:42:06 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A18FC03E96F
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:42:06 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id p18so7121144eds.7
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2020 11:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DBhAGmT9FnLlQ05x9MflH99VWEj4xeQp4a4nN+ueUTE=;
        b=T684DoryaZomdPRyfHNORkFG2KLbh5mCI1hC25GsuRi14xJcBm386YUkhghQqJ909g
         xwHZZtdGblEwOnGdttaBk2VgYUdYRViod2XTdGiwXj5I3TLVyXzTe6eVSFkHWjBG6FgM
         iraIic9Tl1YYBYALZKOh7WoV/gVYEP991aI1tOqc71Sy1owlX+g49krFfEffxGHCHzNh
         KXOnf/77MVGxNuofE9oAby4v7B2kI2zwsqH9rXTUoQQ7LwV5+c23JKguVaLSB2NLKqhl
         Z9d/lQtzpIc7qiEynucLB63+IEBP+F/m/He/H/HdC8cP0otzZyeh22hZPiN6yKRKNsUF
         hzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DBhAGmT9FnLlQ05x9MflH99VWEj4xeQp4a4nN+ueUTE=;
        b=tRL2B6mfxRGb5kgl3NSpwyDLBx09QXbC4DNlj6ryPw8FUNlURUaO1tdCZWTzWdyhGC
         ma8o7U/dbQZaeIwWrYYfn5Niw35ShEswDj08HaLyW9iMoqYTvGtLbhA4E+bxhfGJstnI
         Udiy0VZp6Yrt927eQrHLG5GRGA97Oc9y20PWo4e0EwH3tzPHhO/9yOJpye2yFVd5sF2v
         hcBOsoLMC2p0HgA+FNr9IOqr0W/9AhYLZXJPs1AvFvZ0LPSo01OGS02wnhwWAB3FgwLs
         VEkgkr2XuBjuAINwXPFsxWl8XOCxhI1y/BvkfAL9zCZUTb6Z6fj0QbxL3brKGlwcFXvZ
         d6SQ==
X-Gm-Message-State: AOAM533S5rjlGM4N/8pFVVIcjNNBNIWM0hQgYBWC8/isVRSFeuEorF6r
        9oBzCnfV7BZWr3/m78S3rXfAGQ==
X-Google-Smtp-Source: ABdhPJwf8YkUE3/ARzb1m+sB3C3FMCu2h/m+g3Ks/eKob25hQq3gqVHsf/EYO/DIcOkjRLn51aD8Fg==
X-Received: by 2002:a50:8ad3:: with SMTP id k19mr7847470edk.162.1591987324966;
        Fri, 12 Jun 2020 11:42:04 -0700 (PDT)
Received: from [192.168.1.3] (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.googlemail.com with ESMTPSA id v23sm3505133edr.94.2020.06.12.11.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 11:42:04 -0700 (PDT)
Subject: Re: reqbuf(count=0), new vb2 op or something else
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <5408d9f1-6415-7089-8069-ec36cd9eed75@linaro.org>
 <CAAFQd5ADxz-GYYiocKcB+Qxk9_tNJ_aAMxoOY6N9NLC-6ya3pw@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <7694a262-d655-427b-3baf-2f86dc76b906@linaro.org>
Date:   Fri, 12 Jun 2020 21:42:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5ADxz-GYYiocKcB+Qxk9_tNJ_aAMxoOY6N9NLC-6ya3pw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On 6/12/20 9:33 PM, Tomasz Figa wrote:
> Hi Stanimir,
> 
> On Fri, Jun 12, 2020 at 5:20 PM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> I failed to found previous discussion on the subject, maybe it was on IRC.
>>
>> I stuck with fixing of issues which depends on this reqbuf(count=0).
>> Currently I'm counting the buffers in vb2::buf_init and vb2::buf_cleanup
>> but I don't want to rely on that implicit way anymore.
>>
>> If someone of you can remember let me know so that I can prepare an RFC.
>>
>> I can think of two options:
>>  - change vb2::queue_setup so it could be called with num_buffers=0
>>  - add new vb2::queue_release op
>>
>> More options?
> 
> Just to make sure we're on the same page: Are you looking for a way to
> handle some operation only when all buffers on the queue are being
> freed?

Exactly :)

Presently I'm counting capture and output buffers in vb2::buf_init and
vb2::buf_cleanup and release/reinit internal driver resources on the
last .buf_cleanup. And this is a workaround of the problem which I want
to solve properly.

> 
> Best regards,
> Tomasz
> 

-- 
regards,
Stan
