Return-Path: <linux-media+bounces-23342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 229EE9EF199
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 17:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C5D51896CFA
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 16:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FE922A7FA;
	Thu, 12 Dec 2024 16:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="R3TgZfLu"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A361F222D4B;
	Thu, 12 Dec 2024 16:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734020142; cv=pass; b=jaZhsdDhrAi5doxLGHdY8aqQsJVzuML1AlRDgME68Rds8DFY1V9typHXw9RU2ZcA0VMGRxfWPOnQVsBVHnZt+5kczdmOsT5Alybqn7SsXAl2NT87t63X4Pqj77JdmnQOoGS2h73vnK6tOiKnWmIN1lGGLd23CDKtk0n7pzwVRys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734020142; c=relaxed/simple;
	bh=lGuYiFBYJFiWdZHwOkETmoz+tsse0jRwHByzVD05hFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XJeo3Ke+FWPej0SFG72oS3qfjsXIAYsExUv+laMMPpIaz32BNZG2wbOu3ddZs9VF8dO2w2Aq02cDYNCMfzPZwEOlLUj0e6YimveuL+dVEuGZcWvdXzDQ8Kp43DI9o1lHiGnA9xtkWld4C53QgaTNsgA/r9iRzVVqhWcGVRACLes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=R3TgZfLu; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1734020117; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nFIkIZJ1xuLhG7CnV7y/LlyF7GMO4DNKYynUuDDfONJ9IJ/6c+vLKjieOSVWF2MEyhdi36wNFpuHUWzE6/Jd5Ow1DDEUVhLGM+EIG4tYMSpLYAgekkJy91EIknKTvNPIqJhzxWqmjKO6Ns6rqBLgg/xTG/qCWUXUYKKK0w1vJqI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734020117; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PBCtB4P7LoVsX+UGrbBFWgz4hUvi2N2icOGRXyods1c=; 
	b=D3EwNniM2uODf0UlYsxmeJoz5wZstD1V5P9/VWDm8fwnImRVr9FbdlONAO7bSWeOlw2KNZNIg7A9GhmecqhryYamQTVgVmJk46j51nI0+gr5GBhawmwwYa5yOxOOfl0Y+DHGitxF9MqpYS6Vg50X6k+nf89CZS1x3z5IC72Pb+Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734020117;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PBCtB4P7LoVsX+UGrbBFWgz4hUvi2N2icOGRXyods1c=;
	b=R3TgZfLusnXNGOwnGXLv3tZEKdrfCkswpUKAUHr2kRAxHcU6ZcG0YTqR1hkLY9Vl
	UDFK3dWbQZZy+kUHhKocKBZcAnpDtMkNc0C7jRavwZp8UCv6sXHqrTwgc87sUGaqj9e
	P65sFgEsSoMlRX7NYmIBLHqUlOGQjxdXmsFAaIzo=
Received: by mx.zohomail.com with SMTPS id 17340201149634.725551844082247;
	Thu, 12 Dec 2024 08:15:14 -0800 (PST)
Message-ID: <21db56f1-ee5d-4309-8fa6-5aaf92782885@collabora.com>
Date: Thu, 12 Dec 2024 17:15:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] media: verisilicon: fix reference padding issue
To: Fabio Estevam <festevam@gmail.com>
Cc: p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <01020193bb8a24ad-99eafebb-3b0b-40c0-9b28-3a0dbc84327a-000000@eu-west-1.amazonses.com>
 <CAOMZO5DgW3YrpMJPCTzQ-LZCopB4tNPoJhyFQrr6RBvbnBu4VA@mail.gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <CAOMZO5DgW3YrpMJPCTzQ-LZCopB4tNPoJhyFQrr6RBvbnBu4VA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 12/12/2024 à 17:10, Fabio Estevam a écrit :
> On Thu, Dec 12, 2024 at 12:43 PM Benjamin Gaignard
> <benjamin.gaignard@collabora.com> wrote:
>> Hantro hardware is splited into two parts: the decoder which produce
>> tiled pixels formats and the post-processor which produce raster pixels
>> formats.
>> When post-processor is used the selected pixels format may not have the
>> some padding/stride than the decoder output pixels format. This led to
>> miscomputing chroma and motion vectors offsets so data are overlapping.
>> This series introduce a reference pixels format that decoder use to
>> compute the various needed offsets and size.
>>
>> With this series Fluster for VP9 tests is now 207/305 vs 145/305.
>> HEVC test score isn't impacted by these patches (still 141/147).
>>
>> Version 2:
>> - rebased on top of media-commiter/next
>> - Add reviewed-by tags
>>
>> Benjamin Gaignard (2):
>>    media: verisilicon: Store reference frames pixels format
>>    media: verisilicon: Fix IMX8 native pixels format steps values
> Do both patches deserve a Fixes tag?

There is dependency in around hevc compress feature in post-proc code.
I don't think it could be applied on stable kernel


