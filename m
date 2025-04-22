Return-Path: <linux-media+bounces-30745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA153A97830
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 23:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 058081691E6
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 21:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087332DAF80;
	Tue, 22 Apr 2025 21:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lIR85V5j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D189F2D1903
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 21:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745356072; cv=none; b=Cvxp64cxy1Rvkc80Zy684Q4WWE6lmqoGewa1r9IHZbx+AqodQaqOZaowRo+RqVu2R30j03J77B/d6jlFmdm9g6AKYI4+6PJ443EzTMSj4VRs2wP3CTkceeSfuQfs0YEsCldSsD11ypbwQRdJuGclx4j3OcD/3o8SYUd+gd41LoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745356072; c=relaxed/simple;
	bh=rkEwoUmgvj28dgtudlJMOGhZi2riSOSmKLBB+FYyAno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uUnfDL/Bu1JTkajPdftGnO2cVm5uAyZ96G+/pRlBCC0RnwjsP/GODYB329Yo/VjnV8gxxiqcSTL86GTpVJTF4Ry4FLFEaSZJ8uSe0uq5mXXbA357cpvUlzG7eqivVKLdJ47V3c7Gj+Fzv+5wQJRu9G2tkAr41K60mO16GtflGjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lIR85V5j; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b07d607dc83so4352130a12.1
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 14:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745356070; x=1745960870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45H/AloEC5EQosKI+fEptjCF1JCPdnHEO37xdJvt3C0=;
        b=lIR85V5j9cHLmQqogLK3vq59LYiGrdgmowxdy9Za0skmsQLa5XhXDm8nSdukAyYoD+
         MBo51hPf8GEVf0qqUAjcQTkvzpU/j9ufarKXabtso3EGMQZRqrTltf8dvDL/UmuAFZ8F
         eCB/8KEFzz3/8VkfJji/eK+etHztfCAkaq7tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745356070; x=1745960870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45H/AloEC5EQosKI+fEptjCF1JCPdnHEO37xdJvt3C0=;
        b=ekCSQ++zQ/zALfRfZfIB4E4fngm4CXTHKdpIzTs2p8Kyp4ppYwdlfcwc+x+yJasirG
         E5JEIUBp6MRmnoQzHLzsFurmRpFyoklFm6UmNL2LkPH4P+Fk7Pwn9O8g4Q9aGtsaWfxb
         WX7oRD3yiVXAhNQJmKua3DNlPQ03crMHsc53nxkvjtMy+d7raUDMu+d4JGdo5w+Nmva5
         J+rbyIAhkvaKPjMEt5MPJc42dHld53PBLaBwelcgbhfsJHkrUWkEZcl1sfa9siDwaWYu
         n6gIDkj/j8piwCua5TosbbT2CAaZqG0jsSRqJp+wyQ+PELMEQ0mSwgSWmzV7m1v1rPAQ
         0lig==
X-Forwarded-Encrypted: i=1; AJvYcCWyrCndIPbtqQtxqXKjDFBq0u6l8VQdSYQdZgxri12fS9GWI6JP2aerCZGiI2UuEZCAYjSpkgiQvI0I0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEcP9BuRc7LKsVwA1VqrjyjocJOfL8sZoRgD6y4LeDwZoC/s8s
	7oUa6C11PXWjoIiJ2fuMb6ZE0aqgVQD0BW8Jrlg9teaP5kUAG7RzSWU0TLY9y0o0IafJBs9Tkc4
	6VBNQe/b/5EYI+m/VcFadL7WgpeTwSpAq+BH9
X-Gm-Gg: ASbGnct3SyhPWpZhx1bpFet1Ijvp7HX+OVaN2s0/clDW9mdYRHHhEPuGIr0YIz55SgL
	owxIILU3TKatMCHQnSfleWWSysqxEndHAMMjVlB/x8ghAKc9LARQBBRAnOj2QVcWgPeSXGf8p6H
	C7adRcsKDiGXU/l78YoNzyBC5dHczn/zGZDLFenou7sXNTshmw/mBQt4U7w8OzmbU=
X-Google-Smtp-Source: AGHT+IGltlrXXX5WKjfs3az+RLOdT3RUOZ4pgUz3pzyv9A2wvBoVRwdKL4WWPasLspXHid4QoIa/QcaTAyeY1aVtvOw=
X-Received: by 2002:a17:90b:1f8c:b0:2ff:5ed8:83d0 with SMTP id
 98e67ed59e1d1-3087bb631d7mr27536082a91.16.1745356070047; Tue, 22 Apr 2025
 14:07:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-enable_hevc_still_picture-v1-1-0c06c0c9add2@chromium.org>
 <f257832e823d23c8324a9eaf7890dd4b6d50a6f0.camel@ndufresne.ca>
 <1f1e41700b16eef7fe790b9b14d6ccfd157f67ad.camel@ndufresne.ca> <a2cb7a26f120558ab7b84a6f954188c8e61f37a8.camel@ndufresne.ca>
