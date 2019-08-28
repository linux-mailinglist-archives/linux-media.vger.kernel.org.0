Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBCDA0114
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2019 13:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbfH1LyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Aug 2019 07:54:06 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:34072 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbfH1LyG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Aug 2019 07:54:06 -0400
Received: by mail-wr1-f45.google.com with SMTP id s18so2221216wrn.1;
        Wed, 28 Aug 2019 04:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/+I/Qmk33z0/jQg6iKomfwKn1BR95Q+T1LWWfJiTdgA=;
        b=SigL3ppc/Nkb6eoZBtC6rSUtM+J8L0qs9qXe+yp4scseXFtGseFDhTg2cxLWeOWQRp
         MrWaZRhT7Ozrq46wJpvSEv9KyJPsazq68jcCE4gQUUE+GnV6V8ckww+7xOw1u69qzZvX
         vWDshE3RQB8kXz62V2CIhOMqkF+wKLg522VWvzJ9EvAgaTBMWcLoLWtUfQ2n2M9uVd5U
         Ehss7TmD1ThUxex1BwphlePl37EfXhcz5mZE+jFvWmNPcbJuid0kx+TWxAlq4eJuRgIm
         sLyshlNetIEyOmrDU2ZlnLDx47BC1A9qaLz4xeHl1p9H/2sseRumpAPGdCaLBOR1FkGO
         +sBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/+I/Qmk33z0/jQg6iKomfwKn1BR95Q+T1LWWfJiTdgA=;
        b=XvHHVu+8TcgvSoX5nhLgUL5hHPqttC7zi6/zbGqWqZGSG61AU/ADUjEJnbCGdm9sfd
         12ZSRJ8sWd6/tjKAsPyizIp+ZEbEyxm5wUjt+KPM9xEBaydwhhspSgAJsaipAosQYXQ1
         bdelecAXftyVTuU/HyMb4eYdkUj9O32gfcxS3tT6/Ej+03YTHIwBR98BehfNN1D7KjSW
         uki2sSSQcWkkN6Jkoxm3z9GGDvJeE/HPoqUHvlNpQ0MCNtCYnHtyHMBqmnQIgLJoIJfZ
         S2ME9hZIAuidLsd0lEIKwfpRrqD2NxATjtMvC3bzDx5eqh+kklQ2xpWlv/5D99Pi8iSc
         HfIg==
X-Gm-Message-State: APjAAAVd+drguJTJ7dv6xp/tL0yKLWPwbgcYoyhs5vdlByegz8UDQ990
        anDR+9mz8bJ3y2HVGhl1CqY=
X-Google-Smtp-Source: APXvYqxr42m5Ab7o216ZiKrcog0ZY+rEsWlR3YYwAnHkEaLiJkyuTTDLuDRZ4+iLifRdB7l4HE5r/Q==
X-Received: by 2002:a5d:66c8:: with SMTP id k8mr4209637wrw.7.1566993243827;
        Wed, 28 Aug 2019 04:54:03 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id c9sm1480890wrv.40.2019.08.28.04.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 04:54:02 -0700 (PDT)
Date:   Wed, 28 Aug 2019 13:54:00 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
Message-ID: <20190828115400.GA30919@ulmo>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-8-darekm@google.com>
 <f0e99db8-3329-f272-e139-a7c713f200ea@xs4all.nl>
 <20190828093820.GE2917@ulmo>
 <2eed5ed3-85f3-4c19-4dd2-3d8432829c2a@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <2eed5ed3-85f3-4c19-4dd2-3d8432829c2a@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2019 at 12:06:34PM +0200, Hans Verkuil wrote:
> On 8/28/19 11:38 AM, Thierry Reding wrote:
> > On Wed, Aug 28, 2019 at 10:09:30AM +0200, Hans Verkuil wrote:
> >> Thierry,
> >>
> >> Can you review this patch?
> >>
> >> Thanks!
> >>
> >> 	Hans
> >=20
> > Did you want me to pick this up into the drm/tegra tree? Or do you want
> > to pick it up into your tree?
>=20
> Can you pick it up for the next cycle? As you mentioned, we missed the
> deadline for 5.4, so this feature won't be enabled in the public CEC API
> until 5.5.
>=20
> Thanks!

Sure, will do.

Thierry

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1ma1UACgkQ3SOs138+
s6HV9xAAsPIIHSOmhhNsZIVPEt+6Yof4lByrK2+i1Q7ayLy1AoggREbGVYqxlVlV
/aYtVDjUiDjmoQZVualZr4YHhpkp3qu2t40jBH8LSgLofwhq7SfqGuB7TemUr5+4
rBGiOurkFzTnOi/56Scx4g63Y51S3Mgsa/dJWLnvdnaK7thWD2b/Ap0tDQF+XS5U
dY31xR3nD4ikZkcw5of5PV/9x0vDN6UdzlsZwFl9NBqKEX/I5sKAQ7b5HGCNk7gU
zskkCqAFqvLFu7weThqNvQ4sw+T3sJAxU6llieP+C8DqrGYcIPlde/ggIvguBKuY
MkmRDqLQNH4pm+zp+XBILXRUG8bkH92J4TssLduIylC3zO/O+FTQZIn9ccBxSCmy
0E2JXzXBSNiGqXFchTFYynlWH5WcuJaZ6kTCZi+DV3knfdegYy8n6s+TJqHJYL+F
SYFouiQ2YFJiDlKmDLfVITFeS46oSE25cx8Ot9bY2RdVO6dFpLR4aGQMMTF5Tm0K
njACwVid8ULAiJWSRHwuCIfcw9VcLqq/F/VEgLeaFNYo96WzIt7DsOCIAqtfGoS8
13JFK2BtvowLpEylYP18I/bzwS65LLU+4a+8IXZ9pVg4pcTaaN7u1lIZeyaewHj5
TntCIejekoInNFRADlZrLe796n7mQbLSEuBVbsyrAVv89x0CIt4=
=0a12
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
