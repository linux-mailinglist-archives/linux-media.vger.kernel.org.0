Return-Path: <linux-media+bounces-43404-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B7BBABAE5
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 08:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC67B3ACCC2
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 06:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692FB29B781;
	Tue, 30 Sep 2025 06:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WwbKDoiV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B3D2989B5
	for <linux-media@vger.kernel.org>; Tue, 30 Sep 2025 06:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759214422; cv=none; b=SIOc7leJ5pifZvz4WeD8UvWBg5+S8hTL6HU6ESGsnorcETRXVRdz6u26FhjvtiyhXRh7cNsZE/1VZY9ioP+Y9KAnvc2k5dOvJxdyy985F6doRyyS2a0nCPe68udYow2OD1gdnRsIBfW0/7I7Jc6+iZC1Yz8Dzb1GthdcGSTHrV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759214422; c=relaxed/simple;
	bh=gQDZRuX3Iyc8Vxc4NYfOuO3yI92bRrIQu2/zmCtsShA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EFd8p1/K+jVABGwBa7yCvT2JbqgpfpiXlH6UG6TsZkLLWx291OsR67xahSPqjjcLPEIXbpkwwAJIN5OOu4+0htXUu2QESa6jeCbqyS1RVfEzNgRCs7E8JLXRxpLq5J1ABnQeixS2hW0suUrmygK5zrRWnu33Ae1atQWETxq5aYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WwbKDoiV; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57f1b88354eso5774084e87.1
        for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 23:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759214419; x=1759819219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQDZRuX3Iyc8Vxc4NYfOuO3yI92bRrIQu2/zmCtsShA=;
        b=WwbKDoiVslen1GmzOh7yo5NpvauCzQe3tM9rrYrZf5yrYUte6N0nZ3faimYbBNeBjd
         hO1LT4dO76q/KDpoSroMoh9lIi+pui2A5ekdGcqwQ3oAmaTo26zznX08tmNGV4jUbRR6
         j1uglomfwA0x4rzq1RMtgzkvXcmR2/Gw2Xwto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759214419; x=1759819219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQDZRuX3Iyc8Vxc4NYfOuO3yI92bRrIQu2/zmCtsShA=;
        b=OIlA+gXofvM+df9OvzMFN76WT166bbKIHOU0eLULxvYMKOLWheIoZU1p56YRm4XgHx
         6ogiLrvYXyNZ3TH6jcQhJ49ClIJ5fI94m+BCAYM1SJuljw5quFlRsA16EsrpcciAL2Qd
         vyymAYSKU0rREuZYzwdRLYJbgHt2JKyyxU9OYbMKLQh3tRZhI6xEQiOiGNERpdpYjtS/
         Stmih4taU9wgEDQuhtacrAdc0hgeIB3+S6Gm6EqdK2R+Zd3whRR5bUr0DcyZpg7V1tNG
         hTMLPOMvOVkqZpQdstVZbq6coWUJhsskGbJbFUHGU1wLMUgqS2snRgN49POiGU2xPxFu
         VNtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX6+UfV2DVYumahZOFcWLlns4zIXlCm5HDC+FzwbUBrVwroPcrGHBc3XhBLtAunHy3zLm3x7Q9PjNPvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0IDi8zVgSQbEqdR2cKw+0H4liFhWL7eJD68phwZeZauAu/zD+
	icxJa1MuM2NkV02Cl4SXofzW+FQrwqv2mM1T8cjy17YOxKVeo9i+OiDryBIjeFz+gm+MX5rp2yr
	tYZVTzA==
X-Gm-Gg: ASbGnct7wkblF459eUxl4AIhkWtUHQhx8wcXB6s6VzZ9Oa5yzyvsIgTi4ukY768/44l
	+s5nhe0US9dhA/S5bTwkxVDgmTqGbuCes4mdkidnFv7aU8a3oYRwblORTiOdgIdd9TNaKyCF2vz
	WQhflf2csFj2y89A9iy6BwTiW+HNwD1rASRy5qvre5VldmnRx/bvGeTfY/RiKZrrbLiFiFHLJXC
	egUc+XbMO9VD3lZ0DDSVpxtmZmb2LH9GiFTQXqYvQaROJ4sZ/09mbSTCuu0xbY/qrqA6/sIfyW/
	axH2YOLYXWwjT1DXSXjzxJvOmYf/VyjnLKQopgBOFJgoErKdMPnM3t3P8iplAhzPFOlhYIQvwJf
	H9fHibpWBiZ8OeUD/a5IkdqEsKo/6Nhi4guZYRmp2tnxN2sS9H8spgebT9UKWNCU/GRqzPlXhNk
	ko0GdRtx19AfQe
X-Google-Smtp-Source: AGHT+IHsYvg826T0jo5WXQk3MS4ss48qM5cwIy7kwMJBfd3eBQZ260nYMnHJfqCkpQWQWAZxF+oH9A==
X-Received: by 2002:ac2:5145:0:b0:585:c51e:e99d with SMTP id 2adb3069b0e04-585c51eeb93mr2681781e87.3.1759214418624;
        Mon, 29 Sep 2025 23:40:18 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58619e6c530sm2475601e87.93.2025.09.29.23.40.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 23:40:17 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3635bd94f3eso50568541fa.0
        for <linux-media@vger.kernel.org>; Mon, 29 Sep 2025 23:40:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWgJNxJHfNHPQ//yknlWwp1tnRvlK64CsfUCwFQNppVmIwBheZIjiwKIWWB31slngQqNR+q9Ciw8V9LOQ==@vger.kernel.org
X-Received: by 2002:a05:651c:441c:20b0:372:96c1:b276 with SMTP id
 38308e7fff4ca-37296c1b58dmr15679651fa.45.1759214417128; Mon, 29 Sep 2025
 23:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CO1PR18MB463349680603EC2C284B7FEFF71BA@CO1PR18MB4633.namprd18.prod.outlook.com>
In-Reply-To: <CO1PR18MB463349680603EC2C284B7FEFF71BA@CO1PR18MB4633.namprd18.prod.outlook.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 30 Sep 2025 08:40:02 +0200
X-Gmail-Original-Message-ID: <CANiDSCtwhpCAgQY73phJE0okN+Smv_AbA6Q+w2tuTVW1_qcbDg@mail.gmail.com>
X-Gm-Features: AS18NWA_D8LZfRD_mkcuc94lcACPA1tYsQzBsNOsCaW-qDSlktvb8Q1qfsQ7Ed8
Message-ID: <CANiDSCtwhpCAgQY73phJE0okN+Smv_AbA6Q+w2tuTVW1_qcbDg@mail.gmail.com>
Subject: Re: Realsense camera patch
To: Gladysz WojciechX <wojciechx.gladysz@realsenseai.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kontra.wojciech.gladysz@gmail.com" <kontra.wojciech.gladysz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gladysz

Thanks for your patch.

It should be sent inlined instead of as an attachment. Also for quirks
we usually require the output of lsusb -v -d $VID:$PID.

Regards!

On Mon, 29 Sept 2025 at 13:51, Gladysz WojciechX
<wojciechx.gladysz@realsenseai.com> wrote:
>
> Kind regards,
>
> Wojciech G=C5=82adysz



--=20
Ricardo Ribalda

