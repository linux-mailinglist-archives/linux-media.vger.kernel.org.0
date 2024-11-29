Return-Path: <linux-media+bounces-22288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A80229DC054
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52577B22007
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 08:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5C415A85A;
	Fri, 29 Nov 2024 08:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nEP0+H9p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829DD14F12D
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 08:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732868134; cv=none; b=Nvy78G0PThMM+iYLgA0piKNliISH3GLRDAIB1JjYwC+CGN32euDkasfJu1xoHYhXb6pGDttn56sIjERoJteuWSOJ5rDjDlvEa3ojKLhtkc4ux2VghbOThn5NXEWwkdrfDKCURWF4l4MBoH6vKJPve8XK1LGC2+JlSr1vUxoZ028=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732868134; c=relaxed/simple;
	bh=zuWJY3rAst21OOeQ8E+cKjoOerLMQF9e6A2PZYv9NTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ST461t0sAwv3pOTuL+e9hJMrbdLiIEJfM9Tc0MbRLKHVB7o505L79BDArGeMooFkIgAQv5bOest+3owIC1g2lsZx4EI0KABJ0NFlUp4TzL98QoJKnvNNVqooMytrS26TJhx0SmaSQL3KzwASfYmUUu9FgwdVOFF2NUGTVB77T3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nEP0+H9p; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7ea8de14848so1093034a12.2
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 00:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732868131; x=1733472931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YQRswOrDPOFPhZSavtHysUlMBUgEPABmZ0IoJAQmEVw=;
        b=nEP0+H9pBP4ceMWDpZLt4rznqVVpyW6Hve44E5Wfw2nLMgy9X0KlmFHkPBnkdqZgF4
         +zmbUky4OgcrikVdg58ME6EJervsYnuC/Aqie+24BBMAoRDeezsgjZM6WDWzvjkCEh9l
         aVGLoh2pk5soqYrvwYB3apsAr7NJm0m2s0vSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732868131; x=1733472931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQRswOrDPOFPhZSavtHysUlMBUgEPABmZ0IoJAQmEVw=;
        b=RaNOTDR24q1aZ53YDdWTLJUzXIMYfTbiy8BjQU6LmPffnw0kUvHNln0IXV+JDlPiem
         zVOsi4PKJ9tjVLQXxcNJr9pUYPSKhsGppsGazoOj+vObvUXy9oqmK6VNybg4FrZ05M3M
         iQYKgCHB3k6w5ZuwdobYXIvNQaocGsQAZz1jgL6GVvchnQsEhDIdkUL0Fq6sf4kgrYOq
         eKHsy4FFFix3ZJ1Z6QX8DMk/h8LMYH2cIC5FODm0a4WmELVHt/0CP5oQXS4T6NYY9xL3
         a1hXBOTJOpl1u1Y+UxIirA10VKqjqxMwrKVR3+/QhaBC1Ig6h7WFoXL0KMCLVUrWZneU
         OiZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF40y4GFCyJNDSUNhdV28bZHbXIV29GMYBrMHQ2lS4u9TL877hRYlPY7OY9I9uvCnlDLP5rTHs+dAY2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhSPNGsOFSQoHXhd99CdH9MdDz7NBijKXcdbSef/VC78+6nRgU
	zETLhbNsktj8VTMunsNYtKvd2a0ahMJDsD9VA37dKd02GY0KcbF/phWI7eriFSNkV/nH0W8shww
	=
X-Gm-Gg: ASbGncsiKaxNBp/tTivBayFapkE+HJP2g3z70e7EsqhDPeLzLQIhn1KZ9PxeUUCTROo
	2lx9qZCs+ct0RpR0aNp8tZUPNs8SaskLyw+ReGkOxCUpYsOg6GI9ZwhrliIhYu6l3/tkPwTbs8w
	IdnNwKObFfDNAX0OolUiMDg1drHO8z9hYnHu1rKTOOD76AwuFJ8jViLmRsAnbem50yqwjRLM/CI
	J9UFtLffwbe9gf2RR6fFXrTvc6R/16QLv9UZXyMl1DwrJZGUKOGCfjwBmj60gO+obVLm0dhqbSi
	KTlU/VdS1PHF+HZd
X-Google-Smtp-Source: AGHT+IHFnq2IILEhabsmNUER2gJ8r0RLN446aX/8WM1XYO/RCMIamYOAqQ+PsTcUO9+x86dQFXt39Q==
X-Received: by 2002:a05:6a21:2d87:b0:1dc:2360:17ec with SMTP id adf61e73a8af0-1e0e0b10aa0mr15592421637.18.1732868131619;
        Fri, 29 Nov 2024 00:15:31 -0800 (PST)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541761469sm2878713b3a.36.2024.11.29.00.15.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 00:15:30 -0800 (PST)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-724f1ce1732so1246506b3a.1
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 00:15:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDa3LZb5E3uxYYI2hu3Zc+eX9rwppnifsJbw+ZpT2Dc/YqELwrlOEL1QRSUGZYoJCFR1mJrKWuXuDd6Q==@vger.kernel.org
X-Received: by 2002:a17:90b:48cf:b0:2ea:65a1:9861 with SMTP id
 98e67ed59e1d1-2ee097e3d02mr13431332a91.37.1732868129872; Fri, 29 Nov 2024
 00:15:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org> <20241114-uvc-roi-v15-17-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-17-64cfeb56b6f8@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 09:15:17 +0100
X-Gmail-Original-Message-ID: <CANiDSCuMJ4ae7AKkMvQygkmBpU0Fgx2eLdwp_vDuV_gQAzgMQQ@mail.gmail.com>
Message-ID: <CANiDSCuMJ4ae7AKkMvQygkmBpU0Fgx2eLdwp_vDuV_gQAzgMQQ@mail.gmail.com>
Subject: Re: [PATCH v15 17/19] media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Ricardo Ribalda <ribalda@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Nov 2024 at 20:11, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Do not process unknown data types.
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 5000c74271e0..4c88dab15554 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -106,6 +106,12 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
>         struct uvc_control_mapping *map;
>         int ret;
>
> +       if (xmap->data_type > UVC_CTRL_DATA_TYPE_BITMASK) {
> +               uvc_dbg(chain->dev, CONTROL,
> +                       "Unsupported UVC data type %u\n", xmap->data_type);
> +               return -ENOTTY;
This should probably be -EINVAL

I am fixing it on the next version

> +       }
> +
>         map = kzalloc(sizeof(*map), GFP_KERNEL);
>         if (map == NULL)
>                 return -ENOMEM;
>
> --
> 2.47.0.338.g60cca15819-goog
>


-- 
Ricardo Ribalda

