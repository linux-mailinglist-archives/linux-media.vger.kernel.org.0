Return-Path: <linux-media+bounces-39452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B3BB213BB
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 19:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECEEE1A21EDA
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 17:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F098F2D4811;
	Mon, 11 Aug 2025 17:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="3VF74/6t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C507296BDC
	for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 17:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754934911; cv=none; b=K2LSggMYZzhRFxuY/xKmXPze/s6L+7Erzk5ajyM6ABThTFVyWLhYn2+kwQr6/PDg10eC918H5tex6asVr5yK17Luxw+MKCJn7WbIEOVgGAp/3iifwXLGHKMFHflOlsbpF62DH20+N2wCcs2jT1ZPUm4QguZZX9yQBkLZdK0UlYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754934911; c=relaxed/simple;
	bh=qntbOLfG6VEAmFko0KNsbq9TFR7GjoHzxuIN+2pcuyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lw/D/P6jqzy5F94+U/uhOfGA4KzIxPrvQfbpsOm2nlzf8Lb0X48K51Ttv6avPrOkEZ1mCSGgyBnmU2acT03Uhhwc1KcV6kWs71OnC9iyLkJgHxhPDjZwTBoYzrpfBksx9PyhnVeiQoqcJ9xV9yRky3Hu3RamTDaH4TlZ68DQ/J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=3VF74/6t; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-af9611d8ff7so826274766b.1
        for <linux-media@vger.kernel.org>; Mon, 11 Aug 2025 10:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1754934908; x=1755539708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qntbOLfG6VEAmFko0KNsbq9TFR7GjoHzxuIN+2pcuyE=;
        b=3VF74/6trL3Cq5K8nBI/QHHtKFay3XdSA2iHS5NUtzhKwFb+40RY8J0469xQT7CKbp
         N3XmrXkj0MgNATsQ2UgDIaewFHWMQddOG1e2YfkPrOVkh6sefk4EC3SbfLRXpGnQWaRX
         6jINLpiid6gB4egzgml9J/wq5OEn2JYSqWeIa2pyOoVdAL4NXQ4t+lUlbCgr0vze8FLj
         ltzfR74fIp3jropHS4/LaV8jadv2ksQsbUC+YxLcYtEXbogjrgSXrTvD0IkREP9YkuUw
         LQou7SLBuuNDx3IMfPDxYDtMiQGYrlZMnjYk3GCfn3Jh5LGwmGXgGWYeSlcWCgbwKIqZ
         AR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754934908; x=1755539708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qntbOLfG6VEAmFko0KNsbq9TFR7GjoHzxuIN+2pcuyE=;
        b=pEYPYkT3BsPkuTYI1VFFmdmin88FMIVKA5IlRzmBSfeBCh3omypGONxsxQLWQu2ZB6
         02J07UznMPyaecDhOfrFiIDIhY6aFSy/Zui7wop09b/5/WJn2wzA1/gZ+yvFlXcKVgrQ
         c3RPX+1CLy7zmQWFFZuAhg+LbyiOvA3wF71HBJlG/YrAin1Irip6mWZAEBHVfjgChcll
         b7nBQDtOSy3rv4yGmnk1RU4mSNAK7fBBgrtFLoqWClooIVZMYe/efyXi2H0F7jiPQC7x
         eWJL3QjFRvf8MzYHgZKknZvu5mzgxgtShYfc15+JqDZp7WKn0cXXbbsoKCZhAeAVjgHQ
         iMrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKvXcStX2qP/1E8DeLuANFYVmCoGVFRkp2fep6vnJ98r8dBwR8MkKma3DcXUHOkySsUaA3bEP+ozfakw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2hdO+8w5ihD41nJPZJwO8As8mmTlbhTJHFPYjk8JUNNGvJp3h
	vqDVzRl4l3Kf1tk1VgqtY3/h8HBTUeW713ZzdsKvsqFEyesiOZq6zRJFrLAvPY57ONs=
X-Gm-Gg: ASbGncszuwxR37wTMAJklyr8fWhE2r/XYrdQvC/YDQI0rD1KsDXUytCKTdz9cr6/Pk+
	GI+Rn+fbRpRshxs2M2OagO5RSLxN4Ea9DqzSe+5BwSe6IgGXbnKOG1Bv9cOlK5wd6TrObcEDVPn
	rBy6Bs8SBZFgkruR17DVYLEJVanZBOD1SK/HliRBhqGv4MmpM2kC8YDs/UzLxCBsg7vWUYiSkuH
	crFHvRD0gBsV1U76TBefygR3a+mJ6TBGpuG/WP/o1RBEmh/TL86C7LOwTTGONoSw4dfVkcJKQoz
	f/GWmCGHL9j/VA5S5er5Q1FAm/Fg7vj5DMdvoJ2l5vL+2ehOTOCMS43Gd0yr7HLYJx8JhC206Wd
	R+x1ijVOEyC/rJh+5QaszfQhCsiFnKu5q6bShwRecxarE6qwc
X-Google-Smtp-Source: AGHT+IGnqPmxosOsQmukAJcqgqtVlMMjnQhRi3F09bNTgvKZKkuT4+VEVWgow3RRal7GL6Bm2Japiw==
X-Received: by 2002:a17:907:7ba7:b0:af9:b612:6868 with SMTP id a640c23a62f3a-afa1d618070mr52086066b.3.1754934907787;
        Mon, 11 Aug 2025 10:55:07 -0700 (PDT)
Received: from ?IPV6:2a02:810a:b98:a000::503d? ([2a02:810a:b98:a000::503d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21ac0asm2053023566b.99.2025.08.11.10.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 10:55:07 -0700 (PDT)
Message-ID: <c8b7c8d3-d016-4ffc-8f33-fe37fead0048@cogentembedded.com>
Date: Mon, 11 Aug 2025 19:55:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 1/1] media: MAINTAINERS: Orphan the rcar_jpu driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Valentine Barshak <valentine.barshak@cogentembedded.com>,
 Andrey Dolnikov <andrey.dolnikov@cogentembedded.com>
References: <20250808202829.2115779-1-sakari.ailus@linux.intel.com>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <20250808202829.2115779-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

 > Mikhail's e-mail is bouncing:
 > ...
 > Assign the driver to Laurent with "Odd Fixes" status.
Indeed Mikhail is no longer available at Cogent.

Maybe my address could be used instead, I think I'm the most kernel oriented person at Cogent these days.

WBR,
Nikita Yushchenko

