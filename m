Return-Path: <linux-media+bounces-21993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6C39D866D
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 14:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1D00284772
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 13:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D891AF0B7;
	Mon, 25 Nov 2024 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UbVuVKFy"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5B11AF0AB
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 13:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732541398; cv=none; b=Tig+GNVncrMtvM3ErONOaM/UL8TjxUWQX2JJI6B1YvyuvGGfmRsFnlwD29DFS7S3+C0tv+pkFUo9ydT2sMr74eZPtN4X0qr8OzvBA3oWYTBDQYo/55tjE5X8+CGC17ZmnhsDxXrVJOfGaR3K92dRdLLTYNUCotXN65azjS4YFs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732541398; c=relaxed/simple;
	bh=PesfTofTxJCPwxbQmrGPe6XDw08kWo3FPvk0e+XKVFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZuvKF5J/aBHusShHkhem5d8w1GfFgkizEVntPH7pu1QAtQzcD+5NpPLzSNzMHaCQtPKIYFvs3dFJu/yySZf/zgUS2tZtZKwhU1f/z88XVYKRb1M3s1iGkSts16d1MCyI7U82fzQe/UxzYsW1/Ymi9CpCVJSD0yDcrWVmxA/Cup0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UbVuVKFy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732541395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XSZe9OLEpJFtlpKYm1BLUeyX+bHHN2kmK4pTMxUedz8=;
	b=UbVuVKFy9YWOgWPxkvzDEnWwn5nRtTTkTGO1KUoXyTG4+VfsAEISeIfzaQ+jYyd1M7kdBu
	wvPu4yRHw1CcqssUsAFK4XB+OIn/ibCLlnQjxNEDLnTXsAC+Kl4qIeQymV6ArqE+MZjI4Z
	Kdwg1kULh5wvE7BVCiLVXVWdxqB+fFU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-cjYb4TwaMd-J-df4M1H2Dg-1; Mon, 25 Nov 2024 08:29:54 -0500
X-MC-Unique: cjYb4TwaMd-J-df4M1H2Dg-1
X-Mimecast-MFC-AGG-ID: cjYb4TwaMd-J-df4M1H2Dg
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ffa01807f1so26721471fa.3
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 05:29:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732541393; x=1733146193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XSZe9OLEpJFtlpKYm1BLUeyX+bHHN2kmK4pTMxUedz8=;
        b=YcpaOYIjITXJqkvrC2nRlssjTO7292uHC8TXlbB21ZFKzR4gNbOq8dOF30/Yw6nlbH
         ZIMod373XkPgQi3xovEKlcAZyXWb54vGW1tW6AKfDLWhbkRtcxKCS1bdLqZqbF1l0B/C
         FN2tA/sJZDNJG17UzQN2flVZaldpJmhjbfN/Unc9mhT89JMGIA72GApk1I2adozT48Do
         Wg9Oq7rRNjrwpc5OU233Dr/8oJoH0zoF79UZ93dKiiz+7epOGzl5oM2RCDt/9TRzT0W0
         mVsC31fUpfWM7rTReGyAH3GTInd2t6Z1d33k2o2Y0GwvmBypRNzT979ijBIKd9+PqD6a
         bRZA==
X-Forwarded-Encrypted: i=1; AJvYcCXSUCPYnTIZvnAIlCgk89mscGzDUxaW3ikD/lamObMLEu3WHeR864tTT/My4NhVyYx4DDchlwkGkNnnVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPTd/7c/G/EBzJ2k7QCDNB3VFJTQzHV/jgK5U7X3mvuZLqdYRH
	M40Wk7WicqfwOD4OxYwUWFm5yN/v9OeNdqAnYG7ofeDOLeIhTnWCmqkC2FxxplFl6wCU0vz1jde
	bQMZ+rAd87uLnaKKIsHPD0KY6ga6+SRq7efQI9KBO3kDuVM8WrS9N5eGQeXW9
