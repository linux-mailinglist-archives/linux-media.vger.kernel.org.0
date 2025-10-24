Return-Path: <linux-media+bounces-45488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8688CC05F05
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 13:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0B35E34CF51
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724B6314A82;
	Fri, 24 Oct 2025 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GVxAglh9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B7F313525
	for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 11:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761304092; cv=none; b=IQsGqpJdhfT9u1RxquLz/TJxdK8flVbobzHUK/2gNZX2vCo66E2d8s9MVkTlHo4XmqqDQYaQM+460cOPjnKmd3Cq/Ds/cMJ0e7J5CsEcfiwvzc/ToKjLkNLiznn/mBg3oJsJS45qSbbjHdfIYm5y3Gwqg/psdBvzxkryv+TUVpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761304092; c=relaxed/simple;
	bh=p2vBATbd4W/6Sx+oB+xHju2R48GBsbHzZDyRWOOtH5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rS3hHoy9L03yWlNTncxYViA+woZotNPSf+rvU/qjSefVRz0no6KoqDx5YbsCgeeu3iXKhSAGPbGtWE5tHxuXab+SvzlclmcwbYnohSN4suKadXhwRI00viF3aqTW9kC0qfCJz1No04Ni5yneo+wE85rMIqIJEIRoBCkkRx9Yf1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GVxAglh9; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-58d29830058so1989617e87.0
        for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 04:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761304089; x=1761908889; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uwxjq6N0Oa6a9ky64rya2i0xqHHd4nBhVfCEWqAzE1w=;
        b=GVxAglh9dcK5hpqZRm9WvehRc5+gLc5e6/SP1eaG7oOfJp3FA2RJmD7UgUPhL4pFzx
         cpPvfavOWNKgbh2BecRh+WfMwf1NblQnZl1+gVWez80d20eq3wa2VuRi6bCrap3IrgcM
         I+3C7BiV6RvBB/vHLbEg5UQ7YNBDcoYeqjjK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761304089; x=1761908889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uwxjq6N0Oa6a9ky64rya2i0xqHHd4nBhVfCEWqAzE1w=;
        b=sBhfa3Y6ha6BRlfQvneYEIczgIO7vtSZSVsS7f0vChiADnSjZLw+TJZ+wFFMDza6Kc
         i0bUWrOx5P70LFdaO+QCfFZWiLbh6lMRxhLmzlZZ4avs4NiNFBpIC5IEsnedX8gUskne
         aFBt+m/voEHeiyjePj1TIeEBJBmtOJM9GddJHJ6GV3gkRs+fVbzptnD1HBpKgIAXZztu
         DY6eBHdafRlGxYwxGLCBBN7Q623RbV42pWZ9FDLbijE1GV37Quays1E+JnobazPVWQfp
         R7FLfGKFJjlbGxZuXD1DgNbw+E05zFc3emt/ShkauGjdo3BysU3bBPfq3tqqN2E4U+2e
         wVHA==
X-Forwarded-Encrypted: i=1; AJvYcCW5gWidBZ/EDxvz7wQoQMbYYmM9F7tUSqIJ+qN1E0MPFgKKeVKT74+3i/6LNnBNdwkGKgS+ZhCr6kdO5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwytAqM+kGvkHfBnEnTLPycILwZqQSYZiV55c5BD8pDcPnpKbZg
	yD1WUSKdgV8Q/f7U9q5f0ITTw5i2Rogha3KNL6M/qpwJymsjvVF3iXeeaK5Cd1pav8CN87eZhDf
	c2gs=
X-Gm-Gg: ASbGncujPHLfA5tbHwTbEdSCYzBTuqKXVf5jWFyfQkhMe8mb7hGJoKyXavXo5s+DSIJ
	+xNuLiGDBOXJ6cVtJ3qCaqC07VbuGynME+29KkwkMbYY6Kye3P/oWyETmcEEo5mH3MxJ/+2sGVi
	je32/HiLLR3ckESwTuUolVktWB3WGxzXwg0fokvsBk/mMvDSYZAzgU9T6Zb+YM5UHwzkVC/3fx/
	RcvTdguTgA8oY8NBEJhKRQSNKhWmwSWf3/GCzdU2I4tWY26OTwhigqMshccPxE3JPoFOrgsXSXH
	7nSzj9FXwKvOqhBy60TL23NLs2baIfpmk0fN5yShZwvyXZ/bMtF/Wa+YDMlQHd+HUN8Q/CPu7Yk
	TUwDy2TAU6QNof0FSwWESgQqYS4Nxt+lg9GHHx4BxwmTx4OaVgGvRA2T6fnB22VaKIgm9Lqx4/Z
	CBpZEQ8sk9yk1Id4Wam0s36Gtyy4OUt4duFMhtFQ==
