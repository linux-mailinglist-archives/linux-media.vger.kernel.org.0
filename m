Return-Path: <linux-media+bounces-18156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB779751E2
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 14:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B1BF2823EA
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 12:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D3618E04C;
	Wed, 11 Sep 2024 12:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EfyIX9wp"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109CF189BBD
	for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 12:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726057258; cv=none; b=tc/Y2cyeHnyZ8KbIdsvVwfdwsyY/Va4Vg2M1eiKgyAhzkjuo077PWmNujmKszwzuWDIRpMKLIgky6Osf/r9DU/Dk9Kn20O8kqeZZPVZS4Ysq/70Z5YzYuxgUzzy1fdbLgqmluK8f3JNwEblRVk+cUuTupP+oeC1mtLeWsfVXj78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726057258; c=relaxed/simple;
	bh=+OtcHmKqOaBrLslEHoDVuszHtt0pMfNdMC/JAAqio6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i6iYfMkU4EOAO5RTzOwAOAzF/JF+2YTT9W21oE2TMUaFdlnMZEy78V2Z8GeSIcSHcGByp2BcGFby4BTtWF1G0X6Dp0xAubedlknohZSZph9+nLKkQX8Ie+lPjcvvdCC25pTf4hA2Zu1l89mr25UDhKFaZIVngACq7bi//23Kjx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EfyIX9wp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726057256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n3lZx7MOn0cvUlutwjGz/taR5dti/49PxN0KWJf8nvQ=;
	b=EfyIX9wpdrmxoxqoDUnKX+L7S5Q8BubD4Dg2ouShetOQHDPSowPQO49bDgSzzWR+nKH5or
	Ha47wUQfX5PdL3xInvz77PPYoxuzcdmT+CY1yw2lVlo94u2cuo7KGLAVPnuwNFQqqnmMZZ
	A+B9cTPaDd3IdgEh8XCL/KFQpAdClvs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-GiIudqTPNS6lIpfZCkxNWg-1; Wed, 11 Sep 2024 08:20:53 -0400
X-MC-Unique: GiIudqTPNS6lIpfZCkxNWg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a8a7463c3d0so423703366b.2
        for <linux-media@vger.kernel.org>; Wed, 11 Sep 2024 05:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726057252; x=1726662052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3lZx7MOn0cvUlutwjGz/taR5dti/49PxN0KWJf8nvQ=;
        b=jWdAH8a321QSW/poGBbF8FHCORLAvUJXdg/SfXtb4hRQ5kP/ZvX5nqbdzssaYBjNAZ
         E2kpyfkiGFUkBN34rNQYrSOCP3vqgOzHgAMCkbDj2ps6WzSUR4bOGYLPri6XiLUYrY1T
         L5+ToiMc4Ns6aZFTCHg78PF8pK3YpMQ9uEFiKg00OAJhr9WEgR8raJKNqXrvKUct6KO0
         cMPAmAYnVYX5Y2xYxsdu09lIHidF7NAP8bsxnlGSun/YSs3raRKBbN1G11N8jXWq2UDI
         zXpX+WuYMMrSkAW07rhZVPslC6f4ATo17oNBGZfi0YdZEbF+UqeU0X4UPHfcevBmA9jV
         rJBA==
X-Gm-Message-State: AOJu0YwNUKqqJqFR4gtESKnYFLIF5ne9ZAS1kHq/KjXnyao8RWMTodOC
	VQe7UquX3AZKw/iC7DRRqI0hKdKKBeT2ggUmlZ9+gjei9JdSUWgJyEE8/WRVGlLM4bD+1XIFZFE
	cAEcbuV1HE5uddyO2z+KUQ9wZkh2zC80GEmxzLoYyfjcPQQ5MoApbiul8796o
X-Received: by 2002:a17:907:c27:b0:a7a:9a78:4b5a with SMTP id a640c23a62f3a-a8ffad9da29mr446891466b.52.1726057251910;
        Wed, 11 Sep 2024 05:20:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEse7/q3fks/g38TDGilxuqdMvvKGvYQPRWSe7VE2frNIQ+csBboiwxRmv/9sL6IOGSSY5V2w==
X-Received: by 2002:a17:907:c27:b0:a7a:9a78:4b5a with SMTP id a640c23a62f3a-a8ffad9da29mr446880566b.52.1726057250314;
        Wed, 11 Sep 2024 05:20:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d259c76e2sm605309766b.79.2024.09.11.05.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 05:20:49 -0700 (PDT)
Message-ID: <1d0478b2-efdf-4c1f-bf2c-a5cb2214168c@redhat.com>
Date: Wed, 11 Sep 2024 14:20:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v2] platform/olpc: Remove redundant null pointer
 checks in olpc_ec_setup_debugfs()
To: Li Zetao <lizetao1@huawei.com>, mchehab@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, heiko@sntech.de,
 yisen.zhuang@huawei.com, salil.mehta@huawei.com, hauke@hauke-m.de,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, wellslutw@gmail.com, radhey.shyam.pandey@amd.com,
 michal.simek@amd.com, ilpo.jarvinen@linux.intel.com, ruanjinjie@huawei.com,
 hverkuil-cisco@xs4all.nl, u.kleine-koenig@pengutronix.de,
 jacky_chou@aspeedtech.com, jacob.e.keller@intel.com
Cc: linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, platform-driver-x86@vger.kernel.org
References: <20240907031009.3591057-1-lizetao1@huawei.com>
 <20240907031009.3591057-2-lizetao1@huawei.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240907031009.3591057-2-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/7/24 5:09 AM, Li Zetao wrote:
> Since the debugfs_create_dir() never returns a null pointer, checking
> the return value for a null pointer is redundant. Since
> debugfs_create_file() can deal with a ERR_PTR() style pointer, drop
> the check.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
> v1 -> v2:
> v1:
> https://lore.kernel.org/all/20240903143714.2004947-1-lizetao1@huawei.com/
> 
>  drivers/platform/olpc/olpc-ec.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/platform/olpc/olpc-ec.c b/drivers/platform/olpc/olpc-ec.c
> index 921520475ff6..48e9861bb571 100644
> --- a/drivers/platform/olpc/olpc-ec.c
> +++ b/drivers/platform/olpc/olpc-ec.c
> @@ -332,9 +332,6 @@ static struct dentry *olpc_ec_setup_debugfs(void)
>  	struct dentry *dbgfs_dir;
>  
>  	dbgfs_dir = debugfs_create_dir("olpc-ec", NULL);
> -	if (IS_ERR_OR_NULL(dbgfs_dir))
> -		return NULL;
> -
>  	debugfs_create_file("cmd", 0600, dbgfs_dir, NULL, &ec_dbgfs_ops);
>  
>  	return dbgfs_dir;


