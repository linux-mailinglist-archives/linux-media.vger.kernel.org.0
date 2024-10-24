Return-Path: <linux-media+bounces-20155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E9B9ADBA2
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 07:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DC9FB21F9C
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 05:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BFF1741D4;
	Thu, 24 Oct 2024 05:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I/3UFPFX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FD9148FE1
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 05:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729748806; cv=none; b=tiLy5fDSboW8U15kYBb0LGRoqdDKUOLleXVXJ9jXMK6BbbyalgHmOpzDn5WT5Ab0z08A91YZm+ICz48w/DlFLWQ7ixBds2Yh/H8/TVs1uQq9mBre0w36kbNhC7lBwkuqyryFIHEgKPujiSYTRvC5+eWDng0YmXvozKHuzmrLAPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729748806; c=relaxed/simple;
	bh=rusMx3rv69GUTAu24cAUoN7azAAz2Z8NPqw+Q/hb50w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSgbdg1ZC/XegkxdSaxcD/gZowdz3WjAJRHNfu/8g3IdFsEcXyku+A6wdcKZXNCaIMOGwUiep1ooUWY1TYQUNDQL6jK4QFp0Pt60SnWozEVrN3j1/XME7ZTXVsknHlz1cA72gckitwKL/tQrVZEPxQzSQBe7jYuEiTa84TJAlgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I/3UFPFX; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7163489149eso344203a12.1
        for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 22:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729748804; x=1730353604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Z4Bp3VJlfDl6yA0Dp3yN5Lc4CmJlrlorl9PQ2g17bc=;
        b=I/3UFPFXE6TMA2ZPDKhbII1NezEp/8EbpTUtr+tVzPwfROuLs3FHFslR+BhPzJcWcY
         sdY36ijvJXOu0MzGHqIZKbTC5p+r4XbEb5pNESXOYWaxF2+2xp/uRVm8BYWIqLZbL3yG
         8hYdKPxO2ZF3MnUs6phYzWDeHBBfoVnFwGEvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729748804; x=1730353604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Z4Bp3VJlfDl6yA0Dp3yN5Lc4CmJlrlorl9PQ2g17bc=;
        b=LPl6izHf/vbhqa92u0AQc5xwsrn5iflcOP/Q9aY2a/OmmAPKR0tNx0LrlND7cBpmki
         TZ7PNpn7tf2zX0kQmu/Pdma1JRZ+uZloYXzSRTXYtSMtHeSVfu8epWEwOx8J3ZexONb4
         67MHY9CosRb1zSCVK8gZoBXo1Zu9XUwLocZlEI355i1rqmBbv3Jr9MbaqmDCjf4cP0bg
         OikanpMWJZdQjwDuRJeCQNV31UP4ULIjaTWJK22+DOyhp3NLQchcRrgAb4O6UQlyy5W6
         k+QloTWtKEczqH38GDaU51S9LXuBvZ5dDfoEcuOTnHmTjgPachBoSCl+VZocyO9mWfXJ
         9DSg==
X-Forwarded-Encrypted: i=1; AJvYcCVroTNuyfdvIe2uEnqNfDJREM8awVZl2V4XIOatADQNbXw9TnAk77Ggx1X2MEQR7Ky69x0RnNIntCOT0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUG7FRFhNWJ+Z/BuW2p28MOlp8T12dZIIHvTJa33P0sOJ2OGNR
	8VPljoIoM4bOHkuS8YIIKTGvl/W+qSZDwwJL2lhwiXwMaQ1WK+LK33wZFXQwYg==
X-Google-Smtp-Source: AGHT+IHl1zltUiGlFVs2woZ9mbrBA/HLUFFjqSPhf7UzFWfsEe9ZUQxZoau4aeYsxPiZf3AHqpjl8g==
X-Received: by 2002:a05:6a21:114d:b0:1d9:2994:ca2b with SMTP id adf61e73a8af0-1d978b0d2c5mr6642211637.19.1729748803863;
        Wed, 23 Oct 2024 22:46:43 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:9422:d958:f749:9a30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0db2desm65799265ad.203.2024.10.23.22.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 22:46:43 -0700 (PDT)
Date: Thu, 24 Oct 2024 14:46:39 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: venus: sync with threaded IRQ during inst
 destruction
Message-ID: <20241024054639.GL1279924@google.com>
References: <20241023052444.139356-1-senozhatsky@chromium.org>
 <20241023052444.139356-3-senozhatsky@chromium.org>
 <20241024045836.GJ1279924@google.com>
 <20241024051335.GK1279924@google.com>
 <CAAFQd5ACxz-3icNH_CwWxWj5OyKdg89mOkNadYKa=YTVDRYRLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAFQd5ACxz-3icNH_CwWxWj5OyKdg89mOkNadYKa=YTVDRYRLg@mail.gmail.com>

On (24/10/24 14:18), Tomasz Figa wrote:
> > @@ -1538,9 +1538,25 @@ static int venc_close(struct file *file)
> >
> >         venc_pm_get(inst);
> >
> > +       /*
> > +        * First, remove the inst from the ->instances list, so that
> > +        * to_instance() will return NULL.
> > +        */
> > +       hfi_session_destroy(inst);
> > +       /*
> > +        * Second, make sure we don't have IRQ/IRQ-thread currently running or
> > +        * pending execution (disable_irq() calls synchronize_irq()), which
> > +        * can race with the inst destruction.
> > +        */
> > +       disable_irq(inst->core->irq);
> > +       /*
> > +        * Lastly, inst is gone from the core->instances list and we don't
> > +        * have running/pending IRQ/IRQ-thread, proceed with the destruction
> > +        */
> > +       enable_irq(inst->core->irq);
> > +
> 
> Thanks a lot for looking into this. Wouldn't it be enough to just call
> synchronize_irq() at this point, since the instance was removed from
> the list already? I guess the question is if that's the only way the
> interrupt handler can get hold of the instance.

Good question.

synchronize_irq() waits for IRQ-threads, so if inst is accessed only from
IRQ-thread then we are fine.  If, however, inst is also accessed from hard
IRQ, then synchronize_irq() won't work, I guess, because it doesn't wait
for "in flight hard IRQs".  disable_irq() OTOH "waits for completion", so
we cover in-flight hard IRQs too.

