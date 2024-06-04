Return-Path: <linux-media+bounces-12536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CCE8FB8BC
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 18:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF4C228944C
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2024 16:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859F514830A;
	Tue,  4 Jun 2024 16:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b8dBm8Yn"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E0C38396
	for <linux-media@vger.kernel.org>; Tue,  4 Jun 2024 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717518015; cv=none; b=dQOC0HUNDx8d2vavWSrFIcKL6Gm3J658YBA831e6o+qGNZxZPuSJH+kxrxalKOkU7YNNw6chwtUoueVNJA7vDnwmG7GguEuF1cV1zADay9Jc9niHUJGWrXpcifeU3h4bBlTG206HOtwRsGfekMMWpY0Amt0SPhv59nsbqU/Aw5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717518015; c=relaxed/simple;
	bh=d+tgkngD/cTC8oE3q056Nr1Cpxv1C1iu0exAwPJ/ch4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mxMREjfxVqpCnoe+mYaSwcdg0Kk4YgKE2cHOMXUsvG5DDTJIClUSnzHBgbXTpWANW8mVK8eyb1/z71EV920Da2CtX7K1EMule307ARtuuYVvnLIHkFhhViYRFSWc37jeRuGeK7W8IbzKe0iNy4+8c7SGs1leOfFN7LIIvPgtQwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b8dBm8Yn; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717518012;
	bh=d+tgkngD/cTC8oE3q056Nr1Cpxv1C1iu0exAwPJ/ch4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=b8dBm8YntT8kGsdBnaxleaVbxDUAovGY/IoJXE+Lj0fIrINLA7o9kguSFhCgidpaH
	 Fm2DzYiNubyyNk9e1KujOnNprITY0ivRg/kP2iN0kNwOBD6TsyOcjyLeLmOs2XidaQ
	 CYCrZEyqj2PngpjBI7Chs6Lsff9phguvrjocz9g6G49LDAOf9y9qYgcQqBn6xrwYyZ
	 oCTjrtn3kFSn2K9bHY16tuHtCDYnlvibuvqDl8nsWMrRWPBnC9H8TmVFxv6t/HpWNg
	 Xpy0xVDq2R5BMWiW1iheexv1H3wWS7xZL0fvyZAa/JBTt5ryN5k6yxnHjGTJsKiAKA
	 oqPxtSqOc2K3g==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4015537813E1;
	Tue,  4 Jun 2024 16:20:12 +0000 (UTC)
Message-ID: <dccc6a628e063a63d62713c6b7516977925866ef.camel@collabora.com>
Subject: Re: [PATCH] Documentation: Fix v4l2_ctrl_vp8_frame struct
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org
Date: Tue, 04 Jun 2024 12:20:09 -0400
In-Reply-To: <20240529222224.1582708-1-frkoenig@chromium.org>
References: <20240529222224.1582708-1-frkoenig@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 29 mai 2024 =C3=A0 15:22 -0700, Fritz Koenig a =C3=A9crit=C2=A0=
:
> Description and control were out of sync.
>=20
> Signed-off-by: Fritz Koenig <frkoenig@chromium.org>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../userspace-api/media/v4l/ext-ctrls-codec-stateless.rst     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-statel=
ess.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.r=
st
> index 786127b1e206..22bde00d42df 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec-stateless.rst
> @@ -971,8 +971,8 @@ FWHT Flags
>        - ``horizontal_scale``
>        - Horizontal scaling factor.
>      * - __u8
> -      - ``vertical_scaling factor``
> -      - Vertical scale.
> +      - ``vertical_scale``
> +      - Vertical scaling factor.
>      * - __u8
>        - ``version``
>        - Bitstream version.


