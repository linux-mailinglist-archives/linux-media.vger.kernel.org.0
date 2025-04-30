Return-Path: <linux-media+bounces-31463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B89D2AA4D54
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 15:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02B731BA1816
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 13:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6A525B1D2;
	Wed, 30 Apr 2025 13:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EPgxb5rN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414A624DFF3;
	Wed, 30 Apr 2025 13:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746019147; cv=none; b=axsni6cA1oppXuhubCo/fWjiXX7jzHRuv31S36PHa8jSD+JQs7wfShDHmeZEfHf3D4pWV9GpUyqZWJvYpZEEWoAtmCUxu8oRENRnhAPXQQ9iByWL3v1Cm7RyL11azDPKSQ2AR2G4p56oPf+aaexWKqxOFm5ISEFy4OTJsi43tqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746019147; c=relaxed/simple;
	bh=+KDMROeZ7s2Cm69JjTcB0iiwQi3LCIays5wrt+DL+54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfwKk/PGPwJY25g9/QirUioQqDX2JTFNJJ/tTH6nPWESDcC7fURUt/5wqubFoemoI1bldiVfx7WHxWH5tO5qLfOYYhlfxYgtPBFSgUxiAKCqspvFgq0lV4G1WgloUlJ99Otzos1+vquqixFFBOCIhq4mpvBiZIX5ZlcbTFk863I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EPgxb5rN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB74B725;
	Wed, 30 Apr 2025 15:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746019138;
	bh=+KDMROeZ7s2Cm69JjTcB0iiwQi3LCIays5wrt+DL+54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPgxb5rNDjCja/gJ/JzZAhyFLTOSdfvLt5dsGvPcqtK3GSuXLyAWVGTiVBVaJmyhF
	 dn78rUIFB7tfNKFwmkIq/a4deEGgyuafznT9K9TJtGUPPpscw0h3Qi1+fbFTP3v+mF
	 GZ752b/wV8H4awC207Yfs7s+iI3JPkFABM2DRBNw=
Date: Wed, 30 Apr 2025 16:18:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: sony,imx290: Update usage example
Message-ID: <20250430131856.GB25516@pendragon.ideasonboard.com>
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com>

On Wed, Apr 30, 2025 at 03:03:10PM +0200, Geert Uytterhoeven wrote:
> On Wed, 30 Apr 2025 at 14:58, Niklas Söderlund wrote:
> > Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable link
> > frequency and pixel rate") the driver expects two specific
> > link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> > (222750000, 148500000) operation. The driver fails to probe without
> > these exact settings.
> >
> > Update the example in the bindings to match this to make it easier for
> > users to incorporate this sensor in their device tree descriptions
> > without having to read the driver sources when the driver fails to
> > probe.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> > @@ -136,7 +136,7 @@ examples:
> >              port {
> >                  imx290_ep: endpoint {
> >                      data-lanes = <1 2 3 4>;
> > -                    link-frequencies = /bits/ 64 <445500000>;
> > +                    link-frequencies = /bits/ 64 <222750000 148500000>;
> >                      remote-endpoint = <&csiphy0_ep>;
> >                  };
> >              };
> 
> I guess the link-frequencies property should gain a rule that it
> needs two values, too?

The driver doesn't require two frequencies (unless I'm mistaken), it
could operate with a single one (albeit not in all resolutions), so I
don't think we should require two frequencies in the bindings.

-- 
Regards,

Laurent Pinchart

