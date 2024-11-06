Return-Path: <linux-media+bounces-20989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 564D49BE166
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 09:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E9CE1F24728
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 08:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97281D7E41;
	Wed,  6 Nov 2024 08:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zc3Jx98i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708381D79B1
	for <linux-media@vger.kernel.org>; Wed,  6 Nov 2024 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883338; cv=none; b=XgtHao4BV+l9Tmk6TAUPSbM66DLhhc4lmcrEej6hKaMgwXlhswo0BR9Z4bAJrM4JcoyDfjGOYUu4H07crh0k+bKU3G+ICugsQGRnwqxU4eta7GQFSN0xWIRLzvXVKL0O1mkEFQIwEl27rwL8xYsADpS1pXCDFVhR5mgmjattbac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883338; c=relaxed/simple;
	bh=RPeOW6JjcWWwZ1S1ebv6CPfR3HHN34D3uavDPO5es/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tBylZYr79HMedcHD7k0oOYfBw60cKMHQYYWKsI8Xt+l7hmaI/OddnjZd6rhXfksdR+QA24oUMb8vx570i8Pqzk/sfazS5ACJ5i2phOI/Dm9y3S74gzn8vA6/h6kGE/C7Nypj0LiNIrY10AnwFjPNvB3meWeF0VV6oplhiTPyOTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zc3Jx98i; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so57229025e9.1
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2024 00:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730883335; x=1731488135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=67sx1Y1wKCzoPTnnl2N8Wzyq6odgyZJqwZygVCBaBO0=;
        b=zc3Jx98iqbcKxGwFfQhlwRib/WmC/XVyV0TGoxI1VuJmxbRt4ZE6S9YZ/Py9k64J1p
         MJVEJvjCnNHrFSobmfoQZccgHczmdi3sArMQnnyY+jd5vdSgxITcKMOcYjqUC4EDCx+8
         GROZYXNtzVIWtlnapzApDheS0VtNustaWsX+jv2b7iaw129bvEe6sqBMfx5pChvOm8IW
         UYyIBM6CcBQvKf9uHkLwL/WJeuTuqbL0RWv+zDDyGJ5sqVllWbj+14MF2KwSLfonKBXU
         Ys5AnSrcXWcVfyQ8EePPsQnz7kM/v5MYfbWRR3y5UKNpCSCrAJ8fUAh3YKpgk8XHpjV1
         ji2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883335; x=1731488135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=67sx1Y1wKCzoPTnnl2N8Wzyq6odgyZJqwZygVCBaBO0=;
        b=xMYirq3X5GIamdWWZNyOu35SwvNHTyle+ikwTvIIVje9fYcXxzYxeakiePOr/4JkFr
         f9Aophc2MOHJ6mesBrjI4tt/AgPkfGlYjkM4Ae5fVFsup1u/p2Bc0ZeBM9PMF2y4LJ2s
         rM2N2fwv0zyDAqhfFRFeizMhwh6VhTFbcuZDXd/TMGLY7/bC/0TM7Dx2N3b3Pt01jeit
         kWEGQZOg/mDFkRfm2MA7AjavilvNTurgHaMgesrthDArQLApssbv2gqxaedXVCFVi14z
         t+EMqYmuIaBYCMDd6YQvjRJPeLIMmViQE1PxBIsn9w0TU7GsV/tFiIVvQROxkXkbnlwB
         Glig==
X-Forwarded-Encrypted: i=1; AJvYcCUlciaQLneDFagaBuGxyru4Qm5OMVW5dirvH+eNvxVxSEosLXA35/ck/abbQK9+/SOb4zGhfMVA6qU2Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEEhwiqWYOLoiMUbUS5hlzMz+Iz5+J6GAvEdbM9wPkTkf1r35M
	1HUW9IyqXyx4yE1vSje3VsXJbDi3Nr0BaQAhki10/Iaq5gLKAt2yIs/Zclc7DRE=
X-Google-Smtp-Source: AGHT+IEH+sSIkQjUc7ZZPWiLbJDj+c7I7tp0kJoxZGOA4QqPNBDd118edSTVTyW2RiryWuzndVYKDQ==
X-Received: by 2002:a05:600c:3b9b:b0:431:5f1c:8359 with SMTP id 5b1f17b1804b1-4327b701504mr179285345e9.15.1730883334825;
        Wed, 06 Nov 2024 00:55:34 -0800 (PST)
Received: from [172.16.22.254] ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa6ae58dsm14384805e9.2.2024.11.06.00.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 00:55:34 -0800 (PST)
Message-ID: <69aa0936-272c-444e-bc10-cfd9e6f85453@linaro.org>
Date: Wed, 6 Nov 2024 08:55:33 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] media: videobuf2-core: release all planes first in
 __prepare_dmabuf()
To: Tomasz Figa <tfiga@chromium.org>
Cc: Yunke Cao <yunkec@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 kernel-team@android.com, William McVicker <willmcvicker@google.com>,
 linux-samsung-soc@vger.kernel.org
References: <20240814020643.2229637-1-yunkec@chromium.org>
 <20240814020643.2229637-3-yunkec@chromium.org>
 <ee2f1ece-30fc-44e7-bf36-1c6c8f04301d@linaro.org>
 <CAAFQd5Dpd-TdGwTRSmoqHd4xCsSQuPuL_V11nGXrZvS9x2G=2Q@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAAFQd5Dpd-TdGwTRSmoqHd4xCsSQuPuL_V11nGXrZvS9x2G=2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Tomasz,

On 11/5/24 5:24 AM, Tomasz Figa wrote:
> I think it should be fine to just move the following parts outside of
> this if block and then call the buf_init op conditionally if
> (reacquired), like it was in the old code.
> 
> Would you mind sending a fix patch (with a Fixes: tag)?

Not at all, thanks for the suggestion. Will test and send it today.

Thanks,
ta

