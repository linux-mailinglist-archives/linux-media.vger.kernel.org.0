Return-Path: <linux-media+bounces-18758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60098989B3A
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 09:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 107311F23500
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 07:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5987816B391;
	Mon, 30 Sep 2024 07:16:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94B9154433;
	Mon, 30 Sep 2024 07:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727680587; cv=none; b=qPGpNfickW2ApqpulzrzfAveCNfDTOIGrIUmIcFCzwbuV8lYKd5W/6TYwHjCP9dS7ZPcM8+ds8teOBnscap6GPbxz0RZIND6t/iQOTLLkO5lAU8nAQw3g3Lh1SQhHIK4mZanMyS3mLuV9kBVpUPsv1n3e3fVqPf6yjefVmiDaWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727680587; c=relaxed/simple;
	bh=/gRySse8lRZPe+9ErshtKhYz+14mv6R8/qSL7eSmGIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+REBfcq+WUDRtynDD8Hf4f7JaywIDq1WxGn3BX/oPEQdh845SGi0SmPHNU5tsecVMSG/INb/7oL8+qdGjyyj3MYuoNmGIasakr/5JpNS3mNJ1aY0c1fjk1cAY92ZATojFBkfkrpxhxp2mDqe/F4xyjoS5geK3786RbwzaELN+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B67C4CECD;
	Mon, 30 Sep 2024 07:16:23 +0000 (UTC)
Message-ID: <6e47b34d-568f-4fee-afd4-3338896a40b0@xs4all.nl>
Date: Mon, 30 Sep 2024 09:16:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] staging: media: ipu3: Use str_down_up()
To: Ricardo Ribalda <ribalda@chromium.org>, Benoit Parrot <bparrot@ti.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20240928-cocci-6-12-v3-0-53fc5ed20be0@chromium.org>
 <20240928-cocci-6-12-v3-2-53fc5ed20be0@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240928-cocci-6-12-v3-2-53fc5ed20be0@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/09/2024 19:23, Ricardo Ribalda wrote:
> The str_down_up() helper simplifies the code and fixes the following cocci
> warning:
> 
> drivers/staging/media/ipu3/ipu3-css.c:229:18-47: opportunity for str_down_up(state & IMGU_STATE_POWER_DOWN)
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  drivers/staging/media/ipu3/ipu3-css.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css.c b/drivers/staging/media/ipu3/ipu3-css.c
> index 1b0a59b78949..bb22375481a0 100644
> --- a/drivers/staging/media/ipu3/ipu3-css.c
> +++ b/drivers/staging/media/ipu3/ipu3-css.c
> @@ -226,7 +226,7 @@ int imgu_css_set_powerup(struct device *dev, void __iomem *base,
>  	state = readl(base + IMGU_REG_STATE);
>  
>  	dev_dbg(dev, "CSS pm_ctrl 0x%x state 0x%x (power %s)\n",
> -		pm_ctrl, state, state & IMGU_STATE_POWER_DOWN ? "down" : "up");
> +		pm_ctrl, state, str_down_up(state & IMGU_STATE_POWER_DOWN));
>  
>  	/* Power up CSS using wrapper */
>  	if (state & IMGU_STATE_POWER_DOWN) {
> 


