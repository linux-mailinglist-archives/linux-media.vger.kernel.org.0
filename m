Return-Path: <linux-media+bounces-26229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D8CA38A6F
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 18:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C67C31885A13
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2025 17:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E2215666D;
	Mon, 17 Feb 2025 17:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Rjd2KS+p"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E82228C89
	for <linux-media@vger.kernel.org>; Mon, 17 Feb 2025 17:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739812420; cv=pass; b=Z9SrBmxcaU5tEHTbGnAgYeiYnKr7L8jy3zktHZvvnKH9Ar7Y9LGqbnBpLAcy3ekeozhejvsW7iSqX4mHsKFaFCMe8eyliwEaOYY/5GNSOfevn3ti7TBsYZ5GZFh1fKk3/1+APgyp3fXM8oETwZVIH0CjvH8LGjJr2eLAWTwfkNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739812420; c=relaxed/simple;
	bh=txpqPGu0kNwKJz8eyN/VOLzDQZ+WY4YAFdyOKrophDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZW05hAIuy+Fl+afr+rLQuoL9AnFCXR1c/iP+7ek4jwDOcei8y0zPuRwtLvZh3sG45rHv4RQQYHJpaNR2Op1f8EpmSDCEXTGmF+JMA9IUGR25orlmGFBenrnhgrwqRqo97/J6yLQtYP6zR0YtV86QmqM2/+YPdvD43VkRo74S17I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Rjd2KS+p; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739812401; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k+tHooWYvQM/fTEDMF9ezaEaNcNSJYBkzIiQ5gYnA1s+3bx/eQDyDFcm842u1C+Od48XNLeZMak2czPD8B1/rODrhFdI2MIgmoFC1F7/Ee+AkyRvkDE6/9pBiejLz42nXzLXYA56KU65CMHevZQuYUKLflElQBzxOABdbOief6o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739812401; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=3Fph9gBvBdd9qmUmWvxYRjabYcIMdMHd6ordv+O4sLg=; 
	b=KSAw0obWukX0sFZBbkLaLz6jEKUjpGXXObeMa2qicojvn363bKCfxEXfKXxKUhWnn4xrBX1QWqm8T7iguleboQTP8rWY6MeH6emq6bPla6SJL9rZ7jL05VEFT369KNtnrwYqNiJPyO2m+rYTZ+vsrnpQDaNQ5wYIdGPN8Vsm1qw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739812401;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=3Fph9gBvBdd9qmUmWvxYRjabYcIMdMHd6ordv+O4sLg=;
	b=Rjd2KS+pyolOdpxLdQH4Uhq0zh5C+s+JS58HSjxRu92ooURgwQwe/W782xX1EE5V
	GSO6vnT/sXwLkXIRUH964iZ0pNV5pXmFoaB9Tld/at7BIl3SxIcaG0MuYRjcxNnCPa2
	IEzL7doicT0pCrWRWcbefPHDYGhpJoDt3GBHI5e0=
Received: by mx.zohomail.com with SMTPS id 1739812399496485.4004078827304;
	Mon, 17 Feb 2025 09:13:19 -0800 (PST)
Message-ID: <f9f6c845-154e-4efe-b73a-b7ea561ae291@collabora.com>
Date: Mon, 17 Feb 2025 20:13:15 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dma-buf: dma-buf: stop mapping sg_tables on attach
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 tvrtko.ursulin@igalia.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20250211163109.12200-1-christian.koenig@amd.com>
 <20250211163109.12200-4-christian.koenig@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250211163109.12200-4-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 2/11/25 19:31, Christian König wrote:
> As a workaround to smoothly transit from static to dynamic DMA-buf
> handling we cached the sg_table on attach if dynamic handling mismatched
> between exporter and importer.
> 
> Since Dmitry and Thomas cleaned that up and also documented the lock
> handling we can drop this workaround now.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-buf.c | 149 ++++++++++++++------------------------
>  include/linux/dma-buf.h   |  14 ----
>  2 files changed, 56 insertions(+), 107 deletions(-)

Looks good, as long as IGT passes.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

