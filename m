Return-Path: <linux-media+bounces-47648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF246C7F779
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 10:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 943903A4F96
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 09:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AB42F49EB;
	Mon, 24 Nov 2025 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j+ellATv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA062F3C28
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763975236; cv=none; b=XWHpkhEjyOthrb/IXA3Xdyd+rFemdSRbVL1qvmtQOOBclW4mA4orrV6oMtXG5WrZQs05/HzAm6z7ZGW9jSW+10revlo/83hkzf42buQan0VIB8A9G/5DdxUx7YiUP5TARAiFxkTV5+4SCONqfNfPvvgU4uUgLyaimy++HV7PJhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763975236; c=relaxed/simple;
	bh=NqvXp4kMzLJjcjCQ7egUr2vJ6IebmcC2HJQsY9pabKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GbcJX6KJbA9cmvQEWCkdq/v1xVYlz7k9bNbjTK974iEE6EspkAaapywR+aZlWYrZwTDbsZQf0/2nz0rac3As/Wu2bMo/V8JVW3MucYtsw2fAAFitgjFZGij7lJfQv3dVzUjAt37Q3CXiHQ70lGLhspBSSxnwj8OYL3SeNWp9vU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j+ellATv; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5957c929a5eso5519159e87.1
        for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 01:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763975233; x=1764580033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqvXp4kMzLJjcjCQ7egUr2vJ6IebmcC2HJQsY9pabKQ=;
        b=j+ellATvdDmA7VRQUFw/rSbGakcjVgy0xz1Pe76fchm5BAH1tOQnXMH90JCIO+KDFb
         s0Xp/f2ukqGjQY0NuciitWZNeA6670RZ8Q3pduRnkv06GR9G92EO43ug558Y2ofenG3b
         ogGNcfdqkDxGEO54q7a0xclBMi43WxpV5Ejws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763975233; x=1764580033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NqvXp4kMzLJjcjCQ7egUr2vJ6IebmcC2HJQsY9pabKQ=;
        b=lwsuxnue7WnL4SHCiLFn5ybN28RKi9a92uP8U068VJxzo/8EQfnLt7DfpBVx4b+Wy1
         sD36FU0I727Wvk7iz92V5oHHdpLBOqRCfBrHkBzLKOCKK90OfGxrlHksQQ7/CSZNN8kx
         i5yGA/MKhoogaqLKrYJ1xM+e73ABySFb1S8GrF62+B/dCVHD9rZPWgAKQOWG8AT+lGeD
         102cslyd+3rBuKxdPWRUZTy2UfFmM3I4p2BFO6JywsXO39NyXA/NiJmBgukXSDRCkltm
         xnjGchCtcVydnOuQAUDRbGgFw/LiBGSH0v7mGkFo9Qoy/1T1WF/HbPhwV4vTO51dPt+8
         M61Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5aXCzT37mPs3qdeVbLeqIiPXc1GnyL+4/xawK5ZEyOuPSNR13Jle8sNbifMw4+p4Jr5vvei/6hn8Y7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+IFpEpyorcWpiIc72+GTAIWG3xHXRw4qlWT7aROLdd8JMrZ9k
	WkSaS9xbhf/KKP7wW5fpFga9HoSXlEU6R6uHUI/m2IwWtf4nzDDUAG1j6jg3oVleJzM9c84sTNM
	jfidXOw==
X-Gm-Gg: ASbGncuO3AO1rtnHp61tpjGbWzbkfCWxSeFr910aSQEgez+Zf+L5Q/rghBkbe7VicZV
	EGPU0klnQ53RQTIAg322B6xEDTcyzRc9wZUFBQRYcrWk8FPVHkIhmLbvMf8LvDRfmWA4ZpJEBEM
	nRyDurFKeB46O6bOJU3tT8eEQfVA0Zhe1TFc9xk1OYVkRZYaPgLeINVwtiH9aurA85gJGqjgSWt
	w+1hY1QTz3PZIj4DR+J74oCqtlEpglPtgufsZA7+HfkyLv9trBSji1+FMVX+pPoCJkaXTRH1UKV
	bmcyrHaRVh6I7oZD8FuisiFPBzlFuRnasjK9ZG17ZVgsWzMY7/c9It6nyd47iXjtKT+Jl2sXxsl
	w4hNSMOLUBbofcsqWfFUIypfl0LuQGYymNT+HJKFlNHXNwJH7O3ZC/zzOkyIw2dw4a/L53HNXSn
	rJDGgbnNvSbIxWqV84AgMx9VZuAEpv4X5Y5oZn/RR+XJS+mEakxpxdLCxqS9c=
