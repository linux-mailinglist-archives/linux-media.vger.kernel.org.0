Return-Path: <linux-media+bounces-14353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AD791C537
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 19:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BD5D281CCA
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 17:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415F61CD5B6;
	Fri, 28 Jun 2024 17:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="QlN+wmzF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BCB1C232C
	for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 17:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719597141; cv=none; b=cNs859UeyGGby2Z1PaTht6Y3u2plzUIu1gSmvuoVjORZMz2QRv07VDFoYPlVvXWlXMnLW9aXYmx8hWQtLQkrYTrGizdIG+IHC/L8Ui16p7tq1ZTAgGzrfjJqECWhJQzmlEYi8kvyQcEmbpt3RGX36aVZ55BMkWDHP27rQYC1DDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719597141; c=relaxed/simple;
	bh=jKqzwMRYUUyXcLfYNj2k9cVCXqhTqy0ilEi5cKloug4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHfkodXRvDv3PzGF6/G0W5FpMlTVEHKX5XSStIGLkX8v3aBgkDk45xJRxL4TrJjBYmKuKbw6NrEXmj5gulp10x7BRV4UZQOycdOOZoiPErvIftYtSGz2CpxXBsOtTtm26UEJtYl9QE5c1dJyjwAftabQiFL49FA9qga2kXWnzHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=QlN+wmzF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42560ef9bcbso440005e9.2
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2024 10:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1719597138; x=1720201938; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kxrTIRDs0cwmby7T3ecKxZbdG3OO0xEmvVn6nUvR6Tc=;
        b=QlN+wmzFepGIxFjda4K0G0GHx/3uDr+BvyvgDnxc09+gupqMAIPY/Km6Sl7D+dm9iM
         d4pOQXOWk5NqMLVKRAhzsZQXJZQ0VKyGstSnR1VZ1QtkoSqSnP/jQv8OcIkTTps20R2f
         +IL/mpKOW7+sArsOZ5s9wpmk7P81NWakmD/fM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719597138; x=1720201938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxrTIRDs0cwmby7T3ecKxZbdG3OO0xEmvVn6nUvR6Tc=;
        b=PVRYwwM38mAPerv1DTPdLnBydB4iL1QVDR1FMdenJg7nSNYxHx6UlxYYsk5sK9bFDB
         IRhWIMzvP/SjBjOyLWDzW8P8IsIyRY/reW2SJ2g7AwNtEmKXpV9F2tRK961G8Fg+edE3
         r6uaHrFcPy1DCxopqGzMaz8ty+Ls+9j6bBkWm62sHoQ5TSTLWPVKZMeGVFVoXHwb6jRt
         ZPhYNxvVHxJQRDG815WYjx1+PtRb0WqAKXGIbNWrHOUTR13GK7lbTkcxjk+keONHdeK8
         fXzu1e01+w+84xkR8DEqlmxxK2eNvP3hF+ZL1u/4ulcH3+REa8h2iV5JnV0lQC9o+ABR
         rpOA==
X-Forwarded-Encrypted: i=1; AJvYcCX1ERhWVzO24ASlTh+X6B+MuUQcmuxm+SKo4vbiI50NQv6BlQHHEPQAn5/KwRHebRz5IKoxGSdhQ3SfbGpGx62LVnwlHd138Bq1dGQ=
X-Gm-Message-State: AOJu0YyFCjcxysPIlFV/nUgJJmLpjRf3Y2fJtiAp/igcDgiZW7RtC4F+
	uw6jv+E69daRSjD+XAG1zek9AauNS8d7SrNMWbVMAiHfgJBHjoAqt7oSjzAAapk=
X-Google-Smtp-Source: AGHT+IH0nbVw7WSc3wWGb8JBUniDcdCcc/mkr4847vbGKQfJCgOl6QLUJc7730g84/GHFOvhW/OdQw==
X-Received: by 2002:a05:600c:3c9d:b0:424:8b08:26aa with SMTP id 5b1f17b1804b1-42491783f09mr112182045e9.3.1719597138246;
        Fri, 28 Jun 2024 10:52:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0c17f1sm44829805e9.44.2024.06.28.10.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 10:52:17 -0700 (PDT)
