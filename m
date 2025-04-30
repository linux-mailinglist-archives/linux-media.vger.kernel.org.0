Return-Path: <linux-media+bounces-31476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8384AAA5120
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 18:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 258ED1BA6D0E
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 16:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D346326137F;
	Wed, 30 Apr 2025 16:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kNiibFZr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E6625F7B9;
	Wed, 30 Apr 2025 16:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746029097; cv=none; b=VwU7qYUN9CLeg8JVUbAy54qW+Vu+tBWVpjTvW3AcRPF0HSZdE78F3O9luVZnqR8FsXsRsc3vNagBdcWDAuV/E+cGxc2vOghwkMTf1jytsWOa9tuBO2J6+9s3RmsiSPTcYxeoufwQ4lmRuJvmG3pheXWOdSeMZK9hFH83/8c3llY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746029097; c=relaxed/simple;
	bh=2o8KjSOQ0kCQc1hrZro78LxSpcqLmTAbM8i12O3bEpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ui6uyv5vvk9p5eqm4aS6fL/UpsljyyNsVvEFcOp9/4cWEXgvLjH/4fDCpDz274ciYUuLG8AvgDDXzunhvq8i1C5GL5ePe1U+e8nUN6+MVrinSb61teGOmHqn9FIpHV0OtIlHLev8OTxZ/yG3wjXGTCOTAzYGAMHpwo8NS9n5mZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kNiibFZr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4372564;
	Wed, 30 Apr 2025 18:04:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746029087;
	bh=2o8KjSOQ0kCQc1hrZro78LxSpcqLmTAbM8i12O3bEpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNiibFZrKRe1wSBLrpTTP3Fe6bNB44rXCsWBXHfcWudkFx6OE4F9cVVAsjIcZqwXL
	 JS1LLfV9gIxTjWH0XMtl32ITUIeHt2olyVtU/XrYHgfwbbilKQ4It2oItrYfr6wMJT
	 2N5qg8xiYa6fl/XxBSSfEssYsqGocb5DpnCEZaEQ=
Date: Wed, 30 Apr 2025 19:04:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: sony,imx290: Update usage example
Message-ID: <20250430160445.GB31516@pendragon.ideasonboard.com>
References: <20250430125322.2808528-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVXrHVugCMoWkCRVGotOEeTuuJJ6rC7CC7Kf_seo3J5og@mail.gmail.com>
 <20250430131856.GB25516@pendragon.ideasonboard.com>
 <CAPY8ntBPSC6KZcBVt35QWx_ZPYwkSJSVzhhaXokbjkWJDVJRqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPY8ntBPSC6KZcBVt35QWx_ZPYwkSJSVzhhaXokbjkWJDVJRqA@mail.gmail.com>

On Wed, Apr 30, 2025 at 02:52:01PM +0100, Dave Stevenson wrote:
> On Wed, 30 Apr 2025 at 14:19, Laurent Pinchart wrote:
> > On Wed, Apr 30, 2025 at 03:03:10PM +0200, Geert Uytterhoeven wrote:
> > > On Wed, 30 Apr 2025 at 14:58, Niklas Söderlund wrote:
> > > > Since commit 98e0500eadb7 ("media: i2c: imx290: Add configurable link
> > > > frequency and pixel rate") the driver expects two specific
> > > > link-frequency settings 2-lane (445500000, 297000000) and 4-lane
> > > > (222750000, 148500000) operation. The driver fails to probe without
> > > > these exact settings.
> > > >
> > > > Update the example in the bindings to match this to make it easier for
> > > > users to incorporate this sensor in their device tree descriptions
> > > > without having to read the driver sources when the driver fails to
> > > > probe.
> > > >
> > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> > > > @@ -136,7 +136,7 @@ examples:
> > > >              port {
> > > >                  imx290_ep: endpoint {
> > > >                      data-lanes = <1 2 3 4>;
> > > > -                    link-frequencies = /bits/ 64 <445500000>;
> > > > +                    link-frequencies = /bits/ 64 <222750000 148500000>;
> > > >                      remote-endpoint = <&csiphy0_ep>;
> > > >                  };
> > > >              };
> > >
> > > I guess the link-frequencies property should gain a rule that it
> > > needs two values, too?
> >
> > The driver doesn't require two frequencies (unless I'm mistaken), it
> > could operate with a single one (albeit not in all resolutions), so I
> > don't think we should require two frequencies in the bindings.
> 
> The driver does require both due to 98e0500eadb7 ("media: i2c: imx290:
> Add configurable link frequency and pixel rate") and
> imx290_check_link_freqs()

I realized after sending the previous e-mail that I was indeed mistaken.
I thought the driver iterated over the DT link frequencies to check if
they're supported, but it goes the other way around.

> However I'd agree that it'd be better to make the driver accept just
> the one and make any compensations, rather than amend the binding. I'm
> happy to try and find a few minutes to make a patch for that.

That would be nice, thanks.

> My experience of this family of sensors says that we should be able to
> run any resolution at any link frequency, but it needs changes to
> HBLANK to ensure there is sufficient time per line.
> Dropping to the lower link freq for the 720p mode is only because that
> is what the datasheet describes for the precanned HD720p. The window
> cropping mode lists no such requirement, and yet could produce exactly
> that same 720p output.

And with more information about the INCKSEL registers we could possibly
even support other frequencies.

-- 
Regards,

Laurent Pinchart

