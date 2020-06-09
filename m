Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3483E1F372F
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 11:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728522AbgFIJoG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 05:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727086AbgFIJoF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jun 2020 05:44:05 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C1EC05BD1E
        for <linux-media@vger.kernel.org>; Tue,  9 Jun 2020 02:44:03 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id l12so17815997ejn.10
        for <linux-media@vger.kernel.org>; Tue, 09 Jun 2020 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NtMu8Sq+8vqeaUzFwJVPK4lutnw1pquPjUx0YLyOXtE=;
        b=bPmrQW6v0Eh16jZDuZeC7RHkIiwWtSX4R9eipRQoM9jujMohUemU1voYclGtjFnK8F
         3R5ZOH5Bx/zxDAPjZJ/Guus7UtewPS+FTFtmPxAE1wjfJb5Wj9EsKiEthuI+2fCpD/RW
         /aG38Q2z6p4zROqfuomtF9H6FXOrtKOe9xSCl2O6Ep9E/ahPCbwsVdpaUUc8PgDysR/A
         5G4BEWo6hQk3TaD6fJmWBkUf6Qfmq/qWL+HVSx69WgT2wK4d1sowHrNm2Pk3nmnHoht0
         9W9YR1mvdl57E8rFNHiy8U4LS/fvxny1liH1p8fFGaoE9bATsyt+GHL8c7xylKthompl
         klyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NtMu8Sq+8vqeaUzFwJVPK4lutnw1pquPjUx0YLyOXtE=;
        b=SJQKeZcsQBbKbRAuI+1uUqxoxhy/QmwfDD3aQauU0yayRfUlJHI7s6CyvidmXouDC/
         lVrns7X0PHVWzVUy875U8EVR8bMbWPMPwP20N/QGWKgemKaUbhqgseNzEdrXnVucBA1x
         J//8XptP89aOPIIm58LW3xcPYcIFmjiiFdGcb7EQ7hm/yrAE6nR98zwQXevJqDWVrEV1
         VgGozsCX1O+orTwL/Omi0dp0HjA+3g1l0kNIRnD9mF3KzqyD8Zntcz0binJ27kF3MFtw
         gf7evS0HgYlIMOGjEXvyjg9AgP6b41D5O8G6k7FL2vZ66TfNXbJyyjGw/IiU7FGtd6Ni
         RmrQ==
X-Gm-Message-State: AOAM532paMe2IL82PadYPUXJIsOy7DFDoS8pVUlsREImTDH8LQPdL/Al
        SbZVw64vomied5RYpvGXRrMCLA==
X-Google-Smtp-Source: ABdhPJx77c8iKjPtVrVSqJ+u6bQFlRcBVH9TB6LrP1auTKcc1296f5DnMY8edf0RFYzKniXozaMYgw==
X-Received: by 2002:a17:907:685:: with SMTP id wn5mr26079404ejb.283.1591695842561;
        Tue, 09 Jun 2020 02:44:02 -0700 (PDT)
Received: from [192.168.1.9] (hst-221-13.medicom.bg. [84.238.221.13])
        by smtp.googlemail.com with ESMTPSA id u3sm1745883edx.25.2020.06.09.02.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 02:44:01 -0700 (PDT)
Subject: Re: [RFC] docs: dev-decoder: Add two more reasons for dynamic change
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20200430113809.14872-1-stanimir.varbanov@linaro.org>
 <3052f24c-18ee-1c7d-111b-ffe15ca71fcb@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <dab8ac0c-3d9b-dc31-5880-8eacce948a0b@linaro.org>
Date:   Tue, 9 Jun 2020 12:44:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3052f24c-18ee-1c7d-111b-ffe15ca71fcb@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 5/26/20 1:26 PM, Hans Verkuil wrote:
> On 30/04/2020 13:38, Stanimir Varbanov wrote:
>> Here we add two more reasons for dynamic-resolution-change state
>> (I think the name is misleading espesially "resolution" word, maybe
> 
> espesially -> especially
> 
>> dynamic-bitstream-change is better to describe).
>>
>> The first one which could change in the middle of the stream is the
>> bit-depth. For worst example the stream is 8bit at the begging but
>> later in the bitstream it changes to 10bit. That change should be
>> propagated to the client so that it can take appropriate  action. In
>> this case most probably it has to stop the streaming on the capture
>> queue and re-negotiate the pixel format and start the streaming
>> again.
>>
>> The second new reason is colorspace change. I'm not sure what action
>> client should take but at least it should be notified for such change.
>> One possible action is to notify the display entity that the colorspace
>> and its parameters (y'cbcr encoding and so on) has been changed.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  Documentation/userspace-api/media/v4l/dev-decoder.rst | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>> index 606b54947e10..bf10eda6125c 100644
>> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
>> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>> @@ -906,7 +906,11 @@ reflected by corresponding queries):
>>  
>>  * visible resolution (selection rectangles),
>>  
>> -* the minimum number of buffers needed for decoding.
>> +* the minimum number of buffers needed for decoding,
>> +
>> +* bit-depth of the bitstream has been changed,
>> +
>> +* colorspace (and its properties) has been changed.
> 
> For this I want to have a new source change flag:
> 
> V4L2_EVENT_SRC_CH_COLORIMETRY
> 
> Changing colorimetry without changing resolution/bit depth does not
> require buffers to be re-allocated, it just changes how the pixel
> data is interpreted w.r.t. color. And that is important to know.

I'm going to create a patch for this event, but I started to wonder do
we need new buffer flag for this?

Something like below sequence:

 - client receive SRC_CH_COLORIMETRY event
 - client issue G_FMT(CAPTURE queue)
 - at that point the client has to know the last buffer with previous
colorimetry and thus the buffer with new colorimetry

How the client will know the buffer with new colorimetry?

-- 
regards,
Stan
