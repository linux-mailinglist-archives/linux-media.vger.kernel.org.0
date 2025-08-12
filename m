Return-Path: <linux-media+bounces-39510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72679B21E57
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15081504A12
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 06:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5EC22D6E6E;
	Tue, 12 Aug 2025 06:31:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897BC26A0C5;
	Tue, 12 Aug 2025 06:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754980278; cv=none; b=MBBAtvLBkbFTELwfgK8dWEVOrJHoBMjhhYiiDGhAkmi0F5LYL0faG8lHU9cbBSxfOHfKh6vjY7re8ZaXPx08hmQxP0/IJgDy3TlGdi27mTw+sTmu7ZczgpY9b6UxgAelUiU6Csr+DXaAr//fzbiqvbXi42QX1anOhYxawA5ea/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754980278; c=relaxed/simple;
	bh=LLYxMLN/+FoH7IMS9WyWZ3aQqJ9EbmJgwK779ugBzYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGHcQYUxqx23iRhd+o+2zUvpEi/lnd5/y0TEkBDSkwEgGW0l6SlQVxK+e6m8xFYc8MUSLa1wOTxuiO7gdkdmmde5ETnbYhbdHD2zYs1Qy0lTBfsmFAeFWKZrrYXDv3xjH7qUYPHnhO8het1X1OTI7bGtsCgI1RDT2vA2Jq/qsuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-af968aa2de4so927630866b.1;
        Mon, 11 Aug 2025 23:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754980273; x=1755585073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnSCoQK0EBBhR+KMV2scx1OY/S2RO6MiphSzki2soYo=;
        b=vozHciSuFbZDukM7FH2Koywm3CTCuflO/haAg5ahuzV5QYWNaWnPRrSydUjtAy8G7T
         kJTFk5rlMKRy2C/zdQfQU9BhNcCGaHRLJr1iqF+wkKCiO/XOp6+NdsGtReJAbTxevzeL
         HX3cw60gfK6Fy8hlirQ4bPEdSMQncKlb6WOFG6efYF1fXl3WpWRv+Z4a+LhmzUxOYziV
         lvi2rP80UNW8j8ehsZf+bh2fQB/46QOFsivf0yvlCxeo+STA/hreYi/ciJRf/qFu7c1N
         WfKnt/aw0fAkiwVxKOv7nO4iz2kvXs3HFYvOddrWGA24bnUJoBgiK+eaPzddX1Z2ydsw
         WqBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkmcU6X0W9AEgeWfUK3+L1EHlDW/vrPd3Q0MVVb1PIcLTc0PJLRRaZXXRomdOTLjjBMPoS1TQc55mm@vger.kernel.org, AJvYcCVPnRcpZnd0zWynqV1OG1MuCWKXb1z8KnFI4o4PQyGO48mb2UQuZANkMA/VXG0t1mby7po4Cr2E+9T2sbRq@vger.kernel.org, AJvYcCW4aqyCDV6/N7UZWjWW3NlXp3FKR7WNNZ5sI601cZ0LzTOS8pMmHj8gziRS8RO5YBX5pGV+IYzWQzXZUMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOQFYgdJtEhgAm19LcwJwqBZk53FlbbCXXkb7R39Cas8tsnI7P
	7K76rfoHQPLTXoSwE7N1sCGop424XjH/tkIMEZPZb8WqxE8QJIgOzZU02Q2RDH/V3rw=
X-Gm-Gg: ASbGncst772P0e+rKKjYkQj2Fhc/jC19v5GgRlmfcpSQwL6/MmThtwxRzv7sQoIN5Qr
	B6c15LeWtVnM+C/akj5uNFm1Z2M02fF+6h/pq7ZbLCVJAA/8gzPLxgtvkdJu2vaUKpjc8vgh998
	TSzW1xqwBG5Juc8z2LiGajf9VuWXjwtBkRfJHqoNhnRVjDvlfGqrB5VpuYfz++z9ziMo+HbsZId
	qNHrI1GNqUigpk9OzsQIywZ4Ybtq4+TZn9hUBijjhlqyoDxZvkOoCuxNnYHY3EZzNK4yDvK5g8a
	H35ALNGLra+gGcZV+4PFtIl1iAOAO+K08vSkrjvgsyQGiDnrwbSsyICZD55vT1cztLtEgHRdOH/
	UCPvF+ZagGdV5mhL1ED20qS/8KR74oBlE/UV+B+drCWK1d/49rb8oIRIqng==
