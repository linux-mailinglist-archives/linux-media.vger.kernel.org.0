Return-Path: <linux-media+bounces-20635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2A79B786E
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 11:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61813B23687
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 10:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85238198E8C;
	Thu, 31 Oct 2024 10:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zf7DWRfL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94E412B169
	for <linux-media@vger.kernel.org>; Thu, 31 Oct 2024 10:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730369512; cv=none; b=Kl2gxggTfdUUaRrsIZjDTWgdcg9mnnb0iXa0f7ZMO9lqfhiFnkDc6I8pPk8AHHghuD/wlG1Ym/uYz6fY8HA/RSjlnHNGj1J9PQ8pDCB4KGQe17cGZY+FLUpxMfPiWRK3ta4mQhWrfInWuA0TUlWdV/3H9GyZPxp9oInenxUAw2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730369512; c=relaxed/simple;
	bh=/WOZrhok5cgDteoGhnYKPHeFe4fSDcQR32M0PdOIIfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POUAsV5i3Yz/mqHUvA7tbv+LRSbY8Wc8aAa8vh94Jg6F5NJsNhzvKfr39jmvwqdmjldhduyJzRkGnEu0rqcHYug4ouDV7vt8YTQlumglhrr26SOBM3s7X11IclHGsbl5qBIj+kzslclkgbdWHqu7K4++jHFZkyxW46d0qk2pBZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zf7DWRfL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 877F89EC;
	Thu, 31 Oct 2024 11:11:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730369504;
	bh=/WOZrhok5cgDteoGhnYKPHeFe4fSDcQR32M0PdOIIfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zf7DWRfL0CKToswod81hWBHr9N+Hb9gf3iGXJGEPCo/KmBRTC6b4UbNeqh8/Tqcgz
	 1C6GmGg0UymjntTq8N0xYgpORDchwikL6MY2zearA4Lnff7kWyGJROOPF9PT3BVcKQ
	 TXaVYNyMtW7DxrrKB7DaYKNoFN/HXm8wVwg7c/II=
Date: Thu, 31 Oct 2024 12:11:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH] Documentation: media: improve
 V4L2_CID_MIN_BUFFERS_FOR_*, doc
Message-ID: <20241031101141.GD2473@pendragon.ideasonboard.com>
References: <93d078e5-deba-4060-a32e-94bce677453c@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <93d078e5-deba-4060-a32e-94bce677453c@xs4all.nl>

Hi Hans,

Thank you for the patch.

On Thu, Oct 31, 2024 at 08:50:04AM +0100, Hans Verkuil wrote:
> Clearly state that the V4L2_CID_MIN_BUFFERS_FOR_OUTPUT and
> V4L2_CID_MIN_BUFFERS_FOR_CAPTURE controls are required for
> stateful codecs.

Wouldn't it be better for this kind of information to be centralized in
a stateful decoder document ? That would make it easier for developers
to see all they need to implement. Otherwise they would need to read
through the whole documentation to pick the parts of the API they need
to support in their drivers.

> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> ---
>  Documentation/userspace-api/media/v4l/control.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/control.rst b/Documentation/userspace-api/media/v4l/control.rst
> index 57893814a1e5..9253cc946f02 100644
> --- a/Documentation/userspace-api/media/v4l/control.rst
> +++ b/Documentation/userspace-api/media/v4l/control.rst
> @@ -290,13 +290,15 @@ Control IDs
>      This is a read-only control that can be read by the application and
>      used as a hint to determine the number of CAPTURE buffers to pass to
>      REQBUFS. The value is the minimum number of CAPTURE buffers that is
> -    necessary for hardware to work.
> +    necessary for hardware to work. This control is required for stateful
> +    decoders.
> 
>  ``V4L2_CID_MIN_BUFFERS_FOR_OUTPUT`` ``(integer)``
>      This is a read-only control that can be read by the application and
>      used as a hint to determine the number of OUTPUT buffers to pass to
>      REQBUFS. The value is the minimum number of OUTPUT buffers that is
> -    necessary for hardware to work.
> +    necessary for hardware to work. This control is required for stateful
> +    encoders.
> 
>  .. _v4l2-alpha-component:
> 

-- 
Regards,

Laurent Pinchart

