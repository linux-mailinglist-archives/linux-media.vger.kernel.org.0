Return-Path: <linux-media+bounces-11494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2898C6BA7
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 19:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F7671F25357
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 17:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1585E4C3CD;
	Wed, 15 May 2024 17:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora-corp-partner-google-com.20230601.gappssmtp.com header.i=@collabora-corp-partner-google-com.20230601.gappssmtp.com header.b="zvaT/PaO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A802A3C489
	for <linux-media@vger.kernel.org>; Wed, 15 May 2024 17:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715795044; cv=none; b=Clnony+9lPULlJv0FbfnKVqFfOUFCzlcG/qXrG20WzeVTehKtmBQfzJZe5Gv3OAd22JTi2Ob2psYQWyuh6fYtv5i30p7fgJYhFir45J9OxfaQpFgm85gMyFWzxwMXcskZGRhq5fOkU6ZmlxnlzWNhYzvKvC2/txyJpqu0g+NX1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715795044; c=relaxed/simple;
	bh=8z5zmXb00dI33I9nYYn4QHL0CD+KmhO++F+VezLuwF8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bPXzxYKrvcgzQUdf2L+M2B58dP3TCPwYTBD8hH/5pnHHd0HBrxo8/YdabyYGNsCdqTMw6+ImQieAgWLmPlq098depHGWLgStV3/c8ppqn+4K2Ib0ekyxN56yYvtlztkW2ke6dlZHOChlOA3CyRhxjMHtCk0AbbCZ1/zrqfAqKV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=collabora.corp-partner.google.com; spf=pass smtp.mailfrom=collabora.corp-partner.google.com; dkim=pass (2048-bit key) header.d=collabora-corp-partner-google-com.20230601.gappssmtp.com header.i=@collabora-corp-partner-google-com.20230601.gappssmtp.com header.b=zvaT/PaO; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=collabora.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.corp-partner.google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-43de92e234dso64228411cf.1
        for <linux-media@vger.kernel.org>; Wed, 15 May 2024 10:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=collabora-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1715795041; x=1716399841; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E0amurYLWKaRKPa/iEdq5FcEnj0UswhFN3sKXOxoIEk=;
        b=zvaT/PaOEtTVMH9d1boly9k+wpE9gg/o8LSGFFqrGt1MFanlcYlPE37yhnE1QLhkf5
         6CPiCSMcD5H6Uiw0jDy4TkxDyLv6nvTiko0W7tB6xUcdp4OCjmZsxBTOIUme3V80cSMw
         hko1vvI5LkULOMU1398lkffkJQU8kaFMtrAWPpiqHVnV5JL+wgPU9oSDloVeHFqn/bp6
         8ZLtTQCh+Vc9kpOURnd7oOT8jhd40yNVmsWF7AyU4VgqnxoULMnHPAiwUBZRZf4dDVRN
         s98LMyuQ6/QxyxFmzvAtSptpvgXrjL1R0RtnqrwGkWT+1KSfBJLh555kp8BlcO5nApnn
         FT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715795041; x=1716399841;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E0amurYLWKaRKPa/iEdq5FcEnj0UswhFN3sKXOxoIEk=;
        b=STi1QnP8JgLQ5Op9PITO05PQFNnb6OgrJBdxffVDWxHaxeHbBsv6cmCS/BX/C+FKQQ
         qyMP1HixVimD1/vFZm6K55WWYtS2oFEuHLwSt90sziYgESSXAXYLMawe/O31hzZBe1op
         BNjp67i2c3Jjym2Rkypt9qOI/ZM8w4tY8TQm7ttZneKBsGtdG1D9ahmmj1jsiTvEHfM5
         +TNJNVsHCondnMiQ9wfCgv78lwrtklOlO2RavLZY7ySkwx53JV2yD6lwheeTdwxD2/Tj
         ddMxcJiRNmUjVSlsUodaMOsMzJ9m5J6fCSIHEw3Wnt8S9a6BIFs30HZgdIu3tsjnBwRb
         DX1w==
