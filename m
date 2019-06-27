Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C613457DFD
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 10:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfF0IMz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 04:12:55 -0400
Received: from butterbrot.org ([176.9.106.16]:40901 "EHLO butterbrot.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbfF0IMz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 04:12:55 -0400
Received: from [141.54.178.119] (anna125.medien.uni-weimar.de [141.54.178.119])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by butterbrot.org (Postfix) with ESMTPSA id BDDEB4AE02B2;
        Thu, 27 Jun 2019 10:12:52 +0200 (CEST)
Subject: Re: [PATCH] input/touchscreen/sur40: use COLORSPACE_RAW
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <25bfb7ad-0c12-3d47-81b1-6feb1906cd42@xs4all.nl>
From:   Florian Echtler <floe@butterbrot.org>
Openpgp: preference=signencrypt
Autocrypt: addr=floe@butterbrot.org; prefer-encrypt=mutual; keydata=
 mQGiBDuvTgcRBAD3yCehD8VSv9/5ALV2PGNpRyPd/H7y4E0nh/fNHjOtq/Iy822ZQgPxP9+a
 nbtC7KMzT0JIr5ontFH4TuMxikeE92ID+h0a755FiHAtSACXzNcLY370YfRJuTQMBANEwf/T
 ozY7clf8uZc9emk0TLQJ7ZFksRAxd2Ql3lyGlM+jEQCg/6aPMk/pV3Jjfz01dckZH65DSb0E
 AKcZOV/KpQwPqRE1L7yEax19p1+38InBhGQg5ZORsPDXNDKAx5TovSM/4H68DzVjCTtb1Qig
 E2InSlT4qxOZq2hTIwsbUrl4YrOLG0msYeB+1avaVCxkjEs4e6fYX9VvJxUdgkYSmwWxzSGK
 wiEeRlbcNGdKeVKYezNyjRKO5OnSBACb3t89sJsqaotwh+CO4cwgKbjIgHnIjH5TminqiGt9
 chYXGA+IjkVef+Q/pWRzXj4IDC1gubW5GELuMa6WO+aMchJKfD4VDflvdUqWTuXKj6qjwxnY
 qtX/3O7QwVFoVgkPqsl8goAPSGk5lWHIvKJJUSMFgjWG+BafnppZs/R+BbQlRmxvcmlhbiBF
 Y2h0bGVyIDxmbG9lQGJ1dHRlcmJyb3Qub3JnPohjBBMRAgAjAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AFAk47tRkCGQEACgkQ7CzyshGvatgVzgCg9kkfrcPWEmqSADhAX4Bj83gZQEgA
 n1PrIrMQE85069aGgJE/kuMyWUJcuQINBDuvTggQCAD2Qle3CH8IF3KiutapQvMF6PlTETlP
 tvFuuUs4INoBp1ajFOmPQFXz0AfGy0OplK33TGSGSfgMg71l6RfUodNQ+PVZX9x2Uk89PY3b
 zpnhV5JZzf24rnRPxfx2vIPFRzBhznzJZv8V+bv9kV7HAarTW56NoKVyOtQa8L9GAFgr5fSI
 /VhOSdvNILSd5JEHNmszbDgNRR0PfIizHHxbLY7288kjwEPwpVsYjY67VYy4XTjTNP18F1dD
 ox0YbN4zISy1Kv884bEpQBgRjXyEpwpy1obEAxnIByl6ypUM2Zafq9AKUJsCRtMIPWakXUGf
 nHy9iUsiGSa6q6Jew1XpMgs7AAICCACB1zq0sSVcye/cvwTnHZyGvILT6VU8+xUxvmG9ota2
 yuk9A+0GSnDpjNxyBkmDBVQkLLvW8lBErPYvaq9pFMeYntOhYwRP31e7rbsWh48QjfkL5M/X
 Q5kFCTO4jVXHXYJ034x0vXamDDzFbAdUg/V/zN+KRIcEZcs8foIgC7BR6i/TsCsFHN3OHAmk
 hZ8NRB//UIJXxq3CcBXLiu2OGFrfoSvpAp5OzMyrWneMCaySmN/i3wSYl6h3Nl4YRMH6Yx+E
 RnNF5/cy3xUZODG1JHnEw+owc0dl3ch+oQe0t3zN5LGAznf7hYmOYl27xvym/FVA/skTD1wM
 MZhfxLVyis75iFQEGBECAAwFAjuvTggFGwwAAAAAEgkQ7CzyshGvatgHZUdQRwABASUVAKC7
 c7SIc/xurEhWVpzt1wPPsPOQ2wCglsSZ1yg7JIMh4o+a178IK9ozwQY=
Message-ID: <add1e8aa-1b6c-b405-610f-585540835751@butterbrot.org>
Date:   Thu, 27 Jun 2019 10:12:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <25bfb7ad-0c12-3d47-81b1-6feb1906cd42@xs4all.nl>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="jsaOSkhxGIjhH4GGhJOrNMBdOqPu2x1Jm"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jsaOSkhxGIjhH4GGhJOrNMBdOqPu2x1Jm
Content-Type: multipart/mixed; boundary="F1TZa4LVVBkdKuZnYvsAFw93nHVD75JsO";
 protected-headers="v1"
From: Florian Echtler <floe@butterbrot.org>
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-input <linux-input@vger.kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Message-ID: <add1e8aa-1b6c-b405-610f-585540835751@butterbrot.org>
Subject: Re: [PATCH] input/touchscreen/sur40: use COLORSPACE_RAW
References: <25bfb7ad-0c12-3d47-81b1-6feb1906cd42@xs4all.nl>
In-Reply-To: <25bfb7ad-0c12-3d47-81b1-6feb1906cd42@xs4all.nl>

--F1TZa4LVVBkdKuZnYvsAFw93nHVD75JsO
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 26.06.19 11:52, Hans Verkuil wrote:
> This driver set the colorspace to SRGB, but that makes no sense for
> a touchscreen. Use RAW instead. This also ensures consistency with the
> v4l_pix_format_touch() call that's used in v4l2-ioctl.c.

One question for clarification: this will only affect userspace applicati=
ons
which explicitly request a certain colorspace, correct?

Best regards, Florian
--=20
SENT FROM MY DEC VT50 TERMINAL


--F1TZa4LVVBkdKuZnYvsAFw93nHVD75JsO--

--jsaOSkhxGIjhH4GGhJOrNMBdOqPu2x1Jm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQST4FP0cQIAgRXjMjXsLPKyEa9q2AUCXRR6gwAKCRDsLPKyEa9q
2C+JAJ92ttrLtYWihQ0SGxDBI16wUorgiACeLapM9+s+dE09P2mGDbKgUEV2TdM=
=tulV
-----END PGP SIGNATURE-----

--jsaOSkhxGIjhH4GGhJOrNMBdOqPu2x1Jm--
