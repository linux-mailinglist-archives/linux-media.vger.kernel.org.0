Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9C5867972D
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 13:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232483AbjAXMDS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 07:03:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232988AbjAXMDQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 07:03:16 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BE824108
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 04:03:14 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id v30so18018109edb.9
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 04:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6qGzOt/6s+ReoIhHOZ0KQGiemKjnX1oQ/JdSK2GPrZM=;
        b=aXMcM/ime85K3BFo2nJk9LijM42fpj+qNIZNlVplamxlgpA6qVzZUJYxMZByL1nNPB
         5EDAej1tCFSlF+1/dNBVygHBlDm+0WNHK+zb23OPSKp2c8cJfgQzKXgK+x7DvVKFRzqw
         eeplcNm6Su396qZZrok9dodbI+PMIWw8Ww83eRLfliQQhk5AbWQMUHPKqmRIKq611iSf
         ioPRVRPx5K4RmS1v+Mkvgmny/jPOGls6h4beiNOnPSfZsVST54bEi/pF3Q7Df7i0hvOS
         VUHOoAHJIO/Tnswnyf5HbEdNFtTBpr0WLasNvtVE7CsHf6yaNQYK39mU1XT1SJVzVK1S
         prFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6qGzOt/6s+ReoIhHOZ0KQGiemKjnX1oQ/JdSK2GPrZM=;
        b=N8HvuyEUUa0n5/8iS7y6cnZg1XVKF2BCc+qhhOgTvGOtR5SfLFLMFT5v8WRQXiqJsB
         vPk6i0FwumWI9svDkeuuwPY5RjioP+8ARf/F9k8cVqx6z4QB2sYZ3WRS9yCwGHMbRWBx
         efuLUkOl5B4opQ/N8Orh+oYH6rOfUtHOo6womhB1zuQr+trIuv5E7Fv2Tvq/YA6UMsoh
         sysf1CtwAjYbDkdB86Ja2zQHfhqq63eGLUyXavSvBbn0+v6Bbgz0UT69SNrH2KoqA63n
         s5fVAUNl29jHAQOSO+cAOn5/3C5jiz1IQulUsYXdMsYpnRyvhCs1+/hGkktds6/Bb84J
         D/ig==
X-Gm-Message-State: AO0yUKVq2Zi5E1kCayZgTbYrCcA106N3ks4rVNNrhniT9YA77m6Zj2wb
        Q4VVyYx1E6azFJXRulBQu80=
X-Google-Smtp-Source: AK7set8DqXLMzKqtnpriAQebwwA7A7MdhT/y5xWQcScK4e0B8pvbNx2OxSs3l4ryCe1Vd/KcHqbxFg==
X-Received: by 2002:aa7:cf16:0:b0:49f:1fb9:3923 with SMTP id a22-20020aa7cf16000000b0049f1fb93923mr3780075edy.40.1674561792639;
        Tue, 24 Jan 2023 04:03:12 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id fi12-20020a056402550c00b0048c85c5ad30sm945804edb.83.2023.01.24.04.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 04:03:12 -0800 (PST)
Date:   Tue, 24 Jan 2023 14:03:07 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Sebastian Wick <sebastian.wick@redhat.com>
Cc:     Simon Ser <contact@emersion.fr>,
        wayland-devel <wayland-devel@lists.freedesktop.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-media@vger.kernel.org
