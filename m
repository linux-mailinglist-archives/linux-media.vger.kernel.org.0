Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC8742B937
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2019 18:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfE0Qnf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 May 2019 12:43:35 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:56697 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfE0Qnf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 May 2019 12:43:35 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D81C5C0008;
        Mon, 27 May 2019 16:43:32 +0000 (UTC)
Date:   Mon, 27 May 2019 18:44:41 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        mchehab@kernel.org, rajmohan.mani@intel.com
Subject: Re: [PATCH v2 1/4] staging: imgu: Address a compiler warning on
 alignment
Message-ID: <20190527164440.qtx2qqqwm7dfdlhr@uno.localdomain>
References: <20190301112400.24339-1-sakari.ailus@linux.intel.com>
 <20190301112400.24339-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mg72otxplmqd6hz3"
Content-Disposition: inline
In-Reply-To: <20190301112400.24339-2-sakari.ailus@linux.intel.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--mg72otxplmqd6hz3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Sakari,

On Fri, Mar 01, 2019 at 01:23:57PM +0200, Sakari Ailus wrote:
> Address a compiler warnings on alignment of struct ipu3_uapi_awb_fr_config_s
> by adding __attribute__((aligned(32))) to a struct member of that type as
> well.
>

Sorry, just noticed there was a v2.

This is how we momentary worked it around in libcamera, so my tag on
v1 also applies here too :)

Could I know why this is preferred compared to v1? Has the field to be
actually 32 bytes aligned?

Thanks
  j
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Tested-by: Rajmohan Mani <rajmohan.mani@intel.com>
> ---
>  drivers/staging/media/ipu3/include/intel-ipu3.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> index eb6f52aca9929..4a0e97b0cfd2b 100644
> --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> @@ -2472,7 +2472,7 @@ struct ipu3_uapi_acc_param {
>  	struct ipu3_uapi_yuvp1_yds_config yds2 __attribute__((aligned(32)));
>  	struct ipu3_uapi_yuvp2_tcc_static_config tcc __attribute__((aligned(32)));
>  	struct ipu3_uapi_anr_config anr;
> -	struct ipu3_uapi_awb_fr_config_s awb_fr;
> +	struct ipu3_uapi_awb_fr_config_s awb_fr __attribute__((aligned(32)));
>  	struct ipu3_uapi_ae_config ae;
>  	struct ipu3_uapi_af_config_s af;
>  	struct ipu3_uapi_awb_config awb;
> --
> 2.11.0
>

--mg72otxplmqd6hz3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlzsE/gACgkQcjQGjxah
Vjz2oQ//XN70WNDNk4pVfwF00Fgxo9yL0wGNJTFOgJGcMqnE6uoDBpS0u01KSFNs
smIQz5ZXobmvqJOHhNLWo+kVl+pIIHkkGmSIZI3Yxq1EvtXodg2XL7jEsvGFSp6d
UzeDMMucUwE6QhHeNhWK7t1Kgd9w9UaWsmlt6XhBIUTkx9abtIDHuoqtw/4VrXgA
GugKBsPkrX9Wnl49x0/MQJhY4Jy/RxLsnrdG8sC4Exx18TBl/F6el0kHkG/0vA+/
XDrmKTUBi4261kdT7X2XCyta/MGxKO5p7Jn8fF8diKZ2rynCPrYpEhU1wcgi1VYJ
Eg5xqnwIS7P9A1AXDW9ZWD90hT884ItjzDxAvSnV9xWegKMVM/XMcKp0UpRyWbvT
8TxHsOLvaKZ+aXD7u2V9Y5A2MSZs9TupAE5huqgI70E+m9dykjqxHw6WtoA9gIKt
8X1orAX9S/Dc1RySCHThMu70vFnvbPCEW01Bk6LKWbqL5+2jyZpbdnRve3c0OmDJ
2X2mmtahBGfk60AcnxSSRfsvbMevNJiPA4Id7c8wRbKWI+Iqn4qg15ZAWtf34KBc
RPQGIu1jyg1IzHD8dsx7xtGHnFhssCpQ+TIDcGPSBxZSmlW67eT6Lik7BrB6+FPn
ylaYWIVnMYa1q81dUJxvp4dwv+sri5vBBO/PWkdBcNIv/VxEeyM=
=nxls
-----END PGP SIGNATURE-----

--mg72otxplmqd6hz3--
