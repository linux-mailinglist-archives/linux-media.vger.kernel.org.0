Return-Path: <linux-media+bounces-62246-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNIKDfGeDWqC0AUAu9opvQ
	(envelope-from <linux-media+bounces-62246-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:45:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C387258CE01
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 13:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17B91303E8CC
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 11:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA48376A12;
	Wed, 20 May 2026 11:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TLbV+TrO"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9CD2F363F
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277078; cv=none; b=BRpbgxAeIFHaAw7236SZy/knBfjk4q909kpmktrI08CFl8ie7m8y/Gu4+2DRUzuxWwu86rw5q2vpaycAx2He4XJRq3f+i/65W/9d1DwQbfJ5DlKhAk2jSRXUDKScBEwh2BMg49YbqWPP9KISvClG1UErLBRCASwwjQRoMUV5sGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277078; c=relaxed/simple;
	bh=UH4A+HWBhTRvMWjzfcoOhRKBLsLjpkPlOIKGRGbnFik=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:In-Reply-To:
	 Content-Type:References; b=aV6+kKoBN5GwIQ8lutlW4fRjb7XPAitv64PPxxp2J8VU9gdiFvyhlpSEyEb9LVUysgZiAyce1zCdqUaF1bH/jGuGioA/9HrBqNNGLSXk2ml7D5XYbfJfHcJDbdOEcoEjmLostbt7egz8GEi6eS12cFb5v5uNas+vEfhDAnasVWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TLbV+TrO; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260520113753euoutp02c09af9bf36240bbf5cc1b1a3b24bab77~xQxJKeuiz2401524015euoutp02R
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 11:37:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260520113753euoutp02c09af9bf36240bbf5cc1b1a3b24bab77~xQxJKeuiz2401524015euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1779277073;
	bh=SG9cWBSZb9cdd+VlAraK/YpIY6mnUEYNs9cGzZP020I=;
	h=Date:Subject:To:From:In-Reply-To:References:From;
	b=TLbV+TrO0ve40xVIbU3CDLvlCx/euTpF2uyKURmcl7945pCSrJLNAHIZu2cNxBstE
	 4OJabsrUUEsqWE9pgcEul8y4Qn/ucg3UDRrV4Z0PaTOOZ9mF+I+/RjM1mKh2UAUbD+
	 +5bg40zPnUetqiE+gXa/02mbU6pfUQ7vT1RCpug8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260520113753eucas1p2c43f91f695c1c83ec66e640e0ab08243~xQxIwuV303060030600eucas1p2g;
	Wed, 20 May 2026 11:37:53 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260520113752eusmtip1e23f1848fcf7dc1931f89596120192a4~xQxIb8m6J1923419234eusmtip1t;
	Wed, 20 May 2026 11:37:52 +0000 (GMT)
Message-ID: <38f2ff7f-ee5b-44e8-972b-107b73dccd31@samsung.com>
Date: Wed, 20 May 2026 13:37:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] media: s5p-mfc: avoid double free on video register
 failure
To: Guangshuo Li <lgs201920130244@gmail.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260518130929.1003652-1-lgs201920130244@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260520113753eucas1p2c43f91f695c1c83ec66e640e0ab08243
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260518130946eucas1p1a8e6673355aa1b2f7bb35f9070f289ce
X-EPHeader: CA
X-CMS-RootMailID: 20260518130946eucas1p1a8e6673355aa1b2f7bb35f9070f289ce
References: <CGME20260518130946eucas1p1a8e6673355aa1b2f7bb35f9070f289ce@eucas1p1.samsung.com>
	<20260518130929.1003652-1-lgs201920130244@gmail.com>
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-62246-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,kernel.org,lists.infradead.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,samsung.com:mid,samsung.com:dkim]
X-Rspamd-Queue-Id: C387258CE01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18.05.2026 15:09, Guangshuo Li wrote:
> s5p_mfc_probe() allocates video_device instances for both the decoder
> and encoder and releases them from the probe error paths if
> video_register_device() fails.
>
> This can double free a video_device when __video_register_device()
> reaches device_register() and that call fails:
>
>   video_register_device()
>     -> __video_register_device()
>        -> device_register() fails
>           -> put_device(&vdev->dev)
>              -> v4l2_device_release()
>                 -> vdev->release(vdev)
>                    -> video_device_release(vdev)
>
>   s5p_mfc_probe()
>     -> err_dec_reg or err_enc_reg
>        -> video_device_release(vdev)
>
> Use video_device_release_empty() while registering the decoder and encoder
> video devices so that registration failure paths do not free them through
> vdev->release(). s5p_mfc_probe() then releases each video_device exactly
> once from its error path. Restore video_device_release() after successful
> registration so the registered devices keep their normal lifetime
> handling.
>
> This issue was found by a static analysis tool I am developing.
>
> Fixes: d0ce898c39bf ("[media] s5p-mfc: Replaced commas with semicolons")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
Frankly speaking I don't like this dancing with video_device_release_empty() and
video_device_release(). I would rather make video_device struct a part of device
state and use common release function.

> ---
>  drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> index 32eb402d439c..75abb0a8b7a9 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
> @@ -1376,7 +1376,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
>  	}
>  	vfd->fops	= &s5p_mfc_fops;
>  	vfd->ioctl_ops	= get_dec_v4l2_ioctl_ops();
> -	vfd->release	= video_device_release;
> +	vfd->release	= video_device_release_empty;
>  	vfd->lock	= &dev->mfc_mutex;
>  	vfd->v4l2_dev	= &dev->v4l2_dev;
>  	vfd->vfl_dir	= VFL_DIR_M2M;
> @@ -1395,7 +1395,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
>  	}
>  	vfd->fops	= &s5p_mfc_fops;
>  	vfd->ioctl_ops	= get_enc_v4l2_ioctl_ops();
> -	vfd->release	= video_device_release;
> +	vfd->release	= video_device_release_empty;
>  	vfd->lock	= &dev->mfc_mutex;
>  	vfd->v4l2_dev	= &dev->v4l2_dev;
>  	vfd->vfl_dir	= VFL_DIR_M2M;
> @@ -1416,6 +1416,8 @@ static int s5p_mfc_probe(struct platform_device *pdev)
>  		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
>  		goto err_dec_reg;
>  	}
> +
> +	dev->vfd_dec->release = video_device_release;
>  	v4l2_info(&dev->v4l2_dev,
>  		  "decoder registered as /dev/video%d\n", dev->vfd_dec->num);
>  
> @@ -1424,6 +1426,8 @@ static int s5p_mfc_probe(struct platform_device *pdev)
>  		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
>  		goto err_enc_reg;
>  	}
> +
> +	dev->vfd_enc->release = video_device_release;
>  	v4l2_info(&dev->v4l2_dev,
>  		  "encoder registered as /dev/video%d\n", dev->vfd_enc->num);
>  

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


