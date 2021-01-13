Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEFE32F4F66
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 17:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbhAMQBo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 11:01:44 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:45071 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727245AbhAMQBn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 11:01:43 -0500
Received: by mail-wr1-f41.google.com with SMTP id d26so2647134wrb.12
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 08:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=ZBJxpfOADLb8A12PWXpl/ehU7Uw7s9SAxEOG6FOEIwg=;
        b=o2dVM0qRcuKgBkvWbvecrEhIDFG55qUtH+0SzpsVjwVhfxeikJJVP2LAllEeC9B6Z4
         LmgZsdQlp6B9ENxHVpl9qVszb67aSAWAPGxQoHzLLz80RIgZA6xkd7LwluQs2Q98d5Ia
         asMyealxtFClHq+zndIbOxkjtH9JsvrZzhAQlYogfR65iu0H485+AyR99iiNr3PmWFgf
         jBqEPmrTAbXJq4DCMG1Tr49p8knuwZETxZnlO5yxZZ9R5tExGn6efEvXRpPWJci7I+LE
         bhUqdUzigyy1Jj57HeiBwdVrZRqO5BbG7pRE85MQV7//vU//5WG77hGSV+NshrtAy574
         QdHg==
X-Gm-Message-State: AOAM533OXZKw7LyrGNgMueNnxEygvgnP20rbGmg71+ooxtJp0XSY9au/
        VJ5qFz3aVUegVK8vowE35sY=
X-Google-Smtp-Source: ABdhPJwIJjsah7vfo9ok6CUBNmz7craRDuPv1LsGpkNanMUW22zCh+mR1su5atUp8xuY6WDNXKYCQw==
X-Received: by 2002:adf:e552:: with SMTP id z18mr3454024wrm.29.1610553661846;
        Wed, 13 Jan 2021 08:01:01 -0800 (PST)
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id h9sm3689739wre.24.2021.01.13.08.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 08:01:00 -0800 (PST)
Message-ID: <171da21a611570261d96c9d1a65143fae3733b5c.camel@debian.org>
Subject: Re: [PATCH v4l-utils] Build with libbpf, remove local sources
From:   Luca Boccassi <bluca@debian.org>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Date:   Wed, 13 Jan 2021 16:00:59 +0000
In-Reply-To: <20210113153058.GB8867@gofer.mess.org>
References: <20210108233608.285497-1-bluca@debian.org>
         <20210113153058.GB8867@gofer.mess.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-r0+Cqp17260jTeHj8C5d"
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-r0+Cqp17260jTeHj8C5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2021-01-13 at 15:30 +0000, Sean Young wrote:
> On Fri, Jan 08, 2021 at 11:36:08PM +0000, Luca Boccassi wrote:
> > libbpf is nowadays widely available in all distros that enable BPF,
> > and it is a standalone library with a release cycle and a stable API.
> > Remove the old sync of bpf.c/bpf.h and check for the library via
> > pkg-config and use it instead.
> > Only a minor modification is needed to make it compile.
> >=20
> > Signed-off-by: Luca Boccassi <bluca@debian.org>
>=20
> Very nice, thank you very much! Yes, it was about time the old pre-libbpf
> files were replaced.
>=20
> > ---
> > NOTE: unfortunately I do not have IR capable hardware to use with Linux=
,
> > so I could only build-test this.
>=20
> I've tested it and it works fine. You would be able to test with rc-loopb=
ack,
> but never mind.
>=20
> Patch applied.
>=20
> Thanks again!
>=20
> Sean

Oh didn't know about rc-loopback (I really know nothing about the media
subsystems), will keep it in mind if there's a next time - thanks for
the tip, for testing and for merging.

--=20
Kind regards,
Luca Boccassi

--=-r0+Cqp17260jTeHj8C5d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAl//GTsACgkQSylmgFB4
UWL82Qf/a2GJ0FuWnNhzGmuROSqctQwdg3lUuxlTE49RIqMPmV3tn+Mi3kx885Cy
yHdvHm++/76B75UXNPqJUxT0SKXj8Jla298YAnqCJ6ahd0HuvBNF5EC+qfP0jTTZ
p8N4TtMoMekE+M6/th0EuCH/xF9RmRY/UIaA7jEG19d4lXIX999wuUD1saHEIGew
pNxAE/cnQ6L/sHCYbX7oMxYIuK0/CQk+CGOcpgryi+l15YClB8DFFaN/GFvR9cU9
1Ca9nVqqbUVB00jdB50kckMYIWheIp/gu24cD18ElmO8jIZhIHH3A+4/f3ztD5pE
P27VdGKeMLLKkA1cJkvVrb+AuBFW8g==
=nlx2
-----END PGP SIGNATURE-----

--=-r0+Cqp17260jTeHj8C5d--
