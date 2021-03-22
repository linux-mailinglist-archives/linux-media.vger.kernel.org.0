Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D024345129
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 21:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbhCVUvQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 16:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhCVUvE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 16:51:04 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7CCBC061574;
        Mon, 22 Mar 2021 13:51:03 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id v70so12122795qkb.8;
        Mon, 22 Mar 2021 13:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=oVHrhj/lQwT+ubnljfhPrE9DJJFlumRhNceNGqFvKUw=;
        b=nZAqLE/8UPltcAhzDK+GNKTedDen9yD2PoPafdI/EHIMkeQ385+OMHibPCuqNcHdB7
         NYSRcaq/RlqCIH+gCfzB13j8c9jxcvy8wizGYpiEmid1w3Mkb/V9skanbi9IFUigi6M6
         U7xfTeBfZKPWLNG+XBMPZD9nDqwc0SdNs08041TVgB8FVZ5kp+0cIL8W/Vpx0+vIX2JG
         CXX0vcdxh2OU65xj/3N/gOU5cK4KgEc7vFVHfxvl6ALKk5C6tmVmxx97LxS7fGi4i6V6
         HNdoSidvRqnZQA2r+5PUOUNxB6w4kgex7CRlK+jomkbuoFUKuhgVWky84/kDUxRaBY5N
         +wxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=oVHrhj/lQwT+ubnljfhPrE9DJJFlumRhNceNGqFvKUw=;
        b=lzG9a+exWsKs4CaFbXrS/aPGySls2XMY2Id3L0yDiY4Bt3rTUQIv/a5xsJu5iImYlU
         CTaCZ9gj2+rj714kK/T3vwyHoT6ecMmt8zRHvtt3+ifRqkxpifztbpjb69g3BLcRq95l
         WDTEteo3pqd0isdDm/rBcqEshwBNDSs/iMAeIWhOB2ePj8MhMnlaXrNDFwFNy/W21eL/
         no80STDhR0LGbzqidUhhlGRKuCzDU1Z7S9Eu6Zm6NjG0w3+VYeQhZvVBhAwPEgOOdTGc
         ONoWSKw+w42A9h8qYYN9equm71KScdK9lk8RGRujrC03qTk0rEBh2xTVNnHJiCp3UhZM
         pn1g==
X-Gm-Message-State: AOAM5308BMypu+4heF/emrszdrXGpWEZ4UyVAEljWZprk5T1oUWubEHE
        CA6FSZZkfJScn46ZjtNa144=
X-Google-Smtp-Source: ABdhPJwVh5IWN5GxaruaNUd2anEo8GFa407KIedrI6cZNO6UPvUBbAjrdhv9CDJSl6AUzpIrXOi1HA==
X-Received: by 2002:a37:8c42:: with SMTP id o63mr2003668qkd.449.1616446262942;
        Mon, 22 Mar 2021 13:51:02 -0700 (PDT)
Received: from ArchLinux ([138.199.10.68])
        by smtp.gmail.com with ESMTPSA id d16sm11610925qka.43.2021.03.22.13.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 13:51:02 -0700 (PDT)
Date:   Tue, 23 Mar 2021 02:20:52 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     awalls@md.metrocast.net, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/media/pci/cx18: Fix a spelling minimze to
 minimize in the file cx18-firmware.c
Message-ID: <YFkDLEP4EyhlJDws@ArchLinux>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>, awalls@md.metrocast.net,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210213150014.1605602-1-unixbhaskar@gmail.com>
 <cd6fbcc5-a3f5-2ee0-ce36-1ae2177dddfe@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="H7fncs+8nxWEtUP5"
Content-Disposition: inline
In-Reply-To: <cd6fbcc5-a3f5-2ee0-ce36-1ae2177dddfe@infradead.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--H7fncs+8nxWEtUP5
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 12:02 Mon 22 Mar 2021, Randy Dunlap wrote:
>On 2/13/21 7:00 AM, Bhaskar Chowdhury wrote:
>>
>> s/minimze/minimize/
>>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>
>I was about to Ack this one, but really, all of these tiny cx18 patches
>should be merged into just one patch.
>
True,I will keep that in mind, if I come across something like that in
future.Thanks for the heads up!

ROFL :) Ingo , showed the way...
>> ---
>>  drivers/media/pci/cx18/cx18-firmware.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/pci/cx18/cx18-firmware.c b/drivers/media/pci/cx18/cx18-firmware.c
>> index 876b96c11290..fdac310d7477 100644
>> --- a/drivers/media/pci/cx18/cx18-firmware.c
>> +++ b/drivers/media/pci/cx18/cx18-firmware.c
>> @@ -244,7 +244,7 @@ void cx18_init_power(struct cx18 *cx, int lowpwr)
>>  	 * an error of less than 0.13 ppm which is way, way better than any off
>>  	 * the shelf crystal will have for accuracy anyway.
>>  	 *
>> -	 * Below I aim to run the PLLs' VCOs near 400 MHz to minimze errors.
>> +	 * Below I aim to run the PLLs' VCOs near 400 MHz to minimize errors.
>>  	 *
>>  	 * Many thanks to Jeff Campbell and Mike Bradley for their extensive
>>  	 * investigation, experimentation, testing, and suggested solutions of
>> --
>
>
>--
>~Randy
>

--H7fncs+8nxWEtUP5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBZAygACgkQsjqdtxFL
KRWcGwf7B0uLr47zTo7vC5eSgCcuMxseRH/k+ZvdyUhevC5sCwH+aD7S0kvfaGba
ZbfOE8cS2OCFUjjTgT3M1uCIjNGS2IZ6R9HjURM+rFsE4WPfpowU+IpVtbHzSePK
IKD/Dtu349c9g2ARiPqN59/BHvIeZ54amYVdi6nAwaWVCAAFaVD674j1qcp3A2gj
QkWRMgK30JNYHKIU8PoYzPpCRsXBTnKkfyZJNpQZ8uVRB1N30g8IQulYTxByrO4K
Xtc17OTY0UauWXtxzULLLeoGOgXZ0Q8d51WBX/96015rzkKOpf4HnL/GLfjmh53b
7XODIFoH3j6mdHPblvwp/sJWDACjgQ==
=xIqL
-----END PGP SIGNATURE-----

--H7fncs+8nxWEtUP5--
