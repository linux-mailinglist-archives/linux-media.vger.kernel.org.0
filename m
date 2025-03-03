Return-Path: <linux-media+bounces-27356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C02DBA4C5B2
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B91A216AD80
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 15:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A266215043;
	Mon,  3 Mar 2025 15:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fE7razGy"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB46214A7F
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 15:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017074; cv=none; b=B9sHKE0svi9ng3dK+N55WQsG8Z4yHbB8WgZEbu3tIHEs5XxiYvaCAHqV2OGYVocoEGPOdCD5SRd1TQqNg21za2d62q6Uwm0Z9/OJsS/jRkE7Zj5oKm1AUaDtapHfKPfr7bcsXCRBy+enqdu9CbVXNP1Tjv/0W1GTUCOrMx0uBZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017074; c=relaxed/simple;
	bh=ZWEhpOBidKeV739TbxKmSwQPBROxU2amALqS0k+Joz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BO/ZCVT2gycG7T+XB4EFnBHj13LRgK+vFi3uesPojUeMEO6rKr+ft20LLhAobybU3giCvk6XGzi3EMF1jM8xzSPFCflYuiP95i06yx48iMHLR//7hiq/H3ioVrFxwivPq1tjI24uuumecPTmeC3VFkyVRugsJfIEvZBxdsx+s24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fE7razGy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741017071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K16nr7ubLrzOQPyiKBk0XrIZtdEZRIqjn6VX8zdTz0M=;
	b=fE7razGyN2sYv5x+crTtfmYQa0SMdsHsnEOHEPWhWJI0jZP3GJ1hZl3rIgN2dehsLuUXRi
	/yODWqn+MOso4lhJapgo+Q7e9Qjt8xjCcCqveDWUPptyveBMjR9aeGaovRV4q8tC+OLyBk
	2E/GERfperNHTMEMHVwIeGu4sqIUWvM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-ur7xh2ubPseB6x7nxjpg0g-1; Mon, 03 Mar 2025 10:51:10 -0500
X-MC-Unique: ur7xh2ubPseB6x7nxjpg0g-1
X-Mimecast-MFC-AGG-ID: ur7xh2ubPseB6x7nxjpg0g_1741017069
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-abf68178603so191446566b.0
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 07:51:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741017069; x=1741621869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K16nr7ubLrzOQPyiKBk0XrIZtdEZRIqjn6VX8zdTz0M=;
        b=EbpaC7V6RKjgEoRJ+rzPTH3uS3vf00iw86czMq2LiGC094Qcm7wYg4JJ1O/bQEJoKf
         J6ym9lVpDUgov59QOyXZ6L4mmI6iDQHP/rdGjSX3Umg/p9RcmXf8Sbk23UQjHzSSN/3c
         YaOkqPKmwNLDgSW+L7N/4YRznBU3Py+co8fkztqcWPWm1JQcr1lxbukCFB/ZBR3IaNdN
         XE8bs1KrWSW0I/Kf1FqFtRprcXFhOmvv6K4eIUrW2RPdDqz6DWXfHqoU4Edur25LEqn9
         wWZPt9TxWjn5lDcJpHhTpPZDiJgzP/unDA6/P8CwvlsBpqcz/7J6pih0wrpUUcRtwtFw
         idwA==
X-Gm-Message-State: AOJu0Yy36URwJNtNXC2yByYNTuj1wJ4y2oCAPYwCoSg1+ssOchJxDOmN
	g2CCiMZcFJHZsTKFJPrKcjK4vZUmkj4x2qB/20aKKPGN4HPImJmxdxL5DieYZD4QF03CFEBPvEx
	Tr7XPwZRmFzjcVXZ8oQc1HTFEs31h/oW4alJSr9yo5DCrlPBm49cnvHO94pa/
X-Gm-Gg: ASbGncuaCZpH6smr5F1Oy1c9ujDxCKgPP+EdILjqz2829s6GEU1PtsnYd74qhOOo/O3
	tVlETSW4Rej9ksf1T3xvmTFKEhCjJLkNXMUe7/EWWO0kI5UWqmYq1gQ4ZxWB7fuVxTTj7jAMoSg
	sGdSnwgBln8Slues60j7TbJMPxvreVmIBhH1v6Jy+EFCD1VoUpXJ1Kw7w9NqiextQNIMPjJh3AC
	hCjB98rkdz8F9FGDXwHWgfHoIJPKyHQtWXr+pPkUB4phy4cYM63xO98IDp5yeu6XNPjtWKjORfR
	ARIaa24jmIi07C6Lsdo=
