Return-Path: <linux-media+bounces-15350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3644293C857
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 20:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0C051F2175C
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 18:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E48A2C6AF;
	Thu, 25 Jul 2024 18:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VmQeB8g/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAD424B2A
	for <linux-media@vger.kernel.org>; Thu, 25 Jul 2024 18:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721932150; cv=none; b=dx1zYQx979JEDDVZk7ifM7b9BED1ZqGe4c3vBNT/MCLT+1YM8A3es2x4IC925esAffdY0SET+CWeTa8JB5KDBhsZsMOBFYsp4Af6aRkDK5gDhIGQnyd0Jx14gpmmlxf+xhaJLfzGKTn8UXFg+uiKDfo/9j9196ix1uM7LScFc9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721932150; c=relaxed/simple;
	bh=7H82UX58ZrrZtRiHAVe/+LcpHIvYYzG0b2RLD43YNbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+4IQAjW0hUi9kBlsO+pzpHqRJnSEjI9m06GZ59EMj/To1YGy4VGZY/Gr5VdsJHl2SIejJFLgsyOgeBbtNZYAOowQ9G/R3dpdzB/D3Z+f9wfmCZXl/KlVuvT4iJv7lASBqd6RNJNTtOErmjrQ2BWKu+YwNG7A6NeItmgh+JLmBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VmQeB8g/; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e0365588ab8so1177305276.1
        for <linux-media@vger.kernel.org>; Thu, 25 Jul 2024 11:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721932147; x=1722536947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7H82UX58ZrrZtRiHAVe/+LcpHIvYYzG0b2RLD43YNbY=;
        b=VmQeB8g/x3E0nkQO/HdRzbatH1eeKLuSxGdW0AJxDeLRNpaRo4gBsaTxan8z+Wu4Bh
         LhfzH+KKQYExKrtnSttNiRznTCr6yIZdtD9o1TsUmW3GlAotbY1l5vKyjUHuqVYKH63n
         aOrQtvohxmxkAHmPblmnG28vd5RnZ8Bpo8L5h8xJWNhzfeLjeDAFCLE+SU6biQCxK+sJ
         cHchKGET02g3iZzjXVAiEGWS+oMenpNAadygUtk7WSnMLB0zVlYEvD7tFux1dZcGsOXz
         Fkb/H4Cuk3reDuEBBVtoJL6kB7KFMeLpYy4gDyiCFJU/Kg1ydOmsH7oBO9glN/D5FuN4
         EYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721932147; x=1722536947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7H82UX58ZrrZtRiHAVe/+LcpHIvYYzG0b2RLD43YNbY=;
        b=qgQpNOFaSx1UOpF2vIUqBq4OwpYN+zCxsfdIPpOMZDdp6G86aGVfDCGUAlr/4d5T+w
         TF+hE+7G7vMUCQuPgMUB6Jw+IWrWaucXALVKe875rAaRyIWXRQzyb1pfkPi6UFJB9lDf
         wSWmQsXy68+Kgmo9Kb1kG7JBMKA5WMG0OA7RFs49A1a6Wsvfpe/Zwv9VAePeJvYznSAg
         Duf02G9xps0tk80eP4vcnznzv7Ko6kWH3t9lS10cgO+6/5X7pKVlv/A+lm2YFZ/usRMN
         ZLsqaVb94OqiH+o5WVfKc0a6BInD8ePD3h0ZZPhN3X9W/Ml0dfatJifAo4DCXHgW6kAP
         vAJg==
X-Forwarded-Encrypted: i=1; AJvYcCWy41wM2fGkdCVkzANeQmGg1JVa4ZHDkMzbxMcPiaWzbubrCCLTBBzDIhUmjJR1qSimTvob1mlvaH7kAP8NY6KG3HkuezQb/2YLx6w=
X-Gm-Message-State: AOJu0YyI3m1+C85stA2R35voKfB9nI2MHPx8dl+uljrSopi02ixUu1DJ
	JA1nwUWx9Zk/49oU7FSz0J3gVTBt6Q9qpjWTHAxarJherL9fAleRzvu5guI8DmnakLa7m1s9S5z
	sVGs7CvJK4Hg+8Qxz6dULkjvtmRNaHsvdms5I
X-Google-Smtp-Source: AGHT+IGItijrenPjAmbxU5/Nvgn7ovQBfsTeRuhZp2oL9F1LlVeqZKuRyX0WfNygkWhlg9mziIYn9ttT+ix/HaljKmM=
X-Received: by 2002:a05:6902:c0b:b0:e0b:1519:e0da with SMTP id
 3f1490d57ef6-e0b23230e16mr4766336276.52.1721932147352; Thu, 25 Jul 2024
 11:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
 <20240720071606.27930-5-yunfei.dong@mediatek.com> <8b143d1c-edf9-4b2c-a382-75328156a7b0@amd.com>
In-Reply-To: <8b143d1c-edf9-4b2c-a382-75328156a7b0@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 25 Jul 2024 11:28:55 -0700
Message-ID: <CABdmKX2SqrUE1dnZWFnzMYLYqScoCrM0JDxc3YuzQyyV43wDHg@mail.gmail.com>
Subject: Re: [PATCH v7 04/28] dma-buf: heaps: Deduplicate docs and adopt
 common format
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Jeffrey Kardatzke <jkardatzke@google.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Nathan Hebert <nhebert@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 4:52=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 20.07.24 um 09:15 schrieb Yunfei Dong:
> > From: "T.J. Mercier" <tjmercier@google.com>
> >
> > The docs for dma_heap_get_name were incorrect, and since they were
> > duplicated in the header they were wrong there too.
> >
> > The docs formatting was inconsistent so I tried to make it more
> > consistent across functions since I'm already in here doing cleanup.
> >
> > Remove multiple unused includes and alphabetize.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > [Yong: Just add a comment for "priv" to mute build warning]
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>
> Since this is essentially a complete independent documentation fix I've
> gone ahead and pushed it to drm-misc-next.
>
> Regards,
> Christian.

Thanks!

