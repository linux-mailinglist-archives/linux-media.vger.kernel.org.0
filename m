Return-Path: <linux-media+bounces-21216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E279C3186
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 11:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6C85281A72
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2024 10:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A6E15443F;
	Sun, 10 Nov 2024 10:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="oztQlIp9"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF5914264A;
	Sun, 10 Nov 2024 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731233163; cv=pass; b=cW1tEhgDWQCtM2iT4fAskUY4HgEvwaQDbassTBKFXrUEzw8+h/4M3tyMZJP8y1rIZfXXNa4K89wiieHHbvVdBJYoIR//YKdLsRMQu5xcmE+6Mrd+sKCJo07u8trnwI22bdgo74pzcHVaYfVaxTgyeDWIQMyIN1ZWchwHkXXm9VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731233163; c=relaxed/simple;
	bh=Pllu+OUHoJ8NwyryLcY0ZPUDDYuEZKtWJFEI1VKX6Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flOx1VUJ3Zf39Xb3BII6N0xWxNfApR6ESZV83k5MoQKkyr2fbeUXsshoCbcfTLuK7EDKfP2dM8b+oJvG+cszNvbJHcvNOZjhGZYhed2glIEdYrWEzhVn2Tr68Nkar7WKBT5KSEYjCxdhsQamZr5YB2k21ptTpfEwkPQ6qnnOYu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=oztQlIp9; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4XmSxD4RPJz49Q02;
	Sun, 10 Nov 2024 12:05:52 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1731233153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GSJyOWE4WAYvSphsWbU3m6wKxqDPYhI7turGKUFNKWw=;
	b=oztQlIp9jUONRwWrdK0vgXZqKnAkVbSl72rRkjRzsUxRoPtF7K90lMAYlg9wvTgGzOV62V
	C42E8GNwDQFLg9zi3JDIf/PbRVMPVWpJdFgYLuA+ColhewSI7+gC+CBP2SJkrFgbU0TEil
	0PWK+XsECJVmma8VfODpzcav6A9CCu0RqB9w/eJxSxf5wxi6DhZEUwjjqoL9OtLW+7ElC1
	VYbOIGGyaqLpQBG08u1Kx1DUToYs6CZbNBk/qcfastV0RoyI7eLA8fVl8sPDpSTN2HZAPY
	OFIzTLOOPD4dbn6HAUJ0RjqS4WUsfLz5HZ2ACa7pyfCUc1gXix9De0QcMwHWnw==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1731233153; a=rsa-sha256;
	cv=none;
	b=GvGT4FXOiL2pGxU0W1DtHd/jviUqRNK8EmvfxAPO8DWUB6QhqZZ0msBr8JqD5uQ4ulRhKU
	F3iUUr+MpIK+7tc9JmDWp/D2HQPIP8vTk1DV6b3OC4YIxhVQo9s+ZZjp+FVd0+7OomIEO1
	1pk5FlbDZeZX7BE621kFs+zHUPCMSCaiS/qPAVTT6H8WFBJdymecfIMvaidLt6p/7BHAS9
	Sqg1qTs4IqqEm5YqbRYrMI58XP7+laG+X9b5JlO1sELZdDTY08rTrWP2bnZXy2el0MaOwT
	59BIUffa3RAOV/nzDcEIW+T5IlhgOoYIJoNnw59a94ZdFEU6t9dJsXyazPWO2g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1731233153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GSJyOWE4WAYvSphsWbU3m6wKxqDPYhI7turGKUFNKWw=;
	b=kWLJ32NgklsQjaZcWXK/Ana7xIntIW/lMJGWKhjv2at7eCXu0hLvB0xDdT98LO5eGHNkkW
	IaFqYNR/GCsEfqf5PE8rwXoldHT24hMOr+qJJC/WPbyYyJI+1cuu5tmjQYvNeTnUfifnag
	V1da4jqXKQ0ZbynEzWFSiMpjxNrVOjN0Apl6qMOacX29Y6ajLezX5lBiAaTMRaygZ0DXQi
	/Q3IylJ8tvkw73pVcra1YlosgK3pHlNKCBdkE/EE2fyGaRmUqmG/HVPo9cWx/9yeYVR71o
	1Etox8jihyDd1VwyBdLLDv+uclsG94VfUSbyvJrD0TbolhTWmW2/akaBpoKkZQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 30E17634C22;
	Sun, 10 Nov 2024 12:05:51 +0200 (EET)
Date: Sun, 10 Nov 2024 10:05:50 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 4/6] media: uvcvideo: Create ancillary link for GPIO
 subdevice
Message-ID: <ZzCFfnTVgvY7vURV@valkosipuli.retiisi.eu>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <20241108-uvc-subdev-v2-4-85d8a051a3d3@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-uvc-subdev-v2-4-85d8a051a3d3@chromium.org>

Hi Ricardo,

On Fri, Nov 08, 2024 at 08:25:48PM +0000, Ricardo Ribalda wrote:
> Make an ancillary device between the streaming subdevice and the GPIO

s/device/link/

> subdevice.

Either subdev or sub-device. Same above.

> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_entity.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_entity.c b/drivers/media/usb/uvc/uvc_entity.c
> index c1b69f9eaa56..dad77b96fe16 100644
> --- a/drivers/media/usb/uvc/uvc_entity.c
> +++ b/drivers/media/usb/uvc/uvc_entity.c
> @@ -53,6 +53,16 @@ static int uvc_mc_create_links(struct uvc_video_chain *chain,
>  			return ret;
>  	}
>  
> +	/* Create ancillary link for the GPIO. */
> +	if (chain->dev->gpio_unit && UVC_ENTITY_TYPE(entity) == UVC_ITT_CAMERA) {

This seems to be over 80 for no apparent reason.

> +		struct media_link *link;
> +
> +		link = media_create_ancillary_link(sink,
> +					&chain->dev->gpio_unit->subdev.entity);

And following the alignment rules would push this over 80. I have no
problem with that.

> +		if (IS_ERR(link))
> +			return PTR_ERR(link);
> +	}
> +
>  	return 0;
>  }
>  
> 

-- 
Regards,

Sakari Ailus

