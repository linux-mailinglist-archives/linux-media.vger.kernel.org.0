Return-Path: <linux-media+bounces-43905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEB6BC3771
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 08:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D56674EF502
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 06:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47EE2EA72A;
	Wed,  8 Oct 2025 06:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nz0IC+Ac"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CADD2E8E1F;
	Wed,  8 Oct 2025 06:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759904668; cv=none; b=iiyncJCng6AiXacsUArkPBedKGYvtkciZsVfkrpm1mFnnsN+MyXAGUARUT+ploI+Qi1wJz7pbfwS+dOLIy+p99nIaqFoZwL4GjjBACtSe9avFF7FTzQ8KtsJGvV7HClYBEUrwkR5d4ONLed1+H++vHVknXnrEbLtMNikW73ggVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759904668; c=relaxed/simple;
	bh=MA7BF74wxM3m4ZWXHIzJ1I9FLZfvTKTM8skpWqEEltM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Bndhewxeef0bjY/C8smc/iHFk14d45puSSri62VVkV9nq6Ms87R9WsufCpT3ZJfCjUezmhaA++mb8ZqNYWv29pxULdsnWegoK+cv7WVng21VEUGLG1BqdY3UbF8wbDP71/vguSZyqU1lFeBqvjOnvCEKGPgw1TYYct5OZQueekQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nz0IC+Ac; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4092BC4CEF4;
	Wed,  8 Oct 2025 06:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759904668;
	bh=MA7BF74wxM3m4ZWXHIzJ1I9FLZfvTKTM8skpWqEEltM=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=nz0IC+AcSd+vHhGKRx6aHjxS+RLWjh5FV3fN4vPyVZFqPhY9eVcBoZvMGH/TLloyE
	 LwAYajSUJ1eJwD4HoEn8QP5s17LOi2LE6kdng+CoowWWCwEgqHwaSz6NmIkI4skwc7
	 zyh9hGqrHgRURcQEIv5u+5Re8tE4YRtZkepz4yOmU/tC4T0nSkqscObwJHbN6tEZG4
	 fAdUuob3gbTMDGl3kLy42b/2M2nO6J12aSp4Q9DNV+lkcNfgzwidWl2VSWyE5AdvTw
	 p3ltkntys8beGhS6IVNkQwCLrXAa/RO52b74RJMj0OD51/P0CBZH55ia0SJJIJYb+r
	 OagTahCtGJ3Jg==
Message-ID: <95abc732-b98c-4dd0-aeae-67e4c6ef7b91@kernel.org>
Date: Wed, 8 Oct 2025 08:24:23 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 1/3] media: dvb-usb-v2: lmedm04: Fix firmware macro
 definitions
To: Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>
Cc: Malcolm Priestley <tvboxspy@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Hans Verkuil <hverkuil@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rusty Russell <rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20251008033844.work.801-kees@kernel.org>
 <20251008035938.838263-1-kees@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251008035938.838263-1-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/10/2025 05:59, Kees Cook wrote:
> The firmware filename macros incorrectly included semicolons in their
> string literal definitions. Right now, this wasn't causing any real
> problem, but coming changes to the MODULE_INFO() macro make this more
> sensitive. Specifically, when used with MODULE_FIRMWARE(), this
> created syntax errors during macro expansion:
> 
>     MODULE_FIRMWARE(LME2510_C_S7395);
> 
> expands to:
> 
>     MODULE_INFO(firmware, "dvb-usb-lme2510c-s7395.fw";)
>                                                      ^
>                                           syntax error
> 
> Remove the trailing semicolons from all six firmware filename macro
> definitions. Semicolons should only appear at the point of use, not in
> the macro definition.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>

> ---
> Cc: Malcolm Priestley <tvboxspy@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: <linux-media@vger.kernel.org>
> ---
>  drivers/media/usb/dvb-usb-v2/lmedm04.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> index 0c510035805b..05c18b6de5c6 100644
> --- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
> +++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
> @@ -70,12 +70,12 @@
>  #include "ts2020.h"
>  
>  
> -#define LME2510_C_S7395	"dvb-usb-lme2510c-s7395.fw";
> -#define LME2510_C_LG	"dvb-usb-lme2510c-lg.fw";
> -#define LME2510_C_S0194	"dvb-usb-lme2510c-s0194.fw";
> -#define LME2510_C_RS2000 "dvb-usb-lme2510c-rs2000.fw";
> -#define LME2510_LG	"dvb-usb-lme2510-lg.fw";
> -#define LME2510_S0194	"dvb-usb-lme2510-s0194.fw";
> +#define LME2510_C_S7395	"dvb-usb-lme2510c-s7395.fw"
> +#define LME2510_C_LG	"dvb-usb-lme2510c-lg.fw"
> +#define LME2510_C_S0194	"dvb-usb-lme2510c-s0194.fw"
> +#define LME2510_C_RS2000 "dvb-usb-lme2510c-rs2000.fw"
> +#define LME2510_LG	"dvb-usb-lme2510-lg.fw"
> +#define LME2510_S0194	"dvb-usb-lme2510-s0194.fw"
>  
>  /* debug */
>  static int dvb_usb_lme2510_debug;


