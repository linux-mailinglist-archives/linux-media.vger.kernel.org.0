Return-Path: <linux-media+bounces-24212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 587E79FF9B6
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 14:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29951162A47
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 13:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E851ADFF8;
	Thu,  2 Jan 2025 13:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gRT8wAz8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AD64689;
	Thu,  2 Jan 2025 13:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735823801; cv=none; b=VdqitmlqSYo4n69XtbzIdJJ4PMbnkbjg4GRSVCTQQNMATyO9K9nP+WAhjU+POOEss+hsVLyDMawH7+WmkwSWy+FOLa8aimJ0r2jcF8dq89Ij0Z9PYmRULkNdUaKn2yI9D+b9gkvT+m2YJt2HndVCWcypBavnfI3oHX5o6Quo9HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735823801; c=relaxed/simple;
	bh=GG6D7VW5sd8El2PazlyUfirAusWPoT+77452AHeQhAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9a26bRXEgwJPnOJxIX5HBdfBwg6hH4xiiWp1WSmlBcFmbxn9tONKqy+Ae5IxisatlRAdikvq7QuMojmhBDWk/SQ75YxIqL3TwoYUMdCn/bncJ47Rdlmuw8NdCkP0up8SHID4v73fJD4W1q49NziSjRotuXztN4OmfpgMRNcALE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gRT8wAz8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF79B22F;
	Thu,  2 Jan 2025 14:15:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735823750;
	bh=GG6D7VW5sd8El2PazlyUfirAusWPoT+77452AHeQhAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gRT8wAz8TR7vl6piGX6CDCiUanlmik07VbRId2KXLVDNNg7RF0/Yh+jD/K+B6i6df
	 IK9MHSiGNonYPiPiDkE8qOmXEv1KIOo2dBny4B9N2Q6Q9PzjYhCvTVFcbobBaCsX7m
	 Y0x+B7kRNU/fdukewUli/ALDpTynPugNZW/whas0=
Date: Thu, 2 Jan 2025 15:16:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v12 8/8] MAINTAINERS: Add entries for Toshiba Visconti
 Video Input Interface
Message-ID: <20250102131638.GH554@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-9-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241125092146.1561901-9-yuji2.ishikawa@toshiba.co.jp>

Hi Ishikawa-san,

Thank you for the patch.

On Mon, Nov 25, 2024 at 06:21:46PM +0900, Yuji Ishikawa wrote:
> Added entries for visconti Video Input Interface driver, including;

Commit messages are written using the imperative mood, as if you were
giving orders to someone:

s/Added/Add/

> * device tree bindings
> * source files
> * documentation files
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

I would have added the MAINTAINERS entry in 1/8 with just the DT binding
file, and added more files in corresponding patches. That would be
easier to review and check if entries are missing. I don't mind much
though, so if you prefer keeping it this way:

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
> Changelog v12:
> - add a bindings description of CSI2RX driver
> 
>  MAINTAINERS | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b878ddc99f94..b5c819e94e9b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23430,6 +23430,18 @@ F:	Documentation/devicetree/bindings/media/i2c/tc358743.txt
>  F:	drivers/media/i2c/tc358743*
>  F:	include/media/i2c/tc358743.h
>  
> +TOSHIBA VISCONTI VIIF DRIVER
> +M:	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> +M:	Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/admin-guide/media/visconti-viif.*
> +F:	Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
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

