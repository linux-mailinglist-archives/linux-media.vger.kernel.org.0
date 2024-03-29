Return-Path: <linux-media+bounces-8251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8DC892537
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 21:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FEFFB24124
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 20:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE50A13BC16;
	Fri, 29 Mar 2024 20:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K0OPZVZ1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC7713BAC4
	for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 20:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711743764; cv=none; b=jBNUWa0PONmdUM11nySYX4f127gciIXlcWiF5RJLQZmQ3UnNJwLLX0sf13++Gg/d9QVRstX1EepPCEByMQe8qphYNvTl4B/BR9zyXth60acy0h/3iC7HxwGeDR8ITYBP17M5jirKGo04Ycc+s7bxHWvb1fKPEKasiEfYmB64mGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711743764; c=relaxed/simple;
	bh=1a7H4deItoljS/5AtMP1VUdtT5vWBuPjw7iY/Poti1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etWf2EBVpRA4JDu/vxzxRmP66haFcH9UUwFJOM3MbEgvqagl1nr9xYVZPNHKv9NxrCgBp+xVqIkuHVMKLMoFCpQOjcusSPeLwMa2qstMWTU9FOXd/TB02utphnjaV5Q3h44k3X0ySw6g0ET9HN7NLwRVYgyONddvfKaIS2w0PJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K0OPZVZ1; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e062f3a47bso167665ad.1
        for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 13:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711743761; x=1712348561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rtwy1hYH4AJsXrTmyCziUfu7DWwf+fXv0EHGWB5SJck=;
        b=K0OPZVZ1cm491oPDYM1oI/Vj9cmSZZWfOUjE2sShXAoE/IKWvJ/HMzryiXVcL4VrVs
         3FcE1UbvfQknPoTSPk2tariKWv+dQ8W0vytloBtgqQeVmyGEfqGK4jCFmjazS3B6FUnQ
         5geauoBD9U82TwWM4Nrzi82m6wVVFAptWEKKadJLoIUCCVYZiNhk74ZA6z59QBGthdkK
         Zd910QoXjq/O5O5H+2zbeK/C+pqN8UCGeBlcUQce8JHkYzKOrbE5iJTqCdTKaDWkEAFq
         Xk3Ps7kWMbkCQIhuhvZKn+eFJeu1a6lPGALQ4LmTeEDcZn5mmmAjF4M3E2o+zyDeGMXP
         bIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711743761; x=1712348561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtwy1hYH4AJsXrTmyCziUfu7DWwf+fXv0EHGWB5SJck=;
        b=KhRV3jWLhnUq8lwumTHY0RV/qrpYHR9NfbNS6DbkSTRx1FE4At3e/LUU9bqAZwBEqf
         uk1CLhDDLCaFBRhdPZbvK4IeL8R5/3a0CrN4AARJgp1txNsXsuXGHp5F8S1j95eEGZUA
         GppVaHCJUOxkaVpEmswrICU0LdV5nxtVkde49zFCXuPud2LAG+BMfK19h7t9o/SKU6qh
         EdelIKj5wTyj9EC/+mNuTtw3uQpp6L8OQQvRZHj7SqiBUJ0UKLC2zUiBcSKXLoem1dWI
         2TWSQC5yDiH9Lh+p/sqYcGgFrC2OiSoBQkB5pDBtlWcC/p0EeNlI+DQAOw3JUKtuPbwt
         Bqww==
X-Forwarded-Encrypted: i=1; AJvYcCXKk/SU3TGhEeGYaJekWP+W17Uge84QZExBqIBif1j+8Yuhp3VUfXz7sO14039NNfC33zBxehOwdcs/7XSVqahynlpwbO7wZQ/J/JM=
X-Gm-Message-State: AOJu0YzuH4nNB3GuJvYGJSHxhuuVEokipavfqOfRmEsyUd1m7h9+ZOHb
	SYxuVbJ5F5y4/2y/UZH7XNaomZBLNwwNFsdS+AqOMTiInxckV2HFcnQxSRki6w==
X-Google-Smtp-Source: AGHT+IF0527Z4k8BmlkJrlCMYyPnjLhI2IhTTtX+58mg7dle3uGDGV4TV4IhwgzTIrPEMO3NEvmKlQ==
X-Received: by 2002:a17:902:f689:b0:1de:fbe1:beb1 with SMTP id l9-20020a170902f68900b001defbe1beb1mr228342plg.7.1711743760796;
        Fri, 29 Mar 2024 13:22:40 -0700 (PDT)
Received: from google.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id p26-20020a62ab1a000000b006e56e5c09absm3521153pff.14.2024.03.29.13.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:22:39 -0700 (PDT)
Date: Fri, 29 Mar 2024 20:22:36 +0000
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, linus.walleij@linaro.org,
	brgl@bgdev.pl, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
	sre@kernel.org, alexandre.belloni@bootlin.com,
	chrome-platform@lists.linux.dev, pmalani@chromium.org,
	linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 17/18] platform/chrome: wilco_ec: event: remove redundant
 MODULE_ALIAS
Message-ID: <ZgcjDKH3WaeC7Vom@google.com>
References: <20240329075630.2069474-1-tzungbi@kernel.org>
 <20240329075630.2069474-18-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a4JdWraQe9JHs8ym"
Content-Disposition: inline
In-Reply-To: <20240329075630.2069474-18-tzungbi@kernel.org>


--a4JdWraQe9JHs8ym
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 03:56:29PM +0800, Tzung-Bi Shih wrote:
> There is no platform driver in the file.  Remove the redundant
> MODULE_ALIAS().
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/platform/chrome/wilco_ec/event.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/=
chrome/wilco_ec/event.c
> index 13291fb4214e..49043c644572 100644
> --- a/drivers/platform/chrome/wilco_ec/event.c
> +++ b/drivers/platform/chrome/wilco_ec/event.c
> @@ -575,4 +575,3 @@ module_exit(event_module_exit);
>  MODULE_AUTHOR("Nick Crews <ncrews@chromium.org>");
>  MODULE_DESCRIPTION("Wilco EC ACPI event driver");
>  MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:" DRV_NAME);
> --=20
> 2.44.0.478.gd926399ef9-goog
>=20
>=20

--a4JdWraQe9JHs8ym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZgcjDAAKCRBzbaomhzOw
wt/XAP43r511JFB/1luZprEYf8Izl6M/QKNK8dwgCrJ00WgdZQD7BuHi8LFHQAi7
vbhOYIDycQKS8iOS6G+fwXDzbTp5Rg8=
=VODF
-----END PGP SIGNATURE-----

--a4JdWraQe9JHs8ym--

