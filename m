Return-Path: <linux-media+bounces-42630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91656B59D85
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 18:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A2D37B37CE
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 16:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8D8261B6E;
	Tue, 16 Sep 2025 16:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKfx5b2C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48774346A1A
	for <linux-media@vger.kernel.org>; Tue, 16 Sep 2025 16:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758039907; cv=none; b=pnD6LdXhJNyyGJUDrssqi536Wpd5EnPl967zdaEsOB+QCGESfF4kDo4xohMOzbBrv08gbVu8Qq/zeyYOUvd0N5OyZZBAFSyKjwIz0v0R6+20q6ri8GGnZs9j3n7uMzdTtRZuMXJVvA9DPOE71UPzw8zsVWwFdIhuWRJioXt5/sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758039907; c=relaxed/simple;
	bh=4bZfUcu3hp/JB4J0y/5p9andv/NKPL6V7hMbzL5vopg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBmvL2EPk3TRqnCp3wSBW0zx/fGJPpjiz2RU+KA8lcJlqLsPAqQYpn2JgTJG9tFxcD/Bb+0HXvItmawrKDgLDBtdqD6HoiJ9PBvMPHSvwbx+D3X/DKSMTCvsMudp1QpXwtnh1DKou6D8tfJ0t0SpWTDNOL8B9IS9j/MRTarfyJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKfx5b2C; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso57219595e9.1
        for <linux-media@vger.kernel.org>; Tue, 16 Sep 2025 09:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758039904; x=1758644704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DU6pi+jQiHmP3RrytVdY83shq/RxcYi5dWlcWv2Gn9U=;
        b=PKfx5b2Cr8wbMLdOGmQAVDpmUwQqc2ALiO9uql+bNly8gmsyRonj5IF1PBcUtSf4XO
         SZmX+3Q1qe7E61CXabv8n59ncUjfQ+kisE+5MMBo8Zne/Cw/mTB29ydqq4Jkx9MQDvQJ
         XdONhkbOaa95HJbmgAAa9pDEPhJbZb6uzttBdph6yFIvi79ruf7yvHlPGecrf4cOjTgF
         gYrvMF/osBn0jHtVzHwR2mCzWoJEC2Q2eGttLIINhsjzg59JkGPbiDWIyAJG1Yc1rtkF
         IXnIUbccneyvl9UiTebHvztkWsAiZZV8XQJvpZZ6MYZM6DWhqqDQVFybD5GFCDuQm1C/
         7dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758039904; x=1758644704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DU6pi+jQiHmP3RrytVdY83shq/RxcYi5dWlcWv2Gn9U=;
        b=PbuqH75+53uR0sxA4m2ZAtnKYCSLtQUBK7iTH1JWDlzdIM1EA/ls3UvFWqtUYymDmd
         rpZVarpDFOjve3Aecy7U7pJ+EuXrsEGkKeQXrX6RBGhM/80C1wei9Fe47hkA9ffYjUHY
         BApDk/BVeCq719dATh0+YkBAzxcXLhPa6W3eBo0HQVseR+xAUlsmHf+Rnn5f/vOicMaw
         L/ZL+STQW3H7xeQ5vEo/vUxLEpxMh8BG11ZkUA5SY97OMFmEhb4NtaS9oIU01FNP54H9
         gXaHDo25+hEwmd8FUxmfpJVMDXttZaLTIrpLv5uqfX8qL8cp0d0ZOOCqxF3N7VrvtrnL
         96BA==
X-Forwarded-Encrypted: i=1; AJvYcCVQci3O1ArRt6YUfn5V15p9q8ks1I7/2/EnrviGawhZC5MQbSNqQeUpLgVaPYRIphvT0wy3SucXn7kGoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwKLJLrNXOrATPsILsIOCvcLE52axBXlTcsgCguNmO2YFZ44YR
	KW2jmgaMOIuKnvWhkLSaLbvfpdnqqSG59PJ/tiym2MHwHhSPonwG92uQJ/IywJ94WQmiH7rixUc
	kYVEWoi3CmsizbD2VrjNfArB8uQK/gLc=
X-Gm-Gg: ASbGncumx+wR1qKi+xL3KHvmnxBiYVZzxP4BQXyd3yY1IXhRfFKcNtGT4wzg78uUGz9
	NAXnCriJpRA1KJnYhNb0yyFIYTWkrlri4x22jpY5XfG/lf9WFTzN0E38UU4DsVfY9fKzhKLj4Xy
	T1FvSDxMQVuFHwoNIhHid3wiTY3E/0nBamv3I+5l6SWd/P68rNADwZvi4dchGUa/jaa2IJqtFFu
	yzTMy8P
