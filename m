Return-Path: <linux-media+bounces-12154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF46A8D366B
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 14:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 700041F26750
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 12:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D879181308;
	Wed, 29 May 2024 12:30:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77888647;
	Wed, 29 May 2024 12:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716985818; cv=none; b=k1g1msfgw8WzuVNWjLwVkzyNLRD28jJfCc1NcehB0uTtnmWFaNQEabNNMjpV0pZhFknqF3D6F5y3eZ0XxwNJB377WuN0tGkMIlL3VAGuFzu2jFVFh7GUQvFdcedFtwx/RPX8AhurA8BRa5mU3Kjsqgd1wPj8gg/iCgYXMYuBFZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716985818; c=relaxed/simple;
	bh=DGfatGcTzFpAvYuN4A7ArzVL/lkr9IM2WyCWk2K7P+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YWNoT2NMP2EpgGZYNVBQgbx4Uh7j8lgA/zZSPoyi1ZnFhJSE5YAnTp+65M6LEvJy7RZTEVZjnWwwOGI28BHe4hGMihLXWedIQNmZzYG866kLUXj2EkMyS/Y+ug2bykQNlKSD1lMMIeCVYsjc+QFq1MjeE/baQMcc3VrCWLt824g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D024D339;
	Wed, 29 May 2024 05:30:39 -0700 (PDT)
Received: from [192.168.1.100] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B1073F762;
	Wed, 29 May 2024 05:30:12 -0700 (PDT)
Message-ID: <941db167-fda5-4d57-9623-58d8b8c0a7b5@arm.com>
Date: Wed, 29 May 2024 13:30:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 resend 2/8] hwtracing: use for_each_endpoint_of_node()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 prabhakar.csengg@gmail.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Eugen Hristev <eugen.hristev@collabora.com>, Rob Herring
 <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
 <87fru14hl7.wl-kuninori.morimoto.gx@renesas.com>
 <20240529004047.GB1436@pendragon.ideasonboard.com>
Content-Language: en-US
From: James Clark <james.clark@arm.com>
In-Reply-To: <20240529004047.GB1436@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/05/2024 01:40, Laurent Pinchart wrote:
> Hi Morimoto-san,
> 
> Thank you for the patch.
> 
> On Tue, May 28, 2024 at 11:55:32PM +0000, Kuninori Morimoto wrote:
>> We already have for_each_endpoint_of_node(), don't use
>> of_graph_get_next_endpoint() directly. Replace it.
>>
>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>  drivers/hwtracing/coresight/coresight-platform.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
>> index 9d550f5697fa8..e9683e613d520 100644
>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>> @@ -275,7 +275,7 @@ static int of_get_coresight_platform_data(struct device *dev,
>>  	 */
>>  	if (!parent) {
>>  		/*
>> -		 * Avoid warnings in of_graph_get_next_endpoint()
>> +		 * Avoid warnings in for_each_endpoint_of_node()
>>  		 * if the device doesn't have any graph connections
>>  		 */
>>  		if (!of_graph_is_present(node))
>> @@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
>>  	}
>>  
>>  	/* Iterate through each output port to discover topology */
>> -	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
>> +	for_each_endpoint_of_node(parent, ep) {
>>  		/*
>>  		 * Legacy binding mixes input/output ports under the
>>  		 * same parent. So, skip the input ports if we are dealing
> 
> I think there's a bug below. The loop contains
> 
> 		ret = of_coresight_parse_endpoint(dev, ep, pdata);
> 		if (ret)
> 			return ret;
> 
> which leaks the reference to ep. This is not introduced by this patch,
> so
> 

Nice catch, I will send a patch.

Also:

Reviewed-by: James Clark <james.clark@arm.com>

> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 

