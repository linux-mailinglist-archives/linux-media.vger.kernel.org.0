Return-Path: <linux-media+bounces-47242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D64C1C67C8D
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 07:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5616D35B9DF
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 06:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9E32EAB6E;
	Tue, 18 Nov 2025 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="yUfSSp5/"
X-Original-To: linux-media@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF6C2DF14C;
	Tue, 18 Nov 2025 06:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763448738; cv=none; b=Es9Kg6lkqxRLnph88PvnM3FicYnrUSdGV2NJ+4B4IZ1JYfiSYAn/b6Y1fdtUcaX4dX8o48aK0g8ux0xprNzVMl2v1THKNiDybIxle6DVFvJqeP9+bEAVjmJHWyp0LIdY2wkna9TDFBKC9zbnqwXCzuMEQpBc9Ti7LWG/s0AYDjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763448738; c=relaxed/simple;
	bh=/BVIUoRrDlh9vtAUkprERJclpkGdtxjVqDLLXR6j3i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzA7W/hygW7G9KRp5urcOZc+dshJ6Ur7aVWdE8NouodyARbceJu9SHax7m2hiwqVl9DUnfcardXgSmeWF8WIfsestBSaoOssoA6n0smuawzAXThlvbPM+a/4qtaMEB0RB7qmXx7uIrD8JH5ccWltd/hwa88AbTQKEP7AR0CxHOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=yUfSSp5/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=PKdU+SuMxQVQRm/oRdzeN9Dv7ebkdOSs/qG7Ulmy45o=; b=yUfSSp5//kxGqi5HhjXbbsbj2b
	F+3ZtbTVHAH4bvk0IITiYCbPFnvODDU59opuMoDlIezgVUzHLA6fsb6lziAd+/Qluf+1VKzAcaW94
	GDWP8LKJHW8Ygmixgzqih+JpzxWRBtwI1O0DzWB3fZT74XIwhjjxaBVmAgtmf6GowpGPO/1R0fMPz
	JTSjbxl4whNWhiQRGhh4CUfJByYAt4sZjXC2udm2n3rYQuxuIOESvi60LSA+AK/wmsTfLStyl9I6d
	Wk9d2sbvWQLRmr+1+yYAO/A4WpndsVxc0OwLt0eq5yqzZcgLsZ95l7P2p7Z/bxgpOPRyK6bTjtZQm
	tiM7siZw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLFZX-0000000HVxz-3WDH;
	Tue, 18 Nov 2025 06:52:15 +0000
Message-ID: <8dafb220-aa22-4412-b4a9-0b57b5ff6eea@infradead.org>
Date: Mon, 17 Nov 2025 22:52:15 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] docs: media: v4l2-ioctl.h: document two global
 variables
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <cover.1763291890.git.mchehab+huawei@kernel.org>
 <fc7e0f482b17fe9dc663848c469265205ea0f6ae.1763291890.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <fc7e0f482b17fe9dc663848c469265205ea0f6ae.1763291890.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/16/25 3:23 AM, Mauro Carvalho Chehab wrote:
> The media kAPI has two global variables at v4l2-ioctl.h. Document
> them.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

LGTM.

Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  include/media/v4l2-ioctl.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/include/media/v4l2-ioctl.h b/include/media/v4l2-ioctl.h
> index 6f7a58350441..ed63841a100c 100644
> --- a/include/media/v4l2-ioctl.h
> +++ b/include/media/v4l2-ioctl.h
> @@ -663,7 +663,22 @@ void v4l_printk_ioctl(const char *prefix, unsigned int cmd);
>  struct video_device;
>  
>  /* names for fancy debug output */
> +
> +/**
> + * var v4l2_field_names - Helper array mapping V4L2_FIELD_* to strings.
> + *
> + * Specially when printing debug messages, it is interesting to output
> + * the field order at the V4L2 buffers. This array associates all possible
> + * values of field pix format from V4L2 API into a string.
> + */
>  extern const char *v4l2_field_names[];
> +
> +/**
> + * var v4l2_type_names - Helper array mapping V4L2_BUF_TYPE_* to strings.
> + *
> + * When printing debug messages, it is interesting to output the V4L2 buffer
> + * type number with a name that represents its content.
> + */
>  extern const char *v4l2_type_names[];
>  
>  #ifdef CONFIG_COMPAT

-- 
~Randy

