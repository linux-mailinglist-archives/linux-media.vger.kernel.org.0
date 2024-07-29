Return-Path: <linux-media+bounces-15454-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDBA93F5D3
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 14:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDF311C22114
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 12:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE49315444D;
	Mon, 29 Jul 2024 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Vl9Hj31U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3F814F9CF
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722257206; cv=none; b=jr0MEyq2HQqYk3fDhgIwjwEC8OVUVajlqlzZ3krmavFqtkKS4yqxxyxetSlrWDqMM9/ISLblnqZ1haZOdGTLgg336yC7y2XB7NYOUF0m1S314a5Qby2jLj8aXWyFXEJvjL6wp93PCB53eAsZKK0LI7yk2cakgrCRL13NIO4+Pps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722257206; c=relaxed/simple;
	bh=IpoG1lr/gzkzVwJgoRWnmNxi6CMwEU4ctEbjih6yxYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdnbpxzrYCZzHWDdkn9d3OqUpkF5zU7GlpLQkUDNZTDtfkN5Yg6Tl9kPsZ3mW0efps+9HosIjvnA40ye8Ad9hj8Rd1pJRkePRWK84YBHINs2lyPS7XVFqhZG7dnPMOBhwWpauqZb2rfgzkHOwPfEqAapBsaXY6h0cgJDBgahoPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Vl9Hj31U; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7a94aa5080so402520266b.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722257202; x=1722862002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xw9owQO3ke8d+y01UUou/ic5P0UC0KrCWnrceDha0Ug=;
        b=Vl9Hj31Ukjh+0XXek70d4b3McD1qt96OPDKBaQrTpsfTO9oyL7oJw4b+nGr1pAE/SS
         MD76Sbx1JqSacRpsK5EyA68f/dZsfA5ENvNjvmdmgFGCttwFpbzSVJdAf3puhbV/4zGI
         0Wy0n2Ln2qqeSL2YJA/QgaYy2vb2kcKW1nTXXsk2cDxjILfUTlbAxbXO4UY9Blc2m2vK
         s48wIutlKm5AhKQyzTUEeBmt2RbHrXVoDMSIJtCzmZipawRnCpPHGQoF6f8GD2JLrs6e
         wqHJc0nccSfk7QI2WHFubBNWvBHEKCxKjHdhBuzCOsKifOqAPuQmz+JoREvV0llUbZnr
         c1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722257202; x=1722862002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xw9owQO3ke8d+y01UUou/ic5P0UC0KrCWnrceDha0Ug=;
        b=Wy+Q3AQq6tzboHkF0HEnk3YvbHURl2OfbVqvvhXH525Uvv0l9Hdqir+WxAMEnNsabH
         lQ/EsFoGgwgGBLG1BixGVjgF/T8fnrdI7tqn7wXHY+7++MeUsd2TXdi5ipdtPbFTLO8Y
         07IeLvHe3dKaBVOCC8ZHpEhmYxC9MsXCqXMpOq1YEqSG0vldvx3+W/VFhammkjXEmQ/H
         j9JOsVPYA0nk6Sw3nXQ96QaXaJ5Z2LBPcPEtIh2IZH69BA/HoksqoVMNrC+0zQ32pRup
         sOiGWnX34fUT2IuaU+s9GByZA8nvrM5j6r3MKK+b60r3SlHlZgJU7mSAlUVZlHKObGc9
         xdBw==
X-Forwarded-Encrypted: i=1; AJvYcCUriw46lZo0gSvt3/Eo/EHaa7HgvtystjdklE+9wy3DcqAi49i3wea+Zog5WmyWT6AAeZwvGFdzAc5pwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1TtBGMH3XFlTpnCjaTVQ2DW8OAH/f6JOx4Au8jSVIMSBKUq7m
	2zjBPDrEU4JsL7PZEkfVDpv6tFn9mInKJ/gP5PiMD1RR1dJ69gelhFRpmBAlVqi+gBi4aqlvp6n
	KTH04JIWVdf3iMzuaYl5fr4PogzmkOfY3sy3d4Q==
X-Google-Smtp-Source: AGHT+IHinY1JfNv/mvpMM5Yfya33RSJgmSSwyZAu9jSx+bnpuWuKGvwHZZBD/MV0VUfT3CqvD4NAwzRkoPIdWhAyZ+w=
X-Received: by 2002:a17:907:2d86:b0:a77:b0a4:7d88 with SMTP id
 a640c23a62f3a-a7d3fdb79e8mr659217566b.10.1722257202254; Mon, 29 Jul 2024
 05:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
 <20240704-add-mtk-isp-3-0-support-v5-3-bfccccc5ec21@baylibre.com> <647738c5c776a9ec07615e67094c4141fdf051eb.camel@mediatek.com>
In-Reply-To: <647738c5c776a9ec07615e67094c4141fdf051eb.camel@mediatek.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 29 Jul 2024 14:46:29 +0200
Message-ID: <CAEHHSvYqT5-s57FijOf+SfLYF4znjaseazxiY-07jVHs09iK6Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, =?UTF-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	=?UTF-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?= <louis.kuo@mediatek.com>, 
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 18 juil. 2024 =C3=A0 04:44, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck=
.hu@mediatek.com> a =C3=A9crit :
>
> Hi, Julien:
>
> On Thu, 2024-07-04 at 15:36 +0200, Julien Stephan wrote:
> >
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >  From: Louis Kuo <louis.kuo@mediatek.com>
> >
> > This will add the mediatek ISP3.0 seninf (sensor interface) driver foun=
d
> > on several Mediatek SoCs such as the mt8365.
> >
> > Then seninf module has 4 physical CSI-2 inputs. Depending on the soc th=
ey
> > may not be all connected.
> >
> > Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
>
> [snip]
>
> > +static const struct mtk_seninf_conf seninf_8365_conf =3D {
> > +.model =3D "mtk-camsys-3.0",
> > +.nb_inputs =3D 4,
> > +.nb_muxes =3D 6,
> > +.nb_outputs =3D 4,
> > +};
> > +
>
> I think you should directly define these value as symbols because now
> only support one SoC.
>
> #define MODEL     "mtk-camsys-3.0"
> #define INPUT_NR  4
> #define MUTEX_NR  6
> #define OUTPUT_NR 4
>
> Because we don't know which SoC would be upstream later, maybe the next
> SoC would be
>
> static const struct mtk_seninf_conf seninf_83xx_conf =3D {
>         .model =3D "mtk-camsys-3.0",
>         .nb_inputs =3D 4,
>         .nb_muxes =3D 6,
>         .nb_outputs =3D 4,
>         .support_xxx =3D true;
> };
>
> then model, nb_inputs, nb_muxes, and nb_outputs has no difference, so
> it's not necessary to define them as variable. So define them as
> constant now, and when next SoC upstream, then we know which one would
> be variable.
>

Hi CK,

Thank you for your feedback on this series.
We already discussed this in an early version of the series (see
https://lore.kernel.org/all/2dd412f0-86cb-3ae0-305d-0e8192b9128a@collabora.=
com/).
I also discussed with internal teams in Mediatek about the folder
architecture. If this is not a red flag for you, I 'll let it as is.

I will fix other comments you did and that I forgot to add in previous vers=
ions.

Cheers
Julien

> Regards,
> CK
>
>
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

