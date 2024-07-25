Return-Path: <linux-media+bounces-15347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D92C993C647
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 17:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 845081F229D9
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 15:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6753919D896;
	Thu, 25 Jul 2024 15:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBYPV6WV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8101993AE;
	Thu, 25 Jul 2024 15:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721920874; cv=none; b=vDCwZaEKXpsl1PTalxuL2N6lF02hrJ8ApgaJk2hnjr0PYX24YaL6dFG26fZXmN7eRnhRLVFMhAB6XveFHPTdNiMj+3K8a/A6xU+gekUvDESbl8GOPmgcsYtJyszqrJ+IJlEIES6yUi1T1tL8zekdMRfdAwiVyuzgVIBzkMwC+vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721920874; c=relaxed/simple;
	bh=BACA7lc/U3kuyTopB/C6+lFqL+M0+mPuPcll+QYABvU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pyjXERXFwxx9dNNq196RTSnUXcm70GWb/s559G7lRhvQIN2h0vhd2izq14Pok5IRmSpka13zYKgaHzdfqUUzZcdp6+HHRMbZAhA4BkCEMmb4iSzjYUNojc8AkWldBdaOqAs1WgmN7xN9WBO2g/fjsirIz6jI+HGOoMU82XMGGfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBYPV6WV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4277a5ed48bso8174515e9.2;
        Thu, 25 Jul 2024 08:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721920871; x=1722525671; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2eq6cgeg4tjNK/UJ0dS0DsHH+PJFVARgjid38ZB1fJQ=;
        b=LBYPV6WVoAzbOQvaLtNnSvlmf71qGPJw+peL8bZZQ6n2eMTfDJSYnshzE5vaEoYXY7
         Zqu/wfL7oTtNRkYp6FVuPyXg5xVRud3T0TfUPiT+lmDSEYPmITzXp+8Pq8CjC1zi2uF7
         DZ6ZLZSdekTDY7CX0Bses2Z15zBiv0Ad54WYpXo5lhagwz5g4oA1gEnFBrj5vPIkWv0G
         wcG6EvLDkRh+o60RbBvsmsEEYBDmpiJ0Kzei1troAOREjWbFceqqorX/xk4q6QhbWeEf
         SF+A9GixvONOqJSkJJuTae4fvwZEt5UEDW+rjlj4c3cvQrYuj4eDpvOXAz59I1yQQHFk
         8qIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721920871; x=1722525671;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2eq6cgeg4tjNK/UJ0dS0DsHH+PJFVARgjid38ZB1fJQ=;
        b=HV/gsk7nznYXHvrWQe1HzXekD4rSRxovOyed8woryw9nLFkG42HqVv4ELykIooq2S5
         6YAnaWItPdLd+SXka3JBwFzYVmDTYR2lqKYFr7jh40WIUdkSetrCWl+YOAalsljNAOtp
         R94aTd3JX7A7fm6Uxgppe5T24Wy7YYs1OXyrLZxAlmI6Jxd981Jka5AA9FrEv4YsQc9C
         hceWZPY8iMvN6867F7u+ug75YFOcEH89RoD5oUVgz66Q2kPT8AFq1WiuPfUmn2iUWLnC
         p5UY18TV4hFgt5cG5JdcCj1z6B5HQ5V3iku4MTeP82T6+F+1ulmRhHzr5Y7Is7wtanZg
         ILAg==
X-Forwarded-Encrypted: i=1; AJvYcCXtnE51zpcW0kqaNDQsUk0SlB2ENqOxzZidYgSv8Tmo5YekxNKFpgmNEzLi2VTpMkfL0ba/iAipefgV1+KwWkvfU5TbrJZ4oNqEvhoQ
X-Gm-Message-State: AOJu0YxASNAe1O2sOibkxiIACiuw+peSyhz0D0WfloM2vMhTVy/u7asG
	0Ln4hjDlKLU7yFs61tV0CGdvEMrQEX1YgrQTuXmxHGKKoubhZ1Yc
X-Google-Smtp-Source: AGHT+IFRSWnlAYYHtp7B9TX/pm1tmW2wA1dlSwpQdMVtFjf9eyzO/iDYb0W5WyvQviIngjgeTfAO0g==
X-Received: by 2002:a05:600c:1f8c:b0:426:5ee5:3130 with SMTP id 5b1f17b1804b1-4280550879dmr16655795e9.3.1721920870644;
        Thu, 25 Jul 2024 08:21:10 -0700 (PDT)
Received: from localhost (a109-49-32-45.cpe.netcabo.pt. [109.49.32.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f935933csm81735615e9.7.2024.07.25.08.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 08:21:10 -0700 (PDT)
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Matthias Fend <matthias.fend@emfend.at>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Martin Kepplinger
 <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx-mipi-csis: avoid logging while holding spinlock
In-Reply-To: <20240723060909.534584-1-matthias.fend@emfend.at>
References: <20240723060909.534584-1-matthias.fend@emfend.at>
Date: Thu, 25 Jul 2024 16:21:09 +0100
Message-ID: <m3wml9mra2.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hey Matthias,
Many thanks for the patch.

Matthias Fend <matthias.fend@emfend.at> writes:

> Refactor mipi_csis_log_counters() to prevent calling dev_info() while
> IRQs are disabled. This reduces crucial IRQs off time to a bare minimum.
>
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>

LGTM

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Cheers,
   Rui


> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index f49b06978f14..0c34d316ed29 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -857,18 +857,21 @@ static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool non_error
>  {
>  	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
>  				: MIPI_CSIS_NUM_EVENTS - 8;
> +	unsigned int counters[MIPI_CSIS_NUM_EVENTS];
>  	unsigned long flags;
>  	unsigned int i;
>  
>  	spin_lock_irqsave(&csis->slock, flags);
> +	for (i = 0; i < num_events; ++i)
> +		counters[i] =  csis->events[i].counter;
> +	spin_unlock_irqrestore(&csis->slock, flags);
>  
>  	for (i = 0; i < num_events; ++i) {
> -		if (csis->events[i].counter > 0 || csis->debug.enable)
> +		if (counters[i] > 0 || csis->debug.enable)
>  			dev_info(csis->dev, "%s events: %d\n",
>  				 csis->events[i].name,
> -				 csis->events[i].counter);
> +				 counters[i]);
>  	}
> -	spin_unlock_irqrestore(&csis->slock, flags);
>  }
>  
>  static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
> -- 
> 2.25.1

