Return-Path: <linux-media+bounces-15117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B5543934EAC
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 16:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20342B22DD5
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 14:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1205E13F428;
	Thu, 18 Jul 2024 14:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="b/x5RGLM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02D72AEE3
	for <linux-media@vger.kernel.org>; Thu, 18 Jul 2024 14:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721311347; cv=none; b=D7Bz66xRr0paEWrqgeMi3eGJ0iKNNYsLz7RTkx4dNoIo/gZtQ6kDN/GF+QScBzmk0lX4q5mkmv8fJalLQdGvlrhvrlTT1U2kSODk8sglWWiwwCuwfxBVqX62igyUX9UNqhotL81G3kojdhS0kudCjZC57kT4eVK8XScVNEXGBAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721311347; c=relaxed/simple;
	bh=uUBxsP5OwqRySuis+qvxmdP/RnC8PnPtj0vuQbpcC9s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JWR2Q507YO8zqyEWwE+JrqZk/gF0S0NtbpfY/CRYYIClYCn68SGHv1CLDaXil8VmNtUdjXR4tt8C3ndbB7HFOXWxp/6P1H1oGCSKxO1Y9qthU4KNDYchUDr6BfiXC+7fvfInzIbb3EHvkZE3ZbMMubyQz5GmQreyTY/1djGNCVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=b/x5RGLM; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-79f08b01ba6so27245385a.0
        for <linux-media@vger.kernel.org>; Thu, 18 Jul 2024 07:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1721311345; x=1721916145; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VvKvPRO5NYjHhe01Oz3SoCj7a9pXNENI5vwSAmXcMLA=;
        b=b/x5RGLM1xAK3l+KeLI4Moh9AICJCgmBy9PGlX3bzp7t/iQE1OMD6dHqobVBVizr7v
         Tk45wuU2NP8nbR35xJL9GIflr1BBISAnvT8Fztz7NwK04UVMiIhYDOtWYzEIWbeagScw
         jp78HRoTHkf5IctfimyfxglXOxUdwvNGuvdHSoShutfuAPbZgICPTlxCScwaakD0Fecd
         2iJCCPGB7sP5ODgu9FEoubfrz4f2eEjiUxOVDhVLpvrunPu3ePjeMaAzqY4orSfPcOKD
         D0fV7ZSfHSRiStCEB+H2qFKGPnlnhYApnMP8qxOJt0/4PeNPC/Un6QrpaEBYpsMjUQ3O
         afBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721311345; x=1721916145;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VvKvPRO5NYjHhe01Oz3SoCj7a9pXNENI5vwSAmXcMLA=;
        b=JKtR+1H+M8m9fQ+K9aVq8a8MntYu9mXwLWPN1kBB/RuM+TKKzvEHvgwbKd2oFHPrpc
         d1zZ6rNQ5WRBTyn0roqw5366Q4uXaxycN8eatbEgg36XNlh+DvUbY1Xkme8F/IZHaPr8
         hEMSq4QNNJ60dxh5lDhrcyJzAquupWnf4PxHCibsMrR3D5rI5zZu0uUHeev288pO6j4E
         68Owjmp45beyDJnNpoJSlZKPJSff4aw3LvCcc4qDg+XtttTqOMr2q0EUMteViTTP3Rcj
         78T6dnHWsoZIci3OKcsg7TdAsul/RDS4TezQw9mOvOLrs4/YD0vT5gHRrXM82/bp1FdQ
         3DSg==
X-Forwarded-Encrypted: i=1; AJvYcCUni+M3VG9LlA6ISlEhR91eC2rvQOzSR1TknGJuT1EJB6XVzc7HrSCNGM/d2iT2z1voXCKe5igzSKajQINCwe4k2ldk9vIWjSaX4aQ=
X-Gm-Message-State: AOJu0YyVFlkhT8MV9j95EwT3HfIMtWEbBFpczhWpWKSGk0MT1Q0XZaIT
	isgWMiSMbYLQYJGTd59VF72GrvmIK4I9SiQ2HNwSB71IAnmSlkxLRIxgSB4HQK4=
X-Google-Smtp-Source: AGHT+IF+MaGz30me8lQjxfHV5NL4PJcnPokd1cpxOn+VZpZUYaTF6SRxFRuCJ5GTPVt1tJdV24Cb+Q==
X-Received: by 2002:a05:620a:2403:b0:79f:4c8:d873 with SMTP id af79cd13be357-7a193b42df6mr137027985a.28.1721311344709;
        Thu, 18 Jul 2024 07:02:24 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:6720::7a9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1938f73ddsm27753485a.63.2024.07.18.07.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 07:02:24 -0700 (PDT)
Message-ID: <b454d93d607047c63663b3f003b3d3c23f07bac7.camel@ndufresne.ca>
Subject: Re: [PATCH v4 1/2] media: videodev2: Add flags to unconditionnaly
 enumerate pixels formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Jacopo Mondi
	 <jacopo.mondi@ideasonboard.com>
Cc: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
 hverkuil-cisco@xs4all.nl,  linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-rockchip@lists.infradead.org,
 kernel@collabora.com
