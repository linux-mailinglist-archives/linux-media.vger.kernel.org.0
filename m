Return-Path: <linux-media+bounces-7145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 578F987D0A4
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 16:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89CED1C226E5
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 15:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B28845942;
	Fri, 15 Mar 2024 15:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BpSkZhko"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74CD4086B
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 15:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710517841; cv=none; b=fJtd8MGCOX+34ue9QqbA2oz3ikOyYzSTYZ2FUxK6YXeWWx3cu1dVzql1DtRQoMqlOuQJFETe4Uvl60po6ca69mFASejYFpJKrDAhnQniLub3YfH7F5Bs0D6vcp3Gsg4at6466k7raLQ1qLbj9dvH8uGYjx+SMimSAFIi3nENCIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710517841; c=relaxed/simple;
	bh=TwSkaYlUCetTup9eOgljpGzy2R9XYVMQTBRDsFcheHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TRPCS7Ax3Dk8enQdv9DmHRfAMsqqHhwiVxYaE6AekX88XywNfhbo53Jw29RZSJBS3+5hhFWYfswOKKLlqVMukEkAk6EMi8lHV0GFX3g6jShkMwrH+EOZIRwncXMXXux7NI0G7pAbDObvgAiTjY5dZwvzSPPQvp9dcw1MxTV41Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BpSkZhko; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710517838;
	bh=TwSkaYlUCetTup9eOgljpGzy2R9XYVMQTBRDsFcheHY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BpSkZhkoPLKrQI65lpHTbVK2VB21JSE/GWwXMiphNCXE1hnBcecbiXh4FXw/FjsFv
	 m1WH6ogg7eBswuzZI754VA8d+8GW3SWwLRmCDmoNavwgX9SAZJCXYBPc3+QxiBv2zs
	 4jp387XT8+0BwIuAPToLIXczr523kRVODxO8dl9iLjskBrjQyBKpuXQcFtE+zwQDqG
	 LHsLibhHK7l4yawR77ps2+5KW5y0cSOapywZl81ooaleWYYYNMOXEd4iZn+dVWUDe3
	 MgUiK/yFFOcCSU9ukiOOB/kmDRdktyzrmovl2kuA0vyvN5GJNHEfLYYMFK85DcjG0S
	 3eXJ7NnzG7Mdg==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6B8BF3782110;
	Fri, 15 Mar 2024 15:50:37 +0000 (UTC)
Message-ID: <c106f1a9-f423-4cdc-acde-5491100e5f69@collabora.com>
Date: Fri, 15 Mar 2024 16:50:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/38] media: v4l: subdev: Copy argument back to user
 also for S_ROUTING
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
 <20240313072516.241106-14-sakari.ailus@linux.intel.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-14-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:24, Sakari Ailus wrote:
> As the user needs to know what went wrong for S_ROUTING, copy array
> arguments back to the user.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>   drivers/media/v4l2-core/v4l2-ioctl.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index d125d23e4e61..95bd56145d38 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -3415,11 +3415,14 @@ video_usercopy(struct file *file, unsigned int orig_cmd, unsigned long arg,
>   	 * FIXME: subdev IOCTLS are partially handled here and partially in
>   	 * v4l2-subdev.c and the 'always_copy' flag can only be set for IOCTLS
>   	 * defined here as part of the 'v4l2_ioctls' array. As
> -	 * VIDIOC_SUBDEV_G_ROUTING needs to return results to applications even
> -	 * in case of failure, but it is not defined here as part of the
> +	 * VIDIOC_SUBDEV_[GS]_ROUTING needs to return results to applications
> +	 * even in case of failure, but it is not defined here as part of the
>   	 * 'v4l2_ioctls' array, insert an ad-hoc check to address that.
>   	 */
> -	if (err < 0 && !always_copy && cmd != VIDIOC_SUBDEV_G_ROUTING)
> +	if (cmd == VIDIOC_SUBDEV_G_ROUTING || cmd == VIDIOC_SUBDEV_S_ROUTING)
> +		always_copy = true;
> +
> +	if (err < 0 && !always_copy)
>   		goto out;
>   
>   	if (has_array_args) {

-- 
Julien Massot
Senior Software Engineer
Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

