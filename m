Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56D253752B6
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 13:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234638AbhEFLBS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 07:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234508AbhEFLBR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 07:01:17 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30568C061574
        for <linux-media@vger.kernel.org>; Thu,  6 May 2021 04:00:18 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2so7186213lft.4
        for <linux-media@vger.kernel.org>; Thu, 06 May 2021 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=YG0Wik7vCVlEPNPBs+I/+DdeQPewCO2NCWYBkcQbEVI=;
        b=sRfrXDMzv3JcpQYnLRVH9IgOPpqgu2IurpOv462AsEoJDZXFw8R6el1vspPjWQeVpa
         yOAdVFCNERkzbFFZTbHt23em65l8WEH8jxi7ibXztz8h0Wup1fCAad/IOnkPJ/sxwovN
         l4HJnqRiW4lOTmdKMH/HP6zV4PrbX8BdtDUvJalOuJr7tbD3+N0qv2hO8vBZAz9Al1aB
         5ImSiqS8h+slwquAuucnNafJ/mSkIfHtThgvGTKCPRf5Zi/Nn+OTb8dpAS7s6l44Td6I
         tzw8GCD0l1kFe0bgKC2GI/S7ULSzdfiCAoR/1P6z2+UK1V1IoOw/LkRTqeotilVJpmcD
         UWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=YG0Wik7vCVlEPNPBs+I/+DdeQPewCO2NCWYBkcQbEVI=;
        b=ZRViJlvtZfGs0zUOeOYZPisjKTTjnJ9OQo1LORAcy0BMD+X2MYB3Sko+pTBsvlHKSm
         CEFx3EIbH6gFyAdxZXSLNtUPU2WSHBqqXZkrVl+2SVwdTs7qGVQSF2wL/zSwcbGuXgIp
         FP7EgSs1/268mvdiITMJvyJC3n8w+HI1+6daA+YL6401ANn7T77x1p/UieYFs7uz1cAD
         V00tGvo5OJZxRXQlZNlG1B19QqYmSzf2m4zeXL/5L22qDy/2sJ2pJc7pPB07Q94Dto9N
         MAweAA4+UtHeh1/rUiXkd5cVJSdDMwO/8PpvtqYdlQgaRalufUR1S1Ko3RNvlDL8RgK9
         clyA==
X-Gm-Message-State: AOAM533j8N470m9/FKERWxqUQudH/JESK9qyrLCnzqgMwWUpGtL2tPWf
        fcvK/swV8hMbSzdvbKw84AY=
X-Google-Smtp-Source: ABdhPJxuNuVRIw5CLy3WnAOdZxc91G8YrQ5LGJQCFq7iUZMjOsI8AONkbaqqDY+9GOECs0Wav44ylg==
X-Received: by 2002:a05:6512:33c4:: with SMTP id d4mr2607760lfg.536.1620298816679;
        Thu, 06 May 2021 04:00:16 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id q5sm589077lfu.109.2021.05.06.04.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 04:00:16 -0700 (PDT)
Date:   Thu, 6 May 2021 14:00:05 +0300
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     "Sharma, Shashank" <Shashank.Sharma@amd.com>
Cc:     Daniel Stone <daniel@fooishbar.org>,
        "wayland-devel@lists.freedesktop.org" 
        <wayland-devel@lists.freedesktop.org>, xorg-devel@lists.x.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: Independent EDID parsing library
Message-ID: <20210506140005.72db6d83@eldfell>
In-Reply-To: <20210429134958.446ef8c6@eldfell>
References: <BYAPR12MB31265E45A92C468AC1660EB6F25F9@BYAPR12MB3126.namprd12.prod.outlook.com>
        <20210429134958.446ef8c6@eldfell>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/W7FDa0tjSw1+cujpALB9tcc"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/W7FDa0tjSw1+cujpALB9tcc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Apr 2021 13:49:58 +0300
Pekka Paalanen <ppaalanen@gmail.com> wrote:

> Adding the previous list of CCs.
>=20
> On Thu, 29 Apr 2021 10:32:58 +0000
> "Sharma, Shashank" <Shashank.Sharma@amd.com> wrote:
>=20
> > Hello Pekka, Daniel
> >=20
> > As discussed over IRC, I have prepared the first version of the EDID pa=
rsing library, which is hosted here:
> > https://github.com/contactshashanksharma/libedid/tree/master
> >=20
> > This is a simple C library, and I have created this library keeping a c=
ompositor's context in mind, so its easy for a compositor to use it.
> > There are only 2 APIs in this library:
> >               - libedid_process_edid_info: Get EDID information from ra=
w_edid, returns filled struct edid_info ptr
> >               - libedid_destroy_edid_info: Free the EDID information
> >=20
> > I have provided much information in the README file, and have also adde=
d two simple test apps, with sample EDID, to test it.
> > Please have a look and let me know your opinion on this.

Hi,

I started a discussion on the API:
https://github.com/contactshashanksharma/libedid/issues/2


Thanks,
pq

--Sig_/W7FDa0tjSw1+cujpALB9tcc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCTzDUACgkQI1/ltBGq
qqcNrw//Zm5LchI+BE8lN105rRh/6pAaSCKQ2ZC8XIifMdAECpdQG6VqR5sXD/V2
P0Nr3QVrIy8vSFGdH9E+AAMaqQzO0AbA5PkkUOnwlRSsgXgokuexKEEmCLKnlRYA
zhKE/aKUtyFh91V3Pk8Eaw4ELR1YV/HqpEoSDue08HY0HML14DT85MECqEgh8uwb
BoT6HX9TN/8Ri9k3HSaqSQtzR64B4k8hdy3D0Kayq/LDjIi+WCCKqPs3qzn7TTwK
7vIB7nQrtSXb6fvCXG3oTK6LLCdkh9IAGrhr8yVkkBK4q1v6ys1S+a5cu5bbcfIR
TLubIyHR3c4NwQl24vlMeegkYnHbKJs/eEHHeJIzv7G9EHbuHOff3Y0Zm3nT6BA3
ph7gX+fI9mOHFnXu+wB5N7P42dnDwClskNYOgFN/kb0P2C4Dy2Uv29TI08IMP3st
NuUmXN8U7DIt5eg9d2iB5DnJuvfqIq6ncEV25hzaB15twoDNq8URF1UJWTTSKSmB
oCT5AFtBV4fYwMIzC2SpjCrgHdaOKLMpCPt7sZKu0d2DHr0eAJr8p6xwQ8eLCNdL
MPpigYe4/CZZWaOX7PtapLOFTyqlACvDRFHxCBpQSQligBk+tkKADovyxF+ug2rS
9+/iia/VUD3h1p+emI1emIk6M0lw80YAo4Lkx37Jy7+J+Vmmyqk=
=ReUL
-----END PGP SIGNATURE-----

--Sig_/W7FDa0tjSw1+cujpALB9tcc--
