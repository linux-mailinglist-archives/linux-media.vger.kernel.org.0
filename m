Return-Path: <linux-media+bounces-10321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 880FD8B55D0
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 12:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E6542858C0
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 10:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEA93AC10;
	Mon, 29 Apr 2024 10:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kMSaokhp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1955E383BA
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 10:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714387905; cv=none; b=Rllg8drUrg9byUlNKGF0u07TdmobIfm1oQ7kkYcTKbxOGteSKx7jqm874wRZARfNtVUhz+suAnhHjAoVm8gfvKjtr7Mas7asxvNkI+Kir35/16tNfd7k8QdWhNOS1mK3wZVvMnRlkf/yrHvUSMOK4MwHUp6epgGUay1nXtUV6wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714387905; c=relaxed/simple;
	bh=4OFQmfmBaaiVFMtf3n+9BGYMCu4VhD/PO1uFErhL+cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUf+InjD0xcBmBOB1+2+Qa6BqGjX2jLRCQ7rdaPXlJGHpGNdSMk9azVCnFZdQ6cEukQMD30ULFBHtd3y5iLKMHc8NnLTNXxqgCWURGRjELghnvkIkq3zPxKpI4s3wKHaje532q2vzmo9HVZlUj/2cJDbO4ZQR4SFlZroOAOh3II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kMSaokhp; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4dae34a3806so2736650e0c.1
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 03:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714387903; x=1714992703; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BXhEnLpZuSACRtLpCaCHyHe6X1epB7qL3alOjAjU9x8=;
        b=kMSaokhpEo+ont1Np7lhzVN/K/Z7oc2LPc9LnvnzM0EeUyPx86A2PhLekDGqxZB8dd
         mWKnxwapj0a3OaMMz5swcORdFsJw7WZff30VPLAqbJR3Ya0gimzcKcEnjXg08bthhS3k
         O8lHRziIr8Sd97ZkClzx08bckvsRZnYXkT6HA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714387903; x=1714992703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXhEnLpZuSACRtLpCaCHyHe6X1epB7qL3alOjAjU9x8=;
        b=VQ0OSQaJf7rp9sEHCi+E9LxMQvKRhs6yv5qVR81jRNJ7I1Wq5e3xUgMxUwEDbzL7VA
         9RKhui2+cvRCHARv8m86O6EAnn5hL5oz0sdo/RF0TJQLaKodOWRRYFOW0zANxNEcQ8XS
         FTF85vENpBVyY7JsCEIT5Ydb0fQoFTvASDGwMdeV3wVEStt0P52JDxFrA0BOf66QyqqA
         xbi1bFUfXHyrD4RxZamyjlhtggiyqeeZa1tsRpvmRCAd/+STguukgP8taezN+oBdFMXc
         0Z6gGM3Tlo5jCfCEwc/ynwy2s8xaQ5cFqFXtIXbyGuRh3pLGNETr14vhGshabUn5gi6a
         YNoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCIJlWcFHVhSed+zTVwGws5J2OFHyZ4Z4IGeWAx/yw34DPLOMiBwPVyzMUIzZLondX0Vi16NKGerqeZ74JObLU5SeqE+NDq82LKAg=
X-Gm-Message-State: AOJu0YxS0RKadZ/FDNZWJKR9dx6hDMZZKr+Zey1HrM5iJsGIiRqxEC8h
	181yAMpZAVgh80QhMBEyzMa/veyuTiA+OUsnqcj00orVe4A4kO7E+IUPzX4Dio+jPC28d2GeaZg
	=
