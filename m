Return-Path: <linux-media+bounces-23604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E80E9F4E96
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 15:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70B287AA0FE
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 14:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAE21F707C;
	Tue, 17 Dec 2024 14:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/KRZSxP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830571F3D55;
	Tue, 17 Dec 2024 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734447376; cv=none; b=SXkZvr0oF6U5gpPhejtWheg8N9Wt9QpFwJHjYjgrGfZs87pCE7FhjrbJvW5RziLGym95LfbZRPbLxmFe4k4fr7lRsy6+YI1KUM3MrviJ4WLerSqxEk+EEK11auMC4MXil0YMaZxpFbNp+pD64ZW/rnSJjUI2NFK/ncBaJLo8HvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734447376; c=relaxed/simple;
	bh=+1b0giH4mQ1kvRKRXAuU3ppu2XOaN20hSE8ekmup+Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BVezM7cyjI5svcT3DD4WgkdDHa+hunApwXTMCbB9IZc6UQ11WrMacKNr90Hfr7SThX7XUDVCi2l54oYPDa7/N8+FUV+cSPJ3eSjyL2Mg9x9njgZCHC7XvBmdTf95Q2sSPZc2U4YnyzGv8u2ktrfdb2DmhJUyzNKR7u176E2lXUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/KRZSxP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA06C4CED3;
	Tue, 17 Dec 2024 14:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734447374;
	bh=+1b0giH4mQ1kvRKRXAuU3ppu2XOaN20hSE8ekmup+Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J/KRZSxPyJd5lkQr5mOFplcvFFPr18dYSP+hoYVVE+U7Kgp0/Gv28d7TRTF6geQyD
	 uQaPkk52VHV1Bdh5wrqW7TE0Ra+v3iZ63LlDl6fOF6e//Ks9bokRixdXzJD3xQ1KL1
	 XQYTwxbdFl6/42Yqm0d5SQad/j7b5YZmCWxFYeoOQH9QFajt5xhxKLk+84Gs3W4bmL
	 KvHI3n5c2AbGe7XB/u4eFjYPdyriWuBsMhWp0H9qmdoIhdGjwcwZasM1ZglIdd/bxx
	 YQer23792ncULPt6A3LqtGwBYjJCWvJzBrisfAR1jVVn917ajRVNZ/q8AKbJUZhuia
	 1Z2Ve2ZErSFsg==
Date: Tue, 17 Dec 2024 08:56:12 -0600
From: Rob Herring <robh@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: usb-device: Add panel-location
Message-ID: <20241217145612.GA1652259-robh@kernel.org>
References: <20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org>

On Thu, Dec 12, 2024 at 09:44:37PM +0000, Ricardo Ribalda wrote:
> For some devices like cameras the system needs to know where they are
> mounted.

Why do you need this and why only this property and not the dozens 
others ACPI has?

> 
> ACPI has a property for this purpose, which is parsed by
> acpi_get_physical_device_location():
> https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device
> 
> In DT we have similar property for video-interface-devices called
> orientation, but it is limited to the requirements of video devices:
> Documentation/devicetree/bindings/media/video-interface-devices.yaml
> 
> Add a new property for usb-devices that matches the behavior of
> ACPI's _PLD.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  Documentation/devicetree/bindings/usb/usb-device.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
> index da890ee60ce6..1ce79c1c3b31 100644
> --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> @@ -42,6 +42,20 @@ properties:
>        port to which this device is attached. The range is 1-255.
>      maxItems: 1
>  
> +  panel-location:
> +    description: Describes which panel surface of the system's housing the USB
> +      device resides on. It has the same meaning as the `ACPI`'s `_PLD` Panel
> +      object.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # Top.
> +      - 1 # Bottom.
> +      - 2 # Left.
> +      - 3 # Right.
> +      - 4 # Front (aka as User Facing).
> +      - 5 # Back (aka as World Facing).
> +      - 6 # Unknown.
> +
>    "#address-cells":
>      description: should be 1 for hub nodes with device nodes,
>        should be 2 for device nodes with interface nodes.
> 
> ---
> base-commit: eefa7a9c069908412f8f5d15833901d1b46ae1b2
> change-id: 20241212-usb-orientation-8e3717ebb02a
> 
> Best regards,
> -- 
> Ricardo Ribalda <ribalda@chromium.org>
> 

