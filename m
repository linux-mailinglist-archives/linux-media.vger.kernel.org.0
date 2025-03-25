Return-Path: <linux-media+bounces-28738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 769E9A708CA
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 19:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47B4B1884E64
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 18:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE488264634;
	Tue, 25 Mar 2025 18:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gHQqMnmq"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742B725E81E
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 18:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742926118; cv=none; b=OlhmCnX4uIgM0b4K+4crovAN2G9Q94zIhZy2hoaT0kI6RMec8rntxRnqYex/3laNIrrLDD7i+rEp6YqNOFoU3vjqWNexlg1t69kTPC+uAcgEL81C11IK6+0J6tl9j3guuTjRQW0BTmhbi2rhDD5W8T4RFYY4/4G3Zn69ETQmt7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742926118; c=relaxed/simple;
	bh=UtqJujxO68tcXEyuX1OK8cqykJPePD3hOskmviiHJA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtaen8hKeGZYvbNwUw35lmHjFj28SH6CFtCXj2EvGJs0LoiZZWEtUPxDactBJmLVtsk/JGYATqDCPBCstwtNNfCk9PVvGOG7pfjE3OLiLgsyZX868o/EHaB2+VrycD5g/kkVLiN4xDB/bWXeJYOkNRLg2iEvNsUVXDmyEQZv5MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gHQqMnmq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742926115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPOxCA9ubhY+ddipkzhr8SHTq3z7ZIgkcfGR1o4r0mg=;
	b=gHQqMnmqFZ8oMqvdo0ljOPnPsL0zMgvttWITWJU/xBX7vB3Z+gWdaZNbe5CskKw+kpuZoL
	ClYO5jNveS3tsgzhFaPwCVCPEnOBUmSji3WzDrNX7O4g3hCBtCxiIMRV4NC87qJS2Z3k3j
	EEsqHFZnkB+XOl2T1HnjpYfADGlrgwE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695--NlEg9mxMu66STlN3KEEXA-1; Tue, 25 Mar 2025 14:08:33 -0400
X-MC-Unique: -NlEg9mxMu66STlN3KEEXA-1
X-Mimecast-MFC-AGG-ID: -NlEg9mxMu66STlN3KEEXA_1742926113
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5ed2a1bfec7so441468a12.1
        for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 11:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742926112; x=1743530912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rPOxCA9ubhY+ddipkzhr8SHTq3z7ZIgkcfGR1o4r0mg=;
        b=NaanP3thGn6yhYGFP/q1DHKHeRzTXRmW8EqNC9qWwxGNAfRstgITcMV3Hz4EJX6cre
         /5jw9R6YIT+Wl7QUyy1MZg5xGzCZOAJ/WPQxUEbu0r3PXDW87E+OnWqLvbTcYI/p9BlY
         piRdFo04bIfr0Un624PsH1PbhiTHZ+JjqhF0P2z1UrDPRWbWvds5+dnRD628pKW12JCw
         wRGvin6c+Wu1oefqVmNj6OeFBzDXC2jL4RCZcN4ULefi5xfArBkw9Lh6/odquJivgzWV
         7CmPKhmCqaQiE5/HnaJANsxVLSm1FN3mVyY9m/0m5G+5Pnwo4XKapWSF+lwob6M4YAfk
         YkmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0xyk4N3BbRm1F0snMhUE95rNdM+bSr7/iSN3fI5Gi3wwc4LlQXozZL5vGxKRFBJfOPYk5sD3KwNntRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz02YgfWCpKXKZd2ZaBNdZ+HJF23+HGPd91AoXMRORKvshmsukz
	iGan4bsrqRRzdDPCV3DdPoOsYM0c30UD0E+l/H7hNwvX+hxwFDizAZ2SfOnuXC0Fc6dRtMho+8M
	KN6kIpHIUIIcUxO6Hhs/DG0OqOQDDJVFerNYT2QkO52CtLOSOzpU9xNNao/X4
