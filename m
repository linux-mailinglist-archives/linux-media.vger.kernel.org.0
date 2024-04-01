Return-Path: <linux-media+bounces-8301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE03893B05
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 14:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57B0CB21756
	for <lists+linux-media@lfdr.de>; Mon,  1 Apr 2024 12:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CE23D961;
	Mon,  1 Apr 2024 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="fEIS6676"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC0331758
	for <linux-media@vger.kernel.org>; Mon,  1 Apr 2024 12:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711975180; cv=none; b=VE66SmG9XGuJfGcvjrQutQzMiXe7ti/OaL+T9T5+J0H9tyesrxKj7TsH8Vfxj3bOkRCPXr5QQAcn+VwmDqeZRj86t5eFB2Odi/WxlJpYI+Qm7yWvizGlydjQd0kZOZJRXWyrJ9cm9jGB3zIo/XKDDJaB8jhXvYTZPJWAWjCQ4Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711975180; c=relaxed/simple;
	bh=4dIUD4SFfz0KSuYeHWu2YBwd/u60LXMWHEiGpv+uimY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=idbR1aIpkzkkLZIMz0AfKQJqtzDwUyOVLJ+9yB3VH40iqVOKFgor9UObBGagjvKjy0dARUbo9MiyZ5R1fXemF0FUwdhIz3rGUzR4cVhXqm1OczzHNictbszHvJWno61hNT1HiTyoAtEdzDaDAMD3wcWrh78y20kVGp1gGa0RTkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=fEIS6676; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-343496f8b80so835181f8f.0
        for <linux-media@vger.kernel.org>; Mon, 01 Apr 2024 05:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1711975177; x=1712579977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2EUwRDkkeNDukcge3a1iBvqeXFfUokc8SHBEfVM2e0=;
        b=fEIS6676hQ9MTImdGyLXC78qGVcwKFeLVWWndpy5OKdqyNeyXwfkWpfKH6pQCyQqyh
         2rynjQvk23wWwnilJLDL4GAm+C43Q5SoojpH3n6eHiDN9QBHiajeskj7bfnHs0lNoPpN
         gNnh+eTWV/QbyDMs3wbKU4eFOiSx6q++aEVzkQ4HJzkOHjUkFXSaRC0+Yx2Ax61kuzJa
         tdlv04D4lDAadloXhN0S+BTmnAP17N17mk3wOrq97sJlGl44QvV1kcNr82NYcZzq/eIn
         0WPZ2tyZ1cRGxrUr7+Cyb6dMLZwZvzD79QkCRjWTnyTXHvKz+qnEdEbda/FD76/HbxQo
         +rYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711975177; x=1712579977;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H2EUwRDkkeNDukcge3a1iBvqeXFfUokc8SHBEfVM2e0=;
        b=BmVsraMHdeGpdeOZKyW8f1f2MbVwT1RIrGqb0oufzKJdCVKlplGbmkldV+d8ru4wFy
         hiAxTVRTmXBZfoqZfGs9fiE+wx3h8iQavETndgs8+zxrF32CN9JuDafIGxXrvAXLR+2s
         56XgviyAMaWpj8GVgkVRyGKUCXLlBIiAYp1xATyeTZk8+1Ebx/HuJt9RwgoWVVjpS5ce
         IWaayyZJJI3ADWoVugsH9IMIo7bWx43ESZmP/pfBA7LUHtDcLxafc881Zwc4HqnC5DZN
         unMke0EwcYiuQn3/GSEUs3VsGBLitZb3gH32fNCiipE3ZLXEEzB1uNf+3u0OJX3/O1Kn
         /SVg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ/WfwNEokKuaKjrgZ4o5PZvnkTrlVCUtJdi5dc3cKDlT9t0UGo19JnnccRD61V8lqJPn5Ixv7tKW8qp/x4bKFYsMZT/+QuoKjuMY=
X-Gm-Message-State: AOJu0Yy9dVn1dy3f3XaDiVpFuU3LHOk+6mBtyD0aHHzMflMsZrMoOTF5
	VI69eKZjINojJ3qbkmsEgNZV+jNKwJ8zM0Jj997vRZHAZ0enVduzOISixYvktxI=
X-Google-Smtp-Source: AGHT+IEUsV4QyGJ5s7eoDrQbcC+vTg7j36Tkp+hsSatBFYgXS89bO8YfYY7FFaMQJP+SiVLtsTp+Kg==
X-Received: by 2002:a5d:598e:0:b0:343:4c43:b38a with SMTP id n14-20020a5d598e000000b003434c43b38amr2695374wri.17.1711975177452;
        Mon, 01 Apr 2024 05:39:37 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
        by smtp.gmail.com with ESMTPSA id ck5-20020a5d5e85000000b0034349225fbcsm4284757wrb.114.2024.04.01.05.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Apr 2024 05:39:37 -0700 (PDT)
Message-ID: <9a063c39-6d2f-43c3-98b3-e4f8c3c6e9c4@ursulin.net>
Date: Mon, 1 Apr 2024 13:39:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Do not build debugfs related code when
 !CONFIG_DEBUG_FS
Content-Language: en-GB
To: "T.J. Mercier" <tjmercier@google.com>,
 Tvrtko Ursulin <tursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com
References: <20240328145323.68872-1-tursulin@igalia.com>
 <CABdmKX3V3HGA4mNQvqHqhcLqyr-A5kJK8v9vmuDybRvV-KsiOg@mail.gmail.com>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <CABdmKX3V3HGA4mNQvqHqhcLqyr-A5kJK8v9vmuDybRvV-KsiOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 29/03/2024 00:00, T.J. Mercier wrote:
> On Thu, Mar 28, 2024 at 7:53 AM Tvrtko Ursulin <tursulin@igalia.com> wrote:
>>
>> From: Tvrtko Ursulin <tursulin@ursulin.net>
>>
>> There is no point in compiling in the list and mutex operations which are
>> only used from the dma-buf debugfs code, if debugfs is not compiled in.
>>
>> Put the code in questions behind some kconfig guards and so save some text
>> and maybe even a pointer per object at runtime when not enabled.
>>
>> Signed-off-by: Tvrtko Ursulin <tursulin@ursulin.net>
> 
> Reviewed-by: T.J. Mercier <tjmercier@google.com>

Thanks!

How would patches to dma-buf be typically landed? Via what tree I mean? 
drm-misc-next?

Regards,

Tvrtko

