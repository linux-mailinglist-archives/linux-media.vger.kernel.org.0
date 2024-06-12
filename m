Return-Path: <linux-media+bounces-12986-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C028904A04
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 06:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1950B1F24AA4
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 04:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB7D23765;
	Wed, 12 Jun 2024 04:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JywGFy1/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776153209
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 04:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718166690; cv=none; b=YvgtKudMBdCkWAnEXg+0fW6hMeNnqsnVdLGg5Dvki9dl0xN+NJ1ectznU355n3Vts3R1LVCwyur8w38J23aG41y8Qi90mapOiNdOcllXWFtjTXN3v4DucVMK93Nz9uMuJctNBhCL1i0JuIL3Rk0oo2kG/35yrVo05W7HVO0l2so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718166690; c=relaxed/simple;
	bh=hSnJiEgR5nMe+pD1oPm3BPIx6ljI+CeVh/tUDiPt7w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGZb0Ar8aXrY04WO4hxNdRSbXOTXwiPygjMltMIpv/WBHyYCrFJWod3u6u6HWlBpKd5i7h/JN96K0l7pH3HUKn/MDCQCvFkANh+R1Z1EEfF91sn6McLpxE6akLjOfz/m9lR+H7W9AbQ51wYHTajTd+9OzH2J8tkeUCrBDcJ4mJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JywGFy1/; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7041053c0fdso3551619b3a.3
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 21:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718166689; x=1718771489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=26yCayUAzc76t5ERK7B6b8gwpGmJll8Ij+c08Bg2GMU=;
        b=JywGFy1/ZJMdXblpUDu3vfbAHc41BGpW3SFtL5fAaPkpgADXKjklyV8/QSAf5MZrYl
         awRCMjXfwK8enCCLyMgvArnetTGIFCIvYP1w9RqvYYqSWPuYrFejFCfL2Ut+twi2egRp
         t5QAarNFZxXMKlNn/2heBWSKSqGE38tMpSOi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718166689; x=1718771489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26yCayUAzc76t5ERK7B6b8gwpGmJll8Ij+c08Bg2GMU=;
        b=u6tMfjyj3ffkUedPOR8X9lpCFKvZ6CWrSbQeNeJGT7n+lZjTwNgXyOZJMnjleWVe3D
         cQHi0kjVnJ5ffAtQs2aEf9fOZrmqk55MJnRi4OTAZVVuy2I5MJUUA0zVIO8YTtlEd3/4
         0sra0IUCYUjElX5vlwPz2XHkdRRlrbXqU5mYJjC60D1WBfth6ln+DeQj+ZkYY529rqzn
         5cZdiGYn/pCnNGTUaZswqPS3V7UMtBVENYwNkP5Bkbk5hPhzHNmeD2F1nWNJWDUEOx0Y
         25MctFo317LZohus3/TvjNpqByt9JA4KooiBkhVXrwoHBd2HhbCgN8KaWAUx9W3Imz+5
         00Aw==
X-Forwarded-Encrypted: i=1; AJvYcCV3Xwav7TOVRY+gn0r52FkImSMR67DlAtqz3PpQWpijR5RMq82+kBSQFg1ndvj+mvwdIfLrmtTBScXD2w92gvBemeNXAEgx88lXBg8=
X-Gm-Message-State: AOJu0Yw04c+1H1fTjAAwnQ9E5EJ9aqX/f75wLqxRKbissbN83wBiH7k7
	3mQOztQZjKOj56RuXnDZOL6dPnr0Iz/XaRoXeofGKsHWht63/QjFU5H1bkAu3A==
X-Google-Smtp-Source: AGHT+IEDNIroERFQYahAEyUp89r/l251ag7KXTZkZl5/HBfB+fwRsfZPqR83QoYb4oKa3SSk62X7hQ==
X-Received: by 2002:a05:6a21:81a2:b0:1b2:2e3e:42dd with SMTP id adf61e73a8af0-1b8a9be9bb0mr745623637.34.1718166688682;
        Tue, 11 Jun 2024 21:31:28 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f74179d0basm11631455ad.122.2024.06.11.21.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 21:31:28 -0700 (PDT)
Date: Wed, 12 Jun 2024 13:31:22 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Jeffrey Kardatzke <jkardatzke@google.com>, 
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Yong Wu <yong.wu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
	"T . J . Mercier" <tjmercier@google.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6,03/24] v4l2: verify restricted dmabufs are used in
 restricted queue
Message-ID: <rw6dkzasaz4lnvtmxkxlkxte5nvphpjixigjouvjkpctscpdla@bheblt7kmj4y>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-4-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516122102.16379-4-yunfei.dong@mediatek.com>

On Thu, May 16, 2024 at 08:20:41PM +0800, Yunfei Dong wrote:
> From: Jeffrey Kardatzke <jkardatzke@google.com>
> 
> Verfies in the dmabuf implementations that if the restricted memory
> flag is set for a queue that the dmabuf submitted to the queue is
> unmappable.
> 
> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 8 ++++++++
>  drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> index 3d4fd4ef5310..35a3c1c01eae 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> @@ -710,6 +710,14 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
>  		return -EINVAL;
>  	}
>  
> +	/* Verify the dmabuf is restricted if we are in restricted mode, this is done
> +	 * by validating there is no page entry for the dmabuf.
> +	 */

Kernel coding style [1] defines multi-line comments to start with an empty
line.

[1] https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting

> +	if (buf->vb->vb2_queue->restricted_mem && !sg_dma_is_restricted(sgt->sgl)) {
> +		pr_err("restricted queue requires restricted dma_buf");
> +		return -EINVAL;

This would leak the mapping. We need to unmap the attachment here.

> +	}
> +
>  	/* checking if dmabuf is big enough to store contiguous chunk */
>  	contig_size = vb2_dc_get_contiguous_size(sgt);
>  	if (contig_size < buf->size) {
> diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> index 6975a71d740f..2399a9c074ba 100644
> --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> @@ -570,6 +570,14 @@ static int vb2_dma_sg_map_dmabuf(void *mem_priv)
>  		return -EINVAL;
>  	}
>  
> +	/* Verify the dmabuf is restricted if we are in restricted mode, this is done
> +	 * by validating there is no page entry for the dmabuf.
> +	 */

Ditto.

> +	if (buf->vb->vb2_queue->restricted_mem && !sg_dma_is_restricted(sgt->sgl)) {
> +		pr_err("restricted queue requires restricted dma_buf");
> +		return -EINVAL;

Ditto.

Best regards,
Tomasz

> +	}
> +
>  	buf->dma_sgt = sgt;
>  	buf->vaddr = NULL;
>  
> -- 
> 2.25.1
> 

