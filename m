Return-Path: <linux-media+bounces-11733-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0F78CC1B6
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 15:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF87F1C20C80
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 13:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E981913D635;
	Wed, 22 May 2024 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H809CJsa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72E9757FD
	for <linux-media@vger.kernel.org>; Wed, 22 May 2024 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716383051; cv=none; b=lDzIYpgZJG0686zVNz07uyCH2GO6idt2KYt3xpLW58IG3iy4s30bgd66yAma6ryIXeGm1aB9witd1MOL7FiRFEPOUZMQhN+yf+DxpALhKyW5XkeS3EbCAGt79aQw0A7cgKAvfo9DC/TeSMjaf1lD8GwSUTPAsFb4SH/sW6yKkV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716383051; c=relaxed/simple;
	bh=uSAJP0Zr0QUNLHGB1PX4Nd6PdLnxLg1fQGgacyXnlco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iilum41wATno0dATEQ5FMDmw1g+oaKPEkHzQE/xAXGoG+uIWbhZQ4QZO10LcQPF0WWikS38xz7ibjnn43WehT3bMnqOQzHNaOp93Cj7v5SnoqJYzM4z4NEGw4n4enYft+T31978nXoDdXZGpi7elMrfuHHVgFnMeNonqKx8U/ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H809CJsa; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-792ce7a2025so51331385a.0
        for <linux-media@vger.kernel.org>; Wed, 22 May 2024 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716383048; x=1716987848; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=06w4BMb4CS2JUIDxHHVDnPSYgc7Icb3wXH09Rj3AUZo=;
        b=H809CJsaCKL3IzreE6w2f5HjOUfREagewjLzWvnhmmIG7ZoqVEwab1nhEt4JfKsntd
         Xuaa/Svq9PDftV9Zvi8gROmw0OCAzUsPZ4uSOkRud+ZC6kqbDzBpzQcKwvZlpExFD65k
         xI4Z9ys3VnPkYSdsfRVmRq3v3DS9LhxMLyHg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716383048; x=1716987848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06w4BMb4CS2JUIDxHHVDnPSYgc7Icb3wXH09Rj3AUZo=;
        b=fdJCYdBJ10ch+A9JFA1d0AbAL9m+jXQL95em/D/V3Wf8LhzO/nJGWrlbW/gdlSXByE
         xRhFa3H0Ev59y3INpGCa9g6KXnYfAGJZXGtRMmNL0huBvJH+rW/zZING/Y742bIZEPub
         AHdtFLNxNABjqiOwxcdOWO0GY4wZAUtBGQA3gXlHxplNLPleTXB6f7jKALbdr92GfxHj
         NartJdaXmKhoH4nt5KA//LE2P/uc4opBKjAq80aDSFOYGGNEbMQ7DIp0+kTxpb3yMiH5
         ldPYsU1rwgt0QWgCCtFOIucV+2Zz1Q8eXMb4wC3HZb3hAFP8g+9qmkFnzbRyIWGs7HLn
         3LRw==
X-Forwarded-Encrypted: i=1; AJvYcCXq5ZhJ0rFtxrYYYaSeo5lAjGT/tOIxFcARVsOTGQllGQubz3vOPUHmeIZ32GFmGCqwjin5CafwjpkkS7DEnRLF2cU4hfRUASikoME=
X-Gm-Message-State: AOJu0YzXECZZK6OXnKYEay54Xd5YbxiIjG/mut5ZimktL//5mWqEuv+Z
	l1O4gSnZGBjftu4BC8oCTRkgnA9R/LxxgeKmCdcGatvTk3ZfoBDQMVkbEGEZ9FXIDQpQQCAqb13
	FHA==
X-Google-Smtp-Source: AGHT+IEKe8Qq/wtYPZ/WDyM51QSAuN8kQpUvT1tGABzpLXVoqB0sG5O1CL5uXvPpWYhsO95ztuWUcQ==
X-Received: by 2002:a05:620a:468b:b0:790:f843:db57 with SMTP id af79cd13be357-794994ac09amr207545485a.58.1716383048185;
        Wed, 22 May 2024 06:04:08 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792e564e4dbsm982761985a.82.2024.05.22.06.04.07
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 06:04:07 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-792ce7a2025so51330385a.0
        for <linux-media@vger.kernel.org>; Wed, 22 May 2024 06:04:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2h3uIQroLWEooD8Wp12s7T/dDaFWagPQVFX2HSS+s7avXNIKXbob0VuDZgCZhmLtI7ikUdJ5NW2RMYYsaPOf86cnzuA1swhebDQQ=
X-Received: by 2002:a05:6214:3186:b0:6ab:701a:931f with SMTP id
 6a1803df08f44-6ab7f353255mr18891526d6.20.1716383046801; Wed, 22 May 2024
 06:04:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-18-7aea262cf065@chromium.org> <79b2ab52-392f-40f6-8208-6e10330c0f04@linaro.org>
In-Reply-To: <79b2ab52-392f-40f6-8208-6e10330c0f04@linaro.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 May 2024 15:03:53 +0200
X-Gmail-Original-Message-ID: <CANiDSCsq8AB-=y_DgPz6HF3qREv45jhqL==E3yQpWeppjuwKoQ@mail.gmail.com>
Message-ID: <CANiDSCsq8AB-=y_DgPz6HF3qREv45jhqL==E3yQpWeppjuwKoQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/18] media: venus: Refactor hfi_buffer_alloc_mode_supported
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	Andy Walls <awalls@md.metrocast.net>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Bryan

On Fri, 10 May 2024 at 02:09, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 07/05/2024 17:27, Ricardo Ribalda wrote:
> > Replace the old style single element array at the end of the struct with
> > a flex array.
> >
> > The code does not allocate this structure, so the size change should not
> > be a problem.
> >
> > This fixes the following cocci warning:
> > drivers/media/platform/qcom/venus/hfi_helper.h:1233:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >   drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> > index dee439ea4d2e..9545c964a428 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> > +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> > @@ -1230,7 +1230,7 @@ struct hfi_interlace_format_supported {
> >   struct hfi_buffer_alloc_mode_supported {
> >       u32 buffer_type;
> >       u32 num_entries;
> > -     u32 data[1];
> > +     u32 data[];
> >   };
> >
> >   struct hfi_metadata_pass_through {
> >
>
> You have some fairly inconsistent fixes for this class.
>
> Please don't change the sizeof() any structures in your series, because
> the structure is unallocated changing the size is potentially insidious IMO.

If the array is a flex array we should convert it to a real flex
array. Abusing one element arrays is deprecated.

If the driver only accesses the first element of the array, I have
modified the code from data[1] to data, because, as you say, modifying
the struct size can have dangerous side effects.

But if the driver accesses more fields, then I have reviewed that
there are no allocations, or any calculations based on the structure
side, and convert them to a proper flex array.


Regards!
>
> data[1] -> data is perfectly fine in this case.

If you take a look at parse_alloc_mode() you will see that mode->data
is indeed an array, and it is used by the pointer type.

>
> ---
> bod



-- 
Ricardo Ribalda

