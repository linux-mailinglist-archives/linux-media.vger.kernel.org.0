Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0BDD273CC0
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 09:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgIVHzb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 03:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIVHzb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 03:55:31 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E759C061755;
        Tue, 22 Sep 2020 00:55:31 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id n22so15290903edt.4;
        Tue, 22 Sep 2020 00:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DqVbTwbYiBxMrS1Mg/yzIA403pvGVRr5eBul8cO/rDM=;
        b=QAX7XmEbrrt8H/7JieE9bp/r7axLJQuiNARmOGUjQCoAd3DeGAYaygDIOMgsX4PUcS
         q6IGvEYwkax+qCwMPr++7Sd+iin5wON0y9ZQS49cKTCRMlzt0QSEGcGadZ/e3Do+G11f
         R9gOiOewwdAXJfZEBLqNvSAphJBTMn5eQHQz46UAdPC3qCi1Genn/acxidEGSa6xe1EN
         OkXwcLoOWs2hQk9gnBrHsgdZ5YJ4e9sXi6vmG0KqccL69PvtGzazOHe6c8jiDYlmwNyL
         2na3t7FBIox34tpU0Tnr4lmtrSp+PEUFmRAqbBU2eTEL9LOOVqQxmtfpF8qjqhh0bkvN
         75ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DqVbTwbYiBxMrS1Mg/yzIA403pvGVRr5eBul8cO/rDM=;
        b=VcLJDBjHttiHo47BaTx4kjD8xlzrGDVVCdWMrFiXsNyP96rl97tdtvqKtpFiftQhzE
         BGaJUW4NHHMto/CFrBttuvDv9Sl/vBPs6kBNtKAnxRWIKApuQ6Z3gnOGaUogTOFYCxFf
         0j45LhIBeHGaGJw4AJh0cwNgTzUKjzpUKuFgBls6gxYFd/JVQTsOKudXxU8ObFwWefoo
         eKh9L+FIiTTEY5B/G+Bndsi93IE1U8mrF4YegGA2WSVJWpUlEb6aMvcpKxyNAMXPyU9w
         jn2HEjkf8tLr4NiR1fKHFNRjyOrNUb87o0X6fHuWvGelu9OYL91OuiiWsIJMr/iI7yar
         H2ew==
X-Gm-Message-State: AOAM533E8wWL9TmE9qei7RVGkM++tW+ox/4f8o1Gm3tVLdLuyqIYADAA
        NTuXsT9jnruHfGSr1259skg=
X-Google-Smtp-Source: ABdhPJyuVCBdI8ZUu3wIFclXczhxXAR2rY3sI0ea8IZCKcsj/Nmb+lMRiBum29r9gHqjgZPSpUBTRw==
X-Received: by 2002:a50:84a2:: with SMTP id 31mr2725023edq.138.1600761330047;
        Tue, 22 Sep 2020 00:55:30 -0700 (PDT)
Received: from localhost (pd9e51aa4.dip0.t-ipconnect.de. [217.229.26.164])
        by smtp.gmail.com with ESMTPSA id z18sm11090511ejb.92.2020.09.22.00.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 00:55:28 -0700 (PDT)
Date:   Tue, 22 Sep 2020 09:55:28 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        jacopo+renesas@jmondi.org, luca@lucaceresoli.net,
        leonl@leopardimaging.com, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] media: i2c: imx274: Remove stop stream i2c writes
 during remove
Message-ID: <20200922075528.GD3994831@ulmo>
References: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
 <1600724379-7324-3-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FFoLq8A0u+X9iRU8"
Content-Disposition: inline
In-Reply-To: <1600724379-7324-3-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--FFoLq8A0u+X9iRU8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 02:39:38PM -0700, Sowjanya Komatineni wrote:
> Sensor should already be in standby during remove and there is no
> need to configure sensor registers for stream stop.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/media/i2c/imx274.c | 3 ---
>  1 file changed, 3 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--FFoLq8A0u+X9iRU8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9prfAACgkQ3SOs138+
s6G69BAAhqB7vtCBhhILEkJbiIMCfRIBCD0M5kFeQRcHWApvm/kaXybwaPyRSJGv
s4odjDaGktLwdR/i2BAXZ7NVu+0N6Yp427iLtuZjiXZTZOm3E5AGcrbOnibz1mRD
sdgmAzxdpuBU9ltOAmEAOlNUuJeEtyLccqBpmCSHzCfM9qmSlmzInARzLJOBDX//
jAwiNICrvrdRkZSbzFhXsyqDLfJf/+rj4cvtDx41p6SY9M/35bBR+IKc9RJEsM6G
xEUSqBMxlosn7vgCVmL8FjJIHz6/sBS/zHocYlylbqJwKat8NWgA+SP+WbRnDdDf
tTkRCjqCJP1n+duHohYR+f1TaG7NGNTts4ZtLQHmjAIpG4O3rJE92PFDJHB+h1EF
spuGgKVJpFaeqyXCrpS6JNt32QYx97WsgeiP1OPtMbXESeOBMa3JwVnCXj5my10B
n9A+QvmYtdq0bZoQuohfaZSQY/xXS3x1BIh+Zj+VHzjf0DILs2RlF+sQQiYJ7w7S
1OIao91R5342P1dTDo4l4TFJ8b+YkObs5EIvmD6oB+3R8r602D35IgzFuqy0ECMG
lKbd/sr/qQHZyTljEKj7c/lnBe0H8fS1F9JGxfjjVpuH0x5wDbwZXXScJK7rIpy+
NlkVyjNq21RYsWAiSVLrEiveiQWcpr81QK1udHI7M6LVmVBecco=
=IiTc
-----END PGP SIGNATURE-----

--FFoLq8A0u+X9iRU8--
