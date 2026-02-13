Return-Path: <linux-media+bounces-52690-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOohJv7EjmnCEgEAu9opvQ
	(envelope-from <linux-media+bounces-52690-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 07:30:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F31EF13343E
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 07:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D84FE305D6D8
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 06:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE961276049;
	Fri, 13 Feb 2026 06:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TvV3d3Va"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA7E26562D
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 06:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770964196; cv=none; b=QXOebcqqMLJIN1nEpCQFGrmJ510uNPZvtMezSkSGNE+2kDx4AeaXpYU/QWFHJ6AEcU9DTc8cnYGIt+ASmoSTlfKPb850qXZg30vnN/UVh3p2SP3lsCti/e9CRKUBp2n4xWjXjJ2/RhAjWI4+96LHLWkrc9X30I8CtjA7+ocA7SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770964196; c=relaxed/simple;
	bh=kCswgtylYBaH+vm/oPXmR7sifyk95YR7in+IPuGhek8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YTSeEkqDZC4zj7g3vncZS9s1ffC0DIQtJS1BnKVA4AI7s0HJXHRepr5PZDev13sFUn0wPMMs9ZMgc21ZwdIo/0+KnSSnVPTHtRpahQQ/wMF6Hc3g1fQMHY3Zr66zTth0CgzG3hb0WbRa0JgiwTfLJTJahsO6W6rPL6qxzyHIiAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TvV3d3Va; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-385be94abbdso560671fa.3
        for <linux-media@vger.kernel.org>; Thu, 12 Feb 2026 22:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770964193; x=1771568993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUbCeLqkSBbz9Qag85Qyx4nbeZ0oQ9o4jeNsX3hpN7E=;
        b=TvV3d3Va8K1iBsadKDQqIW603oHKx8o3Xuto8XmG4SPghONKlNfmUGxssGv15pFmlh
         f0Um43LcP8I2FfsUTbgckiZx9nyDPOWbG7jS3qUisOTpOL1Y+sIxPouZ7+xzF2YeeckY
         nycxvmGg8UNHNVMTMjZQpIETgFT0uZ+O4N8Jlf6j5uHeg4Vxl3hxhiYlq+DsbcXoVDad
         tOnWCFbYNs7IkbS1tWzHUWDaFsIcnedDoJdbesHm5tb5iAdvT/48kRyQJskIMD2oIveg
         GXSRJCyFbfaxt8r+k0912VwGZJ+CcFwnFkWFxtBNhG3MhdjKyZLll0CTgp7N+uo8gVqP
         lOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770964193; x=1771568993;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OUbCeLqkSBbz9Qag85Qyx4nbeZ0oQ9o4jeNsX3hpN7E=;
        b=gZhwnPs3RqI3gMynDJbnWXCGwLaq8KQ3SbZ/mimetZ64xiCQPbt7aX0xP4a0qqA1N6
         rbXUosTVtpBGrkcpQkakvc48Fq/W28yrvKHCOm2JADxhevP8OnmdHwQuG+U9b535fNLV
         BCBYcAGZYvktT4aqVKkHEMyITLjqNVSbAtSHsXuPZRK7JB4RJHC6y/Ly3dlmal1uSTjz
         HNd3QREmM4nSd9KNB2ZBykKyM04ygTzQmpLBZA2ttiX4cMEsNqtnpNO5Rg4JSvWgqv3A
         /L3aedxYwnt7YIpr/VkJg45IpDSuKlzw1FoUGyWB1WXQFW5v0p3GQWtytifrz9N4/gGW
         iENQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn2YVARE9QajrS/JBX+Dqh4Itq43MBYX8BTtONhv0cG2i5SnlAzON9EBsD5JMV1mG84e41uA1cI1FQjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywiw2fzMghP89u5ba86Nbg1G6+JoFKHt7ybfc5qCuGPiG6wgaq0
	EJB+6S4BMVH8WBwL2e446daQu5fDFl+imFStEv/xJblWj/rIL4zooyrKTR+nBZkhAKs=
X-Gm-Gg: AZuq6aIg/2QvNRFq6cz/fGK2HbYrvHXP+DwdoO4ZTqfTVSZQtDS69nAH/LavEzTJi2R
	6p6V/cWWJ/KT17Y/sqoH3gmK8bjDgF2ICUsTTtO5lDrh4wn5laIDwV4CLSuvzSMLdMPDHIu65ou
	j3N7LiyI2fyPWe5rANwrzJoU2YXAcLLj9HYIu4v9G0/wiGU5m/AK4no0rbdC/pax65wpYZjUl+E
	fCwDEt7pdNEqWBhCNN+dkJ0XhxTbfXbnRKzPh7ymMDzkukQKc8oHdmzJGTBs8OWshOkUpA2eAhq
	cshFUakAzwrsOtwN/eJTW0xvczuqDYvoK9q0nQ2EyeKilVAcWroneGwhnRdQHF6slX+daD3Nmi5
	dKGjn0xj23fidPQTN2fbUqfQ3b8uff/Ylu7eJhyeTSMLzQHpcBY3mf5loYncTJoYlADS/PqLbHt
	XJzQ6LwYaCKFZ2WT99qN6vofxD30YkraRew4zGE6Faax9h4ItdrvGWIWEVoJcu/Pbc+YL8G/BHT
	Bfg9A==
X-Received: by 2002:a2e:be2b:0:b0:387:170:73ff with SMTP id 38308e7fff4ca-387ed8ce87emr2166921fa.4.1770964193194;
        Thu, 12 Feb 2026 22:29:53 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-387068925a8sm11374891fa.8.2026.02.12.22.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 22:29:51 -0800 (PST)
Message-ID: <e63b5a65-3c59-433f-a8cf-93bac14aead0@linaro.org>
Date: Fri, 13 Feb 2026 08:29:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] media: i2c: IMX355 for the Pixel 3a
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260210020207.10246-1-mailingradian@gmail.com>
 <aYvLppaYsNDDD4DX@rdacayan>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aYvLppaYsNDDD4DX@rdacayan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52690-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F31EF13343E
X-Rspamd-Action: no action

On 2/11/26 02:21, Richard Acayan wrote:
> On Mon, Feb 09, 2026 at 09:01:59PM -0500, Richard Acayan wrote:
>> This adds support for the IMX355 in devicetree and adds support for the
>> Pixel 3a front camera.
>>
>> Changes since v7 (https://lore.kernel.org/r/20260117040657.27043-1-mailingradian@gmail.com):
>> - restrict data-lanes to 4 (4/7)
> 
> Apparently the 4th patch has been blocked by Gmail.

To complete the series you can send it by

   git send-email --in-reply-to="<20260210020207.10246-1-mailingradian@gmail.com>" <snip> v8-0004-*

-- 
Best wishes,
Vladimir

