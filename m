Return-Path: <linux-media+bounces-42215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68090B517C8
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 15:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2408E3AC83C
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 13:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD7E1EF39F;
	Wed, 10 Sep 2025 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hspqfX0T"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC963F9D2;
	Wed, 10 Sep 2025 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757510585; cv=none; b=J8pkElsofL/FxxhYfbPqFkDl5T+0ejUAEWqgYdHWqFDmqGkejD/I+NTQKCiUEZq3IPADYMUHJdBUF/Eh2GtbiefL4taq02VYaf5o84d1GsHtVyA9e6rayTaCvbhMexI2arihJRZym/T6TWkaIvPYbIq4O59ywq0P7SL9FEdpgrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757510585; c=relaxed/simple;
	bh=uvJLdn/LHMR8rpHcfkkhXb0eO5bPuUgCvTkKAJToNqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Khuivml+HyKDpO5S3tlKyeJaXjZIioEtGL2JMUOQTtT6iJ124kmuCCKP9STHc5NQaEFGdJK8twUhElatMQ64E3bLalrWjfTOyJdFRYsbRnnYn/WpDjsradCRdxG+EJEU25mLkUO04VM7HTnEH400yyNd8OlDTNTqfHVMfvHXRBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hspqfX0T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A6AEC4CEF0;
	Wed, 10 Sep 2025 13:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757510585;
	bh=uvJLdn/LHMR8rpHcfkkhXb0eO5bPuUgCvTkKAJToNqQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hspqfX0TZNv29jDRZ0bBP4c2rc4Iki0WCrM/HIIRa+5zHYwdj3OR0kPrTGPftf3g2
	 BKmXbnJz6DDrsvJ9P0Smr+NP7diphX39GkJC3rCTpWVA2YOPoeOUoCnbk2u+UYRl7d
	 QxU3EH+19/f4CaktJTiVR3aUeJplXlbXO7/6VwBuPxVrOGSz+/MW1Bp1xTPRxC5O31
	 NrmzlHsjMMq0vbLrf6dvZOms7++qH0OiUlR+UX1JZ5ltSSsedqza2Rsyql+AokGxrz
	 JSf2Sk4U/FOrVNAZK6H092FDbP2E5iUQ79FjcIaiTannZW+Pf7yv9EioXbUgXV7FeY
	 hRFY1MYwmgS5Q==
Message-ID: <5b896d4f-dfeb-492c-b0b4-a4ab7be8c8ec@kernel.org>
Date: Wed, 10 Sep 2025 14:23:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Add missing header bitfield.h
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 hans@jjverkuil.nl, kernel test robot <lkp@intel.com>
References: <20250909194636.2243539-1-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250909194636.2243539-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/09/2025 20:46, Loic Poulain wrote:
> Add the <linux/bitfield.h> header to prevent erros:
>>> drivers/media/platform/qcom/camss/camss-vfe-340.c:186:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       186 |                         if (bus_status & TFE_BUS_IRQ_MASK_RUP_DONE(i))
>           |                                          ^
>     drivers/media/platform/qcom/camss/camss-vfe-340.c:36:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_RUP_DONE'
>        36 | #define         TFE_BUS_IRQ_MASK_RUP_DONE(sc)   FIELD_PREP(TFE_BUS_IRQ_MASK_RUP_DONE_MASK, BIT(sc))
>           |                                                 ^
>     drivers/media/platform/qcom/camss/camss-vfe-340.c:191:21: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       191 |                         if (bus_status & TFE_BUS_IRQ_MASK_BUF_DONE(i))
>           |                                          ^
>     drivers/media/platform/qcom/camss/camss-vfe-340.c:38:40: note: expanded from macro 'TFE_BUS_IRQ_MASK_BUF_DONE'
>        38 | #define         TFE_BUS_IRQ_MASK_BUF_DONE(sg)   FIELD_PREP(TFE_BUS_IRQ_MASK_BUF_DONE_MASK, BIT(sg))
>           |                                                 ^
>     2 errors generated.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202509100228.xLeeYzpG-lkp@intel.com/
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-340.c | 1 +
>   drivers/media/platform/qcom/camss/camss-vfe-340.c  | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
> index 7a8fbae3009b..22a30510fb79 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
> @@ -6,6 +6,7 @@
>    */
>   
>   #include <linux/completion.h>
> +#include <linux/bitfield.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/kernel.h>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> index 55f24eb06758..30d7630b3e8b 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> @@ -6,6 +6,7 @@
>    */
>   
>   #include <linux/delay.h>
> +#include <linux/bitfield.h>
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
>   #include <linux/iopoll.h>

Acked-by: Bryan O'Donoghue <bod@kernel.org>

