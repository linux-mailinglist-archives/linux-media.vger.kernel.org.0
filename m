Return-Path: <linux-media+bounces-9304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AD38A47D2
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 08:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04F791F218DB
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 06:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172D2749A;
	Mon, 15 Apr 2024 06:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AsUijs+F"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CFE1AACA
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 06:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713161533; cv=none; b=AfAkdKLfzxCgDR4anvciMrOh1Nt7gD2RbmHlfgoVuq99L/Irr4sGRthnKHQU8P3nPZHgJ+oGT0LPwcWtoM1LmVDJ3TAMYf64RN6zzGyY1xv8mpbVvKUMg/rYVyG6B6Ti6HGZMSbIfaiBnNgbPaIbBAz2YBuLTJmnJUYnKfecWRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713161533; c=relaxed/simple;
	bh=raM3aT4krfnP+7l1/1TUBe83larEYgrxqxrtjr6vNsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKIFB8blL3XiiL44m9uBqvuOvBWRq0mncTbWq4IUJXlI4vm84kqjoRA2+/IOsqgO3nzDbJ1uQCjR/ie3QSnGXPBFINThq/TrMvy7wYaOPEiQOcJeooTuTkUE4JpjdBghA0Y+16xGK4TYTI1RrDl6KVZX5yMH+XGsjqjT1afMdLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AsUijs+F; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.105] (unknown [103.86.18.210])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A736B5B2;
	Mon, 15 Apr 2024 08:11:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713161478;
	bh=raM3aT4krfnP+7l1/1TUBe83larEYgrxqxrtjr6vNsM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AsUijs+F6iInPDQG3k+l91YTUJ7UwDlxlRBm6vfnby28apor8axVuNGgtGkrVpdoc
	 Ec2DAsycC8WZIfyO46Hom2/6djY9NyKiIrgFtq/GhYpHDau8DLooA5cGT7X7Za+enr
	 lOEI/mHlzHtDVTHgmSriQ99sk0GqDEL7Nf5QgPYg=
Message-ID: <7c75f677-c8d3-43c8-8315-482928f2d38f@ideasonboard.com>
Date: Mon, 15 Apr 2024 11:41:58 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: v4l2-ctrls: Return handler error in creating
 new fwnode properties
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl
References: <20240412130901.849869-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240412130901.849869-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 12/04/24 6:39 pm, Sakari Ailus wrote:
> If the control handler is in an error state, return that error immediately
> in v4l2_ctrl_new_fwnode_properties(). Effectively the change here is that
> the same error code (handler's error) is returned in all cases instead of
> possibly returning -EINVAL.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>

> ---
>   drivers/media/v4l2-core/v4l2-ctrls-core.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index c4d995f32191..670325ca995e 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -2564,6 +2564,9 @@ int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
>   				    const struct v4l2_ctrl_ops *ctrl_ops,
>   				    const struct v4l2_fwnode_device_properties *p)
>   {
> +	if (hdl->error)
> +		return hdl->error;
> +
>   	if (p->orientation != V4L2_FWNODE_PROPERTY_UNSET) {
>   		u32 orientation_ctrl;
>   


