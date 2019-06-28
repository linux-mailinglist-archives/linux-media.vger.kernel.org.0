Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7437C594AC
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 09:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbfF1HR5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 03:17:57 -0400
Received: from butterbrot.org ([176.9.106.16]:42439 "EHLO butterbrot.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726719AbfF1HR5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 03:17:57 -0400
Received: from [192.168.178.26] (unknown [95.90.17.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by butterbrot.org (Postfix) with ESMTPSA id 87A554AE0266;
        Fri, 28 Jun 2019 09:17:54 +0200 (CEST)
Subject: Re: [PATCH] input/touchscreen/sur40: use COLORSPACE_RAW
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <25bfb7ad-0c12-3d47-81b1-6feb1906cd42@xs4all.nl>
 <add1e8aa-1b6c-b405-610f-585540835751@butterbrot.org>
 <238edc67-1d4b-205a-64ce-2bef711bf43f@xs4all.nl>
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
Message-ID: <d2cd083f-0643-7064-3660-3f5307c1e310@butterbrot.org>
Date:   Fri, 28 Jun 2019 09:17:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <238edc67-1d4b-205a-64ce-2bef711bf43f@xs4all.nl>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="KaJGdOWGe17E29lZuQDZBA5IXHHb3N01f"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KaJGdOWGe17E29lZuQDZBA5IXHHb3N01f
Content-Type: multipart/mixed; boundary="s3MVDHHnQfEegMLrSYa33y3LTxJryEY2x";
 protected-headers="v1"
From: Florian Echtler <floe@butterbrot.org>
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-input <linux-input@vger.kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Message-ID: <d2cd083f-0643-7064-3660-3f5307c1e310@butterbrot.org>
Subject: Re: [PATCH] input/touchscreen/sur40: use COLORSPACE_RAW
References: <25bfb7ad-0c12-3d47-81b1-6feb1906cd42@xs4all.nl>
 <add1e8aa-1b6c-b405-610f-585540835751@butterbrot.org>
 <238edc67-1d4b-205a-64ce-2bef711bf43f@xs4all.nl>
In-Reply-To: <238edc67-1d4b-205a-64ce-2bef711bf43f@xs4all.nl>

--s3MVDHHnQfEegMLrSYa33y3LTxJryEY2x
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 27.06.19 10:20, Hans Verkuil wrote:
> On 6/27/19 10:12 AM, Florian Echtler wrote:
>> On 26.06.19 11:52, Hans Verkuil wrote:
>>> This driver set the colorspace to SRGB, but that makes no sense for
>>> a touchscreen. Use RAW instead. This also ensures consistency with th=
e
>>> v4l_pix_format_touch() call that's used in v4l2-ioctl.c.
>>
>> One question for clarification: this will only affect userspace applic=
ations
>> which explicitly request a certain colorspace, correct?
>=20
> You can't request a colorspace from userspace. The driver sets it.

What I meant is: ... will only affect applications which explicitly searc=
h for
formats with a specific colorspace value.

> In this case is it inconsistent anyway since VIDIOC_S_FMT will return R=
AW
> (due to the v4l_pix_format_touch() call), but G/TRY_FMT will return SRG=
B
> from the driver. TRY_FMT should return RAW as well, but it didn't call
> v4l_pix_format_touch(), for which I posted a separate patch fixing that=
=2E

OK, understood.

Acked-by: Florian Echtler <floe@butterbrot.org>

Best regards, Florian
--=20
SENT FROM MY DEC VT50 TERMINAL


--s3MVDHHnQfEegMLrSYa33y3LTxJryEY2x--

--KaJGdOWGe17E29lZuQDZBA5IXHHb3N01f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQST4FP0cQIAgRXjMjXsLPKyEa9q2AUCXRW/HgAKCRDsLPKyEa9q
2OnbAJ4yDhxmfMiF1JAxUNXFgAYFhd1v5QCdH+yR/TYvDcgrqpDlll6NJE51foE=
=qMON
-----END PGP SIGNATURE-----

--KaJGdOWGe17E29lZuQDZBA5IXHHb3N01f--
