Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD151187C3
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 11:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbfEIJbF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 05:31:05 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:48097 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725821AbfEIJbF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 May 2019 05:31:05 -0400
Received: from [IPv6:2001:983:e9a7:1:1542:3ab9:816d:970b] ([IPv6:2001:983:e9a7:1:1542:3ab9:816d:970b])
        by smtp-cloud7.xs4all.net with ESMTPA
        id OfOHh6L403qlsOfOIhQmEV; Thu, 09 May 2019 11:31:03 +0200
Subject: Re: [RFC PATCH v2] media: cec: expose HDMI connector to CEC dev
 mapping
To:     Dariusz Marcinkiewicz <darekm@google.com>
Cc:     linux-media@vger.kernel.org, hans.verkuil@cisco.com,
        linux-kernel@vger.kernel.org
References: <20190416083852.126786-1-darekm@google.com>
 <dcb189af-f67f-ede3-b4fb-de1da7b53ccb@xs4all.nl>
 <CALFZZQEoiikyXmHJyEgEJTRNryTN8ScNK4P3bDCp-9v9GtvU8g@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <b78864b4-e470-99b2-5505-890d178b72f8@xs4all.nl>
Date:   Thu, 9 May 2019 11:31:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CALFZZQEoiikyXmHJyEgEJTRNryTN8ScNK4P3bDCp-9v9GtvU8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPVW+EYWfvMTySPs+TIBikdXTfaQvEVYhqmd95mshnRSFk0NGsg6PbPu8Gat7g7pY2YAc3StSKTGHaaygGQgwf03XKhWIFkpcaO8O+wvJE6dRNlvAmy2
 vtRlb4Vn0u5Lk5JPmmXGGpg9vGToUe2xtQ0sWJekk2kNbKlZ4RiKkCK6DOVIybdRy2JP+hlYuBSrLqMHWjSjiIMQ2/3xO9LgrPElFfQHD5TSjS25MVKnZXY1
 O8CZ4yCJ8yic4KqWlO7HOFnltl4SP0jgvH/ORQUD+y5KFJMiVZV/FWsqWfm5uZFyravVq3DJFcw2Y2LnKcrcOOYo0ShFLdyRUFLe26NGucdTPN2augsvWTJZ
 ++LOej8H9Ti3u5FZ8DpZAYlNEEXRBA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 5/9/19 9:52 AM, Dariusz Marcinkiewicz wrote:
> Hi Hans.
> 
> On Wed, Apr 24, 2019 at 2:09 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi Dariusz,
>>
>> This is getting close, so I think for the next version you can drop
>> the RFC tag.
>>
>> Some comments:
>>
> ...
>>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
>>> @@ -261,7 +261,7 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
>>>       cec->adap = cec_allocate_adapter(&dw_hdmi_cec_ops, cec, "dw_hdmi",
>>>                                        CEC_CAP_LOG_ADDRS | CEC_CAP_TRANSMIT |
>>>                                        CEC_CAP_RC | CEC_CAP_PASSTHROUGH,
>>> -                                      CEC_MAX_LOG_ADDRS);
>>> +                                      CEC_MAX_LOG_ADDRS, NULL);
>>
>> Hmm, the connector information is actually available through cec->hdmi.
>>
>> I think it would make sense to create a helper function that fills in
>> struct cec_connector_info based on a struct drm_connector pointer.
>> And add a function to drivers/gpu/drm/bridge/synopsys/dw-hdmi.c that
>> dw-hdmi-cec.c can call that does the same.
> 
> Looking at the code here, is the connector info guaranteed to be
> available at the time cec_allocate_adapter is called here?
> drm_connector won't be initialized until dw_hdmi_bridge_attach is
> called, which happens after the cec platform device is created.

Good point. The creation of the cec platform device should probably
be moved to dw_hdmi_bridge_attach.

> ...
>>>       priv->adap = cec_allocate_adapter(&tda9950_cec_ops, priv, "tda9950",
>>>                                         CEC_CAP_DEFAULTS,
>>> -                                       CEC_MAX_LOG_ADDRS);
>>> +                                       CEC_MAX_LOG_ADDRS,
>>> +                                       NULL);
>>
>> Here too the drm_connector can be found via struct tda9950_glue.
>> So it is easy to provide proper connector information.
> 
> The same concern as with the comment before.

Same solution: this has to be moved.

I have hardware to test patches for both drivers. It might take 2-3 weeks
before I can test as I don't always has access to the hardware, but at
least I can verify that moving this code won't break anything.

It's best to first move the code in separate patches before applying the
"expose HDMI connector to CEC dev mapping" patch on top of them.

> ...
>>> +/**
>>> + * struct cec_event_connector - tells if and which connector is associated
>>> + * with the CEC adapter.
>>> + * @card_no: drm card number, -1 if no connector
>>
>> If there is no connector, then type is NO_CONNECTOR. So this
>> doesn't make sense. Wouldn't it be better to just use '__u32 card_no'?
>>
> Yes, removed (leftover from previous revision where there was no
> connector type field).
> This and remaining comments are (hopefully) resolved in the new
> version of the patch, I've just sent.
> 
> Will add more docs in subsequent revs.
> 
> Thank you!
> 

Regards,

	Hans
