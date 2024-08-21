Return-Path: <linux-media+bounces-16561-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 074A495985B
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 12:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C288B22EF7
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 10:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377D21C86EE;
	Wed, 21 Aug 2024 09:02:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277A51B1D60;
	Wed, 21 Aug 2024 09:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724230949; cv=none; b=USeAsZkzlgRY78cW2cob0FAukGJWkjJU3eW9jOEVTiMjGquS2mvkbBdtj+Q28k82IDRf7eHbOx6+8Zl3hbRA5kLw08+8iRtjZZxtBhQmG4f3MqZ4BFXQ/5ap0HyVurRBd/ybzsxiqc2TNDH11dSzPsYORJLFjOfI7JfSOzp0rtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724230949; c=relaxed/simple;
	bh=qV5Nr0ZcGdcHhScpRGvqFJh48xM/H0VA1rSCHgFOmnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hg+i34669zwblUFMrdKTQSfaUcQhm7JoKm5Kkd2hB5dkLIvCTUuTVPRx/g9gxxdXt8/kEsGwnhinmc5P96EjBFW4JGiD5MKkTMfe6hDPyVgAOx+k0skpVaGhLZzwAAmsv6yrvgrDlnQkO65Tl/lr073c7TPC8ClKkXyKpyWFEAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.14] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id EE77C63062;
	Wed, 21 Aug 2024 10:56:49 +0200 (CEST)
Message-ID: <ca03a058-c374-44e2-8f44-ccaec8898337@gpxsee.org>
Date: Wed, 21 Aug 2024 10:56:49 +0200
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
References: <20240821071100.7839-1-11162571@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <20240821071100.7839-1-11162571@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21. 08. 24 9:10 dop., Yang Ruibin wrote:
> The debugfs_create_dir() function returns error pointers.
> It never returns NULL. So use IS_ERR() to check it.
> 
> Signed-off-by: Yang Ruibin <11162571@vivo.com>
> ---
>   drivers/media/pci/mgb4/mgb4_vout.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
> index 998edcbd9723..348c8e01fcbe 100644
> --- a/drivers/media/pci/mgb4/mgb4_vout.c
> +++ b/drivers/media/pci/mgb4/mgb4_vout.c
> @@ -683,7 +683,7 @@ static void debugfs_init(struct mgb4_vout_dev *voutdev)
>   
>   	voutdev->debugfs = debugfs_create_dir(voutdev->vdev.name,
>   					      voutdev->mgbdev->debugfs);
> -	if (!voutdev->debugfs)
> +	if (IS_ERR(voutdev->debugfs))
>   		return;
>   
>   	voutdev->regs[0].name = "CONFIG";

Reviewed-by: Martin Tůma <martin.tuma@digiteqautomotive.com>


