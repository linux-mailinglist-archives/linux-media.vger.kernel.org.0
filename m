Return-Path: <linux-media+bounces-15124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C32419350DD
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 18:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1D001C2164F
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 16:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE76A14532F;
	Thu, 18 Jul 2024 16:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="v+DBl7wP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FFF7407A
	for <linux-media@vger.kernel.org>; Thu, 18 Jul 2024 16:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721321200; cv=none; b=BFZ3RZZ+KMoC+FDgGj+4tI989S3wl30DFOwt18EWajeICxLSQ43TTey+tbzypOdCxfg4jBq5cquNhEoLprThJba5uELrfh1+6Vcv8edr8ulM+y1ey8xCZXZMr9srFTOXpB2BVmwVNSaYz29EjmJguRJMFwFq+1uZ9bjc6ntQWus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721321200; c=relaxed/simple;
	bh=3TaMFJClL91Mk6uYB1Z2gfkij/2N4qB4v23wtBnKSGM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JNhLZYTclU9arQitSZqi7WqrLsGFCZPd4aDcwE50rJ1x/1/HkHrx6mhmnAwt3Zugdwvr3oKJ+L5UiADeDn833V0LnNroVavNkuHvGVg1Qt43rzt0iaOZCAhDXclk3te/gXDngUJlVqQVHZpilRehiyBEBPyPZPydC1gX9M7FOv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=v+DBl7wP; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-79f06c9c929so46178885a.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jul 2024 09:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1721321197; x=1721925997; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UCJzuich5vcNF0XDpn0++KWksAKuSuGZiqpZTSOzP6g=;
        b=v+DBl7wPZ5DrylWoCGo6TREuE00iz3cuXktM8P+bFuz3vIqPGSc7CRMM+3r2/Z7qwi
         DFcHlsvMw/8fRiK5cXIORX3pVnAFpiT8+hSAKvB17lO24nhgeb7BlMQr5V3YKNjUCzBT
         4VPcvQylNL24WH1P1qEjEz3SzKys5YyffVR3uolg7b4RVbE7QA1mY5V/4yBV+Rs5LLFV
         4KsPU1fVS2LceOqTeTHwysMUsFOKxMkpy/XG/7G3zGgJkm71gxLFLK2Bp3BwC81G2t29
         HRHdfVyPc5kx6fjDsIcMi8zAfmt9Zaz2RaMHwQferENXHOnPT3L7Bs+CNwfTClKuTAaI
         XFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721321197; x=1721925997;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UCJzuich5vcNF0XDpn0++KWksAKuSuGZiqpZTSOzP6g=;
        b=b/9OYo73HYCfyzEaquO4kpNjBe9Tt9l50qAmN3C6DEvYXvRBPEJJMVyzkJINTt1Log
         ed4yYvg89bnudVfMDiBg+XwFpLtjisD1iRrLd49767f1I/9WpiDfX0suedmCoQJhyb9T
         TNh7fvnOiZnfNxXI+339l/zNSa71+4yv9Ef3xDg8xk2NuQJx2cl7gRCYaGpYzhd8rJI9
         9z4Z5uVTFnQ4ghPHv9DIlP3/8Z6Qm57xRPxoPh+GtvI49V0lSyBAAuhCxbXX2B/TnDEP
         n3PCf2PZ5ZTX89Yj07dJQsyjqLHggGmfEXncV5JShXhkFLzYGntsSKq+rU2mnEuxNN1f
         lqdg==
X-Forwarded-Encrypted: i=1; AJvYcCXVOTR57If9rpUVqiPlAXMb+D6q9kFYTfssxou26fXAXU54zBk9DpANibR3MSEDW6y7Y8vquJSx0gkIM6ZHRH0qCF9AB+MPCO4z1bc=
X-Gm-Message-State: AOJu0YwkD7bICTIVYtzgaE7lM8tqgDjs4Ph6VzdjEJYUOhLPgNcKKt2L
	VMr8OlFzZoSd7Tg+zW1G+qTYDDh48GtJXm+yvaN5IZddnLJJwv6+1sMF2/WKDIyvTYA3eB2tX5P
	J
