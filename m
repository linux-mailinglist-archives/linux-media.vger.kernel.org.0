Return-Path: <linux-media+bounces-41373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE95B3CA92
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 13:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8ED73AEA29
	for <lists+linux-media@lfdr.de>; Sat, 30 Aug 2025 11:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D6626FD9D;
	Sat, 30 Aug 2025 11:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZV9ZUe65"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE98317A300;
	Sat, 30 Aug 2025 11:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756553394; cv=none; b=epB9v7a9bmw0pXkagxK8gxnzxLW7TTeO/TpfzC67pNCeqodQsug1sGdyqY1IxflkdaXdVAgN9dkUkmzcA/w78SJunSydFdoPk4v1Q5YS++T9WpQh/eyGCle0OcV3lKSMhk8q4Clo4PT49SNe1OwKcYdQEofygiXLTIRKo5bltY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756553394; c=relaxed/simple;
	bh=G9X+ffv/pVcjrMDC06/3UHjT65P3tPJoMxHTyYH5hdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F4jfoMWSy1QA/ro7THKM/djRFEND5uJtwzTaSbzbSGdoQnVgr8SjHCZa7ZG1+32tE8oMhkXwmZTcmtTL6VpmDtrs9EKTPmuiWti1YhwXwRwCLUdW3xXne7DIR055eDWAGkX3im2oanX7+8lRd+k1wkQJkNmMP1uzbyOGJVFvZbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZV9ZUe65; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f6f434c96so681858e87.2;
        Sat, 30 Aug 2025 04:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756553391; x=1757158191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v3KSsLeobgU/k77KRTAU66n9zoHgmSXJF/tcqQ0GS4Y=;
        b=ZV9ZUe65ZgbJuLST7x2cdYGx8GW48ZnZmdZIYR//iy9WfVu0m+NqXbXhQ0Ofv5f1tj
         cBJmxHj+ULmigyhwvBOgk/Fb4bAuLTwqVBbCXWlHOVHazSYZjgXTaf7VCQuidTL3yYvB
         p3p+3GgcLm2AznFU8f/nIcyw/2mUToahdcajn8d25R+BEiaA+dXwFIwp3lzhuzbplsaz
         /CPlXKMY2BxZBbsF0kqBksyyHktSYFfCbZpmNWin9PdAQiEs4C05UwxYyOiFv2Ejka/f
         8HX1Pb5DaOWDy4R8EgpHpMe+hEEDKqL0UU1fkPzZfDGhlbsrxfYSOwhemig8i9Wo9Kup
         NHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756553391; x=1757158191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v3KSsLeobgU/k77KRTAU66n9zoHgmSXJF/tcqQ0GS4Y=;
        b=CndFHscRYWKs0iESXCSuiyisHfTbxZRErKokrU094wrma729gAJXyAEH7ChuCezJEW
         /n2Z8pL3MgQoXhZJ75FQUg/ZoagO1q1xEHkMj7X/C+Zfd1UyteGDwB96b+cwc9bzOJ3k
         9ivL4vIWRDkbMmUYI9RQQ2/TpuQ2JY1R+rnjJ+hbBxcdvwQWO8RjXTY5umB7OXg/2LUJ
         QCr4HGC7OnrAFBv6J5u4QIi8vKnzyCDifxqG9qhHam950EnKmCH9Fo/d+cN/X0WfpMG0
         dDXsx905xd1GuddcUKvy2u3PJGgSiwMLE3JX13hB7lsgoSCUjamGcJ5uFwq90X2MNzP0
         7Yqw==
X-Forwarded-Encrypted: i=1; AJvYcCWWtd8CxPamauB180D7pWBw+4aYMJuM8W/M9nE9feyzdmD9Sxt9qESGPc5phD82nR9mjRDIJissOETBPsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaUeuWi8ajcTCWZLvSVmeotcvzq9mNQ+7M78KZvxe9kaScgDTs
	K8xlavb16jmbDcVdSeisfqPNCXoLPypNYFkiNi4tSkFXXucjL0UYeQSecN3/slG0
X-Gm-Gg: ASbGncsSPD2vXkE22FAq1UDmZw4OeCYlo4lpIT0r3goxNOCrulywluJ8sguhMJAtKH5
	MvqLR05UH4f4j+R6ZG2fAPa42AKgiJCUYghFwppB50Mz4e89IxNu3G0tSDmAmOYrtrihKYBucka
	UrHxTQA78CdKnddpV7XVW1fYQx5Dusmfa/qeLk27kcjax8InP4rFRg4YCsqDhGdZM+c11vz9U77
	7Pdd5Sty3QBcPjDUpZOU0zYABfEwdHCT3wyg9b1BuTraxDaRo8Eo0Aouh4/vPl6qiG0tlb1Iyed
	KETUyzOE3mlSNkOGoDj97EwpqIprq0TZNnx+aUdXtVpjr4Jucvdl3f+KXTTtB7nLhd+BCDThgLH
	955de+k4YVk3UHdsI4tlwkIf2vfoKht2zLNybeHraMRxby2UROZu53G4c7wufOY5H1da/LHDxpA
	==
X-Google-Smtp-Source: AGHT+IEfnRHY68hhrQsDl3O8dbYVpHPJyZX+vMoQj9lJwxfd6v4LbPOJ0yR9HileQaNL7+lMLpTMMQ==
X-Received: by 2002:a05:6512:660e:b0:55f:4400:f2f6 with SMTP id 2adb3069b0e04-55f70924f7bmr387952e87.42.1756553390566;
        Sat, 30 Aug 2025 04:29:50 -0700 (PDT)
Received: from [192.168.2.178] (109-252-159-193.dynamic.spd-mgts.ru. [109.252.159.193])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-55f677491f3sm1370847e87.58.2025.08.30.04.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 04:29:50 -0700 (PDT)
Message-ID: <11ea89d2-e4f1-4c3a-a2c7-f99170781fba@gmail.com>
Date: Sat, 30 Aug 2025 14:29:48 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] Documentation: media: Document
 V4L2_H264_DECODE_PARAM_FLAG_PFRAME/BFRAME
To: Paul Kocialkowski <paulk@sys-base.io>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250824180735.765587-1-paulk@sys-base.io>
 <20250824180735.765587-5-paulk@sys-base.io>
 <5065e67544ae9255b2136a6cd73cbb9ffd08e3fb.camel@collabora.com>
 <aLG19wzWBBECU6Cs@shepard>
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <aLG19wzWBBECU6Cs@shepard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

29.08.2025 17:15, Paul Kocialkowski пишет:
>>> +      - All submitted slices for the frame are P slices. This is a compability
>>> +        flag required for decoders that only support decoding such frames, but
>>> +        should not be required for slice-based decoders.
>> Seems to match the comment in Tegra driver, and related to a hardware
>> limitation. Shall we also recommend not to use this unless similar limitation
>> exists ?
> I think the flag should only be allowed for frame-based decode mode and indeed
> it would be good to say that drivers should only check this flag if they have
> such limitations.
> 
> Userspace on the other hand cannot really know if it will be used or not so it
> should set the flags when applicable.

IIRC, Tegra dec driver doesn't support decoding frames consisting of
multiple slices, it can only decode frames consisting of a single slice.
Tegra dec can handle multi-slice frames using a "macroblock by
macroblock" decoding mode with a lot of CPU processing, like classic old
hw decoders did it, this is not supported by upstream driver.


