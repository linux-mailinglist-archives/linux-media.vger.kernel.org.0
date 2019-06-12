Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E926A41FEA
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 10:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437382AbfFLIyg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 04:54:36 -0400
Received: from butterbrot.org ([176.9.106.16]:47224 "EHLO butterbrot.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731874AbfFLIyf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 04:54:35 -0400
X-Greylist: delayed 508 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Jun 2019 04:54:33 EDT
Received: from [141.54.178.119] (anna125.medien.uni-weimar.de [141.54.178.119])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by butterbrot.org (Postfix) with ESMTPSA id AD0264AE02E1;
        Wed, 12 Jun 2019 10:46:04 +0200 (CEST)
Subject: Re: [PATCH 5/7 RESEND] touchscreen/sur40: set device_caps in struct
 video_device
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-input <linux-input@vger.kernel.org>
References: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
 <1e12bc3d-3cb3-1f3d-b3bc-b25e3bf95523@xs4all.nl>
 <20190604160650.GA226219@dtor-ws>
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
Message-ID: <f5596ce1-8941-361d-4ce5-0f9a9ddc8cd7@butterbrot.org>
Date:   Wed, 12 Jun 2019 10:46:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190604160650.GA226219@dtor-ws>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="OmGGMxV5sU72RZx837H7iojT8jQpnxAZ8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OmGGMxV5sU72RZx837H7iojT8jQpnxAZ8
Content-Type: multipart/mixed; boundary="4SmceJjmQKnaZWHePL2qzCp5HwBk4ToVg";
 protected-headers="v1"
From: Florian Echtler <floe@butterbrot.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-input <linux-input@vger.kernel.org>
Message-ID: <f5596ce1-8941-361d-4ce5-0f9a9ddc8cd7@butterbrot.org>
Subject: Re: [PATCH 5/7 RESEND] touchscreen/sur40: set device_caps in struct
 video_device
References: <20190604111958.22331-1-hverkuil-cisco@xs4all.nl>
 <1e12bc3d-3cb3-1f3d-b3bc-b25e3bf95523@xs4all.nl>
 <20190604160650.GA226219@dtor-ws>
In-Reply-To: <20190604160650.GA226219@dtor-ws>

--4SmceJjmQKnaZWHePL2qzCp5HwBk4ToVg
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Sorry, didn't realize you'd also need my feedback. No complaints.

Acked-by: Florian Echtler <floe@butterbrot.org>

Best, Florian

On 04.06.19 18:06, Dmitry Torokhov wrote:
> Hi Hans,
>=20
> On Tue, Jun 04, 2019 at 02:36:27PM +0200, Hans Verkuil wrote:
>> Instead of filling in the struct v4l2_capability device_caps
>> field, fill in the struct video_device device_caps field.
>>
>> That way the V4L2 core knows what the capabilities of the
>> video device are.
>>
>> But this only really works if all drivers use this, so convert
>> this touchscreen driver accordingly.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: Florian Echtler <floe@butterbrot.org>
>> ---
>> Resend, adding Dmitry and linux-input to the CC list.
>>
>> Dmitry, if you want to take this through your tree, then that's OK by =
me.
>>
>> Alternatively, it can go through the media tree, but then I need your =
Ack.
>=20
> I am fine with it going through media tree.
>=20
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>=20
> Thanks.
>=20


--=20
SENT FROM MY DEC VT50 TERMINAL


--4SmceJjmQKnaZWHePL2qzCp5HwBk4ToVg--

--OmGGMxV5sU72RZx837H7iojT8jQpnxAZ8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQST4FP0cQIAgRXjMjXsLPKyEa9q2AUCXQC7yQAKCRDsLPKyEa9q
2FXqAKCgwgvkY+GadEcjmhn3sGrRJFYm7ACgkCxEuabz4oErXr0FbnQr0Ry7Z0s=
=kqrj
-----END PGP SIGNATURE-----

--OmGGMxV5sU72RZx837H7iojT8jQpnxAZ8--
