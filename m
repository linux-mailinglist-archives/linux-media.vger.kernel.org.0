Return-Path: <linux-media+bounces-42409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE531B54835
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 11:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90389171D30
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 09:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0129C2848A6;
	Fri, 12 Sep 2025 09:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KVsCRTZr"
X-Original-To: linux-media@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B673241663
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757670391; cv=none; b=pwbhx62RkOo/kD8GG31nKSnHIG+N9/0kvs5g+jwmqHrmZ15JXXIYEAroMKTQ/YvQXpmdOewwCOoec8DilnGFqn6a7TiVIVKqBKJPbFHR4A1ZkYw2LH93i3wiPBTpwIYHEVz7xfl1vFdDNsaI+EsFTyY0JKK1+RhPUJRyDFQ91C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757670391; c=relaxed/simple;
	bh=18QaPivvpbs2RaLR7+Z/JhsNBMB5R07jQG+uioWLDOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtbSE28FIr2ct5aRb00NzQF1cpm7ox8yUwJvWUP4lG0m3thitMlJOGk2zO5gG5hs6P9SgXDxJHXnkeeha4RcXCwopqP6uFj4OK8r/aLzeHkc4RmU8xWJS1vBYjJp7/SEDxZyXJBTE0SbJ9k1rfSlqirrbPYYbolkN9KXUIl3l3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KVsCRTZr; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 12 Sep 2025 15:15:53 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757670386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CPvY+gIRUaJ+o9UNC3uUVIC0hJMldSHBR8LX4cHih0E=;
	b=KVsCRTZrlnSyPsyGQMO779a1MA4KGRhnD+OvLd1VbduWW0NDixm3xmmkySBbpxNp8mZs5Q
	ljsottBjGTW0VLIGwpP4F0eUGjlhf2ERKbHoIa2RRUpKBYaQpt9V+8vrUrKbAVCepB57zv
	5SiBxKJ2nFev/feDOWKSByp8TXrb4Fw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: laurent.pinchart@ideasonboard.com, mripard@kernel.org, 
	y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com, vigneshr@ti.com, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de, 
	conor+dt@kernel.org, sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl, 
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com, changhuang.liang@starfivetech.com, 
	jack.zhu@starfivetech.com, sjoerd@collabora.com, hverkuil+cisco@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 00/16] media: cadence,ti: CSI2RX Multistream Support
Message-ID: <u6mfrp4ybddvuwgwtjefzp4mjzcdu46er7sdtznqmgtm445b3i@rowfoegkl7h4>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250911102832.1583440-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ew6pgjt7iz3rcyuq"
Content-Disposition: inline
In-Reply-To: <20250911102832.1583440-1-r-donadkar@ti.com>
X-Migadu-Flow: FLOW_OUT


--ew6pgjt7iz3rcyuq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 00/16] media: cadence,ti: CSI2RX Multistream Support
MIME-Version: 1.0

On Thu, 11 Sep 2025 15:58:16 +0530, Rishikesh Donadkar wrote:
> This series adds multi-stream support and PM support for Cadence CSI2RX
> and TI CSI2RX SHIM drivers.
>=20
> PM patches are picked from:
> https://lore.kernel.org/all/20250902-ti_csi_pm-v2-0-59a3be199940@ideasonb=
oard.com/
>=20
> PATCH 01 :    Remove word size alignment restriction on frame width
> PATCH 02-07:  Support multiple DMA contexts/video nodes in TI CSI2RX
> PATCH 08-09:  Use get_frame_desc to propagate virtual channel
>               information across Cadence and TI CSI-RX subdevs
> PATCH 10-11:  Use new multi-stream APIs across the drivers to support
>               multiplexed cameras from sources like UB960 (FPDLink)
> PATCH 12:     Optimize stream on by submitting all queued buffers to DMA
> PATCH 13:     Change the drain architecture to support multi-stream and
>               implement completion barriers for last drain.
> PATCH 14-16:  Runtime PM and System PM support for CSI-RX.
>=20
> [...]

Applied, thanks!

[01/16] media: ti: j721e-csi2rx: Remove word size alignment on frame width
        commit: 1c9700339fa03322b93250f4c5230cfe56699da8
