Return-Path: <linux-media+bounces-29502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F3AA7DE15
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 14:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BF3A3A6980
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 12:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757B624888D;
	Mon,  7 Apr 2025 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aSciZyyD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022F72459C8
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 12:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030051; cv=none; b=ZVpNW/PDQQQxynxojzr9Aw2RfQ+RelPwuCMxHRxc9rWKjsGqwtYsPMUDR7wq73565OetRHdlQpkYVdvQc0majT1hdfHH6PFaumI4mGYgxs/qVVTdfP6V3dQ63lLTmCzjxHtbnurY9knOZMEll4F7q6sISVASS/PsYpaoZNGxAmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030051; c=relaxed/simple;
	bh=CKpCxFXfa7qApafzzxoR6KgBjbUrX2COqwSWDtyCHVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HoAd+DiGX/HLkmEC/xps9s40rNz42OibLJ3vLnIsImA2jsow0oux6Y5IX4tA2OPuBEdfXXUqtVlS6Wd2gTJGbO5PK2BzDSzJgCsdF8zAl5AsAtn3f9fUXvA/afHPgfbrxXHjBRz6mZOB47BQQjIkdkmBNIkdcZMghYI+R9lsuLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aSciZyyD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-399749152b4so2305531f8f.3
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 05:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744030048; x=1744634848; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ejwa9QkM9z1qj04KEhziISr+vDareUo67q+OL7JdUHk=;
        b=aSciZyyDPoozNKTnw1fpbN+aHBeUogyvAIGZ5J2YJ1oMbVy3555eI+CUde6s2WlRNS
         a08L0ivVw/3oPevOpeAL7xCL2BU+bbM98rAQ/GEZGs3y6W0oom6Cr6WvhJAjdy830i6E
         vFNaBrihZ6BJQ01wJaRlkxvvNXSXX6Oqyg9R3LbqEEuUNIb9mjaClewLLwhAnAlgLyKl
         N4cqUMIYk0jxSAOcpRcKPlOBL32L2VGQAUVFNNIxfsNG3wfZGRpIrGJa414qzNjqObsa
         L0LL6+sJfuRyDiES+FjbuEDPj2Iqsit8ZrE76oj5TlcYw6A/As24t8rC4IYl4M+BBN+b
         l3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744030048; x=1744634848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejwa9QkM9z1qj04KEhziISr+vDareUo67q+OL7JdUHk=;
        b=ITDSqhdfuZ1vZSsyL/MRsFiA2+ZdaVtqXz71lCbp6MG17XUOP3cA4Y7Ajqxs/qDEiC
         ZH4wCSdh+jWRf/Dv6CCxGKvvst6avwcU9LsBEUBPmjPYrIyHhSy49l/1Jjo2rDnYzhB1
         nS3nvIKZtauxMG+Lk4JsFOOLRPRJJAVXGNz8IJq5D6pYV45TS7L62xg/2B6I7pzxiNun
         i0H8VoFkRcW8wtnPaCa61IkkQLEONj6q2eLBofap61tbf9+Coa6A/d530IHliuXUpiKm
         GhUBpgmD83t8+jYXFYRvtBf8yK3G6cdElBnDt3shMfRkvxDX/Wi8TDlp3b7osqRJyRw3
         VhAw==
X-Forwarded-Encrypted: i=1; AJvYcCX37xvXKw/aF8MyDB4KO+g4RmYpPMl6LQ2N1AMVBNcONg7DlYIKOO8NZQ1tVkNyKJbCTiIcYJz7nSoGwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrVSwo9jPY8UcehxRraA5V15ZjMFULgD4GitRqM7PXod/ydmq8
	5cD0N/NLPivxQERnclh0V94aQtTz4y+fFdKuwo3+LCXXsLBd53F6L6YpXuzOY92enL0eOliKrlq
	le4SsW5ta3NxSU407tBQ2KelUKZWZNGXy/RKx1g==
