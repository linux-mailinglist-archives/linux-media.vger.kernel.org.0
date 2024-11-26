Return-Path: <linux-media+bounces-22116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5421D9D9D53
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 19:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 047F6B26659
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 18:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60D41DD9AB;
	Tue, 26 Nov 2024 18:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5MQObEj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ED11DB55C
	for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 18:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732645473; cv=none; b=bqXQjd3LwF6oycrzFePUPZLQW05pvZaKnFNFZH+4dnxghKVq+xUGVYjASAUrTahUyy4C0uKhmPXPuKizCuMVkBcCfmCBvXNgCqxIIyK2y3d6aRbqPjxTBpNGKrEmRbKKWD1JOqCYReWadrNgpD07xs2kLMjd7bk3+YTmpsuaDXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732645473; c=relaxed/simple;
	bh=h/oQzIdEcklvuQtqvSA4687rRkk4enfIi+rd8D5Qphc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cjJqRHkLzMUHjyK5pm53yw+C48iiSVrxCOI8Xo+LKto5So7kOV3Zm6MwL3GBXAZDFeUFV0ff6hlkbF8mvUj9We2ktpysBhZ+y+ZwwNucEjMMXfqF1ZnchPaWiW5U96DL6mmvLpHUFCR7+4/4VwHOY6XCgJSKtK+9RHnm1VyoXLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5MQObEj; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5f1d3e74ea4so1384354eaf.0
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 10:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732645471; x=1733250271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xHh/YfgbkcyMl84PRolLBXgAAMyfDCLxCI8uVHg8ZU=;
        b=C5MQObEj/YAauhBCOV8QSI7vjhVijuIFntn0PWtrZKDvvu3rCPFVlT04JmXL5AVOvB
         fI+K2xd5IPXzLb+m2+jD2Lrlvw8b0+KZDEMtrU9M/4Sf81dNzNT7uh4yBDjO4LngouK/
         WeCm8zp6wlJzLUW53KpVjyVttJ5aeplOKgN/XtB8C9ntSj9p4A2i3D5jFzj0hriEvrN4
         gCMIXuQUYBWGkJNfmkaRce/1yTmL2PicQS3bt13Wt61UgILN+q9ebozwejoOuykvJp14
         lxeyqidzn7mBHndF8B0CmTCZ5AjAiTS6IkQIWC6VBIsX8RJ15A/pgsZqqrykrt85rf2k
         E1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732645471; x=1733250271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xHh/YfgbkcyMl84PRolLBXgAAMyfDCLxCI8uVHg8ZU=;
        b=S0XxaTqZG/fyU2Np5ZFztJwWqLygI1JRohgRpVgRwOEU9wWG9+2+wcRQDkg5M9JXUA
         +2uwy7l+kH72PMF+m8Tqgq2edjq6Aa9MabA3U263iShgIREpFsoLHsXi35kLZ6Z63U7w
         NScSAgYxUvObGx8zgFowD+0QE1r9Y12ok9jlT3Cj4j8dDdcXe4l1D7HtZf3gC9DNzJJj
         PqJYZcKbTYOFUYGbkE2d0UWirupJjUswZu6IDKO+LjWOywG57UftErLFOvAEvIECFHOq
         KKOvNFhIGwDoKleTI1YG/pL1r1ewD9ncwHZVm7Rn0VcSAGw2lSAIwLP0t25aDnIemj2b
         trYg==
X-Gm-Message-State: AOJu0Yzi/jK3jRCzI7pn8Pww58s+V4hck07J00b+012//e4DiNY0UL+f
	g1UiX6gxjLL2Kq+4M7/yKxONN4U/M8GYXEOnj66yB9cDd2qe/OyzIylIuvGzkMyxwMmeds50FAp
	NioKH4mURY4+kIaXLomOWI5IzYzGyoyJUkH8=
X-Gm-Gg: ASbGnctIXcrNZm7/9oB7QVOckE4er9u8fBS1EpfsKPwekPz90WNsWD94oQD0QKyH4T4
	YYe11dOjPGzFYCytGzaTYKy2ty+RgJA==
X-Google-Smtp-Source: AGHT+IHWp6WeHReA1cY5sCaEpzlmwuMv28VqP4IFw3mTryYpO1qwYgEQRmW629qYBffvK2YlrURttIs31toN7Ofkwac=
X-Received: by 2002:a05:6358:78c:b0:1ca:9e4f:19a3 with SMTP id
 e5c5f4694b2df-1cab15f7bcbmr41332155d.14.1732645470716; Tue, 26 Nov 2024
 10:24:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1731399278.git.hverkuil@xs4all.nl>
In-Reply-To: <cover.1731399278.git.hverkuil@xs4all.nl>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 26 Nov 2024 19:24:14 +0100
Message-ID: <CAPybu_1F3LGC=OHKpZ1AqhdPYvYp=m0skawwwvDSF6WLbtwbGA@mail.gmail.com>
Subject: Re: [PATCHv3 0/2] media: v4l2-core: v4l2-ctrls: check for
 handler_new_ref misuse
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans

On Tue, Nov 12, 2024 at 9:41=E2=80=AFAM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> This supersedes (1).
>
> The first patch fixes the tegra-video driver: it now creates the new
> controls for the control handler first, before calling v4l2_ctrl_add_hand=
ler().
>
> This prevents a warning, which is introduced in the next patch.
>
> The second patch checks for adding a duplicate control to the same handle=
r,
> and returns an error, but it also adds a warning if new controls are adde=
d
> to a handler after v4l2_ctrl_add_handler() is called.

In the uvc driver, users can create controls with the ioct UVCIOC_CTRL_MAP
https://docs.kernel.org/userspace-api/media/drivers/uvcvideo.html

I guess that would be the equivalent of adding controls after
v4l2_ctrl_add_handler()

Right now, uvc does not use the control framework, but I would like to
dream about a world where this is possible :)

Is there a chance that you consider that usecase?

Regards!

>
> Eventually this sequence should result in an error instead of a warning,
> but I feel it is better to keep the warning for a few kernel cycles
> to make sure any broken driver is fixed.
>
> From my analysis it is only the tegra-video driver that has this issue,
> but I may have missed a corner case somewhere.
>
> Regards,
>
>         Hans
>
> 1: https://patchwork.linuxtv.org/project/linux-media/patch/ddb6e006-7440-=
41c5-8aaa-685b058418b4@xs4all.nl/
>
> Hans Verkuil (2):
>   media: staging: tegra-video: postpone v4l2_ctrl_add_handler
>   media: v4l2-core: v4l2-ctrls: check for handler_new_ref misuse
>
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 46 ++++++++++++++++++++---
>  drivers/staging/media/tegra-video/vi.c    | 11 +++---
>  include/media/v4l2-ctrls.h                |  5 +++
>  3 files changed, 50 insertions(+), 12 deletions(-)
>
> --
> 2.45.2
>
>


--=20
Ricardo Ribalda

