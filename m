Return-Path: <linux-media+bounces-46276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CEDC30811
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 11:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3BE8F4E7280
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 10:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B563E2E974D;
	Tue,  4 Nov 2025 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="DR0YQXAj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2102367B8
	for <linux-media@vger.kernel.org>; Tue,  4 Nov 2025 10:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762252105; cv=none; b=gOcU+6pkR8rT3o46rCxdL3jOIOHDzvDpSgS/hP5pNXy0h5RyfrddDRe7Q0GfxPMgyOofUgNJEq7yP46q6TQn1VsN1GRNi0HorSiI9nicOphmVGGysEDI0+283EC13x7T057PTgXOlGtTAb9VnRQjjlUYJwVjiaz2AbP6aCXBUkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762252105; c=relaxed/simple;
	bh=dXrnCp77lEEwVPS7xJBOY3p2Qrw1d2xRt7jXYb4Flbw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=UyqvHuIcE/Lnwg9hP6djKos8u5uKBvC7gRy6maXOR3twcgrHGk0Ag82z/KUaS95l/28oN5wV1QGs+QHQQBCuqzapb8pg49GJnfbMjea5jRWYSXouUBleozywookG9MAolMVYDHN2CDP/N+PUgA1TKiYItekmnYqvCmRn1ktatN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=DR0YQXAj; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b7200568b13so160254466b.1
        for <linux-media@vger.kernel.org>; Tue, 04 Nov 2025 02:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1762252102; x=1762856902; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5/EbeH1R+anz78ARaNJQqvThpFPGMZ6F7qJDbuymSk=;
        b=DR0YQXAj2TjsRf3a2UcAB5QdoZ0OyvyrWw5CAceT/3o2mZjv0BwOtTTjd5so4la5zU
         ZYUDlGS+91n17PQOJPC7ezBWvsWOcjZ+rUgC8v7aoO+YUXCp7SKo6eourkLB9lZsJ8r6
         qa6EWlyiAwZwDti2ckxWKsyAfYo67falVaBhKdzkhMqTsF/Wwri+VNuFGEAbx4QGGeqB
         l5UMCftT1pysAwtoSRZ9vyxjawx+bj30idnb7pAHyBquv5FBU+QetxYCt/LWD3rtd5iI
         hj8mqqlxxzFOSDUOVQ2s6jI4otf1LLYqHYIdc9i8Iu9xUU7BPXIiGxnu1CEhditYfKJ8
         Atgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762252102; x=1762856902;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U5/EbeH1R+anz78ARaNJQqvThpFPGMZ6F7qJDbuymSk=;
        b=uMMzlhr/0mxFvCkR3M5/KWBkiP4gW2JLLyotOrOWK2/1xQv1ygRmP/Uz32wdECImcI
         pmwJg/8dWIvz+p5H9rfsRE9vNFikx4ytslZK8ecK6yCEjZQSjO7+/WGj0DqB3DQ04rNd
         0OtrJmoKyiVJv3A9++Yu2H+7r+y3d7ON09ux6QO4Be4Y2lM545PDfl/wMegA3Am4Kk+G
         y7YvNAVBoibV6m/TXgsQedsn3g8ZdqA09Iywd+glr12I2LaLI1Dx4f+0rtoBIuQ3xJ8b
         TkLTfih0lTtaxXgsawwoa7mzgs2s6nDuYTeJu2D0x67vO4zIicTV3O40CS4kLAbfMhoY
         PO6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwtNg/GkGxDTyztnaml1l8Lg6A/50nsrPoo8UF1Ff59J/6KINRyg5rAkvI4aef9zPdwAh2z/DDGjl1/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTi4bT0TFTHbbDL0pf1siYs1gG/0c8yT1RVU5JFcGK+nSajv6U
	uu5CCKPLeURw8l3bXiFX2EGyue+Gei6H+E61bVwm2LKB0W2W6m3UkgvtsD5T+p0p7yc=
