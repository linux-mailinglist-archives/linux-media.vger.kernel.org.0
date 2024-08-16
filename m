Return-Path: <linux-media+bounces-16376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 543879548BE
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 14:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79A791C23C90
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2024 12:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86EC51B4C26;
	Fri, 16 Aug 2024 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eaE3qJFd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7AD155A43
	for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 12:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811434; cv=none; b=CwvZLBK4t0ckIayb0HZ4tnJpFnc8mjWpEmPjtvWxuN2DFXuYmnCBR05lkKQHTiopba3jIOJ1VqefnVluaQ7ZYV7v96Gz7HZajpvqW4q+hBrHf6gUueYSFFSiA9UC2fla4ytxBGNNLPIJWypzG6+FXjaOP6RVjVu2HWgGTuqzJ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811434; c=relaxed/simple;
	bh=2GSzoiyKMiwuW/RfJJ5i8kkgbzhghA4P1g2K4QpBjLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZscARAHALNUKBsaR+DR7H0EqVNnaQ2j9g/20Vhzp0BOdAoduOqzG4QBHX7pdTbNCodY2mH+XoTkA15aabMA0U4n6mD41lc0M8ic4td+/yewjvtY+VquIm4RBKYdoBksJjmhWfpJ9dg234r13JlxEx4b2M0FTSTf4wKi6XkcjEUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eaE3qJFd; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7d89bb07e7so222727766b.3
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 05:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811430; x=1724416230; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/zsQ2AT0Bnh8gAvOcK04FWb59JsFbwO7jWLVExppFh0=;
        b=eaE3qJFdesj1pC+Y5cJWfcv0dbu5oS+CJ2VNvC8m5yGEsJasnHCL77MM3P4Varo+fN
         rj9Mke18Gc5fMRs3MHYUM5CszM3AMOxWpybuJrHoGQqA6I+jmcJRc91c33hxowtfhDIM
         IpvCDTZXxoQbR38sgfnZjCVXZRI4ln+kXiBCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811430; x=1724416230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zsQ2AT0Bnh8gAvOcK04FWb59JsFbwO7jWLVExppFh0=;
        b=tFK8pX39BAD8yNyBTEqrd+QD0dgHERP5fJve/QIcFcEFWrJ4CxtxB6x95JRSTNO42p
         ngtVo0StjsP+19uyiHofD2zzoRHi4s5UOHBv1IXddxgBSC8xjPjrib8d+XjfUTQ9nhQu
         wuhcn/RnNE0fItReOfA2wIibEa2U+s8tNn4UunQUwJslJJ8Po443F4wVkTfyqaEgRZ3/
         fc15JPQRCXICcjPs9GeIr0k14VsEJ6b/esm+0Jn2UeXxpNKG0xWCuPatsEJ72SHSEefw
         rVcVVCwUJd8zbv9JV8ETri7GkBK0v3qd5JsWEdKfiewXIofaYNuSHlk5U4PpkI4K1sCN
         66cA==
X-Gm-Message-State: AOJu0YybbN5wz/5XDb868FYTrCPR0zBtJ6iRTuS8FdpEvNxl85iNabOM
	EhEyW3JuJitOejZBP6+tRykXQrEpkkQcGrzwOz+N5isA1+ZPVTtpt0ylEuWqMDFV6Q/mW+8ImPw
	fYg==
X-Google-Smtp-Source: AGHT+IFBd7r2UoJzN1C4tI/BuPe0SHlqgyPgKzsUc5D2gm5vxTtRyTPQgV+KleHHKBXZG6h2ExoZuA==
X-Received: by 2002:a17:907:e6d3:b0:a7a:abd8:77a5 with SMTP id a640c23a62f3a-a8392a11c10mr177903566b.43.1723811430239;
        Fri, 16 Aug 2024 05:30:30 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839342e9sm247977866b.110.2024.08.16.05.30.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 05:30:29 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7ab5fc975dso208312066b.1
        for <linux-media@vger.kernel.org>; Fri, 16 Aug 2024 05:30:29 -0700 (PDT)
