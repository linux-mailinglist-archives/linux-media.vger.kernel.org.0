Return-Path: <linux-media+bounces-48721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E59CB9A06
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 20:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98F0A309192C
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 19:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A059F309EF0;
	Fri, 12 Dec 2025 19:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="Cj/Ka0Ur"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E3919F13F;
	Fri, 12 Dec 2025 19:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765567077; cv=pass; b=N9epRxpA2X1R+BsHdZ3qE4OiCmVUJ7C7v8o/83LhVtPIcABjCmXFykA2DjwpRME7m8P2H2shiqfJvUh/PyLbY9NUoTGuFtitg7NSAf8Gv31PGEDELlvmKsXgLs1/kanugPSX6JiLHs3ykZCI6SnaO/t0WBnxrNmffRBtZtD6w6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765567077; c=relaxed/simple;
	bh=DlMxIfdCP+UT25UdrZ2BDNxkmijwxUF4B0kc49TAxLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtrxWViO6Xe2OSX8WEweNDDqHLtHfTdNTGld5ZOR2wrKI1u+g924T79SsLGidNgJ8sH6jvwiWKr9Jt7LU5A06Uoar0Ns6uEM+8SfoJGT6owIsoOyXmarOsOKEbE/gxQjWb8HUxtsHb/1Oc6CNGS3DGpahwo3DSPMeq4oIn2tZSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=Cj/Ka0Ur; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1765567057; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hWvkQqX8qqJRuIR1lEW3UhC9leLdg9AS8IeV/l63u7Xze87YXnxV4mM0cUtJFFJYyJu4r13ZtLxxVMrnlBrEkvwJIhD+7yJbkdOjbRDM+UxelLPvlSTeO+E469rStSevgJaB39GIQ8T1p2HxwwWc0ceVLk4OzqB8ghwtI7EGUB8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765567057; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LVUwj6Ss7aifiMd9VIv3Flz/Y6HZNB9830E8bskYMlw=; 
	b=gd1igIJbwH0mf7bFdyYuHsLsHiMSbz1oIs+AFPX3Wceuh1g/OTOdI2BLcqOQySXN5EFqD1WAFrMIgzUrri8of4SWeUam9iyCL50JYIVlEAJLofqIQrS7bF66Hp1bDbOdKOuWZ43MBQq2BUmTeJNsx03bJoI295KJqB6NA9xAtN4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765567057;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=LVUwj6Ss7aifiMd9VIv3Flz/Y6HZNB9830E8bskYMlw=;
	b=Cj/Ka0Urq2yG9mP62B39ePe/pBVaRZ+D+fm66eN06CH/cH3uHJT54f66ZbaLK4at
	5Gf8L1UV4lO7oQuYiDTsmmKj4gWa6e/0esZA8HEwEprf8Y2bir57EaE16loIQMG3Lqp
	35MqIiYMr+kZu3uknmaHw14MLwTcnLHGhd+8Uz2k=
Received: by mx.zohomail.com with SMTPS id 1765567056011166.01103093997517;
	Fri, 12 Dec 2025 11:17:36 -0800 (PST)
Message-ID: <912e62f7-210d-4e25-9119-7dea61b856c5@collabora.com>
Date: Fri, 12 Dec 2025 14:17:33 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rkvdec: vp9: Fix probs struct alignment
To: linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, kernel test robot <lkp@intel.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20251212160101.146684-1-detlev.casanova@collabora.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <20251212160101.146684-1-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi all,

Sorry, I need to rewrite the commit message with some s/bit/byte...

Will do a v2 soon.

Regards,

Detlev.

On 12/12/25 11:01, Detlev Casanova wrote:
> When building for arm 32 bits, the struct alignment changes and the compiler
> adds 3 padding bits to the anonymous mv struct in
> rkvdec_vp9_inter_frame_probs.
>
> Therefore, the BUILD_BUG_ON used to check that the struct size is aligned
> to 128 bits (hardware requirement) fails.
>
> As that mv struct is at the end of the global rkvdec_vp9_probs struct
> and is followed by 11 padding bits, the 3 padding bits can be explicitely
> set in the mv struct and removed from the 11 following it.
>
> This makes sure that the mv struct is 32 bits aligned.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512110229.R6YCf1Le-lkp@intel.com/
> Fixes: d968e50b5c26 ("media: rkvdec: Unstage the driver")
> Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>   drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> index b4bf01e839ef..23c733ca2e8e 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c
> @@ -66,6 +66,8 @@ struct rkvdec_vp9_inter_frame_probs {
>   		u8 fr[2][3];
>   		u8 class0_hp[2];
>   		u8 hp[2];
> +		/* 32 bit alignment */
> +		u8 padding6[3];
>   	} mv;
>   };
>   
> @@ -85,7 +87,7 @@ struct rkvdec_vp9_probs {
>   		struct rkvdec_vp9_intra_only_frame_probs intra_only;
>   	};
>   	/* 128 bit alignment */
> -	u8 padding1[11];
> +	u8 padding1[8];
>   };
>   
>   /* Data structure describing auxiliary buffer format. */

