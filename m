Return-Path: <linux-media+bounces-15644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C40DD9430FF
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 15:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 018491C21C6D
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 13:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6251B3729;
	Wed, 31 Jul 2024 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="feYdBoJa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B941B29AE
	for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 13:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722432857; cv=none; b=cbjD7L/7H29YTmVgfUlQx7l3wxkqa9Jn+HUZMM3ayLD/G8/UJudp55qDUtCz3UVXDTtpoqb5TtyzQOC83HqU2AKnjChRDhp+y+PEGjn7pTilGEkxwcwAem4qaBGcRMk8suMJYuL5wB0HMH0mbqQdUeKNGOSMfyIPQQfFsUo61v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722432857; c=relaxed/simple;
	bh=SFkAoG5oqEqyzX4sh7iPN9DJsVPXhLOrDwgLDueS+8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2Uj/ZG5Ot6V0g77hu1biAhqYGTkD/+JoNbqmudNayTWbRE94j5wcHBLR3P5gmCXAfBoK3WUbrUtj19ycEPzhqvJyIsGRuuW6mzGwSM9jSECSHei0Q1r1vCl3GPtWyyiDttzhlPntxj2uL/egSzh2xlvAftjZz3fT3xpD1hE9Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=feYdBoJa; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7a975fb47eso794528266b.3
        for <linux-media@vger.kernel.org>; Wed, 31 Jul 2024 06:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722432853; x=1723037653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKzhOvv4Abaz8jSctlqaD1OdNMDkG+LKvEGdcxBnLFs=;
        b=feYdBoJaa5aHdcVxPztz6nquEyU0VnYWqxhot5hyc9QX8aFyCLBjz3Dh6MBCyrmzNq
         Cg+EsmiRnkw4UeItCfdpvFwppBn0Ic79cwKPaJDhEiRjuL+foQKJPVi9cdr09nMLVy6j
         z4NQa7rE/O4W7l19jpC6mvaAHQldLQ/zSYV1zuors926AjNuB9z5Oo3o6lP6ybMCxaHl
         DYTBaW8E6OAk05vkuiMEGdvaFHrT8rjibR7f/D816u3Ulh3XSE85IEkQyE8hIuBTLEVq
         KDEMd5jlf9GZwCFg39KpvaLNABvAP9TTKaZ0rENktH/qGVlzaKlYf3lyC98gvoC1hNg3
         YRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722432853; x=1723037653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKzhOvv4Abaz8jSctlqaD1OdNMDkG+LKvEGdcxBnLFs=;
        b=ImUYs4Ct+GJhkJiouH813v3ICRGkQSg3umMMXGxZTZnybPqoYtb2J599nY+uvN/Hk4
         HHuD4znEMO8DkZMnt3Ll/6L9gCl2gFwfWX+Pt5ifSyA1brJgFi7Ksq5/reNs78YDTIIb
         nIS3Yw9RAewq+Qpx++/2gHrsllAJPZuFJU3tAMu1q22LSw/fN2ZWML2FkuB4XKoE26vr
         jQBQUliYYQzkdzwNKtJ5dZCoaNY/TbibbeNn0WWQENZsZ0hSGGCxhRpLX3s6hPLL4uFC
         gEPcnNnkQYEORCGU4huW9iAPsafp5cWzls/EvrDU+jZffA2zjIw3P8spFl5iItBOqm4f
         uibw==
X-Forwarded-Encrypted: i=1; AJvYcCXUMb/JT1hB5MtL3IG4triOCjGwpZ+23w2jCMZBBlgAPiuCtRkQcUKZEwRktJuMgigbM3dTskhmO1x5/duvancLzcwaZm5NksZbaNE=
X-Gm-Message-State: AOJu0YxJtEj9+SWN9hVE9TW0nkQS79igp2c2Yq1kIP6Kqrr6+M8Rh3sW
	lMcDSdr/R+5cmBigQDu37DFKk3oBMDvxSffwLT47YiFxia6kKdIekdpVQichkSvAEFWeYrs3I/a
	IpSfRmkDXmqN3M2GShQ/pCxsWc1yp05avC8qipg==
X-Google-Smtp-Source: AGHT+IFHvxPdbTDsZZkkxlis80B3oC61RFhzRsWcsCjpR0wdyqzatcOGn114x/eJAhMWwICdWqSTklgUbqDvFUAd6CU=
X-Received: by 2002:a17:906:c10f:b0:a7a:bae8:f292 with SMTP id
 a640c23a62f3a-a7d40101a57mr1007576866b.41.1722432852685; Wed, 31 Jul 2024
 06:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
 <20240729-add-mtk-isp-3-0-support-v6-3-c374c9e0c672@baylibre.com> <20240730132931.GM1552@pendragon.ideasonboard.com>
In-Reply-To: <20240730132931.GM1552@pendragon.ideasonboard.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 31 Jul 2024 15:33:59 +0200
Message-ID: <CAEHHSvaiwBWnV+kmjNG=RzPk3W9Y25saNQv5-KiU8EtampUbZQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andy Hsieh <andy.hsieh@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Louis Kuo <louis.kuo@mediatek.com>, Florian Sylvestre <fsylvestre@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 30 juil. 2024 =C3=A0 15:29, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> a =C3=A9crit :
[...]
> > +             mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0, D=
PHY_MODE, 0 /* 4D1C*/);
>
> As this is a V4L2 driver, I'm pretty sure someone will ask for
>
>                 mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
>                                   DPHY_MODE, 0 /* 4D1C*/);
>
> I wouldn't care too much about going slightly over 80 characters, but
> getting close to 100 where lines could be wrapped without hindering
> readability will likely upset some people. Same in other places where
> applicable.
>

Hi Laurent,

On an early version of this series, Angelo asked me to un-wrap lines
that can fit into 100 chars...
Both are fine for me, we just need to agree on something here ....

[...]
> > +     /* Configure timestamp */
> > +     writel(SENINF_TIMESTAMP_STEP, input->base + SENINF_TG1_TM_STP);
>
> Can we have a mtk_seninf_input_write(), the same way we have
> mtk_seninf_mux_write() ? Same for writes to priv->base below, with a
> mtk_seninf_write() inline function.
>

... and here :) In an early review Angelo also  asked me to remove
these accessors.

I can add them back and reduce line chars if needed.

Cheers
Julien

