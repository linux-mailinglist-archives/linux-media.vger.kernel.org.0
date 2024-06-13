Return-Path: <linux-media+bounces-13128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC61B90603F
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 03:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37D8228489A
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 01:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB8FD530;
	Thu, 13 Jun 2024 01:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Sezacqbl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C67A8BEC;
	Thu, 13 Jun 2024 01:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718240645; cv=none; b=Y13sNSYhde5gyOMgKV8d30p+nbw3K5a2j8H+Dpd+siXPPkRYibq4j0cu3ADnVhMWSprTcJfB1zhbF/sjzYZNJe87eHZCjPt5yYKg5Kdf3qARzoU1KIrpPk8l8H2JgLT5QnK/ueQaLqxLlef5fczmAXjm08bE8mhjAUJIzI65VZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718240645; c=relaxed/simple;
	bh=eI6fr6y6BDbBbC7J2/cwrajhoyoAgMBifMm8zEHNPTY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=kE9Y2jkgDXpx3JJoimkwsI7hUqH8lFsg+JL+Sli65EwlmxgUJluq+TzpspRxYdFdp4982hiQJwA7K6qEhCJBz8Qi2lnl5uBB5OE+ab74Ec8Xw4SINqJXSqNP0mabgLbma4phpo88BHJi69CmocJlbDQU2Veel290mEgr3atNJmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Sezacqbl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EDAE4D0;
	Thu, 13 Jun 2024 03:03:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718240629;
	bh=eI6fr6y6BDbBbC7J2/cwrajhoyoAgMBifMm8zEHNPTY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SezacqblUV0M+VvWatCgzsFjZb251HxTCOoD/48aQu+qMllu8XtUlJUqK8cFbeM9L
	 RWEFSLHzVInRCdjcwYaCMKDXfkljSg+9Njn6UU6DRdHv2zVqTjkRwmz7u2ilO7rgPP
	 4K9DhjFaQxGup9aQiNwG07pJ/77NW9IupBnYjJs0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240612-md-drivers-media-common-v1-1-b5603c85f629@quicinc.com>
References: <20240612-md-drivers-media-common-v1-1-b5603c85f629@quicinc.com>
Subject: Re: [PATCH] usb: uvc: add missing MODULE_DESCRIPTION() macro
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jeff Johnson <quic_jjohnson@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Thu, 13 Jun 2024 02:04:00 +0100
Message-ID: <171824064052.2248009.2434759914694160537@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Jeff Johnson (2024-06-13 00:58:59)
> With ARCH=3Darm64, make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/uv=
c.o
>=20
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>=20
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  drivers/media/common/uvc.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/common/uvc.c b/drivers/media/common/uvc.c
> index 9c0ba7a6c185..c54c2268fee6 100644
> --- a/drivers/media/common/uvc.c
> +++ b/drivers/media/common/uvc.c
> @@ -180,4 +180,5 @@ const struct uvc_format_desc *uvc_format_by_guid(cons=
t u8 guid[16])
>  }
>  EXPORT_SYMBOL_GPL(uvc_format_by_guid);
> =20
> +MODULE_DESCRIPTION("USB Video Class common code");
>  MODULE_LICENSE("GPL");
>=20
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240612-md-drivers-media-common-01f67d64768a
>

