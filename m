Return-Path: <linux-media+bounces-19692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 578F499F429
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 19:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B1B6284612
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2024 17:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42EE1F9EDF;
	Tue, 15 Oct 2024 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3F4w3u6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D776A1AF0CF;
	Tue, 15 Oct 2024 17:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729013666; cv=none; b=u2q9Nppix3MTsi9394VE41RVUM6mNMevmdGzRTRxweB8F335pGbI75NRbz8EjfzliBc4Zv+nKbwu/2fyXmAUTlCUAOYCUkKBksPvjbiDpL4yEluEaAJzhfAfi/SrJmbCbRQZBHybVzdiFOvN0Jamnn1ASLFIhMmeCZtkpvzuaq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729013666; c=relaxed/simple;
	bh=/JoeasmV9+sdv/gcsuqFPMkgsCx0WR4nc656RNzg7VA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srSEgnBJiTmffJnZ3NkzxYmD2DKQhM0xdGsA34H1TW4gfJgezniD7AjoPH5+7deTXUVUeVplHYYl1hg8OIXPWhkVnvJ+7zhMc6+Cu6o8gDd4ymyS7Ax0auKRb4xff/XunnVv/9bBQf6Vv/Rgue2BP1VCtDY5iNNNRApVSGT9lcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3F4w3u6; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4a492f73befso642337137.2;
        Tue, 15 Oct 2024 10:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729013664; x=1729618464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+T79nYP2zFo1bwn+SXuL/+PCmL3zX/hJMTnr67F8jfw=;
        b=G3F4w3u62p7SDtYhuWVSMNCTpFltW3CKzLnLpKrukQUFUv09CXyRV4zJOZpV3KKKQI
         gzJB+LoKMP/TFaB79BO3M6ygqiUEkbZteWR0DTHETVimiUS2wy0AcPujb1lFYsURwZT+
         03yZ70SQtL5pvtf0e8gTmfVms9qq7xCnIwMJK4j1Hjuj5W8kC8CEkQzamijLBP73CBs7
         eAmgAZwVregk5KgVegEp0/Org6gbjGMqp9357qjAIaZFpGOon9eD6o/hk7BnJlRifWa4
         fIoah8M2fOXTrDule0M+rvAJ8j+pIFtMKti5Y6hX9oCwbD/4/31MekWauhNmLUUqc/6V
         2gmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729013664; x=1729618464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+T79nYP2zFo1bwn+SXuL/+PCmL3zX/hJMTnr67F8jfw=;
        b=BNOwjWaNWXItfd+9IKZg1cjTx6gRHaeWFTVmhqw2JI24db020aF5FEnSrp27R3YaMu
         jGq1R1DyxbG1fEPYoQRoCBRIkstCDCKkCDwnfIzDcVypcIZ0AeucBChfPz5jr9mQIE4T
         fxKuPKxWkrBRCUE0LlpOgxT9z5AkDXX3+EbjtQFS8aJHAV8Y2SObl7DOiRwSTr0G1kA9
         1o2MA1IG1rhILQVb6houA0oC8WcNev7J/Ped7d5iBRi/BsulZXMjmekBM8FlmaMzadCZ
         WOUBsC05YBx6Mw2qZHLchh3P2WZJcyp8wVPnJqkVA9usM9xQD2PmGcQSAgCF6tpta693
         GadQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyc8GeIpzCZDA721WZdKaO1U+GsjlKOy0nqgxNawZFgxeaxbgXQ6vQpIVKRuyTPTATZ9ihjdVr5yQmquE=@vger.kernel.org, AJvYcCX7+0GKoQXc/JQuajCSzIdPAeHPoMX9eIZX0KHpw4kX9wQ3lWH76x3GAmuxoYeZMTIF10j3ycj0ZGL7wig=@vger.kernel.org, AJvYcCXdk2sCRHIY1udTZoPWpBtdi7OPmLBAC++9lIhfm37MrWfqsJIVUgylryXfiMGUBl5U6g2pIonTmHUIZvj8+Dvp7ME=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTjlm85Ir8htbwItHmnaMh2LjOEV3b0iTUaR6ONWq8zPrZYdO6
	QgKrk22fGHvevkY67WKo6fSptRYw59WzIUliJcjXOd+YEHc6Yi38AmYy5OiSS/zLe+pYaJuTnh2
	3RytPPvFn7w8VN10b6sre+rEtGsI=
X-Google-Smtp-Source: AGHT+IFATsZGHTGxvJHYQ27CG1IJ6rqdCsQzvlrM1F9YJC/NDesAW8Jdx/+vcKEH4L5isn8F3Lfm7yEsypdJ1943PBw=
X-Received: by 2002:a05:6122:32c9:b0:50c:9834:57b3 with SMTP id
 71dfb90a1353d-50d374b8fcdmr7013697e0c.4.1729013663604; Tue, 15 Oct 2024
 10:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241011173052.1088341-11-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241015102235.GF5682@pendragon.ideasonboard.com>
In-Reply-To: <20241015102235.GF5682@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Oct 2024 18:33:57 +0100
Message-ID: <CA+V-a8uH6gZjHUes_K=t_R5_o2i9LevifU6mz3kaUbQS0pK6wg@mail.gmail.com>
Subject: Re: [PATCH v5 10/22] media: rzg2l-cru: Remove unnecessary WARN_ON
 check in format func
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Tue, Oct 15, 2024 at 11:22=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Fri, Oct 11, 2024 at 06:30:40PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > `WARN_ON(!fmt)` check in `rzg2l_cru_format_bytesperline()` is unnecessa=
ry
> > because the `rzg2l_cru_format_align()` function ensures that a valid
> > `pixelformat` is set before calling `rzg2l_cru_format_bytesperline()`. =
As
> > a result, `rzg2l_cru_format_from_pixel()` is guaranteed to return a
> > non-NULL value, making the check redundant.
> >
> > Additionally, the return type of `rzg2l_cru_format_bytesperline()` is
> > `u32`, but the code returned `-EINVAL`, a negative value. This mismatch=
 is
> > now  resolved by removing the invalid error return path.
>
> s/now  /now /
>
Oops, I will drop the extra space.

Cheers,
Prabhakar