X-Google-Smtp-Source: AGHT+IESo7x0a7DuOC0X385kuBkTBbSPHlgGZE5ugg+LLt8a/5utzejZbaFBU12jzMsuGxzUs2zk8w==
X-Received: by 2002:a17:907:7ea9:b0:ae0:9fdf:25e8 with SMTP id a640c23a62f3a-af9c6545abcmr1465004066b.47.1754980272599;
        Mon, 11 Aug 2025 23:31:12 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0df10asm2152459866b.59.2025.08.11.23.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 23:31:12 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-af95525bac4so913723466b.0;
        Mon, 11 Aug 2025 23:31:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxMl/TZXGjrl4Auaps2YF1ADwhKkJ/VrrVcHwyuZuKGZ91a1CWihH7gLGejxDXWeWtmcvNsnXahipGDQal@vger.kernel.org, AJvYcCWgOWELuWDfvdaZYhNo++7LNX+Ge7oiUh3z5zV+GMdFzg6KrMLnYKoltm7Tu4I6ni7/fZfUHXdbLvzbS/A=@vger.kernel.org, AJvYcCXbj0eHCwN39ycJEORrAnE1Gms7zgawfZcK+n3KThM1UgsuwXqltWj0kURxo5MSDTqwBgVD8e+nxdud@vger.kernel.org
X-Received: by 2002:a17:906:7952:b0:af9:1184:68b3 with SMTP id
 a640c23a62f3a-af9c658d4e5mr1347054566b.55.1754980272254; Mon, 11 Aug 2025
 23:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810220921.14307-1-will@willwhang.com> <20250810220921.14307-2-will@willwhang.com>
 <20250811-successful-military-dragon-d72486@kuoka> <CAFoNnrxWwqT9WA-h2WOsUe6Q-qEoz2mTHLpDogAyMwiXXZ9MrA@mail.gmail.com>
 <f12e6ff3-6ec3-487f-bf9c-0f8c06ee6444@kernel.org>
In-Reply-To: <f12e6ff3-6ec3-487f-bf9c-0f8c06ee6444@kernel.org>
From: Will Whang <will@willwhang.com>
Date: Mon, 11 Aug 2025 23:31:01 -0700
X-Gmail-Original-Message-ID: <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
X-Gm-Features: Ac12FXxUPGaJyzFRIVDPhYuVZhaEvNZeEF-rPdc7e_SppFMnCWmGszG5kWhfTm4
Message-ID: <CAFoNnrxhUof8BBrefm1L1peTxg==Koz72TY+54G_8QUy-rrT8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image sensor
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Reply inline,
Thanks,
Will Whang

On Mon, Aug 11, 2025 at 11:23=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 12/08/2025 04:47, Will Whang wrote:
> > Hi Krzysztof,
> > Reply inline.
> > Thanks,
> > Will Whang
> >
> > On Mon, Aug 11, 2025 at 1:01=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
> >>> +description:
> >>> +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - sony,imx585
> >>> +      - sony,imx585-mono
> >>
> >> I don't understand this second compatible. Is this different hardware?
> >> Can you point me to "mono" datasheet?
> >>
> >> Your description should explain this. Commit msg as well, instead of
> >> speaking about driver (in fact drop all driver related comments).
> >>
> > Mono version of this sensor is basically just removing the bayer
> > filter, so the sensor itself actually doesn't know if it is color or
> > mono and from my knowledge there are no registers programmed in the
> > factory that will show the variant and model number. (That is why when
> > the driver probing it only test blacklevel register because there are
> > no ID registers)
> > Originally in V1 patch I've made the switch between color and mono in
> > dtoverlay config but reviewer comments is to move it to compatible
> > string and not property.(https://lore.kernel.org/linux-media/2025070317=
5121.GA17709@pendragon.ideasonboard.com/)
>
> You only partially answer and judging by mentioning driver below:
>
>
> >
> > In this case, what would you recommend?
> >
> > compatible:
> >   enum:
> >     - sony,imx585
> >     - sony,imx585-mono
> >   description: IMX585 has two variants, color and mono which the
> > driver supports both.
>
> ... I still have doubts that you really understand what I am asking. Is
> this one device or two different devices?
One device that has two variants: IMX585-AAMJ1 (Mono) and IMX585-AAQJ1
(Color). Silicon-wise the difference is just with or without bayer
filter.
>
>
> Best regards,
> Krzysztof

