Return-Path: <linux-media+bounces-34505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A51AD5416
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 13:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 146303A515D
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 11:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933682517AA;
	Wed, 11 Jun 2025 11:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjlCgm+y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E91223099C;
	Wed, 11 Jun 2025 11:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749641598; cv=none; b=cgpK8NA7idYyIaD1M7QZp/vDqK8YBZ+5SBpIGRCzj+bqB8XKAvsOihFAdMV2Efvx5qGbla+R9ko+Ut/36cFshYxHE7zs408I2HeIiUCUupEQgLwHgK448pAiFjtxPCqgUaHVChf1WcbBe74UcziZGh5Qz9FXM5WtJ7jtDQfLdBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749641598; c=relaxed/simple;
	bh=AeoKYUfqPpxYTwa9dOPzz1NIZa4CwemYCpr69gr9Bbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=juLRgbZ4FCX14ryOREPXDxjaktsYBPnpYdUxu171omA1NGvE6ZOLgmvq5kN1DMWVjxvghHsUr0FFiUEwSXd6n91mtNY8+Pd1YkciAsXA8xh2dnTOJ1y/mzGNx/3/X3Mf70+6bbJXj7ekBuNw7EhpRe8Hvc2t857dGR7qr0F+cwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjlCgm+y; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32ac52f78c1so66789341fa.3;
        Wed, 11 Jun 2025 04:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749641594; x=1750246394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IGE+TNgN8AiJDwpgQ02ln4zwsMtlaz7bMg5HLVNRnrA=;
        b=GjlCgm+yjYqThpdirOiHVeEtmj2EqL9YtrQ32VJs3FzbPYfG+wGbGyJb/y3d4Q6EcA
         xHGBrbynVf+ge0zUxfEhBX6Ca5UGaCUGymK5JaU3Cskh9ljUwoKhJIvUrzKfufrykxWb
         pntgM9muRmcRnqkk7z2s+NfIN0J2IvK4VoR6udmcwra4L4w5iI2wTBAEukhTTrr/xoJ3
         1Ucx6flAZZKrp+SKf1Z13VniPyBP7c0zNVNJUt03H6cXJkkmiiFLFi+iQRhMcpc1N75v
         7i8tPPhtnMgtJIH/CTQsmLstgLGPl+cqVk8n3I5bOM53x2B3MgIPUmXQfxRvq6xFr92c
         PKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641594; x=1750246394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGE+TNgN8AiJDwpgQ02ln4zwsMtlaz7bMg5HLVNRnrA=;
        b=vyVu4/7+gW5J2P9Sou2SEo436O+LYnPr6ZHMAYeojkAQJwiHRsfJJpjNFPcC1GaeDd
         Cx1U9jtEYGXoQFBv/ensFGCHEpjUmtV1iqNyNY2KJYkrn8BJqwpiHot7lMfmTE6ZxKyp
         mWhquE4cOktHMuBGqnPW4fFJc1mMcaWN1UD6ZhMQqaQPtXjtUc/lQCVZkEFKMWDGQn9L
         aEmYyvZVYklM1Fbf3qrXnA/egkbhLP03LyPKFNcQf2rAcLgISGfXgTPXVGl+SCQIDIm6
         SEcNG6GdCKM3TIOX5zgZ0q2LXNu/gF+s+IVVwiBzc5Dspu+pOtMDBL47MOs8p2OnuUK/
         KczA==
X-Forwarded-Encrypted: i=1; AJvYcCXqP26F1a5a/uzxcAjG6Rniv4W8WdSImVHfzw2yuFHgh8dJ7WMqP7ULvsrx0s6fSbMmVXiWoPGt9LZFX+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6SdWs0SWRBuJEkvROUJGqvMcoLBnn9MxQHZmHogwpXyRMe8I2
	i8L1ZgJGVLNXBls71uWpvRzeS3Lpa0mIOTtCdqaNDSpItVPn4kHr52id
