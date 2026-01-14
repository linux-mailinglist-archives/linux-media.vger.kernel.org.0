Return-Path: <linux-media+bounces-50650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80451D1D239
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 09:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D13530204B5
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 08:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB88A37F725;
	Wed, 14 Jan 2026 08:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H+kCVuP/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3848C37E2F8;
	Wed, 14 Jan 2026 08:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768379624; cv=none; b=auR7JTSbwmjpJn6vKAQDEdjQlAFU2+nUVmjwFZx2y+0+oa8ezgHD93CWo3VA3lPk0KF9DoUYI7bpex5UOyiGIguzZzafJra0OEydnQk8buivCc1bVa/eyEtoivs+enOmTc1+cxFAexHTIZDvazbGE31PP5kFQxgn6+nQs8r9L6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768379624; c=relaxed/simple;
	bh=SdOnQlW7B/5BOkOpSkztasF63ONbiG4MViw4r59Jczo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfSOpaj+dt8/tFxKCMW5MktL5AyHUFu8X97JXBCyAYN76vaxNbQZTJs/+lnkxjYZGWdZj2Hj5eVacK2Lv3xt1PnTaFHOpYeeOHK/oFKTXmwP+T6uqWiavRuHMvN9XLnmICvv8P2ZRblfu4v4MKp8H3RVsb6FII8/scmnLQsorhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H+kCVuP/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 824C1316;
	Wed, 14 Jan 2026 09:33:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768379592;
	bh=SdOnQlW7B/5BOkOpSkztasF63ONbiG4MViw4r59Jczo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+kCVuP/yBibKyA/dCuZin8bNqVedbrccHcitCmBtIhkAQo4g+md+4Ql4RmnvKXpy
	 fzxQxObiv82SPw09DmFrwzksChAF51H2wNX6kfH6Xs2Lk7DX+x0iQVdcavz2asF1rl
	 t4cetvj12+RkDoKkuQo4bPg+VfHXpmeqRUGtzrz8=
Date: Wed, 14 Jan 2026 10:33:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Del Regno <angelogioacchino.delregno@collabora.com>,
	Tianping Fang <tianping.fang@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Fix I2C bus node names in examples
Message-ID: <20260114083317.GH30544@pendragon.ideasonboard.com>
References: <20260114081322.53411-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114081322.53411-2-krzysztof.kozlowski@oss.qualcomm.com>

On Wed, Jan 14, 2026 at 09:13:23AM +0100, Krzysztof Kozlowski wrote:
> I2C bus node names are expected to be just "i2c", if there is just one
> such node in given example.  Replace remaining bad examples with
> scripted:
> 
>   git grep -l '\si2c[0-9] {' Documentation/devicetree/ | xargs sed -i -e 's/i2c[0-9] {/i2c {/'
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Like Rob's commit 20a72af11f41 ("dt-bindings: Fix SPI and I2C bus node
> names in examples"). I checked also for SPI.
> 
> Rebased on Rob's tree - can you pick it up directly? Applies also on
> linux-next, so I do not expect conflicts.
> ---
>  .../bindings/embedded-controller/lenovo,yoga-c630-ec.yaml       | 2 +-
>  Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml   | 2 +-
>  Documentation/devicetree/bindings/usb/ite,it5205.yaml           | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-c630-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-c630-ec.yaml
> index a029b38e8dc0..c88fbd6ad940 100644
> --- a/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-c630-ec.yaml
> +++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-c630-ec.yaml
> @@ -50,7 +50,7 @@ additionalProperties: false
>  examples:
>    - |+
>      #include <dt-bindings/interrupt-controller/irq.h>
> -    i2c1 {
> +    i2c {
>          clock-frequency = <400000>;
>  
>          #address-cells = <1>;
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> index a89f740214f7..dffd23ca4839 100644
> --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> @@ -95,7 +95,7 @@ examples:
>      #include <dt-bindings/gpio/gpio.h>
>      #include <dt-bindings/media/video-interfaces.h>
>  
> -    i2c0 {
> +    i2c {
>          #address-cells = <1>;
>          #size-cells = <0>;
>  
> diff --git a/Documentation/devicetree/bindings/usb/ite,it5205.yaml b/Documentation/devicetree/bindings/usb/ite,it5205.yaml
> index 889710733de5..045fcb41ac4b 100644
> --- a/Documentation/devicetree/bindings/usb/ite,it5205.yaml
> +++ b/Documentation/devicetree/bindings/usb/ite,it5205.yaml
> @@ -49,7 +49,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
> -    i2c2 {
> +    i2c {
>          #address-cells = <1>;
>          #size-cells = <0>;
>  

-- 
Regards,

Laurent Pinchart

