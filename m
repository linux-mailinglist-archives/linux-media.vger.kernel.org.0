Return-Path: <linux-media+bounces-31659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF97AAA8583
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 11:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C318177D4F
	for <lists+linux-media@lfdr.de>; Sun,  4 May 2025 09:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF37219D09C;
	Sun,  4 May 2025 09:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tf20s6WX"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60284A923
	for <linux-media@vger.kernel.org>; Sun,  4 May 2025 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746351165; cv=none; b=XTJeXCkx/qZeS6b7y2fZ/5k+/oUEyrb0fqPzo+NEZA5tXo06lr+JHCopazbPrKMvbAdeUUgA6tEnoISsvjbtHHU8b6CDXAFMOpwGwGdxbWd8dPy6eUtAkD/8B3RYnTpaZTQya6ivsjUAUVokyZrLRleEBsbkVw+eAtW46jpuaIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746351165; c=relaxed/simple;
	bh=VexB8bwFc2MAUWSJmu1DBEgji9aZa7iIYkYnv4STTT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dL/rUAsvsRkzkH+wNxJ0TQtD8lG+b+lT/8fhGSjPoR896hZI3U0vCDzsDmgAjObb7toNRWKju7Tq8skwCXCOVWFPmb/RNy6J1mzgYz6j5gisb1r3CKtqx2pZQ111fiPdiHSlp4Vw8l9nS87Vm3Xbzxk4MtdbKBWCLvDkSxbJkeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tf20s6WX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746351162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AlW+CSMEtuvmQKEJwjUt5vgjIZYPSexbESLzDByw7MU=;
	b=Tf20s6WXEJJRlKHg1i27TFHui9+uFJV3T2DB62NYhBDjvnRg95VvWcBW8y+X8z4E0quFfO
	RC59/3zl/VFTi26+mCx8XDjhViUUsqehfG8D44iGgsO3ySgwhJzr9vc5cLHd3ypXNjdTr9
	XLGj7hBZAQmwBRd5nk8iLq7u93MfaMQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-nAJWsGRbNK-AWWkMq-l7Cw-1; Sun, 04 May 2025 05:32:40 -0400
X-MC-Unique: nAJWsGRbNK-AWWkMq-l7Cw-1
X-Mimecast-MFC-AGG-ID: nAJWsGRbNK-AWWkMq-l7Cw_1746351160
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac6ef2d1b7dso328552866b.0
        for <linux-media@vger.kernel.org>; Sun, 04 May 2025 02:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746351159; x=1746955959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AlW+CSMEtuvmQKEJwjUt5vgjIZYPSexbESLzDByw7MU=;
        b=Ev5NFsuBZrHNvNtPhHiXhdiOeCuCuoO4ppumMMqxiETAFDCELbTiAPBHZ/pGcCybye
         9zDD64TEXvmZztRBwHYjBw4qgttVJAqrvNLne2VkTDPAiVP1/3CIbLDkdSQ5xiyWqXcc
         1Hu1qLQ0/t4KFOGSCoy3lg6QBR0VAt+KN+box4az5BWfX9xtHNQQ4C6KlMxEoDJCtout
         2E0H48wtZAAXq4Tc7tevq3mTeeGJ9IUNFKZKO50/fJeSYK3B460U2oaoregktp6eXxpN
         kWxdMekGl3o/9FZ7D/1gujwbICnCC2U1Do7faq8/cAm2MP4m78FwhW8Wy247Ji0Aa34V
         uqQw==
X-Gm-Message-State: AOJu0Yy2sfUaZiDIr4a+NXbj4ADgqZg8SexiRNMt+p0p1Q90lf/u5z4W
	ecY6POsMyNL+229F8R8BZ9BQQBbNtjqUGnRf/2jMydY2UfsTb6zMmYM3V48Int4kQ/NM7XPeCiE
	/IgyHfT0hf0hVCogdgROaDDjL0TX6vVpfwIre3kVhGGpqbgBSkaFdwnZ1ShaUdTnXc5uwv+HZsu
	ER8P0RyvncxvfelvsmR25dOxyh62aiKXPvqvdF07OxEM9a
X-Gm-Gg: ASbGncuGhFI7R1I3JljdYQjtYV4wFc6m3z8FYZ2Y2sYlg3oziku0Jj6UhfMaj4/h+ln
	+xn3g8o509pt2HdMYPJJDOEyk90WBKcBDbi7/cW1BUznvLSWtIARYF6PuRxfEsxkHsGvB2R3WJB
	CFfbnMBLgkysw5zGp2wapsYcGfy9vo7OeG2lbCxW/AuWLq8zuT1MPIN9a4HC8fofU46SgjigTUU
	bATfXSMDJMukTOAVREDD0NjzG1GCUVzAJBSO4WpZEEOxOZWpsXh0l/TJaq6ISJr5TMMniS3nbfl
	vpR30/o0YSkkpO6WPplUNMlzTfIENafi8nroLCHUFeRsHDtQOtASsXpRyQRO2zrIr12TyblCvgX
	3ee09J+rXq1uk5cvtJetBvCuWag5WBEhGpOdc1X7S0NDlDGODLzHj899VDh4c2g==
X-Received: by 2002:a17:907:c285:b0:acb:9769:364c with SMTP id a640c23a62f3a-ad1a4958855mr217437166b.21.1746351159035;
        Sun, 04 May 2025 02:32:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFM/71s+0AnMjFuo/AbF0i16Qnjv965gEsSkD55H/vGWZwRLQu2eB71jiz6YwAHgEV7iKgkw==
X-Received: by 2002:a17:907:c285:b0:acb:9769:364c with SMTP id a640c23a62f3a-ad1a4958855mr217435666b.21.1746351158512;
        Sun, 04 May 2025 02:32:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0381sm310752766b.98.2025.05.04.02.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 02:32:38 -0700 (PDT)
Message-ID: <59647feb-065c-415e-98ac-021bebeb822f@redhat.com>
Date: Sun, 4 May 2025 11:32:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT,PULL] media: atomisp: Changes for 6.16-1
To: linux-media@vger.kernel.org
Cc: linuxtv-commits@linuxtv.org
References: <fc3e0346-fbb9-419a-ad3d-4bd6ec0088b5@redhat.com>
 <6816413e.050a0220.355e3e.656c@mx.google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6816413e.050a0220.355e3e.656c@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3-May-25 6:15 PM, Patchwork Integration wrote:
> Dear Hans de Goede:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test media-patchstyle:./0002-media-atomisp-gmin-Remove-GPIO-driven-regulator-supp.patch media style
> WARNING: Reported-by: should be immediately followed by Closes: with a URL to the report
> #24: 
> Reported-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> total: 0 errors, 1 warnings, 0 checks, 117 lines checked
> 
> ERROR: Fails one or more mandatory checkpatch tests

I received a request to drop the deprecated GPIO API use
from Bartosz by email, so there is no url to put in
a Closes: URL tag.

Regards,

Hans



