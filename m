Return-Path: <linux-media+bounces-15466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D03D93F838
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 16:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C3F2283643
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 14:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607D6187871;
	Mon, 29 Jul 2024 14:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cufQ7Xnf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2363515535B;
	Mon, 29 Jul 2024 14:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722263245; cv=none; b=dTjnEfaMVxNRPSBt80w5pD/LmY9ZR1LrcNuHxppjhLlRrli1Hx53fqXHJSrM2xD1cK93Ovc4DjySRhkHvPSPmLcrbH1Rt+XG9CFVt/IkjiWZIWfzT3QUTYcCt4Jxj9P9M7dNMpA/LX1PDFGcvS42MvKORbfMsp0LKMsVdHGshvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722263245; c=relaxed/simple;
	bh=AK+wSo6Lpuz3DYRSOIQgQsGOzLG/dcVx5JqnxEj1CuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpfzOcYt1KFEM7K5K9G+8WOSzFm+QEZRB2ebHYKF/TN1dYlCctSfFDsi/oe6PApwgmLj7VMxYrHfDFIoYGM1wKXONefEaykkhZ3xvF2kFC8hCKLkU2oKa/OHqSYhkY91WHzMKOCc8jBVFPEcrYq07b3IoPRAPaKYGcgtMmrzYuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cufQ7Xnf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA7FC229;
	Mon, 29 Jul 2024 16:26:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722263196;
	bh=AK+wSo6Lpuz3DYRSOIQgQsGOzLG/dcVx5JqnxEj1CuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cufQ7XnfkOKYpnsW4gz9UIZ5YZjwDlaTNvqcEo0ivJvz1YsnQ71s5ePNT7/tgNXl2
	 chBn28OiUxutEBXD8vlsqu0z+R8/fYtsFZ5oMbymi9MEjrBQKIROWNFOslVgENCRkd
	 vLi2nnySTBwkSrqcCthtevkKjMLfKcHZ14YAZUSo=
Date: Mon, 29 Jul 2024 17:27:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-media@vger.kernel.org, stable@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: imx335: Mention reset-gpio polarity
Message-ID: <20240729142702.GC1552@pendragon.ideasonboard.com>
References: <20240729110437.199428-1-umang.jain@ideasonboard.com>
 <20240729110437.199428-2-umang.jain@ideasonboard.com>
 <20240729111006.GH2320@pendragon.ideasonboard.com>
 <2238e3e8-56f9-45e1-bd66-85953e091eb8@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2238e3e8-56f9-45e1-bd66-85953e091eb8@ideasonboard.com>

Hi Umang,

On Mon, Jul 29, 2024 at 05:36:11PM +0530, Umang Jain wrote:
> On 29/07/24 4:40 pm, Laurent Pinchart wrote:
> > On Mon, Jul 29, 2024 at 04:34:36PM +0530, Umang Jain wrote:
> >> Mention the reset-gpio polarity in the device tree bindings.
> >> It is GPIO_ACTIVE_LOW according to the datasheet.
> >>
> >> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> >> ---
> >>   Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> >> index 106c36ee966d..fb4c9d42ed1c 100644
> >> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> >> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
> >> @@ -92,6 +92,8 @@ examples:
> >>               ovdd-supply = <&camera_vddo_1v8>;
> >>               dvdd-supply = <&camera_vddd_1v2>;
> >>   
> >> +            reset-gpios = <&gpio 50 GPIO_ACTIVE_LOW>;
> >> +
> > I think it's good to include this in the example, but it doesn't match
> > the commit message. I was expecting to see a change to the binding
> > rules, not to the example.
> 
> Currently the binding already states reset-gpio as
> 
> ```
>    reset-gpios:
>      description: Reference to the GPIO connected to the XCLR pin, if any.
>      maxItems: 1
> ```
> 
> Pardon my limited knowledge here, do you mean something like :
> 
> ```
>    reset-gpios:
>      description: Reference to the GPIO connected to the XCLR pin 
> (active LOW), if any.
>      maxItems: 1
> ```
> 
> or something else?

No, I meant updating the commit message to something like:

dt-bindings: media: imx335: Add reset-gpios to the DT example

It's easy to get the polarity of GPIOs in the device tree wrong, as
shown by a recently fixed bug in the imx335 driver. To lower the chance
of future mistakes, especially in new bindings that would take the
imx335 binding as a starting point, add the reset-gpios property to the
DT example. This showcases the correct polarity of the XCLR signal for
Sony sensors in the most common case of the signal not being inverted on
the board.

> >>               port {
> >>                   imx335: endpoint {
> >>                       remote-endpoint = <&cam>;

-- 
Regards,

Laurent Pinchart

