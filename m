Return-Path: <linux-media+bounces-40351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63569B2D6E9
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 10:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 312FC586BB0
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 08:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1732D97A5;
	Wed, 20 Aug 2025 08:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2Zimv+w"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9400F2737F6;
	Wed, 20 Aug 2025 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755679393; cv=none; b=M+LCeCa2jT7HfIC8Bn43iMD65PAayoSprYg4XXi23EfWb60sMZF4cNbflynh625vizdssrEqZ052sCUEjsvRovZI4A8Su4hKdMd2yf0Upq1cbbwWbxjonlyge02koKAl2yUTc2tv6XcETGTdvM+UdhpAN0UaXpo++ZM0INJtsd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755679393; c=relaxed/simple;
	bh=NRd/86nn03gVwvWaVjK3dWj89kwjtvusHXCvu2az2Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YMXeV1Xb8PaA0Yd0ROabbd8IZ1CTz+n4UmE0g6JdKwpNcBTBDbNYxUpX0KkspC2dZI8yy31VLZ7Nghq1exuAbNC7b8aV2bmt0AIxSYvmGLje70zYevVesLqy9rw0rDRcH8bcN3KJCDuLIFB/vFILkv/0KtOPlf1PXWZR+ExPTUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2Zimv+w; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55ce526a25eso6162908e87.3;
        Wed, 20 Aug 2025 01:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755679390; x=1756284190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tevt+IUSGfeBECHJ34L6tymqtBLfbyfK+IzZat0dMtk=;
        b=f2Zimv+wyuL4UEJzHH/jEpNGpDQ4K2eofJECk4iKVlfqS1iggsRBWnk+qZn4JURPDw
         R1SpgSRNPGN81Z0b2Bt7m+07uQF5H8ToFc5zX8cLgsUJHJgaTeyRrd4j4nSaYT+wesIA
         1zrc8shRb3PxTRFqBUuX7YP2UCNRUGTwgDdFBTX4M/aN8QTfiuYBkKHkPKkCqsS26khN
         iGdXENdlc0WyW+XouaZgnzZ7+K776/KMVaAoDYd46TaN3M1glGl7WafKNAQAIuXutrGT
         vAIoPiQ3sgPovobJd8psI5Y6ICxUP2nqaC26BDju+Sbz1a1u9SOmtA2974RWYo0XfPEl
         Y59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755679390; x=1756284190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tevt+IUSGfeBECHJ34L6tymqtBLfbyfK+IzZat0dMtk=;
        b=UPHBtE3q7jt1JBl5G+v5A6dsCtes3LeXVnKNafSWCOCQIrsIeb2VUX9ybfL3bVRGGB
         1WYP2m9cNeCs3p8Wol05pfLw5CQuNBYv1avU9QyI+qkuR5gBLiQ9V0dWRB2mFZBzhCAx
         qIWF8zQIYYVjk5y/78ItVgs7REvYIOIqXPT4DIw1+w06n/sqXpPVqA0s1upExCO4FUJd
         8AzObx3ioSEr/GSaIs/JgVMNpgQAsKwfVO2XuKxWJ/N/PiUcIEq34b9jVWdhBgiYCBFs
         56cmgMXq6HtBZVvnTFxPhfFokQrCKYbEA47d37DAFvJXBh+7Izq/XF1wHkZn8T9xz08s
         PkGA==
X-Forwarded-Encrypted: i=1; AJvYcCUauHXsB8f1aD+qbETK4qqsoE61YBmrapTN6sQN++gqWj05iQ9H8i2FywJoykwNKHw3NK40vFLXPeKvpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoostl/+agagYeQ2eNfIjvYRZwXy+4gayPJ/0enMT9xys7F2sg
	8BJpx1XlVIo6R6E70+UtNIxP/6hCrunVV9VAA7jKkp4m8q1E9NuPmiOI
