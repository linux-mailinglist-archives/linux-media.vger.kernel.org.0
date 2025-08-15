Return-Path: <linux-media+bounces-39983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D87BAB27EF1
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 13:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 453B21C21552
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 11:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2C7285071;
	Fri, 15 Aug 2025 11:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="PIiTt0Eq"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA692737FD
	for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 11:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755256550; cv=none; b=fe1gmw52BP+dsyxBK6r5ary2WyDOe1HAvI4adJjl77Oqx2WhH357hoGIEm1gDUdbwXEyiBjT6D8M78Wf6P7AVnZOLKl7GGb8+DJZxspnT4VZBH1VoF8ylsKRTQiUaZGhKF/1AHxfFnG1n4h8mK6Oxdvr9EMmSfeqpKHQeBC/c74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755256550; c=relaxed/simple;
	bh=T/aoVi6AF3aVJ/uqRpoLaF29+CuY9MSd7NGZ1/77wPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S4I8H7Ar1x/OYV6lE+3OIjwwGozwVzJs06MlbDB06Qe6LmCI41bLKRy90xvGK1UvbUuSMtYgEL/lmUZbj2pwD0nqhF27g5ATiNAfw6Wx3kMtAvoT+/az7PAVID9RH0km4BlwqvePfhuahKWtmAY6Irs+beN/521RsciL+tmtTjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=PIiTt0Eq; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e87061d120so190975385a.2
        for <linux-media@vger.kernel.org>; Fri, 15 Aug 2025 04:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1755256547; x=1755861347; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T/aoVi6AF3aVJ/uqRpoLaF29+CuY9MSd7NGZ1/77wPA=;
        b=PIiTt0EqygxNkFvhm4MeLUq0V9koS18X0/cyH+rgN2euVQm+YuwZzkMzS2wZf+c+Xt
         OmENiOLIvbxy13W2VdhWEj1+xzfdMr0gx0ytlvYeIr5QF3kAP9HOImDisosMRLoxDEhM
         nSsowXzad4ESduQ0ibKIJpo6OhhXv3jarkPIYhOhyVt0yaBwRBGFBdaHOqSdIT9ISVLz
         fhD8ghoRZ2Q6LGQnASfWOBUQY82pV6KPVdAGPu7Br+UKsZuaDjdl+fMGpfpyxwhccuxj
         HS6zvuDFzdSM9oIlsIsz55OqySQGGF2ZNokGW5F95GVc7UjkeiLH+olt5kfMsxGuo0mS
         7dVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755256547; x=1755861347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/aoVi6AF3aVJ/uqRpoLaF29+CuY9MSd7NGZ1/77wPA=;
        b=EIFkAvuVfz4KFO2ePo7Cx1QqlRoPKJIYv7nQ5ybjbj2GJpOdjyDCUpkN7ACYZqig3z
         WjxfPr2o6clWMVD7TEFW0ytbOTVKi1sbGlZR88nWSj2lyq8m9NhvqtGwQAOePgspb3lB
         ZU01wTmmKH4UFN4jGKaWpIT/EdkUmbT8LN/z8eoTUY04kcAeKmESsNhyra10T45NtJrf
         sqRzDpTg9fqG6+ie/2lymL8uOklMXabrRtuLqJILOLCAvTp1M6VQANWpstrwsXTbko1c
         F6mkaHgNqpBzin+cXU6hyBILniIzcKevCilosvBDnRpfywRvktKikm82SxGb23XDGxA9
         K2Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXjg1o9NiU79f3XfqkKeJW2vqBtp3WE4yD5rpAmOruIiMhZCuSlce4a59qOTRFYwp6Cx8y6vP0H1SAzBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnhIQ5paJYHxBuh2xuo5/LLgtwiJpiV3F5uXROUbse3618cG9v
	ksYS+zQV6z9DRsmW+5/GLQEcSZ532U4u0KL3h6bAB3hXT1IxgWfTKsS06nAC9mOviiDBueFb/Nu
	VlCF1LO8D0ho4+yPMEfUti3gBD7oacE4A9PYkePWx6A==
X-Gm-Gg: ASbGncvBb/oHmfUCI0SXlUhlTbaxsb1fuGbgmpcrlWDbjmkKcufv4BFH1mcE8cTyQBa
	bRncRqgyFtflx89rn5OgfR3fh1DK24xL2zKdNtii20960cDGsHLwSo75u4Sd/Y+XYE9XQdCwBsk
	ncZ2lmRx8di3cBXKMLSXcqfu7uH/6PwSM1tsvwvkdJxkTy/D/h3M+zVDoM8l55UwXxlj/uLkZlh
	1SReh4=
X-Google-Smtp-Source: AGHT+IEEYrgrzZzFQH7gJARNv39C5+Wwbco9I1459+Dntaj16EsMUXS27AwHprK/yA0fuMnmrf2M26jY7o7J1U606dI=
X-Received: by 2002:a05:620a:7006:b0:7e6:391c:41ae with SMTP id
 af79cd13be357-7e87e0c7484mr195050185a.58.1755256547086; Fri, 15 Aug 2025
 04:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-ethos-v2-0-a219fc52a95b@kernel.org> <20250811-ethos-v2-2-a219fc52a95b@kernel.org>
 <CAPj87rNG8gT-Wk+rQnFMsbCBqX6pL=qZY--_5=Z4XchLNsM5Ng@mail.gmail.com>
 <CAPj87rNDPQqTqj1LAdFYmd4Y12UHXWi5+65i0RepkcOX3wvEyA@mail.gmail.com> <20250814161718.GA3117411-robh@kernel.org>
In-Reply-To: <20250814161718.GA3117411-robh@kernel.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 15 Aug 2025 12:15:35 +0100
X-Gm-Features: Ac12FXyQS213pP_GudOiU8lJOx9k9Gscd8v3FBcgxsevLgT7o4PDTPSWp9SpRP4
Message-ID: <CAPj87rN=Hod6GyA72x07yTvxL5X2q4UyUmPg-hyjjFA5KJvYGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] accel: Add Arm Ethos-U NPU driver
To: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Thu, 14 Aug 2025 at 17:17, Rob Herring <robh@kernel.org> wrote:
> On Thu, Aug 14, 2025 at 11:51:44AM +0100, Daniel Stone wrote:
> > This is the main security issue, since it would allow writes a
> > cmdstream BO which has been created but is not _the_ cmdstream BO for
> > this job. Fixing that is pretty straightforward, but given that
> > someone will almost certainly try to add dmabuf support to this
> > driver, it's also probably worth a comment in the driver flags telling
> > anyone who tries to add DRIVER_PRIME that they need to disallow export
> > of cmdbuf BOs.
>
> What would be the usecase for exporting BOs here?
>
> I suppose if one wants to feed in camera data and we need to do the
> allocation in the ethos driver since it likely has more constraints
> (i.e. must be contiguous). (Whatever happened on the universal allocator
> or constraint solver? I haven't been paying attention for a while...)

Yeah, I guess it's just reasonably natural to allow export if you're
allowing import as well.

> Here's the reworked (but not yet tested) code which I think should solve
> all of the above issues. There was also an issue with the cleanup path
> that we wouldn't do a put on the last BO if there was a size error. We
> just need to set ejob->region_bo[ejob->region_cnt] and increment
> region_cnt before any checks.

Nice, thanks! That all looks good to me.

Using unchecked add/mul when calculating the sizes also made me raise
an eyebrow - it might be provably safe but perhaps it's better to use
all the helpers just to make sure undetected overflow can't occur.

Cheers,
Daniel

