Return-Path: <linux-media+bounces-15245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A71938E9E
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 13:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D20D51C20EEF
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 11:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB4D16D4C3;
	Mon, 22 Jul 2024 11:58:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1613216D31F;
	Mon, 22 Jul 2024 11:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649485; cv=none; b=UnvX3khmx1I4QxMcSEj72ZVnZuI8cuUq5U4/YH7p8kt5cGygUf4Ba6+q11UQsJ4MixxrAHav+DD694gl+f2EqE9Lg+sz78IJMM71Sd3mhKALhE3XFYakCB0hqQdDrLVtw42EMq451Mna1MonPnuPUXAXtffZ1VzvtZk19KAKKag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649485; c=relaxed/simple;
	bh=pIefJiDQvzZ+kI6sT1pL4p3uPXLo21v4TCmyXBL7+Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pa0IHdOzbfQdrtfjyL92wDcWChrtoCj2FSfe2fBy4sdHT3T0z2RG/SjiU1l2TOGRsMl3Iyjvhw9TQyN/sh2EPcGCk/jnYDf3EGxK/X+r7A8qij+7Pw1tcK169nigFuNXu7T2wlJYQSO2ZIUg2ncqimmhPXWK90Wxgp85w+T79yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 2CBFF61E5FE05;
	Mon, 22 Jul 2024 13:57:48 +0200 (CEST)
Message-ID: <b5d17765-3d4e-416d-beb0-fd0752ef75ec@molgen.mpg.de>
Date: Mon, 22 Jul 2024 13:57:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: uvcvideo: Fix custom control mapping probing
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240722-fix-filter-mapping-v2-1-7ed5bb6c1185@chromium.org>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240722-fix-filter-mapping-v2-1-7ed5bb6c1185@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Ricardo,


Thank you for sending v2.


Am 22.07.24 um 13:52 schrieb Ricardo Ribalda:
> Custom control mapping introduced a bug, where the filter function was
> applied to every single control.
> 
> Fix it so it is only applied to the matching controls.
> 
> The following dmesg errors during probe are now fixed:
> 
> usb 1-5: Found UVC 1.00 device Integrated_Webcam_HD (0c45:670c)
> usb 1-5: Failed to query (GET_CUR) UVC control 2 on unit 2: -75 (exp. 1).
> usb 1-5: Failed to query (GET_CUR) UVC control 3 on unit 2: -75 (exp. 1).
> usb 1-5: Failed to query (GET_CUR) UVC control 6 on unit 2: -75 (exp. 1).
> usb 1-5: Failed to query (GET_CUR) UVC control 7 on unit 2: -75 (exp. 1).
> usb 1-5: Failed to query (GET_CUR) UVC control 8 on unit 2: -75 (exp. 1).
> usb 1-5: Failed to query (GET_CUR) UVC control 9 on unit 2: -75 (exp. 1).
> usb 1-5: Failed to query (GET_CUR) UVC control 10 on unit 2: -75 (exp. 1).
> 
> Reported-by: Paul Menzen <pmenzel@molgen.mpg.de>

Menze*l*

> Closes: https://lore.kernel.org/linux-media/518cd6b4-68a8-4895-b8fc-97d4dae1ddc4@molgen.mpg.de/T/#t
> Cc: stable@vger.kernel.org
> Fixes: 8f4362a8d42b ("media: uvcvideo: Allow custom control mapping")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Paul, could you check if this fixes your issue, thanks!
> ---
> Changes in v2:
> - Replace !(A && B) with (!A || !B)
> - Add error message to commit message
> - Link to v1: https://lore.kernel.org/r/20240722-fix-filter-mapping-v1-1-07cc9c6bf4e3@chromium.org
> ---
>   drivers/media/usb/uvc/uvc_ctrl.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 0136df5732ba..4fe26e82e3d1 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2680,6 +2680,10 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>   	for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
>   		const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
>   
> +		if (!uvc_entity_match_guid(ctrl->entity, mapping->entity) ||
> +		    ctrl->info.selector != mapping->selector)
> +			continue;
> +
>   		/* Let the device provide a custom mapping. */
>   		if (mapping->filter_mapping) {
>   			mapping = mapping->filter_mapping(chain, ctrl);
> @@ -2687,9 +2691,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>   				continue;
>   		}
>   
> -		if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> -		    ctrl->info.selector == mapping->selector)
> -			__uvc_ctrl_add_mapping(chain, ctrl, mapping);
> +		__uvc_ctrl_add_mapping(chain, ctrl, mapping);
>   	}
>   }


Kind regards,

Paul

