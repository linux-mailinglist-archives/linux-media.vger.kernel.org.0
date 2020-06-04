Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B09E1EE6FD
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 16:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729107AbgFDOxk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 10:53:40 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:47719 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729038AbgFDOxk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 10:53:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id grFOj3GNnnv5ngrFRjuWzD; Thu, 04 Jun 2020 16:53:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591282417; bh=yVSGnpqoJwme8J/0peEGJEEoH90BIXeMzQcijm1I49A=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=lK2Z1FVWtFFwCrJiDmi9cOhMaDYue7t4glMt8e5qtLmSevQ+GPWJKJJNavhMYHsTe
         iMDpSmH4tigIcdV1xPXYhCLHFiBzB20ohb8y+ZaeoUReJCbnEAsW/Gdj8JKtopLx8I
         yA1thX21SGhFZmg49G2iu64VJa3OP/dPBgfrUmzHfUDSL7R3rxbHSYxQPPhkdgZsmf
         dTvH+1wbMLk25MF8FqtYQtRYZr8tl9nspfloSdORDZQ9boso9j7fPHOS0ccuqZFhWU
         oct9UX8jV048V7U+xb9cIoDKfPrd0hM/SBjBBtMCvSsfLVezuBkWBg6grRK9t41QLH
         ixiCRbx+MtgeA==
Subject: Re: [RFC] docs: dev-decoder: Add two more reasons for dynamic change
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20200430113809.14872-1-stanimir.varbanov@linaro.org>
 <3052f24c-18ee-1c7d-111b-ffe15ca71fcb@xs4all.nl>
 <b93f155d-0af7-4952-079f-16cc895b35ba@linaro.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f9722d4c-e8c4-e1e5-42b7-6e8dc88c4b08@xs4all.nl>
Date:   Thu, 4 Jun 2020 16:53:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b93f155d-0af7-4952-079f-16cc895b35ba@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP+l9YGSGvRk/sitUZZJgs5u30hqa8FUIj0/auMvCDGO0Gggb0IbPTyxDwMUVTdCgC57H+LV9Ous+kKI2F5bnSs1J38UL/RG5XLF2SFiuOdD3WEB3Pe6
 mWv4fUCL7Wz6hws/o5eDVBXQ+BFcgcYCZIH7qg6jai4THcjzgA/0DNaR2FsiUYbD+FwIuwSVeZ8idnSTqhbRkvT4SB37quVgiJQimYEU58crUVFN4U/u1Jvd
 /XrbXFM7g2TtcV7Ie48Flt3NURZkRgATT/r8orhpJOFWd5sRNIkIzFzm2KQGd0aDR5cgI3mSrXMqEuL76TIrdQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 04/06/2020 16:46, Stanimir Varbanov wrote:
> Hi Hans,
> 
> On 5/26/20 1:26 PM, Hans Verkuil wrote:
>> On 30/04/2020 13:38, Stanimir Varbanov wrote:
>>> Here we add two more reasons for dynamic-resolution-change state
>>> (I think the name is misleading espesially "resolution" word, maybe
>>
>> espesially -> especially
>>
>>> dynamic-bitstream-change is better to describe).
>>>
>>> The first one which could change in the middle of the stream is the
>>> bit-depth. For worst example the stream is 8bit at the begging but
>>> later in the bitstream it changes to 10bit. That change should be
>>> propagated to the client so that it can take appropriate  action. In
>>> this case most probably it has to stop the streaming on the capture
>>> queue and re-negotiate the pixel format and start the streaming
>>> again.
>>>
>>> The second new reason is colorspace change. I'm not sure what action
>>> client should take but at least it should be notified for such change.
>>> One possible action is to notify the display entity that the colorspace
>>> and its parameters (y'cbcr encoding and so on) has been changed.
>>>
>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>> ---
>>>  Documentation/userspace-api/media/v4l/dev-decoder.rst | 6 +++++-
>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>> index 606b54947e10..bf10eda6125c 100644
>>> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>>> @@ -906,7 +906,11 @@ reflected by corresponding queries):
>>>  
>>>  * visible resolution (selection rectangles),
>>>  
>>> -* the minimum number of buffers needed for decoding.
>>> +* the minimum number of buffers needed for decoding,
>>> +
>>> +* bit-depth of the bitstream has been changed,
>>> +
>>> +* colorspace (and its properties) has been changed.
>>
>> For this I want to have a new source change flag:
> 
> OK, I can drop colorimetry and prepare a patch for src_change. Is the
> bit-depth one fine?

Yes.

	Hans

> 
>>
>> V4L2_EVENT_SRC_CH_COLORIMETRY
>>
>> Changing colorimetry without changing resolution/bit depth does not
>> require buffers to be re-allocated, it just changes how the pixel
>> data is interpreted w.r.t. color. And that is important to know.
>>
>> Regards,
>>
>> 	Hans
>>
>>>  
>>>  Whenever that happens, the decoder must proceed as follows:
>>>  
>>>
>>
> 

