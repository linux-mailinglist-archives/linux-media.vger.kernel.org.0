Return-Path: <linux-media+bounces-29273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7705FA79753
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 23:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D99D3B1FDF
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 21:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935311F3BB7;
	Wed,  2 Apr 2025 21:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3NRs+Gf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EF742A87;
	Wed,  2 Apr 2025 21:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743628298; cv=none; b=XitrDHZhSZZmJvRsdqDfc+e4hIAC+QOXeGMpNqDzqfuOvkT3HiyP5gYWgKBh3g15kELp29Fl/PISBGGV+yvoZh1xUoFTsR9djh5wIa4tV3PjGtAV4rPU4UI36zmwBb4fwZgLDIPMuX+qiqtpm4OcBzA8Ax3OrAp+WDbi6czhczc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743628298; c=relaxed/simple;
	bh=wRtmmgiKD80kGea0JG6gTNwVOIVkumQweXA22L9MO60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KFuKT4ZbMWc8njHJUp/LUCOWCpMo9JjHGnKKKwSSZA2H57EZ1jIVA9D8XEYx89NdxHsgpoeR+7A6WZWx0jo5NvZIkI2lgMbTR/BGRkUOAUVmF3XUaTWqDF9e4clSyxYxtY+q/feg38nzwk02+eSwoEaUunW4Hj9Oyy1R2ipnwOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3NRs+Gf; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so40157066b.1;
        Wed, 02 Apr 2025 14:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743628295; x=1744233095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRtmmgiKD80kGea0JG6gTNwVOIVkumQweXA22L9MO60=;
        b=l3NRs+GfpOKiZGsEN5SmhcynvX1JdPvmuUlX8Zx9pYJd5qT4ucLkyxDmq5pT/O4MSE
         kVRUM2v2dPICrCbQKAcsUKoTXdS/mm2elsEwSwiis4U9UBjbTy5pfgHRcSRtPT8b6+wt
         KDCwG2l7fuFUdWUGYzsgZF5aSFFStO+1McbcPsl34jUAEL44mjtgVtOQ6iiv/Id/I0Ry
         VMcg024AHTbFZAA9BReOHRU4ixbxdNnA4Q1GOf15VcJGAyQk29ILBSObcDTJCyLx+saY
         l+ANHVYaYbmfDad85+kgVN7tUqmbBe1qp/ozD0VZc6VsxhPQo90EhxBlBqEE3PdwDqEt
         mhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743628295; x=1744233095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRtmmgiKD80kGea0JG6gTNwVOIVkumQweXA22L9MO60=;
        b=ni5uqC9EuAcYmNchdF6fbuKzQpflUMm89ii09FLeDQrQK7S1mm6CNroC7aNi1rD6Cv
         nhzxM3p6jN8PbUOONRRwpiEz143wCbGsAJ/xCfFn78TuWeA/7fbH2rFikmvFrmul0AoX
         QjoKc5Tk3fMI1cpCuz0Q3I7hPdM0Kre/x8hIoUwpv1ktIjoMDnmVjztPwCf6w00DO4M7
         KMOWYglCHXNSv4aEC4LkqPKEs5I9dJnnarB6SZUEDwVooY3ZqekSJ/1mepWIQB0wSfvt
         QIoNcLwGhti3Ko8oZ6WRha8fmrkjfCDvC4Y27L99dwhfbwKvEOuv1v4WO4KAenhZ7cVQ
         /EWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhr9dWumEOnjKaYjJkNbAM/QjKqaPeOhkcuXEz51PxXs7cl102xsJD0JUxJcG3LuDrinqmjWhi/WYAuiMnmKTwr0HE8Q==@vger.kernel.org, AJvYcCWLIIDfYptvOB3DItPullN4wseoP966mtY2lLcOHdXH+evrPkJucuFJPWtagyMpRwgKF/S7TCWRDEJc3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3YJqnoq/Qw1ZwuR1aqTAjJYRZQSsQuti1YabJkhbfRZnZT0e9
	j6JpZ1qVR0aF44RJDcRmpTIEZuT4e8TGzhT0xvov4D/ZRM/d+TnskPcgS+gwqwP+M+6DtZm6s8z
	LaFKma0XUvZlmBLp1FmxTUhdSAfg=
X-Gm-Gg: ASbGncvndzYSywqcJp/SYgmLeT2WEDYLjC/zOcLAXRjJ+henGtD/7aD0e5lu1fbPVVX
	g3A9W4vPgUeX0hPXCW4WHyiJV0/p8K30RJC3Zsdfeo467M/v2A5YT2dx5M+HsN9n/iJt/6xdeHL
	EI5bUVckdhjxg6j3U01vf7pztwiw==
X-Google-Smtp-Source: AGHT+IFWO9EURUGJQuX1E706FTE/hjkV8LQ04Lux7WfQFXqzUZeFMamUTpdlc+A27jHdMFFa2ImfUjL+SJG91Z4zQKs=
X-Received: by 2002:a17:907:97c4:b0:ac7:18c9:2975 with SMTP id
 a640c23a62f3a-ac7a1abde58mr300741866b.48.1743628294676; Wed, 02 Apr 2025
 14:11:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402202510.432888-1-hdegoede@redhat.com> <20250402202510.432888-5-hdegoede@redhat.com>
In-Reply-To: <20250402202510.432888-5-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Apr 2025 00:10:57 +0300
X-Gm-Features: AQ5f1JrCXCxF2X8KJtUCUivo-3Ikc9kBGuALgmjqlpYuZmPmTzQ_CECMKsMWpM4
Message-ID: <CAHp75VcAddV-mxXxkcvirDS=4vVGLrQWzbufUUgmJ9yKvG_AsQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] platform/x86: int3472: Rework AVDD second sensor
 quirk handling
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>, 
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 11:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Rework the discrete quirk handling to use a quirks struct which is
> pointed to by a dmi_system_id table, rather then having a dmi_system_id
> table per type of quirk.
>
> This is a preparation patch for adding support for multiple regulators,
> where not all regulators might be shared between sensors.

This might slow down the lookup, but it doesn't look like any critical
path. And I like having a separate file for DMI quirks.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

