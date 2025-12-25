Return-Path: <linux-media+bounces-49531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C23CDD8D2
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 09:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BABDC30164CB
	for <lists+linux-media@lfdr.de>; Thu, 25 Dec 2025 08:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0908A314D16;
	Thu, 25 Dec 2025 08:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmDv4d0z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DB7314D1A
	for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 08:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766653073; cv=none; b=t6x8PLjdiZ+6Bxi5D7aVlkXJ+mav9o6dGWl9LWxqM3PEVzvESlZlIyN+HF42TVjKnT1R33M9CEqMhE9wScVkgegbrGN0tzhq/gQbJOvNibweudybJcgmlQ0nYaIgxv7T3Q9/x5RICNFdvdayto0sCWRoAvsQX4QVNR24417jW5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766653073; c=relaxed/simple;
	bh=nKr/UXuZJedwXiEKzRszz7VAcbo8G7eZhEShnnbFOjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKO4ZY9fCobrkZmSe4iNciI5p88cprvNA06Nf1hnuMDM/SWqIm3ydDbgvkUcOiJpZessM67DSSorKCGXJFzhSo97JUKYmsS62uqFKdNDObHrbP6KUDxe7Tajd4Ls0SqQJG1X9n+K6VgrrkApjg7ScIy0psaR6vsRrYPHOjLdPOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmDv4d0z; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5597330a34fso5020331e0c.2
        for <linux-media@vger.kernel.org>; Thu, 25 Dec 2025 00:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766653070; x=1767257870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUlQSx4lrcjwlLOVC9uZsRQ6ZVvTbu9ARo3stGUknTk=;
        b=LmDv4d0zJNMDnG452dLGXSTO/a59g5M1xAY9ODPaqOT4xLX5l9XRVmQraWtqncfZ6a
         AnfiURXm8CIrxwsdBMkDz00zP2p/UBi9os4ffNLnXdYp8gv7Ll0A49qpmy27eqX2Ph5R
         Vf9SGzohwU/todaOLiafuAm2qzc5P3bvtQgC8xpe7ZklUu/r48SZ+UqYUj73ujrl8xpS
         SoEB9aNVAMBoCit0bJ9bgJgQRBWanq0Z7m5SHQg1BcUN2tpaRx5hxAh/81nxNgJDP/so
         obwssnk5hLIyrY6/N2F82L6jd9NHcazPH7UYXnJVsLKGa/he7hw09gI07UsZwK2Xk9N8
         zVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766653070; x=1767257870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MUlQSx4lrcjwlLOVC9uZsRQ6ZVvTbu9ARo3stGUknTk=;
        b=HrZDVY2gjEKxjy5bDUTAoHFPrYEOn58mz4dLtLCG2siMpor+Doml+vn2iL8r5W8FGW
         Ht+f05DcHNMnnrJXAP1AyJFdJ7bqhFp3RFgsAelpbEKBp5RNzjZ2/aOZP07jveODtswm
         IdRU2tBAcp5Tb4OWieNqrMVZv9VgyFp1dnOlyxXBUu6JS9yPcyD0Of0xCIKRn3bSZnpy
         jZwtBRb9PaC5vbAhyjq5SZRW0ftWlj4cj2ssvYFtdF8SpN4FznR6beW/Ap1xoZyxjJU3
         CQMriX+QGmoAhsyPtcSNG+/dqaf6irc7FQ1gxhC83HIVSkvYcFin9pxDK5+w8UqmWlDZ
         792Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDNVKlVGuFxoIQAY5HJ/jPKWsLH3VBMnKCS8NSSzpJUtpg7ZG3Nk81RJP2hAZyBhloFRzST1NH0p+U7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YysgO3DSaM51ifqB04o8AMZPgpYV+tXHowYsoijCN7HerDxeYU4
	LK+nPPofOXnZayjQXmty/gmoRFn2/viSor0WFZPBwgQ5kKFZQPZK79BoYe/HcLOgTybqjDxCHcK
	d+ljPxHL+6Tqko6e1LwUcRb2sikNOXIc=
X-Gm-Gg: AY/fxX6u2B55gINWh47CX/hjMT3B30fhb7ETTwqd+35fkD6RBNutkY45Hq5uLyb6P4x
	xJ9iqOf9CabSKpzvlhNB0/cDrQWaZnCiXJ3mP2Yndf7i2Vy+vf+oS71xB5TdI+3+EYjzWassXvG
	StL7txkNNsJM3v2nHXlvODtz1FrXg/TVY168c0eFv3cU1+TMwINtvyWmWI4P2O5CIj9vMrhzqP6
	wLK+j+NOhIu8HtdMaX6olN6w+6o/kyONrIwHU4IQg3jyWLX9ASCtZQUiv23yvZR7jY+4A8z
X-Google-Smtp-Source: AGHT+IED6pijRRiHGfLNzAyy6lKEuBUVBjYINpplolvPvLH9q106OIsegrHgbv42V3j6RKnR9sfThThU2IRNb8HLNus=
X-Received: by 2002:a05:6122:250a:b0:557:b52a:d553 with SMTP id
 71dfb90a1353d-5615bd2d4cbmr6476562e0c.7.1766653069814; Thu, 25 Dec 2025
 00:57:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224-dt-bindings-et8ek8-omap3isp-v2-0-0728cc1fee27@gmail.com>
 <20251224-dt-bindings-et8ek8-omap3isp-v2-1-0728cc1fee27@gmail.com> <a7126a74-48f2-467b-91bb-21f28a251400@kernel.org>
In-Reply-To: <a7126a74-48f2-467b-91bb-21f28a251400@kernel.org>
From: Alex Tran <alex.t.tran@gmail.com>
Date: Thu, 25 Dec 2025 00:57:38 -0800
X-Gm-Features: AQt7F2p8Q0N9ISANypNs_FhXa1EZcGWDqVA4wB33xnNYKybFwLULX7WzNA0OndQ
Message-ID: <CA+hkOd4rJAyQPe1kgJYreGX+Wpi+EoX8s-CsD_JCP77WE5a=Mw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: dt-bindings: i2c: toshiba,et8ek8: Convert
 to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Pavel Machek <pavel@ucw.cz>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 25, 2025 at 12:40=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 24/12/2025 22:59, Alex Tran wrote:
> > +
> > +  reset-gpios:
> > +    description:
> > +      XSHUTDOWN GPIO. The XSHUTDOWN signal is active low. The sensor
> > +      is in hardware standby mode when the signal is in the low state.
> > +    maxItems: 1
> > +
> > +  flash-leds: true
> > +  lens-focus: true
>
> No, where did you find this syntax. I do not see how you carefully fixed
> it. You need proper schema for these.
>
> Best regards,
> Krzysztof

I saw it used under sony,imx214.yaml and mipi-ccs.yaml. I thought referenci=
ng
video-interface-devices.yaml in this schema was correct because the flash-l=
eds
and lens-focus properties are both specified in that file.

--
Yours,
Alex Tran

