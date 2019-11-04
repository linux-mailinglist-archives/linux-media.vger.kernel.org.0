Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D790EDF2A
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 12:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728559AbfKDLwn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 06:52:43 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:34911 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727782AbfKDLwn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Nov 2019 06:52:43 -0500
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id RauUi817QTzKrRauXiltg7; Mon, 04 Nov 2019 12:52:41 +0100
Subject: Re: [PATCH 4/4] v4l2-ctl: Support setting V4L2_CTRL_TYPE_AREA
 controls
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20191101112509.29723-1-ribalda@kernel.org>
 <20191101112509.29723-4-ribalda@kernel.org>
 <31815641-550c-88ab-c037-2e743cea59b3@xs4all.nl>
 <CAPybu_3DQbmuamHmTXWnF15B1tzPzf1Sh_YJe6VS-Uk8z81q1Q@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <82bd9ce8-bf1e-7071-914e-f321a8467476@xs4all.nl>
Date:   Mon, 4 Nov 2019 12:52:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAPybu_3DQbmuamHmTXWnF15B1tzPzf1Sh_YJe6VS-Uk8z81q1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGrkqGV2Xg+2z6dntFkrabUjC190MQDxXDgUm2QiUL25QOkDz+O+drfg7ijgBwJ/kqmPHcMNcrPTa+qrQNppMdOFVKDygZ5vLzEejArpVXgj9tcM4Q01
 pGnuMHaceaLStm7LfKKjmjVD7Ug6y2y1kSpNgoUFTN3BeYynavXX2b+WL+Qlb46Cs048riFWIBkfshlhnUJHgiPG2LnffOTAgeLfNchb+yP4ne0FE5dR91ac
 O+TfZthAKVIOzMbjG80/LQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/4/19 12:21 PM, Ricardo Ribalda Delgado wrote:
> Hi Hans
> 
> Sure I will fix this. Shall I resend it once you have updated the
> headers on v4l-utils?

Don't wait for that, just resend. I can merge this as soon as the new
headers are in.

Regards,

	Hans

> 
> Best regards
> 
> On Mon, Nov 4, 2019 at 10:41 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 11/1/19 12:25 PM, Ricardo Ribalda Delgado wrote:
>>> $ v4l2-ctl  -d /dev/video1  -c area=123123x233
>>>
>>> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
>>> ---
>>>  utils/v4l2-ctl/v4l2-ctl-common.cpp | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>> index 95339561..676b05e0 100644
>>> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>> @@ -973,6 +973,10 @@ void common_set(cv4l_fd &_fd)
>>>                                       strncpy(ctrl.string, iter->second.c_str(), qc.maximum);
>>>                                       ctrl.string[qc.maximum] = 0;
>>>                                       break;
>>> +                             case V4L2_CTRL_TYPE_AREA:
>>> +                                     sscanf(iter->second.c_str(), "%dx%d",
>>
>> Use %ux%u since these are unsigned values.
>>
>> Regards,
>>
>>         Hans
>>
>>> +                                            &ctrl.p_area->width, &ctrl.p_area->height);
>>> +                                     break;
>>>                               default:
>>>                                       fprintf(stderr, "%s: unsupported payload type\n",
>>>                                                       qc.name);
>>>
>>

