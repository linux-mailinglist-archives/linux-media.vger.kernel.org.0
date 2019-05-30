Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED933303D4
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 23:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfE3VJf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 17:09:35 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:40978 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbfE3VJf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 17:09:35 -0400
Received: by mail-qt1-f194.google.com with SMTP id s57so8822852qte.8
        for <linux-media@vger.kernel.org>; Thu, 30 May 2019 14:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=dLFtjp03Vgo6B2GvcUY6WSCIkQ9o9IYjnvwRJt1vM18=;
        b=NjyepZ24do8xzlg7lCYLGXxfnFuCW9BU1KXAucrTT5V1GRbfbO4RR8cre0nmw1HUlR
         gDKrqmL3zfGxfW2MyQGmdYUXjT/9WGnH0Vn8a2KRSMwnycx/PMIPLdQpV8swpr3OqM7t
         gPcc4bI1uXVQxQQzhXo/vaeK0YDHd3jb/7Rif/lFyZOgY2x8lGxyJ3yIdmtVwbJ7vnbX
         uumMBdQ2lkVCDKCfE0m5s5uSIcM9z4nTpZeXJKphg2BJH2x99cLvWo86a4Q/P/GfeHA3
         Pnq23Q8LuQuREeg+nwAX0hHatQYjjFZtT6tmL15M8vHDleknY+JrdzsumeEXPf/3rroE
         c7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=dLFtjp03Vgo6B2GvcUY6WSCIkQ9o9IYjnvwRJt1vM18=;
        b=qM3RT491mL/2T/RlnlGLbnt/VwFwf7dqDf7f/xJ1Sks6Qvr+cC0psm9nK/WdA1MI35
         Ze56Zl7jtj5x5oAiUTUssuRGyw0j8UrQfVfUea8I3tME9GWwNY7OKEWBcm39LfP/YV+x
         knQitC1pifMCG70zq6V3MEt67wL65ECC85Mbk+SgjJlA3rx7D0SSopuuHj9+VS9uHNfA
         8ZaPaLq1OLY7Ld1UcxKhMXaZrG/yjVjpviTJpTOpx1np+MVBYi4qIvq9QYrPA+FmqRxf
         sC3rZjQhYLxHB/vQm9zzvuOzq6RMFtt/JpAP9vSGGhyPuGIQ892USr/yTJ++0VppUp0N
         GJ/Q==
X-Gm-Message-State: APjAAAUMNFVd6DRAdhvRXiC2kngZpGvX7FkOO4FMPmcm3BzrZyyYU1iV
        SFExRrFheeiV9tpaqZ+b7C0+gQ==
X-Google-Smtp-Source: APXvYqwO4LhUsY0Z+GdPbgTrAjGio/2PlOaUA3lxTEQdXctnoPxhicDdnT6s1UhwpBIdWtpCW1Lb5A==
X-Received: by 2002:a0c:9bae:: with SMTP id o46mr5583757qve.196.1559250574155;
        Thu, 30 May 2019 14:09:34 -0700 (PDT)
Received: from tpx230-nicolas (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id s64sm1949663qkb.56.2019.05.30.14.09.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 30 May 2019 14:09:31 -0700 (PDT)
Message-ID: <4afffe3822026e23a55c05b7e18b43a2d6d0274e.camel@ndufresne.ca>
Subject: Re: [v8] media: imx: add mem2mem device
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Sven Van Asbroeck <thesven73@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 30 May 2019 17:09:29 -0400
In-Reply-To: <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
         <20190529154431.11177-1-TheSven73@gmail.com>
         <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
         <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-l2h13S2Pdid4KfhSnhtW"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-l2h13S2Pdid4KfhSnhtW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 29 mai 2019 =C3=A0 16:55 -0400, Sven Van Asbroeck a =C3=A9crit =
:
> Philipp and Fabio,
>=20
> On Wed, May 29, 2019 at 12:53 PM Fabio Estevam <festevam@gmail.com> wrote=
:
> > Does this patch from Philipp fix the problem?
> > https://git.pengutronix.de/cgit/pza/linux/commit/?h=3Dimx-drm/fixes&id=
=3D137caa702f2308f7ef03876e164b0d0f3300712a
>=20
> I am now running 5.2-rc2 with Philipp's non-plus imx6q patch.
>=20
> Performance is still much worse than the Freescale baseline.
>=20
> I am not at all worried about vpu scaler performance, after all v8 is an
> in-progress patch.
>=20
> I am much more concerned about the CODA h264 slowdown. My 1080p30 test
> video runs at half the speed compared to the Freescale kernel. The best i=
t
> can do is 28fps, which results in visible 'jerks' in the video. Note that
> this is without using the scaler.
>=20
> Questions:
> - is the performance slowdown a known issue?
> - is there anything I've missed in the gstreamer pipelines below?
> - is there anything I can do to help?
>=20
> A) mainline 5.2-rc2 with Philipp's latest non-plus patch:
> $ time gst-launch-1.0 filesrc
> location=3D/home/default/jellyfish-10-mbps-hd-h264.mkv ! matroskademux !
> h264parse ! v4l2h264dec ! kmssink can-scale=3D0 sync=3D0
> real 0m 32.01s

Just for your information, I tested with this pipeline, with kernel
"5.2.0-rc2-00024-gbec7550cca10":

time gst-launch-1.0 filesrc location=3D~/Videos/jellyfish-10-mbps-hd-
h264.mkv ! matroskademux ! h264parse ! v4l2h264dec ! fakevideosink
sync=3D0=20
D=C3=A9finition du pipeline =C3=A0 PAUSED...
Le pipeline est en phase de PREROLL=E2=80=A6
Le pipeline a termin=C3=A9 la phase PREROLL=E2=80=A6
Passage du pipeline =C3=A0 la phase PLAYING=E2=80=A6
New clock: GstSystemClock
EOS re=C3=A7u de l=E2=80=99=C3=A9l=C3=A9ment =C2=AB pipeline0 =C2=BB.
Execution ended after 0:00:12.860395248
D=C3=A9finition du pipeline =C3=A0 PAUSED...
D=C3=A9finition du pipeline =C3=A0 READY (pr=C3=AAt)=E2=80=A6
D=C3=A9finition du pipeline =C3=A0 NULL=E2=80=A6
Lib=C3=A9ration du pipeline=E2=80=A6

real	0m13,411s
user	0m1,398s
sys	0m1,006s

That's about 70fps.

>=20
> B) Freescale kernel:
> $ time gst-launch-0.10 filesrc
> location=3D/home/default/jellyfish-10-mbps-hd-h264.mkv ! decodebin !
> mfw_v4lsink sync=3D0
> Running time 0:00:14.781129554 render fps 59.941

--=-l2h13S2Pdid4KfhSnhtW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXPBGiQAKCRBxUwItrAao
HFlHAJsH/et6mOgRlYB8HCAmLZTpkvLbywCeIVKSkZB4Ua9rQ653tNJFvWKlVBM=
=jyA8
-----END PGP SIGNATURE-----

--=-l2h13S2Pdid4KfhSnhtW--

