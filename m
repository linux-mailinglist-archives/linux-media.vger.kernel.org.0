Return-Path: <linux-media+bounces-11524-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 992B28C751E
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 13:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E93C1F23413
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2024 11:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C3B1459EC;
	Thu, 16 May 2024 11:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gue0RRZr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E472A143896;
	Thu, 16 May 2024 11:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715858470; cv=none; b=LmaeBB4g2nPr3SOmotoEKZs2rMYb5iheB3sdvSjIfkbCMJiZrgeFkq8nz66dEFLXiuMFrnsCOoIOwR5wplh8mZR2RXNbGoSdWdBs0cDSBhLd19knZqVaSIM+3oQc340g+od353X32JP5eZCt1MmFwrqo0x1s1d/1pj7HUYqCAk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715858470; c=relaxed/simple;
	bh=zOS8dze4DHU+JcfmWuNExW36s1PrTMzSDeM83PQTAEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNrgAhmVy5LpFHJm3jBCiZS3hwFJxtxiZXGglSonkkJjyEOhurO8/tpdpl1X1j90g5l0W3uYs34qPafqiCPD+rbLv/Dcr/50OPLg+E1Hp/6m9xygp+iVXvauXGtExvYm4OGb6JxvXXRC87b0QYfgD8BMiPFdx+4b/lR152qls8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Gue0RRZr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BD7527C;
	Thu, 16 May 2024 13:20:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715858455;
	bh=zOS8dze4DHU+JcfmWuNExW36s1PrTMzSDeM83PQTAEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gue0RRZrMUUTfv1S3jH6uD0PSmsbRLpG4yyPFWD3DIXNYU2EguRKev+56NuegTm6N
	 7ZTaGR+m0g0q+G5H+3/QBGhDxR7exhKyoV/ZrIrTylqf4XM1NMkHON/NdkeJRgfJiW
	 0ZOaHcJADgAdNCuAb8yDlbYShhfeAjl4z9UNm9Gg=
Date: Thu, 16 May 2024 14:20:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Simon Ser <contact@emersion.fr>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Maxime Ripard <mripard@redhat.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Lennart Poettering <mzxreary@0pointer.de>,
	Robert Mader <robert.mader@collabora.com>,
	Sebastien Bacher <sebastien.bacher@canonical.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	linaro-mm-sig@lists.linaro.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Milan Zamazal <mzamazal@redhat.com>,
	Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240516112055.GB5253@pendragon.ideasonboard.com>
References: <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <Zjpmu_Xj6BPdkDPa@phenom.ffwll.local>
 <20240507183613.GB20390@pendragon.ideasonboard.com>
 <4f59a9d78662831123cc7e560218fa422e1c5eca.camel@collabora.com>
 <Zjs5eM-rRoh6WYYu@phenom.ffwll.local>
 <20240513-heretic-didactic-newt-1d6daf@penduick>
 <20240513083417.GA18630@pendragon.ideasonboard.com>
 <c4db22ad94696ed22282bf8dad15088d94ade5d6.camel@collabora.com>
 <20240514204223.GN32013@pendragon.ideasonboard.com>
 <ttHZ6_mxyApQbVuEg7V20i3gCZ0nCr26aymroG2zxHv3CMRAA6RqZsUxNY3eBiYjycfb1r1WQdyMTwJO_I38FsJQMHA_Zdiqbbjs_YJWKr8=@emersion.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ttHZ6_mxyApQbVuEg7V20i3gCZ0nCr26aymroG2zxHv3CMRAA6RqZsUxNY3eBiYjycfb1r1WQdyMTwJO_I38FsJQMHA_Zdiqbbjs_YJWKr8=@emersion.fr>

On Thu, May 16, 2024 at 07:00:31AM +0000, Simon Ser wrote:
> On Tuesday, May 14th, 2024 at 22:42, Laurent Pinchart wrote:
> 
> > My experience on Arm platforms is that the KMS drivers offer allocation
> > for scanout buffers, not render buffers, and mostly using the dumb
> > allocator API. If the KMS device can scan out YUV natively, YUV buffer
> > allocation should be supported. Am I missing something here ?
> 
> Note that dumb buffers are only intended for simple software-rendering
> use-cases. Anything more complicated (e.g. involving GPU rendering)
> should use another mechanism.

Sure. Even if dumb buffers may work for GPU rendering in some cases,
there's no guarantee they will, so they shouldn't be used.

My comment was related to scanout buffers, as I was puzzled by Nicolas
mentioning how "KMS drivers only offer allocation for render buffers".
On Arm platforms the render buffers are allocated on the GPU's DRM
device as far as I understand, while the KMS drivers allocate scanout
buffers using the dumb buffers API.

-- 
Regards,

Laurent Pinchart

