Return-Path: <linux-media+bounces-7152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD9D87D0F5
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 17:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82B2A1F22891
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 16:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA7544C7E;
	Fri, 15 Mar 2024 16:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UQEz0bMe"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A227B45BF1
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 16:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710519046; cv=none; b=PTf1XAVkwvfOryfINmso/dVveena03ydeWE2Z6xmXYXmDpxO3korW6wtWLWlxWPpQlqnlIZ2MOgtZrPUNZUNBUPr3dcckX6rq9Got0tXwN3r/+YpUJl9NWKSyq/Pn39vKwyprfIl6aKJwof1ecSZKP/bWx6c5siWIoXpkf1hgjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710519046; c=relaxed/simple;
	bh=YCLQRQwIPRXkbIdfOax5fGRYAw0v/W8IsSJc5iqfjXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q/ZA90i0RS1ZePsCdcTA4LX43dk7Gxc1tKSBE77UY2GpmRzRQhCzIZ70uuP2e/VPcCd/wyRCZbOVa+sCKnCOnKXnIfumb7tpI+Z+t/WDhkGE2cMoQFjBlF5pAaAfpQ2Ic31PApSQ+XuL8C8eI8RV9XbprMqse2DUTC8Q3B0l7r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UQEz0bMe; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710519042;
	bh=YCLQRQwIPRXkbIdfOax5fGRYAw0v/W8IsSJc5iqfjXY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UQEz0bMel0V5m38DHvS2M0IXlz+ucV7ZlGKORD79PxZxO+WepjMTgyEwtRiHW5nil
	 wZYdplNn1jPSTS7c/rEwOVE+6hCQvc40L+N40Cb3SHblzJxofAApAOPYAPZFt94njD
	 u+PZIYcjRC/fdLEN3VYtGCPmLpWKuKee/T8CKoXXJUnIHo6++6w+qrVSxKmTbfW0vw
	 H2YN00ygWG56sV4euAdILG66SanQve8D/Ewg34r9D/+UQEmG6dTZdAz4OXB/yy77Ww
	 bXurQ75AL7hE5r+cFxMWPC4h5QnLVTrUWJ+qv7C+hTc9hOnsAkiXFSvkyT4vO0Ruth
	 v7pOiMYocCNJw==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 821123782110;
	Fri, 15 Mar 2024 16:10:41 +0000 (UTC)
Message-ID: <564e263e-4e91-439b-a23c-4ea10ca1ec91@collabora.com>
Date: Fri, 15 Mar 2024 17:10:40 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 32/38] media: uapi: Add media bus code for ov2740
 embedded data
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
 <20240313072516.241106-33-sakari.ailus@linux.intel.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-33-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:25, Sakari Ailus wrote:
> Add a media bus code for ov2740 camera sensor embedded data and document
> it.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>   .../media/v4l/subdev-formats.rst              | 66 +++++++++++++++++++
>   include/uapi/linux/media-bus-format.h         |  3 +-
>   2 files changed, 68 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index ca4da6a400ff..a875868ed951 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -8594,3 +8594,69 @@ This mbus code are only used for "2-byte simplified tagged data format" (code
>   embedded data format codes.
>   
>   Also see :ref:`CCS driver documentation <media-ccs-routes>`.
> +
> +Omnivision OV2740 Embedded Data Format
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The Omnivision OV2740 camera sensor produces the following embedded data format.
> +
> +.. flat-table:: Omnivision OV2740 Embedded Data Format. Octets at indices marked
> +                reserved or unused have been omitted from the table.
> +    :header-rows: 1
> +
> +    * - Byte
> +      - Concent description
> +    * - 0
> +      - Sensor info
> +    * - 4
> +      - Analogue gain (bits 10--8)
> +    * - 5
> +      - Analogue gain (bits 7--0)
> +    * - 6
> +      - Coarse integration time (bits 15--8)
> +    * - 7
> +      - Coarse integration time (bits 7--0)
> +    * - 10
> +      - Dpc correction threshold (bits 9--2)
> +    * - 15
> +      - Output image width (bits 15--8)
> +    * - 16
> +      - Output image width (bits 7--0)
> +    * - 17
> +      - Output image height (bits 15--8)
> +    * - 18
> +      - Output image height (bits 7--0)
> +    * - 23
> +      - MIPI header revision number
> +    * - 31
> +      - Vertical (bit 1) and horizontal flip (bit 0)
> +    * - 32
> +      - Frame duration A
> +    * - 33
> +      - Frame duration B
> +    * - 34
> +      - Context count
> +    * - 35
> +      - Context select
> +    * - 54
> +      - Data pedestal (bits 9--2)
> +    * - 63
> +      - Frame average (bits 9--2)
> +    * - 64
> +      - Digital gain red
> +    * - 65
> +      - Digital gain red
> +    * - 66
> +      - Digital gain greenr
> +    * - 67
> +      - Digital gain greenr
> +    * - 68
> +      - Digital gain blue
> +    * - 69
> +      - Digital gain blue
> +    * - 70
> +      - Digital gain greenb
> +    * - 71
> +      - Digital gain greenb
> +    * - 89
> +      - Frame counter
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 03f7e9ab517b..13e68c2ccb61 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -183,7 +183,8 @@
>   #define MEDIA_BUS_FMT_META_20			0x8006
>   #define MEDIA_BUS_FMT_META_24			0x8007
>   
> -/* Specific metadata formats. Next is 0x9002. */
> +/* Specific metadata formats. Next is 0x9003. */
>   #define MEDIA_BUS_FMT_CCS_EMBEDDED		0x9001
> +#define MEDIA_BUS_FMT_OV2740_EMBEDDED		0x9002
>   
>   #endif /* __LINUX_MEDIA_BUS_FORMAT_H */

-- 
Julien Massot
Senior Software Engineer
Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

