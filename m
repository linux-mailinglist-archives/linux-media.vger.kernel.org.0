Return-Path: <linux-media+bounces-15294-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B94A93A7A7
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 21:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49A5D1C21BBD
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2024 19:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5EC1411E0;
	Tue, 23 Jul 2024 19:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="Q7BEd20/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C9313C3F5
	for <linux-media@vger.kernel.org>; Tue, 23 Jul 2024 19:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721762596; cv=none; b=ojbByngJa1OJu4ikNn4xxRRshokR2531EdpSPYI6p3M2RUxjI0g/eWE6oGnWftnr8RBT1Oz/XlfrhBKRCjdyvFZhCMOFcQD7/pKUqFoKOZfDSGkwL9yIZK9St+pUiiAs6T7LX/sv9XUO0Ztn50pRWv9TE4YEBwgts6k95MT67E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721762596; c=relaxed/simple;
	bh=GZZ6M5b6c2VD9Xbulyz0QyywfiKlBI8D0/GnMKmf/j8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iKK8dwA+FLayx4yE1ssTUodkXw8/dW+INqZJeD79WJZE8ZshovPsYtU2KcZJdicW9IXEyYGfPt/l0z3T86cdiXyCKxw62cZzO/3EJFBZHjMBMni9PgwcwPefcPGtTFSdoL0rG6woEZGIx5U9y18z+aEULpKY+4HiYa3spYxa78U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=Q7BEd20/; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5c669a0b5d1so3530811eaf.3
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2024 12:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1721762594; x=1722367394; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GZZ6M5b6c2VD9Xbulyz0QyywfiKlBI8D0/GnMKmf/j8=;
        b=Q7BEd20/GpRmgiunAF+127CB/MJmWOK1YbiMtjhmU4+BI3bOOyEibkyS29KQn7We0D
         EzyQmPakRXCFvq2BiXeOQO6fOb7Hh84CcKtCZ3afqKC6T3+QsCic59aLv/p/JNs0mzv2
         xcutrCdwmK0//t9KY6VljjTKTgl3pWK6CPtsVrRIAZIZzObHL/dNm6P3cMioLAOvQdcF
         oCR4SwpH+MyugFL9d4ZltQrhWoY+OJfF+V93rJ5LYbd5rH0QSApNbS6/f8FQl1z5AoCE
         0W3H2DXKciPWaAcSGZE81JQZnhFChc1/qGPK0swK49h+LKFoyrZNb+ArSWeWYwBqGOoC
         ztLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721762594; x=1722367394;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GZZ6M5b6c2VD9Xbulyz0QyywfiKlBI8D0/GnMKmf/j8=;
        b=CzCaigVGHnu8FqGXqUF4hxIid7vy5g6fyZeebVMTroEjGNcMKIGXV74OZAP/S0Pyx+
         7mFZ4uRKihVGE/9qtcoeVcYJoxvikpELArmuHuMBxHXj6DufbkestS6HIqBNHmUE1ly8
         WLog3KGUZ1Bo5ntjC25t3MlmPF9RbhNyD4+2M6UFEN0Ts4IlOgKgbhXsTx1FtLJKHmnv
         X1sU4K3sw1nsXlk6SJpscGRHLhmcT/DI3/weldfAImeFFdJkDi+EUUYzK+8mhdx9+D6p
         0J4rXxlknqnS2QW4f99HxUvgFqJAePeTOZbuh0yQd+6ysfjs6G3BOenicDNpLnyHXCjF
         rQOg==
X-Gm-Message-State: AOJu0YzBnkVSVtGOE444n7Bnl4Jilc6vWzhiCIIjSe255GQmCdV+6k08
	JRkxDUabOThmWXE+5CcVR6zc4A6QieUgR3e5wELRGvOznpb4lvj39TrWxjdEg7E=
X-Google-Smtp-Source: AGHT+IF+r6n7kgWHBgsPUbFEvrRcie15YJofR/I/57SS7RljubMqzpK090DZzv67JREIFGog192J5g==
X-Received: by 2002:a4a:ee07:0:b0:5ce:adf8:291c with SMTP id 006d021491bc7-5d564f84dbfmr15403225eaf.3.1721762593696;
        Tue, 23 Jul 2024 12:23:13 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:820c::580])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b9688748e6sm32520026d6.8.2024.07.23.12.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 12:23:12 -0700 (PDT)
