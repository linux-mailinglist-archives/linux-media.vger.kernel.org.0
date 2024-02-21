Return-Path: <linux-media+bounces-5595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C753785E2DB
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 17:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68FAAB210C0
	for <lists+linux-media@lfdr.de>; Wed, 21 Feb 2024 16:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7120E81746;
	Wed, 21 Feb 2024 16:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ay5AXwqH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BB681726
	for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708532224; cv=none; b=thf5G3rRHyVJg2K4cIR/Z5Lc86Ek/RjtIMPPEMEKqE+SxRoG1cbcp6htiTa8D9NWNAya2p2bCTB0scLumo9KScWc5nMU+OkivQs3tDhrhiHAzbbgT21Rq8OgogQPaJsj+FsOU9pGSi1h3f5OtUSZ5+FT31GvNZgg7beILLaRoyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708532224; c=relaxed/simple;
	bh=WRewCTUMFvJojccCXJQHDaJg3H2bAUHoIWqDu+A/JqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pIX/pOyAppLo4Iw2YfmZy3u9g1JCC728t4Bd2k5qCi2Sv7t18CCfsc81aSO3+SVROikaa82ENQFEPcSFwMMy47cV+uyPIi50G/bSIa9LU1ybWHi2EiAJEty1EozECrvDFPSEWdIo8HvpNymmOhJZP0BBYRqOAb28HxEIiVz8z4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ay5AXwqH; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7c749e3805dso132958339f.0
        for <linux-media@vger.kernel.org>; Wed, 21 Feb 2024 08:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708532222; x=1709137022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVAwH35/MlacXlWKifCgH1KdwHWqIayMmoX/ai0O0Uo=;
        b=ay5AXwqHgzYpgLRjYO+ViPgWbZXDRJXitEiH8zMOdKGkcW9S3cizNhfqh34/aTCQB2
         mxgANz8FIhECbB3IL/N2CwBR5ZjchGk4ZwSMkXYAipovGbjXvqb24aFbclTkf6s9nQTH
         fnuQdh3IWA+N7xB4/brF078n0ORO2iEuNDdlb9eh0bQo2g6Ur7z1zImmWnNDY/Pwcv/V
         uV5UpHs5Uyq2sc8GN7Kvluz2LWP/Frp33B3FbK4HzZkRmfzqSN2pcVqBu5U828bTQi/T
         NLDDnt2tqtGBBaZQjlKHh08lak4U+/eCfBNlxxkHN+OjPU5Gy4lL58vroZ+GX/7vlWOV
         tVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708532222; x=1709137022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVAwH35/MlacXlWKifCgH1KdwHWqIayMmoX/ai0O0Uo=;
        b=F6nKfCPWww+45BmfPDIEJsWbRtQNKcxzPnCo/hhT3oXraarp0oNTqRtkynEI6+LcDL
         QAjdqRwb4mGl/eGmyTFERmK/d2m0PXWSDXqdAwOoJauDYjoH+iyuVSECXz8C5D50JtmQ
         DLaTf7XkwuMj7df9c9NQjkEtc3eQU0gz6wBQCMGxQmZibPELmtXqUJq7onx7KCKeA9mQ
         0d0qaiFuuhxVl9oLHsyq+08kYEDbhGyaHhbnXf//y6qN9BfvV85FcqP+1TfcHINo/eqZ
         OnQ2LXmtc4GYeeIfKUCYYcVSIb1hT50FAQr5WeXH3cdseq3/tKN9n26oS+iofjbAN1Iz
         fXcw==
X-Forwarded-Encrypted: i=1; AJvYcCW/cPc6VNdOmXl/1nIyGjtAH/eFazEw3KTePV6PbmfppfU9gd26ubd9az6FJqzYxB81qSRWOevhfOQ67jyllWXRj11RxvbWZqrCt08=
X-Gm-Message-State: AOJu0YyqO2qi/db2nA+vOi6T1Y6DvTkOT9zD+b6WLqvFkF4tUbjgMyoV
	p3ITBCdiYxwabnA/TMnWv8pdrhvB9EN8iUHtmtFOYNUHi7v4mdE2JcgNPt+PwynpBOiIyfjdpQn
	NJmA7cW02pB6iokDjXPjoQZGIfFn2p4rP9bVj
X-Google-Smtp-Source: AGHT+IGKtzqWfqGsQxp2PAZXjjjL1F5fGxrtKTKiLrxLV9Vn49jWwfGTnaRMgOOBP2ZDNbAnqBAuR5kT7Bu5a0qC/eo=
X-Received: by 2002:a5e:d504:0:b0:7c7:5ebf:d021 with SMTP id
 e4-20020a5ed504000000b007c75ebfd021mr6663294iom.8.1708532222178; Wed, 21 Feb
 2024 08:17:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212131323.2162161-1-panikiel@google.com> <20240212131323.2162161-8-panikiel@google.com>
 <20240215-supervise-concerned-55a18554a120@spud>
In-Reply-To: <20240215-supervise-concerned-55a18554a120@spud>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Wed, 21 Feb 2024 17:16:51 +0100
Message-ID: <CAM5zL5pL5qduQvs1FPf5pg1z5BBLjKk4Ads0E1vF=j=wSx-ddQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] media: dt-bindings: Add Chameleon v3 framebuffer
To: Conor Dooley <conor@kernel.org>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
	daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
	krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
	mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
	tzimmermann@suse.de, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
	ribalda@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 6:29=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Feb 12, 2024 at 01:13:21PM +0000, Pawe=C5=82 Anikiel wrote:
> > The Chameleon v3 uses the framebuffer IP core to take the video signal
> > from different sources and directly write frames into memory.
> >
> > Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> > ---
> >  .../bindings/media/google,chv3-fb.yaml        | 77 +++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/google,chv3=
-fb.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/google,chv3-fb.yam=
l b/Documentation/devicetree/bindings/media/google,chv3-fb.yaml
> > new file mode 100644
> > index 000000000000..ba6643cc7232
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/google,chv3-fb.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/google,chv3-fb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Chameleon v3 video framebuffer
> > +
> > +maintainers:
> > +  - Pawe=C5=82 Anikiel <panikiel@google.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: google,chv3-fb
> > +
> > +  reg:
> > +    items:
> > +      - description: core registers
> > +      - description: irq registers
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  google,legacy-format:
> > +    type: boolean
> > +    description: The incoming video stream is in 32-bit padded mode.
> > +
> > +  google,no-endpoint:
> > +    type: boolean
> > +    description:
> > +      The framebuffer isn't connected to a controllable endpoint.
> > +      The video interface still works, but EDID control is unavailable
> > +      and DV timing information only reports the active video width/he=
ight.
>
> Why does this need a dedicated property? Is it not sufficient to check
> that there are no endpoints in the devicetree?

Yes, I think it is sufficient. I removed the property and added a
check in the driver in v2.

