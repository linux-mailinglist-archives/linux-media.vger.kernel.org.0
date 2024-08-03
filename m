Return-Path: <linux-media+bounces-15741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B8D946884
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 09:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DC0F1F21CBA
	for <lists+linux-media@lfdr.de>; Sat,  3 Aug 2024 07:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABEA114E2C1;
	Sat,  3 Aug 2024 07:07:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4100214D45E;
	Sat,  3 Aug 2024 07:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722668879; cv=none; b=bHBjkeAAHx0j9JkLbBmpEXdcMkCc49Cn7kvlFl05V11weAf8HMccw4per/OLcfsKZq9wYwKp0U6FhTYrFUlpzP1+DvReXw+RnZ6cUIVQ3oTLrRmm1DY3s4WKE+702Rlod8hh2RJDZZiomFNqgTzNDve3CT8UqENObVI+5daKiQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722668879; c=relaxed/simple;
	bh=RHHPzn9H5ILDM3lXiGaqECNPDEFde+mqtsXtuuEoNds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBeEQDy7GUqPG3qObiLkfHimD0kKZKaFdCxlVC+shugxZu3rTBHspAPT90kzm9k35nYzHvSb/zaM/Is3USJGZG8jw+OxG0a4JSh7vZ3OYRbELjDFe/KtPs7NNyXUgMpN04OMNBlloh//uzWxIl9353sP5opVM3GtxEQ7x7xDtU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452B0C116B1;
	Sat,  3 Aug 2024 07:07:57 +0000 (UTC)
Message-ID: <d6db361a-6b6c-4ed9-8917-d45a59391a89@xs4all.nl>
Date: Sat, 3 Aug 2024 09:07:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.10 288/809] media: dvb-usb: Fix unexpected infinite loop
 in dvb_usb_read_remote_control()
To: Sean Young <sean@mess.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
 Zheng Yejian <zhengyejian1@huawei.com>, Sasha Levin <sashal@kernel.org>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Stefan Lippers-Hollmann <s.l-h@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240730151724.637682316@linuxfoundation.org>
 <20240730151735.968317438@linuxfoundation.org> <20240801165146.38991f60@mir>
 <20240801172755.63c53206@mir> <20240801192125.300b2bd9@mir>
 <2024080325-blaming-lid-5f0d@gregkh>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <2024080325-blaming-lid-5f0d@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/08/2024 08:57, Greg Kroah-Hartman wrote:
> On Thu, Aug 01, 2024 at 07:21:25PM +0200, Stefan Lippers-Hollmann wrote:
>> Hi
>>
>> On 2024-08-01, Stefan Lippers-Hollmann wrote:
>>> On 2024-08-01, Stefan Lippers-Hollmann wrote:
>>>> On 2024-07-30, Greg Kroah-Hartman wrote:
>>>>> 6.10-stable review patch.  If anyone has any objections, please let me know.
>>>>>
>>>>> ------------------
>>>>>
>>>>> From: Zheng Yejian <zhengyejian1@huawei.com>
>>>>>
>>>>> [ Upstream commit 2052138b7da52ad5ccaf74f736d00f39a1c9198c ]
>>>>>
>>>>> Infinite log printing occurs during fuzz test:
>>>>>
>>>>>   rc rc1: DViCO FusionHDTV DVB-T USB (LGZ201) as ...
>>>>>   ...
>>>>>   dvb-usb: schedule remote query interval to 100 msecs.
>>>>>   dvb-usb: DViCO FusionHDTV DVB-T USB (LGZ201) successfully initialized ...
>>>>>   dvb-usb: bulk message failed: -22 (1/0)
>>>>>   dvb-usb: bulk message failed: -22 (1/0)
>>>>>   dvb-usb: bulk message failed: -22 (1/0)
>>>>>   ...
>>>>>   dvb-usb: bulk message failed: -22 (1/0)
>>>>>
>>>>> Looking into the codes, there is a loop in dvb_usb_read_remote_control(),
>>>>> that is in rc_core_dvb_usb_remote_init() create a work that will call
>>>>> dvb_usb_read_remote_control(), and this work will reschedule itself at
>>>>> 'rc_interval' intervals to recursively call dvb_usb_read_remote_control(),
>>>>> see following code snippet:
>>>> [...]
>>>>
>>>> This patch, as part of v6.10.3-rc3 breaks my TeVii s480 dual DVB-S2
>>>> card, reverting just this patch from v6.10-rc3 fixes the situation
>>>> again (a co-installed Microsoft Xbox One Digital TV DVB-T2 Tuner
>>>> keeps working).
>>> [...]
>>>
>>> Btw. I can also reproduce this (both breakage and 'fix' by reverting
>>> this patch) on a another x86_64 system that only has a single TeVii
>>> s480 dual DVB-S2 card (and no further v4l devices) installed. So I'm
>>> seeing this on both sandy-bridge and raptor-lake x86_64 systems.
>>
>> This issue is also present in current linux HEAD (as of this moment,
>> v6.11-rc1-63-g21b136cc63d2).
>>
>> A clean revert of this commit 2052138b7da52ad5ccaf74f736d00f39a1c9198c
>> "media: dvb-usb: Fix unexpected infinite loop in
>> dvb_usb_read_remote_control()" avoids the problem for v6.11~ as well.
> 
> As this issue is in Linus's tree, please work to get it resolved there
> first and then we will gladly take the changes here

Sean, I assume you'll look into this?

Regards,

	Hans

(Added a Cc to the linux-media ML)

