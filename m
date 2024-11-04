Return-Path: <linux-media+bounces-20761-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E149BAD34
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 08:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED1A61C20DCC
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 07:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D05199935;
	Mon,  4 Nov 2024 07:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A9cyV0c9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A240193408
	for <linux-media@vger.kernel.org>; Mon,  4 Nov 2024 07:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730705684; cv=none; b=B/VUJ6xhYnvloBYjLRBWD2wCPJxNfkzFbyz7uxQ8+ZNk+48w1y2At2FfgWNMewIc9v2bFDNCW8sL8w4Hdq7e1dmK0CPUwQm0p1WXFihkLnN4xN4ilQVsk7Xj29woasw0YjOkVNNPEiF8u4fFS42RenejkTNIu8NZ8vAZLKaDghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730705684; c=relaxed/simple;
	bh=V+dFhb/xUsIk3i8EI2tPY/v+wCP2kY9EIWEvkHTzqZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jb55WKs+Na+6ZZ8LNWNiXkoxlR7TfU9iAjchQ3ZzJZtXozUjiEMHetgFMfCno0B8DPIRT/CcQXHr/TxXXs9BqPTKc/kC1KHvM/G4+bplHRprDdM9dtHdKiONh7adbUylI6cnYZKiYcEcvC+jzngHVUbNNdQYLwzJ92PklGBfSXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A9cyV0c9; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so2989292b3a.0
        for <linux-media@vger.kernel.org>; Sun, 03 Nov 2024 23:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730705681; x=1731310481; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p1QHYjc5SD6CUTx4Y+pHWVkv+2RRn9R+p/OjFKFK/uI=;
        b=A9cyV0c9j3OH/cxevrZXwQ8GF2rqbcKrt8oIDjj678jXjcNSve0kAsONEAnUVJEB6T
         PN4ZGym3/sCicugGcSd7pWmDRFDDpJ4P368a5N6eJfxdd1D0qW3uL5j7iIZl24udggCv
         hhRu7EBnIJF67aNb1Z5TjyX36zurIM604X8YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730705681; x=1731310481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1QHYjc5SD6CUTx4Y+pHWVkv+2RRn9R+p/OjFKFK/uI=;
        b=QQa+Tu/IR54Ve+pUdQeYKR98Jo7Dg30rYps9psvaTS3WFOwFusWNCiFmufwtykIL/6
         uIJJTqYq4RAG6xNA9Mh/blSrUhYCTH81tjyn+zTDWG/hbM5bw0J/UXB218dHYtPnRVGF
         MmL8L8L/bC7fcXzGEMwpTNaIr0Gs1WTrWbFiTkVjruid+CIdNQL5PlJHBVenQACZKQ4p
         FDZ2VFXTa6GWDreod5O4eHwxZt5XYPVFVBdmXVIV7inxAy390x6l1TijNK87nyvP8575
         6x1UT/SB9my0cb9cCcrHBfePlD0etEddk6EK7xN47GlsUIxmKGbD5lMbBEpz/jxcR49X
         V5Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWkYw98jQVKgWvSuWVkZeeWwXaOge6DDe2X9T3HV8xlFhNpVPnIrDgY+ExQC839QSfDCGvYjdsZohvB7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtAAAcfSS29vD85/qTm/6sUr4liyTywefDoaO+apjzvVjSLv73
	PohPd9pGMXKSn/ZeZTlaKTmCw48r2+K5pQxW/GzMTTb+8DP7bx6IXyZoJ0Te+NkUmUsccpsGL5k
	=
X-Google-Smtp-Source: AGHT+IHksr/8vjabB7tXCHF3yc6LtkvIILttlUxr2cwIpnN693suhfOcX28a8dQHLb2egwGZ/8s/kg==
X-Received: by 2002:a05:6a00:2d89:b0:71e:21:d2d8 with SMTP id d2e1a72fcca58-720c98d32c6mr16473966b3a.7.1730705681524;
        Sun, 03 Nov 2024 23:34:41 -0800 (PST)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com. [209.85.210.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc314670sm6843351b3a.191.2024.11.03.23.34.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Nov 2024 23:34:40 -0800 (PST)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so2989278b3a.0
        for <linux-media@vger.kernel.org>; Sun, 03 Nov 2024 23:34:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXiaw8iD92Zv6mQI5WMD6GxcDFGDq2Udd9vCbhY2q6vzHtq+BlmEHmt/Q85zjVsnN6NHdocH0bVJIjp8w==@vger.kernel.org
X-Received: by 2002:a05:6a20:a11d:b0:1db:e9d8:be4f with SMTP id
 adf61e73a8af0-1dbe9d8bf4amr87587637.29.1730705679311; Sun, 03 Nov 2024
 23:34:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104020959.637736-1-ccc194101@163.com>
In-Reply-To: <20241104020959.637736-1-ccc194101@163.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 4 Nov 2024 08:34:26 +0100
X-Gmail-Original-Message-ID: <CANiDSCtRswXbGn6WBftgCaxavX5Z9OddTc5PTAmr2FVuoGPmeQ@mail.gmail.com>
Message-ID: <CANiDSCtRswXbGn6WBftgCaxavX5Z9OddTc5PTAmr2FVuoGPmeQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo:Create input device for all uvc devices
 with status endpoints.
To: chenchangcheng <ccc194101@163.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi


On Mon, 4 Nov 2024 at 03:10, chenchangcheng <ccc194101@163.com> wrote:
>
> Some applications need to check if there is an input device on the camera
> before proceeding to the next step. When there is no input device,
> the application will report an error.

Out of curiosity, what app are you having issues with?

> Create input device for all uvc devices with status endpoints.
> and only when bTriggerSupport and bTriggerUsage are one are
> allowed to report camera button.
>
> Fixes: 3bc22dc66a4f (media: uvcvideo: Only create input devs if hw supports it)
> Signed-off-by: chenchangcheng <ccc194101@163.com>
> ---
>  drivers/media/usb/uvc/uvc_status.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> index a78a88c710e2..177640c6a813 100644
> --- a/drivers/media/usb/uvc/uvc_status.c
> +++ b/drivers/media/usb/uvc/uvc_status.c
> @@ -44,9 +44,6 @@ static int uvc_input_init(struct uvc_device *dev)
>         struct input_dev *input;
>         int ret;
>
> -       if (!uvc_input_has_button(dev))
> -               return 0;
> -
>         input = input_allocate_device();
>         if (input == NULL)
>                 return -ENOMEM;
> @@ -110,10 +107,12 @@ static void uvc_event_streaming(struct uvc_device *dev,
>                 if (len <= offsetof(struct uvc_status, streaming))
>                         return;
>
> -               uvc_dbg(dev, STATUS, "Button (intf %u) %s len %d\n",
> -                       status->bOriginator,
> -                       status->streaming.button ? "pressed" : "released", len);
> -               uvc_input_report_key(dev, KEY_CAMERA, status->streaming.button);
> +               if (uvc_input_has_button(dev)) {
If there is no button, do you ever reach this point of the code?
> +                       uvc_dbg(dev, STATUS, "Button (intf %u) %s len %d\n",
> +                               status->bOriginator,
> +                               status->streaming.button ? "pressed" : "released", len);
> +                       uvc_input_report_key(dev, KEY_CAMERA, status->streaming.button);
> +               }
>         } else {
>                 uvc_dbg(dev, STATUS, "Stream %u error event %02x len %d\n",
>                         status->bOriginator, status->bEvent, len);
> --
> 2.25.1
>
>


-- 
Ricardo Ribalda

