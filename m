Return-Path: <linux-media+bounces-6707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1893A876174
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 11:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD8C91F2327F
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 10:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365105380E;
	Fri,  8 Mar 2024 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="hiOJspda"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31CE535DA
	for <linux-media@vger.kernel.org>; Fri,  8 Mar 2024 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709892224; cv=none; b=bmidu0T2k/5x9O9S2chWssmmu0CxaU0fKTaXY1+KKcyMbNXX5TBq5KcmmUVKssGy0LvoZhESErC9KNFvaZRTJYI4ULN9LzSuPhWtYLiLCN4sqd/LcsrWIKdlZJjC/2NyLj4Kn+vp5+bKp9yP8UtOslEv24N5Im/noo7WTXkwDQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709892224; c=relaxed/simple;
	bh=aQjnGDmKhtl7MMpHBhn5kA5pcYQx+QeLLT0L/IrygD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d6/qW7abd3ZBanHH3IxwbhocXJRtTQIVz1XoFapW+zx/ga5nATqSD6Wxt29R7+aWrZPLGVuq2NcV7soPXgqRTF4IVBmi/B+emI/F0XUZ2y2TcT0IVGfijwPELYnqNYPsqfz3Mc5F9ez7S7Bn7CUEjfTBSzF5HZJXsEcv1PJ8EiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=hiOJspda; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-609f359b7b1so16691517b3.1
        for <linux-media@vger.kernel.org>; Fri, 08 Mar 2024 02:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1709892220; x=1710497020; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g90/a9O+0e1pQZ9xNq9Ll4wvo40gYQI9H4NV3hH5RXs=;
        b=hiOJspda9878oGMl8z7ZDauKbZyBdmt/xIOvNv57QbTzaBl2VEwocb1pMfS87Cf3mW
         PA9B3UNe1dxe1mtLgkYk/PRVnuLt9yhpQt5fIks5Ug9mWPpcRJ9gCJTg6J5IhvN5MNvh
         PGZJOOwjz814+SPuhc2TesTCL8d6KgjHehuSR2cozo8ym1eY6TtMZiJFRljhn5T1T7G/
         oavp+qk7sZ1Th3SS7MgxN5xVdhkfLX8YREL2WiR38hZuVkKwWTT3cQUqIElFzbExuWeA
         jUZns5l/5jk81vnV/FMgydkCVkOlZRjJBWpc8TTPQMEUjj2opsggh9L2N6Syz2csRcIR
         TJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709892220; x=1710497020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g90/a9O+0e1pQZ9xNq9Ll4wvo40gYQI9H4NV3hH5RXs=;
        b=QIDa36uFt/H8YKwa4TwgrSuZs3/AasJK4rgoOhTneU8ftPJn1CHxe+/nxSDMJD+Z5P
         jAj/KCOzPYcy5T7cABB/p6UiMOd3IJGg0TGav42NlYgY8DBrnUwGUuZp68vzo8SEbET+
         pObz7dLhAlfWDpuCbW2pDNaMoj/FFbOXUZWT1gzpk6b+2Wqv9nngHva1Ru9NG+3C7BVL
         UBA0nw8ndpA7RYDmaQqWXcvGZ8/TTrDNcBVUhFChBQGKkJjYpV2C8dbN5t31g+Fr+e6J
         tmklBkwGExqE6b0SINVy+l8ASQ6CuBECkN3W9GWpev9b5GfNXR7AKuacedEUBwQFjwnw
         pSqw==
X-Gm-Message-State: AOJu0YwwUp7IS/KLJ4cXCtqpvUwhAhQpgEsr7W9EuOFKDbwHUDBMp9+j
	Pt62d6ICk1Tk0yonZgBxEbKWTXO3sSJAEz/USsqXN1aEw6VxXCO1iSIS+Ls6cdDBqI3NVRoNLj9
	cYYvL7/Uqxbchb5qm2MyGd7vD6cAfB0jw6ZaVaQ==
X-Google-Smtp-Source: AGHT+IFLfnIyBrKJhbbrcSZGbEBxWvvakqtgX3KYq9/c7cTS65rf3PmNMDpJb61uxyyQypubvWo6PPLnHeXns5aTCdg=
X-Received: by 2002:a81:a203:0:b0:609:d822:7dc2 with SMTP id
 w3-20020a81a203000000b00609d8227dc2mr7955920ywg.10.1709892220586; Fri, 08 Mar
 2024 02:03:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240308085028.44388-1-jacopo.mondi@ideasonboard.com> <20240308085028.44388-4-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20240308085028.44388-4-jacopo.mondi@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Fri, 8 Mar 2024 10:03:04 +0000
Message-ID: <CAEmqJPoFjFzH0LfVkZUsM-4M80nepCK3PoDvC8HVE6WgPnEbBA@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] media: uapi: pixfmt-luma: Document MIPI CSI-2 packing
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, 
	David Plowman <david.plowman@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jacopo,

I think some of my tags may have gone missing in the series.   I'll
add them again.

On Fri, 8 Mar 2024 at 08:50, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> The Y10P, Y12P and Y14P format variants are packed according to
> the RAW10, RAW12 and RAW14 formats as defined by the MIPI CSI-2
> specification. Document it.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Naushir Patuck <naush@raspberrypi.com>

> ---
>  Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> index 3af6e3cb70c4..8e313aaeb693 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> @@ -209,3 +209,7 @@ are often referred to as greyscale formats.
>      For Y012 and Y12 formats, Y012 places its data in the 12 high bits, with
>      padding zeros in the 4 low bits, in contrast to the Y12 format, which has
>      its padding located in the most significant bits of the 16 bit word.
> +
> +    The 'P' variations of the Y10, Y12 and Y14 formats are packed according to
> +    the RAW10, RAW12 and RAW14 packing scheme as defined by the MIPI CSI-2
> +    specification.
> --
> 2.43.2
>

