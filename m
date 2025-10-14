Return-Path: <linux-media+bounces-44380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F269CBD84CE
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 10:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E50494E6F3C
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 08:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3613B2E0B74;
	Tue, 14 Oct 2025 08:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WaPc2BRM"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D31E2DE1FA;
	Tue, 14 Oct 2025 08:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760432096; cv=none; b=R95odEbob44S+SJh8I37l3y72masKBMcVGL5ONOHkRibKGoNAJDBI0CVALNCv3bmBKoEpHBjwGyn2cz6PfnL4/R05TUvHY4qi2/z6r/uycCOfmWmXlU6UXIpGz5hNi1t3SefAbFkMYFzgSLORdvJVqGfk/UtKkrK5JSOHOG+Nlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760432096; c=relaxed/simple;
	bh=bepUQbrGttB/U3jbIE3oO/Sn/Mcj/LgtFELZpY005IE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtT2TSTTNJgkpGm1gpHMUXAQsIYVdMUQisDpoA+kraa/NLQUC1imr9AIgDQ1DT0mzczMjhpQYjAqnlFwyY/iXy6lAo78Khk8pVqWObo7ZLnx/4a5RYRHg36nVs2MGgSj97kCQ4Iy3z85A0NMwakhOfiqpniOT4tPl1jDKE2/uy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WaPc2BRM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760432092;
	bh=bepUQbrGttB/U3jbIE3oO/Sn/Mcj/LgtFELZpY005IE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WaPc2BRMFp+RTe3E+BZ3HSPzFO/30hD0z7pwsBxev4SSXiKZW3DpSWLkm2/v67GZa
	 UgX8aza9Qt1n56vlrTZGhQIsr7/+TnSiyb61TI/7xnAdbgq+ISSLDQCJMIQwpH1mBP
	 PI+O5E8HQS5aM+ggKHGSHRYqfZaxUprVkJ4uWV7G7p7ShUY1JdvVDZm6Pt67SWMXFf
	 OUcpbLYApV/84ezSRbYj8G1xd9sEKSHav0lOt9NhA6sUWIEH3egbO2vsQQHVbf7dOj
	 b6QQaXuSAzPgsfN3se6c/D1+WWGAdl2RDnnsRjT643G7lNJt+OldRGaX3g40ybb4xw
	 2F4GEtMKkFjTA==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B55B917E04DA;
	Tue, 14 Oct 2025 10:54:51 +0200 (CEST)
Message-ID: <e4672b5e-8f22-4220-b666-4aad06787c71@collabora.com>
Date: Tue, 14 Oct 2025 10:54:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 8/8] media: Documentation: kapi: Add v4l2 generic ISP
 support
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20251014-extensible-parameters-validation-v7-0-6628bed5ca98@ideasonboard.com>
 <20251014-extensible-parameters-validation-v7-8-6628bed5ca98@ideasonboard.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20251014-extensible-parameters-validation-v7-8-6628bed5ca98@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jacopo,

Thanks for your efforts!

On 10/14/25 10:01, Jacopo Mondi wrote:
> Add to the driver-api documentation the v4l2-isp.h types and
> helpers documentation.
> 
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  Documentation/driver-api/media/v4l2-core.rst |  1 +
>  Documentation/driver-api/media/v4l2-isp.rst  | 49 ++++++++++++++++++++++++++++
>  MAINTAINERS                                  |  1 +
>  3 files changed, 51 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
> index ad987c34ad2a8460bb95e97adc4d850d624e0b81..a5f5102c64cca57b57b54ab95882b26286fb27de 100644
> --- a/Documentation/driver-api/media/v4l2-core.rst
> +++ b/Documentation/driver-api/media/v4l2-core.rst
> @@ -27,3 +27,4 @@ Video4Linux devices
>      v4l2-common
>      v4l2-tveeprom
>      v4l2-jpeg
> +    v4l2-isp
> diff --git a/Documentation/driver-api/media/v4l2-isp.rst b/Documentation/driver-api/media/v4l2-isp.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..42c2550602979609e92a09e3cd1fe3dcbafd6416
> --- /dev/null
> +++ b/Documentation/driver-api/media/v4l2-isp.rst
> @@ -0,0 +1,49 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +V4L2 generic ISP parameters and statistics support
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +Design rationale
> +================
> +
> +ISP configuration parameters and statistics are processed and collected by
> +drivers and exchanged with userspace through data types that usually
> +reflect the ISP peripheral registers layout.
> +
> +Each ISP driver defines its own metadata capture format for parameters and
> +a metadata output format for statistics. The buffer layout is realized by a
> +set of C structures that reflects the registers layout. The number and types
> +of C structures is fixed by the format definition and becomes part of the Linux
> +kernel uAPI/uABI interface.
> +
> +Because of the hard requirement of backward compatibility when extending the
> +user API/ABI interface, modifying an ISP driver capture or output metadata
> +format after it has been accepted by mainline is very hard if not impossible.
> +
> +It generally happens, in facts, that after the first accepted revision of an

s/in facts/in fact

> +ISP driver the buffer layout need to be modified, either to support new hardware

s/need/needs

> +blocks, fix bugs found later on or support different revisions of the same IP.
> +
> +Each of these situation would require defining a new metadata format, making it

s/situation/situations

> +really hard to maintain and extend drivers and requiring userspace to use a
> +the correct format depending on the kernel revision in use.
> +
> +V4L2 ISP configuration parameters
> +=================================
> +
> +For these reasons, Video4Linux2 defines generic types for ISP configuration
> +parameters and statistics. Drivers are still expected to define their own
> +formats for their metadata output and capture nodes, but the buffer layout can
> +be defined using the extensible and versioned types defined by
> +include/uapi/linux/media/v4l2-isp.h.
> +
> +Drivers are expected to provide the definitions of their supported ISP blocks,
> +the control flags and the expected maximum size of a buffer.
> +
> +For driver developers a set of helper functions to assist them with validation
> +of the buffer received from userspace is available in the form of helper
> +functions in drivers/media/v4l2-core/v4l2-isp.c

"helper function" is used twice, maybe:

A set of helper functions that assist driver developers with the
validation of the buffer received from userspace is available in
drivers/media/v4l2-core/v4l2-isp.c
?

> +
> +V4L2 ISP support driver documentation
> +=====================================
> +.. kernel-doc:: include/media/v4l2-isp.h
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 59ab4a34f72c0430a8d7966942acb2242ad923ca..3cc24092995bcb01051cc301ca212c32938cf745 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26857,6 +26857,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
>  M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/driver-api/media/v4l2-isp.rst
>  F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
>  F:	drivers/media/v4l2-core/v4l2-isp.c
>  F:	include/media/v4l2-isp.h
> 

With the comments above addressed,

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael


