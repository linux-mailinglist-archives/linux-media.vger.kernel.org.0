Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6550F2096A
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 16:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727274AbfEPOWE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 10:22:04 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:52163 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726739AbfEPOWE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 10:22:04 -0400
Received: from [IPv6:2001:420:44c1:2579:5556:9d1d:75e4:9919] ([IPv6:2001:420:44c1:2579:5556:9d1d:75e4:9919])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RHGghHJoP3qlsRHGkhL0R5; Thu, 16 May 2019 16:22:02 +0200
Subject: Re: [RFC PATCH v2] media: cec: expose HDMI connector to CEC dev
 mapping
To:     Dariusz Marcinkiewicz <darekm@google.com>
Cc:     linux-media@vger.kernel.org, hans.verkuil@cisco.com,
        linux-kernel@vger.kernel.org
References: <20190416083852.126786-1-darekm@google.com>
 <dcb189af-f67f-ede3-b4fb-de1da7b53ccb@xs4all.nl>
 <CALFZZQEoiikyXmHJyEgEJTRNryTN8ScNK4P3bDCp-9v9GtvU8g@mail.gmail.com>
 <b78864b4-e470-99b2-5505-890d178b72f8@xs4all.nl>
 <CALFZZQF9qJbDsG1nzdjTxaG=89Pu0k=pxg3TChMQcf+hDxaeuw@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <cea89a32-c04d-1acb-5b6b-aeb8dda3fccc@xs4all.nl>
Date:   Thu, 16 May 2019 16:21:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CALFZZQF9qJbDsG1nzdjTxaG=89Pu0k=pxg3TChMQcf+hDxaeuw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHXjG3pMfIqoxZVyuS01n0gYWZSoiUy6sfsRmkQWAD2nHsMlTgXhL76KGZi5VZ1rSFMggkH76FsGTXiwEV0JigAb1X+014dz70HG9oRCMiPdCp281sER
 YKhaANwV1dQ5UBkj33iq3mf5rxJ0YoDuT1UT57LZ9SZsfDHh/9gsSTAC5nNaJUwRjGEm3EvCtMmlrBruTbi70qmz1dzypmB4Z0A741VQPSPteK3olzw2Sl8k
 bgC4NsUplQIZ1KXW4JbUQIoXIsxVuKgZdAcdBDkjTLqVBbyxjUKzJDeIXKslDuQjTI7UDs97q7bTJXy12Mvfid/OXSwzo0xBbw5xF1qSCKavz37a4mXmzzMH
 LebI99EGVbhVHknoIoy3yTGJg0BGkcOfEGQx+6mxg49EJcxuDe0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/16/19 4:10 PM, Dariusz Marcinkiewicz wrote:
> Hi Hans.
> 
> From: Hans Verkuil <hverkuil@xs4all.nl>
> Date: Thu, May 9, 2019 at 11:31 AM
> To: Dariusz Marcinkiewicz
> Cc: <linux-media@vger.kernel.org>, <hans.verkuil@cisco.com>,
> <linux-kernel@vger.kernel.org>
> 
>> On 5/9/19 9:52 AM, Dariusz Marcinkiewicz wrote:
>>> Hi Hans.
>>>
>>> On Wed, Apr 24, 2019 at 2:09 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>>>
>>>> Hi Dariusz,
>>>>
>>>> This is getting close, so I think for the next version you can drop
>>>> the RFC tag.
>>>>
>>>> Some comments:
>>>>
>>> ...
>>>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
>>>>> @@ -261,7 +261,7 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
>>>>>       cec->adap = cec_allocate_adapter(&dw_hdmi_cec_ops, cec, "dw_hdmi",
>>>>>                                        CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
>>>>>                                        CEC_CAP_RC | CEC_CAP_PASSTHROUGH,
>>>>> -                                      CEC_MAX_LOG_ADDRS);
>>>>> +                                      CEC_MAX_LOG_ADDRS, NULL);
>>>>
>>>> Hmm, the connector information is actually available through cec->hdmi.
>>>>
>>>> I think it would make sense to create a helper function that fills in
>>>> struct cec_connector_info based on a struct drm_connector pointer.
>>>> And add a function to drivers/gpu/drm/bridge/synopsys/dw-hdmi.c that
>>>> dw-hdmi-cec.c can call that does the same.
>>>
>>> Looking at the code here, is the connector info guaranteed to be
>>> available at the time cec_allocate_adapter is called here?
>>> drm_connector won't be initialized until dw_hdmi_bridge_attach is
>>> called, which happens after the cec platform device is created.
>>
>> Good point. The creation of the cec platform device should probably
>> be moved to dw_hdmi_bridge_attach.
>>
>>> ...
>>>>>       priv->adap = cec_allocate_adapter(&tda9950_cec_ops, priv, "tda9950",
>>>>>                                         CEC_CAP_DEFAULTS,
>>>>> -                                       CEC_MAX_LOG_ADDRS);
>>>>> +                                       CEC_MAX_LOG_ADDRS,
>>>>> +                                       NULL);
>>>>
>>>> Here too the drm_connector can be found via struct tda9950_glue.
>>>> So it is easy to provide proper connector information.
>>>
>>> The same concern as with the comment before.
>>
>> Same solution: this has to be moved.
>>
>> I have hardware to test patches for both drivers. It might take 2-3 weeks
>> before I can test as I don't always has access to the hardware, but at
>> least I can verify that moving this code won't break anything.
>>
>> It's best to first move the code in separate patches before applying the
>> "expose HDMI connector to CEC dev mapping" patch on top of them.
>>
> 
> I've submitted another revision of the changes, with those 2 patches
> added on top. Hope that is ok.
> 
> Please take a look. It would be great if you could give those 2
> patches a go on an actual hardware.

I should be able to test the dw-hdmi patch next week, but testing the tda9950 patch
has to wait until the week after that.

Regards,

	Hans

> 
> Thank you and best regards.
> 

