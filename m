Return-Path: <linux-media+bounces-43464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A033DBAFF14
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 11:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 370B017D261
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 09:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429B6296BD3;
	Wed,  1 Oct 2025 09:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UM1iNgds"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951331C8611;
	Wed,  1 Oct 2025 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759312747; cv=none; b=YIG/khYvI0wpKg6qX7qvlC4YHT7kTwXsVXHeBdcaJlhJgmnsNJtp+XTjCsrnePVmCoWurw+gKilWTHT80dZYK3Cs+5kMN5qMQLsejSBhK89bKTJd/FLxB/vAEwL/xv0QdpXQFn7sjpAzdETKqJFykhwvaLW95ubsT/bCvGElS64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759312747; c=relaxed/simple;
	bh=NiLZp9i7KhYZ7sEUFqq6diLm8LTYjZqIgXXtKVXc9wU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ERwgsHd/E2jwukrOg2U3EZMPzQBeyOuejncFNBJv53MD0ky+KoTeYbYkPAWhCRP3cFBHJGELORRxmk8qu07YIwvfxiRj3Zg4zgyTgSGz1Z9G8xKt9qH/a7qGcDe47K9kIQd8RMe5KtzpvMEpy+agm1dzY87PbCvMF/08oftCDGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UM1iNgds; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB296C4CEF4;
	Wed,  1 Oct 2025 09:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759312746;
	bh=NiLZp9i7KhYZ7sEUFqq6diLm8LTYjZqIgXXtKVXc9wU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=UM1iNgdsB2mm9da/VZps4E3syLEiJrW8/NUlOaL0mdt9/ZNqBDjWAKWETTm44WuLh
	 60mSZlikZ7IMcJmvkuLObmDxpjG0omSGrlTWCUW0NvHD2q3UwBwUGh9OdkWb/3Dprb
	 Dinj1L3Fbicb6cOpTgFpF7HYhcX3I+upNAaJXqjbY1wXTN+EXUEh3mK6T4+7PuzdYc
	 QNbO3TjZ2zE3xDgp6n2Noc0pkPsx+6S54bXANIRT319sUuMeUxqmlmyD6nzRe2zMgW
	 pOEl5x+iSAiaCROXbwXqNhj8lIZa9b04i/E9wYOHKTbllTM2gx6Teb/bRxrb+3Rthe
	 Jsw1F6rRm3gIQ==
Message-ID: <bffe3d02-076c-47af-8770-2b89c1dccf08@kernel.org>
Date: Wed, 1 Oct 2025 11:59:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] staging: media: av7110: Replace msleep() with
 usleep_range() in tuner function
To: Pratibimba Khadka <pratibimbakhadka@gmail.com>, mchehab@kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)"
 <linux-media@vger.kernel.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20250626173229.10967-1-pratibimbakhadka@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20250626173229.10967-1-pratibimbakhadka@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/06/2025 19:32, Pratibimba Khadka wrote:
> Replace msleep(10) with usleep_range(10000, 12000) in the PLL lock
> waiting loop of nexusca_stv0297_tuner_set_params().
> 
> usleep_range() is preferred over msleep() for short delays (< 20ms) as
> it provides better accuracy and allows the scheduler flexibility for
> power management optimizations. The 10-12ms range maintains the same
> timing behavior while giving the kernel scheduler room to optimize.
> 
> This change improves timing precision during the PLL lock detection
> phase without affecting the overall functionality of the tuner
> configuration process.
> 
> Signed-off-by: Pratibimba Khadka <pratibimbakhadka@gmail.com>

Thank you for your patch, but I'm not taking this patch. It's an old driver,
and msleep is perfectly fine here.

Regards,

	Hans

> ---
>  drivers/staging/media/av7110/av7110.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index bc9a2a40afcb..7f6c610579c8 100644
> --- a/drivers/staging/media/av7110/av7110.c
> +++ b/drivers/staging/media/av7110/av7110.c
> @@ -1827,7 +1827,7 @@ static int nexusca_stv0297_tuner_set_params(struct dvb_frontend *fe)
>  		if (i2c_transfer(&av7110->i2c_adap, &readmsg, 1) == 1)
>  			if (data[0] & 0x40)
>  				break;
> -		msleep(10);
> +		usleep_range(10000, 12000);
>  	}
>  
>  	return 0;


