Return-Path: <linux-media+bounces-18757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8308989B39
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 09:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FA65B2131F
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 07:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0410C16A395;
	Mon, 30 Sep 2024 07:16:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85606154433;
	Mon, 30 Sep 2024 07:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727680579; cv=none; b=PGH8HBoTC0vdBvqyLPUrMqdwkA0xr0dKu/Qk6SrkQGaeTKVRdB//+/UjVs2OsE46ioSv5w9kp6V863bNS0NUpgjkhVPCH485GEVcHpW5CVYUtARENfc3vbeXc1Sqd1x/Dbz0xdIrSO+K6R3HU9k+pCZ3z0Dcs7wdGQ7l1g90qAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727680579; c=relaxed/simple;
	bh=A6jvu3RQmNQIeJkFWGPI0222wxZbB42XJh6cUt2To+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFnkVpssi01ODRZKAXnKSokW9Df7l+R5bsVE5y8w2BhgVpC7xQNz+wtD08zy4kYG6huD5mMafbQ34MbVzsGGpkmVcvQZ6sFux4Vym56iuFBYVosj7JQWNJ9Kd/JT8eueoFzM/oRxV5z9d5NX0X+akGOXP8CzW7vjLsmoHQyV7WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D6A3C4CECD;
	Mon, 30 Sep 2024 07:16:16 +0000 (UTC)
Message-ID: <d1f44043-d182-45e8-94b7-546cda85908a@xs4all.nl>
Date: Mon, 30 Sep 2024 09:16:15 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: ti: cal: Use str_up_down()
To: Ricardo Ribalda <ribalda@chromium.org>, Benoit Parrot <bparrot@ti.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20240928-cocci-6-12-v3-0-53fc5ed20be0@chromium.org>
 <20240928-cocci-6-12-v3-1-53fc5ed20be0@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240928-cocci-6-12-v3-1-53fc5ed20be0@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/09/2024 19:23, Ricardo Ribalda wrote:
> The str_up_down() helper simplifies the code and fixes the following cocci
> warning:
> 
> drivers/media/platform/ti/cal/cal-camerarx.c:194:3-9: opportunity for str_up_down(enable)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  drivers/media/platform/ti/cal/cal-camerarx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
> index 42dfe08b765f..80ad4a19c07b 100644
> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
> @@ -191,7 +191,7 @@ static void cal_camerarx_power(struct cal_camerarx *phy, bool enable)
>  
>  	if (i == 10)
>  		phy_err(phy, "Failed to power %s complexio\n",
> -			enable ? "up" : "down");
> +			str_up_down(enable));
>  }
>  
>  static void cal_camerarx_wait_reset(struct cal_camerarx *phy)
> 


