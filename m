Return-Path: <linux-media+bounces-4690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CFD8497E3
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 11:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F3A61C20EFA
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 10:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC5C17592;
	Mon,  5 Feb 2024 10:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pOXBKu2U"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E311755E;
	Mon,  5 Feb 2024 10:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707129613; cv=none; b=gTQqE+a3ZqgEGB2YkhJQMOY3hk6mlHBBc5W7Q9TFqkYdM7k4SSaBO0Oq3so0UieIH/bua87FxeNqTSYz6FoH5rdxilLsj0gR7f+saTErDrFyHqYduAP9fElUagKUezkkwjx1dYEuUjWuWMEFG6w0s+rYoqHToFEjQtazivuWYw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707129613; c=relaxed/simple;
	bh=Pi6euJLSnj2co6H/IooWtWX35oWGVFQDRFlDcv+0sck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0WHV88G4rwESDwxbuFdZ9HdNb5SwlpRJoV4LTnIywWUssbQByHbR6Ath3cHw7T9kgh0RUJJrsrppyjcR7rsKrnGDKrdiFpu7l7ZL8lPULFiHrvK6E53ad9DAf2LPxd+gFHDo8nVtuqwhZiXhQ3xmLEoDlrbgjfMY55ElqiqMcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pOXBKu2U; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/XPiUugopTvJyLAW30gfJ0WGytmJrayjsJOj85rr9tA=; b=pOXBKu2U2s9ahudf5rB1rX1L9T
	nCn5+N8MrXtz+PeaZKjGCZ4EJUpy6oQZKCXwx4AqGkqmEDpNN381D05iUCB2y98Ec2or/6s8vz5YN
	nIIEvx9xSdl7F/zlMQnA5orfDEtXrAwmOCs+jjhU/Nhgmd8gV3ASuOGqX/YGpVTSB7jkUmSanOUVp
	hpLhLoNp8xCeqNs9lANdusVHZs0I7Dm1/px7bnjQnHJddXouvQpSqAOg/HHw28yZKeUlkKAAIqNbo
	Myh4c8TE3eYlndJLUJogiJMUiXBgwLxDaxMXevigd1m1K+eMySJ3khsrqapGoNzNF/9v5vPAZnxRd
	9aOKIeaw==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWwOJ-00000002rJF-3GlM;
	Mon, 05 Feb 2024 10:39:55 +0000
Message-ID: <8f3bab1f-8697-40c0-91f2-de934b4b9ddb@infradead.org>
Date: Mon, 5 Feb 2024 02:39:53 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] linux: v4l2-vp9.h: Fix kerneldoc
Content-Language: en-US
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Ricardo Ribalda <ribalda@chromium.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Bin Liu <bin.liu@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-amlogic@lists.infradead.org, Sakari Ailus <sakari.ailus@iki.fi>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
 <20240126-gix-mtk-warnings-v1-17-eed7865fce18@chromium.org>
 <ZbTTb-SdK-EubGdc@valkosipuli.retiisi.eu>
 <201ae1d1-1e03-40e2-9cc4-49df70abb8da@xs4all.nl>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <201ae1d1-1e03-40e2-9cc4-49df70abb8da@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/5/24 02:29, Hans Verkuil wrote:
> On 27/01/2024 10:57, Sakari Ailus wrote:
>> Hi Ricardo,
>>
>> On Fri, Jan 26, 2024 at 11:16:16PM +0000, Ricardo Ribalda wrote:
>>> Kerneldoc cannot understand arrays defined like
>>> v4l2_frame_symbol_counts.
>>>
>>> Adding an asterisk to the name does do the trick.
>>>
>>> Disable the kerneldoc notation for now, it is already ignored:
>>> https://docs.kernel.org/search.html?q=v4l2_vp9_frame_symbol_counts
>>
>> Wouldn't it be nicer to fix kerneldoc instead? It might not be difficult at
>> all.
>>
>> Feel free to, but I can also give it a try.
>>
> 
> It would be nice to have this fixed in kerneldoc itself. I'm holding this
> patch back for two weeks to see if someone wants to work on kerneldoc.
> 
> If not, then I'll take this anyway to fix the noise in our build.
> 
> Note that while this header is indeed ignored in the documentation, that
> is really more a bug and it would be nice to actually include this header
> somewhere in our documentation. So fixing these kerneldoc warnings one way
> or another is something that we should do.
> 

It's just waiting for Jon to apply it: (from Sakari)

https://lore.kernel.org/all/20240131084934.191226-1-sakari.ailus@linux.intel.com/

Thanks.

-- 
#Randy

