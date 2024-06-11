Return-Path: <linux-media+bounces-12941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D78A59039AD
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 13:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7578E2870A5
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 11:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A1E17B400;
	Tue, 11 Jun 2024 11:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ObatnTPz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8860217A931
	for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 11:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718103989; cv=none; b=CUYG50VX9HqjzddlgpYI0BmQvv0MJ1bs27crPaousqeQvLjWrUUpR1xSM/UrapznX/UwxGp9RKUtIgvLFItldnWmzzmW8zLXMXspYmPiUQFLYt5NML+bBSCC9AfPzi3HR6K0GozXy1Dnan/8oIZJdCV/zC4hscTpBCIYGTp5SeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718103989; c=relaxed/simple;
	bh=aAVd2WDvvTkPPfBWNMJFmg5PwBYAWsTDRn23d7aRcSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jrq25gDqg7jHNEzgfGSMgA8W40T445paVcWQk2/tZK10+iqbKEjV2kj3AIiekU0DyFIBC95cnRUDSJ7OmXCAU/xBczJErJedKlzYyTZy3gtSZDNTqkknv2NrROTg+tGEhJaKdp6+msZMt8/4unm9s93ELWnyG/ibH/6DTA5GSn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ObatnTPz; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a6ef46d25efso432919966b.0
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 04:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718103986; x=1718708786; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uND+DbqkwAQma6Z1CxIVpXNGmjE2PlBSr/+NfcNYd88=;
        b=ObatnTPzsTDurkYpF++/il1AAKEwIluak4HmcAYvyb6eQce1hWoI8/vobVBefawDJv
         UQDIKSS8AQLBcPkYL4Jl4iCSJwOZy8ONbOnE1B7ovhUr67JVBP4qsDVBkcEUuSlCkdcH
         tRWW/bMGq6mf2HpIoAwzgP9QcApy1DaIBiUEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718103986; x=1718708786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uND+DbqkwAQma6Z1CxIVpXNGmjE2PlBSr/+NfcNYd88=;
        b=LVb38VzmxoPxYnlkPSjR9hnwieMFmIhLghC6WFANUqe4yRQRxnMCsiJszjJ/1LoAlg
         OmbREWOBtZSP+Xi8ookpO922QEdHIdbpiA6zvzCtUxMktNBtODHw/JS7kCppFIoAopG3
         vfnFKiaXmE/Y/ok1dvPy9YX7QUN7MznjrWTiFoyaHkfUgpqUEbzo+YXL860I93JnXcIq
         ezYOaYEvwUZezOZwbdw5xJ4DPG0ILbHXZAscY7fhWsrtjZGGMtSX6hqx7m4dB/6DxhQM
         bVw/342+PbiVyPYA+Av6xyaNgAPhGJO3K1O1MgymQDfAeEjPXbHGL/Yj2KDOKd48PJvF
         swgg==
X-Gm-Message-State: AOJu0YxGkhZHQoFTVKDajTDUz0bTpL9gtMKbat/ZYFVnahOgcgtTzYla
	AvotRibdzW5ePYQ3fVeZW9Q1iZXuVS6+tsa1TPG79Hmc8e6dEyY6vSahQuLVtraVUbDKBP/pCdX
	3950H
X-Google-Smtp-Source: AGHT+IFKlPGDIoW/LwNIW4OY+V+J2SjwS2SpbQJgMnqQw+sVeRy+EeFngt+clHR0aESIS0KvpIL1OA==
X-Received: by 2002:a17:906:7192:b0:a6e:fccc:e4a with SMTP id a640c23a62f3a-a6efccc1101mr515254866b.0.1718103985612;
        Tue, 11 Jun 2024 04:06:25 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c805cc4d6sm742854666b.84.2024.06.11.04.06.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 04:06:25 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6f177b78dcso278923966b.1
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 04:06:25 -0700 (PDT)
X-Received: by 2002:a17:906:6ca:b0:a6f:d1f:6469 with SMTP id
 a640c23a62f3a-a6f0d1f6572mr460727466b.64.1718103984777; Tue, 11 Jun 2024
 04:06:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611-coccinelle-followup-v1-0-df2de9c2f320@chromium.org> <20240611-coccinelle-followup-v1-2-df2de9c2f320@chromium.org>
In-Reply-To: <20240611-coccinelle-followup-v1-2-df2de9c2f320@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 11 Jun 2024 13:06:10 +0200
X-Gmail-Original-Message-ID: <CANiDSCspKogsswOLCDiqADM2f6PdaKVUaOuhvx2tuQniZu=BYA@mail.gmail.com>
Message-ID: <CANiDSCspKogsswOLCDiqADM2f6PdaKVUaOuhvx2tuQniZu=BYA@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: drivers/media/dvb-core: Refactor
 dvb_frontend_open locking
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

I clicked on send too fast sorry :S

