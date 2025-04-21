Return-Path: <linux-media+bounces-30598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF77A95010
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 527801892F3B
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 11:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F4725FA0E;
	Mon, 21 Apr 2025 11:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v7C3ReX7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BCB1C84A8;
	Mon, 21 Apr 2025 11:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745234147; cv=none; b=udj7s3kpK5YjV3qvFcayRpMoItYMxIaf8Mn1LvdNoYnS22LuAUdNjzoc8CaUM39D4eWerqr01nS610ZcwJ0Zxf8cPw3qpE81GZSv9utxCSh7eUC0edf/0c06vNYnPLAOV+Ysq9NURLvsq2xuT/fJCq+HcyYYGaUaZ2Lg0Q+se2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745234147; c=relaxed/simple;
	bh=gb6H71H255jNIQkaN9PNs3CzBVkNE1XHrGeu4wvrND8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qL3CarB/vSsu0B9EEBqiVlZbwt5lL5ISsP2Igc+Qz7NaZkLOmq74OkAM1gt50mtGqOFG6BNNda/qVmswdt/TQTp2wamoyaFazF5OZb0JNWEW0YJ+XaB/NZ6dd1BikHCaXyCtvWYw5LpwKeUB72T6CB6CPUQF4MVjfalW3/Kxbi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v7C3ReX7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E28D6D5;
	Mon, 21 Apr 2025 13:13:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745234016;
	bh=gb6H71H255jNIQkaN9PNs3CzBVkNE1XHrGeu4wvrND8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v7C3ReX7dAS7/S+1xECf/hq7AKFeoHuwwvUK9RU53N2mLm6QGkp5YCW1tV24ILlW0
	 Tfwcy30tsWQeX9qG/EXO9gJlZus5ODLcZ9A2RNYpVzak3c3bW40qcpYowpxoTz9eTJ
	 sQnuKVtk6V9en9dY9MOrARsyXDtaQ0XpHfhy2ZVs=
Date: Mon, 21 Apr 2025 14:15:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, mripard@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	devarsht@ti.com, y-abhilashchandra@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	vaishnav.a@ti.com, s-jain1@ti.com, vigneshr@ti.com,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com
Subject: Re: [PATCH v3 01/13] dt-bindings: media: ti,j721e-csi2rx-shim:
 Support 32 dma chans
Message-ID: <20250421111541.GA29483@pendragon.ideasonboard.com>
References: <20250417065554.437541-1-r-donadkar@ti.com>
 <20250417065554.437541-2-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065554.437541-2-r-donadkar@ti.com>

Hi Rishikesh,

Thank you for the patch.

On Thu, Apr 17, 2025 at 12:25:42PM +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> The CSI2RX SHIM IP can support 32x DMA channels. These can be used to
> split incoming "streams" of data on the CSI-RX port, distinguished by
> MIPI Virtual Channel (or Data Type), into different locations in memory.
> 
> Actual number of DMA channels allocated to CSI-RX is dependent on the
> usecase, and can be modified using the K3 Resource Partitioning tool [1].
> So set the minimum channels as 1 and maximum as 32.
> 
> Link: https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/10_00_07_04/exports/docs/linux/How_to_Guides/Host/K3_Resource_Partitioning_Tool.html [1]
> Link: https://www.ti.com/lit/pdf/spruiv7
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../bindings/media/ti,j721e-csi2rx-shim.yaml  | 39 +++++++++++++++++--
>  1 file changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
> index b9f033f2f3ce4..bf62998b0445a 100644
> --- a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
> +++ b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
> @@ -20,11 +20,44 @@ properties:
>      const: ti,j721e-csi2rx-shim
>  
>    dmas:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 32
>  
>    dma-names:
> +    minItems: 1
>      items:
>        - const: rx0
> +      - const: rx1
> +      - const: rx2
> +      - const: rx3
> +      - const: rx4
> +      - const: rx5
> +      - const: rx6
> +      - const: rx7
> +      - const: rx8
> +      - const: rx9
> +      - const: rx10
> +      - const: rx11
> +      - const: rx12
> +      - const: rx13
> +      - const: rx14
> +      - const: rx15
> +      - const: rx16
> +      - const: rx17
> +      - const: rx18
> +      - const: rx19
> +      - const: rx20
> +      - const: rx21
> +      - const: rx22
> +      - const: rx23
> +      - const: rx24
> +      - const: rx25
> +      - const: rx26
> +      - const: rx27
> +      - const: rx28
> +      - const: rx29
> +      - const: rx30
> +      - const: rx31
>  
>    reg:
>      maxItems: 1
> @@ -62,8 +95,8 @@ examples:
>  
>      ti_csi2rx0: ticsi2rx@4500000 {
>          compatible = "ti,j721e-csi2rx-shim";
> -        dmas = <&main_udmap 0x4940>;
> -        dma-names = "rx0";
> +        dmas = <&main_udmap 0x4940>, <&main_udmap 0x4941>;
> +        dma-names = "rx0", "rx1";
>          reg = <0x4500000 0x1000>;
>          power-domains = <&k3_pds 26 TI_SCI_PD_EXCLUSIVE>;
>          #address-cells = <1>;

-- 
Regards,

Laurent Pinchart

