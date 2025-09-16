Return-Path: <linux-media+bounces-42635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04839B5A0B5
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 20:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A4F37A8097
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 18:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAD82D2383;
	Tue, 16 Sep 2025 18:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dKV5EcdR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FF414E2E2
	for <linux-media@vger.kernel.org>; Tue, 16 Sep 2025 18:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758047993; cv=none; b=iEzzTUfMHA8QD2VDsN2Egsnhr2LE/ulht8TYdEvsbfZPHfGZKa73S0hmHbseANf0hcaA3jKDBHb5wXqx8Ot4x43q8Ka3/DfcL6Ulw7baECcKulBykEB32CJKTwcV3nBRK13U/Jt9KcHlObVLlG6yK6DUlzLYfSFZfDHYVAnUc6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758047993; c=relaxed/simple;
	bh=B0enEMFSwMyyhs+cWF9g0TMfM3A87TAdw61eXOIpRUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9G53LRnbKmtdayfOhZaDLHEvqxVWb8ZDTKgYBsBO3xlt6O4q94m44G6R8+MNs7GYUyOSqs+Uq47BeEoTw5WIEn6bGEzUa4kZnhW044FpkhkTzlpgYK3gCByvuSMG7g1ZIJrWPykQ3yGRW7XTmjrqLSp8ugOov3RXfgtPqmoSwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dKV5EcdR; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5679dbcf9d8so5142866e87.0
        for <linux-media@vger.kernel.org>; Tue, 16 Sep 2025 11:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758047990; x=1758652790; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gFe5GgbTNvGX3LB5KwQDm8MARSMgANeSXxzxhTr9uFg=;
        b=dKV5EcdRzF6E4AL4g/UI0P+fRQLArT8TFdv0ZqMg2cnB3UNAugk6fJ79K3LqUO9CtN
         5se0C3wY2dTe+uKUkI6DhzNtqTElcrQVYrfa3Z/5XFquvOtbGvWxGeV1QlXs0D2UV0t9
         eFvq+CNrMtWlfenImuG1jKBlOCiYz5AtliHUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758047990; x=1758652790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFe5GgbTNvGX3LB5KwQDm8MARSMgANeSXxzxhTr9uFg=;
        b=nekcTQuksMgjeVrEPSKSBFy94x1PCcWEHyxD7XnejkhrvGGIz1WDoWx+vy2tkAuQ41
         Pv32S52d780bvbbW51wF/U4SifbHOyS3cgk5OM6uy/4/ja3zkBEgnHOAsPgMB8JlPzcM
         eIxIrH24UB1FKkK1A3/b7eNSmbYpO7JNmFy1XXpSUwa2kl98MTzUgFDQJ+7L6Eb2tvye
         wK8wcxArNq5obMgPtIdAEA7tNhoQcxxxC7BVLzxoclmYGBYOb6hxR04iSMdhFpsbWx2U
         6gzH000Fxcu5envhfG2t4BveybrU5NAW2RKxzQ8ukiKP2fz/hxv+J262ZgmEAFnR2gXY
         WeRw==
X-Gm-Message-State: AOJu0YymvtrpqeLym2bhKs4f60cRVJMEFunU+EmYLwv8qPQFcim7u6dw
	/RIbIiULYzvFr0WB8h8ZOgspbx6N98QCsSacSSb301EU/mN5YPdFWyAS7suXOtElZMvc0tGgc3q
	Kb2U=
X-Gm-Gg: ASbGncs3BjwZtykYO3N1CQojH8e2/UrEG0ncISGo61wg7wrYPQRGTrHK+YM6a0FROA6
	6jCcmqqZcHJLI5/YzQ/vGH7mBKCLQIuh+rhxCvc+WAXh6TGjHOJJOoWuVAv2BXUsAHNSlmb3YXr
	7QwyBSIMnPb0xwnw+rE8tyltsV2aO58V4ZoRZWMiG20lIcjWvBc9z/jXMFzQ01GPGtYJOn0VEh8
	8IOhCmrtp65SvYsLX3aT0dJX+Giwtazoj2DV/BhgNTizEpKLeyPz8nPia5d6vQoBsoS2cCX881G
	yE+uKOyxCb4sthniqQFQ6k+Hi3aOS1Bn9+0Yx7HPe8gfCE0+Iz66WGZzeOl17ICL/o9/us4Y2tB
	1qR5fivvAQjPQJ6Hu1xtKqIP0tXpDXLBOij0rM2eRNmeZR6qlOOIIVPS4l9+g
X-Google-Smtp-Source: AGHT+IFIzCTVLxVcFuOyWcUBTyKGxYoxy5Ln5WAbBhy1BLr4kwrDrWuz7AfAqrvMOe8zVhw/zq/KHQ==
X-Received: by 2002:a05:6512:3599:b0:55f:4512:71f3 with SMTP id 2adb3069b0e04-5704f1ce923mr4457893e87.33.1758047989846;
        Tue, 16 Sep 2025 11:39:49 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e651919d1sm4678775e87.126.2025.09.16.11.39.49
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 11:39:49 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5679dbcf9d8so5142840e87.0
        for <linux-media@vger.kernel.org>; Tue, 16 Sep 2025 11:39:49 -0700 (PDT)
X-Received: by 2002:a05:651c:1118:10b0:338:d42:2a73 with SMTP id
 38308e7fff4ca-351409b51d3mr40724951fa.45.1758047988791; Tue, 16 Sep 2025
 11:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250916161453.24740-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20250916161453.24740-1-laurent.pinchart@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 16 Sep 2025 20:39:36 +0200
X-Gmail-Original-Message-ID: <CANiDSCtYZM25=764=VXj9wFKGRp5JSh=JdtFrAKguWYK2jb3ZQ@mail.gmail.com>
X-Gm-Features: AS18NWA1iIUPNj1SaDvpeliFNlCuQVNRKtQH-xLfW3KcqdbpEr6mEKxDGItR_Fg
Message-ID: <CANiDSCtYZM25=764=VXj9wFKGRp5JSh=JdtFrAKguWYK2jb3ZQ@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Replace dev_dbg() with uvc_dbg()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Sept 2025 at 18:15, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> The uvcvideo driver uses a uvc_dbg() macro that supports enabling debug
> message categories selectively, and prints a KERN_DEBUG message. The
> macro is used through the driver, but one direct dev_dbg() call creeped
> in. Replace it with uvc_dbg().
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 2905505c240c..d58bd888f0bf 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2929,8 +2929,7 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
>                         if (!ctrl->initialized || !ctrl->modified ||
>                             (ctrl->info.flags & UVC_CTRL_FLAG_RESTORE) == 0)
>                                 continue;
> -                       dev_dbg(&dev->intf->dev,
> -                               "restoring control %pUl/%u/%u\n",
> +                       uvc_dbg(dev, CONTROL, "restoring control %pUl/%u/%u\n",
>                                 ctrl->info.entity, ctrl->info.index,
>                                 ctrl->info.selector);

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

>                         ctrl->dirty = 1;
>
> base-commit: 0e2ee70291e64a30fe36960c85294726d34a103e
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda

