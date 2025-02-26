Return-Path: <linux-media+bounces-27056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 211CFA46343
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15EF3167B6D
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 14:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5236719CD0B;
	Wed, 26 Feb 2025 14:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UA0T92Yi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28B122154E
	for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740580922; cv=none; b=nNAs76/Rt8yLC2yK5t75nMlzmp7bgqcM2rxmGIEvb6TSKHVV2rIhL9ENgE8nzQWOCTYffcNXbRUmCq3kDeMueapKItXfqGa7BTqXIbH+UGGV4hCenSqZ1LFRsf8H7Bm0JpG7cS8RyJo0wUOcpTn+xIOuzB8lcGAV1/gihuXQMMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740580922; c=relaxed/simple;
	bh=4FWXayBvVhNTS0E6OWpQiCVezWoKUfgMUUoPmP8gePk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bmc2XZK3lYS+3kf5PEShF6ZiU6cu1/4PVATFd1eNmvF8suwogBm8X5puGPg/n6Jf0ZGlRSC+ljDCSpiULbLGSZOsDf+8ostYcdr/UZVEKveWojYWLH2RXLW9OOZnYFlR51RX9U21PJmh3CbvqOuM/Xu5dJoW9lpwfLIBtDTDShs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UA0T92Yi; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso1203685966b.1
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2025 06:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740580919; x=1741185719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yd4Q4hVeUYOM1ue+qUfzWNg9Q9i3oT/9A9AYIFfGkUc=;
        b=UA0T92YiBtus8ppEPCDg10F757C1qob4i4FvX+s7vjhN06JNq09tElmthayuZTKbKR
         RzBb38v/U1Tzi19jDCCKfJ53nBVMHlTo4YRBTAT+fa36GR1daqknAVGi9+MjMMyGwuYA
         rOmuWLd2B4Pm7oDF7avN9M6Le7mDbT/Ur4DX0LIzc+0kCLKShWuMR7lyzkU9yirIXxsA
         SHikx/C4FcLi+M3Uu8T8uTvLjeMOiachCQHWNAcZlLpyXRW/exId+fnmOo6+wm54cA+Y
         5KlcZvwLo+17WtT5kNkzT6tI7l+preG+EKVTlgCpuLnooIW80GCVX1kZYEmVFa+eTgri
         kjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740580919; x=1741185719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yd4Q4hVeUYOM1ue+qUfzWNg9Q9i3oT/9A9AYIFfGkUc=;
        b=FShNtHQrhT8QyJD/e+lirXyokZB0PIQwo1GKra2nQiEERY8esL5nWeXF7JdbmMvRyX
         HPAk02/RMu+ksrOjg2esiXEdN9o2LkqwF5ZRe84w/KlbgSQztLjqqSgXs7OmSklsLmH0
         gXGSmj5YcNEgQQ/jrtJ815fRB76EBYmTEpgj0j/TaGDXU4kFOcJg/b6JPW5WjjV4692W
         VFblKbbJvFSj0yCC/1/2M8OT5KZkJrYs6Yjd3gx5a3LEkBOGa4io+6EGke7oFTJHnIeq
         3iU7nWOEfHZ89DT/NfqGhxaE/xfXJCy+RIeIldWp7oocMva43eDPqi3Gjdy/Phn0JbPi
         sz5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkOuZ1lAiOAw+EY3X2X4RcyL3rl8zJkx9hlUdd51UteJMol8/qi/LusEs7nu8mMDC0eb3GDUiX76Jx2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaolUVFhJynfFV7DY801EIRosMkeKNcY49P94F1k/Tc2CWcjNW
	u9BVv7Ue8ZBwki6nSL8bsqILV4FN6DpWvv8sIl2hcozWupN2Vxeh1URWDpJ050g=
X-Gm-Gg: ASbGnctTr30oecKwHwUjzu+4LEtvdlLEfPRFeC5uDmmS1Clj6W/+NVJfmD3hSBY4CFo
	16GWf0Ae2IPeQLG5Xo4suSVtEeCp5/CLdX3xj96Ah+VIfyiCSU0fXeJxn6CQY/nGzv055LJZu2e
	uZcMt/0yr62f3uWz0n0YtM83SUXUp7AFmy60nR87Hw2ymBFvOAhk0E5dG4T7q8TsyUhvy+SxFWj
	lUNyAcPFrBxMgxpHBuePIIaZsfqVA3WKsIb9cqjkef+wkvE1XVDZIFia/+0DPA7yERJDadSNdhp
	lB0sbONeigx1ce0Oyzl26f5GHROstpg=
X-Google-Smtp-Source: AGHT+IEqq+wCIO+7KpV9xqIa2Ubw1hCVyP4Ga6WxVj5wemOObN4UBSusPlhMuI5n8yBIpYErWlyqpg==
X-Received: by 2002:a17:906:314d:b0:ab7:9df1:e562 with SMTP id a640c23a62f3a-abc0de55dbcmr1974440866b.48.1740580919225;
        Wed, 26 Feb 2025 06:41:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed2012142sm333883966b.117.2025.02.26.06.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:41:58 -0800 (PST)
Date: Wed, 26 Feb 2025 17:41:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	hverkuil@xs4all.nl, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: imx: fix a potential memory leak in
 imx_media_csc_scaler_device_init()
Message-ID: <450cdcc9-ccb8-4ebd-847c-b106fae2d709@stanley.mountain>
References: <20250226142126.3620482-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226142126.3620482-1-haoxiang_li2024@163.com>

On Wed, Feb 26, 2025 at 10:21:26PM +0800, Haoxiang Li wrote:
> Add video_device_release() in label 'err_m2m' to release the memory
> allocated by video_device_alloc() and prevent potential memory leaks.
> 
> Fixes: a8ef0488cc59 ("media: imx: add csc/scaler mem2mem device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/staging/media/imx/imx-media-csc-scaler.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
> index e5e08c6f79f2..f99c88e87a94 100644
> --- a/drivers/staging/media/imx/imx-media-csc-scaler.c
> +++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
> @@ -913,6 +913,7 @@ imx_media_csc_scaler_device_init(struct imx_media_dev *md)
>  
>  err_m2m:
>  	video_set_drvdata(vfd, NULL);
> +	video_device_release(vfd);

The video_set_drvdata() call is pointless.  It just does:

	vfd.dev->driver_data = NULL;

but that's not necessary if we're just going to free "vfd" on the next
line.

regards,
dan carpenter

>  err_vfd:
>  	kfree(priv);
>  	return ERR_PTR(ret);


