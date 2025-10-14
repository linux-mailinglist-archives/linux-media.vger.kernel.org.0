Return-Path: <linux-media+bounces-44379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0D7BD8462
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8F6724E6899
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5582DF13D;
	Tue, 14 Oct 2025 08:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFBx9bav"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A172D29CF;
	Tue, 14 Oct 2025 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760431756; cv=none; b=Cs3CuDdiGLfPYUa4OxFckHEgenKenpUDkiPi4sgR3drfVW2vIYMHae3U7mBQItOg5YI56iJmFh5xNepPv+1UnFH2545e5y8HFdnV53hzKs0/KuIes3tAKOllEO0rfevhJV+bZrmJBpSd6bk41MQtUu+S+4WhnbXsq/ZBLjlw7Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760431756; c=relaxed/simple;
	bh=ZWsZSog7HrbpnMFVU+7KNiUIgCPM0oI+ET725s9AGU8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pGxwp1uySoV5KwzHl+/ziEQfMbswuytXlbF1RLcA+DPs9yDVBFQO5P25uuxJ37/ulZ89NUfLFEW59oNB2byir97vkqAFeeHFTI8lWcR2gRAzf748z3qlAu/mG981XAoXS0aSEYGY1P3c3oTtIdcDiDeIQLHJW9r1kkvBbHtdckI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFBx9bav; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4939C4CEE7;
	Tue, 14 Oct 2025 08:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760431755;
	bh=ZWsZSog7HrbpnMFVU+7KNiUIgCPM0oI+ET725s9AGU8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=aFBx9bavSewQYx0m7wvFHJ6PS2qVBbu48OarvxkjOyk9gkuCAN7FNSzGIPppPaTpV
	 BmofD7ZSlB3kQm1FaQgwoYqVm9IchNNQq8LAMVrkm0BsDauaUy3hXQR2SNuj6dlSOi
	 r/5G4uQ+QocV4LhgoFaOk0lMXlNuGF1mEhRs5n27Q49UZJvWGVdMFkCuqrrtCpEhHs
	 wQcWw+J4VMxeoTMjclQNl2lMKtq8aWCNKYXRvllXMBqF7UqhqE6vYxJLQbNWGEwNHJ
	 ihWulbP34SilV7VwExQNkvuTJCncN9cvKuZs6p0iSPsDINbMgRqxzk4YjbFte52R8z
	 j3f6oeNlQp9eg==
Message-ID: <5247d3ed-fa93-4839-a867-3ab72c687977@kernel.org>
Date: Tue, 14 Oct 2025 10:49:13 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: i2c: imx214: Exit early on control init errors
To: Ricardo Ribalda <ribalda@chromium.org>,
 Ricardo Ribalda <ribalda@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250829-imx214-smatch-v1-1-f3d1653b48e4@chromium.org>
Content-Language: en-US, nl
In-Reply-To: <20250829-imx214-smatch-v1-1-f3d1653b48e4@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/08/2025 14:21, Ricardo Ribalda wrote:
> Now we try to initialize all the controls and at the very end check
> ctrl_hdlr->error to check if one of them has failed.
> 
> This confuses smatch, who do not know how to track the state of
> imx214->link_freq.
> 
> drivers/media/i2c/imx214.c:1109 imx214_ctrls_init() error: we previously assumed 'imx214->link_freq' could be null (see line 1017)
> 
> Fix this by exiting early on control initi errors.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Right now we are handling this with a quirk in media-ci, if Dan cannot
> fix smatch in a kernel cycle we should merge this patch.
> ---
>  drivers/media/i2c/imx214.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 94ebe625c9e6ee0fb67fe1d89b48b2f1bf58ffc6..7da9e8fa2b622adba53fa6b544bca9859da23e3e 100644
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
> @@ -1101,6 +1103,7 @@ static int imx214_ctrls_init(struct imx214 *imx214)
>  
>  	ret = ctrl_hdlr->error;
>  	if (ret) {
> +err_init_ctrl:

This label should move up two lines, before the 'ret = ctrl_hdlr->error;' line.

Otherwise 'ret' isn't set to the correct error.

Regards,

	Hans

>  		v4l2_ctrl_handler_free(ctrl_hdlr);
>  		dev_err(imx214->dev, "failed to add controls: %d\n", ret);
>  		return ret;
> 
> ---
> base-commit: 16428e2449ab96cce27be6ab17b750b404c76c7c
> change-id: 20250829-imx214-smatch-c4d4d47428d5
> 
> Best regards,


