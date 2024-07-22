Return-Path: <linux-media+bounces-15265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A1B939197
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 17:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 924401F21B60
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 15:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650E916E863;
	Mon, 22 Jul 2024 15:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I/vT0bEW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DD016DED1;
	Mon, 22 Jul 2024 15:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721661455; cv=none; b=qJV66uPNhoFvWTFwT+aVBjLqzf3xHAwWVMqdZ+7LsF7wEjSw92eHPuUmWbFIl0LPkU7myG2rObQ9LYI2ngGYoJX4iXv1BjvrDwaIIH2iH5d9T9eCxyOiOuHZWluaRa7vmL1TOJQPlfxcMex6l0Qqr30gOWb3sxjxgGSvEwdVuag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721661455; c=relaxed/simple;
	bh=cat5kl9jQ6H8wJOadGHB1eSOIka6msg1ntjw2NaqBkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqJhIkMRQ4e1LE9awC/urfRwh35TfHnvyB+LWaGmnWh4/yqaMQYldzGfj/zX3BQUcue7PgW1IVtFAil5r+6S0Bf0iQmUbMjGMOEefNFs8ut4w8qxP5MszgZnZutfc8H4GVs5MzcdJv3rdxz5w1tjvxtFIYgvlA//tqAIdODnze0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I/vT0bEW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F96A2B3;
	Mon, 22 Jul 2024 17:16:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721661410;
	bh=cat5kl9jQ6H8wJOadGHB1eSOIka6msg1ntjw2NaqBkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I/vT0bEW709TkNuCnvVmKoD7KBEN0vcJrmGX4lWgiO67Iw5XBdQ+sjwixPBnx++zO
	 PIn24LJEsb+j5qmsqKjvTnuDmowwFcJbDBfH0ZhuuL342J2wXL482ZBUeRuePVRFwf
	 aVyGT6v/iQjI/XKn1O8Ihtj4oS2Ke65/qbMAhhA8=
Date: Mon, 22 Jul 2024 18:17:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 6/6] MAINTAINERS: Add entries for Toshiba Visconti
 Video Input Interface
Message-ID: <20240722151713.GE31490@pendragon.ideasonboard.com>
References: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
 <20240709000848.1108788-7-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709000848.1108788-7-yuji2.ishikawa@toshiba.co.jp>

Hi Ishikawa-san,

Thank you for the patch.

On Tue, Jul 09, 2024 at 09:08:48AM +0900, Yuji Ishikawa wrote:
> Added entries for visconti Video Input Interface driver, including;
> * device tree bindings
> * source files
> * documentation files
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changelog v2:
> - no change
> 
> Changelog v3:
> - added entry for driver API documentation
> 
> Changelog v4:
> - added entry for header file
> 
> Changelog v5:
> - no change
> 
> Changelog v6:
> - update path to VIIF driver source files
> 
> Changelog v7:
> - no change
> 
> Changelog v8:
> - rename bindings description file
> 
> Changelog v9:
> - no change
> 
> Changelog v10:
> - add a separate entry of VIIF driver
> 
> Changelog v11:
> - no change
> 
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3c4fdf74a3..f051f4ab34 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22734,6 +22734,17 @@ F:	Documentation/devicetree/bindings/media/i2c/tc358743.txt
>  F:	drivers/media/i2c/tc358743*
>  F:	include/media/i2c/tc358743.h
>  
> +TOSHIBA VISCONTI VIIF DRIVER
> +M:	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> +M:	Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/admin-guide/media/visconti-viif.*
> +F:	Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
> +F:	Documentation/userspace-api/media/v4l/metafmt-visconti-viif.rst
> +F:	drivers/media/platform/toshiba/visconti/
> +F:	include/uapi/linux/visconti_viif.h
> +
>  TOSHIBA WMI HOTKEYS DRIVER
>  M:	Azael Avalos <coproscefalo@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org

-- 
Regards,

Laurent Pinchart