X-Gm-Gg: ASbGnctdkMIudmt13SHTLn3mVJiTrQDRvxPBJRHllMqu8y7gSkVGofjvsF4dupeuMVp
	gKj0GhIrFyK5AFCMSHmZ9EFZTqeVdaDQ61P8P+7b6OglD9eK5D3ncL3lEn5764n3/5Ynuab0rQ1
	eKp0yGHY9H3Z7BsAVMsz+IkEqFUsTvt3E+58iHD3sv/TJTAVekbLGIvcNoQFOuGm+BpnE3K5WyY
	nmMuAKu5SBaIJjVAHafOA084zFxzw7Iqq/7rTrkvMHX6vv4vP3RDzs4y5xHUouE1Z6L4Xcopy0T
	Mh/fx5uuiQdTejJSgJP4YwMnqWcfkqNaQA5Px5LfRiRJa9bK4Cqrr8XUrT9XmU7mvhSqQohHNyF
	+c5C82PcTUO4+snt503aV06RRrwBgU+TdUJBrG/0ctuZTAnA5C29e/n0pskvPZ+qDyU8scPzTuW
	HGZMA56wa5pPXFhww5b7txhD+n+Qogy2lHjSiRQnNRTxuDqjz+Qb4U9XrI
X-Google-Smtp-Source: AGHT+IHgqponPgTAGgPIt8PB3FXhF/2XBzC1NR6OhRgxCVT/ehcYTXZUudxOnw/HboJub9JT9xd/ZA==
X-Received: by 2002:a17:907:5ce:b0:b6d:5c4e:b0b8 with SMTP id a640c23a62f3a-b70700ad41dmr1516769366b.8.1762252101633;
        Tue, 04 Nov 2025 02:28:21 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fe37cb9sm171335166b.61.2025.11.04.02.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 02:28:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Nov 2025 11:28:19 +0100
Message-Id: <DDZU8E8EBAMW.3J9K3YJ94V2B4@fairphone.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] media: i2c: add Samsung S5KJN1 image sensor
 device driver
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vladimir Zapolskiy" <vladimir.zapolskiy@linaro.org>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Hans Verkuil" <hverkuil@kernel.org>, "Hans
 de Goede" <hansg@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251023025356.2421327-1-vladimir.zapolskiy@linaro.org>
 <20251023025356.2421327-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251023025356.2421327-3-vladimir.zapolskiy@linaro.org>

Hi Vladimir,

On Thu Oct 23, 2025 at 4:53 AM CEST, Vladimir Zapolskiy wrote:
> Samsung S5KJN1 is a 50MP image sensor, it produces Bayer GRBG (2x2)
> frames in RAW10 output format, the maximum supported output resolution
> is 8160x6144 at 10 frames per second rate.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  MAINTAINERS                |    8 +
>  drivers/media/i2c/Kconfig  |   10 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/s5kjn1.c | 1407 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 1426 insertions(+)
>  create mode 100644 drivers/media/i2c/s5kjn1.c
>
> diff --git a/drivers/media/i2c/s5kjn1.c b/drivers/media/i2c/s5kjn1.c
> new file mode 100644
> index 000000000000..9e2ac3d695ae
> --- /dev/null
> +++ b/drivers/media/i2c/s5kjn1.c

<snip>

> +static const char * const s5kjn1_supply_names[] =3D {
> +	"afvdd",	/* Autofocus power */
> +	"avdd",		/* Analog power */
> +	"dovdd",	/* Digital I/O power */
> +	"dvdd",		/* Digital core power */

My comments from the dt-bindings patch apply here as well of course.

Also my datasheet mentions that VDDD should be powered up before VDDA,
and there should be a minimum time of 1 us between them.

And power down first VDDA then VDDD, again with 1 us minimum time
between the two.

Can't say much more about the rest of the driver, great to see this
being worked on!

Regards
Luca

