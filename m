Return-Path: <linux-media+bounces-20157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3C89ADBBB
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 08:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C593B224B0
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 06:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6400175D34;
	Thu, 24 Oct 2024 06:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DFPVBWfQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D747917BD3
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 06:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729749967; cv=none; b=ryWgMQAryvk+aVka+949MM5JVtEt5auawaJS8tq82T+jaBQ4qiYpgLLzuKVCTNd77V0QTrkURFinFbNcrFAxxxvEa2ZEVvWqk98hK96cn6ZX1FLRSoq27I5hEcAkGPe3cw1GkcR8gAwspBz5JF2+2OWW4hFGL/JCKGLp1RyYim0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729749967; c=relaxed/simple;
	bh=hsMyPamrToP/NpISbu4aoadIHqTQJ2ZJa10Ia/hvNJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ossW2cfX1y5Q0scndpq44Mcqmxv3voywbsYJNMhAfFVCVZ4p0/+1z5augNQgaszU4EWAR1tQW8BiSG3YGUtH3nhveMUX/MOrXh8eeem3QCd+HJu4R+LdkK62MLvN2Da6xW46yaVEQGl6itzEWM+blQYyeYvww5QkiTpOljg1VHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DFPVBWfQ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20cbb1cf324so3945045ad.0
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 23:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729749964; x=1730354764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/O04ycheBIb1ii7gY4+sKk/4mPmTT0uGH3ikEcn/v4s=;
        b=DFPVBWfQu1eyf43r7Rsj7kDlp2tHt+5MLAQj7SlW2dYsZ7WWD5XfQa9T9OTHWe8k6F
         nioV/mqrfkWHe/1D+kx7UCP5i64l7Ig0C+8CoXPcNvIIXt2HAJ8ZrsJHrw86dwaLTfwh
         FN+F4eejBGTJFhvP9wtbGWLcy1GQAukmi3sG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729749964; x=1730354764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/O04ycheBIb1ii7gY4+sKk/4mPmTT0uGH3ikEcn/v4s=;
        b=SV0BBOYQTDSjarEgbMDsrJgsPMjCowapsjgUSkh+RVVsnDRPsuePIVhSFZtIZWcwXk
         FX19Yhn/GSjREkpahiFuDSMKcx7Nnv6Kj6fxVD4Sw2w2A23OqDsvfe726/PxVLmbW/WL
         FIdgWGgLjr1I1P62yzhitoXHDag10i9W4SbST75DDlzegUYJFXm0V4tTY3Dvu6y0Tp/q
         56j6qOryhisOxQUenyUYcrTUmTZbFRcVCHDqxh2rXsAs6UAcJ/7AF4/GApo6ESQrYjP9
         zINR0LCBLP2f2OGSzShjEDFAlBXlN/MjDZNWQFtqrNYqkruwCSpsvz7sqlfIbhhzHACk
         d3Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXZUKOxv3MfWha6Lc1VmOSIY3Lfg+1wb/Z2twkcYW9hKoejoU4+sflhea/WTTtRFM1mlJnFZM+Z/CGlVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYorKW6aukYRg3TykjLaPPEgHf14+PISS1TfBrd0bMX8WHGk9L
	faJPD+bebWAjeAbvshgc3BSnXSrk10P2I/yiLdC0QPsXoN/Wj0N5R7/f45+kNSrz2Y+0RSiu7Dk
	=