X-Google-Smtp-Source: AGHT+IFc7gxwiU4J8Xxny/sRbZ+c/cH4ga2YFzZGvvew0ZSUMal+RbCyzx2ehgLWfYhszva8dqa1oA==
X-Received: by 2002:a05:6512:234b:b0:594:25a6:9996 with SMTP id 2adb3069b0e04-596a3eb5262mr3299582e87.10.1763975232523;
        Mon, 24 Nov 2025 01:07:12 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db881cbsm4070524e87.33.2025.11.24.01.07.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 01:07:11 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5957c929a5eso5519132e87.1
        for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 01:07:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzXSxg6oMSNNr8GrZnU15bAgf6iIedckjgTl3riJcVcsDA4Dax/33ERvqp7EF2ygOsmnZnZS3MFoLleA==@vger.kernel.org
X-Received: by 2002:a05:6512:104f:b0:595:7bbc:2f01 with SMTP id
 2adb3069b0e04-596a3ebb8d5mr3766267e87.11.1763975231090; Mon, 24 Nov 2025
 01:07:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122072558.2604753-1-dengjie03@kylinos.cn>
 <CANiDSCuJZU9di2T_zQbk7NVr0--JyPUZkXGur11HKZF8qe3N2Q@mail.gmail.com> <65a0e74c-a9ee-4237-b8c9-9863e4de64b5@kylinos.cn>
In-Reply-To: <65a0e74c-a9ee-4237-b8c9-9863e4de64b5@kylinos.cn>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 24 Nov 2025 10:06:58 +0100
X-Gmail-Original-Message-ID: <CANiDSCtNuYbxH9JH1=1NisDQy+b+SahpvGw3BjyvT4PXX=FO_w@mail.gmail.com>
X-Gm-Features: AWmQ_bl49ZACT0JdEMZ_qJKAtiw4jWhs_Y04qp1gxn5xGT1OpT5aQW321TOEqRI
Message-ID: <CANiDSCtNuYbxH9JH1=1NisDQy+b+SahpvGw3BjyvT4PXX=FO_w@mail.gmail.com>
Subject: Re: [PATCH v2] media: usb: uvc: Fix NULL pointer dereference during
 USB device hot-unplug
To: Jie Deng <dengjie03@kylinos.cn>
Cc: laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jie



On Mon, 24 Nov 2025 at 04:08, Jie Deng <dengjie03@kylinos.cn> wrote:
>
> Hi Ricardo
>
> Thank you for your reply
>
> =E5=9C=A8 2025/11/22 16:17, Ricardo Ribalda =E5=86=99=E9=81=93:
> > Hi Jie
> >
> > On Sat, 22 Nov 2025 at 08:26, Jie Deng <dengjie03@kylinos.cn> wrote:
> >> Add safety checks to prevent kernel panic during the race window in
> >> USB device disconnection.
> > Can you share the kernel version that you are using?
> The kernel version I'm using is 5.4.18
> >
> > This patch
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Dc93d73c9c2cfa7658f7100d201a47c4856746222
> > Should prevent the race that you are describing.
> >
> >
> > In your trace you have a reference to uvc_queue_streamoff that was
> > deleted by that patch
>
> This patch may indeed eliminate the problem I described.
>
> The 5.4 longterm version should not have synchronized this patch=EF=BC=9F

Seems that the patch that fixed the issue:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/media/usb/uvc/uvc_driver.c?id=3Dc9ec6f1736363b2b2bb4e266997389740f62=
8441

Was only backported until 5.10

5.4 is EOL this December. So it is probably not worth doing anything more.

Regards!

>
>
> Thanks,
>
> Jie Deng
>


--=20
Ricardo Ribalda