X-Gm-Gg: ASbGncupXANo6Prp/jgaCvGcdgBTqe6g5W32NDmE9rbWiijjfRRO/m6rv/25yiHxo9W
	s/0vGxSgg31YI2Bhf0cVBB0bZggi+loaYBFsVLtqPbc91vhQIZK3FhbeumHvuPlmM05La+Z7ygO
	lVIGsWD408Ym1XmnqGGkexDB3HY+W7hVB6mbcLZSDC61NfeBOOATdoeB+/gZmnNE67f4hAeB40B
	xI/LueSBjzKXa3hDBcA7Y2ZwpCeIcWLkyz/USUlHXcANx9zcWXdrFMNsVhmC56lGkYjvqg0h8Yj
	VoOltGnQJ2zt5TaxwCi0EM/Fy5tV9mdOQr5pQCm+AgK4R45s7BNjSIH5qGHk5VDg+pZU1zCAJ87
	E6wGgffXdGZ1RQdsB2cHGtqzP+2wHk9CWXWPvTebegVZ1IkTbmQnqY7W5CYEhUufsrhrWWcDqrI
	jtG5v9VrLhXpxVuFI+0QauD/du
X-Google-Smtp-Source: AGHT+IE2kzQKVgzgwd3yt80d6uhyHJ6VDdhEtsKW+aItli5kCRdPijQS2jEZ4uFGLbUyM9wZHtc6gw==
X-Received: by 2002:a2e:b887:0:b0:32a:888e:b30f with SMTP id 38308e7fff4ca-32b2227dce0mr7598041fa.6.1749641594023;
        Wed, 11 Jun 2025 04:33:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:6e:3100:d134:143d:95b6:6d13? (2001-14ba-6e-3100-d134-143d-95b6-6d13.rev.dnainternet.fi. [2001:14ba:6e:3100:d134:143d:95b6:6d13])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b0cf7fsm17713801fa.12.2025.06.11.04.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 04:33:13 -0700 (PDT)
Message-ID: <5dad612b-495b-4f1c-82ff-e8ed4ef34c07@gmail.com>
Date: Wed, 11 Jun 2025 14:33:12 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] docs: Improve grammar in Userspace API/DVB API
To: Bagas Sanjaya <bagasdotme@gmail.com>, mchehab@kernel.org,
 ribalda@chromium.org, hverkuil@xs4all.nl, hljunggr@cisco.com,
 dave.jiang@intel.com, jgg@ziepe.ca, saeedm@nvidia.com,
 Jonathan.Cameron@huawei.com, corbet@lwn.net, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, W_Armin@gmx.de, mpearson-lenovo@squebb.ca,
 skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250522115255.137450-1-hannelotta@gmail.com>
 <aDAOhl7gKhkcTEjk@archie.me>
Content-Language: en-US
From: =?UTF-8?B?SGFubmUtTG90dGEgTcOkZW5ww6TDpA==?= <hannelotta@gmail.com>
In-Reply-To: <aDAOhl7gKhkcTEjk@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/23/25 08:58, Bagas Sanjaya wrote:
> On Thu, May 22, 2025 at 02:52:52PM +0300, Hanne-Lotta Mäenpää wrote:
>>     #. On Satellite and Cable delivery systems, the bandwidth depends on
>> -     the symbol rate. So, the Kernel will silently ignore any setting
>> -     :ref:`DTV-BANDWIDTH-HZ`. I will however fill it back with a
>> -     bandwidth estimation.
>> +     the symbol rate. The kernel will silently ignore any setting
>> +     :ref:`DTV-BANDWIDTH-HZ` and overwrites it with bandwidth estimation.
> "The kernel will silently ignore any :ref:`DTV-BANDWIDTH-HZ` setting ..."
>>   
>>        Such bandwidth estimation takes into account the symbol rate set with
>>        :ref:`DTV-SYMBOL-RATE`, and the rolloff factor, with is fixed for
> 
> Thanks.
> 

Hello,

What is the best way to send an update on this patch, now that patches 
3/4 and 4/4 have been applied, but 1/4 and 2/4 have not been applied?

Do I send v3 for the first two only?

Any guidance is greatly appreciated, since I am new to kernel development.

Best regards,

Hanne-Lotta Mäenpää

