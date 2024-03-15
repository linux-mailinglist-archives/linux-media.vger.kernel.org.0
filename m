Return-Path: <linux-media+bounces-7150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE1787D0E6
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 17:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CC17281CF4
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 16:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F9144C76;
	Fri, 15 Mar 2024 16:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="s0bC/Kl0"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FA64086B
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 16:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710518609; cv=none; b=JGoDieYr/t+/n9wlq7CoGEE8SKFLZXvfLujzFjoUyOEyhrMtsnBxYgNFnwhJTVRkiKoAt+qMFTE5XiWN9wgcdCIMhRwckYtMEFqbs2ke1rnS3Uiwcxx/IjN99C1mEaiIvqdDQm7ZsJ+HbtSTOdxeZ80potkNmekOc23EK3IVSvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710518609; c=relaxed/simple;
	bh=jp9P36fi3UtsOCd0576Bc1QJLhvRV4xWpScJi7ANAj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dBcA5SFj50d+90PGwyMihjnqRUF7aLGn09lq7f30JEq7wHloLj5uEFt8BaOt4pIoPMrzYsabGo9zlq79BvImPqZe/HVtkq0f424BQ6PrEOAfhK7r/gIE66uGel2RKuVOdN41hQ9z0KiREru9A3fpPVUsYOv5d6r4Qa1qGywO+qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=s0bC/Kl0; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710518605;
	bh=jp9P36fi3UtsOCd0576Bc1QJLhvRV4xWpScJi7ANAj8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s0bC/Kl0F9y4M0joduex/QVZJcpSB3qkSa47hlUuiFCSvLYGzwUPNMEqn3rBq76N0
	 fHFGHBbVRxEHiIXs54IDqUU0OzBgFcM8geVOMjJEtK+kW79KlIsZ/D/enIWBxiASQn
	 +xScXm/JzLwQ8ZCYQ/fD2ZTFggfKv9JNCRCM/gLIRMyhW5Z38pVCQHhcWJ6BK4rJ4S
	 B5JeRt+ML5UTiC+khyRxFZ7BhffkO/lsgTrcA0WtyYcUkfHzVbthSKdHIVkWE9loUn
	 291nP/RvrBT3uHWS2vnsWogS6kMkPmlZi5I4qPUhOnlGOAwR8azrfAOZzHDdSJ/q37
	 MwwriAd01Lhiw==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4D9243782110;
	Fri, 15 Mar 2024 16:03:24 +0000 (UTC)
Message-ID: <a7fdcf35-ebd0-428a-9425-c7034e467c9a@collabora.com>
Date: Fri, 15 Mar 2024 17:03:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 23/38] media: uapi: ccs: Add media bus code for MIPI
 CCS embedded data
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
 hongju.wang@intel.com, hverkuil@xs4all.nl,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 "Ng, Khai Wen" <khai.wen.ng@intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-24-sakari.ailus@linux.intel.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-24-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:25, Sakari Ailus wrote:
> Add new MIPI CCS embedded data media bus code
> (MEDIA_BUS_FMT_CCS_EMBEDDED).
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>   .../media/v4l/subdev-formats.rst              | 28 +++++++++++++++++++
>   include/uapi/linux/media-bus-format.h         |  3 ++
>   2 files changed, 31 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index cbd475f7cae9..c8f982411e70 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -8564,3 +8564,31 @@ and finally the bit number in subscript. "X" indicates a padding bit.
>         - X
>         - X
>         - X
> +
> +.. _MEDIA-BUS-FMT-CCS-EMBEDDED:
> +
> +MIPI CCS Embedded Data Formats
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines a
> +metadata format for sensor embedded data, which is used to store the register
> +configuration used for capturing a given frame. The format is defined in the CCS
> +specification. The media bus code for this format is
> +``MEDIA_BUS_FMT_CCS_EMBEDDED``.
> +
> +The CCS embedded data format definition includes three levels:
> +
> +1. Padding within CSI-2 bus :ref:`Data unit <media-glossary-data-unit>` as
> +   documented in the MIPI CCS specification.
> +
> +2. The tagged data format as documented in the MIPI CCS specification.
> +
> +3. Register addresses and register documentation as documented in the MIPI CCS
> +   specification.
> +
> +The format definition shall be used only by devices that fulfill all three
> +levels above.
> +
> +This mbus code are only used for "2-byte simplified tagged data format" (code
> +0xa) but their use may be extended further in the future, to cover other CCS
> +embedded data format codes.
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index d4c1d991014b..03f7e9ab517b 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -183,4 +183,7 @@
>   #define MEDIA_BUS_FMT_META_20			0x8006
>   #define MEDIA_BUS_FMT_META_24			0x8007
>   
> +/* Specific metadata formats. Next is 0x9002. */
> +#define MEDIA_BUS_FMT_CCS_EMBEDDED		0x9001
> +
>   #endif /* __LINUX_MEDIA_BUS_FORMAT_H */

-- 
Julien Massot
Senior Software Engineer
Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