X-Gm-Gg: ASbGnctcauupljAIO92vGO/LKmoAG2JByaKhgzioTW9paz/1oDefLoLd6u1pjBC4vrk
	5jziOQWenEFqBNG9J5ZW+9mXGPe4QSvKAmEhW74wSn/IWGuxpcXDGgduvbPJmwwjt7FyGU+wxMg
	Bsx7Od0Wevd1xqR9eHFK4+mc9g6VWeTFJ8BiJnNoaaujHiDGNMFLgOKdi322U=
X-Google-Smtp-Source: AGHT+IFtCtwBF1MQCSDv8kWR7+AawPBQWSSLTfZPWX6BoSv/E8BAZBB3w0TBcGKEjHI82f9K8I8unuvtiL9GOlAqfvI=
X-Received: by 2002:a05:6000:18a9:b0:39c:1401:679c with SMTP id
 ffacd0b85a97d-39cb35bda0dmr9467438f8f.21.1744030048103; Mon, 07 Apr 2025
 05:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407104828.3833-1-johan+linaro@kernel.org>
In-Reply-To: <20250407104828.3833-1-johan+linaro@kernel.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Mon, 7 Apr 2025 13:47:17 +0100
X-Gm-Features: ATxdqUHIKA4eGZ6sfftXvlzn5wf-8Cqh7uYF6-LkB4PNWkNHORpRrjxLgKXBxFo
Message-ID: <CACr-zFBAUrjRZ2s7oMO+7Qjk5X4zvdNb-9zYapTsuSqikm73zA@mail.gmail.com>
Subject: Re: [PATCH v2] media: qcom: camss: vfe: suppress VFE version log spam
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan ODonoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Depeng Shao <quic_depengs@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

On Mon, 7 Apr 2025 at 11:49, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> A recent commit refactored the printing of the VFE hardware version, but
> (without it being mentioned) also changed the log level from debug to
> info.
>
> This results in several hundred lines of repeated log spam during boot
> and use, for example, on the Lenovo ThinkPad X13s:
>
>         qcom-camss ac5a000.camss: VFE:1 HW Version = 1.2.2
>         qcom-camss ac5a000.camss: VFE:0 HW Version = 1.2.2
>         qcom-camss ac5a000.camss: VFE:2 HW Version = 1.2.2
>         qcom-camss ac5a000.camss: VFE:2 HW Version = 1.2.2
>         qcom-camss ac5a000.camss: VFE:3 HW Version = 1.2.2
>         qcom-camss ac5a000.camss: VFE:5 HW Version = 1.3.0
>         qcom-camss ac5a000.camss: VFE:6 HW Version = 1.3.0
>         qcom-camss ac5a000.camss: VFE:4 HW Version = 1.3.0
>         qcom-camss ac5a000.camss: VFE:5 HW Version = 1.3.0
>         qcom-camss ac5a000.camss: VFE:6 HW Version = 1.3.0
>         qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
>         qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
>         qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
>         ...
>
> Suppress the version logging by demoting to debug level again.
>
> Fixes: 10693fed125d ("media: qcom: camss: vfe: Move common code into vfe core")
> Cc: Depeng Shao <quic_depengs@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

This makes my T14s a bit more peaceful during boot. Very welcome change:

Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

> ---
>
> Changes in v2:
>  - align continuation line to open parenthesis as instructed by the
>    media patchwork hooks
>
>
>  drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index cf0e8f5c004a..91bc0cb7781e 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -428,8 +428,8 @@ u32 vfe_hw_version(struct vfe_device *vfe)
>         u32 rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
>         u32 step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
>
> -       dev_info(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
> -                vfe->id, gen, rev, step);
> +       dev_dbg(vfe->camss->dev, "VFE:%d HW Version = %u.%u.%u\n",
> +               vfe->id, gen, rev, step);
>
>         return hw_version;
>  }
> --
> 2.49.0
>
>

