Return-Path: <linux-media+bounces-50986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A39C5D39831
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 17:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63B0A30145A2
	for <lists+linux-media@lfdr.de>; Sun, 18 Jan 2026 16:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C8723EA82;
	Sun, 18 Jan 2026 16:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="DmHNcuU4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62CF238C16
	for <linux-media@vger.kernel.org>; Sun, 18 Jan 2026 16:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768755518; cv=none; b=nqXizzYxNH4TN1vwCn2b48KzwSCAAN40GafrggVowLLqybdhLL6BJnqulUiZibBFMzQYTm6YInFx59Zf8LX2Mco9aMu5+7QLC2F6z1+2Zljfeb8nXr9cLJPvAg8DcsToyqF6mT/+CXm0NsnuAWdYGVGOKASkLMLLfNOpff3sXJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768755518; c=relaxed/simple;
	bh=0zgzcjV2i1ItPBygPoRVnUl5OQb076Xxb+6J+rVvyEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dO0TpXrscZyeH0gqQFfYkboiq6XRdjm8ZiYt4Je9UryIN9wzppNzkNFYZpUteHNQIp88jVpIDJffslZKB0OEi8TubBi6cy3XDE6DFDTA1px/b+VAQHWjVpHBUZLuMIrIcT22WerSd7XOOoPUJfF87ImvIUoRPt5zhLppNhtGbzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=DmHNcuU4; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7cfca52ac2dso2336717a34.0
        for <linux-media@vger.kernel.org>; Sun, 18 Jan 2026 08:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1768755511; x=1769360311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bv4mJ1WA5PkVw1gpZVpA4eWj7mOEd86WM3sQnHXBrw8=;
        b=DmHNcuU4PVnAPaiWx6NRchE8bFg8F51gLEfrlEZ6dZ8nBVFgeoVl9XugpnXo3UVJr1
         upoyGxbOp/F8mqACk8Q2KGGpmyBJoFhrlbyJDlEQew2iuCW+lQ91F19ETQ5VpsI7uKXx
         lFkxoSEIeLbW0wxoS9YTrSxoAs/YWYaQnZK1nlXgFbF2MTZOwxxPMQwm0CLH+sO1Rdq1
         gZmNAuUJgF4qtB9W6i7PM0/JdYlcrRjfz+ZFv1CTrfEhiT//YkIGUJLVawKD/sHYertU
         vO/iYFEVLttjTVwcEwCQdBuE+vwsxa1J1u5thtSi/pMwkbRNCCY26TkHJeoXAKU48akK
         kTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768755511; x=1769360311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bv4mJ1WA5PkVw1gpZVpA4eWj7mOEd86WM3sQnHXBrw8=;
        b=lV1GGxn5+lcmnsxHqqxBDZL2TznXCCDzNcsya6U1ugfoO7N72kB03lm42OKGyfjQ8G
         JceMOP7rEM+Lebbhdn5jP63u13qMC5bdaMMe2nmBJX6rP7DEjju+zq98pqW/c+X9dE++
         gnG7RODrWbMQgPnmkTBT6WAVRuCTZCzN/9OGI+skAmtc53xgm9DVLkFJalL01HvMS0dT
         9GwZi520M7bGfe/ZgnRkO+8U4nN3Ol44c5jQAde+mJ6LXUVhK/mmxEEn/ZmPXxZ4f1Rf
         qD22vYOsvdoxjeCXuEXk5QNAqNwb7tnbqqwhZnoFBp4qbSYLy45jBzefwfnr5HdOXiNw
         bnCw==
X-Gm-Message-State: AOJu0Ywb8Lwv/HZg+dI+OL/6wSxYO150Qtsje45rFYWLTQ5iBb+nQ3jP
	KvoAf4MG/zNRpwNa8/OuOWnybXpzoSqlFLIQROAc19mo92DgNCdTLTFYWlx8rIL+if0=
X-Gm-Gg: AY/fxX62336UD5nKkIOupZGYiZCKk0jdNtJC9ScgtLkyBQMgTkKBWeyegd8vLzMVRTC
	zME/0qng6W0001elYy5SE0Lo+T7/p+u6hiCYvXLZkOQA4GlATUpR09Sa7C8Cov2mebk4oLvQy0k
	CF5fQBMfEZzbuFcJOIcM8H+oSm3otcHkl8Tq2OfHhpyYmFiFlZCYgR8+BQfWRl7KHfzGr99fEq1
	43L0n88XjlOITSVTobmu0bH9Hr/HY+RciAQMKBQAZy3mD3frnsYmZacteneSjS3bBrkfZXhWz2M
	+ZrIxMPqhSUDd3VQ9Ishn6gLZxJm9P/adLRh48OaaXusCyp4w7ksQud8T+NPG1z8AKlb9m4Mpcw
	0bx/bkwNS903bI8A8O2tgDoOf2xfeAxtF1EpWu7cZavWj0VN7H7Iq5ADZ2mU+5qlzg7gXJuU7Pd
	cWPNGDjI9xQC6lcANW3l2ywbJT9WJK6wJ35AFyB/+Qw84OQEXri/7slQYeRzc0xU4ZgwX1VA==
X-Received: by 2002:a05:6830:3156:b0:7cf:d213:7ecf with SMTP id 46e09a7af769-7cfdee7a81amr4387364a34.32.1768755506711;
        Sun, 18 Jan 2026 08:58:26 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfdf0efe41sm5290925a34.11.2026.01.18.08.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 08:58:26 -0800 (PST)
Message-ID: <184b3699-1eb6-4701-b827-47b34e997af2@kernel.dk>
Date: Sun, 18 Jan 2026 09:58:24 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_types=3A_reuse_common_phys=5Fvec_type_instead_of_DM?=
 =?UTF-8?Q?ABUF_open=E2=80=91coded_variant?=
To: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Ankit Agrawal
 <ankita@nvidia.com>, Matthew Wilcox <willy@infradead.org>
References: <20260107-convert-to-pvec-v1-1-6e3ab8079708@nvidia.com>
 <20260114121819.GB10680@unreal> <20260116101455.45e39650@shazbot.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260116101455.45e39650@shazbot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/16/26 10:14 AM, Alex Williamson wrote:
> On Wed, 14 Jan 2026 14:18:19 +0200
> Leon Romanovsky <leon@kernel.org> wrote:
> 
>> On Wed, Jan 07, 2026 at 11:14:14AM +0200, Leon Romanovsky wrote:
>>> From: Leon Romanovsky <leonro@nvidia.com>
>>>
>>> After commit fcf463b92a08 ("types: move phys_vec definition to common header"),
>>> we can use the shared phys_vec type instead of the DMABUF?specific
>>> dma_buf_phys_vec, which duplicated the same structure and semantics.
>>>
>>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>>> ---
>>> Alex,
>>>
>>> According to diffstat, VFIO is the subsystem with the largest set of changes,
>>> so it would be great if you could take it through your tree.
>>>
>>> The series is based on the for-7.0/blk-pvec shared branch from Jens:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=for-7.0/blk-pvec
>>>
>>> Thanks
>>> ---  
>>
>> Alex,
>>
>> Could you please move this patch forward? We have the RDMA series [1] that
>> depends on this rename, and I would like to base it on the shared branch.
>>
>> [1] https://lore.kernel.org/all/20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com/
> 
> I tried to ping Jens regarding why the branch with this code hasn't
> been merged into their for-next branch, maybe you have more traction.
> Thanks,

I get a lot of emails, and pings inside existing series don't always get
seen... Usually better to do a forward for a ping, then it's a lot more
likely to get seen sooner.

-- 
Jens Axboe

