Return-Path: <linux-media+bounces-48859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B51CC1B07
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 10:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCBCC3019B79
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 09:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D7E33A6EE;
	Tue, 16 Dec 2025 09:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhqWynOa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D962B26E714
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 09:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765875957; cv=none; b=NOkFtmkyvDvtL4OQDQ/rZUIg6xI2NMLNhb2jjD+2T7YldGsW9gepZCCcx9yghHg+af5IYQktqFUYH2ERmmm24bDy4WLed4FL391/IMZYDni9+p/dkslyrboih73ESkAf7dufPUFMhFctZKsllgn6hbXV/JbdbwE7irJNRTRpUaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765875957; c=relaxed/simple;
	bh=RkhnrmCQn+C8IUKYL+s0NyQgQiW+yLA2LBJb5dIfL8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXjzQv9Pa5Wd89pCx6gYPam5qynCY6/qiD/mi625EXSaThrYt+uIJttPcDGv+/Mz+0Zp0e7LF+8Z4Y1iCp5Nc3M6W30UJ6+nm0WPXa3PKXiRsRTd/Q29vvWrTc/4UyMrJs265VOVaJ76wcoSRIPUlvsFBrnJMNyFj3fJUsYfURk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhqWynOa; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ed82ee9e57so58118041cf.0
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 01:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765875954; x=1766480754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omqi83Dx+x81K7T7juSYrVfh9uoVtgWx0kBcmziIq4E=;
        b=NhqWynOaW6iqxvykkhltH1Oyk/0m6Xx+yqSxxOBiwKHk1QdC9Avc3wdUOmY23xQfVg
         Od8FAZZdfDpjD5fwyTYuoXQUJ/WgaKaylAa/EJ46ivciMiWzXt9aqmJ9/op+qteGq2AT
         6gRaYIYk6n74Dzn8pfkpzFmZ/aBR3x+StoN7ovtYODQzUZfKgQ7bOq6lBVBOjxlnpOhA
         nWBjyFYjq3CSUuVQWx7FsDhOCUO6KTe0wy6eiGlOTq0olMempDi+PRdl3PX8EwOu7k/p
         fPY8cfP+CUM2NHYmlCJT+FADoHzY5++2xSJYfLgl43d1HfztI/NdvY5xQl4xXqbsN28y
         TuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765875954; x=1766480754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=omqi83Dx+x81K7T7juSYrVfh9uoVtgWx0kBcmziIq4E=;
        b=Z/wVwOXJP13v72llK3s9PuW1V3D8qaewH/pzeDt2QgigC1VREzuyQX6SAijO3q4weh
         Q4wl3GYMWTNXUl3ttg+Ev7b2ysnyz99PnMfdh9TVAjnfjycwtd4dkytmTgLoTLKCXViB
         hFkcticg8WLQN/JSRMyvgVFjWzVailRYkXpaoBXkKsem/rMbj/2aeubVTt0xjdhg5s+m
         Ib6s50pwSzQjFUVR5wWCyMezKQr5ux8MdcNLezb2/1Kc0o8cbFSwPbTT7C+FVlpaIgvr
         a2L+X0s3hzQ5phXaWsCvdjaRP/l8TLRfnhA5C7hDIfES9w0g4tpuhvybw9Fw0CHz0ldC
         fG8g==
X-Forwarded-Encrypted: i=1; AJvYcCXLd+opyH++abjyXtElxEsKr06gUOcfyDjrVK4yNGF9msbrzQ1XvhzOu+zw6lSy0mvW49VEKMDFDkVjnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6cW/ZRBNKyDKDF5OvjK+islyoovX2ynYvQOIRbw2xMyeXBY4G
	MPgs47vtxJjC+yHqpL92loNFW5uhQtinF77c2CxEU/PSC1Gmco4tXDt55PVMLXuyEjO7+PIvNSa
	mk3KnrpZDp2MNBip4sVZe1QFIpYb+3n4=
X-Gm-Gg: AY/fxX7sD5YqkGJtBEXHcpIBKX+uE90pOlWqBhSTl1H4g2v8+EtZbo7PZo2lvAblt0U
	ixiwz/2N/ijRSMOpNx+5nKEwlMiFhm8SPMgsRwJgALTPn4ykaPjnP9ZwEVmziHWg78lPvwRwNmi
	L8wtCWefD4+UAbuJFnIAkk1nCdQEeGoUFYlBSUihmUt2ehgSyCigVpTqQ0tT9UrFX4w5H8pSZra
	8djHblD/l7xTMb8Qx914S6Mq08JUPkXgrEiVdGmhAzS8uxa+lgz40Yzgyo1GNh0RNsxgw==
