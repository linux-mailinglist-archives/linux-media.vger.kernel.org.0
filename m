Return-Path: <linux-media+bounces-1929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0075E809AF3
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 05:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CCFEB20EC0
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 04:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8485242;
	Fri,  8 Dec 2023 04:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XtWDFCWb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A25171C
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 20:23:03 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-7c45fa55391so395821241.2
        for <linux-media@vger.kernel.org>; Thu, 07 Dec 2023 20:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702009382; x=1702614182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDZS0haLyzX2rMNjByhL90PK2pxpUuZrfSW8MqJOxn0=;
        b=XtWDFCWbQg0pUopTWDb4SoMrtPlILpOvJMIq1lNgBIx0eBEWTfwU7Gm+fXRKJJVo0l
         zujCcdAl2kImPGqM9EAwtgz04Amk7wiKA5Ydy40WsYdzaHx8695VEzfjJ6ZO9u+ewB4G
         imMKiGL3uIpZHHwS6+vjohj/gEHRdqawJ3/HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702009382; x=1702614182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDZS0haLyzX2rMNjByhL90PK2pxpUuZrfSW8MqJOxn0=;
        b=PDH7mo/8Kv/YdYax3+YeVWg/Vu+es9vprE4LRo7e8RVdJP6evDs4Rqkq9p8lp1EM16
         VoyUlwmzxpsx0KmY95pSZw4xloQkltewZUV2EGtTm1NsOkUt5WwWxCqNY8bDnL3+nIh3
         236zLdzUsZCOGj6J2CI82/NZpTOYKH44vHp3bm0dcJugdPF6+JNtI8/mPJWI6EaNF0EK
         IvtgrKU4ENjvHpvptEoJSRumJ0QaXFamOgFGDAHxDJSDMssU6y2Vbu7BIMn+h7Ou1I94
         +vhh8KeEwDkLdj7vTMruAPdAjUtsp02h3X2Np3a7c6mtAVZYtQA67AxV/vus1eCOFLSe
         uJ0w==
X-Gm-Message-State: AOJu0YzKdstcYjrp7pDy0bdgsaDNRyfQbevZ4zOj1PY2p8R90rxkZaBv
	YMmj9O/6XXy5QfA1IPVfY5ToQa0IIpCg/bFfytg=
X-Google-Smtp-Source: AGHT+IFbH/i8eKhNX9/wUa+7OtNJ3JNZs4izVCCJjbkiMs2p2dDqUquCvODsBP0LdnsWcKSLoK3YLA==
X-Received: by 2002:a05:6102:dc7:b0:464:3a91:3fbd with SMTP id e7-20020a0561020dc700b004643a913fbdmr4599307vst.6.1702009382124;
        Thu, 07 Dec 2023 20:23:02 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ft10-20020a0561301a0a00b007c5ecf24314sm80585uab.29.2023.12.07.20.23.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 20:23:01 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7bb3e55c120so403073241.0
        for <linux-media@vger.kernel.org>; Thu, 07 Dec 2023 20:23:01 -0800 (PST)
X-Received: by 2002:a67:e893:0:b0:464:7c8c:e17d with SMTP id
 x19-20020a67e893000000b004647c8ce17dmr3179679vsn.9.1702009381069; Thu, 07 Dec
 2023 20:23:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231113123049.4117280-1-fshao@chromium.org> <20231113123049.4117280-4-fshao@chromium.org>
 <6c693161-0e89-4f9d-9a92-18f3783eefd2@collabora.com> <CAC=S1nhp3HoKGQr1UgKtZJ9SLMqvm-G_YZi9dEWWF3tj2d=OFQ@mail.gmail.com>
 <6046a40b-800c-4bf8-ab45-d7f1015b2d9c@collabora.com>
