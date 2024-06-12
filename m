Return-Path: <linux-media+bounces-12987-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F8B904A18
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 06:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C5E51F24982
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 04:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4864728385;
	Wed, 12 Jun 2024 04:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NlcAwWQW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3088720DC8
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 04:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718167074; cv=none; b=RefqF6XBXjznJxjmpNV6ToDFRsGNDVLy0IkrG1gHTNjqQJKr+hniahCDYtfVaRsyRKtTO3h42hG6PmBoA2BEKYGyPIi9+J4wcDKW7Pzw1uEwNsaFAcoJufv9pHp7Jq7Gh9CTh33OhIhlKtiSFTHQmflU1e/10flIPBAYWfYsM+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718167074; c=relaxed/simple;
	bh=K9aejVQOgTXMFEuZnxUdcghhw58vkvOpgwwON1tbHew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HG+uJGmEI+UsTGgicPNZsBfMvQBm4flcUEo8cq+V8iC61PmugV4XvxyB29sgo5lVKT1U2LvglQ8XQi+c86sQnCVCLEobe5/SdfqY6P1ngyTeE+HNZ4nkxaf2pYE50igxTf9Wysq2KimUuK4KPSBOxliSM5mCdA9g1gbmLlm5CfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NlcAwWQW; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-254aec5a084so1722228fac.3
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 21:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718167072; x=1718771872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DkRmaXYdVwSedvVUVG2r+hTZqVuOSK1T8k/kpQ+eeNI=;
        b=NlcAwWQWcz7Z43HUdTxaoSN6Km0dUneoMmRIyxrmoucBy1mrgowwqJ54pGWruJBWV+
         xGxl0N970BCrC/SE6DNUhKn7Wy9AW89lz0EPYVOJz2Sj8+lWlvf7GjlvEOvxkdjyjHdf
         GKjDkVD/aL0OoKLbBbItzawWxwPGQIrUWgRLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718167072; x=1718771872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkRmaXYdVwSedvVUVG2r+hTZqVuOSK1T8k/kpQ+eeNI=;
        b=ItnOTg+HLL1HNQ3f/fEvJR08UDSTOtR4qHhEW3ysa+4dN4/ke7BtFpUc37r4Z0bddF
         jfaMYc3wedYSLZAQu7cbtvjbY/kU3u7UJBEp7ifZz+2Q3TrR3RNIiiuidqurNqiuJjkX
         VVxC8PfoR814Qqult//IwstjkpJhKE7Ifb1yVWw1NA+3TnmXsC8XXlCpig8vblPkUDSy
         /p/4Z287mFQPUCC9qKzE7FEcZQ83fVt0RB2eCwpXAIPSOIu/5P9YsAKXkCtePwDeEcnP
         TPypjVMZfvX2/QqZi6QAnT4JcC5sHRYx6JC6YtegGFXf2tDrQkKjJH8dTxSMddktDfld
         g/xw==
X-Forwarded-Encrypted: i=1; AJvYcCU4BJXzDSkLMLa9BZxZWgH2eMnRSN7C3DAT9qS1Zvns/YQsEGDsM8SFe7FZ8/3i/tRngjL0QdJ3+I55adDQDxeHuoFLees/i4gZf/c=
X-Gm-Message-State: AOJu0YwGHtnNWXp3cwuy8RGBiRa72CGU8ePFLXZ/wiBlNYAz6OofU8FI
	y/h0XkNdJ1gk1mFH906OmqMXtOzU0kC9x98+87fyLg+J8C0V14zNqOfzzf/fQw==
X-Google-Smtp-Source: AGHT+IG7f6MklQ9uaEK4A66ROk94t0wNZGlsKVegXA6Omzsq6FR8KOS6Vlm+0Pwr/7yo2CTKXViBuw==
X-Received: by 2002:a05:6870:f112:b0:250:7a43:aefd with SMTP id 586e51a60fabf-25514b4e1a3mr793220fac.2.1718167072112;
        Tue, 11 Jun 2024 21:37:52 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7042a10c359sm6519597b3a.183.2024.06.11.21.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 21:37:51 -0700 (PDT)
Date: Wed, 12 Jun 2024 13:37:46 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, 
	Jeffrey Kardatzke <jkardatzke@google.com>, 
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
Subject: Re: [PATCH v6,04/24] v4l: add documentation for restricted memory
 flag
Message-ID: <bhgv5djcjc4yt75pyug2yirrymeucjyslthnvq6k2kpp7axfph@jzo5wpcbgwun>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-5-yunfei.dong@mediatek.com>
 <20240522111622.GA31185@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522111622.GA31185@pendragon.ideasonboard.com>

On Wed, May 22, 2024 at 02:16:22PM +0300, Laurent Pinchart wrote:
> Hi Jefrey,
> 
> Thank you for the patch.
> 
> On Thu, May 16, 2024 at 08:20:42PM +0800, Yunfei Dong wrote:
> > From: Jeffrey Kardatzke <jkardatzke@google.com>
> > 
> > Adds documentation for V4L2_MEMORY_FLAG_RESTRICTED.
> > 
> > Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  Documentation/userspace-api/media/v4l/buffer.rst | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> > index 52bbee81c080..807e43bfed2b 100644
> > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > @@ -696,7 +696,7 @@ enum v4l2_memory
> >  
> >  .. _memory-flags:
> >  
> > -Memory Consistency Flags
> > +Memory Flags
> >  ------------------------
> >  
> >  .. raw:: latex
> > @@ -728,6 +728,14 @@ Memory Consistency Flags
> >  	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
> >  	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
> >  	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
> > +    * .. _`V4L2-MEMORY-FLAG-RESTRICTED`:
> > +
> > +      - ``V4L2_MEMORY_FLAG_RESTRICTED``
> > +      - 0x00000002
> > +      - The queued buffers are expected to be in restricted memory. If not, an
> > +	error will be returned. This flag can only be used with ``V4L2_MEMORY_DMABUF``.
> > +	Typically restricted buffers are allocated using a restricted dma-heap. This flag
> > +	can only be specified if the ``V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM`` is set.
> 
> Why is this flag needed ? Given that the usage model requires the V4L2
> device to be a dma buf importer, why would userspace set the
> V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM flag and pass a non-restricted
> buffer to the device ?

Given that the flag is specified at REQBUF / CREATE_BUFS time, it's
actually useful to tell the driver the queue is operating in restricted
(aka secure) mode.

I suppose we could handle that at the time of a first QBUF, but that
would make the driver initialization and validation quite a bit of pain.
So I'd say that the design being proposed here makes things simpler and
more clear, even if it doesn't add any extra functionality.

> 
> The V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM flag also needs to be
> documented in the relevant section, I don't think that's done in this
> series.
> 

+1

Best regards,
Tomasz

> >  
> >  .. raw:: latex
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart

