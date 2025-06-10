Return-Path: <linux-media+bounces-34392-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87116AD302E
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 10:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E107172C59
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 08:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10FA280A4E;
	Tue, 10 Jun 2025 08:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GU+gztvE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C26280A37;
	Tue, 10 Jun 2025 08:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543860; cv=none; b=k+a2efe3FOqoim9hiGhu3TamkQyH/kO/uynwMKMWvRDJtFtOvNNXOx1h6RCpvF31v/+5K6O+SS+4nNOYUVqoZtfs92Lyo+Tk7eqBLWX3wg7U4oCOp/c5gl2oIU55hx36n1gUfysA/GphmHSOt4kVHW7qM1qveE0u3WUxydxZkXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543860; c=relaxed/simple;
	bh=pAsKoCKXcR3vaJATLO0yUatret5jy2iUb6ibmnbLo24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BITfoWl/tAw/juK3aqWs60QodIsskSQcdh8zA6K6xdAt80logT7OxcwIsfh9oCEuPwCkFIP3xi6C/yCjThuIjNVyoeydyr4iooj8jZVtbwFCeiTZ0VSyedoPYzOVI70JROJX2as3TPlUMZt1wFyXsbb1IN69G437Wo6/noUF714=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GU+gztvE; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b10594812so5687735e87.1;
        Tue, 10 Jun 2025 01:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749543857; x=1750148657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T9AMyxosltlXeE1Hh9H7o71Re+z6nz+UiGufyzU5brE=;
        b=GU+gztvERnZ3ryMvivsxvTdjYHz4EoSTmAwCXKS/uOjFWZ/NGQFX6ezgTgyx9NV9ZK
         FiyB0b2QK5Uj2KLE01FceGtUSRxRD8i5SrtLjvvwwjgq1Il5D7xq1vi5z38opcP7oWFB
         YIXILj34O+5tX0s+FGZJJRSb2xhawfn0HAlGPwZOAzE0dyM0X5y/oKyzeEWADecZwUvD
         28ceFb+P7cd1Ifp9sP7U9uJlBrlREaMa/RRGkdQMbueFYKKDp3lmWqGGt0Cwmj9zQ9AL
         tdVM6kPXSYOq7b/y5eFQ+xm7Hh/DODd/pw8M9qqruRCC0aB11EhgGuCp2zrR/CaDzEqG
         ZX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543857; x=1750148657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9AMyxosltlXeE1Hh9H7o71Re+z6nz+UiGufyzU5brE=;
        b=nk0XR6di+6TyOEaW8aU3XY3dnyJC2aN3Dvb0uk4QeCg7noD59M4VHz8tw1sSh5d88C
         d18lGqoDeSSBuzdSzm2IkJCxLjvDsLpmf/mfXTioaGx4FMk8/oLenjqoIo12QNeIzd5V
         aMBCNu1x7wLNsf1N+RYUEpyg0vsLiaED1FmBeClbrj+uY5WXcsNdkam3p9nn+brSOX4I
         CXZNhMVs6rlVe9XahZaK0wlPikhK0ZF3Ha7ztPt+0o3s6cUduNZ4P/sw0J67otfh/8Cf
         WQHtybTp7ejppz7XOAqqWfSRgOYAYd0KrPs8eRwDaZl/IjgfhfMfODCe57AqF/Fk8Pnb
         4Xww==
X-Forwarded-Encrypted: i=1; AJvYcCXfNlEqHVfSoxSOYXjdtl9qyGRYaAey8AAJe4J/Z8UYZT8uQN3JNfxTbAgrwtvZOdwcHYp2lRbBf/TN9Mc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2S9D44fQCo6QjV1kfFBnJfO+EtzFPW7sY62ODBQ/fBm/3CndH
	ZGpcyFyQ2edjkroxj4kWbkAbaNkV4kNgZqvKnszUQqEGrgMH3YuBU5pQ
X-Gm-Gg: ASbGncvxteQEP317KUVs/PXrG9O9hXHurky7Leg4JnfH5dayUt/V2d2jcjGA/1LFdWa
	sVOJZCwfriyDBo5+u6JJ5ropXW5SuQDQh//oQjwARWP1I0yNIZmcbfI8mwLQOJoAQdaSbZkgda8
	Onz8TBT6c1DtyZvW43ML/D4TQ18ud5eIRcAOVOA7YUl9ST5LexWa7B9AxDTPP1IA2iHZlsZeFiD
	g16WZZhWdDK52SXaa3goemZHJ0Z5Uzl3/5c+1OjaOMTNvBDJIhG9njZUiqj9YOR6JQNSvzzaqVG
	MNFLXXDfrVLQj53IfNfCzrFRMBRSopaUTXDUY/7jWhUCHcjKbB4YqTEJoO810kf36pdC6bPNB7f
	RjuZK5C0tdXWbNF0RRJHUz8QeoloQMtVCpvVkGDlqprH0TiDh32YC6Usap+TAYndG9XRzm2XFB3
	bqqBb6dFeA7Dgb47TMQmZCD04=
X-Google-Smtp-Source: AGHT+IGUqa7d/RWtxwnPy2+NvYt1LQ6wiXuu9PiIBBS0TGg/C+wR9GtyuBkitpRQ9RBLougt8hAvLw==
X-Received: by 2002:a05:6512:401e:b0:553:2a0f:d3d4 with SMTP id 2adb3069b0e04-55366c1e102mr4244672e87.49.1749543856354;
        Tue, 10 Jun 2025 01:24:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:6e:3100:dbdf:2d4a:ad23:d037? (2001-14ba-6e-3100-dbdf-2d4a-ad23-d037.rev.dnainternet.fi. [2001:14ba:6e:3100:dbdf:2d4a:ad23:d037])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d7622sm1443650e87.58.2025.06.10.01.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 01:24:14 -0700 (PDT)
Message-ID: <85f0fbb6-5574-47e4-9adf-89eb27fe9f62@gmail.com>
Date: Tue, 10 Jun 2025 11:24:13 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] docs: Improve grammar in Userspace API/fwctl
To: Jonathan Corbet <corbet@lwn.net>, mchehab@kernel.org,
 ribalda@chromium.org, hverkuil@xs4all.nl, sebastian.fricke@collabora.com,
 hljunggr@cisco.com, dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
 Jonathan.Cameron@huawei.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, W_Armin@gmx.de, mpearson-lenovo@squebb.ca,
 skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250522115255.137450-1-hannelotta@gmail.com>
 <20250522115255.137450-3-hannelotta@gmail.com>
 <878qm0aab5.fsf@trenco.lwn.net>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <878qm0aab5.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/10/25 00:12, Jonathan Corbet wrote:
> Hanne-Lotta Mäenpää <hannelotta@gmail.com> writes:
> 
>> Fix typos and improve grammar in the documentation for
>> fwctl subsystem.
>>
>> Use the word user space consistently, instead of having
>> two variants (user space vs. userspace).
>>
>> Change wording of denied behaviour to be disallowed
>> behaviour when describing the interface.
>>
>> Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
>> ---
>>
>> Notes:
>>      v1 -> v2: No changes
>>
>>   Documentation/userspace-api/fwctl/fwctl.rst | 30 ++++++++++-----------
>>   1 file changed, 15 insertions(+), 15 deletions(-)
> 
> I've applied this one.
> 
> Thanks,
> 
> jon

Great, thank you!

Best regards,

Hanne-Lotta Mäenpää

