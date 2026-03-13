Return-Path: <linux-media+bounces-55606-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K/RLlPMs2n2awAAu9opvQ
	(envelope-from <linux-media+bounces-55606-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:35:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9DF27FC52
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 09:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2789831A264E
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 08:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26750383C78;
	Fri, 13 Mar 2026 08:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ve4+KjZM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7B736C0DC
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 08:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773390742; cv=none; b=O7ABa1XSxwteUmUsW9/i39H174va8qakDmpBO9wyaXCfdgHMZ1vY1xd7RpfV62QA6BQ71Rf8G+EcECnA1O9bHVTIkoTCoEb8/Z3pOpUewuTPyymqy9lbJ6bJGbFjJ5RgxIuwRS9LnoJX/565VdzW2m7ru9FJSUe1Kn7fBUy81Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773390742; c=relaxed/simple;
	bh=gF7U4AhLl2B54UlbLoigUUUH6Jsm/F5mlTaV5RfBX1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+e89y19Yx4dlpl5mLNgij6QV0L5mLB8ngfciR7cbxKj+WPD7Lm0/C7HM+fVL6v1dQSaGjSp+rAttfDEV5/+LFp9OBwGjjZR4qJAesg6L/iiHEyHOGuyrO3Aj8SdGbGK9On0uixwasnpb0LJw+dG+2FSG3v7t8WvP5v9qNs6ncA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ve4+KjZM; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9423d62cbbso452188366b.1
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 01:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773390739; x=1773995539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zbcDxBVVYzOw7c6OTfNiMQmEPeMGSouBlRwpnguHKAQ=;
        b=Ve4+KjZMZXY4pNNaIPy6oKForvFFVjldMaURWwmxmzsmi+eV3MBTRRAd1SMZIX345h
         CuM9UPCoPnm84rEkVOfCzztFXPmTAlGoJBaGYyyhDd+hIbw2oLs+ZICv/LMKPCSCoPau
         HvE2s0thCUwFl1Lp4ruYJ7XJgjfwEHOYBowlXC5BHuqsyW5NJv2OWwL5ShpyhPmnxoyI
         IaTH1CNYSzxrimyyURz3spByUlwxn+KkTXJBZTy4lWDfNEIzHdB7/laV0bVJSJPK2lrJ
         2ERci+y02pPLrqM5DXhh8IXd4bDpOuswI7THsBPfv/Ywl+B54JNSA58bAKWTK286/sJQ
         Jvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773390739; x=1773995539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbcDxBVVYzOw7c6OTfNiMQmEPeMGSouBlRwpnguHKAQ=;
        b=JhNtETa5ariqeEHjINch6KgGaKWon2P0bjOp01YYm6Y96+EEebMjwnKnZ1CAYQp0nb
         x4cmwfySDAbtD7Gmu30Bo1EIC14aFOolJ9DvhNxJXIcK48CFAN0Wptdhjwobxd2gVNd6
         olHyyzlo3kulpWrO6LkIyi+GDtHG9F56s1SNOQ4vSD44aP4Daal434wek1HKKe/ZVCtT
         4T39V/zON10Os8SFYn1FxH3A7h6hqXQLg2LEJ5TYVoGrUY/yQ5cHq+cduZ6lF4TUCQRJ
         1D2EEvutwaBecs+f5z96JS5HuIXPoW5VqYIU0L0erIsf0CWGdkTg8/TZHDeud4o2UXKu
         xtyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxkSdloEXbg11jyYr1dJeGl7BYhYyP9IBxrMq9+F03EIUlhSPxHh6ARwNlsDkbgscO1ikCiy4bMYcA6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz22O+uJljmwJN5VMx5pJacnhh1GOWjgVrCUGOrE8KdM0kyGuWE
	78yfwMM4W+bTa3yS8wXCaGs2QMSOKMg9dp68K1P3+ruZ2902uPtjmgiV
X-Gm-Gg: ATEYQzyLbN6oRezIBhCbrR0TNFsxfu2ugsSqsRD/pU/OOJLtDVsh1lDSe5jMUQ1UuCw
	vIH6AkuZWm/VMu4nRnyuwEFRRZBhAgIFhaL4xuCQrnTVNRwvqy+cUBVzjR/6RQtifP5CGLz2DeH
	1DNPbbf1IZcYNND+zEM4cvC2Eu2AByPs/a3ParSt6hR9hZX2tHcob/hqKybFg4RWAQucc6aRiZL
	OeIh5yR2ZrDNv7BkgAaiz5DdKnWMfGKlLEfa2E6K1utSjrrw9F1l2y2lcYaGJ53vIpc+T22ITHt
	HOJ0Q0fhb/Mn3D2joQZ1ydQCUB+l/lA74A5f1nP4JJrtJyEjUAK6wrKmFShMugkuKxn4eZ1XACw
	CXff2sEib5Id5PYVlOPwKOkZIcBJlIpGiKr9jsG4eTKgKlQMvLngcWd0G8oz7lToqXPdf/AcnC3
	aNSZdsfN+mIXoI7qbg/2KrKFsnra1l7kPTNhFUqySEVxd8rNOGzPPEXPo7208Yfdf5vg==
X-Received: by 2002:a17:907:9285:b0:b97:73ae:e2e with SMTP id a640c23a62f3a-b9773ae119bmr31732166b.18.1773390738986;
        Fri, 13 Mar 2026 01:32:18 -0700 (PDT)
Received: from ?IPV6:2a02:8109:8617:d700:5998:31f2:ed8:c4f? ([2a02:8109:8617:d700:5998:31f2:ed8:c4f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cba6ec4sm29152166b.5.2026.03.13.01.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 01:32:18 -0700 (PDT)
Message-ID: <2bcc0442-cdd7-4093-831c-0bd4652edf56@gmail.com>
Date: Fri, 13 Mar 2026 09:32:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/21] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>, dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, mitrutzceclan@gmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Martin Hecht <Martin.Hecht@avnet.eu>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <demonsingur@gmail.com>, Cory Keitz <ckeitz@amazon.com>
References: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
 <abEgijQAqW27i5fU@kekkonen.localdomain>
Content-Language: en-US
From: Martin Hecht <mhecht73@gmail.com>
In-Reply-To: <abEgijQAqW27i5fU@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55606-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,collabora.com,ragnatech.se,linuxfoundation.org,analog.com,gmail.com,vger.kernel.org,lists.linux.dev,avnet.eu,amazon.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhecht73@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A9DF27FC52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari, hi Dumitru,

I'm testing v8 already and will migrate next week to that version. Below 
some further comments.

On 3/11/26 08:58, Sakari Ailus wrote:
> Hi Dumitru,
> 
> On Wed, Mar 11, 2026 at 09:17:12AM +0200, Dumitru Ceclan via B4 Relay wrote:
>> The following deserializers are supported:
>> * MAX96712 (already exists in staging)
>> * MAX96714 (already exists)
>> * MAX96714F (already exists)
>> * MAX96714R (GMSL2)
>> * MAX96716 (GMSL2)
>> * MAX96724 (already exists as part of existing MAX96712 driver)
>> * MAX96724F (GMSL2)
>> * MAX96724R (GMSL2)
>> * MAX9296A (GMSL2)
>> * MAX96792A (GMSL3)
>>
>> The following serializers are supported:
>> * MAX96717 (already exists)
>> * MAX9295A (GMSL2)
>> * MAX96793 (GMSL3)
> 
> It'd be nice to have more reviews as well as comments from the users of the
> existing drivers especially on how this works for them.
> 
> Are there differences in functionality or UAPI compared to the drivers
> already in upstream?

Compared with the current mainline drivers from Julian (what offere a 
good basic functionality) there are a lot or more features enabled. One 
ov them is support for routing the channels as well as i2c-atr instead 
of i2c-gate only. Both helps to setup up more complex and reconfigurable 
routing of the video channels in complex systems with many 
sensors/cameras/streams.

Additionally a lot more and never devices are supported by that patchset 
including the new GMSL3 devices what are also backward compatible to GMSL2.

Both link types are supported now. Generation of test patterns in pixel 
mode has been added.

Also log-status returns a lot of very useful information about the link 
mode (tunnel mode versus pixel mode) and potential errors / packet 
losses over cable by presenting the counter registers. That helps to 
monitor the quality and reliability of the GMSL links as well as CSI links.

> 
> ...
> 
>> The following v4l2-compliance test still fails:
>>                  fail: v4l2-test-subdevs.cpp(371): fmt.code == 0 || fmt.code == ~0U
>>                  fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
>>          test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
> 
> Could you post the full report here, please?
> 

BR Martin

