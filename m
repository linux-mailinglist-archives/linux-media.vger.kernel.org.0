Return-Path: <linux-media+bounces-5031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAF98517C8
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 16:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAE402839CF
	for <lists+linux-media@lfdr.de>; Mon, 12 Feb 2024 15:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4183C496;
	Mon, 12 Feb 2024 15:17:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272403C48C
	for <linux-media@vger.kernel.org>; Mon, 12 Feb 2024 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707751065; cv=none; b=KV+B8LUNAU2ypQ+1DzZJX5460AEhdqFA60f+xL3fEaKn9HxnLxn3a0pCDDmkAeUTK4VK6yTDDAdU2hnBOW38YiPBdH++BDPJybvot5EVjG94OzgNk20uNAV78r4mRiuaqkBkDAIYkFnOo9Of+Wx6AcgOm8CeNM/Tbdki24CmvK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707751065; c=relaxed/simple;
	bh=W9rD21hEjtK5p11HgUFmC6p7BHyJT8syFAuJovcK+rs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YjKWCcANKd+VH/dL7mQqXzd0uKLqLHGGH1Bb5Aiv+YvhOkazpp7XJyEF3QRqODxz6CuBDCAgq+jad7IjLrakKmC7wtrF7uXKtXcZBqx02wcARBTIPWHROVxI0RdfZ6bdxRUECR/Bg50rd+T4TZMVZi+pbrB041aHDYPG4Rdxdf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD37C433C7;
	Mon, 12 Feb 2024 15:17:43 +0000 (UTC)
Message-ID: <eb7dde8c-e93c-483c-9f0c-4b413c64c9f6@xs4all.nl>
Date: Mon, 12 Feb 2024 16:17:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: nxp: fix return value check in
 mipi_csis_s_stream()
Content-Language: en-US, nl
To: Andy Chen <andy.chen88@outlook.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Ming Qian <ming.qian@nxp.com>
Cc: linux-media@vger.kernel.org
References: <KL1PR06MB617883F6696C3A07B5B5CEB5E0452@KL1PR06MB6178.apcprd06.prod.outlook.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <KL1PR06MB617883F6696C3A07B5B5CEB5E0452@KL1PR06MB6178.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 07/02/2024 16:36, Andy Chen wrote:
> Hi,
> 
> find_csis_format() may return NULL, and we should determine its return value
> to prevent a fatal error when later functions use it.
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index db8ff5f5c4d3..ac867620e2ba 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -956,6 +956,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
>  
>  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
>  	csis_fmt = find_csis_format(format->code);
> +	if (!csis_fmt)
> +		return -EPIPE;
>  
>  	ret = mipi_csis_calculate_params(csis, csis_fmt);
>  	if (ret < 0)
> 
> This is my first patch, any suggestions are welcome, thanks!

This is missing your Signed-off-by line. Much more information on how
to submit patches is given here:

https://docs.kernel.org/process/submitting-patches.html

But typically patches are formatted like this:

https://patchwork.linuxtv.org/project/linux-media/patch/20231216133422.2534674-2-jernej.skrabec@gmail.com/

One question for this patch: have you observed that find_csis_format() can
return NULL, or do you just think that can happen?

Regards,

	Hans

