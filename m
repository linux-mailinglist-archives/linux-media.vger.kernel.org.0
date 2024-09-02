Return-Path: <linux-media+bounces-17332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BA5968444
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 12:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B0581C229E1
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 10:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346621422AB;
	Mon,  2 Sep 2024 10:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f7qBvZag"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B21D2F73
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271868; cv=none; b=TEO2YvLjguCBQzhcsslrdhxL2PBnHOx1bkZFl7TPPSJ/GDcm4sIIQK7UzOa9L1fw3g+iMcRuA0V6CWCvLqWMsfqrOFhsGsVaMFaG89HkJrzE9X32yaufyXJRVlERO9w6dlwXm777mTM6WchdW81IwW50GIydoIWa3oSiAn8S28Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271868; c=relaxed/simple;
	bh=9XvawMPR1TqnxefGQw2FYTDCsf2yPR9KDm/4mVxa4v0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ncx+U+2yGxwMyex3CGiZleYQS2iH2ho5Zn1/UhTrqTuYgEvMEpYdEjLTZNWuty/97g12yyE8Tt48qEQoL0iguIY+VlNP5Q86LAgKHyz/G52Ql1GiOpLQ8j+XcD9mDhYkZcuu9BcJ103+hcHCkErX53NpkZhL6+b19O4hT61HuTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f7qBvZag; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725271866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p5CBDMsPHpZMCmp2hILtl0CkuYFTnIMO037HYoPS0tM=;
	b=f7qBvZagIGM4RntJOaS3qROR4eDB/dFfy61vUoQiKUaWqTBSGJDxxQ0WISvIrWoQnXbHXZ
	kmJ4tEvEb+VEoOxJV/Po1GtS/iH59EmSRSLqhhu8sU8jvOqr28YeCe6ZVn62JLIymRtkuN
	PNX5KF4MTL3wRDAHIu1fTnSh32M1E+I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-PVpNBIQcPam3Kgb4cIvv6Q-1; Mon, 02 Sep 2024 06:11:04 -0400
X-MC-Unique: PVpNBIQcPam3Kgb4cIvv6Q-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c2580e0434so439501a12.0
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2024 03:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271863; x=1725876663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5CBDMsPHpZMCmp2hILtl0CkuYFTnIMO037HYoPS0tM=;
        b=coJLYdZWCNGB/PT+/4J7s9n2yi1r/lZuivc9uEwnwT/ihXSU+KytfQxNhPQjqR7XTO
         fEfTu0FfM2XkmO/NJtaWMeOkW5V3HJwuSezm+ZzgvZVF+NSxMOTu3zn0N5uSedO82/+5
         pKhUzE0/HrW1h6HQvNeGosBWjjxw/lOzTvyufTt0MCLtzSgtvsniWjxlWooYHc7rXN/s
         eBUsXfwXe9Ea78800coaDTErHMWu/vFb3g2lanEHx3f5MlueTSTpWv5MSdmOwxj3qE/B
         yoywd4a+ytVf2X24qwa0YAa4fktZNxQd1MACq5dSBPPBLndPILHs8nsrZgHZ0lxWlzU/
         2KVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5/b20pll46XuFa47YMzhnhNnx0JqFcxX06H9rH8pxIDrr6ALYb5uq4Zh2h+eu2Fq9ITc7VvGhQQbt7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4+9tjC1oYf518/7RD9VxlOA6/Fj/Vs+qt46dRnyw0APs4cE21
	gnjV/74qjx9pTGd6HpPya6MaJMZoa9KXRsJ+1rApqj5eJMprXCk2kZav/iWsqHbvdC4XJMLJX1m
	XRgwD5f9xw+4X5+l0rOB990IiDx8NybXFek3KB37dKCdgzdCzSkJ3Lz0xNw7C
X-Received: by 2002:a05:6402:40ca:b0:5c2:112d:b744 with SMTP id 4fb4d7f45d1cf-5c21ed9fca6mr9727327a12.38.1725271863602;
        Mon, 02 Sep 2024 03:11:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3+6lb3LMTCQdb284HwCgL+cuzD6UKpH+7OBGNQMIHdb8i+3P4gIqMd1oKDsAnkf6Lc/TCYA==
X-Received: by 2002:a05:6402:40ca:b0:5c2:112d:b744 with SMTP id 4fb4d7f45d1cf-5c21ed9fca6mr9727305a12.38.1725271863036;
        Mon, 02 Sep 2024 03:11:03 -0700 (PDT)
Received: from [192.168.171.203] ([109.38.145.100])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c7c055sm5066957a12.47.2024.09.02.03.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:11:02 -0700 (PDT)
Message-ID: <52a23d6c-b50c-4079-b0e7-4c1ca2fbc394@redhat.com>
Date: Mon, 2 Sep 2024 12:10:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: move trailing */ to separate lines
To: Sergio de Almeida Cipriano Junior <sergiosacj@riseup.net>
Cc: ~lkcamp/patches@lists.sr.ht, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, helen.koike@collabora.com
References: <20240730071904.1047-1-sergiosacj@riseup.net>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240730071904.1047-1-sergiosacj@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/30/24 9:19 AM, Sergio de Almeida Cipriano Junior wrote:
> Fix checkpatch diagnostic "WARNING: Block comments use a trailing */ on
> a separate line" in assert_support.h file.
> 
> Signed-off-by: Sergio de Almeida Cipriano Junior <sergiosacj@riseup.net>

Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans





> ---
> Hi, this is my first patch to the kernel.
> ---
>  .../media/atomisp/pci/hive_isp_css_include/assert_support.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/assert_support.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/assert_support.h
> index d294ac402..c5ab13511 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/assert_support.h
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/assert_support.h
> @@ -27,7 +27,8 @@
>   * #define assert(cnd) BUG_ON(cnd)
>   * but that causes many compiler warnings (==errors) under Android
>   * because it seems that the BUG_ON() macro is not seen as a check by
> - * gcc like the BUG() macro is. */
> + * gcc like the BUG() macro is.
> + */
>  #define assert(cnd) \
>  	do { \
>  		if (!(cnd)) \
> @@ -37,7 +38,8 @@
>  #ifndef PIPE_GENERATION
>  /* Deprecated OP___assert, this is still used in ~1000 places
>   * in the code. This will be removed over time.
> - * The implementation for the pipe generation tool is in see support.isp.h */
> + * The implementation for the pipe generation tool is in see support.isp.h
> + */
>  #define OP___assert(cnd) assert(cnd)
>  
>  static inline void compile_time_assert(unsigned int cond)