X-Gm-Gg: ASbGncvu8mu5oFs2qcUvArVfoyHGQ6Z+1MYA7+AL6475KCt7+VBNWUggrCIoeu3IJrQ
	3lyeMt+ev5rRz+McZJLH60a7P0BUNJikbUSHLbBJWhOR7untq0nxDV8kaFINxr0/0W+8z7VRja+
	wo7irq2RkvaBFGaLeXR6tu7PgXQgXWvCbWUkxAwheFZeX9UCCMLs6PayPNjIDc1kBrNi0JwY2Dh
	JWrSYpjmPCL02Ue9GZArBWTWICK96BAlWqTlXy5dNy7+xXPMGixanmtkYOjXDfNsiuAslGqTc6w
	+RRaU+oZfqalK/Fb//d0PPsdc5ij8gbeFFBo7l1wqqwFHVtA7kEqPyKhwXNAeqV9Mlkuu/viQ52
	Z7GqMg5BMy8ix5JW3oK/SwHO2BTIegxQzzT6IjpkWafHROQPY2KZ30Ac8jfhkONjPgQ==
X-Received: by 2002:a05:6402:13d6:b0:5e7:c779:85db with SMTP id 4fb4d7f45d1cf-5ebcd40b5b5mr13249980a12.4.1742926112484;
        Tue, 25 Mar 2025 11:08:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEii7aib8IjEbEH2O/v6J/CHWr2FB4axs4QRhk1KDzBkCiHNGf0i85PGy/hb91rCrlwRuULg==
X-Received: by 2002:a05:6402:13d6:b0:5e7:c779:85db with SMTP id 4fb4d7f45d1cf-5ebcd40b5b5mr13249952a12.4.1742926112058;
        Tue, 25 Mar 2025 11:08:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccfb12aesm8545731a12.46.2025.03.25.11.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 11:08:31 -0700 (PDT)
Message-ID: <e42d3be8-7522-400d-a8b9-8865c79932ac@redhat.com>
Date: Tue, 25 Mar 2025 19:08:30 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] platform/x86: int3472: Make regulator supply name
 configurable
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Dan Scally <djrscally@gmail.com>, Alan Stern <stern@rowland.harvard.edu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, platform-driver-x86@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250325161340.342192-1-hdegoede@redhat.com>
 <20250325161340.342192-6-hdegoede@redhat.com>
 <Z-LfoxE3VU3Z0v6P@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z-LfoxE3VU3Z0v6P@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

Thank you for all the reviews.

On 25-Mar-25 5:53 PM, Andy Shevchenko wrote:
> On Tue, Mar 25, 2025 at 05:13:37PM +0100, Hans de Goede wrote:
>> This is a preparation patch for registering multiple regulators, which
>> requires a different supply-name for each regulator. Make supply-name
>> a parameter to skl_int3472_register_regulator() and use con-id to set it
>> so that the existing int3472_gpio_map remapping can be used with it.
>>
>> Since supply-name now is a parameter, drop the fixed
>> skl_int3472_regulator_map_supplies[] array and instead add lower- +
>> upper-case mappings of the passed in supply-name to the regulator.
> 
> ...
> 
>> +	if (strlen(supply_name) >= GPIO_SUPPPLY_NAME_LENGTH) {
> 
> Hmm... This can potentially go up to the page fault.
> If we are _not_ okay with that, strnlen() should be used.

The supply_name is a const string from our own code in discrete.c,
which should never get anywhere near the page-size. This is just
a sanity check in case we start using longer names and forget
to update the GPIO_SUPPPLY_NAME_LENGTH define.

>> +		dev_err(int3472->dev, "supply-name '%s' length too long\n", supply_name);
> 
>> +		return -EOVERFLOW;
> 
> This error code is for integers, we use E2BIG for the string lengths.

Ok, will fix for v2.

Regards,

Hans