X-Google-Smtp-Source: AGHT+IHJwrUl/hDdqC/9tlGT2hk67IHXHUg+9Nt8C0hnwHeNLUcBO/UNKF5hNdOJ0fKvP8V96Myt1g==
X-Received: by 2002:a05:620a:4014:b0:79f:7c0:ebfd with SMTP id af79cd13be357-7a193929281mr215018785a.16.1721321197324;
        Thu, 18 Jul 2024 09:46:37 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:6720::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a19396e2b6sm41538085a.109.2024.07.18.09.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 09:46:36 -0700 (PDT)
Message-ID: <7a5167163f1df60899c9e2bfef1e42e0c67567f7.camel@ndufresne.ca>
Subject: Re: [PATCH v4 1/2] media: videodev2: Add flags to unconditionnaly
 enumerate pixels formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Jacopo Mondi
	 <jacopo.mondi@ideasonboard.com>
Cc: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
 hverkuil-cisco@xs4all.nl,  linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-rockchip@lists.infradead.org,
 kernel@collabora.com
Date: Thu, 18 Jul 2024 12:46:35 -0400
In-Reply-To: <069a9e2b-f0bc-46a7-aaec-f30157e9be2d@collabora.com>
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
	 <20240717131430.159727-2-benjamin.gaignard@collabora.com>
	 <2kbxr3hkjbcnaqescxmlcerziixg72icqpug6wa25eeggy2pnj@vqmxe4ojcwml>
	 <dfc292f8-0014-4bf4-9429-31f729a176cd@collabora.com>
	 <ok2a4ubzka6rhzyj2c5op73ij7pw35g6e75whc2jjget62fatx@zka2ewyt3kfv>
	 <c8358d79bd51a9bfa5116b33ae5e7766b95d344d.camel@ndufresne.ca>
	 <1faa7098-b108-480e-ae4b-ed25e0020e51@collabora.com>
	 <7113029e2e192d43523a1ea5dae041fb53ae5948.camel@ndufresne.ca>
	 <b454d93d607047c63663b3f003b3d3c23f07bac7.camel@ndufresne.ca>
	 <069a9e2b-f0bc-46a7-aaec-f30157e9be2d@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 18 juillet 2024 =C3=A0 16:43 +0200, Benjamin Gaignard a =C3=A9crit=
