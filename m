Return-Path: <linux-media+bounces-13108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B748905CCF
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 22:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA9FCB233AD
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 20:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0D384DF3;
	Wed, 12 Jun 2024 20:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i1EJeHyE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAEA84D2C;
	Wed, 12 Jun 2024 20:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718223930; cv=none; b=ZT6aTDpMXW74o1CLzgOVHfe2Hkn9NpLT7VBqdhDvN4oMmfs+/qWNRenLSq5TPNjo1XHD0DADFl+Lj8IMkNHlHaN1xHozOEHluC7kbRnwDA8jPOPy+ICGA6ks21uPThlmU5uEW+fuI08CAK6pwSnMC+2n47M1lFRgmBnILtOzRjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718223930; c=relaxed/simple;
	bh=0Rgb+lTc0MFdKvGyTfrXC3aT7qcl8gWlicq53gT7wlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vgfo3SIIYyIRfhywdEJJn/oRFF5oagJyzM/HsDHQDnt57EdKN2ai+UnRv+aIiZCWqHf4zwyvDIj3Ysmax63ep6oGTwSHkF3dw8HzFwqptQRT2pl+IZJZuPFVCIscl210TgWdhaPRDCgkbjauGCmZWLp421ng9ct805wYeJ1vdZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i1EJeHyE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 919A812E4;
	Wed, 12 Jun 2024 22:25:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718223913;
	bh=0Rgb+lTc0MFdKvGyTfrXC3aT7qcl8gWlicq53gT7wlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i1EJeHyEyBLVJMaCmD6MMJ/4PaC7EACNJSaWwx5Om1+rzKtu287UiS64ji4v+60wf
	 G7n+RsI6Of8utZV06quo0BpHScZg7/Y4+g0Nou7FhlK5NyDV3nMJoC8DA7bBjpABhk
	 qsbpo6SXUZPHufygXpHW8fK2Yxv8Aa/GvB45uVlA=
Date: Wed, 12 Jun 2024 23:25:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Jeffrey Kardatzke <jkardatzke@google.com>,
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
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
Message-ID: <20240612202507.GT28989@pendragon.ideasonboard.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-5-yunfei.dong@mediatek.com>
 <20240522111622.GA31185@pendragon.ideasonboard.com>
 <bhgv5djcjc4yt75pyug2yirrymeucjyslthnvq6k2kpp7axfph@jzo5wpcbgwun>
 <33d38919f3f94b6e1848aaee20cf52ac9c1df606.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33d38919f3f94b6e1848aaee20cf52ac9c1df606.camel@collabora.com>

On Wed, Jun 12, 2024 at 03:43:58PM -0400, Nicolas Dufresne wrote:
> Le mercredi 12 juin 2024 à 13:37 +0900, Tomasz Figa a écrit :
> > > Why is this flag needed ? Given that the usage model requires the V4L2
> > > device to be a dma buf importer, why would userspace set the
> > > V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM flag and pass a non-restricted
> > > buffer to the device ?
> > 
> > Given that the flag is specified at REQBUF / CREATE_BUFS time, it's
> > actually useful to tell the driver the queue is operating in restricted
> > (aka secure) mode.
> > 
> > I suppose we could handle that at the time of a first QBUF, but that
> > would make the driver initialization and validation quite a bit of pain.
> > So I'd say that the design being proposed here makes things simpler and
> > more clear, even if it doesn't add any extra functionality.
> 
> There is few more reasons I notice in previous series (haven't read the latest):
> 
> - The driver needs to communicate through the OPTEE rather then SCP and some
> communication are needed just to figure-out things like supported profile/level
> resolutions etc.
> - The driver needs to allocate auxiliary buffers in secure heap too, allocation
> at runtime are not the best

Will the same driver support both modes on the same system ?

> Note that the discussion around this flag already took place in the very first
> iteration of the serie, it was originally using a CID and that was a proposed
> replacement from Hans.

-- 
Regards,

Laurent Pinchart