Date: Fri, 28 Jun 2024 19:52:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>,
	"quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"jkardatzke@google.com" <jkardatzke@google.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"joakim.bech@linaro.org" <joakim.bech@linaro.org>,
	Youlin Pei =?utf-8?B?KOijtOWPi+aelyk=?= <youlin.pei@mediatek.com>,
	"logang@deltatee.com" <logang@deltatee.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Kuohong Wang =?utf-8?B?KOeOi+Wci+m0uyk=?= <kuohong.wang@mediatek.com>,
	Jianjiao Zeng =?utf-8?B?KOabvuWBpeWnoyk=?= <Jianjiao.Zeng@mediatek.com>,
	"contact@emersion.fr" <contact@emersion.fr>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"willy@infradead.org" <willy@infradead.org>,
	"pavel@ucw.cz" <pavel@ucw.cz>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"tjmercier@google.com" <tjmercier@google.com>,
	"jstultz@google.com" <jstultz@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ppaalanen@gmail.com" <ppaalanen@gmail.com>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Message-ID: <Zn74Tys4eCji2qm0@phenom.ffwll.local>
Mail-Followup-To: Thierry Reding <thierry.reding@gmail.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
	"quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"jkardatzke@google.com" <jkardatzke@google.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"joakim.bech@linaro.org" <joakim.bech@linaro.org>,
	Youlin Pei =?utf-8?B?KOijtOWPi+aelyk=?= <youlin.pei@mediatek.com>,
	"logang@deltatee.com" <logang@deltatee.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Kuohong Wang =?utf-8?B?KOeOi+Wci+m0uyk=?= <kuohong.wang@mediatek.com>,
	Jianjiao Zeng =?utf-8?B?KOabvuWBpeWnoyk=?= <Jianjiao.Zeng@mediatek.com>,
	"contact@emersion.fr" <contact@emersion.fr>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	"willy@infradead.org" <willy@infradead.org>,
	"pavel@ucw.cz" <pavel@ucw.cz>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"tjmercier@google.com" <tjmercier@google.com>,
	"jstultz@google.com" <jstultz@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ppaalanen@gmail.com" <ppaalanen@gmail.com>
References: <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
 <ZnxWWtdShekGSUif@phenom.ffwll.local>
 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
 <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
 <w3xcvakoytubud6dw4wxr6ntbe6uvfrldihnd26vai6uyyto6j@vcq7gizxolag>
 <c96f82e3-bbd6-407e-a71b-3a794a56585b@amd.com>
 <fh37zowioui7hcabzrco7xqxttze2lufijq67wbzylah3e3ry6@ahwnr2rspt3l>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fh37zowioui7hcabzrco7xqxttze2lufijq67wbzylah3e3ry6@ahwnr2rspt3l>
X-Operating-System: Linux phenom 6.8.9-amd64 

