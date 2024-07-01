Return-Path: <linux-media+bounces-14464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D579D91DC32
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 12:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10D0C1C21079
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 10:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D3612DDBF;
	Mon,  1 Jul 2024 10:16:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73EC112D1EA
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 10:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719828998; cv=none; b=WdEgn5A5UW8itQRPuqZweu1KBBHrvhJN5FXDYsgEh3tvVClhSR83rLr/Thgxu4EDlKZjs4YcQ18AVqYU80WuOG1LshWpDBY4xydQsxYfzoev9vAqDbxFUp5oxbj0uJpft0sYcO9pTb7zfPzhtocJE1YUOe+QsN58SjxJTeN5prM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719828998; c=relaxed/simple;
	bh=1oLewmcy0vRKIVUlzNgxiiDAU1wsuWipvuG13FoxmoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XF08AaK6fucNgHpTJZYvL4/nKY46mSjcAeiSxHs8iZzORTuP4p7mr4yITUA6XHx2g3DdXy9fRzKb//zeoZ0JONw6BpUybqCDT1rsKMYp6UeKD1Qp8uGAupVNaZO53VT4a1UoVqDSR1Vkpe9NaT1uleCrC3tAVJMtPygF7K03PNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6C6B339;
	Mon,  1 Jul 2024 03:17:00 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB5EA3F762;
	Mon,  1 Jul 2024 03:16:29 -0700 (PDT)
Message-ID: <9dd07016-9666-4564-9369-b76a30a6fec9@arm.com>
Date: Mon, 1 Jul 2024 11:16:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] hwtracing: use for_each_endpoint_of_node()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
References: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com>
 <878qyl970c.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <878qyl970c.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2024 03:32, Kuninori Morimoto wrote:
> We already have for_each_endpoint_of_node(), don't use
> of_graph_get_next_endpoint() directly. Replace it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: James Clark <james.clark@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-platform.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 57a009552cc5..64e171eaad82 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -275,7 +275,7 @@ static int of_get_coresight_platform_data(struct device *dev,
>   	 */
>   	if (!parent) {
>   		/*
> -		 * Avoid warnings in of_graph_get_next_endpoint()
> +		 * Avoid warnings in for_each_endpoint_of_node()
>   		 * if the device doesn't have any graph connections
>   		 */
>   		if (!of_graph_is_present(node))
> @@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
>   	}
>   
>   	/* Iterate through each output port to discover topology */
> -	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
> +	for_each_endpoint_of_node(parent, ep) {
>   		/*
>   		 * Legacy binding mixes input/output ports under the
>   		 * same parent. So, skip the input ports if we are dealing


Applied to coresight next

https://git.kernel.org/coresight/c/2e5657aa5966

Thanks
Suzuki


