Return-Path: <linux-media+bounces-17337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C55529684E9
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 12:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ABB91F23A9A
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2024 10:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC781D172E;
	Mon,  2 Sep 2024 10:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DoLFtAJz"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CCF1D414D
	for <linux-media@vger.kernel.org>; Mon,  2 Sep 2024 10:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725273433; cv=none; b=rFs+aJQvaY4/j2fJtvSIZFnohI6AIQI7qx9ryo2CJBiiDN2hrDdKuO7JlpfK9aygv8GxtVMx8uapP5Y+mKab4mxE+EaAn8eUF3PzCFAtoc2NsgjMHxH2wy5i6H5gFGpP0f4UFZ4963s0W/H6nytz79S653SeoXnJjVy+FgWspuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725273433; c=relaxed/simple;
	bh=bZ0GRt9gffEULgAQGEaKdS/PlZJF+51Ayngat/bf9Og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oCStl6ig0jQblFSNKXrPKrpUwziYBpkLbeclJW7+asG2736qg8t2n/7p5XliIco9bQLevFYYGSNd8rurPr1WPCgQ2m/XQLg5YnGaatDY42GHKPyQ9BZijTM1JgCkdy3onnH98XqB2/Mxwhj+mSoYB4N2dd2R/TmI5FIAORlIkK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DoLFtAJz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725273429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=36MG2rcUu/28sbkdVnOBGEZ2E0JiySmry2OUMdPpre0=;
	b=DoLFtAJz3Havf1nUOnR+tDaoAWbu4OJZ5vqSaKEGZqu2U+K65eJh1E0IgxFB67nxb8WqKW
	fZVozxAF5UUsTKQtTv+1TFsXn68TcPbIT49HwDrNLyR2U+b6klqwOpO+qItNF1/GS6ZrSy
	l1MPy0433jk0YG6vMJsoIU/muIeckJE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-7s8m4a6PPX22jLrbtMqW6A-1; Mon, 02 Sep 2024 06:37:08 -0400
X-MC-Unique: 7s8m4a6PPX22jLrbtMqW6A-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a867b95db47so291975966b.1
        for <linux-media@vger.kernel.org>; Mon, 02 Sep 2024 03:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725273427; x=1725878227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=36MG2rcUu/28sbkdVnOBGEZ2E0JiySmry2OUMdPpre0=;
        b=P6qYTICDFdp7ykfr+glXDC7naleK6D769xqoKSKySc035ldeFgl9OqDfEIGeIN2XDt
         iUSXzhjqXQQ61c3N9QibAXkzJvjBN9yPM4RLOwDrLfsm4Y+FfFnLqJizMnRVOc3x6gkA
         LjykxRVw77EbVQbeAuMlz+7g34s5BhCKtaCCKv+rx2rJPLwYtwYd36YhjW7/pztKYG6M
         nFDv7PgJRgqIp7173ERnObvFCV8Rp2Pl3TErXRs7XNgxDiDjltAPX94mUgKteTARmjlS
         llTETFwfp6k8dPbCL8qSqiNJcG5NDoN+XXCCFEABlCj3uL3b39VweDARsdhVHAYnK97z
         ajXg==
X-Forwarded-Encrypted: i=1; AJvYcCWCiUb3NAYKMC6bZGUnmEtp+ygTTjT8OVp8sCMReVO5UdjVlEI8PYzeq7AvmEwVZ/UBAicw6EjSStEEKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YweNrHiUbNCdE+wysLmLtcxcaewdEQpBP+H8ylHaAhGI5rBJOGz
	A7nyXQM1GZCSLhcQTnEPk9ItDlmxAhs0P786xKsS4Mu1JQ2j7Zdkp+11DxZueKGN8KBSEh3jBRb
	mTEt1bf9jG2l1Gv57YvrU9vfnv5CVzcC6bUjwMzsqSCW23UZtoJYEtYCAcen9R1pBYxSeito=
X-Received: by 2002:a17:907:70d:b0:a7a:9f0f:ab2c with SMTP id a640c23a62f3a-a89d879b28dmr534577266b.29.1725273427061;
        Mon, 02 Sep 2024 03:37:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwBjyLwpvpR6bHVm6/uWoe1ZJ9CgDi5t66KDukjljfNKEH9Un8tWmMUMRCkMnYaRheSx2Pcw==
X-Received: by 2002:a17:907:70d:b0:a7a:9f0f:ab2c with SMTP id a640c23a62f3a-a89d879b28dmr534574066b.29.1725273426499;
        Mon, 02 Sep 2024 03:37:06 -0700 (PDT)
Received: from [192.168.171.203] ([109.38.145.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb2a3sm543911766b.3.2024.09.02.03.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:37:06 -0700 (PDT)
Message-ID: <f90c8fb1-a339-4e68-978f-3339c5652e0a@redhat.com>
Date: Mon, 2 Sep 2024 12:37:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: atomisp: csi2-bridge: Add DMI quirk for t4ka3
 on Xiaomi Mipad2
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>,
 Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
 Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20240902095229.59059-1-hdegoede@redhat.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240902095229.59059-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/2/24 11:52 AM, Hans de Goede wrote:
> The t4ka3 sensor on the Xiaomi Mipad2 is used as a back facing sensor,
> it uses 4 CSI lanes, but the _DSM has CsiLanes set to 2. Extend
> the existing Xiaomi Mipad2 DMI quirk to override the wrong _DSM setting.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I have merged these 3 patches in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp
now.

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> index 31c9e05a1435..b2a3243ae2d4 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
> @@ -109,6 +109,8 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
>  static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
>  	/* _DSM contains the wrong CsiPort for the front facing OV5693 sensor */
>  	{ "INT33BE:00", "CsiPort", "0" },
> +	/* _DSM contains the wrong CsiLanes for the back facing T4KA3 sensor */
> +	{ "XMCC0003:00", "CsiLanes", "4" },
>  	{}
>  };
>  