On Fri, Jun 28, 2024 at 03:57:49PM +0200, Thierry Reding wrote:
> On Fri, Jun 28, 2024 at 02:34:24PM GMT, Christian König wrote:
> > Am 28.06.24 um 13:47 schrieb Thierry Reding:
> > > [SNIP]
> > > > > The reason I ask is that encryption here looks just like another parameter
> > > > > for the buffer, e.g. like format, stride, tilling etc..
> > > > > 
> > > > > So instead of this during buffer import:
> > > > > 
> > > > > mtk_gem->secure = (!strncmp(attach->dmabuf->exp_name, "restricted", 10));
> > > > > mtk_gem->dma_addr = sg_dma_address(sg->sgl);
> > > > > mtk_gem->size = attach->dmabuf->size;
> > > > > mtk_gem->sg = sg;
> > > > > 
> > > > > You can trivially say during use hey this buffer is encrypted.
> > > > > 
> > > > > At least that's my 10 mile high view, maybe I'm missing some extensive key
> > > > > exchange or something like that.
> > > > That doesn't work in all cases, unfortunately.
> > > > 
> > > > If you're doing secure video playback, the firmware is typically in
> > > > charge of the frame decryption/decoding, and you'd get dma-buf back that
> > > > aren't accessible by the CPU (or at least, not at the execution level
> > > > Linux runs with).
> > > Can you clarify which firmware you're talking about? Is this secure
> > > firmware, or firmware running on the video decoding hardware?
> > > 
> > > > So nobody can map that buffer, and the firmware driver is the one who
> > > > knows that this buffer cannot be accessed by anyone. Putting this on the
> > > > userspace to know would be pretty weird, and wouldn't solve the case
> > > > where the kernel would try to map it.
> > > Doesn't userspace need to know from the start whether it's trying to do
> > > secure playback or not? Typically this involves more than just the
> > > decoding part. You'd typically set up things like HDCP as part of the
> > > process, so userspace probably already does know that the buffers being
> > > passed around are protected.
> > > 
> > > Also, the kernel shouldn't really be mapping these buffers unless
> > > explicitly told to. In most cases you also wouldn't want the kernel to
> > > map these kinds of buffers, right? Are there any specific cases where
> > > you expect the kernel to need to map these?
> > > 
> > > I've been looking at this on the Tegra side recently and the way it
> > > works on these chips is that you basically get an opaque carveout region
> > > that has been locked down by secure firmware or early bootloaders, so
> > > only certain hardware blocks can access it. We can allocate from that
> > > carveout and then pass the buffers around.
> > > 
> > > It may be possible to use these protected carveout regions exclusively
> > > from the DRM/KMS driver and share them with multimedia engines via DMA-
> > > BUF, but I've also been looking into perhaps using DMA-BUF heaps to
> > > expose the carveout, which would make this a bit more flexible and allow
> > > either userspace to allocate the buffers or have multiple kernel drivers
> > > share the carveout via the DMA-BUF heap. Though the latter would require
> > > that there be in-kernel APIs for heaps, so not too sure about that yet.
> > 
> > Yeah as far as I can see that would be a perfectly valid use case for
> > DMA-Buf heaps.
> > 
> > One question here: How does the HDCP setup work on Tegra? From your comment
> > I guess you pass most of the information through userspace as well.
> 
> Well, we don't currently support HDCP at all. I do have proof-of-concept
> patches from a long time ago and, yes, judging by that we'd need to
> control all of this from userspace. The way I imagine that this would
> work is that userspace needs to first set the "Content Protection" and
> "HDCP Content Type" properties and wait for the state change. Once that
> has happened it can go and allocate the protected memory and start
> decoding into it and then scan out from these buffers.

Yeah this is how this is meant to work, because some userspace is happy
with just hdcp, while the buffers are not encrypted/protected, the only
protection is system lockdown with secure boot.

So enable hdcp first, then allocate secure buffers and display them there.
And the hardware needs to make sure that if we ever drop hcpd, the screen
goes black (or encrypted garbage) when trying to display encrypted/secure
buffers.

> > Or is there any info inside the DMA-buf for this? In other words would you
> > also need to know if a buffer is then allocated from this special carveout?
> 
> I don't think so. It's possible to scan out an unprotected buffer with
> HDCP enabled. It may also be possible to scan out a protected buffer
> even if HDCP wasn't enabled, though you would obviously want to prevent
> that somehow. Not sure if there's a common way to do this, but I guess
> in end-user devices you'd need a fully trusted boot chain to do that in
> a compliant way.

Where I know how it works it's hardware making that guarantee.

> It's been a long time since I looked at this, but I seem to recall that
> at the time all software that could do DRM-protected playback on Linux
> was proprietary for reasons like these.

Yeah it's still not much better unfortunately :-/
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

