Return-Path: <linux-media+bounces-21107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7190B9C1700
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 08:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33C03283B89
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 07:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65B31D1727;
	Fri,  8 Nov 2024 07:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X0vfjyDu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D27A1D07A7
	for <linux-media@vger.kernel.org>; Fri,  8 Nov 2024 07:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731050640; cv=none; b=SPOgj9NkEpcTiguukzJPDlg9CyTOCmhR+RaUyWCDaoSe+7dRRaTNTS3y0LU2ODb36h5l6+j0IVRGqqGkZNmHu8w49hgtDZlPIIW0XKX8500KglS12HGaTQFLmJZjlgcd0/3oHfGpfpffSLHSiwdp7KrCUlSHzS9il43pQ4eNeDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731050640; c=relaxed/simple;
	bh=ht9l2ZSUWXc5h2NR9cMi0Gb1yeSAariDbq8iV0J2AZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ilOZqC9MXtHmUd4+Mx4+7SrhBWYdTMcmaabBGwNT1icS5VU6uFcrsvwMAWie9AzuvR9MUZkths0+euMpXM4zNTQGcgv1C5gsvM0GlVuwOHSor9S4lhicAAYNQEBwFAqIXd1VDhWs5e3+L348IZ2P+ZD3l5qvfvMBUfrOJGdFmSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X0vfjyDu; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20cbcd71012so21186555ad.3
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 23:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731050637; x=1731655437; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsX92SEPfX9pZYxHimQ3VDSrQrPgT/IDDI/YMUQaqAk=;
        b=X0vfjyDud8Rwh5WNQDmp4PZLXdsdf0D4LuLO4yDVC/My47bsDeLaGSdGxTRSG07Dms
         sXAX3mYGajdv2mZW5A5k8gD1RZgc743lNeDVCFfrNuGt288LbjRksxMzZSPfz+tJA61a
         ikLJLyrPhQurO1P4Z/EqHIdzteCs8Z/KswGbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731050637; x=1731655437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZsX92SEPfX9pZYxHimQ3VDSrQrPgT/IDDI/YMUQaqAk=;
        b=L9GrJBX0i3y/rdsFfqfic9iuiUxMNQUD2jvDh/SZ2r8iK14qtEvEs9v7fYCMRcpRte
         iwTCb6THq+Mbj0bICxbTPmYX4Llrz140jB0B6oYKi5uCVp2aTGKegDpVTciM28qrcre1
         bx8cWKbH7pBU1tjmLnrJs0X3g3AdeiCgZ2Yw+SQAxL0dt6kVbIZocANH7tW3yHDLYgHO
         aULQzo4HIBTsMznbrOorGiVBTc2Bj5c2GsFJxLZm9w15kOxmTHRnz5/wpchs6gxHkcq5
         9ZBz2u/2F38KsmYesMUYfpBqmErPkDk8mEc0oMWxsdBby+H/S5j+EllmgZbHIYtdbxi2
         YMqQ==
X-Gm-Message-State: AOJu0Ywlv1cfli1GdDAp/VnjfTjCp0ovIjGRPH6pCDPqzNXrAbWzSk6O
	fnmynbjqaJuMRb4WZgK6WDD59R+he4JN85KzKl/2BITtUlwChTZsJ8eoF0McaXpML+r3KY1TAtg
	=
X-Google-Smtp-Source: AGHT+IEebjAfgnfg2LVbCROjVRBx6eThgYDq12vket2cVweMhR9jU7bQovDYV1DmKTHPXZL5XFi/Pg==
X-Received: by 2002:a17:902:d492:b0:20c:6bff:fc8a with SMTP id d9443c01a7336-211834de588mr19565575ad.2.1731050637376;
        Thu, 07 Nov 2024 23:23:57 -0800 (PST)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com. [209.85.216.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6c35dsm24101855ad.250.2024.11.07.23.23.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 23:23:56 -0800 (PST)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e2e23f2931so1477931a91.0
        for <linux-media@vger.kernel.org>; Thu, 07 Nov 2024 23:23:55 -0800 (PST)
X-Received: by 2002:a17:90b:3847:b0:2e2:e159:8f7b with SMTP id
 98e67ed59e1d1-2e9b16e6415mr2416277a91.3.1731050635305; Thu, 07 Nov 2024
 23:23:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107235130.31372-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20241107235130.31372-1-laurent.pinchart@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 8 Nov 2024 08:23:43 +0100
X-Gmail-Original-Message-ID: <CANiDSCtUR16eJUOaiQ7VatAk5rTy4WMmxUmtCZv=0mUxSES_kQ@mail.gmail.com>
Message-ID: <CANiDSCtUR16eJUOaiQ7VatAk5rTy4WMmxUmtCZv=0mUxSES_kQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix double free in error path
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Ming Lei <tom.leiming@gmail.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Nov 2024 at 00:51, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> If the uvc_status_init() function fails to allocate the int_urb, it will
> free the dev->status pointer but doesn't reset the pointer to NULL. This
> results in the kfree() call in uvc_status_cleanup() trying to
> double-free the memory. Fix it by resetting the dev->status pointer to
> NULL after freeing it.
>
> Fixes: a31a4055473b ("V4L/DVB:usbvideo:don't use part of buffer for USB transfer #4")
> Cc: stable@vger.kernel.org
Reviewed by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_status.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index 02c90acf6964..d269d163b579 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -269,6 +269,7 @@ int uvc_status_init(struct uvc_device *dev)
>         dev->int_urb = usb_alloc_urb(0, GFP_KERNEL);
>         if (!dev->int_urb) {
>                 kfree(dev->status);
> +               dev->status = NULL;
>                 return -ENOMEM;
>         }
>
>
> base-commit: ed61c59139509f76d3592683c90dc3fdc6e23cd6
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda

