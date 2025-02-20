Return-Path: <linux-media+bounces-26420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A82D1A3CE0D
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 01:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B51A174EB1
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 00:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75780288A5;
	Thu, 20 Feb 2025 00:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O+vzltJU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A49635
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 00:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740010868; cv=none; b=mV9V8Wcklj5cFi3jRya03JrQXFkidkFJLIY0YpjeAYMBda/95OvgVQ08LNrSqZm5j9r44mXdHii41JkherckgkWty5dOWXI+TPA6CsLgVzIZAkvb711p1v8FeuwXbmTX3y4eaDhCAYo9tEEeHHMVNMXtF9f7718UP0Xw8gkTMvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740010868; c=relaxed/simple;
	bh=Vafoa5OwANQEFLxHZMa1sseFFv8SirYpi6Kiu/i7pKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krGpVPePGrsHsQ9Ru1p2CvKheW16JCd93r5NaCnU/pKjUtDSNJu3nRiK7kvVyS+0FZ3bT0d5QK5yk83UeMC6GOAKY9KVNxzJTrAyk7vt4nRJ+eGMFqxXXRanMjpZqE7zhv+UnQTxovNPCkOSHz0CZP2KSZXGyDK9hCs6pVnPOg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O+vzltJU; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-851c4ee2a37so27768939f.3
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2025 16:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740010865; x=1740615665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZTXpaO4+K/ihpL6ctYpafi1phHWLap4rLnsZzmvcnEA=;
        b=O+vzltJUlefTFgF7b0RsGfe2O0yWo4bROA9RgBn6DULbR/SABxRcAILlwomCUqPdIQ
         uUBLknsEhlR1/zYLl7b2H44N3Kj08wyx8SYgaExdHNgo2ozuN91xmOG73gJEk7ESfKde
         2xR/p4+dWB+IoCNBAwwlNXhsFvJPbLYn6jsHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740010865; x=1740615665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTXpaO4+K/ihpL6ctYpafi1phHWLap4rLnsZzmvcnEA=;
        b=NnhOSe5iTwgQKdlH/bKctRa4Hjcyvm1tgcAxL7UUu/nsWPksYCflOiXl+8beOcfxyS
         ctuVWOivxU3ThJLoh5sM8S1VTX5lolxvpRck7xLCeMfjuDz7slzI0x3FyaWNtzC6BxOl
         Axqi1Ex/1ezXkt/9Y2uXZhsx5mpzRH9I8NGK9WI+f+Vxb2WrnuxDuqqCgxTu9B/b2gex
         pz7r4CnAJabdW54dkuBoOUt+vKeS9caMVUxE3dSuU26GWSiVvWvDste2v2s0CIsfEnpo
         8yREPpWSPOYdJhC9aIjz0+Dtw2iyxApq2zkkR5fM2gWT3RZZYD9tRr5sIMpJwUuWste6
         Jing==
X-Forwarded-Encrypted: i=1; AJvYcCXfidO337X/9Gm9szV3dYBBU3X5ehleYTJh1RHVnTos8VqIokkuXVEM5hX95XxupSEp3+NQA1QBJJNJpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC68CpsC0g+FgwY5iLu2Qv3h5Aldn119d3NwBujBLY/Ssows8g
	0CExpAJ3YZmulHeKa3DYQrxADGkJEdFAZdhrClkoXb+7qN0UxzX6ib8pTrETHaw=
X-Gm-Gg: ASbGncuaFR+UjSzeG3YxWsDKBNY+zQJrnj3JJD55nXrScKdoJvwMtvyLHnKMGmfpg2E
	p6j6sZai34YBt//tAnbS9UbzIePBBpIFDrGrzT1TawnOu9VZ+ewKFzsqcc2xwgp/fV4oAZ1OK8O
	/kzEhJWMPdDEvWk13ZfUSkLKrV9UBDH2wd6SoGHcQ3XL6wb4wuz/xJgEelVnTvpa01Fd5s5jeVS
	bWq2YC+uTs5q5Ao1hU5WBU73gWuFtzKbvHUDKHhw4vgLmW6Xwwq1HiBG2TlqEuSWj3z2kuf07XR
	JXDzfREUQ03icfbDYt6+kk76MA==
X-Google-Smtp-Source: AGHT+IGOFm+eurbtjTZib2LsV62SpasWGtB732Q5WFUESbn8UR8ZxF+4k+li7iTbV6abcZaE92X7pQ==
X-Received: by 2002:a05:6602:14ce:b0:855:5eba:4073 with SMTP id ca18e2360f4ac-855b38a3ceemr610560439f.0.1740010864882;
        Wed, 19 Feb 2025 16:21:04 -0800 (PST)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8559ad419f3sm130237739f.4.2025.02.19.16.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 16:21:04 -0800 (PST)
Message-ID: <5051c252-f1ef-4731-b0cb-fedfcda04d98@linuxfoundation.org>
Date: Wed, 19 Feb 2025 17:21:03 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: vim2m: print device name after registering device
To: Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>,
 Matthew Majewski <mattwmajewski@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250219190501.295976-1-mattwmajewski@gmail.com>
 <ym5q2cpn2lxk7sarylnf4o3ztvtnb47wroxdiibdsp6yz4gt2y@jfyfo2ekmdmj>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ym5q2cpn2lxk7sarylnf4o3ztvtnb47wroxdiibdsp6yz4gt2y@jfyfo2ekmdmj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/19/25 14:58, Uwe Kleine-Konig wrote:
> On Wed, Feb 19, 2025 at 02:05:01PM -0500, Matthew Majewski wrote:
>> Move the v4l2_info() call displaying the video device name after the
>> device is actually registered.
>>
>> This fixes a bug where the driver was always displaying "/dev/video0"
>> since it was reading from the vfd before it was registered.
>>
>> Signed-off-by: Matthew Majewski <mattwmajewski@gmail.com>
> 
> A Fixes: tag would be great.

Matthew, there is no need to resend the patch. Just send me the
Fixes tag and I will update the repo.

thanks,
-- Shuah

