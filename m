Return-Path: <linux-media+bounces-13678-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDC590E836
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 12:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 139901F21D8D
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 10:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D379112F38B;
	Wed, 19 Jun 2024 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bY9ISWsj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADFE40879
	for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 10:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718792371; cv=none; b=JJA+9tPn1f3YLqqrUHYTZFc4Dc/2kGiqtgt0Yf5lKJXogU7F7GHbOpa5fzP3gUFXhiYFhfjR/c2fdFjpw5mHfrB+0qLmLB9vlmnPh2UPutYuvDdV+e1bH2+MyB/QzDXbHetfqbMtFDAUzhKzDqd7Q429bA1/Jjm4+415bUTvkBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718792371; c=relaxed/simple;
	bh=MbUeaa2LZLaNTE5kZ2SLNoA2hdABUPU/FjsRj6mUvFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L/t+A6ptPJQwtzTHTXrT32EaQ7D14D1ag0ATEa/C3PvcT6FrzvGarWX2rcfzFcqczF0dsCmXVZDcpKmjtLmgzPHq6Ecy9I+vhNSBAERDi8FQP1B/vH4pla6aZ7lONa+nsddg/yVY1yoi84/SHrSQ0VILDTCDMtjAU1/6ScyE6s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bY9ISWsj; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-25957dfd971so1625053fac.0
        for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 03:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718792369; x=1719397169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KE8h2jNNZ6vFW2z7uotyBC53nGYQN5vB31WOkuARonw=;
        b=bY9ISWsjljRXQ8bb/HtbfHrTc7BEoSgV8I5zZlVaqfWdrn3eU/xXsIk4k5YtliTq9o
         5vWjaOpf5DSviTkkph5ykNr2s8NNpNqLDkFGg22zkYZ7x633yeZ2Bs75z6/tV9OaYuEG
         U+oU354DVqNBYGPotALKZpTeZNV+vCGUqgjLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718792369; x=1719397169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KE8h2jNNZ6vFW2z7uotyBC53nGYQN5vB31WOkuARonw=;
        b=QwhJHa1ZPhVvlUnKbFRp3FObKNcQgkW/nX5A81aO1ChOgJWHjRoAJ2x6Ggyd7cO0xA
         orh1FJG5QpteO87qw/3lIrbWtVq9tgce3VUn9/9SG+hRR5i4yeBGFA1YntQinYipM39f
         IKv0vxcdSb1JDuo+SMuhbE6MqPfKT/6eX5ppSGtmmBTvkQ9t7O9zXfJJdDMO5muoeIAa
         lBZcfDZkg6fLjasMtpOb3ExTxqee7kjMtT6e9PFVWixvHIZbbqKlFWVRwkPi7007ax3z
         xsJC8TSHgCq/W/DCLFaVfHqZLzsFe576Lc33jXbyIG0/OUvRFTGL5IfK63SRCqMh39Pu
         Jz9Q==
X-Gm-Message-State: AOJu0YymUaI5cQe4AmnMOw5HYkszP59AspyVeJId5ZQ9NXjQ8ssWDchJ
	NwEOg0yeAjTqM1vt3/yrha0uun/QB0cIVv780pumq/ei7mb2HazuCGTPYGXSCTyQf7bZU2DaPBA
	=
X-Google-Smtp-Source: AGHT+IFU6AnQbIZH4OhTgGRb2fuelhfez1rnamNItzIB7m5z+bfPjUw7k1hqin//tLNl9EanfubUzA==
X-Received: by 2002:a05:6870:c14f:b0:258:42c1:2523 with SMTP id 586e51a60fabf-25c94a67c23mr2461264fac.18.1718792368767;
        Wed, 19 Jun 2024 03:19:28 -0700 (PDT)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2569934cf6fsm3678423fac.47.2024.06.19.03.19.28
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 03:19:28 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d218ea7750so3625461b6e.3
        for <linux-media@vger.kernel.org>; Wed, 19 Jun 2024 03:19:28 -0700 (PDT)
X-Received: by 2002:a05:6122:250e:b0:4d3:45a2:ae53 with SMTP id
 71dfb90a1353d-4ef27845548mr2420871e0c.16.1718792011586; Wed, 19 Jun 2024
 03:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com> <20240322092845.381313-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240322092845.381313-5-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 19 Jun 2024 18:12:55 +0800
X-Gmail-Original-Message-ID: <CAC=S1niC5ZePFFbEM6Fhr4q7kNqv45uSQNnTp1U8pesfe5f_Aw@mail.gmail.com>
Message-ID: <CAC=S1niC5ZePFFbEM6Fhr4q7kNqv45uSQNnTp1U8pesfe5f_Aw@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: platform: mtk-mdp3: Add support for MT8188
 MDP3 components
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, amergnat@baylibre.com, moudy.ho@mediatek.com, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	u.kleine-koenig@pengutronix.de, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Angelo,

On Fri, Mar 22, 2024 at 5:29=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MT8195 and MT8188 share a similar MDP3 macro-block, with minor
> differences - as in, the latter supports a subset of the number
> of components supported by the former, but are otherwise handled
> in the same way.
>
> Add driver data for MT8188, reusing the already present MT8195
> data where possible.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../platform/mediatek/mdp3/mdp_cfg_data.c     | 280 ++++++++++++++++++
>  .../platform/mediatek/mdp3/mtk-img-ipi.h      |   1 +
>  .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   1 +
>  .../platform/mediatek/mdp3/mtk-mdp3-core.c    |   3 +
>  4 files changed, 285 insertions(+)

Reviewed-by: Fei Shao <fshao@chromium.org>

Regards,
Fei

