Return-Path: <linux-media+bounces-1817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD229808688
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11F85B21CCE
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 11:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BEA37D20;
	Thu,  7 Dec 2023 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cKUQhQTJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE48FA
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 03:18:38 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-7c59ac49f12so323981241.1
        for <linux-media@vger.kernel.org>; Thu, 07 Dec 2023 03:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701947917; x=1702552717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtRAp/Zuzq7fGbpcbPcumzgHdraAjC7L39RpTXDHPvw=;
        b=cKUQhQTJ32lgveuo8CgQWvVy6nSpDP4PuSKt/CDSEvtPirm+8NxIPCfoSFUOcaGXwz
         PChLiRWSZVcR+VXujHkLVOv/IJd19b2+dcBaL/H1CuCtE1hQrq8t/A5xN/aPkjtdjBIT
         Y28yV7ByOW9Y3wlREo8j8cilqnD5vCWEH0MOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701947917; x=1702552717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JtRAp/Zuzq7fGbpcbPcumzgHdraAjC7L39RpTXDHPvw=;
        b=Hl4+SWCgh1EmJbg3d2WpvEe1qfh1rzxXnvcVSrdwFe7nhOQ3/c8cRNhVcflxSIarZT
         N63iXKClYpxof8wNmKCZPPVjBCkQ2UTGcGb9xjLbsnYTEK39ykDvn0vYIV1KfylYOEJY
         L2CZ2dTfM/HmDymqTs14jB3ijQysLFDxc9hR5x7u3u6q8DDlGWYVTU7xM+AXfgTaeYcX
         WsVvV5pzl6gvcLJCz+DePkCsnj6jyWkDe3YQD5uBy9Ek9BiYQzKuWHPhyZHJh0tUOEKU
         ueG9mU+bl57atEQO7yaysgoLQoaz71KN9/o7pmWnzSQFn6aSGHRkftnYMO+p59P97ufc
         5Bfw==
X-Gm-Message-State: AOJu0YzH/vlTdhNj6KXY3cfGgJQ9nWnEWJlQ+yH8ePfhJGJOoJlXP8E0
	L2iTtEhUhyglxRGypIrtt4jMDFAM7kzJRj19MZ0=
X-Google-Smtp-Source: AGHT+IGomuTUebl8NfeEZZxTN8kNAgtJhHFksCV1aA5RokQ59YQBgrsLcuQpQ4q7yjRmQqa60lyPog==
X-Received: by 2002:a05:6102:7c5:b0:464:77f1:f345 with SMTP id y5-20020a05610207c500b0046477f1f345mr2112979vsg.19.1701947917335;
        Thu, 07 Dec 2023 03:18:37 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id y26-20020a67bd1a000000b004629a395873sm57830vsq.31.2023.12.07.03.18.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 03:18:35 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4b2d64a368aso325747e0c.1
        for <linux-media@vger.kernel.org>; Thu, 07 Dec 2023 03:18:35 -0800 (PST)
X-Received: by 2002:a1f:c401:0:b0:4b2:c554:ccfd with SMTP id
 u1-20020a1fc401000000b004b2c554ccfdmr1880286vkf.9.1701947914936; Thu, 07 Dec
 2023 03:18:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231113123049.4117280-1-fshao@chromium.org> <20231113123049.4117280-4-fshao@chromium.org>
 <6c693161-0e89-4f9d-9a92-18f3783eefd2@collabora.com>
In-Reply-To: <6c693161-0e89-4f9d-9a92-18f3783eefd2@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 7 Dec 2023 19:17:58 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhp3HoKGQr1UgKtZJ9SLMqvm-G_YZi9dEWWF3tj2d=OFQ@mail.gmail.com>
Message-ID: <CAC=S1nhp3HoKGQr1UgKtZJ9SLMqvm-G_YZi9dEWWF3tj2d=OFQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: mediatek: vcodec: Fix mtk_vcodec_mem_free()
 error log criteria
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Angelo,

On Wed, Dec 6, 2023 at 6:19=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 13/11/23 13:26, Fei Shao ha scritto:
> > mtk_vcodec_mem_free() shouldn't print error if the target DMA buffer ha=
s
> > never been allocated or was freed properly in the previous call. That
> > makes log confusing.
> >
> > Update the error path to print log only when the caller attempts to fre=
e
> > nonzero-size buffer with VA being NULL, which indicates something indee=
d
> > went wrong.
> >
> > This brings another benefit that the callers no more need to check
> > mem->va explicitly to avoid the error, which can make the code more
> > compact and neat.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
>
> I think that this error is supposed to catch two issues in one:
>   - We're called to free no memory (something that does make no sense),
>     this may happen for example when calling xxx_free() twice, and it
>     is a mistake that *must* be fixed;
When I made the change, I was thinking of kfree() that doesn't warn
against a NULL pointer.
I imagine mtk_vcodec_mem_free() calls with NULL VA and mem size 0
probably have the similar nuance (if the buffer exists, free it; never
mind otherwise), but I could have missed some important differences
specific to the MTK vcodec driver.

Looking at the mtk_vcodec_mem_free() usages, almost every one of those
checks VA beforehand, but nothing else - they don't warn or do
anything special when they encounter a NULL VA, and they should if
that's a concern.
Some even don't check at all (and I think that's why I ended up seeing
the errors mentioned in the cover letter). As for that, I think
there's nothing else we can fix except prepending "if (mem->va)".
So from all this, I feel perhaps we don't need to worry much about
those NULL VA, and we can further remove the checks (or at least move
it into mtk_vcodec_mem_free()) to trim the lines in the driver. That's
the reason for patch [4/4].

Not sure if that makes sense to you.

>   - We're failing to free memory for real (which you covered)
>
> ....that said, I think that if you want to clarify the error messages
> in this function, it should look something like this:
>
> if (!mem->va) {
>         mtk_v4l2_err(plat_dev, "%s: Tried to free a NULL VA", __func__);
>         if (mem->size)
>                 mtk_v4l2_err(plat_dev, "Failed to free %lu bytes", mem->s=
ize);
>         return;
> }
Sure, I can revise the patch with this, but I also want to make sure
if the NULL VA print needs to be an error.
If you still think it should, I guess I'll drop the current patch
[4/4] and instead add the check before every mtk_vcodec_mem_free()
calls. This should also work for the issue I want to address in the
first place.

And thanks for the review.  :)

Regards,
Fei

> Cheers,
> Angelo
>

