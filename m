Return-Path: <linux-media+bounces-22025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F191D9D89D2
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A84B828539F
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 15:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23CB1B4143;
	Mon, 25 Nov 2024 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N7ByBQ4N"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7671E29415
	for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 15:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732550315; cv=none; b=YLAvf6aU8uWnYB/AspKon+96RxgTPI01ET/9LYbuz1vgHdFg2irQMT8c1RYI+xkU3KXqyt8UqbfaSWNSrioO/rWmu63AHvnQuiyy9/rmE5YnUIuWd5allQhyb6bICEzIlqaOPqNj26EiYpoYfuy9UDZbqej5TGJVxerF7fKyHuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732550315; c=relaxed/simple;
	bh=n9nsHQU/q3zmY1nwn5s/Sbu8AryLW47j2njd18hXIzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ld/eJ4aNz2XXIJrzMqrpywgh0Wvak4MDvrD9EPyAs2s3KWnINK7IbSFaZU3zHinm2ACXV/LAYUmLkiQ/6dgtB+wScxtDFF2bs/eZqEDKjG7V9A85kDZd7f0K5kUX7mHP3HM74Rf49FVmEtqCTppn1jOxRHamJP9/U5A9cB3ArxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N7ByBQ4N; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732550312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZZEqh+fB722kR+ORsr9nW0uQ3VjG3C3wXwryfTwc4o=;
	b=N7ByBQ4NDIOqQ2sSa/HyGPG0+O8AZJU1dmkABEgJ8h4LpczaG1ck80sXiC2Ga5cib4X5v3
	KuYirZ02e5hLCToGRU3/rhywiTw3fO94u43cShcea19WETIPrXlHrLFPqeI+xoQZp1WCH3
	PXvet1JETpB53yzkN0vhGVouwd2o6zc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-yfScVaqAOWCcJuaIAG4YYw-1; Mon, 25 Nov 2024 10:58:29 -0500
X-MC-Unique: yfScVaqAOWCcJuaIAG4YYw-1
X-Mimecast-MFC-AGG-ID: yfScVaqAOWCcJuaIAG4YYw
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d035c8f3afso1775146a12.2
        for <linux-media@vger.kernel.org>; Mon, 25 Nov 2024 07:58:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732550308; x=1733155108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZZEqh+fB722kR+ORsr9nW0uQ3VjG3C3wXwryfTwc4o=;
        b=Ue+Q766wvslFR77u6bPnQqWmoqcKuowXoLclw6HBzv13OqyRZyRrT5/mrE3KVTFeQs
         p2RJYnd6JF3j+Uw4xuiDhk4qkliuUrRjWjN74hBRzfYkKpFJEO2qXJBnLcyBRv4SCH+H
         pHLdgu7x5Kv/m8o6ptQHzCVnqIiz58o+yBCjiHjUUlLHIJRSRzXVjUrrvIfkPPqYI5uT
         U5L0T8AIv+nWPYLqfLSUz8+cTep/nQp1Yv1LrTEczsTFhH2xXQLunxkx2pgRKToUUwQf
         kYVeJwKRxHmwKM4ErKO3h+AdCGu8mfsiijxoa1nmt1BZ2o3kXWNwBGUrjES4NlzVhlme
         Sbhw==
X-Forwarded-Encrypted: i=1; AJvYcCVI33vBdIDG3zhBN0J5Pic0KqI75dOFSlY/Z7H71UhM1Yqgr3Tpxpcw+lcPCvVl51vx4LvB8Fm9ZEUTMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIpUt3z6yHiUTC+ZZun39pyqIKBKLX3rcLbWZByHdSnXFOKHcu
	M/M4Uh52q+yz0SSaPJMxEKiqbXH+f4Zb2jfBbh5ttNgzeAovFyVcUOft3B187f3RkTo57L+7rgh
	a1jV7s8H4DXWUUZ7kET5mrRH2ScsV7B4lMlY4wiwTiRsLHiMerCSGGYxVaJy2
