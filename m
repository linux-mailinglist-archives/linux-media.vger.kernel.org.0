Return-Path: <linux-media+bounces-846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D847D7F4B56
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 16:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 682F1B20E86
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 15:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47B856B7B;
	Wed, 22 Nov 2023 15:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31A114F69;
	Wed, 22 Nov 2023 15:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15B0C433C7;
	Wed, 22 Nov 2023 15:44:26 +0000 (UTC)
Message-ID: <2ecdfff5-501a-452f-af90-0806f463a51c@xs4all.nl>
Date: Wed, 22 Nov 2023 16:44:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 09/11] media: s5p-mfc: Load firmware for each run in
 MFCv12.
Content-Language: en-US, nl
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dillon.minfei@gmail.com,
 david.plowman@raspberrypi.com, mark.rutland@arm.com, robh+dt@kernel.org,
 conor+dt@kernel.org, linux-samsung-soc@vger.kernel.org, andi@etezian.org,
 gost.dev@samsung.com, alim.akhtar@samsung.com, aswani.reddy@samsung.com,
 pankaj.dubey@samsung.com, ajaykumar.rs@samsung.com, linux-fsd@tesla.com,
 Smitha T Murthy <smithatmurthy@gmail.com>
References: <20231025102216.50480-1-aakarsh.jain@samsung.com>
 <CGME20231025102300epcas5p2c266a078b70614dc948b0e47cd5cf788@epcas5p2.samsung.com>
 <20231025102216.50480-10-aakarsh.jain@samsung.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231025102216.50480-10-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/10/2023 12:22, Aakarsh Jain wrote:
> In MFCv12, some section of firmware gets updated at each MFC run.
> Hence we need to reload original firmware for each run at the start.

Huh? This is very weird. This definitely deserves a comment in the actual
code rather than just the commit log.

Do you know what is going on? What part is updated? Are you sure it isn't
a driver bug somehow?

Regards,

	Hans

> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Smitha T Murthy <smithatmurthy@gmail.com>
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> ---
>  drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c
> index b49159142c53..057088b9d327 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c
> @@ -51,8 +51,9 @@ int s5p_mfc_load_firmware(struct s5p_mfc_dev *dev)
>  	 * into kernel. */
>  	mfc_debug_enter();
>  
> -	if (dev->fw_get_done)
> -		return 0;
> +	if (!IS_MFCV12(dev))
> +		if (dev->fw_get_done)
> +			return 0;
>  
>  	for (i = MFC_FW_MAX_VERSIONS - 1; i >= 0; i--) {
>  		if (!dev->variant->fw_name[i])