X-Received: by 2002:a17:907:da2:b0:a7a:bbbb:6243 with SMTP id
 a640c23a62f3a-a8392a15b4bmr192355066b.51.1723811428946; Fri, 16 Aug 2024
 05:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814-coccinelle-followup-v2-0-88b4e4a9af56@chromium.org> <20240814-coccinelle-followup-v2-1-88b4e4a9af56@chromium.org>
In-Reply-To: <20240814-coccinelle-followup-v2-1-88b4e4a9af56@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 14:30:16 +0200
X-Gmail-Original-Message-ID: <CANiDSCuOmE32Hhw6QC7jfO+gPauxOrPZis-4NhDL8eXO1a_JWg@mail.gmail.com>
Message-ID: <CANiDSCuOmE32Hhw6QC7jfO+gPauxOrPZis-4NhDL8eXO1a_JWg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: drivers/media/dvb-core: Split dvb_frontend_open()
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi

On Wed, 14 Aug 2024 at 16:10, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Move the actual opening to its own function.
>
> Not intended code change. This is a preparation for the next patch.
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/dvb-core/dvb_frontend.c | 143 +++++++++++++++++-----------------
>  1 file changed, 70 insertions(+), 73 deletions(-)
>
> diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
> index 4f78f30b3646..e81b9996530e 100644
> --- a/drivers/media/dvb-core/dvb_frontend.c
> +++ b/drivers/media/dvb-core/dvb_frontend.c
> @@ -2760,80 +2760,13 @@ static __poll_t dvb_frontend_poll(struct file *file, struct poll_table_struct *w
>         return 0;
>  }
>
> -static int dvb_frontend_open(struct inode *inode, struct file *file)
> +static int __dvb_frontend_open(struct inode *inode, struct file *file)
>  {
>         struct dvb_device *dvbdev = file->private_data;
>         struct dvb_frontend *fe = dvbdev->priv;
>         struct dvb_frontend_private *fepriv = fe->frontend_priv;
> -       struct dvb_adapter *adapter = fe->dvb;
>         int ret;
>
> -       dev_dbg(fe->dvb->device, "%s:\n", __func__);
> -       if (fe->exit == DVB_FE_DEVICE_REMOVED)
> -               return -ENODEV;
> -
> -       if (adapter->mfe_shared == 2) {
> -               mutex_lock(&adapter->mfe_lock);
> -               if ((file->f_flags & O_ACCMODE) != O_RDONLY) {
> -                       if (adapter->mfe_dvbdev &&
> -                           !adapter->mfe_dvbdev->writers) {
> -                               mutex_unlock(&adapter->mfe_lock);
> -                               return -EBUSY;
> -                       }
> -                       adapter->mfe_dvbdev = dvbdev;
> -               }
> -       } else if (adapter->mfe_shared) {
> -               mutex_lock(&adapter->mfe_lock);
> -
> -               if (!adapter->mfe_dvbdev)
> -                       adapter->mfe_dvbdev = dvbdev;
> -
> -               else if (adapter->mfe_dvbdev != dvbdev) {
> -                       struct dvb_device
> -                               *mfedev = adapter->mfe_dvbdev;
> -                       struct dvb_frontend
> -                               *mfe = mfedev->priv;
> -                       struct dvb_frontend_private
> -                               *mfepriv = mfe->frontend_priv;
> -                       int mferetry = (dvb_mfe_wait_time << 1);
> -
> -                       mutex_unlock(&adapter->mfe_lock);
> -                       while (mferetry-- && (mfedev->users != -1 ||
> -                                             mfepriv->thread)) {
> -                               if (msleep_interruptible(500)) {
> -                                       if (signal_pending(current))
> -                                               return -EINTR;
> -                               }
> -                       }
> -
> -                       mutex_lock(&adapter->mfe_lock);
> -                       if (adapter->mfe_dvbdev != dvbdev) {
> -                               mfedev = adapter->mfe_dvbdev;
> -                               mfe = mfedev->priv;
> -                               mfepriv = mfe->frontend_priv;
> -                               if (mfedev->users != -1 ||
> -                                   mfepriv->thread) {
> -                                       mutex_unlock(&adapter->mfe_lock);
> -                                       return -EBUSY;
> -                               }
> -                               adapter->mfe_dvbdev = dvbdev;
> -                       }
> -               }
> -       }
> -
> -       if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl) {
> -               if ((ret = fe->ops.ts_bus_ctrl(fe, 1)) < 0)
> -                       goto err0;
> -
> -               /* If we took control of the bus, we need to force
> -                  reinitialization.  This is because many ts_bus_ctrl()
> -                  functions strobe the RESET pin on the demod, and if the
> -                  frontend thread already exists then the dvb_init() routine
> -                  won't get called (which is what usually does initial
> -                  register configuration). */
> -               fepriv->reinitialise = 1;
> -       }