X-Google-Smtp-Source: AGHT+IGtPCRn7o6GpcrQ+8fRciXS7VNEpBZ8Lkf23ew80RNqVMmRb7tCJfaiB2F9T8S4MmAQPN7EoUUC/1k6/pOdU/A=
X-Received: by 2002:a05:622a:5a12:b0:4ee:275c:28db with SMTP id
 d75a77b69052e-4f1d05a92b6mr191064771cf.40.1765875953475; Tue, 16 Dec 2025
 01:05:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251216063952.516364-1-gxxa03070307@gmail.com> <7a41abc8-df47-459a-ab3e-ba7943fdd0ff@amd.com>
In-Reply-To: <7a41abc8-df47-459a-ab3e-ba7943fdd0ff@amd.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 16 Dec 2025 17:05:42 +0800
X-Gm-Features: AQt7F2ow7EPRc4zp2vCM4VRNSdM0megkZw_8cCDJsWlQEr6TXDtd8MO6vKv8G1g
Message-ID: <CAGsJ_4wbKFf68EW9vF7k6W0PPbMbjnc9s=rKBzqOnhfDwC3F8g@mail.gmail.com>
Subject: Re: [PATCH v6] dma-buf: add some tracepoints to debug.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Xiang Gao <gxxa03070307@gmail.com>, sumit.semwal@linaro.org, rostedt@goodmis.org, 
	mhiramat@kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	mathieu.desnoyers@efficios.com, dhowells@redhat.com, kuba@kernel.org, 
	brauner@kernel.org, akpm@linux-foundation.org, 
	linux-trace-kernel@vger.kernel.org, gaoxiang17 <gaoxiang17@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 4:44=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 12/16/25 07:39, Xiang Gao wrote:
> > From: gaoxiang17 <gaoxiang17@xiaomi.com>
> >
> > Since we can only inspect dmabuf by iterating over process FDs or the
> > dmabuf_list, we need to add our own tracepoints to track its status in
> > real time in production.
> >
> > For example:
> >    binder:3016_1-3102    [006] ...1.   255.126521: dma_buf_export: exp_=
name=3Dqcom,system size=3D12685312 ino=3D2738
> >    binder:3016_1-3102    [006] ...1.   255.126528: dma_buf_fd: exp_name=
=3Dqcom,system size=3D12685312 ino=3D2738 fd=3D8
> >    binder:3016_1-3102    [006] ...1.   255.126642: dma_buf_mmap_interna=
l: exp_name=3Dqcom,system size=3D28672 ino=3D2739
> >      kworker/6:1-86      [006] ...1.   255.127194: dma_buf_put: exp_nam=
e=3Dqcom,system size=3D12685312 ino=3D2738
> >     RenderThread-9293    [006] ...1.   316.618179: dma_buf_get: exp_nam=
e=3Dqcom,system size=3D12771328 ino=3D2762 fd=3D176
> >     RenderThread-9293    [006] ...1.   316.618195: dma_buf_dynamic_atta=
ch: exp_name=3Dqcom,system size=3D12771328 ino=3D2762 attachment:ffffff880a=
18dd00 is_dynamic=3D0 dev_name=3Dkgsl-3d0
> >     RenderThread-9293    [006] ...1.   318.878220: dma_buf_detach: exp_=
name=3Dqcom,system size=3D12771328 ino=3D2762 attachment:ffffff880a18dd00 i=
s_dynamic=3D0 dev_name=3Dkgsl-3d0
> >
> > Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Going to push this to drm-misc-next today unless somebody has some last m=
inute objections.

No objection, but I would strongly suggest Xiang include a
diff description next time, after the changelog for each new
version.

I recall clearly commenting on both changelog refinement and
the DMA_BUF_TRACE() macro [1]. It would be better to mention
similar things for each new version next time :-)

[1] https://lore.kernel.org/lkml/CAGsJ_4y0zc_nh2q=3Dw4uR04vtveCf6L7+hgafznH=
uL8ByWbyNOQ@mail.gmail.com/

Thanks
Barry

