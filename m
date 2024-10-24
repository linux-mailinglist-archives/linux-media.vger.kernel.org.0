Return-Path: <linux-media+bounces-20154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DADC39ADB5A
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 07:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0864A1C21382
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 05:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64775172BDF;
	Thu, 24 Oct 2024 05:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R+LcUAIy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2981714CA
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 05:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729747136; cv=none; b=JaTJ5tAV9oGbUD9LNk4zHLhBT0cslyt0e1hlKJkbEzZkZ7qZ3zlJrqIonl3UtNAQiL8O92A4k7/smCvzwRvgUamh+XGaJ3DrkQLtpe44yEU0sZwPe7c1OJy8CWttXcI8pX6IyPBqh7L6M1E/NGoQSB2Jur0I8ajP+PnboO4MtYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729747136; c=relaxed/simple;
	bh=4wryGJdPZPSgiK9KfM5uPcYoI+0WvBG8ErZbhqowjLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQ/mwhLTtvATMw0yPl25Qa4t2b1mATEtjWne6mzuxfQJOPG9apHFjS4/lBbCUAI2waP31gK9VEqVVY4rcDp+gzZeeK7QNPlCU5fu0sv+eBqoZK7TqcLZFte0NDGZhxX681R81fw7qaA3aGhuCEM8f0OeUhKySs22WuY7l1i0M5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R+LcUAIy; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cd76c513cso3663665ad.3
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 22:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729747133; x=1730351933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jKEg2243kXoC9Im0p/j3HIvMls8ifezUgEQW9hAaE4=;
        b=R+LcUAIyUtaNdl/QlPcyqdxcdcD4lIcg8ck9tBxfctaLLz6X5ZVVbvz9mUQzHf1haN
         EwvOqFKk/47cK72trD6dvS33mVfyvQywMOB8657Lky/lfPMIKekP8iTE2uHLQIlZFkm1
         A5vzzcyyXmZIbLPpodG3CaS9/sjKY9TbMQrzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729747133; x=1730351933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jKEg2243kXoC9Im0p/j3HIvMls8ifezUgEQW9hAaE4=;
        b=i8ZbH41OfeBXqD8xFpzw8otwEpKb/RTwPfXtElYxZCgt6OpCP/3EoK3IQ2FikTCkAq
         F1INjJOV9zTxdn5XIMImzI9wMl45WTBDaAS+hXGoDz08d55jMbMwtQmYRBec/KAebqBJ
         zRhlEjyJOysUGhAHyOu8JmnEAo9QWVR3nJL/2wW72TMMsl5WdGS50p7GdzMgUXefr4wl
         sYZGw8IXwzR5BaVTYV3+kj7EIMG38RM6ha0MKSrFAHqa0J3wZ7WcULl50gWHKgF2scTv
         xoFEc32rirreO+dKIlsXU5I/VWFWM9/H2NZMM07GpDgx92sV3JbRUcc7Ame/yD6PffxQ
         ucfw==
X-Forwarded-Encrypted: i=1; AJvYcCWTAAnbYlx3Jz18ZHgVeFwNsiDGQVd4jRA7VE5XbsO1Z8oDaRr3zJHkxcbh87F+/NG4vVkAhcE8qhdtyg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf3Yfjq65I2tA2njDb1dpaW8M0uerUP11b8zEYlML8goUvdzKV
	z4+hl7IzyS3LhXMfD2mVzWsrroPXdlqVm4owFm2nr7KwN3g4znMLmqLVGai6rgteVED/YjumITQ
	=
X-Google-Smtp-Source: AGHT+IEpjgyvhR00ZCvT0m5NKqviiLr53vD4vwzqHum+x1elgJfzUEVR7hZpObWJslwumv9hXrI0ag==
X-Received: by 2002:a17:902:ecd0:b0:20c:5cdd:a91 with SMTP id d9443c01a7336-20fa9e99bbdmr68645585ad.41.1729747133365;
        Wed, 23 Oct 2024 22:18:53 -0700 (PDT)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com. [209.85.214.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f106c01sm65186785ad.300.2024.10.23.22.18.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 22:18:53 -0700 (PDT)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20c8ac50b79so37795ad.0
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 22:18:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/TRPrAw8cRABdXtDXFdULownynIla39YAsAw/E2Yy3EIO9+FEWLyPRJd44Osiy1ULRPIJJXpH0BCQZw==@vger.kernel.org
X-Received: by 2002:a17:902:ce8f:b0:20b:6c3c:d495 with SMTP id
 d9443c01a7336-20fb78490b9mr1168895ad.25.1729747131720; Wed, 23 Oct 2024
 22:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023052444.139356-1-senozhatsky@chromium.org>
 <20241023052444.139356-3-senozhatsky@chromium.org> <20241024045836.GJ1279924@google.com>
 <20241024051335.GK1279924@google.com>
In-Reply-To: <20241024051335.GK1279924@google.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 24 Oct 2024 14:18:32 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ACxz-3icNH_CwWxWj5OyKdg89mOkNadYKa=YTVDRYRLg@mail.gmail.com>
Message-ID: <CAAFQd5ACxz-3icNH_CwWxWj5OyKdg89mOkNadYKa=YTVDRYRLg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: venus: sync with threaded IRQ during inst destruction
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Thu, Oct 24, 2024 at 2:13=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (24/10/24 13:58), Sergey Senozhatsky wrote:
> > Date: Thu, 24 Oct 2024 13:58:36 +0900
> > From: Sergey Senozhatsky <senozhatsky@chromium.org>
> > To: Sergey Senozhatsky <senozhatsky@chromium.org>
> > Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia
> >  <quic_vgarodia@quicinc.com>, Bryan O'Donoghue
> >  <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
> >  linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH 2/2] media: venus: sync with threaded IRQ during in=
st
> >  destruction
> > Message-ID: <20241024045836.GJ1279924@google.com>
> >
> > On (24/10/23 14:24), Sergey Senozhatsky wrote:
> > > Guard inst destruction (both dec and enc) with hard and threaded
> > > IRQ synchronization.
> >
> > Folks, please ignore this patch.   Stand by for v2.
>
> I think it probably should be something like this (both for dec and
> enc).
>
> ---
>
> @@ -1538,9 +1538,25 @@ static int venc_close(struct file *file)
>
>         venc_pm_get(inst);
>
> +       /*
> +        * First, remove the inst from the ->instances list, so that
> +        * to_instance() will return NULL.
> +        */
> +       hfi_session_destroy(inst);
> +       /*
> +        * Second, make sure we don't have IRQ/IRQ-thread currently runni=
ng or
> +        * pending execution (disable_irq() calls synchronize_irq()), whi=
ch
> +        * can race with the inst destruction.
> +        */
> +       disable_irq(inst->core->irq);
> +       /*
> +        * Lastly, inst is gone from the core->instances list and we don'=
t
> +        * have running/pending IRQ/IRQ-thread, proceed with the destruct=
ion
> +        */
> +       enable_irq(inst->core->irq);
> +

Thanks a lot for looking into this. Wouldn't it be enough to just call
synchronize_irq() at this point, since the instance was removed from
the list already? I guess the question is if that's the only way the
interrupt handler can get hold of the instance.

Best,
Tomasz

>         v4l2_m2m_ctx_release(inst->m2m_ctx);
>         v4l2_m2m_release(inst->m2m_dev);
> -       hfi_session_destroy(inst);
>         v4l2_fh_del(&inst->fh);
>         v4l2_fh_exit(&inst->fh);
>         venc_ctrl_deinit(inst);
>

