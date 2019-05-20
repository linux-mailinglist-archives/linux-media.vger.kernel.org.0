Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 461AE23ACF
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 16:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387926AbfETOrt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 10:47:49 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38739 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732990AbfETOrt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 10:47:49 -0400
Received: by mail-lj1-f193.google.com with SMTP id 14so12741454ljj.5
        for <linux-media@vger.kernel.org>; Mon, 20 May 2019 07:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lduM1D/30FHnKa/TxamjAn4bdPB0y468JNuwks7lSTQ=;
        b=ZC0heqctg4mOdx1j9EMHSRagFdJdZJ6b9kHkjDQxtco1Csn3xTmsBYjOmu9YOcA7Q2
         717eB1oJLOdvSZ3Vbzl9SlvBWMkMynGOxlLvsfSYGXyPmFsJnr+qT48ftsNhXTTVtnjj
         +E7nwypgTJ0Hh66RUR0VT6tZoIi8XHPj7TBnsX7ru9FfzjfvfmX74muund4krn1SFnsS
         x9CopEVxxXevkrxfb98W12dtpSPuwb7bCFnwSbsj2//qAXEIRBDRzJShhbNPI/mlnBCR
         iqrNazpmDZG2NwOrYWo1iDsBcX55HVhBpE/aYqWVIw2JJm1CdU+RxAZ8aajGL3IbsBFG
         9g5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lduM1D/30FHnKa/TxamjAn4bdPB0y468JNuwks7lSTQ=;
        b=uCcHj7WSKAkl/sovGH2zppQlCDHE5x4Xx801epSwolHPAd3mh2XGhd0G6mA5wMcFZt
         el1rqGNpv4MrkJB5l8UWQZHg4EHG7g+WVqGammHW9qs4cILPiWF72Bt6ejCJBcP6OE9U
         fC5auRXOTW3ShCatOHhfV4pYfM6+nxa9lTlFY1Z7yah7RczBNc23F/7A7YOUKzTEhcHu
         VYYIpRFwniMiKJRSNUw4mc2adSPkpQx1+maom6Dlan8m3PrzFvlTHqC7PyLbM2NjAu1Y
         j/ElBGOoTmtksEv9Ymo4m5jt41ZUcjjjcv4ZD+UqbwD/SkmcCfh0GkXWSPSJAYa/3wrR
         XNfQ==
X-Gm-Message-State: APjAAAVqQPyboGOSfTH49mN1ndz57P0l/6OiIz32ZVmlJ9mPBkLGUaCU
        aDwwHigvfJal4iYBbMvm/Eetdw==
X-Google-Smtp-Source: APXvYqy49HmF/zVtrpBI/4FFwPmxErLVpwCnhMGaASUN4pBhhjDI0xWaYrQSipQDNjEyeHj1TIVEgg==
X-Received: by 2002:a2e:6c0b:: with SMTP id h11mr2381223ljc.15.1558363667338;
        Mon, 20 May 2019 07:47:47 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id z3sm3805757ljg.78.2019.05.20.07.47.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 07:47:46 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH 10/10] venus: dec: make decoder compliant with stateful
 codec API
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Malathi Gottam <mgottam@codeaurora.org>
References: <20190117162008.25217-1-stanimir.varbanov@linaro.org>
 <20190117162008.25217-11-stanimir.varbanov@linaro.org>
 <60b3efff-31c1-bc04-8af9-deebb8bc013a@xs4all.nl>
 <fe51ae1e-6d2e-36bd-485a-d85520ad2386@linaro.org>
 <CAAFQd5Co3G1J4+HOcjtCb7p3rhLcm+1E=mPr2d=AtdOSuF_eKg@mail.gmail.com>
Message-ID: <c56930e0-be6f-2ade-fcea-8ee0ff6247ec@linaro.org>
Date:   Mon, 20 May 2019 17:47:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAAFQd5Co3G1J4+HOcjtCb7p3rhLcm+1E=mPr2d=AtdOSuF_eKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On 4/24/19 3:39 PM, Tomasz Figa wrote:
> On Wed, Apr 24, 2019 at 9:15 PM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Hi Hans,
>>
>> On 2/15/19 3:44 PM, Hans Verkuil wrote:
>>> Hi Stanimir,
>>>
>>> I never paid much attention to this patch series since others were busy
>>> discussing it and I had a lot of other things on my plate, but then I heard
>>> that this patch made G_FMT blocking.
>>
>> OK, another option could be to block REQBUF(CAPTURE) until event from hw
>> is received that the stream is parsed and the resolution is correctly
>> set by application. Just to note that I'd think to this like a temporal
>> solution until gstreamer implements v4l events.
>>
>> Is that looks good to you?
> 
> Hmm, I thought we concluded that gstreamer sets the width and height
> in OUTPUT queue before querying the CAPTURE queue and so making the
> driver calculate the CAPTURE format based on what's set on OUTPUT
> would work fine. Did I miss something?

Nobody is miss something.

First some background about how Venus implements stateful codec API.

The Venus firmware can generate two events "sufficient" and
"insufficient" buffer requirements (this includes decoder output buffer
size and internal/scratch buffer sizes). Presently I always set minimum
possible decoder resolution no matter what the user said, and by that
way I'm sure that "insufficient" event will always be triggered by the
firmware (the other reason to take this path is because this is the
least-common-divider for all supported Venus hw/fw versions thus common
code in the driver). The reconfiguration (during codec Initialization
sequence) is made from STREAMON(CAPTURE) context. Now, to make that
re-configuration happen I need to wait for "insufficient" event from
firmware in order to know the real coded resolution.

In the case of gstreamer where v4l2_events support is missing I have to
block (wait for firmware event) REQBUF(CAPTURE) (vb2::queue_setup) or
STREAMON(CAPTURE) (vb2::start_streaming).

I tried to set the coded resolution to the firmware as-is it set by
gstreamer but then I cannot receive the "sufficient" event for VP8 and
VP9 codecs. So I return back to the solution with minimum resolution above.

I'm open for suggestions.

-- 
regards,
Stan
