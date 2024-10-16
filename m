Return-Path: <linux-media+bounces-19759-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E01C9A0905
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 14:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6D841C21F1D
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 12:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10C9207A35;
	Wed, 16 Oct 2024 12:07:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E6E207A00;
	Wed, 16 Oct 2024 12:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729080473; cv=none; b=NE0twuW55y5AVaA/kJ3We5kipNmk+DaDSmTo0wXMurtZqnLjglsOPRaFY7jVF1044Ka7rAoHzuDuazZIEa/yP24AAVy7NIgmH9dbrJgcsGpxt2xtMPDoA5pqsRA7m9EMYy1CK8fLuk7mN/T7j1+BZaSUq15xdIOWM0XxYDFNDK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729080473; c=relaxed/simple;
	bh=Cd/nJwokvfsxNybbuDAbUxVhvuqfcKV+Gv2tM2d77nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iiktNw54Vt9a+k0UiOjXhEvlwV19LdGy4znrYn+4P+z+9mr0TLlyRvM9e/2f5u+043qs+3pzPKSOnhZYD9ZNka6N/kxPwdGXvbkLVMRcj64qV/VZNU++8C3wiHcU/8sQIE9VxQo0GlIziEkF0KqIpUYifkM4VtDny+E0xbPNjoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.15] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 4BABE2BE05;
	Wed, 16 Oct 2024 13:59:19 +0200 (CEST)
Message-ID: <b5fcb290-5374-4ff3-b74c-a1bd3c802ef0@gpxsee.org>
Date: Wed, 16 Oct 2024 13:59:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] media: mgb4: protect driver against spectre
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 stable@vger.kernel.org
References: <cover.1729074076.git.mchehab+huawei@kernel.org>
 <4675c8e726c7d55bbecf9f4772370daa8b46ccd3.1729074076.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <4675c8e726c7d55bbecf9f4772370daa8b46ccd3.1729074076.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16. 10. 24 12:22 odp., Mauro Carvalho Chehab wrote:
> Frequency range is set from sysfs via frequency_range_store(),
> being vulnerable to spectre, as reported by smatch:
> 
> 	drivers/media/pci/mgb4/mgb4_cmt.c:231 mgb4_cmt_set_vin_freq_range() warn: potential spectre issue 'cmt_vals_in' [r]
> 	drivers/media/pci/mgb4/mgb4_cmt.c:238 mgb4_cmt_set_vin_freq_range() warn: possible spectre second half.  'reg_set'
> 
> Fix it.
> 
> Fixes: 0ab13674a9bd ("media: pci: mgb4: Added Digiteq Automotive MGB4 driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>   drivers/media/pci/mgb4/mgb4_cmt.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/pci/mgb4/mgb4_cmt.c b/drivers/media/pci/mgb4/mgb4_cmt.c
> index 70dc78ef193c..a25b68403bc6 100644
> --- a/drivers/media/pci/mgb4/mgb4_cmt.c
> +++ b/drivers/media/pci/mgb4/mgb4_cmt.c
> @@ -227,6 +227,8 @@ void mgb4_cmt_set_vin_freq_range(struct mgb4_vin_dev *vindev,
>   	u32 config;
>   	size_t i;
>   
> +	freq_range = array_index_nospec(freq_range, ARRAY_SIZE(cmt_vals_in));
> +
>   	addr = cmt_addrs_in[vindev->config->id];
>   	reg_set = cmt_vals_in[freq_range];
>   

I still do not fully understand the exact vulnerability here, but the 
patch should definitely not do any harm, so I'm ok with it even if it's 
real purpose would only be to silence the smatch warning :-)

Reviewed-by: Martin Tůma <martin.tuma@digiteqautomotive.com>