Date: Thu, 18 Jul 2024 10:02:23 -0400
In-Reply-To: <7113029e2e192d43523a1ea5dae041fb53ae5948.camel@ndufresne.ca>
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
	 <20240717131430.159727-2-benjamin.gaignard@collabora.com>
	 <2kbxr3hkjbcnaqescxmlcerziixg72icqpug6wa25eeggy2pnj@vqmxe4ojcwml>
	 <dfc292f8-0014-4bf4-9429-31f729a176cd@collabora.com>
	 <ok2a4ubzka6rhzyj2c5op73ij7pw35g6e75whc2jjget62fatx@zka2ewyt3kfv>
	 <c8358d79bd51a9bfa5116b33ae5e7766b95d344d.camel@ndufresne.ca>
	 <1faa7098-b108-480e-ae4b-ed25e0020e51@collabora.com>
	 <7113029e2e192d43523a1ea5dae041fb53ae5948.camel@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le jeudi 18 juillet 2024 =C3=A0 09:56 -0400, Nicolas Dufresne a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> Le jeudi 18 juillet 2024 =C3=A0 09:04 +0200, Benjamin Gaignard a =C3=A9cr=
it=C2=A0:
> > Le 17/07/2024 =C3=A0 19:50, Nicolas Dufresne a =C3=A9crit=C2=A0:
> > >=20
>=20
> [...]
>=20
> > > > > > > @@ -1569,6 +1569,7 @@ static int v4l_enum_fmt(const struct v4=
l2_ioctl_ops *ops,
> > > > > > >    	int ret =3D check_fmt(file, p->type);
> > > > > > >    	u32 mbus_code;
> > > > > > >    	u32 cap_mask;
> > > > > > > +	u32 flags;
> > > > > > >=20
> > > > > > >    	if (ret)
> > > > > > >    		return ret;
> > > > > > > @@ -1578,8 +1579,10 @@ static int v4l_enum_fmt(const struct v=
4l2_ioctl_ops *ops,
> > > > > > >    		p->mbus_code =3D 0;
> > > > > > >=20
> > > > > > >    	mbus_code =3D p->mbus_code;
> > > > > > > +	flags =3D p->flags & V4L2_FMT_FLAG_ENUM_ALL_FORMATS;
> > > > > > >    	memset_after(p, 0, type);
> > > > > > >    	p->mbus_code =3D mbus_code;
> > > > > > > +	p->flags =3D flags;
> > > > > > Won't this set V4L2_FMT_FLAG_ENUM_ALL_FORMATS (if present) in t=
he
> > > > > > flags returned to userspace ? Shouldn't be drivers to set
> > > > > > V4L2_FMT_FLAG_ALL_FORMATS instead ?
> > > > > memset_after zeroed flags field so we need this to send V4L2_FMT_=
FLAG_ENUM_ALL_FORMATS
> > > > > flag to drivers. Return it to userspace is a side effect but I do=
n't that is problem
> > > > > since it set it anyway.
> > > > >=20
> > > > Ok, if the expectation is that the flag is preserved through the io=
ctl
> > > > call, this is fine with me
> > > I might be missing something other similar features are explicitly ad=
vertised by
> > > drivers. This way, the generic layer can keep or clear the flag based=
 of if its
> > > supported. The fact the flag persist the ioctl() or not endup having =
a useful
> > > semantic.
> > >=20
> > > Could we do the same?
> >=20
> > It is the only flag set by userspace when calling the ioctl(), all othe=
rs
> > are set by the drivers.
> > I can clean it from the ioctl() structure after driver call but that wo=
n't change anything.
>=20
> This does not answer my question. In other similar feature, we have an
> **internal** flag set by drivers to tell the framework that such feature =
is
> abled. Using that, the framework can keep or remove that flag based on if=
 its
> supported or not. This way, userspace have a clue if the driver do have t=
his
> support or if the returned result (in that case) is just a subset matchin=
g the
> configuration. We don't seem to have done the same level of effort here.

For the reference, you actually use that semantic in GStreamer implementati=
on,
but the kernel code seems broken.

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7078/di=
ffs#eb90d5495df2f085f163996014c748a36f143f76_516_527

>=20
> Nicolas
>=20
> >=20
> > >=20
> > > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > >=20
> > > > > > >    	switch (p->type) {
> > > > > > >    	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> > > > > > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/li=
nux/videodev2.h
> > > > > > > index fe6b67e83751..b6a5da79ba21 100644
> > > > > > > --- a/include/uapi/linux/videodev2.h
> > > > > > > +++ b/include/uapi/linux/videodev2.h
> > > > > > > @@ -886,6 +886,8 @@ struct v4l2_fmtdesc {
> > > > > > >    #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR=
_ENC
> > > > > > >    #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
> > > > > > >    #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
> > > > > > > +#define V4L2_FMT_FLAG_ENUM_ALL_FORMATS		0x0400
> > > > > > > +#define V4L2_FMT_FLAG_ALL_FORMATS		0x0800
> > > > > > >=20
> > > > > > >    	/* Frame Size and frame rate enumeration */
> > > > > > >    /*
> > > > > > > --
> > > > > > > 2.43.0
> > > > > > >=20
> > > > > > >=20
> > > > > > _______________________________________________
> > > > > > Kernel mailing list -- kernel@mailman.collabora.com
> > > > > > To unsubscribe send an email to kernel-leave@mailman.collabora.=
com
> > > > > > This list is managed by https://mailman.collabora.com
> > >=20
> > _______________________________________________
> > Kernel mailing list -- kernel@mailman.collabora.com
> > To unsubscribe send an email to kernel-leave@mailman.collabora.com
> > This list is managed by https://mailman.collabora.com
>=20
> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com
> This list is managed by https://mailman.collabora.com