X-Gm-Gg: ASbGncv54j4lYv4bOwaN3uRUli72/sGDtxj5D8IgNV6BjP1AoEth3/MtufYzVXQIyce
	5Zo3LTn6tZ1iwl2beUejQ9c9QxcsS+Eot6Pw034yfKnUzHJGLJwo6Rrp2ETHFTlG3Nme5AyCbix
	Xli8uU4EHDiuiIz3Zs28Q+SP1fmrvyCRinyMK3dFoxAjzxET8bVioLm2lOKMJmBUcCqaAtuJ94m
	8Qi/LAqnF6PI9qeM8B4tjL/RQR25S0M1bKd0X1Dc7Xb+C3kFoBOTsBu7i12l7AZxEGbTdmpIK0R
	VM1Nlajcqprpfj7hJmATCFBjPYpYdeKzQ2amdIK9gs52pIoSSUQFJpDinda9aWFKs7kOAmwravq
	TJobSvhkntUEgmTOi1vHerXSj
X-Received: by 2002:a2e:8798:0:b0:2ff:bbe8:fa44 with SMTP id 38308e7fff4ca-2ffbbe8fba1mr15796971fa.1.1732541392797;
        Mon, 25 Nov 2024 05:29:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhS/2QAmcs+NhBz/uabDsITzAljDiLfLiaauKd8zpN2K9Av9BbgzQbxvChtITosy7os5nyrg==
X-Received: by 2002:a2e:8798:0:b0:2ff:bbe8:fa44 with SMTP id 38308e7fff4ca-2ffbbe8fba1mr15796801fa.1.1732541392348;
        Mon, 25 Nov 2024 05:29:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b3460d8sm464023866b.91.2024.11.25.05.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 05:29:52 -0800 (PST)
Message-ID: <d240ed2e-9675-425c-acef-92ad7f5127ef@redhat.com>
Date: Mon, 25 Nov 2024 14:29:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com>
 <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
 <55c76c99-dc86-41b2-84c6-d2e844530f67@redhat.com>
 <20241125124942.GA32280@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241125124942.GA32280@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent,

On 25-Nov-24 1:49 PM, Laurent Pinchart wrote:
> On Mon, Nov 25, 2024 at 01:25:41PM +0100, Hans de Goede wrote:

<snip>

>> I see 2 ways of doing that:
>>
>> 1. Use pm_runtime_set_autosuspend_delay() with a delay of say 1 second
>> and then on set_ctrl do a pm_runtime_get_sync() +
>> pm_runtime_put_autosuspend() giving the camera 1 second to finish
>> applying the async ctrl (which might not be enough for e.g homing) +
>> also avoid doing suspend + resume all the time if multiple ctrls are send
>>
>> 2. Instead of immediately powering on the camera on /dev/video# open
>> track per fh if the camera has been powered on and then on the first
>> set-ctrl, or the first other IOCTL like try/set-fmt which requires
>> the camera to be powered on power it up and then keep it on until
>> the fh is closed, since apps hitting these paths are likely to do
>> more stuff which requires the camera to be powered on.
> 
> A mode of operation where a userspace action causes a state change and
> the only way to change back to the previous state is to close the device
> often leads to problems. I'd rather not do this unless we have to
> completely rule out all other options.

But we already have that today. We already do the usb_autopm_get_interface()
as soon as /dev/video# gets opened and the only way to undo it is to close
/dev/video#.

What I'm suggesting is to no longer do the usb_autopm_get_interface()
on all opens, but only on some.

Where "some" are the ones where we come to the conclusion that we actually
need to power-up the USB-bus / interface because we want to talk to
the device.

IOW delay the usb_autopm_get_interface() until the first action which
actually requires it.

This should be a very minimal change from the pov of USB interactions
with the actual device, so a small change of regressions while at
least not powering on the device during udev discovery.

I guess one could argue that the cases where this is a win are so
small that this is not worth it.

Regards,

Hans



