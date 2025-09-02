Return-Path: <linux-media+bounces-41586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B82BEB40206
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 15:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F28F5E005D
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 13:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59C82F8BC0;
	Tue,  2 Sep 2025 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XNLtwQCA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5D8247DEA
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 13:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756818129; cv=none; b=aRFYW4hmslReMbBzOSC3/4vOLSCluUVGnBVE2MCBJxU3eAydWtF4n4mLUw7wHb4+7D3WvzaKvrlPIXZmnq1Xottck+eKBpk+Qvx9AnOyFQdzWw5Uo1fYCoMqNTThREk56DJ/UDXDxSsY32ZGlB1uVjWV7RBOnbJqQt+ZGiIjb3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756818129; c=relaxed/simple;
	bh=UVIgmICVSJvf5BvbpaAfuoCqQ/eKTur0qKjq+haP0fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXCXdaBiysQvIo2/TM4mDNW424MqR/Io4sze9GlOEv42pi+RZ39cmd/6QjuFEDaHRmpnTyL3A/qmK8+z4uIOaH3EV7GJ0GGWh1QbBSv4isfnWhTZ5VbTNj14eP7uiiu4yGBkVEteWY7qfKp8SgvUK39BAWvfktuXDUtZXdaRWuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=XNLtwQCA; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24b1622788dso4862235ad.2
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 06:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1756818127; x=1757422927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsD0GXiFL9NybKzGEO0/NbitW5g5XoTA6xEbrkh/qJo=;
        b=XNLtwQCAPYCJgJt6n5bZJABLLnuQrs5otC1EkxlLkT1dugrrvS4sf9GBjIDhfIrLyj
         qTXObCigHdoX+jn0+HsG6NuQBcnxaTYHfkO8aohMAkL7L2YmXuraqCBaiquxeh//dgv+
         UnX7hRstwDCvpTfW/hIe9SewGts2b9xbHTwl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756818127; x=1757422927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UsD0GXiFL9NybKzGEO0/NbitW5g5XoTA6xEbrkh/qJo=;
        b=MuEah3uIX50iCWwOqGWHFQVVHleDvCJBIffgdDXggVVlsRIF/iiwcqKpPptNL2Z9kn
         PIz1hCAwZ+41YPbBT764QsUfEEVr1kQs//KK9CUG15D1Ii7DkkfgEc9W9R0WE7WsSiEr
         OzP8UP3J7JBTwLPeApx56ktQqQvTXdhtIeVnKoebTvzmJ2NYGWNuF7YEgl2rQTy5gj9u
         fHW2f1El4aOWnDGzZQsmUFPouljlAdvgXHwvlZStPFDB9boHSzkX+0Y8qCxoSzT2x8fH
         t9N/YctcwnBuNfhTnh2gz0rJHborQpc9my5oHXiJoB55bR+F3110rCUkYpOxSjG3bbrB
         xEDQ==
X-Gm-Message-State: AOJu0YyiE9t1ItSKxDKhVqmOp9N5Q0bW9/S5HO0YtxoHvMV88EhaSfQu
	PeCzCQ9pv+anzmH3fbPUgisRI3BrK+G6x+ynBZgRibzfSh3axwtXX5z4pexWysRM/0pat0zjFGI
	09LLvu2qvk/xf3Py2cPHFUlQ0v72D5B8s2RvRDOtt9V2zZEwOoA37eEfP3l18
X-Gm-Gg: ASbGncvsVBJRC10mbjbnme+BzBMPiFmLSDuqVKz9ArEBu39C8+TLB17bvFwd013zuNR
	vCQS1rtUb5lsa9/a2ZgX5dPGDmvrVXSYM3txtdol0Gw0GKxwuniyH7jiSFw1CZ8Ojy5VJ+3qGBl
	tCbajQct47wb1Jsu9dA49/HWwg1qe7ntOEeXEjZ9RflqjPTYRwbh0tApJjsN4lCg3B9s75SoYKO
	Ionj+rF1LHmUO9IQsvD
X-Google-Smtp-Source: AGHT+IGp+drUbt2MRMvhrvz0L7QlcOtbe0VSocItSyiEnV9e2m6BGSfI/ltY/sh3rDaW42f66k1rB+D5qUoWes9KyvI=
X-Received: by 2002:a17:902:cec3:b0:246:42eb:5795 with SMTP id
 d9443c01a7336-24944ab8189mr123200335ad.30.1756818125098; Tue, 02 Sep 2025
 06:02:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOf5uwmTTFcizew2QRAr=TZ12hTfXg6NFEsDYKASB7wPeB4odw@mail.gmail.com>
 <7b37c5679994281ae1806f2ee84d1aede77ca836.camel@collabora.com>
In-Reply-To: <7b37c5679994281ae1806f2ee84d1aede77ca836.camel@collabora.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 2 Sep 2025 15:01:53 +0200
X-Gm-Features: Ac12FXxMH-KNJbk6dzcOe2p33YeVnmUrj2hA8pyu_lUhAQLxmLWccJzrJfvAFBU
Message-ID: <CAOf5uw=uPkC60gE7Ea_ZnEZdYJRYRJKz=OVUN0RvO_NVe2tw5A@mail.gmail.com>
Subject: Re: Hantro G1 jpeg decoder stm32mp2 (plain text)
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media <linux-media@vger.kernel.org>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas

