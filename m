Return-Path: <linux-media+bounces-62119-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHzrBq03DGq2aAUAu9opvQ
	(envelope-from <linux-media+bounces-62119-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:13:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 929A057BF9E
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 12:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 958B9306D613
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 10:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AF948B381;
	Tue, 19 May 2026 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h21upgNJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3283E8324;
	Tue, 19 May 2026 10:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185399; cv=none; b=lElp2bR9VlS/cXWK2skTlWx1tHgeuSeWr4NSRFmAFl+YfV3Hk8iKs1AIUqsVHNXVi7ZvbHAcXuGKOS++X/k4azWT03jUJOdbSl+MBE41BTkW8K7keca+bUd1WFtbpxZzDu713Ls/Inb2pSa58p3Ja4aJoEG95chezXOFAHrRquM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185399; c=relaxed/simple;
	bh=gqTwg04iG1VCtmCJgZsODsu191AL/onfsPNz5zC9wIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IvpsaOZZCVm7hwAmFgDf29MxH4Ah/EedT4V9ITOW2pcLUdannyVFeYdRYqXBOtwhJTKWOQJRyrMkRtzMJ1Gw4J2iy2y76bXlT1EmbIkp/kOL5Bdeb0fEjNtiDLwgHS6K+x0wi6LHGkHY7mEOSrp1YbWeI5iwJYG+dGS3qZ97dPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h21upgNJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEFDC2BCB3;
	Tue, 19 May 2026 10:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779185399;
	bh=gqTwg04iG1VCtmCJgZsODsu191AL/onfsPNz5zC9wIk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=h21upgNJ1EqHXXTEy6Y2/NnPCwbiiJ0yBEKQzY1s7/lfuDGf/VehNwgUU+PwzUJCe
	 o5xLjyotanBKBS6oJTbHExJK3v34vrehvEJSmq6q1faE/1OZsglciPMv+KSgfiR+XN
	 m1GS5Rrthqt/OLgOwFUpLym/qo87mCA85fGkVVnrbJhiwFkaG6e3yFocRe1h6UBukK
	 jk/uPOOu62HHc/WkTJb9f1kXUGOoukqgockNPap46bNFsldb+BsR9VupyzHH4KwERO
	 mOCA9/lwWjMBbZCTmnhEWOVXmh77wQjkBX7QSjq+/Q/A6ptkfjS0XOvPnCeH7P7IWp
	 93z/Np7dEBlNw==
Message-ID: <8787ea87-aa75-4fb5-a729-cd2b54d2ff8a@kernel.org>
Date: Tue, 19 May 2026 11:09:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: venc: avoid double free on video register
 failure
To: Guangshuo Li <lgs201920130244@gmail.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <xMdPPQAJ2BbtNwnxmf1CN7FGbdhSJM7NIXkRCxzFvXv0g01tuvNPvAacsFJaDyBc3cIkIAEfi44ewZ3OGGAcDg==@protonmail.internalid>
 <20260519090819.1041314-1-lgs201920130244@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20260519090819.1041314-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62119-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,linaro.org,cisco.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 929A057BF9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 10:08, Guangshuo Li wrote:
> venc_probe() allocates a video_device with video_device_alloc() and
> releases it from the err_vdev_release error path if
> video_register_device() fails.
> 
> This can double free the video_device when __video_register_device()
> reaches device_register() and that call fails:
> 
>    video_register_device()
>      -> __video_register_device()
>         -> device_register() fails
>            -> put_device(&vdev->dev)
>               -> v4l2_device_release()
>                  -> vdev->release(vdev)
>                     -> video_device_release(vdev)
> 
>    venc_probe()
>      -> err_vdev_release
>         -> video_device_release(vdev)
> 
> Use video_device_release_empty() while registering the device so that
> registration failure paths do not free vdev through vdev->release().
> venc_probe() then releases vdev exactly once from err_vdev_release.
> Restore video_device_release() after successful registration so the
> registered device keeps its normal lifetime handling.
> 
> This issue was found by a static analysis tool I am developing.
> 
> Fixes: aaaa93eda64b ("[media] media: venus: venc: add video encoder files")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>   drivers/media/platform/qcom/venus/venc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index bf53267cb68d..9a5a025607fb 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1579,7 +1579,7 @@ static int venc_probe(struct platform_device *pdev)
>   		return -ENOMEM;
> 
>   	strscpy(vdev->name, "qcom-venus-encoder", sizeof(vdev->name));
> -	vdev->release = video_device_release;
> +	vdev->release = video_device_release_empty;
>   	vdev->fops = &venc_fops;
>   	vdev->ioctl_ops = &venc_ioctl_ops;
>   	vdev->vfl_dir = VFL_DIR_M2M;
> @@ -1590,6 +1590,7 @@ static int venc_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto err_vdev_release;
> 
> +	vdev->release = video_device_release;
>   	core->vdev_enc = vdev;
>   	core->dev_enc = dev;
> 
> --
> 2.43.0
> 

OK so this will get the same feedback as the Iris version which is 
please fix the cleanup path.

If we look at drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c we can see

         ret = video_register_device(jpeg->dec_vdev, VFL_TYPE_VIDEO, -1);
         if (ret) {
                 dev_err(dev, "failed to register video device\n");
                 goto err_vdev_register;
         }
<snip>

err_vdev_register:
         /* Only release if allocation succeeded but registration failed */
         if (jpeg->dec_vdev)
                 video_device_release(jpeg->dec_vdev);

So for Venus and Iris

err_vdev_release:
	if(vdev)
		video_device_release(vdev);

i.e. only release the video device on the error path if the vdev pointer 
is non-NULL.

---
bod

