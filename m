Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA3FF375DB
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 15:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728613AbfFFN7C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 09:59:02 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:45329 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728428AbfFFN7C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 09:59:02 -0400
Received: by mail-qt1-f194.google.com with SMTP id j19so2676052qtr.12
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2019 06:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=0wmEXm3Wr3GO2dh4qVdAaNZTbQZ8KltXdR5xPbunDro=;
        b=nC6/tOEUDWKM6FtlIvc6E/OrptBl0VNi5QqSPIxJdh+kglyVq5HQq/UzZzEX33Jvjk
         4S8iYEUBaicVS0C913/pPoaqFzvw1kuwSigcMP98Y2Rg83ijubzBIh9VxFqqiMiwW3dT
         Qlv6zzQ4sp22A9dPqlJ47eYxOGQePfn5DxRn8gETv9NBxGpSpRwKMZFv9eHn+O0tm9R9
         sCUGI9zFekmn3ZS6eE+6W+C83OycZEm1DiGSc1Uu5+sJVRxYqOmoM3vVU7ZqmPQJOcnu
         pAjPnjEvDVit1Z3ZQ16TDyUJxd6CFHonKuPW5YUVuSrd81EIN9XankWNE4crK5rcRiF+
         wzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=0wmEXm3Wr3GO2dh4qVdAaNZTbQZ8KltXdR5xPbunDro=;
        b=BgB/b0dHz9FF0A0bSqOJt1AL4YK3gSJ7uhcXQaQjkM/saD3kH8+hauX4Wk1aJHZKnc
         6NNuwi2oxULeP0mc2Z/UtC9/IjUgIO4ZQBwAOanFgfHajKNZACELXAziJL+WhcvYGTFS
         WQa4N6JvEWLG0uY7Z8SuWxxIZ4WvtaLatz/aeOSjr6+BaiMtGTxrdcVnwSnRMhcamVcf
         UmGc5+yxdhXEi8k0OWYSLI28gYCbOitbZ0n73FGF+hmk8YcGK+m5kDhvi4REYlgx2WaQ
         l/DXuQpDTJfWQX6ZUR++Ms+Bf8SL1rJ7p3QFaoVJCG/DhrQ38dRQZ0rxVYHNhiv/3oOc
         o/ew==
X-Gm-Message-State: APjAAAXJ21BIKx1wTv6uOH0tUr4e8G0u0VR0CcCijQ1zgezxAmRchAzW
        s4ijQQ7ropK2/feJn/RZLCxxeA==
X-Google-Smtp-Source: APXvYqwAefM+rzYzrvXLVaw5c+mNrUt0Sq2P6I0MmTpMwrGz00CkBS5sGEl6aH4LpI/E0TB7E2a5JA==
X-Received: by 2002:ac8:3637:: with SMTP id m52mr27186434qtb.238.1559829540989;
        Thu, 06 Jun 2019 06:59:00 -0700 (PDT)
Received: from tpx230-nicolas.collaboramtl (modemcable154.55-37-24.static.videotron.ca. [24.37.55.154])
        by smtp.gmail.com with ESMTPSA id q3sm779399qta.74.2019.06.06.06.58.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 06 Jun 2019 06:58:59 -0700 (PDT)
Message-ID: <c909ac97997c0b550f3367cfcd4e5ce7f7fa1e37.camel@ndufresne.ca>
Subject: Re: [PATCH] media: v4l2: Fix the _MPLANE format check in
 v4l_enum_fmt()
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@collabora.com, Hirokazu Honda <hiroh@chromium.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Jourdan <mjourdan@baylibre.com>
Date:   Thu, 06 Jun 2019 09:58:58 -0400
In-Reply-To: <20190606085159.3454aecb@collabora.com>
References: <20190605164625.5109-1-boris.brezillon@collabora.com>
                <CAAFQd5Aji4v7fJZ+at_W58L_0+wC5E9wvSW=gCPLWswFECBMJA@mail.gmail.com>
         <20190606085159.3454aecb@collabora.com>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-e8mt/GTY5rt9gVacje7y"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-e8mt/GTY5rt9gVacje7y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 06 juin 2019 =C3=A0 08:51 +0200, Boris Brezillon a =C3=A9crit :
> On Thu, 6 Jun 2019 12:53:57 +0900
> Tomasz Figa <tfiga@chromium.org> wrote:
>=20
> > On Thu, Jun 6, 2019 at 1:46 AM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> > > CAP_M2M_MPLANE means the device supports _MPLANE formats for both
> > > capture and output. Adjust the check to avoid EINVAL errors on
> > > such devices.
> > >=20
> > > Fixes: 366c719d6479 ("media: v4l2: Get rid of ->vidioc_enum_fmt_vid_{=
cap,out}_mplane")
> > > Reported-by: Maxime Jourdan <mjourdan@baylibre.com>
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-ioctl.c | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l=
2-core/v4l2-ioctl.c
> > > index b4c73e8f23c5..ace9b9761bed 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > > @@ -1385,6 +1385,7 @@ static int v4l_enum_fmt(const struct v4l2_ioctl=
_ops *ops,
> > >         struct video_device *vdev =3D video_devdata(file);
> > >         struct v4l2_fmtdesc *p =3D arg;
> > >         int ret =3D check_fmt(file, p->type);
> > > +       u32 cap_mask;
> > >=20
> > >         if (ret)
> > >                 return ret;
> > > @@ -1393,7 +1394,9 @@ static int v4l_enum_fmt(const struct v4l2_ioctl=
_ops *ops,
> > >         switch (p->type) {
> > >         case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> > >         case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> > > -               if (!!(vdev->device_caps & V4L2_CAP_VIDEO_CAPTURE_MPL=
ANE) !=3D
> > > +               cap_mask =3D V4L2_CAP_VIDEO_CAPTURE_MPLANE |
> > > +                          V4L2_CAP_VIDEO_M2M_MPLANE;
> > > +               if (!!(vdev->device_caps & cap_mask) !=3D =20
> >=20
> > Shouldn't devices that report V4L2_CAP_VIDEO_M2M_MPLANE have also
> > V4L2_CAP_VIDEO_CAPTURE_MPLANE and V4L2_CAP_VIDEO_OUTPUT_MPLANE
> > reported anyway?
>=20
> That's the other option, force drivers that set
> V4L2_CAP_VIDEO_M2M_MPLANE to also set
> V4L2_CAP_VIDEO_{CAPTURE,OUTPUT}_MPLANE (or we can let the core do it).

That would not be backward compatible, some userspace would still
detect these as being capture device and propose these as cameras.


--=-e8mt/GTY5rt9gVacje7y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXPkcIgAKCRBxUwItrAao
HEN5AJ9umbwI7Mud7E04+9bqCXzOvkxTKACfWF85KJAZjYz9OU0zZBQ+WmjBrNM=
=GM8p
-----END PGP SIGNATURE-----

--=-e8mt/GTY5rt9gVacje7y--