On Tue, Sep 2, 2025 at 2:55=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi,
>
> Le mardi 02 septembre 2025 =C3=A0 11:50 +0200, Michael Nazzareno Trimarch=
i a =C3=A9crit :
> > Hi all
> >
> > I'm working starting from downstream jpeg decoder to properly support
> > the usb camera to decode mjpg. After look at the header I found out
> > how to decode the RSTx block and have a correct image that I can show
> > on wayland display using:
> >
> > gst-launch-1.0  v4l2src device=3D/dev/video2 ! image/jpeg,
> > framerate=3D30/1,width=3D640,height=3D480,format=3DMJPEG ! v4l2jpegdec =
!
> > video/x-raw, framerate=3D30/1, width=3D640, height=3D480, format=3DNV16=
 !
> > videoconvert ! waylandsink sync=3Dfalse
> >
> > Now the problem moves to videoconvert that is software based. Anyway:
> >
> > The patch was only to consider:
> >
> > -       if (header.restart_interval)
> > +       if (header.restart_interval) {
> >                 reg |=3D G1_REG_DEC_CTRL2_SYNC_MARKER_E;
> > -
> > +               vdpu_write_relaxed(vpu,
> > G1_REG_DEC_CTRL5_IDR_PIC_ID(header.restart_interval),
> > G1_REG_DEC_CTRL5);
> > +       }
> >
> > The interval and program it in the corresponding register.
> >
> > All the USB cameras I have tested have 422 subsampling that let the
> > decoder decode to
> > a NV16 image. Now to show on the screen and present the image, the
> > hantro needs to have
> > NV16 dst image buffer but anyway the decoding produces the NV16
>
> Di you make a typo here ? You are saying that the display needs NV16 and =
the the
> decoder produces NV16, which would mean nothing is needed. Can you clarif=
y ?

v4l2jpegdec ! video/x-raw, framerate=3D30/1, width=3D640, height=3D480,
format=3DNV16 ! videoconvert !

if I don't link video convert here the driver does not receive NV16
buffer enqueue from userspace and
waylandsync does not get NV16 as output format from the decoder, so
videoconvert in this case is needed
to have pipeline running but with large overhead

> Note that G1 pos-processor does not support NV16. It can only output YUY2=
 as 422
> format. Other formats are NV12 and RGB + some excape format that are bare=
ly
> documented.

Yes but it can get NV16 as input but not sure, because I need to work
on code in [1]

>
> > format. I'm trying to figure out how to work on hantro postprocess,
> > that if I understand correctly, try to go to the requested
> > output format but expecting NV12 as input format hardcoded. I have trie=
d to:
> >
> > +       switch (ctx->vpu_src_fmt->fourcc) {
> > +       case V4L2_PIX_FMT_NV12:
> > +               src_pp_fmt =3D VPU_PP_IN_NV12;
> > +               break;
> > +       case V4L2_PIX_FMT_NV16:
> > +               src_pp_fmt =3D VPU_PP_IN_NV16;
> > +               break;
> > +       default:
> > +               WARN(1, "input format %d not supported by the
> > post-processor, use NV12 ",
> > +                    ctx->vpu_src_fmt->fourcc);
> > +               src_pp_fmt =3D VPU_PP_IN_NV12;
> > +               break;
> >
> > and add the NV16 that should correspond to
> > +#define VPU_PP_IN_NV16                 0x4
>
> Yes, NV16 seem to match 100b.
>
> >
> > What is a bit not clear to me is how should I proper handle this
> > difference in postprocess and how buffer are properly pass to the
> > decoder and then to the userspace. Apart from that what
> > I have read from [1] is that if the pipeline is enable the
> > G1_REG_DEC_CTRL0_DEC_OUT_DIS should be set to 1, but I did not see any
> > driver to it. What I need to continue is a better understanding of how
> > the post process manages buffering. I think that then I can directly
> > pass
> > the only color supported by post-process as caps to gstreamer. Am I rig=
ht?
>
> If you only have one format support, you don't need to force anything in
> GStreamer. Some extra information about Hantro post-processor. When used,=
 you
> need to provide 2 sets of buffers. The decoder will still produce NV16, a=
nd a
> secondary set of buffers is (in parallel, pipeline mode) written back int=
o the
> format you have configured on the PP register set.

Those sets of buffers are provided by gstreamer or how does this
handle in practice for
other decoders?

>
> The post-processor can also be used in standalone mode, but this feature =
is
> often fused out. In that mode, in can input interleaved YUV, as often pro=
duced
> as raw format by USB cameras (and most cameras using serial links).

Much better. Now I need to understand better about the two set of buffers

MIchael

>
> hope some of this is useful,
> Nicolas
>
> >
> > Michael
> >
> > [1] https://github.com/linux4sam/g1_decoder.git