In-Reply-To: <6046a40b-800c-4bf8-ab45-d7f1015b2d9c@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 8 Dec 2023 12:22:24 +0800
X-Gmail-Original-Message-ID: <CAC=S1niMVxoryzg6X+vFcDpMRuO6YCzUFj4A+2yex+mfOBALRg@mail.gmail.com>
Message-ID: <CAC=S1niMVxoryzg6X+vFcDpMRuO6YCzUFj4A+2yex+mfOBALRg@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: mediatek: vcodec: Fix mtk_vcodec_mem_free()
 error log criteria
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 8:55=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/12/23 12:17, Fei Shao ha scritto:
> > Hi Angelo,
> >
> > On Wed, Dec 6, 2023 at 6:19=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 13/11/23 13:26, Fei Shao ha scritto:
> >>> mtk_vcodec_mem_free() shouldn't print error if the target DMA buffer =
has
> >>> never been allocated or was freed properly in the previous call. That
> >>> makes log confusing.
> >>>
> >>> Update the error path to print log only when the caller attempts to f=
ree
> >>> nonzero-size buffer with VA being NULL, which indicates something ind=
eed
> >>> went wrong.
> >>>
> >>> This brings another benefit that the callers no more need to check
> >>> mem->va explicitly to avoid the error, which can make the code more
> >>> compact and neat.
> >>>
> >>> Signed-off-by: Fei Shao <fshao@chromium.org>
> >>
> >> I think that this error is supposed to catch two issues in one:
> >>    - We're called to free no memory (something that does make no sense=
),
> >>      this may happen for example when calling xxx_free() twice, and it
> >>      is a mistake that *must* be fixed;
> > When I made the change, I was thinking of kfree() that doesn't warn
> > against a NULL pointer.
> > I imagine mtk_vcodec_mem_free() calls with NULL VA and mem size 0
> > probably have the similar nuance (if the buffer exists, free it; never
> > mind otherwise), but I could have missed some important differences
> > specific to the MTK vcodec driver.
> >
> > Looking at the mtk_vcodec_mem_free() usages, almost every one of those
> > checks VA beforehand, but nothing else - they don't warn or do
> > anything special when they encounter a NULL VA, and they should if
> > that's a concern.
> > Some even don't check at all (and I think that's why I ended up seeing
> > the errors mentioned in the cover letter). As for that, I think
> > there's nothing else we can fix except prepending "if (mem->va)".
> > So from all this, I feel perhaps we don't need to worry much about
> > those NULL VA, and we can further remove the checks (or at least move
> > it into mtk_vcodec_mem_free()) to trim the lines in the driver. That's
> > the reason for patch [4/4].
> >
> > Not sure if that makes sense to you.
>
> What you say does make sense - and a lot - but still, I think that freein=
g
> a NULL VA (=3D freeing nothing) is something that shouldn't happen...
>
> >
> >>    - We're failing to free memory for real (which you covered)
> >>
> >> ....that said, I think that if you want to clarify the error messages
> >> in this function, it should look something like this:
> >>
> >> if (!mem->va) {
> >>          mtk_v4l2_err(plat_dev, "%s: Tried to free a NULL VA", __func_=
_);
> >>          if (mem->size)
> >>                  mtk_v4l2_err(plat_dev, "Failed to free %lu bytes", me=
m->size);
> >>          return;
> >> }
> > Sure, I can revise the patch with this, but I also want to make sure
> > if the NULL VA print needs to be an error.
> > If you still think it should, I guess I'll drop the current patch
> > [4/4] and instead add the check before every mtk_vcodec_mem_free()
> > calls. This should also work for the issue I want to address in the
> > first place.
> >
>
> ... because if you notice, some of the calls to mtk_vcodec_mem_free() are=
 not
> checked with `if (something->va)` beforehand, so I think that those are c=
ases
> in which freeing with a NULL VA would actually be an indication of someth=
ing
> going wrong and/or not as expected anyway (checking beforehand =3D error =
won't
> get printed from mtk_vcodec_mem_free(), not checking =3D print error if v=
a=3D=3DNULL)
>
> It's an easy check:
> cd drivers/media/platform/mediatek/vcodec
> grep -rb1 mtk_vcodec_mem_free
>
> P.S.: h264_if, av1_req_lat :-)
Yes, these are exactly what I wanted to imply in ">> Some even don't
check at all", and I should have pointed them out to avoid
ambiguity...
And I understand your concern. Presuming the NULL VA case is and will
always be safe to ignore can be too assertive, and getting explicit
error logs is always better than lurking bugs.

>
> That's why I think that you should drop your [4/4] - unless MediaTek come=
s in
> stating that the missed checks are something unintended, and that every i=
nstance
> of VA=3D=3DNULL should print an error.
>
> I honestly wouldn't be surprised if they did so, because anyway this occu=
rs only
> in two decoders...
Agree, it would be nice if Yunfei can share some thoughts here, or I
can reach out to him through other channels for alignment first, and
adjust this series based on the response.
The h264_if part was written a while ago (2016) and the av1_req_lat
part is relatively new (mid 2023), I hope it won't be too hard to
reach a conclusion for those.

Regards,
Fei

>
> Regards,
> Angelo

