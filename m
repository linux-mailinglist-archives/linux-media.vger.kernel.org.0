Return-Path: <linux-media+bounces-18574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF299867CC
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 22:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C158A1F23730
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 20:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED2F14D70B;
	Wed, 25 Sep 2024 20:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Cg4jPDdi"
X-Original-To: linux-media@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4979145B2E;
	Wed, 25 Sep 2024 20:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727297389; cv=none; b=iydwN8B9juytMPHa+AL6m6HU1sZ0UtLmnTcQQRirOjCoV48xI0kcox2Vdm6sxQlbcuFJTPH7h2SRQ2GRYIK6t4JwjYshQF1HwMRJ6HfXWDauz2pEpoRM6cdHydqOXEUg4h4HbeTBB/0mT5cany56pvs2oWaQShTUibIIjWgH/RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727297389; c=relaxed/simple;
	bh=MaHH/79oKD+XW/Z1AZnsIyaL5amlPhvZlMiLUvdAtVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bomFuW0DSY8Wl6Lfms8wYhkp6grVMv5zD2gx18oM2TD/RnQGfrJf6AFr98zVhIOYTOXaNSYXhnGtKT0R8S2DEHs6BxWWmMxNVFmrA/l+Yw4OYT/XD+1MK7wqjIDpBZueS3n75excDgx8CVum/4MqjK3sPq57sn/qQwCkEeo9QTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Cg4jPDdi; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 79A7A80245;
	Wed, 25 Sep 2024 22:49:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727297386;
	bh=QlLkUfMyGaR3J/tFq0Q4tO38Q45QW/pVzn3fUTjpgHo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cg4jPDdiMo3vN9bAxn1XcUyC/4/9lvGSNj2YOUIUUhWBtj0iWFFWVIUUuOkZWHFul
	 ESVav5UIaTSN7pgY3zOfiYbC0lYn5vWcFOUabtFc1Edr1TCPHj+hvvD2kAo/PDvhu1
	 /EjHOIee4sykJjfZXB6jidwvajk376t4gj19//N8MRIQ7xhjzfuL+j5lpV5q3poeSF
	 tsT7voMv935o2E7Z+nekhvB2Gwfi0O6k3nZsJJvkq8Eu6MMelHOu/BGgHSym4glETz
	 RbtdlMnVxOiDgp/2EE2QqKaNZl8c4eNpPeI1Dvg5FRm7w7AevyurQN4e8lojxHN1Kq
	 qiGQF2BBfm9+A==
Message-ID: <a8fb73cd-afc1-4bf9-8a3d-e0815530d680@denx.de>
Date: Wed, 25 Sep 2024 21:47:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpu: ipu-v3: vdic: Simplify ipu_vdi_setup()
To: Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240724002044.112544-1-marex@denx.de>
 <95efd6b6491069d04b4bfae6616d9a43ba8467a6.camel@pengutronix.de>
 <546c9dac-39ab-4abe-a495-ab54d6ee925d@denx.de>
 <75edf945c98a68bf85b13efd1c13549288f56488.camel@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <75edf945c98a68bf85b13efd1c13549288f56488.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 9/25/24 6:43 PM, Philipp Zabel wrote:
> On Di, 2024-09-24 at 12:47 +0200, Marek Vasut wrote:
>> On 9/4/24 11:05 AM, Philipp Zabel wrote:
>>> On Mi, 2024-07-24 at 02:19 +0200, Marek Vasut wrote:
>>>> The 'code' parameter only ever selects between YUV 4:2:0 and 4:2:2
>>>> subsampling, turn it into boolean to select exactly that and update
>>>> related code accordingly.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>
>>> I'd prefer this to be an enum ipu_chroma_subsampling or similar,
>>> instead of a boolean. Otherwise,
>>
>> I'm afraid this introduces unnecessary back and forth conversions
>> between the boolean and either of the two enum ipu_chroma_subsampling
>> values in the code.
> 
> Fair enough. I dislike the opaque usage in vdic_start() a bit, but with
> the in422 variable in ipu_mem2mem_vdic_setup_hardware() it is clear
> enough.
I'll keep the rework for V3 and then we can decide whether or not to 
undo it.

