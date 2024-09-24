Return-Path: <linux-media+bounces-18503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7D0984690
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 15:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD35C283A92
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 13:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB15A1A76B4;
	Tue, 24 Sep 2024 13:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="vmjSPgmG"
X-Original-To: linux-media@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E43149C54;
	Tue, 24 Sep 2024 13:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727183543; cv=none; b=bcMvrn34BnWLewOyUI8jyrhfkBNKeW/xN0Fu2rgljo3JnMp8G3ndJeYaB167fqVt8C4+M0PQtJkTnVrzHyM+fXsd0ZRHL43lviyzSud6rCbA12WrnEUvbQf1JcLZvUaJgwZnqCdLjY8TRuLdheKE358MviIJgAmxvBJ5Nz/bxEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727183543; c=relaxed/simple;
	bh=z1m4TZL5Mm0VylMjkh1Vw2oNwHroAVN/PG8TLGzmKww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qryLOUuy759yvFwy2iIdjU5uEbJ+T2u93vhWgs5QZjaFhsnhszw2Z+KLlD8RwxtK/NVSe/IKbOjSw/TMRU3/Hw0kFZi3yGGuAea+2HpM9gnbLorwr3PHQcEnqoiXg3rls8gtmfRtasyFdXlj/NQ7n+v/ftfJakEjFeuvwsyW3VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=vmjSPgmG; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2A5D488363;
	Tue, 24 Sep 2024 15:12:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727183534;
	bh=DRU/cZ7ys2vNvnn5GxJewD+OdUTeyoFQ0VsBt7f/Egk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vmjSPgmGRaFAnOrry+S9EpbnEpf7b+ZOCIPwTv/RFwc8cIt1rTFbuPlgtu7KAdx05
	 eQXRI+Ln85yYO2bJULn2PIxKSpNDJr1QFK1yqFVVtpVCuBNrJHCu+7TOUtaSQuTokm
	 zu1XdW9oy+iI5bYVKZZu4rpuChn9MIU/gQvaympYvjoz2JCcOESEEx34O1B8kzGhHk
	 IH4Otwz12Jk6dhGtMLAWLSNHTWrkB0VbXEcYlLCewTur9TlRkfyZET2N+SP7ikIMy1
	 ROoliO29kbKLl4naoBX7YHf+NtA2fdqB28lVNQ2t6isLe4cQRH5Wdpklg8FJytwf1y
	 yhizP3oGT17zQ==
Message-ID: <546c9dac-39ab-4abe-a495-ab54d6ee925d@denx.de>
Date: Tue, 24 Sep 2024 12:47:12 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <95efd6b6491069d04b4bfae6616d9a43ba8467a6.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 9/4/24 11:05 AM, Philipp Zabel wrote:
> On Mi, 2024-07-24 at 02:19 +0200, Marek Vasut wrote:
>> The 'code' parameter only ever selects between YUV 4:2:0 and 4:2:2
>> subsampling, turn it into boolean to select exactly that and update
>> related code accordingly.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> I'd prefer this to be an enum ipu_chroma_subsampling or similar,
> instead of a boolean. Otherwise,

I'm afraid this introduces unnecessary back and forth conversions 
between the boolean and either of the two enum ipu_chroma_subsampling 
values in the code.

