Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628C1263412
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 19:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728611AbgIIRNz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 13:13:55 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:56799 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730021AbgIIPcF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 11:32:05 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id G0fHkjNw8XgwIG0fIkZfqA; Wed, 09 Sep 2020 16:01:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1599660096; bh=i+JQnXb+Wd/uX2BD58/h8euU8jNSO1h3eT+5kMLBFiA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Nc8rWaiKuDJCk98btheXEBVPsnTr/rEzXBShA4EdhMWQkvHPskg2RH5KkDQOBvv0w
         /zZlegmS4EqDmDCZOr4tHdnaq2S27LfDwJFzJ8iqFhbNzUUfQ4sUv2DIZpOFKwyQui
         eDUzm5PCMq99tvfOc4DEd98/Hy2jTzU7Yt/WO096nkBqa8pATGEjBOPPWUl4uih6BR
         7fBTDkPvNCPhW4sgxcVdyyz5h4L4i4uiZo2z/pKSWQIBME06nZssMuYknxuUnClGmc
         JFvTyNF2bUJJxPxanqKefR6rRjx7UPw7ZYVPQpkcJOEFTHAR0Ob+gWONOWek+N6e7u
         KEOY63uJc/BJw==
Subject: Re: [PATCHv2] fix GCC enum warning
To:     Rosen Penev <rosenp@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <20200803213929.34616-1-rosenp@gmail.com>
 <992328dc-8ad5-063c-69fc-b01364bf3011@xs4all.nl>
 <CAKxU2N8CjSw+awumPNL_9WfdvXMbSBtmRDtfq9AsL7P2sppJWQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c88d0408-63a8-7216-b2c5-2966135a5fcf@xs4all.nl>
Date:   Wed, 9 Sep 2020 16:01:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKxU2N8CjSw+awumPNL_9WfdvXMbSBtmRDtfq9AsL7P2sppJWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGeQ2E+AuA9AX6mkx2IvWujEOss40Fuza9xkISQeXqPNm5ReoIMsEZZSFNMIbu248fxpOf0s62uBm8buN7bUjiyPrG7xhdoGCD6HKL+Kg9sFAH2yVG9T
 3B42rY0l8U9BPonZgue86Z+4yIx6y86vYwT7Ic2WLDDtDwN0eXQBHo7f6KDDWbTuZLNEy3hPcjyTUcNyKo887oNk+H/XiFpT3KGHvyYXzbYAu7wEamSKOi06
 FuL7/8TA15+Nu+aqC2Ii5gjtzMMKSSQllssT1HQOMQmtBeZR/d/KFO758VkpfjAbe3mUY0VBCiyJqa/V97pA2w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/08/2020 00:12, Rosen Penev wrote:
> On Thu, Aug 20, 2020 at 5:26 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 03/08/2020 23:39, Rosen Penev wrote:
>>> Found with -Wenum-compare
>>>
>>> ../utils/common/v4l-helpers.h:880:36: warning: enumerated and
>>> non-enumerated type in conditional expression [-Wextra]
>>>   880 |  return hsv_enc < V4L2_HSV_ENC_180 ? V4L2_HSV_ENC_180 : hsv_enc;
>>>
>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>> ---
>>>  v2: Added warning message.
>>>  utils/common/v4l-helpers.h | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
>>> index e093e717..edd21c16 100644
>>> --- a/utils/common/v4l-helpers.h
>>> +++ b/utils/common/v4l-helpers.h
>>> @@ -877,7 +877,7 @@ v4l_format_g_hsv_enc(const struct v4l2_format *fmt)
>>>  {
>>>       unsigned hsv_enc = v4l_format_g_ycbcr_enc(fmt);
>>
>> Does the warning go away if you replace 'unsigned' with enum v4l2_hsv_encoding?
> ../utils/common/v4l-helpers.h:878:25: error: cannot initialize a
> variable of type 'enum v4l2_hsv_encoding' with an rvalue of type
> 'unsigned int'
>         enum v4l2_hsv_encoding hsv_enc = v4l_format_g_ycbcr_enc(fmt);

Urgh.

How about this:

	if (hsv_enc < V4L2_HSV_ENC_180)
		return V4L2_HSV_ENC_180;
	return hsv_enc;

Regards,

	Hans

> 
>>
>> I would like that a lot better than casting V4L2_HSV_ENC_180.
>>
>> Regards,
>>
>>         Hans
>>
>>>
>>> -     return hsv_enc < V4L2_HSV_ENC_180 ? V4L2_HSV_ENC_180 : hsv_enc;
>>> +     return hsv_enc < V4L2_HSV_ENC_180 ? unsigned(V4L2_HSV_ENC_180) : hsv_enc;
>>>  }
>>>
>>>  static inline void v4l_format_s_quantization(struct v4l2_format *fmt,
>>>
>>

