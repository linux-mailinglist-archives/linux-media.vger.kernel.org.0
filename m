Return-Path: <linux-media+bounces-16817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C4A95F319
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C2D1284310
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 13:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EAA1862B9;
	Mon, 26 Aug 2024 13:36:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E3653362;
	Mon, 26 Aug 2024 13:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724679388; cv=none; b=u2DzXBzgiCGupnFLn5B46l8d/yXzD/5z8Qzr+FfB29Sgwg48B4zF26kRF2db1wFj8BL8VVATwqtbKmpQoxp4x71dWKnjVkv8TfZUtegLTLhX5TSZYkF6WOnjyjzkQQjcTB7NOGRSk8M6kiyyEVeu+O/R+nqHyu3ywlqhlNnWe7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724679388; c=relaxed/simple;
	bh=68ubJ+DqKp/vXZOcEZYL4Abo7dJuVyqYhAfSgn/26bQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XItVVs9A6gSszQ0uhfXuEyF6UKAbfnXkUgfuk9CxWQYj4SqAYIDgk4m6H5SOL97O6f07r2xfMM6LWNCjopy0wGuxhqhCXnDLMpqSa9G85wGZjfwygFuPKJ2iyNLjZ67wvoQx+37UXMP+2SLGy4AQtmSYd2UT1CK1zmiABZk9ZhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.14] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 0C1542A91D;
	Mon, 26 Aug 2024 15:36:24 +0200 (CEST)
Message-ID: <15346558-07e3-4c25-a65f-843e5d39dc45@gpxsee.org>
Date: Mon, 26 Aug 2024 15:36:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drivers:mgb4:Fix the NULL vs IS_ERR() bug for
 debugfs_create_dir()
To: Yang Ruibin <11162571@vivo.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240821072944.9275-1-11162571@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <20240821072944.9275-1-11162571@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21. 08. 24 9:29 dop., Yang Ruibin wrote:
> The debugfs_create_dir() function returns error pointers.
> It never returns NULL. So use IS_ERR() to check it.
> 
> Signed-off-by: Yang Ruibin <11162571@vivo.com>
> ---
>   drivers/media/pci/mgb4/mgb4_vin.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
> index e9332abb3172..808eb51b270c 100644
> --- a/drivers/media/pci/mgb4/mgb4_vin.c
> +++ b/drivers/media/pci/mgb4/mgb4_vin.c
> @@ -860,7 +860,7 @@ static void debugfs_init(struct mgb4_vin_dev *vindev)
>   
>   	vindev->debugfs = debugfs_create_dir(vindev->vdev.name,
>   					     vindev->mgbdev->debugfs);
> -	if (!vindev->debugfs)
> +	if (IS_ERR(vindev->debugfs))
>   		return;
>   
>   	vindev->regs[0].name = "CONFIG";

Superseded by
 
https://patchwork.linuxtv.org/project/linux-media/patch/20240826132604.3240-2-tumic@gpxsee.org/
that handles both the input/output device cases as well as an error when 
creating the parent mgb4(PCIe) device.

M.