In-Reply-To: <a2cb7a26f120558ab7b84a6f954188c8e61f37a8.camel@ndufresne.ca>
From: Nathan Hebert <nhebert@chromium.org>
Date: Tue, 22 Apr 2025 14:07:39 -0700
X-Gm-Features: ATxdqUGjCZHeQwn5h4Wm7IoTgUdcsGQStAHC2clGfbY2_C-9n3g3PH2xVEW8YXs
Message-ID: <CANHAJhE--nOrMnCHPEEmRyTvd6mK5GoC+J7TdX64VEX+OJ69Kw@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Enable HEVC main still picture decode
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 1:54=E2=80=AFPM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Le lundi 17 f=C3=A9vrier 2025 =C3=A0 14:28 -0500, Nicolas Dufresne a =C3=
=A9crit :
> > aLe lundi 17 f=C3=A9vrier 2025 =C3=A0 13:45 -0500, Nicolas Dufresne a =
=C3=A9crit :
> > > Hi Nathan,
> > >
> > > Le mardi 11 f=C3=A9vrier 2025 =C3=A0 16:34 -0800, Nathan Hebert a =C3=
=A9crit :
> > > > Mediatek devices that support HEVC also support the main still pict=
ure
> > > > profile, but today, the main still picture profile is excluded.
> > > >
> > > > This removes the skip mask for HEVC, and enables the main still
> > > > picture profile decoding.
> > > >
> > > > Signed-off-by: Nathan Hebert <nhebert@chromium.org>
> > > > ---
> > > > On Mediatek devices that support HEVC decoding, HEVC Main Still Pic=
ture
> > > > profile is also supported by the SOC and firmware. However, this
> > > > capability is turned off in the vcodec driver.
> > > >
> > > > This removes the code that disables HEVC Main Still Picture profile
> > > > decoding. Validation of the decoder has been done via V4L2-backed
> > > > Android CTS tests on an MT8196 device.
> > >
> > > While its nice to know that you are working on upcoming SoC, we need
> > > confirmation that this is working on all the upstream stateless
> > > decoders supported: 8183, 8186, 8192, 8195. Ideally testing on 8188,
> > > which I can see has merged support without the linux-firmware file to
> > > go with it.
> > >
> > > I'll wait for that and Yunfei's ack before picking it. Yunfei, please
> > > fix the situation with 8188 in linux-firmware, and CC me.
> >
> > In case this is useful, we recommend providing fluster scores for the
> > codec, which in that case runs some public ITU conformance vectors.
> > Since most of the testing has been done with GStreamer, you may be able
> > to find old report and confirm it it works. GStreamer does not
> > currently filter the profile/level (on my todo), so it will try anyway.
> > IPRED_B_Nokia_3 is the one vector in the base suite that expose that
> > profile.
> >
> > resources/JCT-VC-HEVC_V1/IPRED_B_Nokia_3/IPRED_B_Nokia_3.bit
> >   Stream #0:0: Video: hevc (Main Still Picture), none, 1920x1080, 25 fp=
s, 1200k tbr, 1200k tbn
>
> Ran the test myself on MT8195 and can confirm it passes if you ignore
> the profiles.
Thank you for checking, Nicholas. I apologise for slow action on my
end. My work priorities have pushed this back in the queue.
>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>
> >
> > regards,
> > Nicolas
> >
> > >
> > > regards,
> > > Nicolas
> > >
> > > > ---
> > > >  .../media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateles=
s.c   | 2 --
> > > >  1 file changed, 2 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vco=
dec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vc=
odec_dec_stateless.c
> > > > index afa224da0f41..d873159b9b30 100644
> > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec=
_stateless.c
> > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec=
_stateless.c
> > > > @@ -152,8 +152,6 @@ static const struct mtk_stateless_control mtk_s=
tateless_controls[] =3D {
> > > >                   .id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> > > >                   .def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> > > >                   .max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> > > > -                 .menu_skip_mask =3D
> > > > -                         BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STI=
LL_PICTURE),
> > > >           },
> > > >           .codec_type =3D V4L2_PIX_FMT_HEVC_SLICE,
> > > >   },
> > > >
> > > > ---
> > > > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > > > change-id: 20250211-enable_hevc_still_picture-26b35eb08270
> > > >
> > > > Best regards,
> > >

