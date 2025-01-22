Return-Path: <linux-media+bounces-25134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 999D7A192B4
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 14:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5A9E16274B
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 13:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD76A212FAA;
	Wed, 22 Jan 2025 13:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CspSiS5n"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B141B85E8;
	Wed, 22 Jan 2025 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737552993; cv=none; b=c8abzrOS9cneurXXg7d350GE4ncGNQ8UP/M1Nj/8bx5NNcLrUPwf0H0Um073vrXpcyNnB5vDGWAECpDIaMrbSukp62/R/Refl82a7XeVbVf2IrhqHqe/qNt5vZYZGX2SEQrVgNPTzkqxJs9EGN58SscrGVghtKnlLO52q8YAEwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737552993; c=relaxed/simple;
	bh=v4FqFwZI9koBH8eshwE7UhUAVsUdqMETsxf47WYqKSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDn04t3oEIyxNDdrdaTU+wHAV1p0RkcC+y5HfkM9o8YvgeUX93LL8xUvOA2ZScBxilEgGtd2yCXirxLv6oVpc0L4yidl9d8YTCIelE/poR/Vun184mMoIl5/pCLaqoPmJiRXxs/DTxKxqOZXX+83uNLqbayzn5IqW01Mv76X/0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CspSiS5n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4C93520;
	Wed, 22 Jan 2025 14:35:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737552926;
	bh=v4FqFwZI9koBH8eshwE7UhUAVsUdqMETsxf47WYqKSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CspSiS5nVu3BVmcD8tm4dJeTbMLb5NuzwI6dMwQpDPWajOG9eGwvQch+tbAt7/dcO
	 cgzqvG2cjIk9BxcAby3rceCgCGr9tNyN6/Ic8uup6y6aFvhyDjJQO3N6GSY1eJvghK
	 DAXDpNwGjsBX1at8ME1T4dF/Gh1I5SuLg+NcbGX4=
Date: Wed, 22 Jan 2025 14:36:25 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Keke Li <keke.li@amlogic.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v5 01/10] dt-bindings: media: Add
 amlogic,c3-mipi-csi2.yaml
Message-ID: <htggncswmu7on2btxkkzvhgrey3yvafjsedtpx3a5ze2gtyxb3@ecyuawmn6q2v>
References: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
 <20241227-c3isp-v5-1-c7124e762ff6@amlogic.com>
 <712ed366-233d-477b-b760-907b3d77a7db@linaro.org>
 <002e2ffc-3ef7-41aa-846f-3900694de675@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <002e2ffc-3ef7-41aa-846f-3900694de675@amlogic.com>

Hi Keke, Krzysztof

On Fri, Dec 27, 2024 at 03:38:14PM +0800, Keke Li wrote:
> Hi Krzysztof
>
> Thanks for your reply
>
> On 2024/12/27 15:19, Krzysztof Kozlowski wrote:
> > [You don't often get email from krzysztof.kozlowski@linaro.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > [ EXTERNAL EMAIL ]
> >
> > On 27/12/2024 08:09, Keke Li via B4 Relay wrote:
> > > From: Keke Li <keke.li@amlogic.com>
> > >
> > > c3-mipi-csi2 is used to receive mipi data from image sensor.
> > >
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Keke Li <keke.li@amlogic.com>
> > > ---
> > >   .../bindings/media/amlogic,c3-mipi-csi2.yaml       | 131 +++++++++++++++++++++
> > >   MAINTAINERS                                        |   6 +
> > >   2 files changed, 137 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
> > > new file mode 100644
> > > index 000000000000..76b68d1e7316
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
> > > @@ -0,0 +1,131 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/amlogic,c3-mipi-csi2.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Amlogic C3 MIPI CSI-2 receiver
> > > +
> > > +maintainers:
> > > +  - Keke Li <keke.li@amlogic.com>
> > > +
> > > +description:
> > > +  MIPI CSI-2 receiver contains CSI-2 RX PHY and host controller.
> > > +  It receives the MIPI data from the image sensor and sends MIPI data
> > > +  to MIPI adapter.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - amlogic,c3-mipi-csi2
> > > +
> > > +  reg:
> > > +    maxItems: 3
> > > +
> > > +  reg-names:
> > > +    items:
> > > +      - const: aphy
> > > +      - const: dphy
> > > +      - const: host
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 2
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: vapb
> > > +      - const: phy0
> > > +
> > > +  assigned-clocks: true
> > > +
> > > +  assigned-clock-rates: true
> > NAK
> >
> > Adding new properties *INVALIDATES REVIEW*. Otherwise you can sneak
> > whatever crap past reviewers.
> >
> > Drop all new properties and drop my review tag.
>
>
> OK, will drop all new properties and drop your review tag. Thanks
>

Krzysztof why should new properties added in-between two revisions be
dropped ?

I understand the "drop my tag if you make changes" but I don't get why
the newly added properties should be removed.

> >
> > Best regards,
> > Krzysztof
>

