Return-Path: <linux-media+bounces-6562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2448F873558
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 12:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A51B2B25698
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 11:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF82757EA;
	Wed,  6 Mar 2024 11:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="oQTEKECl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396FE74BF9
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 11:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709723318; cv=none; b=g+MP3DUzIcBzI014hVCB9WJBc8x16xhqHc2QBRJ4IG4ky9KAWusR4d73uA45NLyw9pfSKE+wh5xn9JfGjsAKDAPzUvf+mCivSvTTj4i/r4dOEiwQCArW2YD81tmRMH8AoRWw7dSyqDPxlQEmKrLrNbYtp/ou43yeyEPBRXZqMcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709723318; c=relaxed/simple;
	bh=pOq+HfKslFnJyQvq28MWkf6pDGnoB/qRksNu4/WRPgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0R/zGDoRVzEnrlyJQv6j5x2PAviTNWOi1IIAr6dFTSJcW2LkANrnywXdJ3s3ft+Uqk0zvx9LOhkUq5iYu1kz9nIguygd4vibZFewcVk9dzai6nguMfosjpmeFOHmYPP1+q8q9IdFWieTGZ3ht/KrC5MAhYrAHzL1slGQQihktA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=oQTEKECl; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56647babfe6so9749404a12.3
        for <linux-media@vger.kernel.org>; Wed, 06 Mar 2024 03:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1709723314; x=1710328114; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oHx52oM+q2jnV365anmkS+QQQX9fy0kAwjzTcjejwh8=;
        b=oQTEKEClMHMzHfc1uIOAV1DYl8nXvFvnuXDNyLRSPJ8asvtDIzchrVI3zhOz7inrAE
         zgUuhXXFJPQeH9HbERmmYmh/QhFEaUmvkd0vL0Ni6Urol4IG8Bb58ISPgq3nBzM40d/K
         P0Cq2cReBuI7ivfy1n17EaEz0D+k0VNBfTbDsIUTu6hTZj3KxyNFV9doHtpjLsJlfWAM
         9kPLCd3s9tv71gdgR4I9mrJhitkGye0JlCImi89vSk8mJAHf1yQH29GUHEXUhFQk36Ww
         P7JEvtCBYXlz9WIXD2VnFbVWYIQIe3OoUynvlz3QPzencJ6RiZuZ19Cbbemwqvzpj0OI
         PQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709723314; x=1710328114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHx52oM+q2jnV365anmkS+QQQX9fy0kAwjzTcjejwh8=;
        b=LS5x/QNwzotr9S/KGZDQkOsUVJqCSY+kAJv2rI3OKk1fWxlb4KgLWCNR9pqgXbn9gO
         Le1ppMtU4W90IBDLwhxxnTg0hi/ELIWO07sGb9y0ZEY+kDjJBexLSmhBvxZoNTRRADpt
         ea4AF6yFUa6spwvs5Dioh1K81UJ7MzVam+QSG51EUvdovoCd2SoWWCLHsjXL1+5EEuiZ
         5QtGGDHEvRlWpbdkFbnCPqPx5+ohFrE3T9tIP2NWaHyI7J3I6HcrGArw/sTmdj51SMtd
         2u8J+UTyBar0b/A6/QMxc30N5tefd+UTK2WYnjJoSnS2071Zn4lxoZIKfDgKLFpxX1sp
         yB/Q==
X-Gm-Message-State: AOJu0YwirEzRg0jLUtLvx5qeGZH4c/flir+elrKLPIFhP+QV11/8xed7
	rfp046SM+U67D+QbJri25rg3SZP7L3v0D74X8TuYEBe02wwpSHbJGq9dlhaqpxuuOM5UQjvuv+F
	UBFxUitzl7W7AVpzRQfk/3sfuEE+v760vgtd4jg==
X-Google-Smtp-Source: AGHT+IGUEqu4ryeCUYpfy3hM8BYyk6ZD1SzjRflUPSRtKL5gJuFCONKXRT5A/tB76eTmjbYBLx71ayiU0U+rmuOuZZA=
X-Received: by 2002:a50:8dcd:0:b0:566:48f6:7e0c with SMTP id
 s13-20020a508dcd000000b0056648f67e0cmr8801145edh.8.1709723314568; Wed, 06 Mar
 2024 03:08:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305160855.147483-1-jacopo.mondi@ideasonboard.com> <20240305160855.147483-4-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20240305160855.147483-4-jacopo.mondi@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Wed, 6 Mar 2024 11:07:57 +0000
Message-ID: <CAEmqJPoAbZo2yuXtGEhVeYiengN0Msuyo9qWOC1iJ2FnRZ9dig@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] media: uapi: pixfmt-luma: Document MIPI CSI-2 packing
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

On Tue, 5 Mar 2024 at 16:09, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
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

