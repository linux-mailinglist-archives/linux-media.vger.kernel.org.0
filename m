Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 911C42B92D
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 18:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbfE0Qi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 12:38:26 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:59831 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbfE0QiZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 12:38:25 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D8D23C0007;
        Mon, 27 May 2019 16:38:17 +0000 (UTC)
Date:   Mon, 27 May 2019 18:39:25 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        mchehab@kernel.org, rajmohan.mani@intel.com
Subject: Re: [PATCH 2/5] staging: imgu: Fix struct ipu3_uapi_awb_fr_config_s
 alignment
Message-ID: <20190527163925.g4d4aaan2sgvcsq6@uno.localdomain>
References: <20190220111953.7886-1-sakari.ailus@linux.intel.com>
 <20190220111953.7886-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="icn2sgqufpremvym"
Content-Disposition: inline
In-Reply-To: <20190220111953.7886-3-sakari.ailus@linux.intel.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--icn2sgqufpremvym
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,
  what is the status of this patch?

When using the IPU3 header in libcamera we're hitting this very issue:

error: =E2=80=98ipu3_uapi_acc_param::awb_fr=E2=80=99 offset 36756 in =E2=80=
=98ipu3_uapi_acc_param=E2=80=99 isn=E2=80=99t aligned to 32
[-Werror=3Dpacked-not-aligned]

(Note that the warning is only reported in gcc8.3.0 from my testing not
by clang or older versions of gcc (5.4.0))

On Wed, Feb 20, 2019 at 01:19:50PM +0200, Sakari Ailus wrote:
> struct ipu3_uapi_awb_fr_config_s is labelled as to be aligned to 32 bytes
> but that's not the case in the ISP parameter struct of the driver, struct
> ipu3_uapi_acc_param which is packed.
>
> Also there is no need for the alignment as the struct is only handled by =
the
> driver. Remove the alignment from the struct.

Maybe I got mislead, but I thought memory access in the IPU3 DMA
engine should be 32 bytes aligned? Doesn't this apply here? Can we
safely drop the __aligned attribute?

I tend to think so, as all other members of 'struct
ipu3_uapi_acc_param' are not aligned.

With this confirmed:
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/st=
aging/media/ipu3/include/intel-ipu3.h
> index cbb62643172be..4cdb4c791ecec 100644
> --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> @@ -450,7 +450,7 @@ struct ipu3_uapi_awb_fr_config_s {
>  	__u32 bayer_sign;
>  	__u8 bayer_nf;
>  	__u8 reserved2[3];
> -} __aligned(32) __packed;
> +} __packed;
>
>  /**
>   * struct ipu3_uapi_4a_config - 4A config
> --
> 2.11.0
>

--icn2sgqufpremvym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlzsErwACgkQcjQGjxah
VjzXLBAAp83ww6Laepiw9ZZe9dHKG/1Y8qDzPKu/IRdvbCxTTaiPwSnFUXEUV8Ew
fSSOJFM1KcErdrxq9Ab6VofTceWbWPHfnSbCCjiUEaUtilsI4DUqjMwhBw/wbkTm
sojJD4DzXvilWhIMoynMrN3nizxJm8QPLkXGqeDabe7FB8chPh46t7IXiCnaRyj+
+3NEq+OmfzXUE4eLtdLotmAcIwD/9HWEi+M6OALTonjB/nE0qWtfyddl+LJTxDAs
yPgaelkU41rgFZxZcK98rcKzXPNQOzYoMzb4KFs8pZ7OebVOZnqe1qPky1CD4kqw
jyTEkZskuVtt2B4wc401iSkEwjm6dPfIJjh2lLt6bOb4NkNlH7H1o5qc75nRMMGk
mtWOqU9XkwShfGqXUtuQ2HdonIseVzhJ3RENmcoZsvlNA8yxaC9kszUT7ef/iDVq
+Xo/kpNwqdrd++z+NbDiTmq+uQiwGJ+ClBM36cnxFafjTwLk3AV2L+zbsNPvgA0k
9KK4pfp7Bws9WVxywuZ8rDDZpPyK4Upl6NgT9Nd9g8koZmaxsfGxd6sAjWnAgVjb
pHT8rAszvxxmvUrJkTP9tRB0Rh4VlKICgqtF8SCVc0QuDcFHPoKM9C/zbw5C7ZyP
Wd+peW6G/4nAOTYc+OpFQw+/Xw78wU0xC1DKNyhj40ou6grZc8M=
=/BHB
-----END PGP SIGNATURE-----

--icn2sgqufpremvym--
