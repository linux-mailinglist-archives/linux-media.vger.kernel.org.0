Return-Path: <linux-media+bounces-14458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E5B91DB6D
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 11:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6A8F283276
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 09:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50AE44DA13;
	Mon,  1 Jul 2024 09:30:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E1D9475
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 09:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719826243; cv=none; b=M1M2WvHP68RHO00+0K/evWTAOs2xhsrVw/caD8uXRTE5Gv37RIv2H6rWc4VctpQUesD0sBUszH0jZdYc+ck079nRluhXt+A4tRmWCT5QXiD8MRP/GbcejCUI2HoTI/ZT0QXSnr1IqajMVQtrw6yBL9N5fyoIxCAK3fRJE3mWAU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719826243; c=relaxed/simple;
	bh=bXS05YXP29lYledT5VQ7UD9ves+9A8eAVmV+KKJbQtw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SHtjB7DSdPjpPJOzTCUvCEk7lY1S8ll/wqkp1uibwTJGGR6fzO2bdQ26ifafGLMmnnzFEapAUNxIDA9DnsseVFuvR7+ySNI+WRTrcWtWoynP4o2hmelq8MTS/eTwpit6/WRakISgwm7QMrKBLWAU5ioGTfcDSzsfc5jym/rlUW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sODMj-00022u-9n; Mon, 01 Jul 2024 11:30:29 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sODMi-006L4k-Jt; Mon, 01 Jul 2024 11:30:28 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sODMi-000PmG-1m;
	Mon, 01 Jul 2024 11:30:28 +0200
Message-ID: <7dbda1952c9e873823d4e6d2a9534f1b3b945c4a.camel@pengutronix.de>
Subject: Re: [PATCH] media: imx-pxp: Rewrite coeff expression
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ricardo Ribalda <ribalda@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>
Date: Mon, 01 Jul 2024 11:30:28 +0200
In-Reply-To: <20240628-gcc5-v1-1-7cd56f04a6a8@chromium.org>
References: <20240628-gcc5-v1-1-7cd56f04a6a8@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Fr, 2024-06-28 at 15:11 +0000, Ricardo Ribalda wrote:
> GCC5 cannot figure out that the expressions are constant, and that
> triggers a build failure. Rewrite the expressions.
>=20
> The following gcc5 error is workaround:
>=20
>  #define BM_PXP_CSC1_COEF0_YCBCR_MODE 0x80000000
>                                       ^
>     BM_PXP_CSC1_COEF0_YCBCR_MODE |
>     ^
>  #define BM_PXP_CSC1_COEF0_YCBCR_MODE 0x80000000
>                                       ^
>=20
> drivers/media/platform/nxp/imx-pxp.c: In function 'pxp_setup_csc':
> drivers/media/platform/nxp/imx-pxp.h:582:38: error: initializer element i=
s not constant
> drivers/media/platform/nxp/imx-pxp.c:374:4: note: in expansion of macro '=
BM_PXP_CSC1_COEF0_YCBCR_MODE'
> drivers/media/platform/nxp/imx-pxp.h:582:38: note: (near initialization f=
or 'csc1_coef_bt601_lim[0]')
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Can you elaborate on how this is triggered?

At least I couldn't reproduce this by just copy & pasting the
csc1_coef_bt601_lim initializer and the required macros into gcc 5.4 on
godbolt.

Can this be fixed by using GENMASK / FIELD_PREP instead?

regards
Philipp