Message-ID: <f8d06bee1a2b71239b737b6a83e1a6734f75c36a.camel@ndufresne.ca>
Subject: Re: [PATCH v4 0/2] Enumerate all pixels formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jonas Karlman <jonas@kwiboo.se>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
  mchehab@kernel.org, ezequiel@vanguardiasur.com.ar
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Date: Tue, 23 Jul 2024 15:23:11 -0400
In-Reply-To: <d060ec49-9d48-44a3-8f90-5cee5fe29b75@kwiboo.se>
References: <20240717131430.159727-1-benjamin.gaignard@collabora.com>
	 <07f62fbb-d1eb-41c3-86a8-13a082a8374f@xs4all.nl>
	 <743e2589-c0df-461d-97d4-fafe78c334ea@collabora.com>
	 <98f5cd5c-cb9c-45ca-a7c7-a546f525c393@xs4all.nl>
	 <2eec786d-f2b6-4445-87f4-4b6d162a2d9a@collabora.com>
	 <dc423e4144e1c9ea32f6adbaa8319e38f1443896.camel@ndufresne.ca>
	 <d060ec49-9d48-44a3-8f90-5cee5fe29b75@kwiboo.se>
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

Le vendredi 19 juillet 2024 =C3=A0 23:59 +0200, Jonas Karlman a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> On 2024-07-19 17:36, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le vendredi 19 juillet 2024 =C3=A0 15:47 +0200, Benjamin Gaignard a =C3=
=A9crit=C2=A0:
> > > > What exactly is the problem you want to solve? A real-life problem,=
 not a theoretical
> > > > one :-)
> > >=20
> > > On real-life: on a board with 2 different stateless decoders being ab=
le to detect the
> > > one which can decode 10 bits bitstreams without testing all codec-dep=
endent controls.
> >=20
> > That leans toward giving an answer for the selected bitstream format th=
ough,
> > since the same driver may do 10bit HEVC without 10bit AV1.
> >=20
> > For the use case, both Chromium and GStreamer have a need to categorize=
d
> > decoders so that we avoid trying to use decoder that can't do that task=
. More
> > platforms are getting multiple decoders, and we also need to take into =
account
> > the available software decoders.
> >=20
> > Just looking at the codec specific profile is insufficient since we nee=
d two
> > conditions to be met.
> >=20
> > 1. The driver must support 10bit for the specific CODEC (for most codec=
 this is
> > profile visible)
> > 2. The produced 10bit color format must be supported by userspace
> >=20
> > In today's implementation, in order to test this, we'd need to simulate=
 a 10bit
> > header control, so that when enumerating the formats we get a list of 1=
0bit
> > (optionally 8bit too, since some decoder can downscale colors) and fina=
lly
> > verify that these pixel formats are know by userspace. This is not impo=
ssible,
> > but very tedious, this proposal we to try and make this easier.
>=20
> I have also been wondering what the use-case of this would be, and if it
> is something to consider before a FFmpeg v4l2-request hwaccel submission.
>=20
> I am guessing GStreamer may need to decide what decoder to use prior to
> bitstream parsing/decoding has started?

In GStreamer, the parsing is happening before the decoder. The parser gener=
ates
capabilities that are used during the decoder selection. Though, for perfor=
mance
reason (GStreamer is plugin based, and loading all the plugins all the time
during playback is too slow), we generate static information about these
decoders and cache the results. This information usually only contains
profile/level and some min/max resolution when available. But being able to
discard profile if (as an example) the produced 10bit pixel format is not
supported by GStreamer is something we want in the long run. Its not essent=
ial
of course.

We do that limitation in the plugger that we can't fallback after the first
bitstream as been passed to the decoder, but this could in theory be resolv=
ed
and have nothing to do with this proposal. The proposal is just to help
userspace code stay simple and relatively CODEC agnostic.

>=20
> For my re-worked FFmpeg v4l2-request hwaccel series, should hit
> ffmpeg-devel list any day now, we try to probe each video device one
> by one trying to identify if it will be capable to decode current stream
> into a known/supported capture format [1], this typically happen when
> header for first slice/frame has been parsed and is used to let driver
> select its preferred/optimal capture format. The first device where all
> test passes will be used and if none works FFmpeg video players will
> typically fallback to use software decoding.
>=20
> This type of probing may be a little bit limiting and depend too heavy
> on the M2M Stateless Video Decoder Interface "It is suggested that the
> driver chooses the preferred/optimal format for the current
> configuration.".
>=20
> Would you suggest I change how this probing is happening to make some
> more clever detection of what media+video device should be used for a
> specific stream with help of this new flag?

In general, there is only 1 or 2 decoder, so this process should be fast. I
guess if we start seeing large array or decoder (e.g. array of PCIe acceler=
ators
or similar) that could become interesting to cache the information.

I think the difference is that you have the full bitstream header available=
 at
the time you are to decide which decoder to use, I only have a abstract sum=
mary
in GStreamer. In short, you don't have to craft anything, which is nice.

Nicolas

>=20
> [1] https://github.com/Kwiboo/FFmpeg/blob/v4l2request-2024-v2/libavcodec/=
v4l2_request_probe.c#L373-L424
>=20
> Regards,
> Jonas
>=20
> >=20
> > Nicolas
> >=20
> >=20
>=20
> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com
> This list is managed by https://mailman.collabora.com


