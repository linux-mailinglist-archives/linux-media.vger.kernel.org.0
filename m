Return-Path: <linux-media+bounces-11715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4607E8CC00F
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 13:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 780311C21E1F
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 11:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42304824AA;
	Wed, 22 May 2024 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YY5D39vj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D881680C07;
	Wed, 22 May 2024 11:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716376595; cv=none; b=funwipJ/ovDwnwi45jUguxxS//GSeORv93HfAbsP5p6KmGSs2th9VhXHTPIbX1y4kWiI1BdCn2ue18Kw+1h7uM92mLr2E8Z1BQGbQF6TfTPMQVD3gWLNWdei/coTQf2M2TfoIiaXCOA8Bx1Q4O4x0uEffifBGubd4rMSrhXHw3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716376595; c=relaxed/simple;
	bh=q83AOrxhjHdDtbOcVJNIw+dm8Yj5lnBFmVhmfjLn9IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBd+7x1ii0B5Moz/s6bzup7Ud3/unpm5UKl9L2+Edj4QogBDbs9DFshVi8zbq8HN9xk0b6W7JVq8gI1CXmAuBtpCISnUxd49BIPgo8qS47sis9oHWNFIw3yo6pPGRj0Tb6cCi+Z6yIBR+KT2+VcIHAeY96Ts7mG1WKBv8upwiHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YY5D39vj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED5DCD49;
	Wed, 22 May 2024 13:16:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716376579;
	bh=q83AOrxhjHdDtbOcVJNIw+dm8Yj5lnBFmVhmfjLn9IA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YY5D39vjYu90YM40AKH7ctfUmXDtAh3vruu9Dqw2jQ0NLNg+p6WrLmo9V7u80L71G
	 ULiTQnW/MDSY/YmaYPNEkMMkY14OWGsTrZo+WvhbojfStattNgZP5ollUYzcsHdSof
	 gSbVh5HKYAenHcnPeB8iJ3mhIXdBV6fvJtxyM+zw=
Date: Wed, 22 May 2024 14:16:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6,04/24] v4l: add documentation for restricted memory
 flag
Message-ID: <20240522111622.GA31185@pendragon.ideasonboard.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-5-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240516122102.16379-5-yunfei.dong@mediatek.com>

Hi Jefrey,

Thank you for the patch.

On Thu, May 16, 2024 at 08:20:42PM +0800, Yunfei Dong wrote:
> From: Jeffrey Kardatzke <jkardatzke@google.com>
> 
> Adds documentation for V4L2_MEMORY_FLAG_RESTRICTED.
> 
> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  Documentation/userspace-api/media/v4l/buffer.rst | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> index 52bbee81c080..807e43bfed2b 100644
> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> @@ -696,7 +696,7 @@ enum v4l2_memory
>  
>  .. _memory-flags:
>  
> -Memory Consistency Flags
> +Memory Flags
>  ------------------------
>  
>  .. raw:: latex
> @@ -728,6 +728,14 @@ Memory Consistency Flags
>  	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
>  	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
>  	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
> +    * .. _`V4L2-MEMORY-FLAG-RESTRICTED`:
> +
> +      - ``V4L2_MEMORY_FLAG_RESTRICTED``
> +      - 0x00000002
> +      - The queued buffers are expected to be in restricted memory. If not, an
> +	error will be returned. This flag can only be used with ``V4L2_MEMORY_DMABUF``.
> +	Typically restricted buffers are allocated using a restricted dma-heap. This flag
> +	can only be specified if the ``V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM`` is set.

Why is this flag needed ? Given that the usage model requires the V4L2
device to be a dma buf importer, why would userspace set the
V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM flag and pass a non-restricted
buffer to the device ?

The V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM flag also needs to be
documented in the relevant section, I don't think that's done in this
series.

>  
>  .. raw:: latex
>  

-- 
Regards,

Laurent Pinchart

