Return-Path: <linux-media+bounces-26461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CFFA3DAAD
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66E2B1732D9
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 13:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E167A1F63E8;
	Thu, 20 Feb 2025 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mX9XHcyq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957DA433BE;
	Thu, 20 Feb 2025 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740056509; cv=none; b=Rr6oTzqCB/8oNbPztD/+VEl+gho/EPvymH7UIWpd5s1AOn6OLexx25X7Z+i3g2+uaJEUaUQzcPyMozoGB6tkXAQuttdkhrEOWJZKuRbIbqM45LCYEbIUB3qzcdAaa1mkO5vub0yGkxQCwgHMJWh45vACeo8h1kBKUqjdjVWrwO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740056509; c=relaxed/simple;
	bh=q4k6pLg6gFyqRkfKqGoGGD96uz6bTIidMfX2e2HpSNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hu9/B43UXYWuOuONxuUJDGb6ZkFGyapRHt3dkWYjU7p3mYjtP7vIn8SgZNNyY3EEW56889sWFXs4e3v2WFjNEWAzOtt6sNxuabpGwsvXnIV00w6gWV4f6j9OSQq5MTAMXGnGg7bmyPdxUmxoPoA6iJnInMyEMxonRqixRHWl8ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mX9XHcyq; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abb75200275so150291866b.3;
        Thu, 20 Feb 2025 05:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740056506; x=1740661306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vgmKYWvys2geNwIMlTB+AnD/uE/7UeYtcCFKBMM26oQ=;
        b=mX9XHcyq37N0Y98Z0kKH/Uz803vQBu7PI1zrN4cj8sQYBNMFQuWilhH0PBhUF5R+xN
         zP/BvsSDRMSwSJ/MGUYkI2HcWiNo+kF/PqIJ7xb427tl//mAsqq3m7j2t2/u8RQgOOn7
         rrfBEc8x1m1BhLTeJbITA122QtynPTPNN2aInH+QEGWSgYPdIIpoQ4JsqQcT1EFpnMxI
         z0kzs7l8Yzj92dQkd66lmp9ahJWGDDINcY9CNUfa2HUZNi3OD0FRSjiwP1ttXYVLL9pP
         +GseImkhr6dMcXFItk0CDcVokaRrr0LuqJghI0OneOqxkjlHhdyokX3JMTw6M8z7G4tc
         0B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740056506; x=1740661306;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgmKYWvys2geNwIMlTB+AnD/uE/7UeYtcCFKBMM26oQ=;
        b=ifSh3umXSeMQobpLF1bSANlJW5YlSUMHrZacAOLILZmVsqBN23vhkrNFubGpbQjUX1
         HLPhjmCrEWZdwC5PBOE6RIa5jQpkGIQjcUQ7RPZOU9zxjUtgYGov/7hP/aS/7qX8x7mP
         YWr8GkvIJtRJaeR5fSht9Ws5ns4ZvOLgoImP3oxLl2WVTMRlhYMRTKaLWibvCYBCvheZ
         EeUkDNCVXjxFVMRBydT9jfFdtsanhmQvGdKIc9KZdJIiT3RieJAlMMks649/aAgRlXJ+
         BgDlrJyGXyq0BgUXDShw7rLexK2X5s3mK89p8zIktadMQgK6DIyuF2I88RdRTtg+YC16
         24Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWejfE4e8a5vLe3o1JcApHi+8jReHGGM3uh+9WBq9Vw0dDvg5UW4M7fl0K3+4pHpUubRFCl/pgL2TJMPuw=@vger.kernel.org, AJvYcCXd8liwuKxG74uF6eMRvZrDGgxcT8x8CHYop+tHFYqnbyO9jrT7zEuce8VDlLgWDyYdohq3QTSh81Cbxts=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Q40QasR2jxCeoUpu00vyRGfJAjVU0Cdv1XitJJHuhz0ktFC6
	a1buXqjFiEwDJDPLvL2Sv9bKM3Rs70x42jn/Xe48Dcw+qR8I/v7LC3rNRw==
