Return-Path: <linux-media+bounces-15116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E63A934E9A
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 15:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B291F223EC
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 13:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B143B13F43A;
	Thu, 18 Jul 2024 13:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="aIyDMbHA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6A613EFF3
	for <linux-media@vger.kernel.org>; Thu, 18 Jul 2024 13:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721310977; cv=none; b=jWGYn5+ZI27JHp1Y2YPPPXwBqZJ8USuYfAAcaUxV4P/awHa6CFgnrkECxVbnhXf3cKHTNl13D5rmHfXgMQ2HSBN4Iip/fBVmt4gjiaNMpCE47QgSlYxrtAGGgiqg9St8YE4Ad0nfK6vqyrpZp0xrZ6HYb9Rnt7SdTKIvqblo2rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721310977; c=relaxed/simple;
	bh=FN9lQnWaRRboDIggzQ7mgKydoQ5EpPRR91UZWwuXo8s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=exKACilQwg8Y0AjMrMZv3V01qLascqGEOoMrcGWQmvzBGQ2wSBYQWcEOEiV56u12KtWZrKNF3Pb24zXOPYCAzw1S9rosOMmt57Q7ejAscpJ3ZikN1EmQMkln+Czd8ap1eRERyihYWlSChyQaZXj/+trCPqVRiSAuwrgyTClGlwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=aIyDMbHA; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-44f6700addcso1736771cf.2
        for <linux-media@vger.kernel.org>; Thu, 18 Jul 2024 06:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1721310974; x=1721915774; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/9PgN2CWlwkAlyMyd9I5yTG/RODQPuF8I+fsHHELrjs=;
        b=aIyDMbHAc8DDvgSgmApo/q09ppsEl2CMHhu6BXJEOPHhYaooCZrAQYEcLH7t4Cgi2p
         HcoRSxhoLbP+1HXNezk8QENTVjxnq2NUzkhJGt2TwObQiUSvOyLEU2QIN5SbbKNhgV+x
         bPxhekQIR4qOmZIi5SYD0kx+TjT8IWwMzvkWwWwvLsgqODqYWGpcpiKR6KoWitvK6C+S
         utGZ+eZb07gMwvLbrNDHyuH+njazwfpjHsdI+EOGV4AqdAJKvdg+8X0Ojuv/eu16i19x
         eThl7PuFzdAOk7KCnlwOiutydnBnEYE/VNyr1dGS4Sn3IfLS7q1injJB+8X44cjWug3U
         eUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721310974; x=1721915774;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/9PgN2CWlwkAlyMyd9I5yTG/RODQPuF8I+fsHHELrjs=;
        b=d1lDw82MYFXRtKyztQjVKqndZGVmxuKnJ85pd7o+Or13wdeTOMTWNqbFxLg/omnjiG
         7uTZvt1BkmYHMoCEqIjeCRNF5SAiuH6mQqE2SQ6+YyzluAHNBUWyxAGeCWJ+BE/PY5h9
         0Te69SvecYb0VMOTo2qx6spui23lej8jO2L3tUpU5lqCEVc9FA8nWxapdivCl0rpS+/V
         uLH9kE2Az+slJ3ItPLScpfs2W4I+4zwliU55F3oi5Vkqt2tpCBn2/0evpdw/7QPFp8me
         tx9LnoOFa8auvgeAuotTnbPUVsJmNU2KUSea0F5QvJSB4ZjhZP1zV73HNnB0ZXpITMY5
         FlZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPNgC/mNkrd3jgcVth1QKMhkCn/eah93v3ETmsG1VR/LyCl8ZClkaGM01imubt9s0JtRfGaf2YHQz8EYMIp3rUkDT7Ib03zjArjpE=
X-Gm-Message-State: AOJu0YzQvUMdtrWn/fu6fZMV3UgIciFBwjfVW3PFxVF0YEM7gLpIv7DO
	nOsJSfsfaZGqqB1UACr6kWgwmXVFuXKbItbrDvSZGMMHC+trS3egcFVg7pNUpvs=
X-Google-Smtp-Source: AGHT+IH5MTKib9696k0vgo2HoX8hTJTXldqZABkNwBgCpERpaxYd5V6iPU264qEzfgN6WERm7Mn/6g==
X-Received: by 2002:ac8:7d95:0:b0:447:ede4:c6fe with SMTP id d75a77b69052e-44f9696658emr11297251cf.9.1721310974303;
        Thu, 18 Jul 2024 06:56:14 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:6720::7a9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f96acd157sm2521331cf.95.2024.07.18.06.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:56:13 -0700 (PDT)
Message-ID: <7113029e2e192d43523a1ea5dae041fb53ae5948.camel@ndufresne.ca>
Subject: Re: [PATCH v4 1/2] media: videodev2: Add flags to unconditionnaly
 enumerate pixels formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Jacopo Mondi
	 <jacopo.mondi@ideasonboard.com>
