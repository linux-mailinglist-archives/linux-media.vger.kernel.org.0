Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55F35E8917
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2019 14:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388074AbfJ2NLT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Oct 2019 09:11:19 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34863 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728735AbfJ2NLT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Oct 2019 09:11:19 -0400
Received: by mail-wr1-f65.google.com with SMTP id l10so13600688wrb.2;
        Tue, 29 Oct 2019 06:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lOy+50HbhiDNUSRNP6Tk+R9ATVXD2Ivrcf+miXw/+zk=;
        b=N273QaeUMMg5/G7NhFeQNSiwOOm2NJBSomTG1nIIHXPioLXEx2op1tPUErCjPwYZ1y
         lrzlnR6XYK7EW444yxCynlyROimb3W6aXDiychkEVA9e/C4nF6w2tRBBYwCAo/+eHEdC
         Lx9jSZyDH1G52tXBKqHExRSG0hUndVFxo41SQFRcO1ODRax5kdkkS5EzyxQCSjvlxvyQ
         A4jXVN38LJqN135VvOy6hnz01yODyXZNzySyyQNCRqBFS8nPuuJo9pfguk082+34w+zo
         LWP5a5ZwGA1dOcfbSJw2eEoeBZK82oY8EMptmZjPAav08aLbyMy41ypBzbZ7fqqZOC8T
         Vbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lOy+50HbhiDNUSRNP6Tk+R9ATVXD2Ivrcf+miXw/+zk=;
        b=SjMKVwyZI/PhZuvhZAhF9/al0yXSvklEnQlPTgtp7YenveORKQYfLRr7ca/tiGFY9D
         84ClqwpgFsrYqQ1ACJlEAAlF5vm0b88Y+2Blaes/Igx1baxrhSNFZGyC/t6C5REC3lvQ
         dnTFL+DYkCUoLxMuEvOY/RTzjHW6sn+1xyx/+oTu0HEsBshKjTS5DimDXuvUm+pt2WD3
         UV6LZDfGfLwBhHjJUHRDKoivQmu3DB8lmUu8ADcxIhZWkL9e4joflBalik3SHabynEWi
         k0DVWF8oRQ06w+MOtGaPqpULmiRZI8R3CKebEl5b8UQvn1gW96P0MlVI5HJagX7AkmpT
         agHw==
X-Gm-Message-State: APjAAAVEfWQXUB5nAO5NJ91P/Zo2XA2dPJNxSosAj59x8NmVgZ1wT8vN
        56RGWh48b6kZZhWfxvkUHhU=
X-Google-Smtp-Source: APXvYqyGLTPwTw/sl2EL5ud0q8caMRZ8kJJQ1zVzYeUZVvi9Q7KJq+ugRmwdlYUx3TzuBscH4EOmjw==
X-Received: by 2002:a5d:4b51:: with SMTP id w17mr7392462wrs.357.1572354676692;
        Tue, 29 Oct 2019 06:11:16 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id j14sm17830079wrj.35.2019.10.29.06.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 06:11:15 -0700 (PDT)
Date:   Tue, 29 Oct 2019 14:11:13 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ARM: tegra: Enable Tegra VDE driver in tegra_defconfig
Message-ID: <20191029131113.GB508460@ulmo>
References: <20190623170730.5095-1-digetx@gmail.com>
 <20190623170730.5095-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline
In-Reply-To: <20190623170730.5095-3-digetx@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:07:25PM +0300, Dmitry Osipenko wrote:
> The video decoder driver was tested by time and works absolutely fine.
> The reason why it is in staging is because it doesn't provide common V4L
> interface yet, this shouldn't stop driver enabling in the defconfig since
> our userspace (libvdpau-tegra) provides combined acceleration of decoding
> and displaying without use of V4L.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> No changes since v1.
>=20
>  arch/arm/configs/tegra_defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Applied to for-5.5/arm/defconfig, thanks.

Thierry

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl24OnEACgkQ3SOs138+
s6Hsug/8D9ZjFD1Ul/3scNpLRp1IPnTWhhx+W0DZAVdANmT+CS6SbGdGwL2DeHGm
sTknFJzDEf7x1IOgajb5NcJioElqnPjE4fCQaCUSruNk1mKQjoef3nWlvGWrJxv6
CkLeOFt42etHWRUm47LlBEBhqMZzJ3yFudszWQK1Qm1rtJrfT31IQY14COZAQZQJ
cV98i/HGAmcmrWwPRTm2Kj3HzoZ+qtmFF5Cfk2HqIs7UPz8K4KaNGpbBalAo/6NC
rTVa0nkxIq/hIFKzJ2w8Wq8dJi+fqeaLGKzmzWt0Y9yKCkLRcGW3/jVo+3mSNKf2
a0Mvs1dWpVgiYvAcWuANX3sWDipX0qhyq4jvZ81mdsB0tFA25n3sC9gY3aVMphZO
iZTMA69bo0CIJZLceuTMB6KbMK5VQHgyDrDVJyOc45ZT8jZ4KYkXXmB+oBGJqRPA
/Jw14esu2ojr0Rv54QHzr9ttSypo6TpB70Hy5k0Co8lye3uziOQxcbPhcyWNt3au
Wqa1bczkQoOLaRrjQ/YHzsfAImkBRb3r1uhEhSuAhbhtKU0qXsbT4izhqCHKrjpS
b6NAOAYbA2kX0RPNjVBhGzR5tRS3vafubRYrtOud08HPmW5EFMmzqktn4FOeBVb9
07FZAlIhmhmnvremuifeN+1g4o1XGyloWEzgpA+0uXQitd090v8=
=q4xx
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
