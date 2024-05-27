Return-Path: <linux-media+bounces-12013-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B488D0A8F
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 21:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47CCA282591
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 19:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C694161900;
	Mon, 27 May 2024 19:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x6Lx3xLL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136AC26ACA
	for <linux-media@vger.kernel.org>; Mon, 27 May 2024 19:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716836451; cv=none; b=UCHxTOA0DNY4bMN6+OeQkvRdPslFiFsrlPC8GHIUK/pHJG5JmPtoGxOt8lH89WQbQ3npxKnDHAY5BmYn9lCtdNkT0hQpOCJLB0GzfbFQ8Q0B00b2QQI7mNpNz4VVqsPFCdkbpbkVLiB8xjxorltxBeotpHmOKpzR7CdD5kAiYnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716836451; c=relaxed/simple;
	bh=QtTJK4e+xezrmSqjZutOBCe4DS0fPdLTmIIG4CLzy38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwVxX8lRXZj8FDPjPkBGkcllTUe3DuCkn7lB9YAG4NuESb5tflHMIm4AMRzN7v0T2YoDdCb5Aat6N5djhO7KodwIpQNMac6KnNWX01i1mY8pRZ6RcDJWo2fotBI1Dyz5d0j6h4edjPWb7onP93JaHFFnP802vDkcVPR6wLzRHGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x6Lx3xLL; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-df771fa2b8bso62990276.2
        for <linux-media@vger.kernel.org>; Mon, 27 May 2024 12:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716836448; x=1717441248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ja7vlfEqAriKa+FwY5Dmg/udaegLnmPF1+eRGrrskg=;
        b=x6Lx3xLL8+EQaTx+zSZWL1QUgU5MY1zgVdw8T1xlhHKEWQcXKRdxB/wq6UATfjK23O
         tyxIw/roNaAXLIk254luWcJXamEqqdBrmg5VxkO2jprdJmCkDazzb7Vd4SWh4J9YC3Sr
         VHfwzuAYA0IktWtjhUlwrFvohWQWJrp4SWPnPSFTqgQIAmAzPEegs7wV3tyMUzwQyKpc
         CxLAs5986CP3NfN3Z6Dcok7l6v9PfKt8pXGSanou3dudkkQKIPJ+yKY2WGaPrmKM8u8t
         ZUeAz+UzrQYH4Nsjn0DBsA5ZL/lbYML9z+zMTSJ04L32u1xSzjrWIFZAXUYtHu6GIXiW
         qvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716836448; x=1717441248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Ja7vlfEqAriKa+FwY5Dmg/udaegLnmPF1+eRGrrskg=;
        b=mbqkbDnIr2PYSI3OOWuem4Lq8bdmmkZ+0AV3x2YljzhSYui2XK0LjigpecsU4PRXGd
         RyFiurcxHtAsI2PCwDf9iK0cljFT8Q6CZKgd870eQeaqJm+WaOtCeWm4drLB4Iwqqsyf
         9ICInMaWzmc+AmGCvI4RwYI3qlPc8389JfRLEXz+AR2yDkuoOjq6fyP/0K/r5opHLx6X
         z6LjNMv1DTch+yXgmKoj8Jrt0F9DTTaT1QAlgdkOCG99UZV5H1ueIW2NuGFDvGc8C4/W
         +5kTZF51j68bufcvBEIbu7WIfbVYR6V57+TznPhbjZi8UXLsmdKayApJ1pd3nqjhWymq
         nhRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUNZI8VCcvcSmU5X9nHT2/b3NSUjiIDk6sgBe2+EYOHEP7aDntLlhssS46roCzFaCB4h9rxJY64sApI2okzeRIIa/pWaQ1pGqUnkg=
X-Gm-Message-State: AOJu0YxxKF1tdBii1xRqY4xB/moHLSWaxOK5Vs+FWc/O97BjbOzOKWUK
	le+m2ObudcPjy08c7pe96AGn3dNc7IWa5CD/0DYASB7gSTLGT9SmMpZVqvg9ZhNABK4eYVZVTk4
	mBd5vSrZ2c+xV7FoUVix3Hdy1xR5lmgR8doJDig==
X-Google-Smtp-Source: AGHT+IFCtPi34MiO9HbMkpVChKlNZ5PYokKGNe1Zkm5+YriPlaD5ppmt2yv+lpMdcC4aRafyvtA23o5zBngE0l9ui5s=
X-Received: by 2002:a25:86c7:0:b0:df7:94d3:5555 with SMTP id
 3f1490d57ef6-df794d357fcmr5601696276.41.1716836447989; Mon, 27 May 2024
 12:00:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
 <20240521-kms-hdmi-connector-state-v14-17-51950db4fedb@kernel.org>
 <4n55dbl2h275z5ubebigri4xjtjsvt44w62n656srdgndcav2j@rrq5haucqx5u>
 <20240527-adamant-just-spaniel-ebed4e@houat> <a65wtf2hy7ufimkcgo5k2c34ygvtv7erwh567ngsnuaha7qiny@nl6lx67qsjuw>
 <20240527-colorful-orange-bug-bbeefe@houat>
