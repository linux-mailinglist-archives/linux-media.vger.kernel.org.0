Return-Path: <linux-media+bounces-27929-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B21A58EB0
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 09:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 681E2188F5F2
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 08:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6521822424E;
	Mon, 10 Mar 2025 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VS2GD8mC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2574380;
	Mon, 10 Mar 2025 08:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741596996; cv=none; b=el34XrQfVrx6LG3Zke2qUf1fl/7/q09J2UpjMMTo7Jma6cP3s0czXVhtKYeNfIiH0HrBFZbreYZt3pLvKyGyPwrXfMG6Gexn40WyYFCVNGItKC7U13tpg1TNEm3JCcXVJ8DzGkPGtlcaVxeNHGKeBiadSkSlLa2FonO8o5bNZAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741596996; c=relaxed/simple;
	bh=C12mkxyY7Tuz4k36lFMWBiBskfY3UsSgTUDwu4ymK5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSdV37EQfykIFegLlGDNdaPot1IpV2QWO8UZuTT5+uMhYRHAhRSPKi+t0yFkUu4J7wwPhFxg2spYksg/eJJDRdZirs0fLdsyPKOVaohb6pRvtTsmYrShPug0T3uI0qRyEYC7b2frzIeyU2cK96YoFEi9DOMkNo1XZXNM3Y2Zxck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VS2GD8mC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF69EC4CEEC;
	Mon, 10 Mar 2025 08:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741596996;
	bh=C12mkxyY7Tuz4k36lFMWBiBskfY3UsSgTUDwu4ymK5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VS2GD8mC3KF67GsqwrZolL2PJC5nV8QLxQyAj07n3f39prZtkH1iJvEM60yAG3gQD
	 V6plRwhAVbOW7QKUgyQAJHRX8KqkzSNYtqJVSaCbMIZFHBfrzwotEzdTyBf7nahb1F
	 ulw5xmNt1ZS0/aH3skbKsPmqAglFS17CXESwCPnsNYfVvt5TieC74ADPeUyUBP34F1
	 pDsXpTVlIpEGb5v1s3vkFszlbLMYeyG2K7k5dPXep0ShufS8ewpYY5j+8DCkBkiobB
	 dcRrEG7RKtdyu/gY2i+79yqPKgi/ec7BtqCYNCz/r78UnJa0FdyBemgkAxkJvqs9vk
	 pVW7xYFBa9f3g==
Date: Mon, 10 Mar 2025 14:26:26 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v6 01/10] tee: tee_device_alloc(): copy dma_mask from
 parent device
Message-ID: <Z86pOi874jfJJSOv@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-2-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305130634.1850178-2-jens.wiklander@linaro.org>

On Wed, Mar 05, 2025 at 02:04:07PM +0100, Jens Wiklander wrote:
> If a parent device is supplied to tee_device_alloc(), copy the dma_mask
> field into the new device. This avoids future warnings when mapping a
> DMA-buf for the device.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  drivers/tee/tee_core.c | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Sumit Garg <sumit.garg@kernel.org>

-Sumit

> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index d113679b1e2d..685afcaa3ea1 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
>  	teedev->dev.class = &tee_class;
>  	teedev->dev.release = tee_release_device;
>  	teedev->dev.parent = dev;
> +	if (dev)
> +		teedev->dev.dma_mask = dev->dma_mask;
>  
>  	teedev->dev.devt = MKDEV(MAJOR(tee_devt), teedev->id);
>  
> -- 
> 2.43.0
> 

