Return-Path: <linux-media+bounces-25421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2797CA2270E
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2025 00:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DFB918864C9
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2025 23:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9BF1E3DEF;
	Wed, 29 Jan 2025 23:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IlBdoJjw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F2417A5A4
	for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 23:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738195053; cv=none; b=GMqZEIqkY0hgqGFpkfJVY4cTg3IpRFAaudzoyWH8xp/FFM+dxMAJfqDOSJxd+b25t1P7JXyad6u+9ciKenO69AYzHj9mlZAKrdYSbAO9NDAaRRNPvHF40B6JeF/PHnPJVWRHCABZDcw07gwbuvWGsqxruqCIqlrSmLTPwoFuANM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738195053; c=relaxed/simple;
	bh=AcuKuqdQr2F+vgV8Xs1uVgUGZDMFcscsTYgsnz5XXSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6vqox03y8wOMD6tQKxY2QDGMtNBD1yfxeNyz3WDHgNRDpqzvMzbf0EG7blYprVEPuuXtxChgv7hPN9IFEHCpYaOYCNWoEIdANRiUUrIoSCgPdkZ71dwElTVSsyyUy3aczeq2XZ+Mn8ef032c93SZEMFiZacW5a4MqOOVp0CNNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IlBdoJjw; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30229d5b229so1673121fa.0
        for <linux-media@vger.kernel.org>; Wed, 29 Jan 2025 15:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738195049; x=1738799849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/vKmmDClQI5rJLO5/otgMifmCa4Ysla9vgbX9XiyqdE=;
        b=IlBdoJjwajxMFzxSMjkvBV/+21eBwiaqE1FbA2P9xxFLT5U7n021x3zeysWOcHHiS0
         0QyN4AS6yOMYJSJAPPZK8Ze9wi3eQgeMCNKAsiKzjoUzAbsSz8QeHrsDGH33caM54yyE
         yo1rHOQVJbC9FuhDZvGEYXpuH4qRnlNJDuG9Iq0k1L+tvo5BH9Ck8Q+WHswfOO8cMvQ5
         4ilpewADhRrCMi/k30E+xmcE8GFB0v3hmJisezGdssPog6f6x2JS0sQDXTkcoKplYFCz
         MTvkdlZjQgHB2gXCVAiwut32HycurtHRVvt1TcyDXZ25xAwMBhQtjCq8qc5mCL08mIX9
         W89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738195049; x=1738799849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vKmmDClQI5rJLO5/otgMifmCa4Ysla9vgbX9XiyqdE=;
        b=kwlUlUwiSwx1vJyh9AAvMGOcauNhz1R24csDL0/hvLB5uAdRa6tKEEH/DEohLvYslh
         31EifDG5NY6UfYGxCRF/rbmci1I3BTIjgVqorIC4YDnj35wmjbVgP6lQfhQywk3UBwHf
         tmToAktXz7WooD2yECCFLFpMNY82s+f+RvSoEaqaRmEqNYLDujqkEkFR8zuvqUXg1pNk
         01Gk6tXKAkL8zlJxBWdwQSlN5kp28ofVZtkQmFUmoaeTZ7zvBJkCSprF9/Y9NTGc0Bl3
         2RYLqjJTC60McJWNbllPGSNpJ4gpBf+BgHBBSpizjtsNQCluPjPDZrSpl9/GtMzut7bu
         bGog==
X-Forwarded-Encrypted: i=1; AJvYcCWuNRO3hgY9icetry4nAzi8gkTNeFBa0AeAs3s+EFg1gIHagSrQjiPzaFkU6k4NnnROJ803uA3PfFaH6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrY/1QNtpb8i0z/OkES5gtXsIFfs2woYGkSm+sKotAbGr4fPUk
	8QfE94lsy+meXwnogK42MBiqEpazC0aDq518Z2k5WI1T0d+97UAiY7nwhAAM7KRSG8eieWvK2yw
	pjjA=
