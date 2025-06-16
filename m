Return-Path: <linux-media+bounces-34952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3DDADB4C1
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 17:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FB233B8AFF
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F14258CE1;
	Mon, 16 Jun 2025 15:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qXnVaIqG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C22219303
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 15:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086031; cv=none; b=UJ8F8SCO+9O4EwsjCB2c3ZORx59SV+OVu2vUb58e0skehkXIOZU9Eh2jrw8YOFGpQW24ekO6qCbXEu5weEGJhmhdeunhynIi4DQFZ/Uyizgq38xdbDZhrCBCGoDOsmOVyYUmNvISmvEgj7FBDJq5MfjSpppkH3g0qLQTf9qabUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086031; c=relaxed/simple;
	bh=8Qz4YGaD6cLHLVFtCKiuK3DnRJnR9B6rKT0UrLz3m1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EjxNgo6HfG3KXgNFfjx64+h2VJzCa7hnSEDOLmcno6d8ATzLVdB5j417CLW3bCrJgi9exNxHQufBx/olFKtG3u2dzli7q/UX9ddU8WPjRCM+SE9Uh2c4hEZZP3tKhNiyH7gHdUOdqCiGT3Iqkt4c8RETIu2YPs/acqne8AJ5YkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qXnVaIqG; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553affea534so339435e87.2
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 08:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750086028; x=1750690828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f1aLoL1S+4ZJBixxlMIoR0CEXIRiJhCxjZa38dTlXmo=;
        b=qXnVaIqGWK7zLb3Mb3oQa3yCgFPLZrqVJyfttL1hsBpG4JiA76QKaDSXSmyoO3Ipwi
         NgiKQqOfbHz88k25U8KMJf8IKh/Fjp1G5n/kmgdAkSo5ZmP5H6fKnVJpS1f9ccTGnwqS
         gCToNC547E5hp7Gtu3DuQj7+su8hTg70XE2VV0W6PobgVOft4ppyBvC0EIWvDa6Ghvx6
         zHpieG3gSNS/w6RxBQ1wBJFefH92PoYU3zReadYLlfDcQCtDAmOGt+qETXvL02ZVulfi
         GXRsMVCDHz4amTN5H5dwyHCSzpMRCJlUR4hqZGUyxw7nmz/8viUzwfq5hh5zNwRIpeFC
         tDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086028; x=1750690828;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f1aLoL1S+4ZJBixxlMIoR0CEXIRiJhCxjZa38dTlXmo=;
        b=xBpgF542DAKgpnhkV0Bmlw1xiwJHcHFY9uDYc3VXWkqT2ki5uNQ3BEbi3/9lKHbpxM
         QYax8ngORJ//yQa60uXW5lJe3ICotbzQN1wHW0EjSG+QRXI63qWAPLrga4pzI4LkHPfH
         uWiN7xgrDaYT5nBcQLYE7V2XWhQYinONg61gl6FV880G3RiEUddewWFK2UwvWUw/xJKy
         3eROwlMuCClE1ck7pwbxYYPQ2FeUGkYNBBrMHdwj3GX3okNfG7gcqhgcYizB0msvLqZR
         vvPKCTX68cNukdyFGptICNGCxH4faI9hnwzElN5iLUbPN14gmOMIHbsbbMvdfc2oIidB
         evEw==
X-Forwarded-Encrypted: i=1; AJvYcCXAYaLSs5z1o5jxAjga+Il4c3tDvLRzxqz5m4GZP8ikZILLc55jvgR/7eQ/g3qlZTi0bcbiFTkDeyI99Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ajTE4OFWHQts5h/VhcLYjB6R4+9PWrHjdpOgQkeolQY8wPVG
	jk4jRuWvsO4BWH0nvwY208hvLVmrekpuZNCG8V7wLwj8jJd0R+44QwJdMnOK6BoNldQ=
X-Gm-Gg: ASbGncvutLxqDq/t6/dFz0SOTlw/V5pYtcoae5L5Ic9/JXhJtz8so6K4zno1tx7bNia
	DgTgjvi/KfxvQkS68htZHQrgBCmC7pRGFxmBI9KS/lWP4DMHyAZinBKBhEr1BZnusr99plOpgpv
	IY1gtxKE3vCcLjO/X0RGh3oKlRYmfNpX8h4xfb1OEwDuRIck5XCpErcQuV/pjnwE0AMDoilFU4v
	NM3RvkbfabMMN74CyY82sgBZhOY1IR1h4EvJ21O6IpR6OApdwXfXSmS41x5piTFPjLiDozksrcS
	Q03xRxOkoobj1vpGxLjDSYt5JhdGtX5K2aGQC8T0zJzHyeotbnzksuWB0JF2zX+4bJynOlWc1ln
	MND65Tm/T4g1OXZxWVLb7bbOrGr1QQ6rRxoi3u0hOF1AvzBjKopE=
