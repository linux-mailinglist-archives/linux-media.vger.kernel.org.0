Return-Path: <linux-media+bounces-1755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA6E807060
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 13:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C675281C4B
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 12:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B2937147;
	Wed,  6 Dec 2023 12:57:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162CB36B08;
	Wed,  6 Dec 2023 12:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC61C433CB;
	Wed,  6 Dec 2023 12:57:47 +0000 (UTC)
Message-ID: <2c9b85dc-ebd7-43a7-bb66-d96ba9a28082@xs4all.nl>
Date: Wed, 6 Dec 2023 13:57:46 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v5 09/11] media: s5p-mfc: Load firmware for each run in
 MFCv12.
Content-Language: en-US, nl
To: Aakarsh Jain <aakarsh.jain@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: m.szyprowski@samsung.com, andrzej.hajda@intel.com, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor+dt@kernel.org,
 linux-samsung-soc@vger.kernel.org, andi@etezian.org, gost.dev@samsung.com,
 alim.akhtar@samsung.com, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
 ajaykumar.rs@samsung.com, linux-fsd@tesla.com,
 Smitha T Murthy <smithatmurthy@gmail.com>
References: <20231206063045.97234-1-aakarsh.jain@samsung.com>
 <CGME20231206063134epcas5p2b3b9ca0351cd9c1cb169d7a4a3a30b80@epcas5p2.samsung.com>
 <20231206063045.97234-10-aakarsh.jain@samsung.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231206063045.97234-10-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2023 07:30, Aakarsh Jain wrote:
> In MFCv12, some section of firmware gets updated at each MFC run.
> Hence we need to reload original firmware for each run at the start.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Smitha T Murthy <smithatmurthy@gmail.com>
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> ---
>  drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c
> index b49159142c53..24dd40ae71ec 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_ctrl.c
> @@ -51,8 +51,10 @@ int s5p_mfc_load_firmware(struct s5p_mfc_dev *dev)
>  	 * into kernel. */
>  	mfc_debug_enter();
>  
> -	if (dev->fw_get_done)
> -		return 0;
> +	/* Load MFC v12 firmware for each run when MFC runs sequentially */

You had a much longer explanation in your reply to my original question.

I think it is better if that longer explanation is added here.

Things that are weird and unexpected need good comments, explaining why
it is done, and also what you know and do not know about this.

E.g. you know through trial and error that it is needed (or perhaps you
got information on this some the fw team), but there might be open questions
that are not yet answered.

This is all information that you can't get from the source code since it has
to do with the black box firmware. So putting all you know in a comment is
the best way of communicating this to future readers of the source code.

Regards,

	Hans

> +	if (!IS_MFCV12(dev))
> +		if (dev->fw_get_done)
> +			return 0;
>  
>  	for (i = MFC_FW_MAX_VERSIONS - 1; i >= 0; i--) {
>  		if (!dev->variant->fw_name[i])