X-Forwarded-Encrypted: i=1; AJvYcCVhCudtVcbrg0/HuC/IOS9X6iybEaZksO2hi/ZBxnJLFV+BuWmvaSCk3XLto8L+p1yyjkW0nOVX+6EArVZIkZjxgYzFKfe7UHyI5DI=
X-Gm-Message-State: AOJu0YyKATrofNvX7fpDdRYth30cmhzxCKzQF1/zuB/Z32HmCdlu6tiE
	XGzCUjdhSLi6MWUopzAKmz8zfqojL0ViRKGNOAR2PKkY96+w7qAJurYNVX9xals=
X-Google-Smtp-Source: AGHT+IFtGcMXjpt3HsFnPe9OF16luEvqPVOtySj8IBH0wjxyNEhyn0setwNtXCb14ES3yOalUq8alQ==
X-Received: by 2002:a05:622a:1a96:b0:43e:3943:4379 with SMTP id d75a77b69052e-43e39434693mr20225301cf.19.1715795041568;
        Wed, 15 May 2024 10:44:01 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:17:5985::580])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43e3a57b396sm2575901cf.24.2024.05.15.10.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 10:44:00 -0700 (PDT)
Message-ID: <a3428b0c352c24d43a2d458d41819fbf4b6cce0f.camel@collabora.corp-partner.google.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present
 users (udev uaccess tag) ?
From: nicolas.dufresne@collabora.corp-partner.google.com
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@redhat.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>,  Hans de Goede <hdegoede@redhat.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Lennart
 Poettering <mzxreary@0pointer.de>,  Robert Mader
 <robert.mader@collabora.com>, Sebastien Bacher
 <sebastien.bacher@canonical.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,  linaro-mm-sig@lists.linaro.org, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Milan Zamazal
 <mzamazal@redhat.com>, Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Date: Wed, 15 May 2024 13:43:58 -0400
In-Reply-To: <20240514204223.GN32013@pendragon.ideasonboard.com>
References: <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
	 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
	 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
	 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
	 <20240507183613.GB20390@pendragon.ideasonboard.com>
	 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
	 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
	 <20240513-heretic-didactic-newt-1d6daf@penduick>
	 <20240513083417.GA18630@pendragon.ideasonboard.com>
	 <c4db22ad94696ed22282bf8dad15088d94ade5d6.camel@collabora.com>
	 <20240514204223.GN32013@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 14 mai 2024 =C3=A0 23:42 +0300, Laurent Pinchart a =C3=A9crit=C2=
=A0:
> > You'll hit the same limitation as we hit in GStreamer, which is that KM=
S driver
> > only offer allocation for render buffers and most of them are missing a=
llocators
> > for YUV buffers, even though they can import in these formats. (kms all=
ocators,
> > except dumb, which has other issues, are format aware).
>=20
> My experience on Arm platforms is that the KMS drivers offer allocation
> for scanout buffers, not render buffers, and mostly using the dumb
> allocator API. If the KMS device can scan out YUV natively, YUV buffer
> allocation should be supported. Am I missing something here ?

There is two APIs, Dumb is the legacy allocation API, only used by display
drivers indeed, and the API does not include a pixel format or a modifier. =
The
allocation of YUV buffer has been made through a small hack,=20

  bpp =3D number of bits per component (of luma plane if multiple planes)
  width =3D width
  height =3D height * X

Where X will vary, "3 / 2" is used for 420 subsampling, "2" for 422 and "3"=
 for
444. It is far from idea, requires deep knowledge of each formats in the
application and cannot allocate each planes seperatly.

The second is to use the driver specific allocation API. This is then abstr=
acted
by GBM. This allows allocating render buffers with notably modifiers and/or=
 use
cases. But no support for YUV formats or multi-planar formats.

Nicolas

