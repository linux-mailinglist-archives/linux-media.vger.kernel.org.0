Return-Path: <linux-media+bounces-15406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C9493EB2A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 04:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9AD7281B88
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 02:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2FA79B96;
	Mon, 29 Jul 2024 02:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="vJVMmbll"
X-Original-To: linux-media@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5479377115;
	Mon, 29 Jul 2024 02:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722219747; cv=none; b=mRJM+JtaNuVCoeIxJlrAKgD1DVurHqiF2oMhqlD1LRVG33uBVeAhQordb0UOOHuNdSRQOy0TDvTJP5H1AQ1sPDm5hkUNtzSs26jC/8oGZOX0NE9KXYA9vU8/fC6j//ARGWlS4/ZE/kGZ/Ce2Q1hJY7dpVBh07Lumze+5MO3CQFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722219747; c=relaxed/simple;
	bh=CZKG2W8b4fXshq2AjImQLIyJ7j8t8NCttg1FUvcwDuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAJbdi2pzU+yK/tr9llY31SHkkEmDlCadfXB+2mll67C8/hXPx4ATrt7i9kyCzFTwj2PeWrq1nL0fhhN/wh3comoah7L5v2qPBR94ZFXBXxLMcR4dp/JBdgtyvXgow8L8hzTXDIcickTl7nqj1USWTsioCau+SkVofQBIy4Uyk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=vJVMmbll; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 34250886A7;
	Mon, 29 Jul 2024 04:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1722219739;
	bh=YaMbFqhcu2EaD0ILHrZLda28agFKudS98OiBGCkFSS4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vJVMmbllQBeM0Cu+Yih74QhmSwkWbPGYiojLP3+AgwlOZj0nl02Y1MpHTMGxGPEh7
	 CwiLq3SAcOtF5vyvSS0mQOzG2qCPj5KKRdXIUXuPpet0pdyUxIc8opFqzt54r/1Tvi
	 ISrtEMrzEoEDipL+FTtx1RkgzgSvi9zJ8gYl5YtzmgwpSNxqk9L5VwQb0PEXos97F/
	 AOnG2m6IhD1fg51frrufKot5sva0ny3hkXD0e7+ROAm+oMUTeHyTYY+DbjakZ4dAej
	 AG7rQ5G7E3Z1ptZ6Ywa0A5bohfYqD5jgPZ4IF7T+Vg4m4MTDGTd+S8uimC//gBPjOG
	 Q/P96Zk0g7F0Q==
Message-ID: <8aea6cc0-10bf-48b8-add9-eb3f1caa2d66@denx.de>
Date: Mon, 29 Jul 2024 04:16:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
To: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer
 <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
 <5e5fba4fd6c3c0c9df23697bd328367e5fdfa923.camel@ndufresne.ca>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <5e5fba4fd6c3c0c9df23697bd328367e5fdfa923.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/24/24 6:08 PM, Nicolas Dufresne wrote:
> Hi Marek,

Hi,

> Le mercredi 24 juillet 2024 à 02:19 +0200, Marek Vasut a écrit :
>> Introduce dedicated memory-to-memory IPUv3 VDI deinterlacer driver.
>> Currently the IPUv3 can operate VDI in DIRECT mode, from sensor to
>> memory. This only works for single stream, that is, one input from
>> one camera is deinterlaced on the fly with a helper buffer in DRAM
>> and the result is written into memory.
>>
>> The i.MX6Q/QP does support up to four analog cameras via two IPUv3
>> instances, each containing one VDI deinterlacer block. In order to
>> deinterlace all four streams from all four analog cameras live, it
>> is necessary to operate VDI in INDIRECT mode, where the interlaced
>> streams are written to buffers in memory, and then deinterlaced in
>> memory using VDI in INDIRECT memory-to-memory mode.
> 
> Just a quick design question. Is it possible to chain the deinterlacer and the
> csc-scaler ?

I think you could do that.

> If so, it would be much more efficient if all this could be
> combined into the existing m2m driver, since you could save a memory rountrip
> when needing to deinterlace, change the colorspace and possibly scale too.

The existing PRP/IC driver is similar to what this driver does, yes, but 
it uses a different DMA path , I believe it is IDMAC->PRP->IC->IDMAC . 
This driver uses IDMAC->VDI->IC->IDMAC . I am not convinced mixing the 
two paths into a single driver would be beneficial, but I am reasonably 
sure it would be very convoluted. Instead, this driver could be extended 
to do deinterlacing and scaling using the IC if that was needed. I think 
that would be the cleaner approach.