=C2=A0:
> Le 18/07/2024 =C3=A0 16:02, Nicolas Dufresne a =C3=A9crit=C2=A0:
> > Le jeudi 18 juillet 2024 =C3=A0 09:56 -0400, Nicolas Dufresne a =C3=A9c=
rit=C2=A0:
> > > Hi,
> > >=20
> > > Le jeudi 18 juillet 2024 =C3=A0 09:04 +0200, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> > > > Le 17/07/2024 =C3=A0 19:50, Nicolas Dufresne a =C3=A9crit=C2=A0:
> > > [...]
> > >=20
> > > > > > > > > @@ -1569,6 +1569,7 @@ static int v4l_enum_fmt(const struc=
t v4l2_ioctl_ops *ops,
> > > > > > > > >     	int ret =3D check_fmt(file, p->type);
> > > > > > > > >     	u32 mbus_code;
> > > > > > > > >     	u32 cap_mask;
> > > > > > > > > +	u32 flags;
> > > > > > > > >=20
> > > > > > > > >     	if (ret)
> > > > > > > > >     		return ret;
> > > > > > > > > @@ -1578,8 +1579,10 @@ static int v4l_enum_fmt(const stru=
ct v4l2_ioctl_ops *ops,
> > > > > > > > >     		p->mbus_code =3D 0;
> > > > > > > > >=20
> > > > > > > > >     	mbus_code =3D p->mbus_code;
> > > > > > > > > +	flags =3D p->flags & V4L2_FMT_FLAG_ENUM_ALL_FORMATS;
> > > > > > > > >     	memset_after(p, 0, type);
> > > > > > > > >     	p->mbus_code =3D mbus_code;
> > > > > > > > > +	p->flags =3D flags;
> > > > > > > > Won't this set V4L2_FMT_FLAG_ENUM_ALL_FORMATS (if present) =
in the
> > > > > > > > flags returned to userspace ? Shouldn't be drivers to set
> > > > > > > > V4L2_FMT_FLAG_ALL_FORMATS instead ?
> > > > > > > memset_after zeroed flags field so we need this to send V4L2_=
FMT_FLAG_ENUM_ALL_FORMATS
> > > > > > > flag to drivers. Return it to userspace is a side effect but =
I don't that is problem
> > > > > > > since it set it anyway.
> > > > > > >=20
> > > > > > Ok, if the expectation is that the flag is preserved through th=
e ioctl
> > > > > > call, this is fine with me
> > > > > I might be missing something other similar features are explicitl=
y advertised by
> > > > > drivers. This way, the generic layer can keep or clear the flag b=
ased of if its
> > > > > supported. The fact the flag persist the ioctl() or not endup hav=
ing a useful
> > > > > semantic.
> > > > >=20
> > > > > Could we do the same?
> > > > It is the only flag set by userspace when calling the ioctl(), all =
others
> > > > are set by the drivers.
> > > > I can clean it from the ioctl() structure after driver call but tha=
t won't change anything.
> > > This does not answer my question. In other similar feature, we have a=
n
> > > **internal** flag set by drivers to tell the framework that such feat=
ure is
> > > abled. Using that, the framework can keep or remove that flag based o=
n if its
> > > supported or not. This way, userspace have a clue if the driver do ha=
ve this
> > > support or if the returned result (in that case) is just a subset mat=
ching the
> > > configuration. We don't seem to have done the same level of effort he=
re.
> > For the reference, you actually use that semantic in GStreamer implemen=
tation,
> > but the kernel code seems broken.
> >=20
> > https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/707=
8/diffs#eb90d5495df2f085f163996014c748a36f143f76_516_527
>=20
> device_caps u32 field is already almost fully used, only one 1 bit is fre=
e.
> I could use it but, for me, the capability to enumerate all the formats
> doesn't fit well in the existing list.

Sorry, but I will re-iterate that I don't mean to add a uAPI but an **inter=
nal**
flag between driver and framework. This way the framework knows at least.

>=20
> Benjamin
>=20
> >=20
> > > Nicolas
> > >=20
> > > > > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > >=20
> > > > > > > > >     	switch (p->type) {
> > > > > > > > >     	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> > > > > > > > > diff --git a/include/uapi/linux/videodev2.h b/include/uap=
i/linux/videodev2.h
> > > > > > > > > index fe6b67e83751..b6a5da79ba21 100644
> > > > > > > > > --- a/include/uapi/linux/videodev2.h
> > > > > > > > > +++ b/include/uapi/linux/videodev2.h
> > > > > > > > > @@ -886,6 +886,8 @@ struct v4l2_fmtdesc {
> > > > > > > > >     #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_=
YCBCR_ENC
> > > > > > > > >     #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
> > > > > > > > >     #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
> > > > > > > > > +#define V4L2_FMT_FLAG_ENUM_ALL_FORMATS		0x0400
> > > > > > > > > +#define V4L2_FMT_FLAG_ALL_FORMATS		0x0800
> > > > > > > > >=20
> > > > > > > > >     	/* Frame Size and frame rate enumeration */
> > > > > > > > >     /*
> > > > > > > > > --
> > > > > > > > > 2.43.0
> > > > > > > > >=20
> > > > > > > > >=20
> > > > > > > > _______________________________________________
> > > > > > > > Kernel mailing list -- kernel@mailman.collabora.com
> > > > > > > > To unsubscribe send an email to kernel-leave@mailman.collab=
ora.com
> > > > > > > > This list is managed by https://mailman.collabora.com
> > > > _______________________________________________
> > > > Kernel mailing list -- kernel@mailman.collabora.com
> > > > To unsubscribe send an email to kernel-leave@mailman.collabora.com
> > > > This list is managed by https://mailman.collabora.com
> > > _______________________________________________
> > > Kernel mailing list -- kernel@mailman.collabora.com
> > > To unsubscribe send an email to kernel-leave@mailman.collabora.com
> > > This list is managed by https://mailman.collabora.com


