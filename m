Return-Path: <linux-media+bounces-9548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 171178A721A
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C729A28368D
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 17:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED771327FB;
	Tue, 16 Apr 2024 17:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TKknnC3Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B66912F5A8
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713287960; cv=none; b=hr3shFzyE3j9yF0S5CsHf+3+sLxrMCDxTIrs650nZ17RjXFdVYGccnl5R2jvdYhPEk1AoRp8MCsVeATQm0xnkblafVgXeaObtGqumXPWUIkHZMNLe+R+VVIxmf/0HO7q69/5gpE3SfgVMjkkCND+X3YH7qTWnInIdOOSV9EErD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713287960; c=relaxed/simple;
	bh=rjQMIV0W9BgQ4Y3l4zyBoteIX46oVOvTz03GZ41BZDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwZmAnZERuQk2iWatcMIfUwNZ/rfgcA15M0TrkQ7dXZQv0f8ScQ3R5dNLaKXoRPyZE1n62RTxHo/J/pxay5TEDcYq/rCf4nQSe3QIc04CBN8tm5IGoUMfBFKDbULEv3+zYbHs59sfifUR8V/xPDitWpBAJp88hI80H0S7EFWvoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TKknnC3Q; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e3c89f3d32so15945ad.0
        for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713287958; x=1713892758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMzpM+93sB8KN+aihvsI4sj2s8RINAbT1I+ikFGc/QQ=;
        b=TKknnC3QzsmbJF3j5kGWCVLvjFEiMifECrwvp5xf5VnKKIIO92ReC8i1YlJEQNaQOt
         8RfgFkawwrCRzSl0qv/Orla5EjuRSSEo6U6CiN0zX3Q3qqd5Bz604/hHKzfpA8LkyCNw
         8p6WReKlLHWKMv9qVbq8BQqEw76zQqBXGyFnQnCdfK/VT7jX8X6mwG8YlrQWslBidVXM
         0g3MmGfDlcXdoTgZ6JWNSqY1Kjse3xQMyppwGp8eVhRds+2/3cYUMvtRR4sQ1jLi8i2U
         Khn8+d9zR68WU568pbDQqnNQbMKdxPztRiwwVoa5cPr+zTSj9vjtKpNaIQgAgMvPUIfA
         Z/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713287958; x=1713892758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMzpM+93sB8KN+aihvsI4sj2s8RINAbT1I+ikFGc/QQ=;
        b=bkb3wQtP3Q/oLCWTsVPMzKrqm8zbn21KtdPRSum2ZFna7/9YNzIOz3FzxuLCDKtMj4
         dErnaaXapOLfcRhpIUQOgdAdgMeL7lwyV8brSP+ktuhEQ+dPbaW6Kk4QWzK2cdPPcA7v
         +C0PCoZlOLXqTMhBdmasJoiEjoAANlF6WA+2hFWdwemPFICrE3wgeDDwhgAok9e/uZce
         UdLJ/5ArteBdoRJnk4dz7djnkUnqpetD3Ey5/63dNLpY0xaNX9JjV5DEJb/AcSDowMnd
         OyGWd5JsasRyfEIsnGeyyq+mU7PjhUqgZ8Zj4I+euN5VksCnvtvVlYTCaqmveMGWKy8i
         d9yw==
X-Forwarded-Encrypted: i=1; AJvYcCXM3A5vuCFscE9JClDb3tZtG74xxJhEKwf7ax861xPhNOeLSZDZT4cbMN4Z/YLZupFOVYHCiUP6vSM6RRlj1qajTM8aUDvkntVlkx4=
X-Gm-Message-State: AOJu0YwEHna+SuZMjVHLqUm8o0XgYmkDEzZQUnRU2Oti0o0yiwSyCnEN
	lz/3C1hu3Z54uBAAG1WsgNjbD0hES0VdjeyzQ7n0jkAsVo8XckNEGKo/DSQp1Jft4nE0XsJcIyJ
	CECj50ae5/6D/lc5FVkIud2W3HerSoi1qkOE=
X-Google-Smtp-Source: AGHT+IE+6v3wDbegK+Ux9rAhzTqqKq8TNFIZbmfaam/cohc7jxMrIVpQZc4dbB+03Ft2nzo9gRjOdyXae1RXd7Onh9g=
X-Received: by 2002:a17:902:fc8b:b0:1e4:33a6:b0d4 with SMTP id
 mf11-20020a170902fc8b00b001e433a6b0d4mr258654plb.9.1713287958225; Tue, 16 Apr
 2024 10:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240403102701.369-1-shawn.sung@mediatek.com> <20240403102701.369-2-shawn.sung@mediatek.com>
 <70733fe5c919527796bd3d9735ced522bcdd7a25.camel@ndufresne.ca>
In-Reply-To: <70733fe5c919527796bd3d9735ced522bcdd7a25.camel@ndufresne.ca>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Tue, 16 Apr 2024 10:19:02 -0700
Message-ID: <CA+ddPcMWein69X6U46pZbDy51gFHHxXV5d+6BvFq7ma6n0E22w@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] drm/mediatek/uapi: Add DRM_MTK_GEM_CREATE_ENCRYPTED
 flag
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Shawn Sung <shawn.sung@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would argue 'restricted' is the proper name since that was what was
settled on for the dma-buf code.  :)  But you are definitely right
that this memory is not encrypted.


On Tue, Apr 16, 2024 at 7:09=E2=80=AFAM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Hi,
>
> Le mercredi 03 avril 2024 =C3=A0 18:26 +0800, Shawn Sung a =C3=A9crit :
> > From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> >
> > Add DRM_MTK_GEM_CREATE_ENCRYPTED flag to allow user to allocate
>
> Is "ENCRYPTED" a proper naming ? My expectation is that this would hold d=
ata in
> a PROTECTED memory region but that no cryptographic algorithm will be inv=
olved.
>
> Nicolas
>
> > a secure buffer to support secure video path feature.
> >
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > ---
> >  include/uapi/drm/mediatek_drm.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/uapi/drm/mediatek_drm.h b/include/uapi/drm/mediate=
k_drm.h
> > index b0dea00bacbc4..e9125de3a24ad 100644
> > --- a/include/uapi/drm/mediatek_drm.h
> > +++ b/include/uapi/drm/mediatek_drm.h
> > @@ -54,6 +54,7 @@ struct drm_mtk_gem_map_off {
> >
> >  #define DRM_MTK_GEM_CREATE           0x00
> >  #define DRM_MTK_GEM_MAP_OFFSET               0x01
> > +#define DRM_MTK_GEM_CREATE_ENCRYPTED 0x02
> >
> >  #define DRM_IOCTL_MTK_GEM_CREATE     DRM_IOWR(DRM_COMMAND_BASE + \
> >               DRM_MTK_GEM_CREATE, struct drm_mtk_gem_create)
>
>

