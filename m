Return-Path: <linux-media+bounces-9189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED07B8A3057
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 16:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22B6F1C23FF7
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 14:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E5586146;
	Fri, 12 Apr 2024 14:19:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABF585287;
	Fri, 12 Apr 2024 14:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712931571; cv=none; b=TIz/98ctpy3rTKP08Fn125fEHwhTsMpsz4b0eRAsQz72SxNraxUv6JZ2l8SVOogShERXrXwi6h9q2NGC2gIhFB3XbQbKrUauJ/BdTxX2b9QJ2WBjS24xKWl4wfwYHWssKXA3iKq8O+csN6RxrTkBLMIrlCDE684E3Aag7aOvx5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712931571; c=relaxed/simple;
	bh=h2oX0Twvux6hNDPhI4Z9uhjD0PGAUpoxtwcPhxNDcVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UTwxrRN++t7MEvoPX7Z19NjSmKp/WtqePffRt7XeDXoHXdKN4gn7WhpIFiSBCF0bZXfxViUteEeyP2v0VSz6tetjz2cABibgy/C/7pMiP4sy54iUMpxQc+p7SuNU625b1bV77RO1Kdo6Mzdg+eKvrpG8Na4hqrBWRsF/wuNeJIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2389EC2BD11;
	Fri, 12 Apr 2024 14:19:29 +0000 (UTC)
Message-ID: <1eb4cee6-85bb-4f99-ba77-c415522d6e93@xs4all.nl>
Date: Fri, 12 Apr 2024 16:19:28 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: dvb: as102-fe: Fix as10x_register_addr packing
Content-Language: en-US, nl
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240410-pack-v1-0-70f287dd8a66@chromium.org>
 <20240410-pack-v1-1-70f287dd8a66@chromium.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240410-pack-v1-1-70f287dd8a66@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/04/2024 14:24, Ricardo Ribalda wrote:
> This structure is embedded in multiple other structures that are packed,
> which conflicts with it being aligned.
> 
> drivers/media/usb/as102/as10x_cmd.h:379:30: warning: field reg_addr within 'struct as10x_dump_memory::(unnamed at drivers/media/usb/as102/as10x_cmd.h:373:2)' is less aligned than 'struct as10x_register_addr' and is usually due to 'struct as10x_dump_memory::(unnamed at drivers/media/usb/as102/as10x_cmd.h:373:2)' being packed, which can lead to unaligned accesses [-Wunaligned-access]
> 
> Mark it as being packed.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/dvb-frontends/as102_fe_types.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/dvb-frontends/as102_fe_types.h b/drivers/media/dvb-frontends/as102_fe_types.h
> index 297f9520ebf9d..8a4e392c88965 100644
> --- a/drivers/media/dvb-frontends/as102_fe_types.h
> +++ b/drivers/media/dvb-frontends/as102_fe_types.h
> @@ -174,6 +174,6 @@ struct as10x_register_addr {
>  	uint32_t addr;
>  	/* register mode access */
>  	uint8_t mode;
> -};
> +} __packed;

Changing the layout of a struct is scary, but in this case I believe
as10x_register_addr isn't actually used in this driver at all.

So this looks OK.

Regards,

	Hans

>  
>  #endif
> 