X-Google-Smtp-Source: AGHT+IEuhgFZx2KkY4L+xvkF7qxA0EmU1qCn7ijiBQUBC87c4vmKvLXn9cRtgEMeCbDUQZwL6Y2zKA==
X-Received: by 2002:a17:902:d48b:b0:207:6ef:d983 with SMTP id d9443c01a7336-20fb99def38mr9276185ad.39.1729749963861;
        Wed, 23 Oct 2024 23:06:03 -0700 (PDT)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com. [209.85.214.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee8b94sm66561445ad.4.2024.10.23.23.06.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 23:06:03 -0700 (PDT)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20c8ac50b79so41175ad.0
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 23:06:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVo8ELE8vSW3cTJbfQ6Xojtx6yw1k75I8U9Ryfji4jMWHewIX7Kibb571Re5oOE3ApmHjmiu53mXPyshg==@vger.kernel.org
X-Received: by 2002:a17:902:d491:b0:20c:e262:2570 with SMTP id
 d9443c01a7336-20fb5f2bbbcmr1897585ad.8.1729749962756; Wed, 23 Oct 2024
 23:06:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023052444.139356-1-senozhatsky@chromium.org>
 <20241023052444.139356-3-senozhatsky@chromium.org> <20241024045836.GJ1279924@google.com>
 <20241024051335.GK1279924@google.com> <CAAFQd5ACxz-3icNH_CwWxWj5OyKdg89mOkNadYKa=YTVDRYRLg@mail.gmail.com>
 <20241024054639.GL1279924@google.com>
In-Reply-To: <20241024054639.GL1279924@google.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 24 Oct 2024 15:05:41 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CuNUKv2vEMzJA5dj5ZK6nyg5XBPy_EF3BdUON93TyfTw@mail.gmail.com>
Message-ID: <CAAFQd5CuNUKv2vEMzJA5dj5ZK6nyg5XBPy_EF3BdUON93TyfTw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: venus: sync with threaded IRQ during inst destruction
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 2:46=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (24/10/24 14:18), Tomasz Figa wrote:
> > > @@ -1538,9 +1538,25 @@ static int venc_close(struct file *file)
> > >
> > >         venc_pm_get(inst);
> > >
> > > +       /*
> > > +        * First, remove the inst from the ->instances list, so that
> > > +        * to_instance() will return NULL.
> > > +        */
> > > +       hfi_session_destroy(inst);
> > > +       /*
> > > +        * Second, make sure we don't have IRQ/IRQ-thread currently r=
unning or
> > > +        * pending execution (disable_irq() calls synchronize_irq()),=
 which
> > > +        * can race with the inst destruction.
> > > +        */
> > > +       disable_irq(inst->core->irq);
> > > +       /*
> > > +        * Lastly, inst is gone from the core->instances list and we =
don't
> > > +        * have running/pending IRQ/IRQ-thread, proceed with the dest=
ruction
> > > +        */
> > > +       enable_irq(inst->core->irq);
> > > +
> >
> > Thanks a lot for looking into this. Wouldn't it be enough to just call
> > synchronize_irq() at this point, since the instance was removed from
> > the list already? I guess the question is if that's the only way the
> > interrupt handler can get hold of the instance.
>
> Good question.
>
> synchronize_irq() waits for IRQ-threads, so if inst is accessed only from
> IRQ-thread then we are fine.  If, however, inst is also accessed from har=
d
> IRQ, then synchronize_irq() won't work, I guess, because it doesn't wait
> for "in flight hard IRQs".  disable_irq() OTOH "waits for completion", so
> we cover in-flight hard IRQs too.

Looking at the code, synchronize_irq() internally also calls
synchronize_hardirq() and that in turn waits for the
IRQD_IRQ_INPROGESS flag to be cleared before returning [1]. The flag
is set by handle_irq_event() before most of the IRQ handling is run
and cleared at the end of the function [2], which makes me believe
that it would actually ensure all the hardirq and threaded IRQ
handlers would be waited for.

[1] https://elixir.bootlin.com/linux/v6.11.5/source/kernel/irq/manage.c#L38
[2] https://elixir.bootlin.com/linux/v6.11.5/source/kernel/irq/handle.c#L20=
2

Although I guess it would be the best if someone confirmed that,
because with all the IRQ handling complexities of SMP, nothing can be
certain today. :P

Best,
Tomasz