X-Gm-Gg: ASbGncvsCBcxpSNfYP/mR1+QCgwEISS0h3s7L+PZXWGq0Ux6meb3S1sHnz6t0FHLXK3
	ZbEM5BY2vHIUQAvAr961Z87hZzUR08yEQvbL1qWybuY9ou7RNsecLHDq66ETNJoDd3t3chEomCB
	pu03nh1pkJFVV5/KfZKleUR/TZ72ALSc4F8PNj3qu2DAQUIwE/NIeey3RB5RDaLBRhVJ+6aCZeI
	X+HCofICDHcLqBwHcJwzD2YlztxOkP7zkiu3ihaZyEO2bFKD/8GV5bXJZF0j0818B8zCGb7TBpi
	+3iVx3wlMK+wyzWcxyusphOylTch3FqcJBosF3J6aHkvpipFT9+DA3JLskor0uKIfV0sGo/7axr
	yW7yZ5yzN+LO6uURYHOg3ajkg
X-Received: by 2002:a05:6402:40d2:b0:5cf:c188:81be with SMTP id 4fb4d7f45d1cf-5d0205de24bmr13356974a12.13.1732550307837;
        Mon, 25 Nov 2024 07:58:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXcQ2J9BAdoBQsYcHjaOgnNAXgrgaeYpF7lcRavj36a+9OA6UPm0GDCsEzeRAO8Ia7PwUe7w==
X-Received: by 2002:a05:6402:40d2:b0:5cf:c188:81be with SMTP id 4fb4d7f45d1cf-5d0205de24bmr13356944a12.13.1732550307466;
        Mon, 25 Nov 2024 07:58:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d02217169asm4234224a12.73.2024.11.25.07.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 07:58:26 -0800 (PST)
Message-ID: <451d1f96-f3d8-47f9-a8a6-d0a98c71901c@redhat.com>
Date: Mon, 25 Nov 2024 16:58:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 06/19] media: uvcvideo: Handle uvc menu translation
 inside uvc_set_le_value
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ricardo Ribalda <ribalda@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-6-64cfeb56b6f8@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241114-uvc-roi-v15-6-64cfeb56b6f8@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
> Be consistent with uvc_get_le_value() and do the menu translation there.
> 
> Note that in this case, the refactor does not provide much... but
> consistency is a nice feature.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 77f7058ec966..c975e0ab479b 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -939,6 +939,8 @@ static void uvc_set_le_value(struct uvc_control_mapping *mapping,
>  	int offset = mapping->offset;
>  	u8 mask;
>  
> +	if (mapping->v4l2_type == V4L2_CTRL_TYPE_MENU)
> +		value = uvc_mapping_get_menu_value(mapping, value);
>  	/*
>  	 * According to the v4l2 spec, writing any value to a button control
>  	 * should result in the action belonging to the button control being

There is a:

	if (mapping->v4l2_type == V4L2_CTRL_TYPE_BUTTON)

below this comment block, maybe put the if (mapping->v4l2_type == V4L2_CTRL_TYPE_MENU) below
that as "else if (mapping->v4l2_type == V4L2_CTRL_TYPE_BUTTON) ... "

Or maybe make this a switch-case on mapping->v4l2_type right away for future
special handling of other types ?

Otherwise this looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans






> @@ -1988,23 +1990,23 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  		if (!test_bit(xctrl->value, &mapping->menu_mask))
>  			return -EINVAL;
>  
> -		value = uvc_mapping_get_menu_value(mapping, xctrl->value);
> -
>  		/*
>  		 * Valid menu indices are reported by the GET_RES request for
>  		 * UVC controls that support it.
>  		 */
>  		if (mapping->data_type == UVC_CTRL_DATA_TYPE_BITMASK) {
> +			int val = uvc_mapping_get_menu_value(mapping,
> +							     xctrl->value);
>  			if (!ctrl->cached) {
>  				ret = uvc_ctrl_populate_cache(chain, ctrl);
>  				if (ret < 0)
>  					return ret;
>  			}
>  
> -			if (!(uvc_get_ctrl_bitmap(ctrl, mapping) & value))
> +			if (!(uvc_get_ctrl_bitmap(ctrl, mapping) & val))
>  				return -EINVAL;
>  		}
> -
> +		value = xctrl->value;
>  		break;
>  
>  	default:
> 