X-Google-Smtp-Source: AGHT+IEMjTrTfims1std1120/Q7TNV359N7W3OaZq1V3B3UUxWoAc+ufSBTDYaK4P5kpgxcIeprfqg==
X-Received: by 2002:a2e:bea4:0:b0:32a:7d76:2660 with SMTP id 38308e7fff4ca-32b4a2c4dafmr7377791fa.2.1750086027287;
        Mon, 16 Jun 2025 08:00:27 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3316fbd6sm15800921fa.56.2025.06.16.08.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 08:00:26 -0700 (PDT)
Message-ID: <fe113f83-fbbd-4e3b-8b42-a4f50c7c7489@linaro.org>
Date: Mon, 16 Jun 2025 18:00:19 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: vfe: Fix registration sequencing
 bug
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Depeng Shao <quic_depengs@quicinc.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20250612-linux-next-25-05-30-daily-reviews-v1-0-88ba033a9a03@linaro.org>
 <20250612-linux-next-25-05-30-daily-reviews-v1-2-88ba033a9a03@linaro.org>
 <c90a5fd3-f52e-4103-a979-7f155733bb59@linaro.org>
 <21bc46d0-7e11-48d3-a09d-5e55e96ca122@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <21bc46d0-7e11-48d3-a09d-5e55e96ca122@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 6/16/25 17:09, Bryan O'Donoghue wrote:
> On 13/06/2025 10:13, Vladimir Zapolskiy wrote:
>>
>> Per se this concurrent execution shall not lead to the encountered bug,
> 
> What does that mean ? Please re-read the commit log, the analysis is all
> there.

The concurrent execution does not state a problem, moreover it's a feature
of operating systems.

>> both an initialization of media entity pads by media_entity_pads_init()
>> and a registration of a v4l2 devnode inside msm_video_register() are
>> done under in a proper sequence, aren't they?
> 
> No, I clearly haven't explained this clearly enough in the commit log.
> 
> vfe0_rdi0 == /dev/video0 is complete. vfe0_rdi1 is not complete there is
> no /dev/video1 in user-space.

Please let me ask for a few improvements to the commit message of the next
version of the fix.

Te information like "vfe0_rdi0 == /dev/video0" etc. above vaguely assumes
so much of the context, that the statements become wrong, let's remove
ambiguity instead of its amplification.

> vfe_get() is called for an RDI in a VFE, camss_find_sensor_pad() assumes
> all RDIs are populated.
> 

This is a good and almost sufficient one line problem description.

Still there is an issue, you mention vfe_get() and camss_find_sensor_pad()
functions, however both of them are good, and the problem lays within
vfe_set_clock_rates() function, that's the exact place in the driver code,
which iterates over all VFE lines like all of them are initialized.

> We can't use any VFE mutex to synchronise this because
> 
> lock(vfe->mutex);
> lock(media->mutex);
> 
> and
> lock(media->mutex);
> lock(vfe->mutex);
> 
> happen.
> 
> So we can educate vfe_get() about the RDI it is operating on or we can
> flag that a VFE - all of it's subordinate RDIs are available.
> 
> I didn't much like teaching vfe_get() about which RDI index because the
> code looked ugly for 8916 you have to assume on one of the code paths
> that it always operates on RDI0, which is an invalid assumption.

vfe_get() and mutices are all red herring, there is no problem with
vfe_get(), there is no problem with camss_find_sensor_pad(), and there
is no expectation to find a proper fix in any of these two functions.

Johan and me pointed the way out how to fix the encoundered issue properly,
once again, and please don't hesitate to ask questions, if my short
explanations are unclear to you.

The fix is to issue any of VFE line devnodes for userspace strictly after
the completion of all media entity pads initialization. Do you have an
idea how to implement it, or should I help with it? It'd be totally okay.

> The other way to fix this is:
> 
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2988,7 +2988,7 @@ struct media_pad *camss_find_sensor_pad(struct
> media_entity *entity)
> 
>           while (1) {
>                   pad = &entity->pads[0];
> -               if (!(pad->flags & MEDIA_PAD_FL_SINK))
> +               if (!pad || !(pad->flags & MEDIA_PAD_FL_SINK))
> 
> 
> But then you see that every other driver treats pad = &entity->pads[0]
> as always non-NULL.

There is another expected way with zero problems, see the comment above.

There is no proven problem with camss_find_sensor_pad() funcition, and
it should be left unmodified.

--
Best wishes,
Vladimir