X-Received: by 2002:a17:907:9815:b0:abf:641a:5727 with SMTP id a640c23a62f3a-abf641a5b44mr659814066b.7.1741017069190;
        Mon, 03 Mar 2025 07:51:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+kTY6PYLlUbG/PtqauQPE6Rqw494YQYlUnD9gWRXe8F8l3Ob/E42U5ZFDWENdOI6Jz12+lg==
X-Received: by 2002:a17:907:9815:b0:abf:641a:5727 with SMTP id a640c23a62f3a-abf641a5b44mr659811866b.7.1741017068795;
        Mon, 03 Mar 2025 07:51:08 -0800 (PST)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf56691042sm451143466b.99.2025.03.03.07.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 07:51:08 -0800 (PST)
Message-ID: <07687805-5a56-40b6-b263-d9e319df0c19@redhat.com>
Date: Mon, 3 Mar 2025 16:51:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: uvcvideo: Rollback non processed entities
 on error
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@kernel.org
References: <20250224-uvc-data-backup-v2-0-de993ed9823b@chromium.org>
 <20250224-uvc-data-backup-v2-3-de993ed9823b@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250224-uvc-data-backup-v2-3-de993ed9823b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 24-Feb-25 11:34, Ricardo Ribalda wrote:
> If we wail to commit an entity, we need to restore the
> UVC_CTRL_DATA_BACKUP for the other uncommitted entities. Otherwise the
> control cache and the device would be out of sync.
> 
> Cc: stable@kernel.org
> Fixes: b4012002f3a3 ("[media] uvcvideo: Add support for control events")
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Closes: https://lore.kernel.org/linux-media/fe845e04-9fde-46ee-9763-a6f00867929a@redhat.com/
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 7d074686eef4..89b946151b16 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1864,7 +1864,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  	unsigned int processed_ctrls = 0;
>  	struct uvc_control *ctrl;
>  	unsigned int i;
> -	int ret;
> +	int ret = 0;
>  
>  	if (entity == NULL)
>  		return 0;
> @@ -1893,8 +1893,6 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  				dev->intfnum, ctrl->info.selector,
>  				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
>  				ctrl->info.size);
> -		else
> -			ret = 0;
>  
>  		if (!ret)
>  			processed_ctrls++;
> @@ -1906,10 +1904,14 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  
>  		ctrl->dirty = 0;
>  
> -		if (ret < 0) {
> +		if (ret < 0 && !rollback) {
>  			if (err_ctrl)
>  				*err_ctrl = ctrl;
> -			return ret;
> +			/*
> +			 * If we fail to set a control, we need to rollback
> +			 * the next ones.
> +			 */
> +			rollback = 1;
>  		}
>  
>  		if (!rollback && handle &&
> @@ -1917,6 +1919,9 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  			uvc_ctrl_set_handle(handle, ctrl, handle);
>  	}
>  
> +	if (ret)
> +		return ret;
> +
>  	return processed_ctrls;
>  }
>  
> @@ -1947,7 +1952,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  	struct uvc_video_chain *chain = handle->chain;
>  	struct uvc_control *err_ctrl;
>  	struct uvc_entity *entity;
> -	int ret = 0;
> +	int ret_out = 0;
> +	int ret;
>  
>  	/* Find the control. */
>  	list_for_each_entry(entity, &chain->entities, chain) {
> @@ -1958,17 +1964,23 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  				ctrls->error_idx =
>  					uvc_ctrl_find_ctrl_idx(entity, ctrls,
>  							       err_ctrl);
> -			goto done;
> +			/*
> +			 * When we fail to commit an entity, we need to
> +			 * restore the UVC_CTRL_DATA_BACKUP for all the
> +			 * controls in the other entities, otherwise our cache
> +			 * and the hardware will be out of sync.
> +			 */
> +			rollback = 1;
> +
> +			ret_out = ret;
>  		} else if (ret > 0 && !rollback) {
>  			uvc_ctrl_send_events(handle, entity,
>  					     ctrls->controls, ctrls->count);
>  		}
>  	}
>  
> -	ret = 0;
> -done:
>  	mutex_unlock(&chain->ctrl_mutex);
> -	return ret;
> +	return ret_out;
>  }
>  
>  int uvc_ctrl_get(struct uvc_video_chain *chain,
> 