Cc: mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
 hverkuil-cisco@xs4all.nl,  linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-rockchip@lists.infradead.org,
 kernel@collabora.com
Date: Thu, 18 Jul 2024 09:56:12 -0400
In-Reply-To: <1faa7098-b108-480e-ae4b-ed25e0020e51@collabora.com>
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
	 <20240717131430.159727-2-benjamin.gaignard@collabora.com>
	 <2kbxr3hkjbcnaqescxmlcerziixg72icqpug6wa25eeggy2pnj@vqmxe4ojcwml>
	 <dfc292f8-0014-4bf4-9429-31f729a176cd@collabora.com>
	 <ok2a4ubzka6rhzyj2c5op73ij7pw35g6e75whc2jjget62fatx@zka2ewyt3kfv>
	 <c8358d79bd51a9bfa5116b33ae5e7766b95d344d.camel@ndufresne.ca>
	 <1faa7098-b108-480e-ae4b-ed25e0020e51@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le jeudi 18 juillet 2024 =C3=A0 09:04 +0200, Benjamin Gaignard a =C3=A9crit=
=C2=A0:
> Le 17/07/2024 =C3=A0 19:50, Nicolas Dufresne a =C3=A9crit=C2=A0:
> >=20

[...]

> > > > > > @@ -1569,6 +1569,7 @@ static int v4l_enum_fmt(const struct v4l2=
_ioctl_ops *ops,
> > > > > >    	int ret =3D check_fmt(file, p->type);
> > > > > >    	u32 mbus_code;
> > > > > >    	u32 cap_mask;
> > > > > > +	u32 flags;
> > > > > >=20
> > > > > >    	if (ret)
> > > > > >    		return ret;
> > > > > > @@ -1578,8 +1579,10 @@ static int v4l_enum_fmt(const struct v4l=
2_ioctl_ops *ops,
> > > > > >    		p->mbus_code =3D 0;
> > > > > >=20
> > > > > >    	mbus_code =3D p->mbus_code;
> > > > > > +	flags =3D p->flags & V4L2_FMT_FLAG_ENUM_ALL_FORMATS;
> > > > > >    	memset_after(p, 0, type);
> > > > > >    	p->mbus_code =3D mbus_code;
> > > > > > +	p->flags =3D flags;
> > > > > Won't this set V4L2_FMT_FLAG_ENUM_ALL_FORMATS (if present) in the
> > > > > flags returned to userspace ? Shouldn't be drivers to set
> > > > > V4L2_FMT_FLAG_ALL_FORMATS instead ?
> > > > memset_after zeroed flags field so we need this to send V4L2_FMT_FL=
AG_ENUM_ALL_FORMATS
> > > > flag to drivers. Return it to userspace is a side effect but I don'=
t that is problem
> > > > since it set it anyway.
> > > >=20
> > > Ok, if the expectation is that the flag is preserved through the ioct=
l
> > > call, this is fine with me
> > I might be missing something other similar features are explicitly adve=
rtised by
> > drivers. This way, the generic layer can keep or clear the flag based o=
f if its
> > supported. The fact the flag persist the ioctl() or not endup having a =
useful
> > semantic.
> >=20
> > Could we do the same?
>=20
> It is the only flag set by userspace when calling the ioctl(), all others
> are set by the drivers.
> I can clean it from the ioctl() structure after driver call but that won'=
t change anything.

This does not answer my question. In other similar feature, we have an
**internal** flag set by drivers to tell the framework that such feature is
abled. Using that, the framework can keep or remove that flag based on if i=
ts
supported or not. This way, userspace have a clue if the driver do have thi=
s
support or if the returned result (in that case) is just a subset matching =
the
configuration. We don't seem to have done the same level of effort here.

Nicolas

>=20
> >=20
> > > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > >=20
> > > > > >    	switch (p->type) {
> > > > > >    	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> > > > > > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linu=
x/videodev2.h
> > > > > > index fe6b67e83751..b6a5da79ba21 100644
> > > > > > --- a/include/uapi/linux/videodev2.h
> > > > > > +++ b/include/uapi/linux/videodev2.h
> > > > > > @@ -886,6 +886,8 @@ struct v4l2_fmtdesc {
> > > > > >    #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_E=
NC
> > > > > >    #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
> > > > > >    #define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
> > > > > > +#define V4L2_FMT_FLAG_ENUM_ALL_FORMATS		0x0400
> > > > > > +#define V4L2_FMT_FLAG_ALL_FORMATS		0x0800
> > > > > >=20
> > > > > >    	/* Frame Size and frame rate enumeration */
> > > > > >    /*
> > > > > > --
> > > > > > 2.43.0
> > > > > >=20
> > > > > >=20
> > > > > _______________________________________________
> > > > > Kernel mailing list -- kernel@mailman.collabora.com
> > > > > To unsubscribe send an email to kernel-leave@mailman.collabora.co=
m
> > > > > This list is managed by https://mailman.collabora.com
> >=20
> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com
> This list is managed by https://mailman.collabora.com


