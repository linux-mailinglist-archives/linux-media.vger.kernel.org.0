Return-Path: <linux-media+bounces-5291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F1A858066
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 16:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D62628530F
	for <lists+linux-media@lfdr.de>; Fri, 16 Feb 2024 15:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D03112F5A1;
	Fri, 16 Feb 2024 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iQo0M9TX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2978D12F58E;
	Fri, 16 Feb 2024 15:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708096443; cv=none; b=rSEcJSujusLll3RUAt82wl1jDnRtKf4fqHB7cisqpM+3DnaZvQALt/U36EU6cBT6acKN8d5RFtKg7DEvgUFyohH4P5MfQEQ7BGrwemVECbGhc4HZUZk8rlD+Xv/46rtD3LaJ/gtesko/SXgh62RQKmJkRy7Q0MbYDTRxVAdqD4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708096443; c=relaxed/simple;
	bh=BNsVDgqfv9dGmKX2WSwdTC2XUCyV/caGILyjWh5SUm0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Bq3xG5A6M2tY/Fj/OAk1gqC0PiatDi5R3mTWe/h0V3Ar27Xkd/DrvuBnLBXNq2aOWF4s45bHU7yiEcGzEHcCGPtplux6uUYdlgCE2AJvs6ZLF+6AjlOfRrBYmHvQnXOQoFpMh1NaFbamzOCfanmHq9c7XRT/uU6+IM9VLZ0Qz1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iQo0M9TX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F0296B3;
	Fri, 16 Feb 2024 16:13:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708096435;
	bh=BNsVDgqfv9dGmKX2WSwdTC2XUCyV/caGILyjWh5SUm0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iQo0M9TXbL+nqTdXe8p6gxJ44yN+pPUawTlpP41WND/40BauT/lOphq9DnkP/Tawv
	 FGTTYqAHhfN1dH74G29xCSEVuerpxoh7u7wS6/XcvmpF2YaiuCbsHGjJ4A+pdQp4RO
	 Y+eCdn5bfy+mvvOxn8jBch9Uk+xKq+6PRGt+iUhg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Zc8ppr4mE8ZgVNUs@kekkonen.localdomain>
References: <20240215204436.9194-1-umang.jain@ideasonboard.com> <20240215204436.9194-2-umang.jain@ideasonboard.com> <55d41858-b567-4e23-8d84-3af81b52d018@linaro.org> <Zc8ppr4mE8ZgVNUs@kekkonen.localdomain>
Subject: Re: [PATCH 1/2] media: dt-bindings: media: Add bindings for IMX283
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, willl will <will@willwhang.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Fri, 16 Feb 2024 15:13:57 +0000
Message-ID: <170809643706.2629073.1807694963113475412@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Sakari Ailus (2024-02-16 09:23:50)
> Hi Krzysztof, Umang,
>=20
> On Fri, Feb 16, 2024 at 09:03:49AM +0100, Krzysztof Kozlowski wrote:
> > > +        properties:
> > > +          data-lanes: true
> >=20
> > Provide constraints - which lanes/how many.
>=20
> Very probably only the number matters on this device. Therefore minimum a=
nd
> maximum should suffice. (Or an enum. 3 is probably an invalid number of
> lanes here, too.)

I think we can only support 4 lanes here. I heard rumour that it 'might'
be possible to support 2 lanes, but I haven't seen any documentation for
that and I don't think it's likely expected to be supported.

--
Kieran

>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

