Return-Path: <linux-media+bounces-7520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B21A1885ED8
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 669E01F21B05
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 16:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9F313699C;
	Thu, 21 Mar 2024 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mbB7XFAt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBD2136999
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 16:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711039761; cv=none; b=BGzjZU57yG4lbwsql/ZsqsgSBCW5W1P/yHo+HS4XuKbaO5Obg2QxRCLxB5eXBFpXg5pQE9CsyqY1pQS5G+WqwMk0kkJtFFhW7FPCKHlBQkWDHVn9Iu160VXHLv2/lF7vcqkZ2ie1FcUrrtPCwM9IzeOBE+VMUE6QUzUF+vPfDfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711039761; c=relaxed/simple;
	bh=rKwAXE4YWCnhHwVn8oa5KoAHnmZbpQF2SM7QcBrIFpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Swpb1TxRrYTlXhXqQZEGbrbJ3IFUqisEY0CBlu1ZeQsGl0IMEEPwn2oj2zobfLGbxklFLf+o0RO0YWXcfsu3rqHRQunS43CWfIKFoQ7+65gwu6SXv7GCtR6B1x3rvwdlgzL7gumVt/21Ak5Fb7AvC0e19syyhnrDszL7LmiFwjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mbB7XFAt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9BB2672;
	Thu, 21 Mar 2024 17:48:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711039729;
	bh=rKwAXE4YWCnhHwVn8oa5KoAHnmZbpQF2SM7QcBrIFpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mbB7XFAtg7ekEdnHChT2QYMxO/y2b7N2tQ2kFRNt6nfiX+RrBJTe+S6mMVWzRymXN
	 lYFSKykVuDKme+vEW2xCHlxWz/l9m4K5YyB0MIabVh5X1xc5CH6jEmfcEEstVkhwck
	 FLTa7sfGkOZQAVFdp71AY04rtLpEdkeEATgSLEmQ=
Date: Thu, 21 Mar 2024 18:49:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 23/38] media: uapi: ccs: Add media bus code for MIPI
 CCS embedded data
Message-ID: <20240321164914.GD9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-24-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-24-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:25:01AM +0200, Sakari Ailus wrote:
> Add new MIPI CCS embedded data media bus code
> (MEDIA_BUS_FMT_CCS_EMBEDDED).
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/v4l/subdev-formats.rst              | 28 +++++++++++++++++++
>  include/uapi/linux/media-bus-format.h         |  3 ++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index cbd475f7cae9..c8f982411e70 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -8564,3 +8564,31 @@ and finally the bit number in subscript. "X" indicates a padding bit.
>        - X
>        - X
>        - X
> +
> +.. _MEDIA-BUS-FMT-CCS-EMBEDDED:
> +
> +MIPI CCS Embedded Data Formats
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines a
> +metadata format for sensor embedded data, which is used to store the register
> +configuration used for capturing a given frame. The format is defined in the CCS
> +specification. The media bus code for this format is
> +``MEDIA_BUS_FMT_CCS_EMBEDDED``.
> +
> +The CCS embedded data format definition includes three levels:
> +
> +1. Padding within CSI-2 bus :ref:`Data unit <media-glossary-data-unit>` as

s/Data unit/Data Unit/

> +   documented in the MIPI CCS specification.
> +
> +2. The tagged data format as documented in the MIPI CCS specification.
> +
> +3. Register addresses and register documentation as documented in the MIPI CCS
> +   specification.
> +
> +The format definition shall be used only by devices that fulfill all three
> +levels above.

Hmmmm... Do we need to mandate level 3 ? There are lots of sensors that
comply with the first two levels but have their own register set. Would
you like a sensor-specific embedded data format for each of them ? If
so, how would we document it without essentially copying the datasheet ?

> +
> +This mbus code are only used for "2-byte simplified tagged data format" (code
> +0xa) but their use may be extended further in the future, to cover other CCS
> +embedded data format codes.
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index d4c1d991014b..03f7e9ab517b 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -183,4 +183,7 @@
>  #define MEDIA_BUS_FMT_META_20			0x8006
>  #define MEDIA_BUS_FMT_META_24			0x8007
>  
> +/* Specific metadata formats. Next is 0x9002. */
> +#define MEDIA_BUS_FMT_CCS_EMBEDDED		0x9001
> +
>  #endif /* __LINUX_MEDIA_BUS_FORMAT_H */

-- 
Regards,

Laurent Pinchart