X-Gm-Gg: ASbGncuSaxi0WCJPXijVd/37iZfS4ukbCuzX5jTXUW57h9h65T2GJvjPhwrllpVaFij
	qnEmr5HTLoUjUGvsIBxx1BXU03Oo9EZKe4kjCaU47MxSaybkKJsUC1nAPk9QjyD6dzNmAzgDPrb
	GECeqrfqhGPqaAk7SgB/QmpoepzLG4LAk2UqaEhiyiVLG/p6EF42g5fqv233cpvbeMOYE1FUhQx
	omRiS94YUe1hywc6mo0gdVoRBm+ePomZgJVY5gKeHGf6jFlipCAiCAU1KtweDnN7sAfJBgmECbd
	9T9/mekMAenyT/ba5gZ/WWE9R8qLnxgTNVljKbSxpAK4kOFQMjZjAl44J20ptGIKyP3RedTirFf
	ZPKYTfemHGZACV6guW9irIbYgR+BPmKrOA/U=
X-Google-Smtp-Source: AGHT+IE6VNKAjukswbuEeeqYnJRFYmSdL7Bgde6vylPE0Xm+kwIn9VGBLwpJCiAKp85XO64LPk4Akw==
X-Received: by 2002:a05:6512:131c:b0:553:2c58:f96f with SMTP id 2adb3069b0e04-55e06b3d6c8mr517359e87.1.1755679389235;
        Wed, 20 Aug 2025 01:43:09 -0700 (PDT)
Received: from foxbook (bfd208.neoplus.adsl.tpnet.pl. [83.28.41.208])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35160fsm2573103e87.22.2025.08.20.01.43.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 20 Aug 2025 01:43:08 -0700 (PDT)
Date: Wed, 20 Aug 2025 10:43:04 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
 gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
 hdegoede@redhat.com, Thinh.Nguyen@synopsys.com, Amardeep Rai
 <amardeep.rai@intel.com>, Kannappan R <r.kannappan@intel.com>, Mathias
 Nyman <mathias.nyman@linux.intel.com>, Alan Stern
 <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4 1/4] xhci: Add host support for eUSB2 double
 isochronous bandwidth devices
Message-ID: <20250820104304.05a4373d@foxbook>
In-Reply-To: <aKWGOIsipctKEJP-@kekkonen.localdomain>
References: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
	<20250812132445.3185026-2-sakari.ailus@linux.intel.com>
	<20250818115016.3611b910@foxbook>
	<aKWGOIsipctKEJP-@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 20 Aug 2025 11:24:24 +0300, Sakari Ailus wrote:
> Hi Micha=C5=82,
>=20
> Thanks for the review.
>=20
> On Mon, Aug 18, 2025 at 11:50:16AM +0200, Micha=C5=82 Pecio wrote:
> > > @@ -1351,8 +1369,18 @@ static u32 xhci_get_endpoint_max_burst(struct =
usb_device *udev,
> > > =20
> > >  	if (udev->speed =3D=3D USB_SPEED_HIGH &&
> > >  	    (usb_endpoint_xfer_isoc(&ep->desc) ||
> > > -	     usb_endpoint_xfer_int(&ep->desc)))
> > > +	     usb_endpoint_xfer_int(&ep->desc))) {
> > > +		/*
> > > +		 * eUSB2 double isoc bw endpoints max packet field service
> > > +		 * opportunity bits 12:11 are not valid, so set the ctx burst to
> > > +		 * max service opportunity "2" as these eps support transferring
> > > +		 * over 3072 bytes per interval
> > > +		 */ =20
> >=20
> > I think a shorter comment would suffice: eUSB2 BWD uses fixed burst
> > size and max packets bits 12:11 are invalid. =20
>=20
> I'll use this:
>=20
> +                * eUSB2 double isochronous BW ECN uses fixed burst size =
and max
> +                * packets bits 12:11 are invalid.
>

Fine. And by the way, it may look like my comment was overly pedantic,
but I though that mentioning "more than 3072 bytes per interval" not
only isn't necessary here, but it adds confusion. It was something that
would be more relevant to 'mult' than 'burst.

