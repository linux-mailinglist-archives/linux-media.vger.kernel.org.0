Return-Path: <linux-media+bounces-1816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B056680867F
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 12:15:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA9851C20C88
	for <lists+linux-media@lfdr.de>; Thu,  7 Dec 2023 11:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3ED37D1E;
	Thu,  7 Dec 2023 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LiqpIqGo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0EE611F
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 03:15:10 -0800 (PST)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-4affeacaff9so159756e0c.3
        for <linux-media@vger.kernel.org>; Thu, 07 Dec 2023 03:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701947710; x=1702552510; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1zKx8JGuByRmZeIzOLjwU47rnrPjKnk2Jj1ReloFCE=;
        b=LiqpIqGoPHLht1zreHLYUuoufdWUf12Bkds0m506mnWpjzhmlYV6gJkEw/FqJxwa4F
         zgV0dhlwBiOdBQ6+gMAyjGIhG65oMaYnsQFgGCeKQ4WPEsP7x0eRtuTynPbKbxE+yQY3
         FzfoZh8jDW+0DDh5VeM/J6KGeWX1iKupHNP0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701947710; x=1702552510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1zKx8JGuByRmZeIzOLjwU47rnrPjKnk2Jj1ReloFCE=;
        b=T3KdlhG7OeaYqnaLKAwlH0trz+KSq9QrATS6fH/1cE7vTL1Nrz74mixKht2kplPcLR
         +ESLFY5yXKIOWrHHfKajcmegFY/JMJvMPmNM8wyjZoCG9ARCxczvh8c8QCK+6AVvZ87q
         Qzhzwkllk6y+rvTgHmjonP/DCvBoM6Lqi2N1exM7mTq8+2vUbEeBKvPD5I8PKesY2H1y
         p9K3oFNDL1IVpbZ7ae1t8Kmd3CPyJL2fd36kUCDGTnAcLG/VYzLM4O7zAZ8jP6dmqO8J
         1RWW/bwf8t2G+jmZn9rUkl3o/IBbv+Zq/tDlOvNo+OXPrqC5cK1l4D9lMcQvpeb+AquT
         K8Mg==
X-Gm-Message-State: AOJu0Ywttmhw20Lmch6bmfcXonQa4ydmvYtuADIaFGEPJlRb/5BLxQry
	wQ26jlPmJ7AAxWeWP5lfZl2MAMCF52WQhbfB9EA=
X-Google-Smtp-Source: AGHT+IG+YntWIW0P9mjAwM/4MhpO3Pca8H1KpVaF60D8FQwCNsQtqKRWneYZou9sAT2OsIbG7kYd2w==
X-Received: by 2002:a1f:5a06:0:b0:4b2:e5f0:31cb with SMTP id o6-20020a1f5a06000000b004b2e5f031cbmr2254513vkb.30.1701947709841;
        Thu, 07 Dec 2023 03:15:09 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ef17-20020a056122481100b0049d1de0fa44sm52340vkb.28.2023.12.07.03.15.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 03:15:08 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-7c5cb5eeab1so198078241.3
        for <linux-media@vger.kernel.org>; Thu, 07 Dec 2023 03:15:08 -0800 (PST)
X-Received: by 2002:a05:6122:30a2:b0:49a:6dc0:5a89 with SMTP id
 cd34-20020a05612230a200b0049a6dc05a89mr2860131vkb.5.1701947707983; Thu, 07
 Dec 2023 03:15:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231113123049.4117280-1-fshao@chromium.org> <20231113123049.4117280-3-fshao@chromium.org>
 <3528639f-85a3-4756-b04b-c233f6c84276@collabora.com>
In-Reply-To: <3528639f-85a3-4756-b04b-c233f6c84276@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 7 Dec 2023 19:14:31 +0800
X-Gmail-Original-Message-ID: <CAC=S1nibsNfo7Ans2J0aiXqJSz5-iTPh2NwTEuUL8-HUM0AJdw@mail.gmail.com>
Message-ID: <CAC=S1nibsNfo7Ans2J0aiXqJSz5-iTPh2NwTEuUL8-HUM0AJdw@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: mediatek: vcodec: Drop unnecessary variable
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
> > It's unclear why only mem->size has local copies without particular
> > usage in mtk_vcodec_mem_alloc() and mtk_vcodec_mem_free(), and they
> > seem removable.
> >
> > Drop them to make the code visually consistent, and update printk forma=
t
> > identifier accordingly.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
>
> That's probably just about personal preferences, as mem->size is not expe=
cted
> to change during the flow of those functions.
>
> That said, as much as you, I prefer not having this local copy as it's us=
ing
> (a very small amount of) memory for no real reason anyway, so:

Yes, and I think I should have mentioned this in the commit message...
I'll revise that in the next version.

Thanks,
Fei





>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
>
>

