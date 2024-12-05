Return-Path: <linux-media+bounces-22714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D13B59E57D0
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 14:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF3E0163665
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2024 13:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E211E219A92;
	Thu,  5 Dec 2024 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uFPgp+9y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B451DED77;
	Thu,  5 Dec 2024 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406643; cv=none; b=i+ZotKmDLZWv6ZNWDEJl9Web2Gtl1pSZZ0BOvl19XKRd4VaOVR1PYTuKg1RxsPyyR4dYZ4IVGJaUpVGLNJlSog0Qf8TxUSyDIQwYkkZAmkaN9QaA/3qXWzLA14WQUdYS/4v+4NEJfVipTA8qmBgb+cSIRRQAhDccxSOni8BTdg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406643; c=relaxed/simple;
	bh=/5U1JU+ZMcLZxBZLpU1heNzEVTQDQXMJGFSCxWjhMt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXqdX5DwMpnKpMlLUjh2cV0hFvBFdTT1Of8MjfzTQdMtG95dMt1vFFVkBFQRJ5HxCFV6riSwMb9ULa8hdBpaH6knGwV9CQzLkGRfFaPDR9OCC6MJ4UELwpQsVXNVK0NhjYwB0uEYpPWKLKbP8YdzTUGAE7wM2gV+XsDRk2O4dtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uFPgp+9y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:883a:dd5a:60c0:2d2a:9a5a:1723])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F5653E;
	Thu,  5 Dec 2024 14:50:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733406611;
	bh=/5U1JU+ZMcLZxBZLpU1heNzEVTQDQXMJGFSCxWjhMt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFPgp+9yFOLbTvxh9ZQ6cdC6swc7G3CNoqm3Ric9OaQjsXZWycMdmrZJvdpbsjTku
	 N5mlPQ1mJUpL/VfMHAVBs86vi6kU+2ZMdA4YFL/r38mfeSRF8iqC6uH76LmvAd4YR5
	 fGbiKLlXRDO7uViwEJiaIBZgS9z3B64zLc6fqwwc=
Date: Thu, 5 Dec 2024 19:20:34 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 00/15] media: i2c: ds90ub9xx: Misc fixes and
 improvements
Message-ID: <rvcaonzaforq3dknypihqec3hpgtw4lqyla47u3psawis5rwe4@iruuxpsgx2lf>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fbaov25vsrbawpjb"
Content-Disposition: inline
In-Reply-To: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>


--fbaov25vsrbawpjb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/15] media: i2c: ds90ub9xx: Misc fixes and
 improvements
MIME-Version: 1.0

Hi Tomi,

On Dec 04, 2024 at 13:05:14 +0200, Tomi Valkeinen wrote:
> This series fixes various small issues in the drivers, and adds a few
> things (a couple of pixel formats and a debugging feature).
>=20
> It also takes a few steps in adding more i2c read/write error handlings
> to the drivers, but covers only the easy places.
>=20
> Adding error handling to all reads/writes needs more thinking, perhaps
> adding a "ret" parameter to the calls, similar to the cci_* functions,
> or perhaps adding helpers for writing multiple registers from a given
> table. Also, in some places rolling back from an error will require
> work.
>=20

With the minor comment addressed, for the series:

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Changes in v3:
> - Include bitfield.h for FIELD_PREP()
> - Cc stable for relevant fixes
> - Link to v2: https://lore.kernel.org/r/20241108-ub9xx-fixes-v2-0-c7db3b2=
ad89f@ideasonboard.com
>=20
> Changes in v2:
> - Address comments from Andy
> - Add two new patches:
> 	- media: i2c: ds90ub960: Fix shadowing of local variables
> 	- media: i2c: ds90ub960: Use HZ_PER_MHZ
> - Link to v1: https://lore.kernel.org/r/20241004-ub9xx-fixes-v1-0-e30a463=
3c786@ideasonboard.com
>=20
> ---
> Tomi Valkeinen (15):
>       media: i2c: ds90ub9x3: Fix extra fwnode_handle_put()
>       media: i2c: ds90ub960: Fix UB9702 refclk register access
>       media: i2c: ds90ub960: Fix use of non-existing registers on UB9702
>       media: i2c: ds90ub960: Fix logging SP & EQ status only for UB9702
>       media: i2c: ds90ub960: Fix UB9702 VC map
>       media: i2c: ds90ub960: Use HZ_PER_MHZ
>       media: i2c: ds90ub960: Add support for I2C_RX_ID
>       media: i2c: ds90ub960: Add RGB24, RAW8 and RAW10 formats
>       media: i2c: ds90ub953: Clear CRC errors in ub953_log_status()
>       media: i2c: ds90ub960: Drop unused indirect block define
>       media: i2c: ds90ub960: Reduce sleep in ub960_rxport_wait_locks()
>       media: i2c: ds90ub960: Handle errors in ub960_log_status_ub960_sp_e=
q()
>       media: i2c: ds90ub913: Add error handling to ub913_hw_init()
>       media: i2c: ds90ub953: Add error handling for i2c reads/writes
>       media: i2c: ds90ub960: Fix shadowing of local variables
>=20
>  drivers/media/i2c/ds90ub913.c |  26 ++++--
>  drivers/media/i2c/ds90ub953.c |  56 +++++++++----
>  drivers/media/i2c/ds90ub960.c | 186 ++++++++++++++++++++++++++++--------=
------
>  3 files changed, 187 insertions(+), 81 deletions(-)
> ---
> base-commit: adc218676eef25575469234709c2d87185ca223a
> change-id: 20241004-ub9xx-fixes-bba80dc48627
>=20
> Best regards,
> --=20
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>=20

--=20
Thanks,
Jai

--fbaov25vsrbawpjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmdRr6oACgkQQ96R+SSa
cUWnNw/+K53qqAin/fIWO9ZmwASPmXYW25XsXNteeOQ0WiZgREFeqcC0+12DE6TS
b1zwK6ZoQKbVwvQLn/y4uk0vQIaXL3195F7RTsC7sgGi3msMS/gv9cfj96bnmpEi
iW5iDA1GTRxKcWgjB8i+XyaLEpxeyt3bYdiPUSvbS+yTn6Bwaei30QwXzoZy9vaL
R4OiNm2ZmhWBJAJ8p7SIDR/PapTxAca1QViUT4cSHzjUe42tlgoFZu4MZfh6w9H+
5rjqTpC5mTUwoCO4wgHD3J1k0a1KcjF3Oz+umfPZ24dW6JaUXEkaVxIYBqCRCUSk
ZaT9xEmCHSSBinODt91YWmvf2W3WjuozxGgrQvBtEpihyRsePrJ554JiJr/P/OcS
s4asVTTM04hT+qfONNITdlP87kbzI0kxr2qOI21hweeRUAffLzWPFeDRhQqx2lC6
z7UkAUOI9at9lcPED+GMzGJ96RT7EnjgzmbTpRRue9hm526J8I8QIaPp0AOWhzGk
MPgZ8wx/vrsjtrW1teIQwZHsBlm6fq/ITsPqSUXkNRdv44LgKYLeEkHnPwYpeBFf
xo+Obo9xMU4g3lXJhE2ixCKG1qnwmosUwPZzgogFIYx1eX2Uk+JnAMltQXTSD93g
0mc56i/RLwjk36b9hZfdT392ng8FSHc7e0QYFL6lIWUJEiQ0cHI=
=KjYM
-----END PGP SIGNATURE-----

--fbaov25vsrbawpjb--

