Return-Path: <linux-media+bounces-16559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AF8959847
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 12:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2E4A1F21987
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 10:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA641DE629;
	Wed, 21 Aug 2024 08:57:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA60D1E093B;
	Wed, 21 Aug 2024 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724230645; cv=none; b=WxhwB4XDOPYtWLNiZe0MXMGR4MjtRPeez2ejQj6KcmeqAqUwb0GF2YBPijVoTkP+Kb7SpqobhmiNZPaM9r7cOVxXMgDtomhYo8Iq6Iup+yVyWra5C2IKjTXCpCiXpRoLT9zJQmlo7x+noE5KNTmM0N8xUcWghC71VfnvDtSKkuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724230645; c=relaxed/simple;
	bh=t7o//5qUYbRHcBF40C0JHqG9ztS9N4vNI5NAidbo1ms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kqRUT0ywJKGAydPRkDjfqntWjvErXaVhQY/HMV3ZsqTXS21V8dFs+QWJS6U+DUII2T6htsTxSLF923qrmO35tWZs+ULpkALOZ+Bs6+rk0A5PRE7Nrm7AVZZjFwfk1/m1ZwncbtoJ0TfrT3JN3BmsVupXanchRLEzZ5M/Kk82ZD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.14] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 17ED562243;
	Wed, 21 Aug 2024 10:57:21 +0200 (CEST)
Message-ID: <0556ebcf-619d-4efd-b21a-1b74a6755839@gpxsee.org>
Date: Wed, 21 Aug 2024 10:57:20 +0200
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
Content-Transfer-Encoding: 8bit

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

Reviewed-by: Martin Tůma <martin.tuma@digiteqautomotive.com>