In-Reply-To: <20240527-colorful-orange-bug-bbeefe@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 27 May 2024 22:00:36 +0300
Message-ID: <CAA8EJpre5u_tD7VVnHwcjzJEV=9X_0Z+U==+gJGQBz6ie8FzFA@mail.gmail.com>
Subject: Re: [PATCH v14 17/28] drm/connector: hdmi: Add Broadcast RGB property
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Pekka Paalanen <pekka.paalanen@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 27 May 2024 at 16:30, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Mon, May 27, 2024 at 12:43:18PM GMT, Dmitry Baryshkov wrote:
> > On Mon, May 27, 2024 at 11:02:13AM +0200, Maxime Ripard wrote:
> > > Hi,
> > >
> > > Thanks again for that thorough review :)
> > >
> > > On Thu, May 23, 2024 at 01:22:56PM GMT, Dmitry Baryshkov wrote:
> > > > On Tue, May 21, 2024 at 12:13:50PM +0200, Maxime Ripard wrote:
> > > > > The i915 driver has a property to force the RGB range of an HDMI =
output.
> > > > > The vc4 driver then implemented the same property with the same
> > > > > semantics. KWin has support for it, and a PR for mutter is also t=
here to
> > > > > support it.
> > > > >
> > > > > Both drivers implementing the same property with the same semanti=
cs,
> > > > > plus the userspace having support for it, is proof enough that it=
's
> > > > > pretty much a de-facto standard now and we can provide helpers fo=
r it.
> > > > >
> > > > > Let's plumb it into the newly created HDMI connector.
> > > > >
> > > > > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
> > > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > ---
> > > > >  Documentation/gpu/kms-properties.csv            |  1 -
> > > > >  drivers/gpu/drm/display/drm_hdmi_state_helper.c |  4 +-
> > > > >  drivers/gpu/drm/drm_atomic.c                    |  2 +
> > > > >  drivers/gpu/drm/drm_atomic_uapi.c               |  4 ++
> > > > >  drivers/gpu/drm/drm_connector.c                 | 88 +++++++++++=
++++++++++++++
> > > > >  include/drm/drm_connector.h                     | 36 ++++++++++
> > > > >  6 files changed, 133 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/gpu/kms-properties.csv b/Documentation=
/gpu/kms-properties.csv
> > > > > index 0f9590834829..caef14c532d4 100644
> > > > > --- a/Documentation/gpu/kms-properties.csv
> > > > > +++ b/Documentation/gpu/kms-properties.csv
> > > > > @@ -15,11 +15,10 @@ Owner Module/Drivers,Group,Property Name,Type=
,Property Values,Object attached,De
> > > > >  ,,=E2=80=9Csaturation=E2=80=9D,RANGE,"Min=3D0, Max=3D100",Connec=
tor,TBD
> > > > >  ,,=E2=80=9Chue=E2=80=9D,RANGE,"Min=3D0, Max=3D100",Connector,TBD
> > > > >  ,Virtual GPU,=E2=80=9Csuggested X=E2=80=9D,RANGE,"Min=3D0, Max=
=3D0xffffffff",Connector,property to suggest an X offset for a connector
> > > > >  ,,=E2=80=9Csuggested Y=E2=80=9D,RANGE,"Min=3D0, Max=3D0xffffffff=
",Connector,property to suggest an Y offset for a connector
> > > > >  ,Optional,"""aspect ratio""",ENUM,"{ ""None"", ""4:3"", ""16:9""=
 }",Connector,TDB
> > > > > -i915,Generic,"""Broadcast RGB""",ENUM,"{ ""Automatic"", ""Full""=
, ""Limited 16:235"" }",Connector,"When this property is set to Limited 16:=
235 and CTM is set, the hardware will be programmed with the result of the =
multiplication of CTM by the limited range matrix to ensure the pixels norm=
ally in the range 0..1.0 are remapped to the range 16/255..235/255."
> > > >
> > > > Should it still be defined as a generic property?
> > >
> > > I'm not sure what you mean here, sorry. It's being documented as a
> > > connector property now, so it's very much still listed as a generic
> > > property?
> >
> > I didn't perform my duty well enough and I didn't check the file for
> > other instances of the property. Now I indeed see a generic "Broadcast
> > RGB" property, but to me it looks like having a different set of values=
:
> >
> > ,,"""Broadcast RGB""",ENUM,"{ =E2=80=9Coff=E2=80=9D, =E2=80=9Cauto=E2=
=80=9D, =E2=80=9Con=E2=80=9D }",Connector,TBD
>
> That's not really what I meant: that file is deprecated now and it's not
> where we document the properties anymore. This patch has improved that
> documentation and moved it to the new place, and removed the deprecated
> part.
>
> However, this line shouldn't be there at all. I'll add a patch to remove
> it.

SG

>
> Thanks!
> Maxime



--=20
With best wishes
Dmitry

