Return-Path: <linux-media+bounces-26508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3057DA3E1B1
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 18:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 012633B565C
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 16:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B057214A96;
	Thu, 20 Feb 2025 16:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnITrn3E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8AB2116F6;
	Thu, 20 Feb 2025 16:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070410; cv=none; b=U0JM6hU+UVq150l81LXmDMe4njPLlfwu5jCYSDGlCLYPMqVdN0YPyKzG1CgNNW8xEeCwX+zg9v50N1awEpcJ4XWdr5rCA+gYAHEOiHgBbAqpRtXHSli8ExrjDDIAfEPfdrOP+WvFkaIhKrAdjNVq5Bw5LN11IkA/DLG7ODK6Nqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070410; c=relaxed/simple;
	bh=wnA9/JOYe+0mgZDcoziJ6ed0Ll4qweWetDgvFkY1Rtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YxnRlnY2CNkY06WKk6ma9lGZ6iAjVBEVnum6IH2dV5xbodYfrrnOW9jyY3mChEmQcPi0OtHs3OhJ3lpZhtJTgL6wK3XJpGxJLq/b2TQKZPZQVyVS0uB0l69hwV3tGOJmvuwqIjLD2zlKMYJU4cDTUVALI5hdukSG3/WBxL15xGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnITrn3E; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abb86beea8cso237723366b.1;
        Thu, 20 Feb 2025 08:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740070407; x=1740675207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EOgvK9AFJe3WHPextjB1ThOrVLGAoD7o8PiZ9/mpfSE=;
        b=BnITrn3EEviLggzqo2Jf/ac+UCqYKMn6Uqcm8BFWSBY32XZVZBFM9Tk2SImynO5WUY
         DcUV+w3vkMmS8JIl3dlDQj/O4F9MbWzuyXBtzStBLUYVlDxZ4LMgxudKQVBIi9SEjjSi
         XHCVtqAmsK1p1PUqh63o7FELT7cLsNPcBgi5PgmY5BMicV2VNqc9VXl/fHrzprA5Fdpj
         pNNe2AvRby8VuxwnbmD7X6kSYtzBaHH5lBa5M9xHryOZf2dYscu8XTBtfT/lZs8Cz5Ey
         INxqMFnV3FhcWsV0vUIE3cYJiYtXN8xs+/xcOXx7GWxzMePOIg4otPzE2ll2k2byFeSD
         3yNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740070407; x=1740675207;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EOgvK9AFJe3WHPextjB1ThOrVLGAoD7o8PiZ9/mpfSE=;
        b=IqZ5OP0lp0Zol8n4V/nJ5D3G3QzpwjfdVcZRmuSDyOtFtzeGh2G9OmKGym+9tSDthX
         O9VK/T3opAJb/emqKL7Q8AKkFpJbQXaegEpap17mwvvUZJh45L51BzRe25fiy28mh2/j
         EEEtoWCW2UnZ4gHOMIuy9l/Tqxy+Ih181UH7Nrz/TXauHWZPZQD0sUKYSDBXhr8kEfhb
         +MntJNEEDkjMY2Vj/5JoE5Ey4sgdO5v2wsNjPmdnXuYwQIvQ9gWeKo3/UUKMuXgB1duO
         pdjXDjIk3rpD4iCZMNmQjPPNsShLXObVZw8u+o1TfgTaTqgoT2UzZfuALrgG+QQ7In+G
         T3kQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/aoBRpvfE7XkiVeCYorJ9FVAbDlg+5ZodkD6AUEeUCDs4c0C3UaeBhPI+qUlb9YqC5GzQIlTJeCgpR3U=@vger.kernel.org, AJvYcCWux90aXzUNa0hYB1yGgZv5XDit2kxSekrMgmRmkGw8I86rkUW7yMlgUv0FCDxIIRXLDNLnZTZL+ijYdS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLnvFW1QETsmfjfj1N53IeUM3Ax3ss3T0P6eossudZEVRAi03X
	GSvJGh2SBgwVUU/4v6PkncGwuMP3BOnNocr9C6YF5KfURImPug2b
X-Gm-Gg: ASbGncvXta9xfUE3m8F+0qleiu2Yw2WKvNLdE7C5cRgITP1QgTNFjySLAd0hrsIkx9V
	rcEveKTEQYuKPESKQETxkJcdsLH1PXHyRr9DXgWqGBnNsLB9iNtN4zRb/nBT+1iCgwdEHn00fpH
	Sxjoh6GVq+tcybcAon5wtD5kuMOT33iQzp4z33I1hgQ732G0TKpsPIvoLIWk/zKnaQIT04VAXzK
	banNjivncR2XcGKQ1iRKnxX2JLHLt5LljP60TKEyl/c76TWTyolwiSxdk9EFhYxmOayotDBMngz
	Vt7GymaY72iWpxqiOvHddw==
