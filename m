Return-Path: <linux-media+bounces-29268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA1FA796ED
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 22:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 751993B3011
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 20:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00501F3B85;
	Wed,  2 Apr 2025 20:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZpG12h+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8951C1F130E;
	Wed,  2 Apr 2025 20:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743627401; cv=none; b=OAHhlZEd1hFs27ZFWPID4dRnm3LTBuu8BRii1yL8XeRrdFcmnFeqFdWk6fN/DP+6r6pQ7/mNGwAiikR0wLZ0opw1IlylPDo69oAwNHSvmlO1BX4VZRtlxIHsqbRx6TstKZ/YLdzgsPX/0VeiPqqs9XG+frNtums4O4utL2K64eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743627401; c=relaxed/simple;
	bh=kI+iKGwxfK6nTrApNRIpYAoq5CBwkWQyCrG9Yi3RuxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taG6zFjgMjT5FYiqd/UwJtszlgs1pWQulaZLrjE504xbX0LFTv1N+S+ZwK3n/ERCetAZjkYBhcB8dCSp0scAFCdx5XMMLoBoU7hgvXbwGB7M1SVmGtzHPYSJ6f7UTR3CLGweQH2CkHsi27gUFQE/DImnDX09nHk3SKLj2AHxZvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZpG12h+; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so30751466b.0;
        Wed, 02 Apr 2025 13:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743627398; x=1744232198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RtAoDacPWZ1WKrezpmrXH0fVtsTeL3P4GXU0dad7Vg=;
        b=KZpG12h+ynZBoPYfj1I7QM2uH3JqXwP7PmtLI1WbZXHYIL/Vs/W/ASH57v3KYD678c
         aXcxWx5oKi8nSKflcK1qWp2YQmyr8y1L6Wwij2mQwmjqqdbr13vjwWipDvDf4MTBhVH2
         9v6mW/pdn22o8WqOOGrCYwaN20s2FBPO5BmuO4s79ZC8C3bQPsciPaFt4FHTn1f9i2fj
         wtHwWYjYyerr0X9rTifkJcrP5PT5qo81xZ/euRpzJmGuGGwyvnKZ/dcT88TimL9BmNR3
         67MGEpBEdvyqkn0+i9P4UE03ML/BFdMfuyXQqySGXE6OBvSHgf1xWF4R/KoC53ybBre9
         tYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743627398; x=1744232198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RtAoDacPWZ1WKrezpmrXH0fVtsTeL3P4GXU0dad7Vg=;
        b=WvPkSeShuPE8XnajR7j03FVhx+3yl2JctodMik6gC5JeSwMaYVCprU4BnBwvPAGUGH
         9gGI3T1L9jL/8QY+ZcKXmgCWgAkjlCxj3PGNG/LPHAL9pmqdGj+w+9xtopFUgJhn4Adr
         KG4W/3nZITcFb5v9x4GHob3O4pK9UtWaLDn9Ulu7N6AyluaRUmWXsVLBujM5W9sJVGwv
         b+BL3v79TC83S7WymaNwO78OsjEUenwDmUZrWisaw5mdKatM2qCdUMvAzwTqs73yZ+78
         aU6+FBqJCxQI6D/Jz6C4DoI1n+DjDZMUEHsN4I5EBQE21glvgn0cDLLDLJyrcK/WH2FU
         Q0xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIyYuYuBqUmdfHUFDynvTR8ezUrueqjjtpPnP/fltpttwa/QiZX+o0BuNkuY36+ULWHUwqCE8ShDKAig==@vger.kernel.org, AJvYcCWQ2V7pHEoq8zsKl3NfKNX95fbiQIa+Cyu4aKAGYacRLdfJ5L7vZ29PUwBE8e1J6Xfa80c4LVNDfsL5TTtu936vkzRsvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoUXDgiexN9+AmEPZZsX1A0NEt8XL9VBMsL6twuv2DEs2b2j8U
	Ngr7SatPjr5D/Q/+LkWZTIFsq+dj4QnE2oFA4XRQp+3sy4aGpvk8rshIT+m+ENKh0qZCUFru0NI
	kK/upWIAi29xUVbksQr38qP4bt9E=
X-Gm-Gg: ASbGncvmYvHxfqepw/5dEValp3AE5Yy4LLAs3RIqqiApaVKLnTTdvFddw+DlMxdSGtY
	2//bHeCtrMEV3EGOAmBhIK/Lraqo1i/EIIcr7rqo7Wi9B82s6zEjeC8ckRWaoSbFvqbzTwZkDau
	s7UYqMwQwyYyaHXJX2obK8q7cjjQ==
X-Google-Smtp-Source: AGHT+IF1oefJxKRqa/M5YDdiNFEJh2G/DqMJwuE1ZMCrfrsvlJwrGK1BLfbv9xHYzCTjc022lX1E3JWeEHdbLp+9DRU=
X-Received: by 2002:a17:906:794c:b0:ac2:fd70:dda3 with SMTP id
 a640c23a62f3a-ac738be3ca4mr1353145066b.35.1743627397652; Wed, 02 Apr 2025
 13:56:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402202510.432888-1-hdegoede@redhat.com> <20250402202510.432888-9-hdegoede@redhat.com>
In-Reply-To: <20250402202510.432888-9-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 2 Apr 2025 23:56:01 +0300
X-Gm-Features: AQ5f1JpZwKB9DG0doiAs59HBFWubtRYddr3TuUn2sM9q-bCVTygNZpStPClhXto
Message-ID: <CAHp75VcJcPAEi2dhVnOL6Um78VEwT9DsvC+h20ZHZ0kdoPH--Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] platform/x86: int3472: Add handshake pin support
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>, 
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 11:25=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x1=
2
> pin defined in the INT3472 sensor companion device which describes
> the sensor's GPIOs.
>
> This pin is primarily used on designs with a Lattice FPGA chip which is
> capable of running the sensor independently of the main CPU for features
> like presence detection. This pin needs to be driven high to make the FPG=
A
> run the power-on sequence of the sensor. After driving the pin high

high,

(note comma) ?

> the FPGA "firmware" needs 25ms to comlpete the power-on sequence.

complete

> Add support for this modelling the handshake pin as a GPIO driven "dvdd"
> regulator with a 25 ms enable time. This model was chosen because:
>
> 1. Sensor chips don't have a handshake pin, so we need to abstract this
>    in some way which does not require modification to the sensor drivers,
>    sensor drivers using the bulk-regulator API to get avdd + vddio + dvdd
>    is normal. So this will work to get the right value set to the handsha=
ke
>    pin without requiring sensor driver modifications.
>
> 2. Sensors typically wait only a small time for the sensor to power-on
>    after de-asserting reset. Not the 25ms the Lattice chip requires.
>    Using the regulator framework's enable_time allows hiding the need for
>    this delay from the sensor drivers.

...

>                         if (ret)
>                                 err_msg =3D "Failed to map regulator to s=
ensor\n";
>
> +                       break;
> +               case INT3472_GPIO_TYPE_HANDSHAKE:
> +                       /* Setups using a handshake pin need 25 ms enable=
 delay */
> +                       ret =3D skl_int3472_register_regulator(int3472, g=
pio,
> +                                                            25 * USEC_PE=
R_MSEC,
> +                                                            con_id, NULL=
);
> +                       if (ret)
> +                               err_msg =3D "Failed to map regulator to s=
ensor\n";

A copy and paste mistake? Yes, I know that they are both represented
as regulators, but don't we want a bit of uniqueness in the messages?

--=20
With Best Regards,
Andy Shevchenko