Subject: Re: [ANNOUNCE] pixfmtdb
Message-ID: <20230124140307.3851d70c@eldfell>
In-Reply-To: <CA+hFU4wQ14fn-giuL6oxMmXfg0WPPrXcHHeT5-7tagP54xuXFg@mail.gmail.com>
References: <nn8qWh16AviRPuLVOg_I-Nn747ncRsuJsZU_VZHvKhxp2hoFBCFsAfezBDkiwM-yn-CXAW_Vos121VKtETNsSZU3EuCuVzcgHBnnWNnww-g=@emersion.fr>
        <Y86skCbxY5kZglo8@pendragon.ideasonboard.com>
        <CA+hFU4z-3iotNkUVr=aHrQ9GFNnGLrvL2B1isnx2x2UnnO+qXA@mail.gmail.com>
        <B55u__QnPBXyk6SrEEYETx1ugeGjZHT9Fva6b9fpZazX-v7nTFJqnKH9Y7OebmOTQ51zffSYMnrfnfYutoWSLzpt-bWk2K8V69Ru7327VlM=@emersion.fr>
        <CA+hFU4wQ14fn-giuL6oxMmXfg0WPPrXcHHeT5-7tagP54xuXFg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Fm+ZB8_N.OmslshxVcqee2k";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--Sig_/Fm+ZB8_N.OmslshxVcqee2k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Jan 2023 00:54:07 +0100
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> On Mon, Jan 23, 2023 at 11:43 PM Simon Ser <contact@emersion.fr> wrote:
> >
> > On Monday, January 23rd, 2023 at 21:25, Sebastian Wick <sebastian.wick@=
redhat.com> wrote:
> > =20
> > > Why is the TF defined for GL formats and both the primaries and TF for
> > > Vulkan formats? The only exception here should be sRGB formats. Where
> > > did you get the information from? =20
> >
> > This is what upstream dfdutils does [1]. Can you explain why you think
> > it should be undefined instead of linear? =20
>=20
> The channels have no meaning. You can put whatever you want in there.
> It doesn't have to be linear, it doesn't have to be colors and
> especially not colors with specific primaries. It's only when it's
> used to form an image that the TF and primaries are known. Vulkan
> specifically requires you to explicitly provide this information to
> the WSI and YCC samplers (generally everywhere where knowing them is
> required) and never assumes that certain pixel formats imply certain
> TFs and primaries (exception being the sRGB variants).
>=20
>=20
> (See also https://registry.khronos.org/vulkan/specs/1.3-extensions/html/v=
kspec.html#_issues_26,
> Q 23)
>=20
> The problem here seems to be that the Data Format spec describes more
> than the pixel format. If you want to share an image, the TF and
> primaries are essential but they are not an inherent part of the pixel
> format of the image. So yeah, I think what dfdutils does is...
> probably not wrong but not what you're after.
>=20
> >
> > I was wondering what to do for DRM formats regarding these. I think it
> > would be worthwhile to do like Vulkan: set TF =3D linear, primaries =3D
> > BT.709, pre-multiplied alpha =3D yes. These are the things KMS assume
> > when there is no override (ie, when there is no KMS property saying
> > otherwise). =20
>=20
> Please no. All undefined is absolutely the right thing to do. Adding
> any more meaning to pixel formats is a horrible idea. The KMS
> properties are also not an override, they describe the image and the
> description has default values.

Hi,

I agree with Sebastian here.

The same with (plain) Pixman, Cairo and OpenGL formats. They don't
define primaries nor TF.

Personally I think that sRGB "pixel formats" are semantically simply
not a part of the same enumeration as plain pixel formats, but API-wise
it was a convenient trick to add a "pixel format" that implies
different processing in the same old API functions.

Most of the APIs do computations as if the TF was linear (assuming you
think in higher semantic terms than basic mathematical operations),
but the pixel format does not define that it is. The responsibility of
applying meaningful computations is left for the user of the APIs.


Thanks,
pq

> >
> > [1]: https://github.com/KhronosGroup/dfdutils/blob/5cd41cbdf63e80b00c08=
5c6906a1152709e4c0f2/createdfd.c#L47
> > =20
>=20


--Sig_/Fm+ZB8_N.OmslshxVcqee2k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPPyPsACgkQI1/ltBGq
qqfKJg/+JQfx6+7aYMmzI43kJOq1yMALAYrcZn3PKwN7espstXF6YBA6hAMK6uhf
iwLrKIulnvge/P1YFBcyKmGy1llFXSVtNlkOeY7BbLIEkl/SJmjYUZsKyaIHQuSV
ylS84vBmR5t8r3pMNtDYTf4butBGYSK1uIDJAdufBOz8d5Z8nhl95jKGFtHuWfOl
5HpZZhcaREEzkuntOmQRq5CsEzRxSquKCmTXI1b50kIkzBzFdWdJko9dmbqR/EDT
q0DS5YH3fcZAY2wOXN8/7j7Hc3/sMEdv6V4oFBlawH+QIoCgMRBPoTBb+tLswqPo
1ye6ohzZYyRoAj2Ps74IAVmI7cd5pT5vsX3tKnddS+0o54MMuYBH8PqTOXiGYmDP
tYCBNYhimMThK7++B7D1oCwu2QdlxTC6wJO7RNHVSj9ooRuDnZabNBuCZ4uw8yGJ
3TMMf9bxznLYbxsdgBSdGTs3CQ7A8bC31k9gIgnHHY8dVSgQ34IcajWv6aLfZAYV
NNgrK0YpCbsQMsz5TKb3PwE/6DGcRi1OhfVGobIO+H2N8afnATc97f15bBpVo7yb
yJMoDdsCcM9B4udziAM4ZRP5S7TWGa0tWEJdDNoTnUvg6/E+KtnzPFsi+MHE6Ukn
BJhec9nkaSFij3wfLjUjGuHPQ4K50ZZzqn8d6dEqWVukIzfkzfs=
=BmCi
-----END PGP SIGNATURE-----

--Sig_/Fm+ZB8_N.OmslshxVcqee2k--