X-Google-Smtp-Source: AGHT+IHX9VnmIkzgRI4Ll9tv4A4sJkmlBH401wTqrrD1a2+Mvl3kRu9TX2s5UtqBj6iP6Tz2hhj6nw==
X-Received: by 2002:a17:907:7f93:b0:aae:fb7c:50df with SMTP id a640c23a62f3a-abc09d33e2fmr2980866b.36.1740070407215;
        Thu, 20 Feb 2025 08:53:27 -0800 (PST)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbaa99f283sm681653066b.32.2025.02.20.08.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 08:53:26 -0800 (PST)
Message-ID: <8c1c7703-42b0-418a-9c51-fd0e76e3a68e@gmail.com>
Date: Thu, 20 Feb 2025 18:53:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] media: add v4l2_subdev_state_xlate_streams()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Julien Massot <julien.massot@collabora.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Umang Jain <umang.jain@ideasonboard.com>, =?UTF-8?Q?Pawe=C5=82_Anikiel?=
 <panikiel@google.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250220092036.6757-1-demonsingur@gmail.com>
 <tw6x663t5dmxsdarrxjtopza3mou3lnhwazu3dfv2k27fv47v2@bvftfepqqhss>
 <c94580f0-3ab0-4a19-a996-9bb37e23dd39@gmail.com>
 <Z7c5U6u5rr0-X0aK@kekkonen.localdomain>
 <20250220143902.GA17500@pendragon.ideasonboard.com>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <20250220143902.GA17500@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/20/25 4:39 PM, Laurent Pinchart wrote:
> On Thu, Feb 20, 2025 at 02:16:51PM +0000, Sakari Ailus wrote:
>> On Thu, Feb 20, 2025 at 03:01:41PM +0200, Cosmin Tanislav wrote:
>>> On 2/20/25 1:38 PM, Jacopo Mondi wrote:
>>>> On Thu, Feb 20, 2025 at 11:20:32AM +0200, Cosmin Tanislav wrote:
>>>>> Currently, the v4l2_subdev_state_xlate_streams() function is used
>>>>> to translate streams from one pad to another.
>>>>> This function takes the entire subdev state as argument, but only makes
>>>>> use of the routing.
>>>>
>>>> Correct, but is this a problem ?
>>>>
>>>
>>> No, it's not a problem.
>>
>> I think I have a slight preference to keep the pattern of referring to the
>> state as other functions do.
>>
>> I wonder what Laurent and Hans think, too.
> 
> I agree, I think the state should be passed everywhere. This lowers the
> risk of subsystem-wide refactoring if a function that receives a pointer
> to part of a state (such as v4l2_subdev_routing_xlate_streams()) is
> later found to need more information from the state.
> 
> The situation would be different if the states were not monolithic, for
> instance if the routing table could be locked separatly from other parts
> of the state, but that's not the case and I don't foresee moving to
> finer-grained objects.
> 

Got it. We can drop these patches then.

>>>> Is this the first step for a larger rework or is this a drive-by
>>>> beautification ?
>>>
>>> Mostly a drive-by beautification to avoid passing the whole state around
>>> where we only need the routing. I'm planning to submit drivers for more
>>> GMSL2/3 chips and we're using this just to not pass the whole state
>>> around. I think I can just use v4l2_subdev_state_xlate_streams(),
>>> but I had these patches in my tree and it would have been good to get
>>> them upstream, in preparations for submitting the GMSL2/3 drivers.
>>>
>>>> I'm asking because (and I know it's hard to strike a balance) this
>>>> kind of changes tend to make back-porting a more painful, and if
>>>> only justified by "it looks better" I would be a bit hesitant in
>>>> taking them.
>>>>
>>>>> Introduce a v4l2_subdev_routing_xlate_streams() function which can be
>>>>> used without the entire subdev state, to avoid passing the entire state
>>>>> around when not needed.
>>>>>
>>>>> Convert all usages of v4l2_subdev_state_xlate_streams() to
>>>>> v4l2_subdev_routing_xlate_streams().
>>>>>
>>>>> Remove v4l2_subdev_state_xlate_streams().
>>>>>
>>>>> V2:
>>>>>     * Fix description of parameters
>>>>>
>>>>> Cosmin Tanislav (3):
>>>>>     media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
>>>>>     media: use v4l2_subdev_routing_xlate_streams()
>>>>>     media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
>>>>>
>>>>>    drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
>>>>>    drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
>>>>>    drivers/media/i2c/max96714.c                  | 16 ++++++-------
>>>>>    drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
>>>>>    drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
>>>>>    .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
>>>>>    drivers/media/v4l2-core/v4l2-subdev.c         |  7 +++---
>>>>>    include/media/v4l2-subdev.h                   | 10 ++++----
>>>>>    8 files changed, 53 insertions(+), 47 deletions(-)
> 