X-Google-Smtp-Source: AGHT+IH7fbib2zcQtNqVPH91NN70ZoAcANCY+ERCFMmoxDkMjKdCcixvksN5d/Z6ocR3Ywhcga/wnQ==
X-Received: by 2002:ac5:ca19:0:b0:4da:e199:4411 with SMTP id c25-20020ac5ca19000000b004dae1994411mr6248376vkm.7.1714387902826;
        Mon, 29 Apr 2024 03:51:42 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ez23-20020a0561302f1700b007f06311f6c0sm561409uab.16.2024.04.29.03.51.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 03:51:42 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7f02ea354e9so824972241.0
        for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 03:51:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWv2tVT2r3AGZGKCN+Jn19rCzySLe1cwOffuTubY/SU9mpfYAIpGFsxHYbXgcGA2I/fqua76+xmA7LBIWrfyY0qUjPRKZ6LkuxOi/4=
X-Received: by 2002:a05:6214:27cd:b0:6a0:4d4f:9428 with SMTP id
 ge13-20020a05621427cd00b006a04d4f9428mr14947200qvb.32.1714387880813; Mon, 29
 Apr 2024 03:51:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
 <20240419-fix-cocci-v2-9-2119e692309c@chromium.org> <40b9c015-8ccf-4313-800a-ecae9aa8cc27@xs4all.nl>
 <ZilMu614pUAzEGTa@kekkonen.localdomain> <20240424184603.GA6282@pendragon.ideasonboard.com>
In-Reply-To: <20240424184603.GA6282@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 12:51:08 +0200
X-Gmail-Original-Message-ID: <CANiDSCucvz=dQYDguzBZ-f95ZP84zuhvoKnmEYoJqAs1YnZ3ZA@mail.gmail.com>
Message-ID: <CANiDSCucvz=dQYDguzBZ-f95ZP84zuhvoKnmEYoJqAs1YnZ3ZA@mail.gmail.com>
Subject: Re: [PATCH v2 09/26] media: v4l: async: refactor v4l2_async_create_ancillary_links
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hugues Fruchet <hugues.fruchet@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sergey Kozlov <serjk@netup.ru>, 
	Abylay Ospan <aospan@netup.ru>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Dmitry Osipenko <digetx@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

Your proposal is what I sent for v1:
https://lore.kernel.org/linux-media/20240415-fix-cocci-v1-9-477afb23728b@chromium.org/

I have no strong opinion for any of the two, please feel free to land
whatever version you prefer.


Regards

On Wed, 24 Apr 2024 at 20:46, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Apr 24, 2024 at 06:17:31PM +0000, Sakari Ailus wrote:
> > On Wed, Apr 24, 2024 at 12:55:20PM +0200, Hans Verkuil wrote:
> > > On 19/04/2024 11:47, Ricardo Ribalda wrote:
> > > > Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
> > > > is not enabled.
> > > >
> > > > This makes cocci happier:
> > > >
> > > > drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/v4l2-core/v4l2-async.c | 7 +++----
> > > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> > > > index 4bb073587817..915a9f3ea93c 100644
> > > > --- a/drivers/media/v4l2-core/v4l2-async.c
> > > > +++ b/drivers/media/v4l2-core/v4l2-async.c
> > > > @@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
> > > >  static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > > >                                        struct v4l2_subdev *sd)
> > > >  {
> > > > - struct media_link *link = NULL;
> > > > + struct media_link *link;
> > > >
> > > > -#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> > > > + if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
> > > > +         return 0;
> > > >
> > > >   if (sd->entity.function != MEDIA_ENT_F_LENS &&
> > > >       sd->entity.function != MEDIA_ENT_F_FLASH)
> > > > @@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > > >
> > > >   link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
> > > >
> > > > -#endif
> > > > -
> > > >   return IS_ERR(link) ? PTR_ERR(link) : 0;
> > > >  }
> > >
> > > I think I would prefer:
> > >
> > > static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
> > >                                          struct v4l2_subdev *sd)
> > > {
> > > #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
> > >     struct media_link *link;
> > >
> > >     ...
> > >
> > >     return IS_ERR(link) ? PTR_ERR(link) : 0;
> > > #else
> > >     return 0;
> > > #endif
> > > }
> > >
> >
> > Me, too.
>
> I actually prefer Ricardo's proposal :-)
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

