Return-Path: <linux-media+bounces-17009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5869625FB
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 13:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FFAC1C236AE
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 11:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90FAF16D334;
	Wed, 28 Aug 2024 11:25:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3001A3FEC;
	Wed, 28 Aug 2024 11:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724844348; cv=none; b=i8VFCt4BX5mVKkp4Ho7CYsXJCUEwmJwhYpfnBi3OzZQ6JmRwYkUjMpZgV8RG5evNDu6Brau3qGEcj22IEFbCReu5lYkI9bin/xbC2EbiSZcFGiRo+3U1zDUT5KJQFd8sbAqJ5IH1WxKx/DFlI7Fkn8RDw8Cy0XOfh9Oc4MBOJ0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724844348; c=relaxed/simple;
	bh=bG9a8zh2xeEqoZz72oWTUeVZ6hn53aa49EzsYAauexc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cVW3YcUbULgyMOLm6z0QE6hkXxL4eMEHEA+VoIJKzNyiz9By5+A/v3zbs3VlGTZMjmud+1SsAueCxkTwzGEw3ctZXXYc6hE+uYYkiLvutwUARy6AIbsQttG1YoMca80VC17j5tugekGqxtmuD+W3BATluGs92G79D1e+tYeSJQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB4DC98EC1;
	Wed, 28 Aug 2024 11:25:46 +0000 (UTC)
Message-ID: <157c368c-f01b-4378-be1f-4af6396d03f9@xs4all.nl>
Date: Wed, 28 Aug 2024 13:25:45 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] input: serio.h: add SERIO_EXTRON_DA_HD_PLUS
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-media@vger.kernel.org
References: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
 <ccbb099a35cb788c7304795927f508cfc2342ff8.1723190258.git.hverkuil-cisco@xs4all.nl>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <ccbb099a35cb788c7304795927f508cfc2342ff8.1723190258.git.hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

It's a trivial patch, but it would be great if you can give an Acked-by
or Reviewed-by.

Regards,

	Hans

On 09/08/2024 09:57, Hans Verkuil wrote:
> Add a new serio ID for the Extron DA HD 4K Plus series of 4K HDMI
> Distribution Amplifiers. These devices support CEC over the serial
> port, so a new serio ID is needed to be able to associate the CEC
> driver.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  include/uapi/linux/serio.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/serio.h b/include/uapi/linux/serio.h
> index ed2a96f43ce4..5a2af0942c9f 100644
> --- a/include/uapi/linux/serio.h
> +++ b/include/uapi/linux/serio.h
> @@ -83,5 +83,6 @@
>  #define SERIO_PULSE8_CEC	0x40
>  #define SERIO_RAINSHADOW_CEC	0x41
>  #define SERIO_FSIA6B	0x42
> +#define SERIO_EXTRON_DA_HD_4K_PLUS	0x43
>  
>  #endif /* _UAPI_SERIO_H */