X-Google-Smtp-Source: AGHT+IFnC+ZB8Y8EWWSgcq7DryM/idg50aJ/eE+AB8zfjBLAVoKc5lX8wjY+HH9LKTM1j4AoLgwSfNow1JOz5yHjF94=
X-Received: by 2002:a7b:c857:0:b0:45b:7be1:be1f with SMTP id
 5b1f17b1804b1-45f211f300dmr100112085e9.32.1758039903439; Tue, 16 Sep 2025
 09:25:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com> <20250906135345.241229-12-clamor95@gmail.com>
 <20250916180418.3fa270a9@booty>
In-Reply-To: <20250916180418.3fa270a9@booty>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 16 Sep 2025 19:24:52 +0300
X-Gm-Features: AS18NWDUsY2rg2kwucuKEpR6QKEKIqi67u-AOuSpm9Dlzkb81_NunB_TLA1wgsc
Message-ID: <CAPVz0n1Nvun5yBf_i3NB=kDmLfNFRjbFt1uTUW-hpLbp-h0g4w@mail.gmail.com>
Subject: Re: [PATCH v2 11/23] staging: media: tegra-video: csi: add a check to tegra_channel_get_remote_csi_subdev
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko <digetx@gmail.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 16 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 19:04 Luca=
 Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello Svyatoslav,
>
> On Sat,  6 Sep 2025 16:53:32 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > By default tegra_channel_get_remote_csi_subdev returns next device in p=
ipe
> > assuming it is CSI but in case of Tegra20 and Tegra30 it can also be VI=
P
> > or even HOST. Lets check if returned device is actually CSI by comparin=
g
> > subdevice operations.
>
> This is just for extra safety, or is there a real case where the lack
> of this check creates some issues in your use case?
>
> > --- a/drivers/staging/media/tegra-video/csi.c
> > +++ b/drivers/staging/media/tegra-video/csi.c
> > @@ -445,6 +445,22 @@ static const struct v4l2_subdev_ops tegra_csi_ops =
=3D {
> >       .pad    =3D &tegra_csi_pad_ops,
> >  };
> >
> > +struct v4l2_subdev *tegra_channel_get_remote_csi_subdev(struct tegra_v=
i_channel *chan)
> > +{
> > +     struct media_pad *pad;
> > +     struct v4l2_subdev *subdev;
> > +
> > +     pad =3D media_pad_remote_pad_first(&chan->pad);
> > +     if (!pad)
> > +             return NULL;
> > +
> > +     subdev =3D media_entity_to_v4l2_subdev(pad->entity);
> > +     if (!subdev)
> > +             return NULL;
> > +
> > +     return subdev->ops =3D=3D &tegra_csi_ops ? subdev : NULL;
> > +}
>
> I tested your series on a Tegra20 with a parallel camera, so using the
> VIP for parallel input.
>
> The added check on subdev->ops breaks probing the video device:
>
>   tegra-vi 54080000.vi: failed to setup channel controls: -19
>   tegra-vi 54080000.vi: failed to register channel 0 notifier: -19
>
> This is because tegra20_chan_capture_kthread_start() is also calling
> tegra_channel_get_remote_csi_subdev(), but when using VIP subdev->ops
> points to tegra_vip_ops, not tegra_csi_ops.
>

Your assumption is wrong. 'tegra_channel_get_remote_csi_subdev' is
designed to get next device which is expected to be CSI, NOT VIP
(obviously, Tegra210 has no VIP). It seems that VIP implementation did
not take into account that CSI even exists.  -19 errors are due to
tegra_vi_graph_notify_complete not able to get next media device in
the line. Correct approach would be to add similar helper for VIP and
check if next device is VIP. Since I have no devices with VIP support
I could not test this properly. I can add this in next iteration if
you are willing to test.

Best regards,
Svyatoslav R.

> Surely the "csi" infix in the function name here is misleading. At
> quick glance I don't see a good reason for its presence however, as the
> callers are not CSI-specific.
>
> If such quick analysis is correct, instead of this diff we should:
>  * not move the function out of vi.c
>  * rename the function toremove the "_csi" infix
>  * if a check is really needed (see comment above), maybe extend it:
>    return (subdev->ops =3D=3D &tegra_csi_ops ||
>            subdev->ops =3D=3D &tegra_vip_ops) ? subdev : NULL;
>
> Let me know your thoughts.
>
> Best regards,
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

