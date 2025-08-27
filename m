Return-Path: <linux-media+bounces-41188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96372B38475
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 16:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BB8A5E7151
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 14:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A4035A29B;
	Wed, 27 Aug 2025 14:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CR+SKdFj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556F4298CDE;
	Wed, 27 Aug 2025 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756303805; cv=none; b=K5eGdW1FHBlig8HgtyzAFb9hZwwX7lLxkw0fGnhvuEYuW579VptcwuD7F0OJlEee06tJmjHsQQjtsP3KNGuvgzFXCeu4ZhHG4Bs6PY21LkPKg1KQmDv0lLb+EAmesP89m0nOf9OLAMsNB3jBfgtocct/H4np20dZTR1uTe8DZRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756303805; c=relaxed/simple;
	bh=8/Si6s7pD0alaFUOivWul7qGPTzCS3umWpEZiCw7aVU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=qPQbhIGuBidgjmHwpX5PR/jTJubOnZS7GiSKXnlU5bM0HL9r1nmJ7GbNFk/wp+TKkWh2eHIJhrQt1UZjlRgivWdwZmdZ7ed7YGBgDsDS2ArlHl4Jm6EqEZDyhAG8QP/F1ZWKdbTdEzXjluZTHGQZDW4kMBWddXL34L0yrcRaIOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CR+SKdFj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1331:996f:e361:948:c527])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7627D300E;
	Wed, 27 Aug 2025 16:08:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756303738;
	bh=8/Si6s7pD0alaFUOivWul7qGPTzCS3umWpEZiCw7aVU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CR+SKdFjPJdWsKZtpgyOrMOxnYNm0/ptxzF+AL5qPF1dQQEjmkUH6gW85nBy33aIu
	 TAianavEca1x6vXvpnEGbjsQQytvtzn1avU2X8RfR7QdLBPG/LMb4E550l5HnpoeU1
	 bWnjlIpJtUKvYXpDawYXvPspTZoyNiTbPRuiH7+I=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aK8CATf4EdcYcTe-@stanley.mountain>
References: <aK8CATf4EdcYcTe-@stanley.mountain>
Subject: Re: [PATCH next] media: ti: j721e-csi2rx: Fix NULL vs IS_ERR() bug in ti_csi2rx_request_max_ppc()
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@linux.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
To: Dan Carpenter <dan.carpenter@linaro.org>
Date: Wed, 27 Aug 2025 19:39:55 +0530
Message-ID: <175630379558.1633224.13627427442522908758@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Dan,

Quoting Dan Carpenter (2025-08-27 18:32:57)
> The media_entity_remote_source_pad_unique() function never returns NULL,
> it returns error pointers.  Change this check from a NULL check to an
> IS_ERR() check.
>=20
> Fixes: 31f91c5224cd ("media: ti: j721e-csi2rx: Support multiple pixels pe=
r clock")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/driv=
ers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 3992f8b754b7..b75aa363d1bf 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -497,7 +497,7 @@ static void ti_csi2rx_request_max_ppc(struct ti_csi2r=
x_dev *csi)
>         int ret;
> =20
>         pad =3D media_entity_remote_source_pad_unique(&csi->vdev.entity);
> -       if (!pad)
> +       if (IS_ERR(pad))

Argh, my bad. Thanks for the quick fix.

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

>                 return;
> =20
>         ret =3D cdns_csi2rx_negotiate_ppc(csi->source, pad->index, &ppc);
> --=20
> 2.47.2
>

