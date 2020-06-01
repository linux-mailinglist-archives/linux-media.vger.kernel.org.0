Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C242D1EA04B
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2020 10:47:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgFAIrm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jun 2020 04:47:42 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:39567 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725838AbgFAIrm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Jun 2020 04:47:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id fg6ajYZLEnv5nfg6ejn0vU; Mon, 01 Jun 2020 10:47:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1591001260; bh=l61CE/h8+sepxgqBeIwi6PTsEjFost7OfVAAP3YJxVw=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=sMXpYnGzsc5aGKazTjY30pjwn3I0OBiW1tZeMavUF9eGDFXmb4aX6LVq59ujFipnx
         NgdRwfEhWiNs82SGfFXjYUmFJkYKXTZhAYw2V87xpNSA0ZKnfA5f9gJtmBkQeacAzd
         vSwcDgKhMlhSQwJbrbBMLcqOTBChuDSuOKT7y6Goi9Tt2uPaVtnYQl+jGUFWUjAjyr
         pHIJkbHNqsB/Cb/cq3TmkhRdQis/To7MCwVMPnt06RhguaKV/YlR0g53kbenv0O8st
         Vth40ljuNTKclQ+Bhnw0V2QgJdtKOfGXx7wm0mieDNASXZtrQG3aGxHwt7QWfx7xn6
         U6xcEVXi7WcHw==
Subject: Re: IMX274 driver
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Frank Chen <frankc@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        linux-media@vger.kernel.org
References: <4184f80b-eab3-c512-dd99-d24c7af4b45c@nvidia.com>
 <afd8fdb8-e359-5aee-ba3e-54a5217b2aee@lucaceresoli.net>
 <d81c6fec-e7de-1282-9e17-1fc0f5dea9eb@xs4all.nl>
Message-ID: <cb3a6636-5d7d-c7b4-b0ad-f77444117efe@xs4all.nl>
Date:   Mon, 1 Jun 2020 10:47:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d81c6fec-e7de-1282-9e17-1fc0f5dea9eb@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfABF4K6KUyhSqgVL2/xjbxmjb6xti+wk048ASgOlR5DCcMZ9SwUKbpOZnkEKjOfpcfvMyKp2QI0UkaLZogvNR/JbqC0acYZYnej6AiDCGGTsb7o3EwDM
 xgHoyGiPLdL/rMdBxQZeWFKC8KAvVm1dU5tHq8qZq/yFKs8WHSSnn9CYB4/lcH8izuSERTFAov6SaQKmysUiYAV2RQKzC6I6TeXtgWTeB8tW7X+i+pL530lr
 eKjRD7/QYcUO73oOsEC77AByI7wm9OQBY8AMU0KakmhNb7yT43fUCIdHXDGRsKJxHZjRqmuM5f4uqN1qTN4d2w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/06/2020 10:31, Hans Verkuil wrote:
> Hi Luca,
> 
> On 31/05/2020 23:56, Luca Ceresoli wrote:
>> Hi Sowjanya,
>>
>> On 29/05/20 04:07, Sowjanya Komatineni wrote:
>>> Hi Luca,
>>>
>>> Quick question regarding IMX274 driver that was up streamed by you.
>>
>> Well, to be fair I only added cropping and made some improvements.
>>
>>> Upstream IMX274 driver programs Y_OUT_SIZE correctly based on IMX274
>>> datasheet and register mode table for Y_OUT_SIZE where it includes 6
>>> ignored area of effective pixels + 8 effective margin for color
>>> processing pixels.
>>>
>>> So, Y_OUT_SIZE register value = height + 14
>>>
>>> But somehow with this we are not seeing full frame on CSI.
>>>
>>> In our internal NVIDIA IMX274 driver, we are programming Y_OUT_SIZE to
>>> exact height  Y_OUT_SIZE = height
>>>
>>> So for debug, followed the same and updated upstream IMX274 driver to
>>> program Y_OUT_SIZE = crop.height locally and I see all resolutions
>>> working fine with this.
>>>
>>> Checking with Sony on whats causing sensor not to send full frame when
>>> Y_OUT_SIZE is set to height + 14.
>>>
>>> But thought to check with you in parallel if there are any known issues
>>
>> That's strange. Unfortunately I'm not using imx274 anymore since a long
>> time and don't remember the details, but definitely I did test it and if
>> there had been 14 missing lines I'm pretty sure I would have noticed.
>>
>> I'll see if I can remember anything useful, and in case I'll update you.
>> I would be glad if you can update me on any findings too, maybe they
>> will help in understanding the problem better.
> 
> The '+ 14' makes no sense. I wonder if this was perhaps to compensate for
> some problem in the bridge driver that this sensor was connected to.
> Which bridge driver did you use for testing? Do you remember where you got
> the '+ 14' from?

Hmm, this comes from the first version of this driver where Y_OUT_SIZE
was set to 0x87e (2160 + 14). This in turn comes from the datasheet ('Register
Setting for Each Readout Drive Mode').

Looking at the "Detailed Specification of Each Mode" (page 63 in my copy of
the datasheet) I see three additional parameters: "Front ignore area of
effective pixel", "Front effective margin for color processing" and "Rear
effective margin for color processing", these are 6, 4 and 4, which is a
total of 14.

So I guess that's where the 14 comes from.

Knowing with which bridge driver this was tested will definitely be helpful.

Regards,

	Hans
