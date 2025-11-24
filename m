Return-Path: <linux-media+bounces-47645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A9BC7F694
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 09:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 38F783465EC
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 08:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA5B2EC0B4;
	Mon, 24 Nov 2025 08:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzySS2me"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6FE2EAB8D
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 08:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763973778; cv=none; b=oxnEgi1rFnjYUmHk5TqFDdjqEwnMg9/VXzKxeJGG2xcXtT1K/Dql5xGdLwv/b7Bt2B6FpIqbTTfBgfuP0WOgzHKqqbPQ13TjQBT9hgltOlRNSleJXDouUzK/Gxc5LIZpT2miWzSK8qSnzO9EKJqLUnmLdhAO6lwkAMlFmRjxqG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763973778; c=relaxed/simple;
	bh=2TiH0cCG2DYApPOWKFWKa5DIrgxYBzcmygNl9EBKraI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mN25mKr+p6xzbw3IqgLtwi0IvxRVbcA07JDF530kZ2NKIKlM+/goVf5DCuxThmyWHEZGS3DK9TKVogeXBwi2IcZkVXBs/8Zac7+ss+V8XCa2gSi0d2xx2k8Vs1HnCihb61kOGpKy7L82xNlPo5f7QAOLfFLvs9wnv8k1NnEQXNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzySS2me; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7c77fc7c11bso3060876a34.1
        for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 00:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763973776; x=1764578576; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2TiH0cCG2DYApPOWKFWKa5DIrgxYBzcmygNl9EBKraI=;
        b=GzySS2me0Fc1mULgsIsxVIuUtRYr5TimT69l8SXqumCGifwRbAy1NX/ep97GaogoaB
         Co2tm6T+F7TcWnEuyuLUwdH51SZcNvvvM9UhBoh/PDk4NpyM0KZwgfu9tZurwzgcXrkP
         Q6bzbd/OywBfLS6etB2EiV2GWN4tSX6R40XcUyd5NnC7uxTpW1km/EFf0A7uIFIf6ItF
         6DDcBRLgl1326eCNNdqKyEO9KhkahJAL0CchAJVHZa01aY11g5ZCtrKJB72H0sjztUDM
         x6h69n756S5AWdXPk5S5ONHMyWPUSzsL75I5VCpMXo9pcqiU6NEQK1yHZkyHmcmX9hrA
         82DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763973776; x=1764578576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TiH0cCG2DYApPOWKFWKa5DIrgxYBzcmygNl9EBKraI=;
        b=OsrPi6IuJPDQHdCFKS2e2pZEEFTiIzsS5dlhaNj3dEDV7abw6hhWddWlaVQfc3LO/H
         +ZSdddyJsbDkhiGURTbI6MfFfo03NIgOHUzODH1Cdf8qEtFuzq194E5AwoT92P+VYjsY
         8DF+ALu+Rq439F9WVWVEz+h6yC9BwIGdUrD5OGdOKgi4tMqQUGVLhO3lNZ3uvX6QOHwE
         HrfbuCEjKbSiml0L/OPR1Mchu+oQ5AyfcxqzD2Zds0E8tmP6QhoMfXY8QbJVIl363xa7
         0ihBJGd7eRg054IQmvqJAvWn6Bot95jjKOsLkXlLE90+gn/+8FbJ2KElIeNx0el7iceS
         W4Rg==
X-Gm-Message-State: AOJu0Yy/nEqcAjNeLTr5pQrTaMQyAwNE47tLeLaLT8jPNLwb/dRJegwC
	/tZpZ6xDzSgxcIi/l7nZ2beD/BGz+H4C5/wem2SYxgxPcUblRo1TI6/wrUHWTpwt/N1WPVnuLiv
	McHvzMf2NFfBI1399wMwLvoxYFo5jZ5WrEUCj
X-Gm-Gg: ASbGnctUnZdlubfDzK17PYYJlpcsMyOVKgJD0mDNbA0pU8oYCWtyeujGLyKFuIvhQnO
	VG2MevgQqVFv/laXxJHdu+myc0vIM1G9aczsOlYa48T48jJyt6HR1kfe099uUKPFBM5gUQPIFMm
	K2Y6DSWKqVEGpgX/TD1cUygWgWF1HLiAGD0B42Obte93LvLvWMlDS30R4ao6CkvEbuR7wthobRN
	71djjr+DHoL4+ylizSldnlVtbHYr4iXIjHJMuPqRcYf4kgNUfB6dvFHIQEC4kE6gggvEQT5
X-Google-Smtp-Source: AGHT+IFc341kPlUkR+3pernNplOqTKMNxN2aJhFACxYpbFNQ0x66VhIwLTd2bGag+vMlcAFwr6JBwQDXy1dqvlegbiE=
X-Received: by 2002:a05:6830:252:b0:7c7:1a6:6a09 with SMTP id
 46e09a7af769-7c798bf2716mr3915794a34.17.1763973775612; Mon, 24 Nov 2025
 00:42:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN7C2SA34JN71qvqyefmr9h11SsmCaeGGVyc=GW408+MrC-aRg@mail.gmail.com>
 <3qt2yxwubrxhbhst5o2ig5ng4wqokzfg6uqzrtc2lfzq2cjbds@uwdb3zg2a7vi>
In-Reply-To: <3qt2yxwubrxhbhst5o2ig5ng4wqokzfg6uqzrtc2lfzq2cjbds@uwdb3zg2a7vi>
From: Sune Brian <briansune@gmail.com>
Date: Mon, 24 Nov 2025 16:42:44 +0800
X-Gm-Features: AWmQ_bk4o1lycd0KyWpeYSxT3BZzgz5v3nWZxjZTzTPreWjOpiqwgtjpvXmCPVA
Message-ID: <CAN7C2SC+nDhoHonOB=AkKgsunyijuV0aAYvBJ1C5iaU76Q0U5Q@mail.gmail.com>
Subject: Re: [HELP] V4L2 kept reporting CROPCAP fail
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jaco.

> > * Platform using: Nanopi-Neo4 (RK3399)
> > * Kernel version: 6.12 & 6.18
>
> Is this a mainline kernel or a Rockchip BSP ? (tbh I've no idea if
> rockchip BSP ships a different camera/ISP driver than mainline..)

Main stream kernel NOT RK BSP.
I don't plan to use RK kernel because they don't give a "F" on
updates and long term supports. Using 4.19 what a joke man.

>
> > * Issue: CROPCAP fail warming and possible stall on v4l2
> >
> > More information:
> >
> > The MIPI camera is functioning on both 6.12&6.18.
> > However, no matter preview or capturing there is
> > a warming message kept reports and cannot found
> > possible root cause.
> >
> > Message as follows:
> > v4l2 gstv4l2object.c:5032:gst_v4l2_object_get_crop_rect:<v4l2src0:src>
>
> this is gstreamer reporting an error.
>
> I would start by suggesting increasing the gstreamer debug (plenty of
> resources online)
>
> However, if you're trying to capture from a camera going through the ISP
> the v4l2src plugin from gstreamer shouldn't work, so I suspect you
> might be on a different software stack than mainline linux and
> gstreamer or you are using a different camera than what I'm thinking
> of.
>
The current situation is that for 6.18 kernel it can capture both
video and image but for image it is reporting that message
again and again and google also shows this very puzzling
warming message.

The camera driver w/o any modification works but again
that message is so puzzling and I cannot understand why.

For kernel 6.12 that is even more trouble but I think if 6.18
works why use old kernel when new kernel have its benefit.
Yet, still worth to point out the issue a bit.

Thanks,
Brian

