Return-Path: <linux-media+bounces-30229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A98A89B75
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 13:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 782B0189E0BD
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 11:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3840328DEFA;
	Tue, 15 Apr 2025 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="KRmVML3s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E207B284680
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715290; cv=none; b=m21tVDLpGoTf5CGVWG+bZNTfnAEqZs8ZzaVSh5Jk6Sh1XgS7FEpZBzrfwxnhh2bAHuwzZmXh4PyokGKdtuYaVhL+0ikmwJ8VfMD5GYqjaFM0hSmdN6Rj8JOJHONWCSFqOsP3T20gkJeNfnfY3wB9u+nZQdruNoimrUIWNxHJGSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715290; c=relaxed/simple;
	bh=sXyXU+UZTcrxkOb/c0qw2SFIN9UPdBx4v8Ai0f7UcAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HuAba35895SUUwuZDogj4pWmSWW8ResSzyq+ewK05VvauUGVsLOVq1DY82wPXrfsvl3Qeg6c3pFrya727CkQMrIn0nYiQXYpbbDgujBHUeP6pJbbt4IcUxkSdhDSqXw6MnqcOK2tShBcTTY28bUWKmFY0sf572Ue8zFHcyHQmy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=KRmVML3s; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4774d68c670so75519011cf.0
        for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 04:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1744715287; x=1745320087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAG9YdmRy2spdhrSdR+PSo3J7c8KUkAozpqOr7XPBVA=;
        b=KRmVML3ssIjOdhfyKbEnzCVfzq9Ondr4Bll52/G0JvOnwrDN5aqJ918zgLEy4RtC9X
         Awzmy0B1qzNDcKKGU12bFeMbIyiiQ5IzWZ1D3qXSI3Ca9FdWVmzQ4x1C9AkfzHT0CH3C
         IpDypQfQRptsZsoqfPTcXtXgGpp+5PoG8wTScHfW0OF5BSb0ZbI+yptXkMPcK/dkTAnB
         9sHpLLbHRpLSl4llPPqIWe0s0cT208HkFnQc7bezF3MNYdZw/tuWotcdWfLEma0VRf3d
         dOOwr9KvPsZxpDCwruJnI3mYEnJK8Araq3KxWYLwjJUa1F+yVBGmAVHYPZJYketHNQdu
         HGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744715287; x=1745320087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAG9YdmRy2spdhrSdR+PSo3J7c8KUkAozpqOr7XPBVA=;
        b=Dk/p/Zwdwz+Pt7SeW4It5SiNdjIaEfQHsc19IhZOowx2plpxlMzztQ002FL8RQ18b5
         kgD6GPe/hn/gPXtqogDpK+W8nHq1Kvqs8I9MSN0bXhitN14bcfwpn+xDafE+Ovyg/rkw
         JOkrHq1Sz5BVolceyj2EglC21RIhQkUynJ4oyaLYwb7h6cmftlO9uDLzwdFU7R28FcNL
         JqU0XQKdm97XBriuvQg0+ke1Az+PkF7BmXAdPVdQf8WntUt+2Xntg+B9WOsFCMvqAog+
         huHsEC/dP0R2fQkXlKgqiAwHA/vk+e9oNoF/pNTLagHceD0J441WeAWhRh6ObT7eFZEI
         VsAA==
X-Forwarded-Encrypted: i=1; AJvYcCUUBA+CaUCbj8BQsljK4njMQrIzFI9LOwqNjIqPVFrSIBCT40L4MHLS4C5HIRwBelCJmL4C9UMVoLhNCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnAGsFaGD9vRqTWrfGE1VWSc4/RJa8WsDJq6iRv9bCNew0pOeh
	GpVM7IDQiIgtTN+F2HzmDnG1Sdd4e0QmNziA3oK141Ku+zXoqO6t0kGb6yxCTV3uZKD8IINQfu/
	39wQ9+XfoiZnuictyDD2z+Cml5lEaBQFBIn6owA==
X-Gm-Gg: ASbGnctm14Ov/b8ObxWDBWWjCDaNdZ2iSAr+l3blAeNxTsHrHAW3R511ydWFWceSD3D
	ydNW2q7dp2EaEnmwXyy7/Ip7MBwjpzsSRRjz86nPVSaPplXRGdlZha4T67DMZusx757qW7ie0ky
	p01eQnlBpRNzvRwrnSR2Y=
X-Google-Smtp-Source: AGHT+IFh1vXSx5Rq5c8vZLzOiN4zABX47o5Z4Ug0aK3S4poCk694vjoyQA4QCi5vMCDm+1X/EKPDvHIQ3dGkD/YgQP0=
X-Received: by 2002:a05:622a:652:b0:476:a967:b247 with SMTP id
 d75a77b69052e-479775e95a4mr196800161cf.47.1744715287731; Tue, 15 Apr 2025
 04:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411150357.3308921-1-adrian.larumbe@collabora.com> <20250411150357.3308921-3-adrian.larumbe@collabora.com>
In-Reply-To: <20250411150357.3308921-3-adrian.larumbe@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 15 Apr 2025 12:07:56 +0100
X-Gm-Features: ATxdqUFMfgk3LCHq6b_tQhtbniGbjNbES2JG54tU6ZFtUvvi9zS7dF0xh4LyD-U
Message-ID: <CAPj87rNiKyXTO-+2F71ZKU9rTjYfeLKvxxd2bGwZo7tZ=3tjvg@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] drm/panthor: Add driver IOCTL for setting BO labels
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: "To : Boris Brezillon" <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 11 Apr 2025 at 16:05, Adri=C3=A1n Larumbe
<adrian.larumbe@collabora.com> wrote:
> +#define PANTHOR_BO_LABEL_MAXLEN        PAGE_SIZE

PAGE_SIZE can change between kernel builds with a config setting.

If the thinking here is '4KiB is big enough' (which I agree with),
then just define it to 4096.

Cheers,
Daniel

