Return-Path: <linux-media+bounces-9798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E53538ABA3A
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 10:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2233E1C20B0B
	for <lists+linux-media@lfdr.de>; Sat, 20 Apr 2024 08:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D5B14005;
	Sat, 20 Apr 2024 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jkKhZLeH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F417F
	for <linux-media@vger.kernel.org>; Sat, 20 Apr 2024 08:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713600745; cv=none; b=Gdo1PLG0LA8owXyiqZ79t+aUiWB06rdRjfJliJXrRk5JFj2Zu7Jgmu7NjY6AI/eoH0gTOa1Vaxywmi4nSEBMfad6TTIsEZHHvYu6DbCXzF9P4qcLEDlAEeuxq6dai72Wlnkg96YDs9l3R8YbG4Bme0aTUwrS8m7yexN4XKIw3NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713600745; c=relaxed/simple;
	bh=ns36l+oVCr/nemSpBVEZV57AgsFT/yNKKSk8HRL3zHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAgHYawpcQJSlmRpx3nP63lC7ix6YftXvzsV50k371/YteVv+vSEBUhhTk7PcnNSi7+pbFXr0QEF5+7y1Zjunvjl58wqWRK8hIKiuplL4YlDFILVswM9/bsGTs3ZTvZgIKmWxxhVGko+0PIb19OA5Db36q+Fh6X72WlekfZuQF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jkKhZLeH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 995302BC;
	Sat, 20 Apr 2024 10:11:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713600693;
	bh=ns36l+oVCr/nemSpBVEZV57AgsFT/yNKKSk8HRL3zHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jkKhZLeH2TS1EhcIiHM4VaFa8TaVPyBwhEN6w3Q0noAS5gDjR32kD5YdKM/VL7XBV
	 dwaw7wY464A/YfGA9ua+QxoImmm8Kgm+pl+2Yc7q+6MqAiKmHv0IZlRTxvJA/nPmz6
	 j2TAnyHQHDqPbPhMdYpdDf2ZUyIDO4EsxZkxAhUI=
Date: Sat, 20 Apr 2024 11:12:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 28/46] media: Documentation: Document non-CCS use of
 CCS embedded data format
Message-ID: <20240420081214.GQ6414@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-29-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240416193319.778192-29-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Tue, Apr 16, 2024 at 10:33:01PM +0300, Sakari Ailus wrote:
> The CCS embedded data format has multiple aspects (packing, encoding and
> the rest, including register addresses and semantics). Explicitly allow
> non-compliant embedded data to use the two former to reduce redundant
> documentation.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../userspace-api/media/drivers/camera-sensor.rst     | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 9f3b0da3ad0d..dc415b8f6c8e 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -123,3 +123,14 @@ In general, changing the embedded data format from the driver-configured values
>  is not supported. The height of the metadata is device-specific and the width
>  is that (or less of that) of the image width, as configured on the pixel data
>  stream.
> +
> +CCS and non-CCS embedded data
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Embedded data which is fully compliant with CCS definitions uses ``CCS embedded
> +data format <MEDIA-BUS-FMT-CCS-EMBEDDED>`` media bus code (level
> +3). Device-specific embedded data compliant with either MIPI CCS embedded data
> +levels 1 or 2 only shall not use CCS embedded data mbus code, but may refer to
> +CCS embedded data documentation with the level of conformance specified and omit
> +documenting these aspects of the format. The rest of the device-specific
> +embedded data format is documented in the context of the data format itself.

-- 
Regards,

Laurent Pinchart

