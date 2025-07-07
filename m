Return-Path: <linux-media+bounces-37022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8B1AFB5A7
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 16:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91C353BA467
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 14:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370402D3EFF;
	Mon,  7 Jul 2025 14:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfwNYHDw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2313C2D0C8E;
	Mon,  7 Jul 2025 14:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897734; cv=none; b=o9XPey+gDh1e0xw1pMhA4gKv343GPvVMuuOYlnMHzIGlvSiV6sZwXTESw46R+UObU4HnATF2YC/NpwjjiyOsJTzMnQEa/20NWQJsLDU/Gy3R6ovTtksysabLHWZMB4Qbhg0f7CtNiIJ5w7S44gtCOZnrWNxAyZuop9oxkccmkjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897734; c=relaxed/simple;
	bh=3LfLU8OtGsYshHZLrDfPMhhXu/3AExSDQWcIRL1i2oI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TX65lpaL/tn4FBXC3ZG/ZUgLHGI2s/tU9bLhXPn/gQpLh6w2K6zBgmaPcCj39zjf0yzvYPb2jVpq63P7yLr7sW4i8v3oZSixUcWpe882SuPZZDvaLzneRcoJHrAOt8VC6YAQLC9EIFnbnBbI4bW3Z1739VihcJVv/3n9Vk7qs4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfwNYHDw; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7150af9d35cso1574097b3.2;
        Mon, 07 Jul 2025 07:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751897732; x=1752502532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AErYOjPJpnpZ+PP+YqlZmcpAxpjfggGYTXiGQfIvip8=;
        b=CfwNYHDwhpDvMr6tciQRtmtR7Uokk1hAB92Ywm06IZHWCdkyG96qotIz/lm7gUJbH6
         L58UhMMt6euenBWUjqG9HiDGefFqwC3NvemcZ1jCpQ9PyNjZszfitTr87LPewPqx/YAI
         Bn0QCIP5AAKQI7YkQu+eVJ2ihoLB3Uj8jDcYfheeigy1zIfVg2Mmbi3skHkZgSDO/No5
         DSIFrt3FjKiVe18uQNOWrqgO3UYrrzQsctMXG2qTFnKvAcBbnsJ6s7fwSC2AVt6J3peB
         aCEsediiJzuRAzz05QUB26oAj9Lu3texCGxO/NL9ZTGxwlxkreCyz5IOJxkVMb5yLs9o
         e2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751897732; x=1752502532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AErYOjPJpnpZ+PP+YqlZmcpAxpjfggGYTXiGQfIvip8=;
        b=BjXAu3pbFs6+gjzTTZrbbgpBumrPyPi/RHC2a8WXLMOsdR7VD9AZXV1p4xGCTOFg+D
         l7UmZ86L5nrjBU0u21y3uCX0xxvVgvjQMGIxl3zQbMVoLKVbr1GUwPFRZ8q/RJJQDLUx
         qq96dlDg79sHKEXn1jKXk8jx/GPC0/t71Gj9msTh9kZQVHE+Z/VYXNrG2ovK9wtptuGk
         ury74quG77S8m2RmkndJ3I4pgBWlsE2EuyVo4MJP/WOTkvmG3De5273/tVDlVld4PKTt
         eD9u1HoaAmpw3PDNAq7KOCA2QrcKaLipL4PJkGrtqafNomrXEDsynmDrS5FD3PWgOSvc
         UpGg==
X-Forwarded-Encrypted: i=1; AJvYcCUQD538LcVFOxWLTJYIqo8fNLJQPVdNa1dlAcaVzRdjMo3/BOaOxIzVeWAcaGVKTtvLFC/nIVZzAfcIM48=@vger.kernel.org, AJvYcCWgLhHQ3PJwsKn2YAjCDecF5Y7BopDMYijkw3FihYfwIcbwfnH5S7zzrWcyHyhuTerzMsT6m+5hmBF/mmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVX4377uHtQLFHvaxC5wICG1AFQzwG+VueQCFeZKaroWOPxwqa
	Jqfdu9ocnJrpbHzGWwflCMPcIIUhBiLg6o8TEedXyvu0jPmEi35LS+dz03Ve/ctnl7chLPPCkCh
	v6clkIcX0a1w/vCcinkamd51o1aU6RPzuvOcm
X-Gm-Gg: ASbGncutoPqGOTSAtI0uXXIRE6PuHtF1otkTPf+zhH3kYKcy/rNVFWzO97VhQr2A3Yw
	/ixev0jw+88s7wX09NygjU4kfhoJGhpnXTg/VpOedB6f1nXQoz14sPFPbzF9p9RgPBWM8F6YqDF
	zLFmTuHCrdcAeV45neOQkg4mAHhqrvVCygX4CsQ3amnU1BB+sfI01Oew==
X-Google-Smtp-Source: AGHT+IHnDuLvLfejqboRjI3Nimbpls7hnKoDbyNe7W42pgoxHL6wBP7zDxd/XlXHmJNNt9Ix9KPSr9YZn5dvzzlvalc=
X-Received: by 2002:a05:690c:6485:b0:712:c295:d023 with SMTP id
 00721157ae682-7166a18c8e1mr83477087b3.6.1751897731678; Mon, 07 Jul 2025
 07:15:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
 <20250707140923.58935-2-abdelrahmanfekry375@gmail.com> <00673c30-8233-417a-9f8b-2ab91381fa4d@kernel.org>
In-Reply-To: <00673c30-8233-417a-9f8b-2ab91381fa4d@kernel.org>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Mon, 7 Jul 2025 17:15:20 +0300
X-Gm-Features: Ac12FXzR3h8Pxd-1k676hKF77K5klKtgO3uH2HtIeCoP5FJR4Aai-4e9y3wGygk
Message-ID: <CAGn2d8PjT+gE2EH0+YT_-ivfcXBuBM1OxTLEAvy+sFctpc66Aw@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: media: atomisp: return early on
 hmm_bo_device_init() failure
To: Hans de Goede <hansg@kernel.org>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.org, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans.
On Mon, Jul 7, 2025 at 5:12=E2=80=AFPM Hans de Goede <hansg@kernel.org> wro=
te:
>
> Hi Abdelrahman,
>
> On 7-Jul-25 16:09, Abdelrahman Fekry wrote:
> > hmm_init() would continue execution even if hmm_bo_device_init() failed=
,
> > potentially leading to bad behaviour when calling hmm_alloc().
> >
> > - returns the error immediately if hmm_bo_device_init() fails.
> >
> > Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> > ---
> >  drivers/staging/media/atomisp/pci/hmm/hmm.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/stag=
ing/media/atomisp/pci/hmm/hmm.c
> > index f998b57f90c4..c2ee9d2ec0d5 100644
> > --- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
> > +++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
> > @@ -36,6 +36,7 @@ int hmm_init(void)
> >                                ISP_VM_START, ISP_VM_SIZE);
> >       if (ret)
> >               dev_err(atomisp_dev, "hmm_bo_device_init failed.\n");
> > +             return ret;
>
> You need to add { } here otherwise the "return ret;" will
> always get executed since it is not part of the code block
> guarded by the if (despite the indentation).
>
Yes , sorry for this dumb mistake. I will send v2.

> Regards,
>
> Hans
>
>
>
> >
> >       hmm_initialized =3D true;
> >
> > @@ -48,7 +49,7 @@ int hmm_init(void)
> >        */
> >       dummy_ptr =3D hmm_alloc(1);
> >
> > -     return ret;
> > +     return 0;
> >  }
> >
> >  void hmm_cleanup(void)
>

