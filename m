Return-Path: <linux-media+bounces-11046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ED38BE742
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 17:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BC8B1F21AD0
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 15:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4158D168AFB;
	Tue,  7 May 2024 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NBs9kHyG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3801635BA
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 15:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715095172; cv=none; b=THANL2l4FF2jGNd+82Le6LHkVSruBX1zgQIgnePyC3gTmVGXWcAnEcq7CeMJT2y8xKN4AepbqtgAc5TNbdd1rlQUnDMyiVzTnhg/28eGRZ68TSe2Emc8C3NV6tsne+Zdffpxc76uJ9i1aq6m35diddQBJasZg0WHHO+nm4mGbF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715095172; c=relaxed/simple;
	bh=/wEyjI5m2O8HKuKdgtP+XsFBKrfzCPrB269/6Nd2+YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpkcHPAnaoiNTqBwW6+L/5+pWNsuOJDgLAOt1U5h5P/k2ew+ABCMLMcXLvBu9EIjhJefGRBsZdM6I2UcDC8HZgDbvM/FxZvA5CqhKpqKv81YUpjRwqm3nIuz59zDvxGxQSw4fRtvgzCWhDRPKN38e2n2aExC/ELlcj51bB6cwLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NBs9kHyG; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-de5acdb3838so3462008276.1
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 08:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715095170; x=1715699970; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3ysPCrT6aDiInuFk99HtusnAXRwhdESoITC61IbLRas=;
        b=NBs9kHyGPLxxXrDFj1qW08YcW8p+bdkBM/KlzVlb5f3MAHLqlIECJj/LN+xOPeHO5Y
         5e7gIKrTKfyuttAIw47A8EESpV/EWuTANdN0/Kzgu2teN+CB/uk8FXunzGKSgy6tj6if
         JAhoKcle40muA964rUqWwy89x2WY6sVEUcZiNb2u3Nr0eVzSlJGMMe+SAC8KFK1JXLXC
         nTPMah/fGWR92pj80GIykY2caaW+Vv57YrFYWb0LeZ+DfChS4jNnsGtuHPygmY7LGctH
         avKAZ1GbXrr87ENVIEnylKzeiujtodMysob+sXG/z1LV05VI/3jAa2M7vFHLlDpzCwVe
         dXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715095170; x=1715699970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ysPCrT6aDiInuFk99HtusnAXRwhdESoITC61IbLRas=;
        b=lKoM29GkxiywzbmyQgq5NnEajAxs5s92Q2EKqfMzqstQh7DhQ54Vfk8X/SKuxbxtFR
         5uQ1ZfVhx9w9/0XfAePxaw9hLo0O/mZ86aRaUDeehroiO0ZcVVTpKr54uHpBrDfrAlB0
         yZ0R2p2+TGBOE9Fv65LP+H4JEUKEcbjAmsb0wjKm1r4er/VDsLn8n74eVa0rP5noCrAu
         4A2OyVtaTB2lHWcwD2Rj+D34h4gsPknBw4+EJbUsXX41IEnqxhg+deOXcaH3qfBzfqAf
         K5E2PKSWvqEZ9/mMiWqnER9NCDoC0Qu+JXu8572SSJr2HU97DcEFQQtTsk2443BIa+y4
         5zEA==
X-Forwarded-Encrypted: i=1; AJvYcCX2hdy+HZfy///8g+BX7vQen+XIongg+xHgNsJl/2UwyiziZxFbCVmG+9BQdgDj08hEr8wkbFApWhM3oEraLkhvdXs0uwnCdJzxTiA=
X-Gm-Message-State: AOJu0Yx2kV2/y2KvDCo1pMLS0w6LQU5aBLcRAGcdC8XzZHesM48JYsyY
	zHMn/lFbxTGianaVzPKwNRGf/+6c4+RdwHeLKAp2s3t9zkcstZ8pWeFE+tBm1zh7zWTQr0Gpaoe
	IxUWUFyzFBwOFzdjdxK9NuPUmuYt7AG6N2m9Qxg==
X-Google-Smtp-Source: AGHT+IEML+Kw1JVUOv0nN6ekdfHok6Y4DPu4GGX6sExCN5x0nEZTwSwW2OQ/aCjdgj8HeWcGREcPXHHI22erdbPufQA=
X-Received: by 2002:a05:6902:2187:b0:de6:327:fa2 with SMTP id
 dl7-20020a056902218700b00de603270fa2mr15626519ybb.8.1715095170220; Tue, 07
 May 2024 08:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com> <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
In-Reply-To: <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 May 2024 18:19:18 +0300
Message-ID: <CAA8EJpr4bJUQt2T63_FZ=KHGEm4vixfpk3pMV9naABEONJfMmQ@mail.gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Lennart Poettering <mzxreary@0pointer.de>, Robert Mader <robert.mader@collabora.com>, 
	Sebastien Bacher <sebastien.bacher@canonical.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Milan Zamazal <mzamazal@redhat.com>, 
	Maxime Ripard <mripard@redhat.com>, Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 May 2024 at 18:15, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 07/05/2024 16:09, Dmitry Baryshkov wrote:
> > Ah, I see. Then why do you require the DMA-ble buffer at all? If you are
> > providing data to VPU or DRM, then you should be able to get the buffer
> > from the data-consuming device.
>
> Because we don't necessarily know what the consuming device is, if any.
>
> Could be VPU, could be Zoom/Hangouts via pipewire, could for argument
> sake be GPU or DSP.
>
> Also if we introduce a dependency on another device to allocate the
> output buffers - say always taking the output buffer from the GPU, then
> we've added another dependency which is more difficult to guarantee
> across different arches.

Yes. And it should be expected. It's a consumer who knows the
restrictions on the buffer. As I wrote, Zoom/Hangouts should not
require a DMA buffer at all. Applications should be able to allocate
the buffer out of the generic memory. GPUs might also have different
requirements. Consider GPUs with VRAM. It might be beneficial to
allocate a buffer out of VRAM rather than generic DMA mem.

-- 
With best wishes
Dmitry

