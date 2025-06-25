Return-Path: <linux-media+bounces-35913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BBFAE8FBE
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 23:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4D3117AD8F
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 21:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7321E2853;
	Wed, 25 Jun 2025 21:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="UH1m5ui8"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FD48F6E;
	Wed, 25 Jun 2025 21:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750885219; cv=pass; b=GlSkHitpYbDA/9Y5E07NsiPtNVTIRITW45rw5VWjkFsLMxZBS7W/T5Sbv3DjMVdN6r4uDeXpy9ETViPFnR37mOsSCTw0e4xI/6FxPXSw34v//vFGvXxSsJEPFqtanI+H9ZLtwShM21203YL8B0xijJ+XhJtYEWFbkA0bbE/JG8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750885219; c=relaxed/simple;
	bh=Vz+VSeberudRnL4ulbMeTzd1Ndi0G+8Cy3z4R15v+Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfnVOrdIflA5j+GMIfXVh1tutRvCS5XPkEwc7jXYjNcsHopCwKb0GG8XCmR0XKAprPdHLwlGgXVARe39N2HO7u+5cJrhxi8q91Xcs5Ija9QBqhHeKv56tqqaydE6BSfz5BR+r4MyHbCdDxRPF+DYECC9gQSJBXxoyizerHNKBrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=UH1m5ui8; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4bSDjQ5nlMz49Pv9;
	Thu, 26 Jun 2025 00:00:09 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1750885211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+j+QmnjtgrdPyuqA4YOcCmizdlMWGU7RjodSXECtW1w=;
	b=UH1m5ui8lDi0c037PrcR1TIK9W54D7iRIc+LOirZnFGUx8Q46eb+c9cj0lKVR9pzhGBTD7
	Jgn3/5GhWNW8xIid4CDV0bxCIq4fLHqWILP2sVYAUCPBkCkQBTT9Y2Q6pHmuIAYfZS4jIj
	cSp3VwL2ENCpPnnLhvcfl3UAF72f5uxwfa7PnURXh7+KA/Qz0fO0DzQejYMiKrq8JzqBsy
	TXs3EzLaJGkiHKnOyNFD/dzMMhQubVfcar7wserSD41yuqTz0LK3tDKR0SHqUV/EYukOwh
	dj9UMgyFYCZpaXdcbvmAP4qKajp30RovxUU65TLCzM/NqKxGM1eKm0gsVcFlBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1750885211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+j+QmnjtgrdPyuqA4YOcCmizdlMWGU7RjodSXECtW1w=;
	b=Ga40Y6R6d+fsRNcLOCsGtJMWE9dU62boKDumY4d5c9O5mVx+dbqgsfosa1puLpBPE9kn0y
	UhX9m9JosgvGadVQiGcLq7At51SBNoVul1xD+dCG4MDX0x4P4+fm6jkbznoQtcqRG/abhv
	5II7abvK4czxLZ3nMwPcpnmVl8cP0fycnifaGP7Q0JMrH7EgF8DxIhglsCTB+eDNWMS7fm
	03ctkfgVRNty5OY4l4mTUFeokwDVKAUEVejRFNKB3iOTK29so2Zb14/FfaBy1nzdvRuv0T
	4vERcXg8rFdXj2ZCHrd6bIfjIfmI5UYDFeT1CkrsW0BnqHrmaA50XVOlmPD30w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1750885211; a=rsa-sha256;
	cv=none;
	b=HLojqxwYRSa1bi2KbnJmgodfuh+fF4gg8Z11gVHeG1aWS27Ak/UCcLCEMvmafVqEqckFBQ
	swtxQxAakM7qjVY+MtxATroDc9gGo2SC+xJyTX3mlH9HR1gL6F1w8DBtr2cUqMAJDpntD8
	FB83TWLg32BDxEinBclVpEPcd4lzMgZcqB2azZq2qIe55XRpBojo4cPEAXVmxaKJoX15Qw
	5FNYk0NKKnYWoigKKXvwRifzScVh0LAtp4gN5f3BudxvgOVOEAJr4mR8xvPd8I2dWM5XPE
	/uDJSTgQ3TVLnzlbimyq48BTfs8Ng7Gsy20JlOVgQMzvFemnn6WSdvby5S3PzQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 24F20634C94;
	Thu, 26 Jun 2025 00:00:09 +0300 (EEST)
Date: Wed, 25 Jun 2025 21:00:08 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: jai.luthra@linux.dev, mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, s-jain1@ti.com, r-donadkar@ti.com,
	vigneshr@ti.com, praneeth@ti.com, tomi.valkeinen@ideasonboard.com,
	y-abhilashchandra@ti.com
Subject: Re: [PATCH] media: ti: j721e-csi2rx: Allow passing cache hints from
 user-space
Message-ID: <aFxjWFFLekPp54a2@valkosipuli.retiisi.eu>
References: <20250312112140.449765-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312112140.449765-1-devarsht@ti.com>

Hi Devarsh,

Thanks for the patch.

On Wed, Mar 12, 2025 at 04:51:40PM +0530, Devarsh Thakkar wrote:
> User-space can provide cache hints to enable software managed cache
> operations or skip certain cache operations using memory flags
> and buffer flags. This is useful for SoCs such as AM62px
> which do not support hardware cache coherency.
> 
> This is tested on AM62px with yavta capture by passing
> V4L2_MEMORY_FLAG_NON_COHERENT while using VIDIOC_REQBUFS
> and V4L2_BUF_FLAG_NO_CACHE_CLEAN while using VIDIOC_QBUF
> and ~5x reduction in memcpy time is seen for
> copying captured frame to DDR as shared here [1].

The lines may be up to 75 characters long here. Most editors can handle the
wrapping for you, I've rewrapped the text in this case and edited it a
little, as Jai suggested.

> 
> [1]:
> Link: https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1452545/am62p-the-ads6311-radar-camera-has-lost-frame-capture/5580472#5580472
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 6412a00be8ea..284d33b2a0ec 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -895,6 +895,7 @@ static int ti_csi2rx_init_vb2q(struct ti_csi2rx_dev *csi)
>  	q->dev = dmaengine_get_dma_device(csi->dma.chan);
>  	q->lock = &csi->mutex;
>  	q->min_queued_buffers = 1;
> +	q->allow_cache_hints = 1;
>  
>  	ret = vb2_queue_init(q);
>  	if (ret)

-- 
Regards,

Sakari Ailus

