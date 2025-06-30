Return-Path: <linux-media+bounces-36333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62786AEE6C2
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 20:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A229F17F878
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 18:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CCA1EDA2F;
	Mon, 30 Jun 2025 18:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iWOD1r6r"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FDC1B5EB5;
	Mon, 30 Jun 2025 18:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751308292; cv=none; b=QUjC8BSUr9tyD4nbLmnAHIieVL5G65y3AWMVnxfHRzTa5iBaDuwMbKLfa6wSvhLc+CuZM+WsY7SKBbAeVnQFNL7DsmqkjF+SQ/Cm/2FqpRMTfoo03KMqgKiYXaBjF7HycR0aG8qjWcvZce7deA50M3eFtaBIu4WuJQ956/kycCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751308292; c=relaxed/simple;
	bh=QWChR3Bdm/NXwz4NQqvvVjxKeDXNgvFduFPy7gDqv0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRfn70WcopDRzk1N0ld7z40tqGjOMNFXR97OtOYaT4uFQWTSOeyt91UU46xDz0BrChEjmlEgkLa6l4dSKyOyXaBjEW8jFPBEcUBC9v5+aph29L89ciPisXzL3fPtOhU+iXxpo1q81JM8X7ycTDAmgh8Jp6TwPS4fGvvvt8c7IWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iWOD1r6r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EFCEF928;
	Mon, 30 Jun 2025 20:31:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751308268;
	bh=QWChR3Bdm/NXwz4NQqvvVjxKeDXNgvFduFPy7gDqv0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iWOD1r6r7qsDh4XzrvRYnEO4ppSt2wJKYZWZ9CMuw80d5WfZ7R5t+nu0Ht/aOQgse
	 UDZtSEEOYe/se0eEZzDsiBBXbeSOreocpnPnnew1YtaRlCzYmIQAxHZ3DEhFM7zlkb
	 Z6W1uZoukW9gI+0q/te9Z+3+bXg1lHg6EIm8jJYI=
Date: Mon, 30 Jun 2025 21:31:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, imx@lists.linux.dev
Subject: Re: Compatible vs onnn,model at ap1302 binding
Message-ID: <20250630183104.GB17697@pendragon.ideasonboard.com>
References: <aGLRbiqT8qVdG40z@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGLRbiqT8qVdG40z@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Jun 30, 2025 at 02:04:21PM -0400, Frank Li wrote:
> Hi Rob:
> 
> There are long discussion about AP1302 support.
> 
> https://lore.kernel.org/imx/20250623-ap1302-v3-0-c9ca5b791494@nxp.com/T/#m9ecad9fcbfd1ac1c59b3aa5737e3860a64db2eb4
> previous thread
> https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/
> 
> Let me summary the key points.

Thanks for the summary.

> AP1302 is I2C ISP processor, which can connect to some RAW sensors. such as
> AR0144. AR0144 can work alone, a RFC upstreaming at
> https://lore.kernel.org/linux-devicetree/20240630141802.15830-2-laurent.pinchart@ideasonboard.com/
> 
> When AR0144 connect to AP1302, it is not 100% transparents for software,
> It needs power supplies for it.
> 
> The basically there are two methods now.
> 
> Method 1 ( Laurent Pinchart purposed ):
> 
> use a vendor's specific property like model
> 
> camera@3c {
>         compatible = "onnn,ap1302";
>         ...
>         sensors {
>                 onnn,model = "onnn,ar0144";
>                 ^^^^
>                 sensor@0 {
>                         reg = <0>;
>                         vdd-supply = <&mt6358_vcamd_reg>;
>                         vaa-supply = <&mt6358_vcama1_reg>;
>                         vddio-supply = <&reg_1p8v_ext>;
>         ....
> 
> 
> Method 2 ( suggested by Rob at 2021 ):
> 
> use compatible string:
> 
> camera@3c {
>         compatible = "onnn,ap1302";
>         ...
>         ports {
>                 port@0 {
>                         compatible = "onnn,ar0144";
>                         ^^^^
>                         reg = <0>;
>                         vaa-supply = <&vaa_regulator>;
> 
>         ...
> 
> 
>                Method 2                              Mathod 1
> The same hardware should use the         There are not driver to match onnn,ar0144.
> same binding regardless connect to       AR0144 is not visilable from host point.
> which bus/devices
> 
>                                          compatible means software comaptible, but
>                                          there are not driver for it at this case.
> 
> reg in difference spi/i2c also have      reg is i2c's address, but here is port or
> difference means.                        sensor index.
> 
> Similar case for spi and i2c devices.    There are difference set of mandatory properties
>                                          when connect to ISP or SoC.
> 
> 
> Rob and Laurent Pinchart:
> 
>         Need a direction to move forwards!

There are two things to consider here. One is the DT property we want to
use to identify the sensor model. It can be argued that the "compatible"
property is widely used for this purpose. This is true, but the
"compatible" property is meant to indicate compatibility from an
operating system software point of view (regardless of which operating
system is used). As a result, it serves as the central piece around
which drivers are bound to devices, and therefore is also used to match
DT schemas for the device.

What we need here is to identify the sensor model, first and foremost to
load the corresponding AP1302 firmware, and to know which power supplies
the AP1302 driver needs to control for the sensor. Note that it would be
entirely feasible for the sensor power supplies to be connected to GPIOs
of the AP1302 and entirely controlled by the AP1302 firmware, but on
some designs those power supplies are connected to GPIOs of the main
SoC, and therefore need to be controlled by the AP1302 driver.

While I think a custom property is better, I could live with
"compatible" *iif* it does not imply at the corresponding DT schema for
the sensor is pulled in. The DT binding for the sensor when controlled
from the main SoC describe the properties of the sensor that are
required for that use case, and those only overlap slightly with the
properties of the sensor needed by the AP1302. Using "compatible" in
such a case would in my opinion be misleading as it would imply
compatibility with the sensor DT binding.

-- 
Regards,

Laurent Pinchart

