Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBE1D2AC57F
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 20:54:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730195AbgKITyB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 14:54:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbgKITyB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 14:54:01 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26EB5C0613CF;
        Mon,  9 Nov 2020 11:54:01 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id 53EE61F44F9B
Message-ID: <2f907743dbb77f4c2f871675070065dd372514be.camel@collabora.com>
Subject: Re: [PATCH 0/3] HDR10 static metadata
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reply-To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date:   Mon, 09 Nov 2020 14:53:55 -0500
In-Reply-To: <20201109173153.23720-1-stanimir.varbanov@linaro.org>
References: <20201109173153.23720-1-stanimir.varbanov@linaro.org>
Organization: Collabora
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
        boundary="=-s289bAYu8a41gujl5mQ2"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-s289bAYu8a41gujl5mQ2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 09 novembre 2020 =C3=A0 19:31 +0200, Stanimir Varbanov a =C3=A9cri=
t=C2=A0:
> Hello,
>=20
> This patchset adds two HDR10 HEVC v4l2 controls for Content Light Level
> and Mastering display colour volume plus implenmentation in Venus encoder
> driver.
>=20
> Comments are welcome!

It is not a formal review, but I did walked through the new API and
everything looks fine to me. One question though, are you aware that
the H.264/AVC equivalent is identical ? What is you plan for that ?

>=20
> regards,
> Stan
>=20
> Stanimir Varbanov (3):
> =C2=A0=C2=A0v4l: Add HDR10 HEVC static metadata controls
> =C2=A0=C2=A0docs: media: Document CLL and Mastering display
> =C2=A0=C2=A0venus: venc: Add support for CLL and Mastering display contro=
ls
>=20
> =C2=A0.../media/v4l/ext-ctrls-codec.rst             | 61 ++++++++++++++++=
+++
> =C2=A0drivers/media/platform/qcom/venus/core.h      |  3 +
> =C2=A0drivers/media/platform/qcom/venus/hfi_cmds.c  |  8 +++
> =C2=A0.../media/platform/qcom/venus/hfi_helper.h    | 20 ++++++
> =C2=A0drivers/media/platform/qcom/venus/venc.c      | 29 +++++++++
> =C2=A0.../media/platform/qcom/venus/venc_ctrls.c    | 16 ++++-
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls.c          | 61 ++++++++++++++++=
+++
> =C2=A0include/media/hevc-ctrls.h                    | 41 +++++++++++++
> =C2=A0include/media/v4l2-ctrls.h                    |  2 +
> =C2=A09 files changed, 240 insertions(+), 1 deletion(-)
>=20


--=-s289bAYu8a41gujl5mQ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCX6meUwAKCRBxUwItrAao
HI6NAJ4hGh10Yxuk5bvayyZGxO+wj3xrVQCfTBF/0PoT8QvRAdlUFA337PtFNT4=
=qK+H
-----END PGP SIGNATURE-----

--=-s289bAYu8a41gujl5mQ2--

