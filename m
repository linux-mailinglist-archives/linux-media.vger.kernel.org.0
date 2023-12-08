Return-Path: <linux-media+bounces-1958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AC080A569
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 15:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 464891F21381
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 14:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507B71DFF3;
	Fri,  8 Dec 2023 14:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CAU8odPT"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25F61723;
	Fri,  8 Dec 2023 06:27:43 -0800 (PST)
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E1C966607345;
	Fri,  8 Dec 2023 14:27:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702045662;
	bh=efYtITyNsFiFIi+e+l1ojNqpEaMleRUVTqmCOoiQxZQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CAU8odPTNTAbnHxRPszYtTDVTIt7f/NK4sTez4Mp6MrIyViPy/249UXXtGPRYdZbi
	 HeZ3/XkUKTC9tkQWkevL1V+JfdQrUBbacYQMzIOnTJc2xqrVEywDT0+emF16C733tD
	 l2FXxZtRtQXRsq9qLWOF97TN7pU2teyMw4dI58xR6oZIGWLU3gwj8d+1NecEszCIOl
	 bdo44wLss6/c0dCwVDJ5PNTN3fG/AuX6hDTt0vFhJozumtgVmX54U8Q7ZkxiRK1sbp
	 XR+Yg9Rk1AZk0BLjUsstd1SazKDwspwX3ZVpZoxg5jox8qzvXetY5RJRsQVld1Z/Tu
	 ohYSIvAN7VOkw==
Message-ID: <62893af3-9a11-404a-93b0-1005e5670547@collabora.com>
Date: Fri, 8 Dec 2023 15:27:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: i2c: add MAX96714 driver
To: devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc: kernel@collabora.com
References: <20231208140217.457609-1-julien.massot@collabora.com>
 <20231208140217.457609-4-julien.massot@collabora.com>
Content-Language: en-US
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20231208140217.457609-4-julien.massot@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/8/23 15:02, Julien Massot wrote:
> This driver handle the MAX96714 deserializer in tunnel mode.
> The CSI output will replicate all the CSI traffic capture by
> the remote serializer.
>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
>   .../bindings/media/i2c/maxim,max96714f.yaml   | 112 +--
>   MAINTAINERS                                   |   6 +
>   drivers/media/i2c/Kconfig                     |  13 +
>   drivers/media/i2c/Makefile                    |   1 +
>   drivers/media/i2c/max96714.c                  | 945 ++++++++++++++++++
>   5 files changed, 1021 insertions(+), 56 deletions(-)
>   create mode 100644 drivers/media/i2c/max96714.c
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714f.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714f.yaml
> index 405d02368f64..8a2a06e7e279 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714f.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714f.yaml
> @@ -95,69 +95,69 @@ examples:
>       #include <dt-bindings/media/video-interfaces.h>
>   
>       main_i2c2 {
> -            #address-cells = <1>;
...
I will resend a new version (v2) with dt-binding changes squashed with 
1/4 dt-bindings: media: add Maxim MAX96714F GMSL2 Deserializer