CHECK: Alignment should match open parenthesis
#37: FILE: drivers/media/dvb-core/dvb_frontend.c:2831:
+static int wait_dvb_frontend(struct dvb_adapter *adapter,
+                              struct dvb_device *mfedev)

CHECK: Please don't use multiple blank lines
#71: FILE: drivers/media/dvb-core/dvb_frontend.c:2872:

+

Let me know if I should resend or you can handle it while merging. I
already fixed in my tree in case I have to send a v2

Thanks!

On Tue, 11 Jun 2024 at 13:03, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Split out the wait function, and introduce some new toys: guard and
> lockdep.
>
> This fixes the following cocci warnings:
> drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2776
> drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2786
> drivers/media/dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2809
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/dvb-core/dvb_frontend.c | 59 ++++++++++++++++++++++-------------
>  1 file changed, 38 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
> index e81b9996530e..a7739f5e78cb 100644
> --- a/drivers/media/dvb-core/dvb_frontend.c
> +++ b/drivers/media/dvb-core/dvb_frontend.c
> @@ -30,6 +30,7 @@
>  #include <linux/kthread.h>
>  #include <linux/ktime.h>
>  #include <linux/compat.h>
> +#include <linux/lockdep.h>
>  #include <asm/processor.h>
>
>  #include <media/dvb_frontend.h>
> @@ -2826,6 +2827,34 @@ static int __dvb_frontend_open(struct inode *inode, struct file *file)
>         return ret;
>  }
>
> +static int wait_dvb_frontend(struct dvb_adapter *adapter,
> +                              struct dvb_device *mfedev)
> +{
> +       struct dvb_frontend *mfe = mfedev->priv;
> +       struct dvb_frontend_private *mfepriv = mfe->frontend_priv;
> +       int mferetry = (dvb_mfe_wait_time << 1);
> +       int ret = 0;
> +
> +       lockdep_assert_held(&adapter->mfe_lock);
> +
> +       if (mfedev->users == -1 && !mfepriv->thread)
> +               return 0;
> +
> +       mutex_unlock(&adapter->mfe_lock);
> +
> +       while (mferetry-- && (mfedev->users != -1 || mfepriv->thread)) {
> +               if (msleep_interruptible(500))
> +                       if (signal_pending(current)) {
> +                               ret = -EINTR;
> +                               break;
> +                       }
> +       }
> +
> +       mutex_lock(&adapter->mfe_lock);
> +
> +       return ret;
> +}
> +
>  static int dvb_frontend_open(struct inode *inode, struct file *file)
>  {
>         struct dvb_device *dvbdev = file->private_data;
> @@ -2840,19 +2869,17 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
>         if (!adapter->mfe_shared)
>                 return __dvb_frontend_open(inode, file);
>
> +
> +       guard(mutex)(&adapter->mfe_lock);
> +
>         if (adapter->mfe_shared == 2) {
> -               mutex_lock(&adapter->mfe_lock);
>                 if ((file->f_flags & O_ACCMODE) != O_RDONLY) {
>                         if (adapter->mfe_dvbdev &&
> -                           !adapter->mfe_dvbdev->writers) {
> -                               mutex_unlock(&adapter->mfe_lock);
> +                           !adapter->mfe_dvbdev->writers)
>                                 return -EBUSY;
> -                       }
>                         adapter->mfe_dvbdev = dvbdev;
>                 }
>         } else {
> -               mutex_lock(&adapter->mfe_lock);
> -
>                 if (!adapter->mfe_dvbdev) {
>                         adapter->mfe_dvbdev = dvbdev;
>                 } else if (adapter->mfe_dvbdev != dvbdev) {
> @@ -2862,34 +2889,24 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
>                                 *mfe = mfedev->priv;
>                         struct dvb_frontend_private
>                                 *mfepriv = mfe->frontend_priv;
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
>
> -                       mutex_lock(&adapter->mfe_lock);
> +                       ret = wait_dvb_frontend(adapter, mfedev);
> +                       if (ret)
> +                               return ret;
> +
>                         if (adapter->mfe_dvbdev != dvbdev) {
>                                 mfedev = adapter->mfe_dvbdev;
>                                 mfe = mfedev->priv;
>                                 mfepriv = mfe->frontend_priv;
>                                 if (mfedev->users != -1 ||
> -                                   mfepriv->thread) {
> -                                       mutex_unlock(&adapter->mfe_lock);
> +                                   mfepriv->thread)
>                                         return -EBUSY;
> -                               }
>                                 adapter->mfe_dvbdev = dvbdev;
>                         }
>                 }
>         }
>
>         ret = __dvb_frontend_open(inode, file);
> -       mutex_unlock(&adapter->mfe_lock);
>
>         return ret;
>  }
>
> --
> 2.45.2.505.gda0bf45e8d-goog
>


-- 
Ricardo Ribalda

