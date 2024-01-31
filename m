Return-Path: <linux-media+bounces-4530-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C897B844AC2
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 23:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C373B2A22D
	for <lists+linux-media@lfdr.de>; Wed, 31 Jan 2024 22:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D03839FDE;
	Wed, 31 Jan 2024 22:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2KAbxMhi"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA15C39ADB
	for <linux-media@vger.kernel.org>; Wed, 31 Jan 2024 22:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706738850; cv=none; b=VjdoXOxfJ3sTq2jZmZNrNgyAJevf5MDLkYPQLNpiCMERRRD8B3LXZNmFE7wdiGQMLg8sqLl16aIJtrs7/Z1mM892d49F822RHCuwNGE6QC64w5cN8Gbnph33GcxdyxxK5GpddKN2HqDdDPermuY9VMPxrLek+jsEFXsPLTR2nyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706738850; c=relaxed/simple;
	bh=VlPA60Xupv16HLQaPENbqE0VQHb0Fu/2ZrNLcfw7Ick=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mb5Wt/Hbav9FFk0OtW2kGwYAomzqiv1fEpyP8b/Gme3UjDjnwbFsyh+eMzIgNHTOQpXmBW2bSMibI2SKRmdGa+U2rw/5tRBR6Cllv6KTpd7fxMdxe5q1CZ8pI3aFxsLpvMM5SqS2B+am91x+gsQzsshMmGCLk6HwGEHB0tmMcg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2KAbxMhi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40f0218476aso4545e9.1
        for <linux-media@vger.kernel.org>; Wed, 31 Jan 2024 14:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706738847; x=1707343647; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxGRQtTivmWoKuFadnWNImbg21dR/diu+Neco1gJfcY=;
        b=2KAbxMhi44dxHdA4AtxjUGAfWQbYCTtI0+v+GpXmSEqqQOBg3SiyzQd4/zkc8nRO0n
         swTh4GZdM476AP3OYEEUhRsLQKAFY9N509b1/MNT6pMDdYTJWk4gedP40XZAYpqFjlLI
         GUNsQYiFOS5YJCexCPyMV0zA1O4eOrweGxYKiG78pbPlh8kxR98vLUrNOW4XClIiEkjQ
         UAuUcQMvQyovbvG3IGYZxfIrgvohhUqOuYcAv8Id9FJ89RJbsb8/vF7kbk09gKNUp+bi
         EAsCRDIlh9AhP3BF5p5EKYh81vw3QOmaNeIx4QqIYQF/6u67j8VSKFxq81ZU1zXAC2aw
         Vwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706738847; x=1707343647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxGRQtTivmWoKuFadnWNImbg21dR/diu+Neco1gJfcY=;
        b=cO+NBmYMaLCqistOtYQnGDot9ZG5lWjWKg4IzGg4kDyMB9Jjwp9ZEZlGoANZidvcV7
         ddZpfiL7zSQUm9wT1JovUrMHhMYIpSkzIQzblN3YUr6j0ydleXsSquTXFKNOrLQqHqEF
         /6AJSfaLTHqFgOaCswr15PwwyZGNNMjf08SItlV2CLmaYNCWo6rERnhn8G4eA0N61D+f
         Ho/UqhgKGX3Y2Nj43sJQuHpo0fT0+iBYRQEDB/vFywWiBczg2VXZMp27e/P5lsfOKXFt
         fGHYx63YAdeSWGKhUjJMEKGeIrNQ4SvCUyco1m8SFhvq/P6mwu7uP9/vLTGdeFuRMvFy
         aIAA==
X-Gm-Message-State: AOJu0YwH4pBG0CZn+/NrYZVcC9e9dS/3XOcgAot+xlnx2VOmtJiabFy6
	80hCv5IxkQvk3jZHqB8D8ScPmqMeBwEt2XP1VTmytVYRU+qmWOgoWg9HAWbSDBSILEXPRgn0MAI
	xAM9lryZCrPdW6guLHBK8V1CaujEFtXLZ6Ow=
