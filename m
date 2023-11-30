Return-Path: <linux-media+bounces-1394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A637FEC27
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 10:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E134B21090
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 09:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD6F39872;
	Thu, 30 Nov 2023 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dazRXuFL"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21BED54;
	Thu, 30 Nov 2023 01:49:55 -0800 (PST)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4A8406602F1E;
	Thu, 30 Nov 2023 09:49:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701337794;
	bh=PZ4o18TmuhBsGGT4rtN1qfP0i7FFHevi8/u0G156Vwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dazRXuFLjVL+vCZngSiFfIivtpq4cARDWVINxmkd1/WHBa9mp1UWLCJYXSteKJ/XK
	 QO4T+zlPKt7EgWlsbk1+Z7sKkI0cpHFsisFu82rwpPAvNc/HifnngDMPeqWZdOTcqP
	 qrSI9BxNw6efehTOZB7WOlAWWSxBlu4Yv8u1S1HP98dpCCZHJ4LvNVU+nl2LmuG44w
	 7e2l0YsRU0HFUUow9nWClhIaI4kx5FhssCvizVfr/YGzbJDbuyosVrksrMyN82ZJV+
	 TjJ+BCghXsCK/wNl5kjq6c+mCJ1baQ0ioZmpnAMLcRnO0s95JkYwAMZCn4Llqx9Mzq
	 9TEWqxlNkZA0A==
Date: Thu, 30 Nov 2023 10:49:51 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: mchehab@kernel.org, jackson.lee@chipsnmedia.com,
	nas.chung@chipsnmedia.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] media: chips-media: Remove surplus dev_err() when
 using platform_get_irq()
Message-ID: <20231130094951.dnhk6zy4zejgezxq@basti-XPS-13-9310>
References: <20231127010955.605-1-yang.lee@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20231127010955.605-1-yang.lee@linux.alibaba.com>

Hey Yang,

Thanks for the patch!

The commit subject line should point to the respective driver and you
can drop the brackets, so:
`media: chips-media: wave5: Remove surplus dev_err when using platform_get_irq`

Greetings,
Sebastian

On 27.11.2023 09:09, Yang Li wrote:
>There is no need to call the dev_err() function directly to print a
>custom message when handling an error from either the platform_get_irq()
>or platform_get_irq_byname() functions as both are going to display an
>appropriate error message in case of a failure.
>
>Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7636
>Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>---
> drivers/media/platform/chips-media/wave5/wave5-vpu.c | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>index bfe4caa79cc9..3f7c622e8d58 100644
>--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>@@ -209,7 +209,6 @@ static int wave5_vpu_probe(struct platform_device *pdev)
>
> 	dev->irq = platform_get_irq(pdev, 0);
> 	if (dev->irq < 0) {
>-		dev_err(&pdev->dev, "failed to get irq resource\n");
> 		ret = -ENXIO;
> 		goto err_enc_unreg;
> 	}
>-- 
>2.20.1.7.g153144c
>
>

