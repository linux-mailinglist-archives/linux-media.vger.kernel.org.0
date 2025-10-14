Return-Path: <linux-media+bounces-44404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA956BD9207
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 13:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BEBF542D48
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 11:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F422D3101DB;
	Tue, 14 Oct 2025 11:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bf9TjaCj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C9230FC34;
	Tue, 14 Oct 2025 11:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760442741; cv=none; b=ZcEIgtde9O/kyBDXudICgOcjuPMkzcV6tkShw9JBPZs9/lSQGYDXi2hffQHdP/rzBD6wDUVzUKCnG2+yGbF6/khmIUkOmw3RoEEHrQRhEhHRvcN31aMalLH274Ew/jQ7aPmKx9oa+NkoGpIb30ymnugkmOse64e6ulSapr32/WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760442741; c=relaxed/simple;
	bh=6jYK4PZn1XRyhAZB96lG9ldxSf3c2FgryhczY+xLs5I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rD8yItNohTSzEHXWdD8EamemB5jzP/RSIiQcjRiznqSM4FIvGwjup79HkbzapaEf9i3e7uR+S+1ndaaiV48eEco/E0GA0IIP+wnD66FcW/LMi+tw7K4kh37ZJwDdAXZ+3/cyGFGiPqTxajxCf5k+KJ5mAEGZToKMi4iZRWTNOXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bf9TjaCj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFB8C113D0;
	Tue, 14 Oct 2025 11:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760442740;
	bh=6jYK4PZn1XRyhAZB96lG9ldxSf3c2FgryhczY+xLs5I=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Bf9TjaCj6uivY824E3TvQyxKeaQa/AjA3v7hAlGfjJeuOHMJ3b4kPoY3jAdtB5Yl/
	 bi04Y6K1YYDhlH89zRl61BxuRrXzpFFOMqrfLWtyIrmDYDlXpgpHjSOR+6uxkf9AtA
	 pnoFQZ+TCgVP1ztsS/NepKq2TXv2Kz6VSFUf8podLwkG5ltPsd2MpW8Af10TqY7jor
	 w3fi3kW1pdExRnw3UiSvx2tJXwwo07bPFcrTNF9CHEjUWH25E86AkwIaI4UAA2echD
	 4qWFiFH+CB1rsxhRg0rRdXejPEUtNHXFmbCZNUEXXD/Hq1bzoETlzLN4tdYmi8ae/a
	 ZdYGQp4afIzbg==
Message-ID: <37ceef4f-4ed6-4554-9baf-3cddf3e36bd7@kernel.org>
Date: Tue, 14 Oct 2025 13:52:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2] media: i2c: imx214: Exit early on control init errors
To: Ricardo Ribalda <ribalda@chromium.org>,
 Ricardo Ribalda <ribalda@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251014-imx214-smatch-v2-1-04218043086d@chromium.org>
Content-Language: en-US, nl
In-Reply-To: <20251014-imx214-smatch-v2-1-04218043086d@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2025 13:00, Ricardo Ribalda wrote:
> Now we try to initialize all the controls and at the very end check
> ctrl_hdlr->error to check if one of them has failed.
> 
> This confuses smatch, who do not know how to track the state of
> imx214->link_freq.
> 
> drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could be null (see line 1017)
> 
> Fix this by exiting early on control initialization errors.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Right now we are handling this with a quirk in media-ci, if Dan cannot
> fix smatch in a kernel cycle we should merge this patch.

OK, will you keep track of this? This patch is delegated to me, so if you tell me when
it should be merged, then I can do that. And if it is fixed in smatch, then you can just
drop this patch in patchwork, of course.

Until then it just stays in my TODO list.

Regards,

	Hans

> ---
> Changes in v2:
> - Fix typo in commit message commit
> - Move error tag where it belongs (Thanks Hans!)
> - Link to v1: https://lore.kernel.org/r/20250829-imx214-smatch-v1-1-f3d1653b48e4@chromium.org
> ---
>  drivers/media/i2c/imx214.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 94ebe625c9e6ee0fb67fe1d89b48b2f1bf58ffc6..c66f0e18726c3fc15df91c37888a797bcea82134 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -1014,8 +1014,10 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>  						   V4L2_CID_LINK_FREQ,
>  						   imx214->bus_cfg.nr_of_link_frequencies - 1,
>  						   0, imx214->bus_cfg.link_frequencies);
> -	if (imx214->link_freq)
> -		imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +	if (!imx214->link_freq)
> +		goto err_init_ctrl;
> +
> +	imx214->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
>  	/*
>  	 * WARNING!
> @@ -1099,6 +1101,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>  
>  	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx214_ctrl_ops, &props);
>  
> +err_init_ctrl:
>  	ret = ctrl_hdlr->error;
>  	if (ret) {
>  		v4l2_ctrl_handler_free(ctrl_hdlr);
> 
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20250829-imx214-smatch-c4d4d47428d5
> 
> Best regards,