X-Google-Smtp-Source: AGHT+IE/2Dxf4agbwoKTbMQd8Mnstjn4gRLtOYMhgr/arfVgtxcTfa+Kk1PDbnEzzrNLU0B/ZV7z7fa+Npsy3Ek/Uvk=
X-Received: by 2002:a05:600c:5026:b0:40e:e7ce:da68 with SMTP id
 n38-20020a05600c502600b0040ee7ceda68mr66122wmr.0.1706738846818; Wed, 31 Jan
 2024 14:07:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240112092014.23999-1-yong.wu@mediatek.com> <20240112092014.23999-4-yong.wu@mediatek.com>
 <CANDhNCrxpeqEhJD0xJzu3vm8a4jMXD2v+_dbDNvaKhLsLB5-4g@mail.gmail.com>
 <CA+ddPcNdniUTpE_pJb-fL7+MHNSUZTkQojL48iqvW9JPr-Tc-g@mail.gmail.com>
 <CANDhNCqieBaH-Wi=vy3NSKTpwHcWef6qMOFi-7sgdGiDW7JtwA@mail.gmail.com>
 <CA+ddPcP9bgApNw_Nu7bxcV-oK_s3Bq1i5qun+vNSuRUO9tPEkA@mail.gmail.com>
 <CANDhNCrGxhHJLA2ct-iqemLAsQRt3C8m5=xAD3_dDdKH6Njrdg@mail.gmail.com> <20240131141523.yh74hsddtuooqfgi@pop-os.localdomain>
In-Reply-To: <20240131141523.yh74hsddtuooqfgi@pop-os.localdomain>
From: John Stultz <jstultz@google.com>
Date: Wed, 31 Jan 2024 14:07:13 -0800
Message-ID: <CANDhNCqKPmo-RUd6RRRS2=ZJHqyy40G9HE=6_cAyop1CN2xOgw@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] dma-buf: heaps: restricted_heap: Add private heap ops
To: Joakim Bech <joakim.bech@linaro.org>
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, Yong Wu <yong.wu@mediatek.com>, 
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, christian.koenig@amd.com, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	tjmercier@google.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Robin Murphy <robin.murphy@arm.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>, 
	Pavel Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>, 
	jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com, 
	youlin.pei@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 6:15=E2=80=AFAM Joakim Bech <joakim.bech@linaro.org=
> wrote:
> On Fri, Jan 12, 2024 at 05:23:07PM -0800, John Stultz wrote:
> > So we need some clarity in what "restricted" really means.  For
> > instance, it being not cpu mappable vs other potential variations like
> > being cpu mappable, but not cpu accessible.  Or not cpu mappable, but
> > only mappable between a set of 3 devices (Which 3 devices?! How can we
> > tell?).
> >
> Can we flip things around? I.e., instead of saying which devices are
> allowed to use the restricted buffer, can we instead say where it's not
> allowed to be used? My view has been that by default the contents of the
> types of buffers where talking about here is only accessible to things
> running on the secure side, i.e, typically S-EL3, S-EL1 and a specific
> Trusted Application running in S-EL0. I guess that serves as some kind
> of baseline.

? This seems like you're suggesting enumerating badness? I'm not sure
I understand the benefit of that.

> From there, things turns to a more dynamic nature, where firewalls etc,
> can be configured to give access to various IPs, blocks and runtimes.
>
> I understand that it's nice to be able to know all this from the Linux
> kernel point of view, but does it have to be aware of this? What's the
> major drawback if Linux doesn't know about it?

Indeed, it doesn't necessarily. The idea with DMABUF heaps is it
provides a name to abstract/wrap a type of constraint. So you can then
allocate buffers that satisfy that constraint.

Admittedly the downside with DMABUF heaps is that it has a bit of a
gap in the abstraction in that we don't have a mapping of device
constraints, so in Android gralloc provides a device specific
usage/pipeline -> heap mapping.
(Note: This I don't think is very problematic - I often use the
example of fstab as device-specific config everyone is comfortable
with - but I know folks would like to have something more generic)

I believe Christian has previously proposed to have the devices
provide something like symlinks from their sysfs  nodes to the heaps
the device supports, which is an interesting idea to mostly close that
issue. Applications could then scan the devices in a pipeline and find
the type they all support, and the specific names wouldn't matter.

However, I'd expect the same hardware pipeline might support both
restricted and unrestricted playback, so there would need to be some
way to differentiate for the use case, so I'm not sure you can get
away from some heap name to functionality mapping.

My main concern with this patch series is that it seems to want to
bundle all the different types of "restricted" buffers that might be
possible under a single "restricted" heap name.

Since we likely have devices with different security domains, thus
different types of restrictions. So we may need to be able to
differentiate between "secure video playback" uses and "protected
device firmware" uses on the same machine. Thus, I'm not sure it's a
good idea to bundle all of these under the same heap name.

thanks
-john