X-Gm-Gg: ASbGncvCaqhjTIDTO3N5tawaJh+LNj94MsuwAQgDm5b+SW/M7mUALuf0gcNXfOYkz6d
	di5+9jqWJ0y6FMPRfxYpub9nUOBpS0U8xdpKZcYa9STu82da4Gj8oPc/AEPMecaSSbyvFnK8nbM
	MC+RO7ANCpalkKcX5Cr+vhRd8T4QnktW2NQzXmXPD1TuYyTy2yZb0Ku1cm6edoWpwFa6GBp233i
	Q6e1Qi5+xnE98umFw7UI5h88ZEgrdBCD4/3D0jmTzYoG3/G3p2PIITmq80Ik19qhWdfQeB/rDix
	xoySDxkaL7RIY5Df6qWZaxJkUAU0T1Qvn3XC1tvOmvHsP90/UDbC4aluqhaHzOijzKSjrNU=
X-Google-Smtp-Source: AGHT+IF8IumImt4s4cQn29XrtALCizqOz/GhL2+Z450Kdl2dDZb73AqOTgTtWV4M3pPid4ONCXXNig==
X-Received: by 2002:a2e:bc24:0:b0:2fe:e44d:6162 with SMTP id 38308e7fff4ca-307968c4fe3mr18537171fa.26.1738195049367;
        Wed, 29 Jan 2025 15:57:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a33f778asm308621fa.66.2025.01.29.15.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 15:57:28 -0800 (PST)
Date: Thu, 30 Jan 2025 01:57:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jens Schmidt <farblos@vodafonemail.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH] gpu: drm_dp_cec: fix broken CEC adapter properties check
Message-ID: <q4ldkifdkqsjnanu6pgp2gt7cfrp7spg4ewezexm7rlm7i3nxq@lkeiymkjhdxt>
References: <361bb03d-1691-4e23-84da-0861ead5dbdc@xs4all.nl>
 <44a95f7f-8a7a-4b2b-95f6-5c0b60bfa85c@vodafonemail.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44a95f7f-8a7a-4b2b-95f6-5c0b60bfa85c@vodafonemail.de>

On Wed, Jan 29, 2025 at 11:56:39PM +0100, Jens Schmidt wrote:
> On 2025-01-29  10:51, Hans Verkuil wrote:
> 
> > Jens (aka Farblos), can you test this patch?
> 
> TL;DR: Your patch fixes the issue on my system, thanks.

Could you please respond with the 'Tested-by: Your Name <email>' tag on
a separate line?

> 
> Details:
> 
> ### build #13 - stock 6.12.10 kernel
> 
> [~]$ uname -a
> Linux host01 6.12.10 #13 SMP PREEMPT_DYNAMIC Wed Jan 29 22:10:03 CET 2025 x86_64 GNU/Linux
> 
> [~]$ ls -ald /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input*
> drwxr-xr-x 6 root root 0 Jan 29 22:17 /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input30
> 
> # you also get quite a lot of these without your patch ...
> [~]$ journalctl --boot | grep -c 'kernel: Registered IR keymap rc-cec'
> 7
> 
> ### build #14 - 6.12.10 with your patch
> 
> [~]$ uname -a
> Linux host01 6.12.10 #14 SMP PREEMPT_DYNAMIC Wed Jan 29 22:24:47 CET 2025 x86_64 GNU/Linux
> 
> [~]$ ls -ald /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input*
> drwxr-xr-x 6 root root 0 Jan 29 22:27 /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input11
> 
> [~]$ journalctl --boot | grep -c 'kernel: Registered IR keymap rc-cec'
> 1
> 
> ... wait ... let screen saver kick in ... wait ...
> 
> [~]$ ls -ald /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input*
> drwxr-xr-x 6 root root 0 Jan 29 22:27 /sys/devices/pci0000:00/0000:00:02.0/rc/rc0/input11
> 
> [~]$ journalctl --boot | grep -c 'kernel: Registered IR keymap rc-cec'
> 1
> 

-- 
With best wishes
Dmitry