X-Google-Smtp-Source: AGHT+IGxQlHdbymAfgQ59Q4Nh67lzKFDQIgHMKEz5vjJLfXpeWSZmrrv8ITQpGf13+fGdIjiBHRa2g==
X-Received: by 2002:a05:6512:33c6:b0:583:903e:b5a4 with SMTP id 2adb3069b0e04-591d8566416mr9028100e87.46.1761304088851;
        Fri, 24 Oct 2025 04:08:08 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d20743sm1583230e87.86.2025.10.24.04.08.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 04:08:08 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso1990605e87.2
        for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 04:08:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXRRANN50cBuvgvn11E6j5+cAn5YO9cOLSSoeKCOJx+IfxEPi+8OdwcJQqcWvoiAOKiNZmiADu6Y33QAQ==@vger.kernel.org
X-Received: by 2002:a05:6512:3c82:b0:592:f830:d0d7 with SMTP id
 2adb3069b0e04-592f830d2e6mr1226989e87.40.1761304087473; Fri, 24 Oct 2025
 04:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251024-fix-uvc-v3-0-b7f83c012ca7@realsenseai.com> <20251024-fix-uvc-v3-2-b7f83c012ca7@realsenseai.com>
In-Reply-To: <20251024-fix-uvc-v3-2-b7f83c012ca7@realsenseai.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 24 Oct 2025 13:07:54 +0200
X-Gmail-Original-Message-ID: <CANiDSCst5=72g8weBzLRo5k=O=qvO84+yBCx_tY-5GMzkq+ivg@mail.gmail.com>
X-Gm-Features: AS18NWAc92aCGMlUJx-7jrM34bFeIt68Ze5yd1pN1PVW5M0fhF7qUYTHdu9w5Qw
Message-ID: <CANiDSCst5=72g8weBzLRo5k=O=qvO84+yBCx_tY-5GMzkq+ivg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: uvc: Add RealSense vendor prefix to Intel
 camera comments
To: yogev.modlin@realsenseai.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Yogev

Thanks for your patch
On Fri, 24 Oct 2025 at 07:50, ymodlin via B4 Relay
<devnull+yogev.modlin.realsenseai.com@kernel.org> wrote:
>
> From: ymodlin <yogev.modlin@realsenseai.com>
>
> Update comment strings for 'Intel RealSense' depth cameras to include
> the "RealSense" vendor prefix for better identification.

Please squash 2/3 into 1/3 and update the commit message accordingly.

remember that the subject should start with:

media: uvcvideo:

not
change:

Thanks!

>
> Signed-off-by: ymodlin <yogev.modlin@realsenseai.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index b1457678833e..dbdacc64ea6b 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -3142,7 +3142,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
> -       /* Realsense D410/ASR depth camera */
> +       /* Intel Realsense D410/ASR depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3151,7 +3151,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Realsense D415/ASRC depth camera */
> +       /* Intel Realsense D415/ASRC depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3160,7 +3160,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Realsense D430/AWG depth camera */
> +       /* Intel Realsense D430/AWG depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3169,7 +3169,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Realsense RealSense D4M */
> +       /* Intel Realsense RealSense D4M */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3178,7 +3178,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Realsense D435/AWGC depth camera */
> +       /* Intel Realsense D435/AWGC depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3187,7 +3187,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Realsense D435i depth camera */
> +       /* Intel Realsense D435i depth camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3196,7 +3196,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Realsense D405 Depth Camera */
> +       /* Intel Realsense D405 Depth Camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3205,7 +3205,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Realsense D455 Depth Camera */
> +       /* Intel Realsense D455 Depth Camera */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
> @@ -3214,7 +3214,7 @@ static const struct usb_device_id uvc_ids[] = {
>           .bInterfaceSubClass   = 1,
>           .bInterfaceProtocol   = 0,
>           .driver_info          = UVC_INFO_META(V4L2_META_FMT_D4XX) },
> -       /* Realsense D421 Depth Module */
> +       /* Intel Realsense D421 Depth Module */
>         { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
>                                 | USB_DEVICE_ID_MATCH_INT_INFO,
>           .idVendor             = 0x8086,
>
> --
> 2.43.0
>
>
>


-- 
Ricardo Ribalda