X-Gm-Gg: ASbGnctCWJAfP4GGAO1Q0Yqy6tGiNFrSHHsdYVW0C7WVkNaWYjc/SDPMwZep2PZTBKB
	453UAk6X/xinZtE4EqPHenKuSVsTaXgOIfLEkGDj9Est/rhxce9f3IjxhYzvA6iYVndo+IeG9fu
	hXv97ONoA6x+8jcPJlZw8NWA58kVoynGcYnJI8VxcthLSDRu9XIg/UtLiQ6bl5IwE41DzzYNuzV
	qC2JwxjaqYkgrlDxJVs5QTdetz2moth4jqi6qGz3X2vCzwyKrm/w9s8BuMsEGj7Gno16nGHmUkh
	JfFPjsxtLQZgITr9cBzfpQ==
X-Google-Smtp-Source: AGHT+IEZIyZ80nx+CwGk+O93D4se/mLmew3Yfg4IU+0c2JK2d+v3wVGF39JlO4RSiqfD8//4VL8XHg==
X-Received: by 2002:a17:906:4fcc:b0:abb:de17:4a30 with SMTP id a640c23a62f3a-abbf384a4dcmr201647466b.19.1740056505371;
        Thu, 20 Feb 2025 05:01:45 -0800 (PST)
Received: from [192.168.0.100] ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbbde95957sm492331366b.138.2025.02.20.05.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 05:01:44 -0800 (PST)
Message-ID: <c94580f0-3ab0-4a19-a996-9bb37e23dd39@gmail.com>
Date: Thu, 20 Feb 2025 15:01:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] media: add v4l2_subdev_state_xlate_streams()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Julien Massot <julien.massot@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Umang Jain <umang.jain@ideasonboard.com>, =?UTF-8?Q?Pawe=C5=82_Anikiel?=
 <panikiel@google.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250220092036.6757-1-demonsingur@gmail.com>
 <tw6x663t5dmxsdarrxjtopza3mou3lnhwazu3dfv2k27fv47v2@bvftfepqqhss>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <tw6x663t5dmxsdarrxjtopza3mou3lnhwazu3dfv2k27fv47v2@bvftfepqqhss>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/20/25 1:38 PM, Jacopo Mondi wrote:
> Hi Cosmin
> 
> On Thu, Feb 20, 2025 at 11:20:32AM +0200, Cosmin Tanislav wrote:
>> Currently, the v4l2_subdev_state_xlate_streams() function is used
>> to translate streams from one pad to another.
>> This function takes the entire subdev state as argument, but only makes
>> use of the routing.
> 
> Correct, but is this a problem ?
> 

No, it's not a problem.

> Is this the first step for a larger rework or is this a drive-by
> beautification ?
> 

Mostly a drive-by beautification to avoid passing the whole state around
where we only need the routing. I'm planning to submit drivers for more
GMSL2/3 chips and we're using this just to not pass the whole state
around. I think I can just use v4l2_subdev_state_xlate_streams(),
but I had these patches in my tree and it would have been good to get
them upstream, in preparations for submitting the GMSL2/3 drivers.

> I'm asking because (and I know it's hard to strike a balance) this
> kind of changes tend to make back-porting a more painful, and if
> only justified by "it looks better" I would be a bit hesitant in
> taking them.
> 
> 
>>
>> Introduce a v4l2_subdev_routing_xlate_streams() function which can be
>> used without the entire subdev state, to avoid passing the entire state
>> around when not needed.
>>
>> Convert all usages of v4l2_subdev_state_xlate_streams() to
>> v4l2_subdev_routing_xlate_streams().
>>
>> Remove v4l2_subdev_state_xlate_streams().
>>
>> V2:
>>    * Fix description of parameters
>>
>> Cosmin Tanislav (3):
>>    media: v4l: subdev: add v4l2_subdev_routing_xlate_streams()
>>    media: use v4l2_subdev_routing_xlate_streams()
>>    media: v4l: subdev: remove v4l2_subdev_state_xlate_streams()
>>
>>   drivers/media/i2c/ds90ub913.c                 | 14 ++++++-----
>>   drivers/media/i2c/ds90ub953.c                 | 14 ++++++-----
>>   drivers/media/i2c/max96714.c                  | 16 ++++++-------
>>   drivers/media/i2c/max96717.c                  | 23 ++++++++++---------
>>   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 14 ++++++-----
>>   .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  2 +-
>>   drivers/media/v4l2-core/v4l2-subdev.c         |  7 +++---
>>   include/media/v4l2-subdev.h                   | 10 ++++----
>>   8 files changed, 53 insertions(+), 47 deletions(-)
>>
>> --
>> 2.48.1
>>
>>


