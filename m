Return-Path: <linux-media+bounces-42510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C1CB57040
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 08:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 846D23BDA54
	for <lists+linux-media@lfdr.de>; Mon, 15 Sep 2025 06:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F121C281508;
	Mon, 15 Sep 2025 06:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N8eGrAd9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08E41D63F7;
	Mon, 15 Sep 2025 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757917750; cv=none; b=D4Vgh/dms3Uc4rRJduT2Uwg7VKRSPiUve1G1a54bahRvVm+15mgMevBkpmTuykjPSARiDRgZ724WWqkthDaqPuvFDJnwisVpUc1SOOsCtuy6IUvzJLFZPB2SrtpKS4PHwPTmwqjqFJ+FKoeZj+YcsHzm5BKrx8Vr91bd+uIfo0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757917750; c=relaxed/simple;
	bh=FFuT5NX7cpSgcO6YIvMO0vxOF71nhfjyErPRNz2NRlE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=khICXoLB0/8F/EF2+DN36v98v9AkIEm4O4k0Qf4OGhZOaJmB/2xhzgPT2kMO0NDvpWjsblvgHhaNQxgXULH7UZoodT/VlrgX3zulaVyg3d1la+TPoqsKfknZ9JwBXP6LQMo8a9STBQeyct6MxZED1mPJuEqbD3BQP+B1X3iIYGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N8eGrAd9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:2dbc:e233:e1b4:15e7:45cd])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9F34C71;
	Mon, 15 Sep 2025 08:27:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757917662;
	bh=FFuT5NX7cpSgcO6YIvMO0vxOF71nhfjyErPRNz2NRlE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=N8eGrAd9MUiqOeidydsQDMB8llNKt3+oErcHtEacsKpRhI4w+G5BWAvov5PRJtQJo
	 H4E06TmkcX2t2fVMnaxU/BKSJXIHZkgxf2zTgBNYp2KdShwfcYuuq5XQiXlJaZdA3Z
	 txCF0uH/TyIxkhpfWLrMF6dLrUn1cb63WwqwW+hI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <175758928516.1246375.13284167198046981915@ping.linuxembedded.co.uk>
References: <20250911-imx335_binning-v2-0-30a28df74df6@ideasonboard.com> <20250911-imx335_binning-v2-5-30a28df74df6@ideasonboard.com> <175758928516.1246375.13284167198046981915@ping.linuxembedded.co.uk>
Subject: Re: [PATCH v2 5/8] media: imx335: Handle runtime PM in leaf functions
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Tommaso Merciai <tomm.merciai@gmail.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Mon, 15 Sep 2025 11:58:53 +0530
Message-ID: <175791773319.7481.4286008141874758651@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Kieran,

Thanks for the review.

Quoting Kieran Bingham (2025-09-11 16:44:45)
> Quoting Jai Luthra (2025-09-11 09:14:21)
> > Simplify .s_stream callback implementation by moving the runtime PM
> > calls to the leaf functions. This patch should not affect any
> > functionality.
> >=20
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>=20
> Looks reasonable to me and although the stop_streaming function changes
> to no longer return a value - it was previously unused so no functional
> change indeed as far as I can see:

Yeah it was unused before. This anyway gets fixed when switching to streams
API in the last patch of the series.

>=20
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>=20
> > ---
> >  drivers/media/i2c/imx335.c | 51 ++++++++++++++++++++------------------=
--------
> >  1 file changed, 22 insertions(+), 29 deletions(-)
> >=20

Thanks,
    Jai