This branch was missing in the patch. I will send a new version.

Hopefuly someone with access to the hardware can test it?


> -
>         if ((ret = dvb_generic_open(inode, file)) < 0)
>                 goto err1;
>
> @@ -2871,8 +2804,6 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
>
>         dvb_frontend_get(fe);
>
> -       if (adapter->mfe_shared)
> -               mutex_unlock(&adapter->mfe_lock);
>         return ret;
>
>  err3:
> @@ -2891,9 +2822,75 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
>  err1:
>         if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl)
>                 fe->ops.ts_bus_ctrl(fe, 0);
> -err0:
> -       if (adapter->mfe_shared)
> -               mutex_unlock(&adapter->mfe_lock);
> +
> +       return ret;
> +}
> +
> +static int dvb_frontend_open(struct inode *inode, struct file *file)
> +{
> +       struct dvb_device *dvbdev = file->private_data;
> +       struct dvb_frontend *fe = dvbdev->priv;
> +       struct dvb_adapter *adapter = fe->dvb;
> +       int ret;
> +
> +       dev_dbg(fe->dvb->device, "%s:\n", __func__);
> +       if (fe->exit == DVB_FE_DEVICE_REMOVED)
> +               return -ENODEV;
> +
> +       if (!adapter->mfe_shared)
> +               return __dvb_frontend_open(inode, file);
> +
> +       if (adapter->mfe_shared == 2) {
> +               mutex_lock(&adapter->mfe_lock);
> +               if ((file->f_flags & O_ACCMODE) != O_RDONLY) {
> +                       if (adapter->mfe_dvbdev &&
> +                           !adapter->mfe_dvbdev->writers) {
> +                               mutex_unlock(&adapter->mfe_lock);
> +                               return -EBUSY;
> +                       }
> +                       adapter->mfe_dvbdev = dvbdev;
> +               }
> +       } else {
> +               mutex_lock(&adapter->mfe_lock);
> +
> +               if (!adapter->mfe_dvbdev) {
> +                       adapter->mfe_dvbdev = dvbdev;
> +               } else if (adapter->mfe_dvbdev != dvbdev) {
> +                       struct dvb_device
> +                               *mfedev = adapter->mfe_dvbdev;
> +                       struct dvb_frontend
> +                               *mfe = mfedev->priv;
> +                       struct dvb_frontend_private
> +                               *mfepriv = mfe->frontend_priv;
> +                       int mferetry = (dvb_mfe_wait_time << 1);
> +
> +                       mutex_unlock(&adapter->mfe_lock);
> +                       while (mferetry-- && (mfedev->users != -1 ||
> +                                             mfepriv->thread)) {
> +                               if (msleep_interruptible(500)) {
> +                                       if (signal_pending(current))
> +                                               return -EINTR;
> +                               }
> +                       }
> +
> +                       mutex_lock(&adapter->mfe_lock);
> +                       if (adapter->mfe_dvbdev != dvbdev) {
> +                               mfedev = adapter->mfe_dvbdev;
> +                               mfe = mfedev->priv;
> +                               mfepriv = mfe->frontend_priv;
> +                               if (mfedev->users != -1 ||
> +                                   mfepriv->thread) {
> +                                       mutex_unlock(&adapter->mfe_lock);
> +                                       return -EBUSY;
> +                               }
> +                               adapter->mfe_dvbdev = dvbdev;
> +                       }
> +               }
> +       }
> +
> +       ret = __dvb_frontend_open(inode, file);
> +       mutex_unlock(&adapter->mfe_lock);
> +
>         return ret;
>  }
>
>
> --
> 2.46.0.76.ge559c4bf1a-goog
>


-- 
Ricardo Ribalda

