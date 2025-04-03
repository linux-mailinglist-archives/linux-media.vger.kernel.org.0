Return-Path: <linux-media+bounces-29306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE957A7A03A
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 11:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3632A1895BD1
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 09:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9643D24502B;
	Thu,  3 Apr 2025 09:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F+yW9LCF"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73794242914
	for <linux-media@vger.kernel.org>; Thu,  3 Apr 2025 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743673421; cv=none; b=gWHfgI+a9xwpZFsLIsHygHR/oY6eT0HpI9wG5JiSm6RWZkqS9Mhp4Ma25GWVA5olg/Ocyb1NWdlh1CKFCpTZECFtvWv4WR9+QwEmVE1tsugvQ8B8qP1IB/ikYrsnYDKZKOHocvAW8/J4Hsrok8Pj3KEzwqmhK8/GqShlHrM76iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743673421; c=relaxed/simple;
	bh=v8ilmI592V+xwyPk7WS1ZX+wOm0r7ZxorpJ8b1C6pnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YSCOw3fsQZRLGfOstBboFegwBP5KZqipARgTUfgjfau2EuGJfuwwQgGMwQIVkCfdJutZnJqFyIi1mndVOjgQZlWDE9A270fOU7UF2WddDSWr5SMLnKxq6OAlbum3lPTp6ri6zGppTnamsn32ckgaKoJ+us+NOSlbaC12mnbo2Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F+yW9LCF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743673418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Goin50SWeyCOwvGGYVPwfg6NtKqtKC6dQtyLDWJYI80=;
	b=F+yW9LCFRe2Ls1m3Qpjw+XMJyRG3xFtdjjJQxIwanoMZVso0c4c8t0+DN25xmEnBTk64TL
	ZAocjA+6WWc4Ls84S8okQ2w8IX6JBXsb9D/779nxs3RHXoc9uV3Q3iKEqgydMfYJd+jYdA
	xc2IhGjB78IJoWuQNMpkO1o9yzN0IMM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-tUDkcKbnMPGF9VA7ZZ0v8w-1; Thu, 03 Apr 2025 05:43:37 -0400
X-MC-Unique: tUDkcKbnMPGF9VA7ZZ0v8w-1
X-Mimecast-MFC-AGG-ID: tUDkcKbnMPGF9VA7ZZ0v8w_1743673416
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac384a889easo165357166b.0
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 02:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743673416; x=1744278216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Goin50SWeyCOwvGGYVPwfg6NtKqtKC6dQtyLDWJYI80=;
        b=FKb936cXvZ8B/SoonbC58xWs786Oq2kuNQWGanRoMdwYqO/ORlMxU1Mii/BuVbE7GI
         mQMSWaDbd2G2Ln6rxEWxbPNbGIWdXxay4WEVRMKeiP6mHJSPbjxNQx7B6hCK4JnrApI1
         SmSleL/1EK/gClpBwPrPrX702229rlpZNxgHT4Dl3gubmh9hlapIuVWdvZ+9vxeXelfR
         gBMeJgJfXFMSSe3euaBMHd4cp4z7LFRl5swmwz9++GhoL6ocssTvsk7df7wjH1hnlPg0
         31LO8GQoYiMQ25ikhRNuNJB+l7dYkpl/qkp3Lb7gS9T6WXWYzGpmJhrWl+FkhZqMBvQ/
         1RKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAPB/t3ovm3Oava522kIlMmzX6HcVm2VmaITCKJdQlePSDbYpZNfbBUUL8k0d3VfHkpKrLYtO3lBx1SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YysjHnrCjWmRB2qVp58baUILpG2dUU8WEaG45qy48WvVtkip6ab
	c+7MST9oa6AhJlPIsWMXCRDj65UNWxPd/VumGRZhjpw7PY+WGgA2sy5RFZFV204OQxmleMzM4gl
	mWAJu7wV6W37nf0iLrILLLFi6JyfeOYhc//bIp16RhTecZIKARrzYlfKlXO8J
X-Gm-Gg: ASbGnctAHHt3S2NWu28X7iriBhYj7QVuQIv9V9LOMOUlbv5cTtJ11wb/qnvGqN1dvak
	qVrzcCSogmfWSes1P9seUz3yqYEipMs0JmGNsBwym1KEXqgfON60T1AJOxTK1KhyNIhMIAWz8EC
	gx5RyTgad3UzAsl1tr5s6u7Jiswrxxd0e42uB8yK0MNvs0Qm/7PV2xxOcUv9t821CSdtd6+cLXs
	WDlGUv07BuB9K3ebagO6z0FLHBAZOJUvQh2pZjwLpvilkL+nZDA/KiWnzfoyp1YY6et6Cj610WU
	Kwfe8j6CannUGma9vg7u09vBGuOeCNWFgHEKIlAyjnyuax+KHjux0GUdr9FQ55g4lhMLDkjsSGa
	23p7/gWitpXf+VQ7K0waBqGy11b7Fj9Wl5cLS1vcBVqWNzfIcGiBuM6W3hdb/uc/4tA==
X-Received: by 2002:a17:907:1c90:b0:ac6:b80b:2331 with SMTP id a640c23a62f3a-ac7b6b486aamr212130766b.4.1743673415725;
        Thu, 03 Apr 2025 02:43:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZofBNIv8kjGjHbd5+LEA3qJQ6UovrE8gtp60Nk4m0SPj23PzTUOBJTvffRTXHgFwVRLQaYA==
X-Received: by 2002:a17:907:1c90:b0:ac6:b80b:2331 with SMTP id a640c23a62f3a-ac7b6b486aamr212127966b.4.1743673415292;
        Thu, 03 Apr 2025 02:43:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01bdf2bsm64019166b.162.2025.04.03.02.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 02:43:34 -0700 (PDT)
Message-ID: <474fe098-3cf0-4207-92a1-e033799a04af@redhat.com>
Date: Thu, 3 Apr 2025 11:43:34 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] platform/x86: int3472: Avoid GPIO regulator spikes
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20250402202510.432888-1-hdegoede@redhat.com>
 <20250402202510.432888-7-hdegoede@redhat.com>
 <CAHp75Vcok+-NPEGKFbZawiJcjhgJK5upbyfXfCEtezYiMspvRw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vcok+-NPEGKFbZawiJcjhgJK5upbyfXfCEtezYiMspvRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2-Apr-25 11:04 PM, Andy Shevchenko wrote:
> On Wed, Apr 2, 2025 at 11:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Avoid the GPIO controlling the avdd regulator being driven low or high
>> for a very short time leading to spikes by adding an enable delay of 2 ms
>> and a minimum off to on delay of also 2 ms.
> 
> How 2ms was derived? From experiments or is there any other hint
> (Intel published sources somewhere, etc)?

2 ms is the minimum time ovXXXX sensors need to have there
reset line driven logical high to properly register the reset.

So that seemed like a sane value to use here to me.

> The code looks good to me
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Regards,

Hans


