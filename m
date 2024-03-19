Return-Path: <linux-media+bounces-7296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EDB87FB06
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 10:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F329FB21924
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 09:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C227D079;
	Tue, 19 Mar 2024 09:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L8QflLpl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1017D075
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710841451; cv=none; b=Nqprsij7adUsQk5IY01PKngDABmCUmMNQ3i9KQZ/H9rolcJLtUAefgVfzynPYx80KAw6bFljmhEb5qz+Pb2p4dCbdFSguVjEiVEq+KTMaS4cqWeotLEAJTbgPx3kjZNZOfgP9NEkJeRUiFdbTfbRkftuQQ4K9ZEElTr3a+EuH7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710841451; c=relaxed/simple;
	bh=K7dtrPof1myHFZzVXEfpBube4p7ne5/TRvoxTuThrgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XY57srAnh+c7Sfv6nTAuvWvtWnwxPS5pJ/YL52o06i+Hn2Nl6GoAxvanU9RQ2DQPGQjwtplJa9rOL3FN1pJbg4i/eFBYgP8STGuzjPe2whEyfJG3Jzv/g9W2VVdxxc2678yf6B8ElmwXLYT49anP7GrRMXvhYuBjAhhYX5VXli0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L8QflLpl; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-47605f03b15so1615797137.0
        for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 02:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710841448; x=1711446248; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PjhFfrCCtfd6iQXKxWQJyRMtTzL2WM41bcwqi12J3Jk=;
        b=L8QflLpl0/STWUpC/KoP2WBuozCTtDfUSvEuTSDJyRw6HfeaVBtp7zk7nV4c6KQjKa
         8w+B0tyxf2eWlp56ZWh4UIjzzbpxi2ZSAP7jAsMCb39LdBtwzMGtKZ7Ug2X1jXYqVwyy
         LkHRdA/LBxK/ADh4cPpt2UxWK5E4KIIRFawls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710841448; x=1711446248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjhFfrCCtfd6iQXKxWQJyRMtTzL2WM41bcwqi12J3Jk=;
        b=az80M27HXlJRJX6WOTiDpuoOPB25dinK86oODM8dmNaOvbb/VjAe/NagM4YH5+K6Cx
         R6ZCbUgj81qzWn9Ly6KOtMufE6/PaT6Cqqypq7lWT7o4TjeLK07A/ZBDkmz9FM1fCnUQ
         /Us2JbIWrFTsIgz6tgyBbWMz5GcXbpGyemb4imUOzwJUiWh0HvmW1kEVenLHRU4SLPcC
         ZTGZVkLcmPjiqdNGUbV1EQyIL0EqGJvxLagg12ttZS/uN2nXSnsKLEsebTkviQYq/IJO
         /I52Rpgg9uYMpFIojXv6LpY6avsqvsbxVGWcgnfQpavwIJT0u3rANy2DlmsxroYpm0+7
         iVpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtYu8FMSZsROOtaPT6GubJu27yYqZsYkE9iiP+7YFH092bWS2T338vaUj1rVdvJedbnqkIgG4Fllc4Is5DtF5Z00uum0rEfun3l6k=
X-Gm-Message-State: AOJu0YzeOMClGSzjM5uNxHUA1npMa8dG5Rk3aoh2qYu2gpFMU25YhKKH
	Zo6GSys8DBSj5lXskdyRxIP4nZdk/kZZg06wwrhrpHPzhh9kYOOc/qIrK7HVbTcB6CLp3palCL4
	=
X-Google-Smtp-Source: AGHT+IGwv595Mq/l3530h5/51cY1lwiE6rNwNoPVbu693LYS6FFvlncOrhu+RIQlRXKNZYwdlOM9xw==
X-Received: by 2002:a05:6102:94e:b0:474:d117:5deb with SMTP id a14-20020a056102094e00b00474d1175debmr1872750vsi.28.1710841447812;
        Tue, 19 Mar 2024 02:44:07 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id hw8-20020a67e708000000b00476a11ddfe8sm124749vsb.12.2024.03.19.02.44.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 02:44:07 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4d43c633fecso1397993e0c.3
        for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 02:44:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmbWteS8NdW3iktEPBC6GwC/DSLXMicKCKpT5VulLlxo9EFfuZc65c0kZCVPDOy2R8kWzZ8HlI6KlrWYP68SzctjXFXJPJ5Vsut7w=
X-Received: by 2002:a05:6122:4a88:b0:4d3:39c3:717c with SMTP id
 fa8-20020a0561224a8800b004d339c3717cmr1832304vkb.1.1710841446521; Tue, 19 Mar
 2024 02:44:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <eb4f7f29a94231c5fa404f7492dba8e7fd9fbb23.1686746422.git.soyer@irl.hu>
 <088902f67634fb0931da7b045e05afe5c8197cdc.1700505816.git.soyer@irl.hu>
In-Reply-To: <088902f67634fb0931da7b045e05afe5c8197cdc.1700505816.git.soyer@irl.hu>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 19 Mar 2024 10:43:52 +0100
X-Gmail-Original-Message-ID: <CANiDSCsXeuNLHSGhqYjkRoyhgW6MZo1xufONbYdm42OcRrj2ng@mail.gmail.com>
Message-ID: <CANiDSCsXeuNLHSGhqYjkRoyhgW6MZo1xufONbYdm42OcRrj2ng@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] media: uvcvideo: uvc_ctrl_get_rel_speed: use 0
 as default
To: Gergo Koteles <soyer@irl.hu>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Gergo

I missed sending the reviewed-by sorry :)

Btw, do you still have access to the device? Could you tell me what
you get from  and UVC_GET_MAX, UVC_GET_MIN for
UVC_CT_PANTILT_RELATIVE_CONTROL and UVC_CT_ZOOM_RELATIVE_CONTROL ?

Thanks!

On Mon, 20 Nov 2023 at 19:53, Gergo Koteles <soyer@irl.hu> wrote:
>
> Devices with pan/tilt controls but without pan/tilt speed controls
> return 1 for the default value of V4L2_CID_PAN_SPEED or
> V4L2_CID_TILT_SPEED. For these controls, the value of 1 means a
> move and that's not a good default.
>
> Currently, for these controls the UVC_GET_DEF query returns
> bPanSpeed or bTiltSpeed of CT_PANTILT_RELATIVE_CONTROL.
>
> According to the UVC 1.5 specification, the default value of bPanSpeed
> or bTiltSpeed should be 1 if the pan/tilt control doesn't support
> speed control.
>
> "If the control does not support speed control for the Tilt control,
> it will return the value 1 in this field for all these requests."
>
> This patch modifies the uvc_ctrl_get_rel_speed to return hardcoded 0
> for UVC_GET_DEF query, because that's the stop or don't move value
> for these V4L2 controls.
>
> Previous discussion
> Link: https://lore.kernel.org/all/CAP_ceTy6XVmvTTAmvCp1YU2wxHwXqnarm69Yaz8K4FmpJqYxAg@mail.gmail.com/
>
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 5e9d3da862dd..e131958c0930 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -444,9 +444,10 @@ static s32 uvc_ctrl_get_rel_speed(struct uvc_control_mapping *mapping,
>                 return -data[first+1];
>         case UVC_GET_MAX:
>         case UVC_GET_RES:
> +               return data[first+1];
>         case UVC_GET_DEF:
>         default:
> -               return data[first+1];
> +               return 0;
>         }
>  }
>
>
> base-commit: be9aac187433af6abba5fcc2e73d91d0794ba360
> --
> 2.42.0
>
>


-- 
Ricardo Ribalda

