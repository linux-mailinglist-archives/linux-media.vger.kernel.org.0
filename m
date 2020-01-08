Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBE0133C6E
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 08:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgAHHsd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 02:48:33 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:58109 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726443AbgAHHsd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Jan 2020 02:48:33 -0500
Received: from [192.168.2.10] ([62.249.185.68])
        by smtp-cloud9.xs4all.net with ESMTPA
        id p64iiZca3T6sRp64niGj5G; Wed, 08 Jan 2020 08:48:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578469711; bh=xtNwc5IfKrwfQUKrHwCTvQzYkoWCY+xfQHgdy/TuFfA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=cKsmt6ptKe8rmZ3M5DfNPORxnghlyTukfpvDVlr5xs958YNpwd8sawStoYR631BzY
         3AN11LRYWIw7OSu4i/7ecVereC+lCfHOPm+8jFTZ/eSwMJQbdSmfUqhyiJ1f7B1zrt
         W5uISl8yEH1JiPB/WeoI4dazTgE6jgSErj2gzBoFsA80Na4P8NHmRPYLYG/TW0vi36
         l7eLp8EovbH9v2iXTuESbD/hGHwd887/rdX16KPP3aeQ/GOoHV9WywY9srl+RHCIoR
         Z1AS7b8J8YU+uvSOJq7Oog6fVY2UGObK2BMVuqPwtId0KzOkUWAcbzscX9Ixs94GR9
         zPQq+egnV5rbg==
Subject: Re: [PATCH v2 2/4] media: cedrus: hevc: Add support for scaling
 matrix
To:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
        mchehab@kernel.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com
Cc:     gregkh@linuxfoundation.org, wens@csie.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
References: <20191213160428.54303-1-jernej.skrabec@siol.net>
 <20191213160428.54303-3-jernej.skrabec@siol.net>
 <4ac91ed5-a220-6a04-b1da-de27a306f8f2@xs4all.nl>
 <2627039.Y6S9NjorxK@jernej-laptop>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <96703589-15c1-0ce8-10dc-81996cac9875@xs4all.nl>
Date:   Wed, 8 Jan 2020 08:48:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2627039.Y6S9NjorxK@jernej-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCPPd8rbiZD36So4MR0BPIFX90J8IGWdlAbPEr1wlkVaRNcyZs7sjBwhi76joK6Pl2987dpiW7hadXr971MUho0RLuWfygrekxWuNkn08ZgadsBkn8vv
 ewxVX3JNjBpQw4bfd05TUdeDHSnoGpB1QuifsgI6LR7yBjF7EEpfU02eajqtHNbrORtbOHOirWFJTcuddAxPgvetNBkzypDTbDSFC2uCLHvBsjpkP8p/KBaM
 Q4Ya/CJOFmLiMgA7UKoF7lhNUQ1cX7WIETzySN9jIWjC2SfILbGI7uzDL9xyJB5vsOAj7Ri3x6orEJJ05gCU4yEonD/00RFi0yHNcoyLsZB/FpyPkU0n/onD
 OMjeORGX3h8ao6vTzJsup0ka6s6XX23aWEVG33DMaMKzFUGY304H1WwTruoES2OOXUrc6+E8N2bb8oLYj7vKZ2mqsWJ8PCb07JHNzxQ6Hj2ZmfAZASCbxd0c
 C4k3DLVDfB6wyjfCl4Q4hea6VElGPeMGlkuhWmyQYsXlbUm2WH3Cti8pVpY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 1/7/20 6:10 PM, Jernej Škrabec wrote:
> Hi!
> 
> Dne torek, 07. januar 2020 ob 16:01:16 CET je Hans Verkuil napisal(a):
>> On 12/13/19 5:04 PM, Jernej Skrabec wrote:
>>> HEVC frames may use scaling list feature. Add support for it.
>>>
>>> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>>> ---
>>>
>>>  drivers/staging/media/sunxi/cedrus/cedrus.c   |  7 ++
>>>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  1 +
>>>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |  2 +
>>>  .../staging/media/sunxi/cedrus/cedrus_h265.c  | 70 ++++++++++++++++++-
>>>  .../staging/media/sunxi/cedrus/cedrus_regs.h  |  2 +
>>>  5 files changed, 81 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c
>>> b/drivers/staging/media/sunxi/cedrus/cedrus.c index
>>> c6ddd46eff82..bf68bc6b20c8 100644
>>> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
>>> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
>>> @@ -116,6 +116,13 @@ static const struct cedrus_control cedrus_controls[]
>>> = {> 
>>>  		.codec		= CEDRUS_CODEC_H265,
>>>  		.required	= true,
>>>  	
>>>  	},
>>>
>>> +	{
>>> +		.cfg = {
>>> +			.id	= 
> V4L2_CID_MPEG_VIDEO_HEVC_SCALING_MATRIX,
>>> +		},
>>> +		.codec		= CEDRUS_CODEC_H265,
>>> +		.required	= true,
>>
>> Should this be true? This means that existing applications are now
>> suddenly required to always pass the scaling matrix for every buffer.
>>
>> Especially since the commit log says: 'HEVC frames *may* use scaling list
>> feature', indicating that this is an optional feature.
> 
> True. Can you fix this when applying if this is the only issue?

I'll do that.

Regards,

	Hans