[02/16] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
        commit: e68618974943c3c890e74129828aeb5446c881e0
[03/16] media: ti: j721e-csi2rx: separate out device and context
        commit: dd777697ea891159c8945f1b10507d4505e9bfd5
[04/16] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
        commit: 3774446f009438fbc16f16ffab2f66b2f16ce083
[05/16] media: ti: j721e-csi2rx: allocate DMA channel based on context index
        commit: 17cfe31a25598f520d8fdcb58a6f9d260a15d018
[06/16] media: ti: j721e-csi2rx: add a subdev for the core device
        commit: 9b52e6fc0ab094734fe5700681ad37c76a25efae
[07/16] media: ti: j721e-csi2rx: get number of contexts from device tree
        commit: 267acec4a9fed35a3b56644a44a3cbb7f41ee8ed
[08/16] media: cadence: csi2rx: add get_frame_desc wrapper
        commit: ff0230dcd5b7400f2f0bfff4b54d6edeb728d48e
[09/16] media: ti: j721e-csi2rx: add support for processing virtual channels
        commit: b54a9e4352a6fc404a547bc654755fdfc7f78fec
[10/16] media: cadence: csi2rx: add multistream support
        commit: 8137d27fe3417c163b901085b917acbeeaa768b6
[11/16] media: ti: j721e-csi2rx: add multistream support
        commit: ce08035f3c477445f97f8c9a9a8c91e143ed4232
[12/16] media: ti: j721e-csi2rx: Submit all available buffers
        commit: a511f813d4018fd3d2d552b017e8882777b22926
[13/16] media: ti: j721e-csi2rx: Change the drain architecture for multistr=
eam
        commit: e420b12e79f2fb8079cc35cee2e7c80fcbfa78ec
[14/16] media: cadence: csi2rx: Support runtime PM
        commit: d900df7c657609c125ca92a4b70add5cf05449f6
[15/16] media: ti: j721e-csi2rx: Support runtime suspend
        commit: f65a312b06ff948e3a7d480fd0cd7272aac6990a
[16/16] media: ti: j721e-csi2rx: Support system suspend using pm_notifier
        commit: c694e74c651e79838e817a8c6644dc72cf80540d

Best regards,
--=20
Jai Luthra <jai.luthra@linux.dev>


--ew6pgjt7iz3rcyuq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmjD69EACgkQQ96R+SSa
cUXNBRAAmGdTeAzuB7vI2iaLVrfGlaYKh4pOJHUGiYMxKVvBuum8tfwV2tATW9jm
o+E2uUW4CnXgfn61H43i1PNAt7swKLL2IDcXzhaTP1yOAOlGotf4h1HyeQMLQQF4
UCSwWId/VA/DkcEMSnrSxnOAcuI+nSBd2fkZm1lUes3hz3LDSyB1/lr8khPkK3W2
GIaeeebUOfbgrnmkSpZaU+5WfgxmV0+8mteg0+m6jruH+KOjfAGQ0TE60Y+se/IX
pR9z46OJhRze3mp9zXdN0wqvEYssrxlRlvKhY2j1ejn5wAvKmdrSu5vW+hEYWwFn
P5m+7GSQfV1wspmSn/VRLgvfY+stcWjyNbdX/Y9TaZCt8+i14w/O1VyodwWVGz6x
H68KWWE9nOd7ia60ZJj1kY6RQUi7BAzqBhlTR9Al+xL+lc3kdKS95kytq1qOBHM2
x68U70Nb//mn+k7FPaz9rMDHRPSe4B8XlgVuSYpabrmM6h9R8HXAg1UtKJQTACki
Yv+0Rw9u9hlZucU2S6nv2oCSoyucvCK6QwULU3pWSbwEDd1Ip8cpCnWqB2UbLsiL
xStNxi+w4NW19DuTDcfExX2TiPIul0F1aex+eoEBfSCIZk9dGYE8i4dA/gla1+Hv
K4FHTbjlStEUAJRItqtZPJOvWTRQC+1WfaErITC1lUUUfOMn0OA=
=p7RI
-----END PGP SIGNATURE-----

--ew6pgjt7iz3rcyuq--

