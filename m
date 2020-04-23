Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 831791B5777
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 10:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgDWIsc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 04:48:32 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:40675 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725854AbgDWIsc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 04:48:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id RXX0jL2pz7xncRXX3jPoPq; Thu, 23 Apr 2020 10:48:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587631709; bh=qjN5+OrQRILlTY9HdLu+mTnhbsh6dVrh0lF9Msi9Bwk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pf2igBXRss35h0QqS09A9pX2AhqB5w6ChWGV9rSyFBYx81cPN26SlxrDANX4hA6fq
         vMjoSys0FApuZVAZoaAgnTSOJoT0+tuDIslbp6/QnczEwloA56ye1PjydvOQhV2fWT
         vGnE/Z5Uulm3bJ9Z8nPQOK2TNUy6o2Dpd0AZxKSFqBfqyIYGNp6ideskoQbjexo+ab
         0tR6CFu5ZPdkelKEMkhfSerexNeIWMhJrFONvn1MkA5Z6/218RZSKp7jjXr8sGmEnP
         TcevtwvctIcUbwpgJAcCuJMZE52cWtQVW89bWzYYG5Ebixf3yYWHLhcFpX2U0z87w8
         8zvqp0XPvsMGg==
Subject: Re: [PATCH 01/12] utils: fix compilation with C++98
To:     Rosen Penev <rosenp@gmail.com>
Cc:     linux-media@vger.kernel.org
References: <5cf49918-bff9-d97b-701b-7ece6e1ae0a5@xs4all.nl>
 <400FD765-D58F-401D-90EF-9AFED41B53D5@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <2ecc5ce5-e6a4-8d6a-ae03-2e169ef68653@xs4all.nl>
Date:   Thu, 23 Apr 2020 10:48:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <400FD765-D58F-401D-90EF-9AFED41B53D5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDUOcXJIbL7/agwj3ranLD1NwOXf9FBBr1vXgKXyjFfpjZnupggP8Hb7ibXM8MbmxnEZ9Vm2H6qHWgTWOQ2tla952GHJoieRF7hGdJ9zE/PWo1FbQFhi
 FjX2Akwdb8aAhfAX1683gixEyciRI55Ezxr4AazUkVsmCrNKTiJtjQ/R1+csVmkBZ1cWo9x5YCBGISVbA7kz8L8rLQ3vzm1WRv4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/04/2020 10:30, Rosen Penev wrote:
> 
> 
>> On Apr 23, 2020, at 1:19 AM, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> ﻿On 22/04/2020 02:37, Rosen Penev wrote:
>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>> ---
>>> utils/cec-compliance/cec-test.cpp | 4 ++--
>>> utils/rds-ctl/rds-ctl.cpp         | 2 +-
>>> 2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
>>> index 032ff5ad..cc07998a 100644
>>> --- a/utils/cec-compliance/cec-test.cpp
>>> +++ b/utils/cec-compliance/cec-test.cpp
>>> @@ -908,7 +908,7 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
>>>        cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
>>>        fail_on_test(!transmit_timeout(node, &msg));
>>>        fail_on_test(timed_out_or_abort(&msg));
>>> -        info = {};
>>> +        memset(&info, 0, sizeof(info));
>>>        cec_ops_tuner_device_status(&msg, &info);
>>>        if (!memcmp(&info, &info_vec[0], sizeof(info)))
>>>            break;
>>> @@ -935,7 +935,7 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
>>>        cec_msg_give_tuner_device_status(&msg, true, CEC_OP_STATUS_REQ_ONCE);
>>>        fail_on_test(!transmit_timeout(node, &msg));
>>>        fail_on_test(timed_out_or_abort(&msg));
>>> -        info = {};
>>> +        memset(&info, 0, sizeof(info));
>>>        cec_ops_tuner_device_status(&msg, &info);
>>>        if (memcmp(&info, &(*iter), sizeof(info))) {
>>>            log_tuner_service(info);
>>> diff --git a/utils/rds-ctl/rds-ctl.cpp b/utils/rds-ctl/rds-ctl.cpp
>>> index 0511fe5d..0e497b2a 100644
>>> --- a/utils/rds-ctl/rds-ctl.cpp
>>> +++ b/utils/rds-ctl/rds-ctl.cpp
>>> @@ -918,7 +918,7 @@ static void get_options(const int fd, const int capabilities, struct v4l2_freque
>>>                printf("\tFrequency range      : %.1f MHz - %.1f MHz\n",
>>>                     vt.rangelow / 16.0, vt.rangehigh / 16.0);
>>>            printf("\tSignal strength/AFC  : %ld%%/%d\n",
>>> -                std::lround(vt.signal / 655.35), vt.afc);
>>> +                lround(vt.signal / 655.25), vt.afc);
>>
>> v4l2-ctl-tuner.cpp also uses std::lround, but that one isn't changed back.
>>
>> Is rds-ctl.cpp perhaps just missing a header?
> Nope. std::lround is C++11.

So, why isn't v4l2-ctl-tuner.cpp changed to lround as well?

Regards,

	Hans

>>
>> Regards,
>>
>>    Hans
>>
>>>            printf("\tCurrent audio mode   : %s\n", audmode2s(vt.audmode));
>>>            printf("\tAvailable subchannels: %s\n",
>>>                    rxsubchans2s(vt.rxsubchans).c_str());
>>>
>>

