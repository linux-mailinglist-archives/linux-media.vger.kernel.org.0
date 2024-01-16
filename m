Return-Path: <linux-media+bounces-3767-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F73182FC26
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 23:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7BEE1F29130
	for <lists+linux-media@lfdr.de>; Tue, 16 Jan 2024 22:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F0223771;
	Tue, 16 Jan 2024 20:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brixit-nl.20230601.gappssmtp.com header.i=@brixit-nl.20230601.gappssmtp.com header.b="HaJi9bkU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722C623762
	for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 20:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705437225; cv=none; b=Z7irjNR1hnrf1kTpyXYgSN+WKvRxCFxDxsrMtMuGX1TOujg1n8HBnyJheKo5l4Tpcb4+4aLxymcoDezKd7s8luk6R0d475r/nuFs9Ui21VnCKyT1jtJxSLqI8y7nGJbguqlf9//9zaUnMpSIvC0fXpkzeFzW4ztgnLtuTVMbRpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705437225; c=relaxed/simple;
	bh=bLvtU9GmP+z3YD1A3ZSf6pfME0rmcdFX3MOu+3u5WlA=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=f7Zh7Ed9v5R72yCBN2gfufs1vu8i4+lO64Tv7EQt26hACaFov9Hjf3HsCydR9EH+YObh6XCOR37KLc5DIFQw0o2/C/NslTJ/IzNI4F1wc+eMJVFOah9MQezxrS0WAazQnOiUQFxBUBc18C0gTE8Yick7WwOvdYooPWX9qfr/Dcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brixit.nl; spf=none smtp.mailfrom=brixit.nl; dkim=pass (2048-bit key) header.d=brixit-nl.20230601.gappssmtp.com header.i=@brixit-nl.20230601.gappssmtp.com header.b=HaJi9bkU; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brixit.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brixit.nl
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55969c01168so3318243a12.1
        for <linux-media@vger.kernel.org>; Tue, 16 Jan 2024 12:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brixit-nl.20230601.gappssmtp.com; s=20230601; t=1705437222; x=1706042022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQYnK8r0WDlOVQgRQTtnzryqB0Bw85aD3A/rnJ3JfSQ=;
        b=HaJi9bkU89BQWav8nHAuTEv04F3xVmf6sNxp/Gcyhdhx86CeFSciPbMzcp5pz6kU0O
         M0Qkhy5TAJBznAzSFoOlNdZFlHqyNtrAp93uzeHsGZ/i2NtRXzRS8wfe5RKrTbwN3jj2
         lbLgwhVp+2ghu9qVLDNV3Zx3XYgIIP5NScYktEo0hdQBwfxgfVkZ0bWF+vzihoipTsvA
         jc4TPZwWkOw4kB9bFoFlLPKbBGPs4U/600AX3cKibnV9Mwo6bKxq9fFegFXPVxw6aEi1
         8VwFj/R3hNWOHzTT+jeoee1ap82qL06DhuT+QWGqStvrF9wdFVfnicQ02frQeBETasmH
         xxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705437222; x=1706042022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQYnK8r0WDlOVQgRQTtnzryqB0Bw85aD3A/rnJ3JfSQ=;
        b=Ms2PGypRnx4F+54xcunL/bccJxzuaSzyjnkY7D2sMH8FyEvolEgc19tZFDvwNuKQMT
         yzOSpdRCJppVb+O6P9SQzSmbpn7vXJkg3dBs7jh4dxEH3tmK0qlZXs2b3YmF8AGUgbyF
         XGyrb7OAJQZ1/L8aBfXb/jGpdi+4pIx7sgGV6sM8UXZPATaN20gVCU84WZbI/9yMiQ/+
         XYSwS4UZnWhani4ppdRXTTzSzJxy388hO8w9n7pemDJx2+UNd1f3+qyM0DjWiFqtUAmQ
         gWxC22uWt/pVVeQfD2nafO4qyc7H8T9ut983JYFA/qrYMK4S6iEFbxsYIVf6otHxD2m7
         2hJg==
X-Gm-Message-State: AOJu0YwTr8czdm1FzKopKwxTyg4f9uFsxDnWLvIUr705oRC3wemVYa3Y
	8j6qNUxmEJsXpel88pH9DoqZw0IPTkofhQ==
X-Google-Smtp-Source: AGHT+IE12HSEaKeyl74HOOYo0/OE9qhE2gVtfoIGnqU6mjdQlJwdOiIyXwH/t6fV/FSI+oC+jzCwbQ==
X-Received: by 2002:a17:907:a704:b0:a2e:7f37:8301 with SMTP id vw4-20020a170907a70400b00a2e7f378301mr1567285ejc.27.1705437221625;
        Tue, 16 Jan 2024 12:33:41 -0800 (PST)
Received: from ?IPV6:2a00:bba0:120c:9f00:7a8e:8795:650f:7c4e? (2a00-bba0-120c-9f00-7a8e-8795-650f-7c4e.static6.cust.trined.nl. [2a00:bba0:120c:9f00:7a8e:8795:650f:7c4e])
        by smtp.gmail.com with ESMTPSA id gu18-20020a170906f29200b00a28aba1f56fsm6917997ejb.210.2024.01.16.12.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 12:33:41 -0800 (PST)
Message-ID: <2c720f2e-3c73-4a77-92e0-5da8fce86b3f@brixit.nl>
Date: Tue, 16 Jan 2024 21:33:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Front camera on pinephone
To: Pavel Machek <pavel@ucw.cz>, fiona.klute@gmx.de,
 phone-devel@vger.kernel.org, icenowy@aosc.xyz, megous@megous.com,
 kernel list <linux-kernel@vger.kernel.org>
Cc: alain.volmat@foss.st.com, sakari.ailus@linux.intel.com,
 linux-media@vger.kernel.org
References: <ZaY44AHISMIh8fHM@duo.ucw.cz>
Content-Language: en-US
From: Martijn Braam <martijn@brixit.nl>
In-Reply-To: <ZaY44AHISMIh8fHM@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Pavel,

Isn't this simply the case of picking the gc2145 bits from Megis tree?

https://megous.com/git/linux/tree/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi?h=orange-pi-5.10#n410

[For the pinephone kernel development there's the option of building the 
kernel using envkernel.sh in postmarketOS with 
https://wiki.postmarketos.org/wiki/Compiling_kernels_with_envkernel.sh 
which has some automation for building a kernel and pushing it to a 
connected device. Ethernet and keyboard are replaced by ssh and 
usb-networking in this case]

Greetings,
Martijn

On 1/16/24 09:05, Pavel Machek wrote:
> Hi!
>
> In 6.8-rc0, driver for gc2145 (front camera on pinephone) was merged,
> but we don't have corresponding dts entries. Does anyone have setup
> where they can fix it easily?
>
> [If you have hints how to set-up pinephone for kernel development,
> that would be welcome. Currently I have mobian with rather old 6.1
> kernel on it, and lack of keyboard/ethernet makes things tricky.]
>
> Best regards,
> 								Pavel

