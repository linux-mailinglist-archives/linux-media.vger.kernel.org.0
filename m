Return-Path: <linux-media+bounces-4335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1A6840310
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 11:43:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B00391C22204
	for <lists+linux-media@lfdr.de>; Mon, 29 Jan 2024 10:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E8055E4B;
	Mon, 29 Jan 2024 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UbORyCiI"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD4056469
	for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 10:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706525023; cv=none; b=Eh6LKrcEbPdHTdAItYbcglyMOHP9xnX/3VIHpiZBzNQdUqV/3zr7X/uGSmkP5luFzVSEc7+LBln7KbBJ08GL/DyZjXXgi2dkr8Ba3uArO9ty6P+G+9bVsbuQFh5QyGyokHnqg0hi/JQ35ptlJ7sAu1+Rsqt5Fqx4AwUUMFupkZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706525023; c=relaxed/simple;
	bh=+9lIjQOxkDoEpx6KuskS9XhTXWVTVRYnqfbuoRx80HQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UcK5RioSodiUWGS1zuAwzFvB3zqdkLQmomO725a+ZIh8kdN0l3uaIs73BY4gyzz2Gl2DPA1Q9w1e8TfBa1LdAm6sD+X05x6qP5lnxS7hcIXH2fKgmiGmjWAGf8U0zNUuK1khSrZaclR+CmE8FDCwmNa1ZhT3uoJppXmf/aYiI5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UbORyCiI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706525020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hGAarMi9iOy9pXYMt5XoA9ty681LJoE6IXTSfsbOWZw=;
	b=UbORyCiIIoI4IT+hIw2cRzSdJR+rXEi63kXsf/+yydPxS/hCfBLmvm9mps9201sVtSyXPU
	JsEFr5WdeLABIDu9I084TGpTz8MZVjQoi3xq1bNP5ypIlXFBGJLU2pNrmMI03AUNiKJD0k
	zCinjeR6pMOIyihNu2HwYZw8L6wNMYo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-IDtBV2ZROxq62uCJUve1hw-1; Mon, 29 Jan 2024 05:43:38 -0500
X-MC-Unique: IDtBV2ZROxq62uCJUve1hw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a336006ef27so261104266b.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jan 2024 02:43:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706525016; x=1707129816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hGAarMi9iOy9pXYMt5XoA9ty681LJoE6IXTSfsbOWZw=;
        b=fRJXzB7CHBNGHkUqGkubnNZFpAnzqIdhWPGSVM7NqbemJ6ynNMqy+fuYZbeKPsevsQ
         sIHhAbblixPweehQKxU/S/pI7Raq3hbKPfR1JdILsuguuD/yuxo4pk0r10J/dGepP3L4
         eserdIMYOFyahDV/iIHv0TRxo/SyG9DI/xsPkhN9KZ+U5pSZ/1q8woh+6JaR+86H3cyX
         p0fmkhTl/uQ07wmR3oCFEFCkh7wW+1zIjEZma0DdBzbSwbO5EHGHRKDR3I1r9KvjH7md
         x/H1NNPixRXxNMsKD18i4tnIprPYUpVYctHmRODqW6cEcy98+72CTrsVcio1Kb0fMAI6
         +mCw==
X-Gm-Message-State: AOJu0Yx6DF6022yukec+OJZy+517WYpjAjOYVNTfVW6sSVhH9IJmb9s8
	JrNBWdOEFyfNTSv14fjkWbjw9+l0bSZwzD2w8lTkjKbyCPOXTwLYeX+ZzxeojFdjIsV1OyZxe77
	MHdM3ODZ4EnZU1OL80AfF0adU8GO6dS/8pxezD3/5o78ukMjI7A0H+47LlSCjQluxgPzS
X-Received: by 2002:a17:907:1759:b0:a35:b59c:fc04 with SMTP id lf25-20020a170907175900b00a35b59cfc04mr1924488ejc.25.1706525016732;
        Mon, 29 Jan 2024 02:43:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQr5P7TyjSs7bZJKkJIBk5W2ku2jyuz0p83uuP2cIbI23/kA7Yw4wNZRMK37I9EJrIQt24rg==
X-Received: by 2002:a17:907:1759:b0:a35:b59c:fc04 with SMTP id lf25-20020a170907175900b00a35b59cfc04mr1924470ejc.25.1706525016329;
        Mon, 29 Jan 2024 02:43:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ot7-20020a170906ccc700b00a3172cc2a0fsm3750992ejb.136.2024.01.29.02.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 02:43:35 -0800 (PST)
Message-ID: <77162309-ed79-42ed-a715-d8a0ce1af56d@redhat.com>
Date: Mon, 29 Jan 2024 11:43:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Weird default vblank value in ov5693
Content-Language: en-US, nl
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
References: <0fa07550-80cb-40f2-87c8-23864af33642@redhat.com>
 <xpzavj24xdbeixfc7lw7rccx3zyhodqhcsceovru7bgcfvdp5s@w4jbols3o2wv>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <xpzavj24xdbeixfc7lw7rccx3zyhodqhcsceovru7bgcfvdp5s@w4jbols3o2wv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/29/24 09:58, Jacopo Mondi wrote:
> Hi Hans
> 
> On Sun, Jan 28, 2024 at 09:58:41PM +0100, Hans de Goede wrote:
>> Hi All,
>>
>> While adding vblank ctrl support to the ov2680 driver I was looking
>> at the vblank ctrl code in the ov5693 and I noticed something
>> which I believe is weird / undesirable.
>>
>> When setting a new mode the ov5693 driver does not keep the current
>> vts value (adjusting vblank to keep vts and thus the framerare and
>> exposure unchanged).
>>
>> Instead it calculates a new vts value, resetting the framerate
>> to 30 fps; or 60 fps for smaller resolutions and then sets
>> vblank to the new (vts - new_mode->height) and adjusts
>> the exposure control-range to fit within the new vts, potentially
>> also changing the exposure value.
>>
>> This behavior of the ov5693 code means that switching resolution
>> also changes the framerate and the exposure value which seems
>> undesirable.
>>
>> The vblank and hblank control values changes on setting a mode
>> is unavoidable but the framerate and exposure value changing
>> at the same time seems undesirable.
>>
>> Note that this also halves the max supported exposure value
>> when going to a lower-res mode even when userspace never
>> touches the vblank control.
>>
> 
> Would you be interested in reviewing
> https://patchwork.kernel.org/project/linux-media/list/?series=697777&state=%2A&archive=both
> 
> and discuss there what the desired behaviour should be ?

I'm definitely interested in discussing this and in
helping with reviewing the documentation patches,
good timing wrt writing those patches :)

but Dan already replied in this thread, so lets
keep the discussion in this thread for now ?

Also I think this will probably make a good agenda
item for the libcamera workshop coming Friday ?

Hopefully we can make some decisions about this there
and then I can help with reviewing revised documentation
patches after that.

Regards,

Hans




