Return-Path: <linux-media+bounces-20565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8202F9B5E6C
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 10:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E38528406E
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 09:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4651E130B;
	Wed, 30 Oct 2024 09:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MvRhnwaC"
X-Original-To: linux-media@vger.Kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC361D0E2F
	for <linux-media@vger.Kernel.org>; Wed, 30 Oct 2024 09:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730279027; cv=none; b=MJ3AS1bz+NjOPO/LJY6BSMefF/JZGqgZI5tAQ/+43HF3vYCwQSOxZ42i/flvhFh12JBwaJh93dBCJpUjzGadTsSWF/mg1au6AgU1LZ7eLqDRbef+vFPui1zSFEPKdOT5OrgOoRzNG89wZcENaunFrJOcAzaL+ji5SHKxgxpNyrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730279027; c=relaxed/simple;
	bh=bgAztEYb4vksdGn9OUiHkMqn/dc2PGy1JwYSd9LyAGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbzrNiXBNXCncLYbVcxlzQn1qoi+ezcVpVrr2oMtiVComiglHS1+IW0bUbshDe5BQXlOU3rCArNUfBjxyvFg8yp7E4HG7uTytzN7tgB3vJseZmffBLIn36AxQ04zXnwgEvRlH5LlrnM0rDq7wAU3/jFMNSXkfWLUm1IOOcH0udQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MvRhnwaC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82E6EB7E;
	Wed, 30 Oct 2024 10:03:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730279013;
	bh=bgAztEYb4vksdGn9OUiHkMqn/dc2PGy1JwYSd9LyAGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvRhnwaC0lavstZ3POCd8FX7BU4xAkuGmONaiYPbC5SoNC8VEYBLLTsx4h5JufW4/
	 /jpt7QIXK2Bw0KzmKeJt1lll8rn/MtRxurW1vNj4LJaj01T9Rte0jx55NuIeKkmA3R
	 m0QQHOQCpv/Lpy1fhSlm9rS+Basnb/4KijrzD59w=
Date: Wed, 30 Oct 2024 11:03:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.Kernel.org, hverkuil-cisco@xs4all.nl,
	tfiga@chromium.org, ribalda@chromium.org, yunkec@google.com,
	xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com, ming.qian@nxp.com
Subject: Re: [PATCH v2 2/3] v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
Message-ID: <20241030090330.GS22600@pendragon.ideasonboard.com>
References: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
 <20241030024307.1114787-3-ming.qian@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241030024307.1114787-3-ming.qian@oss.nxp.com>

On Wed, Oct 30, 2024 at 11:43:06AM +0900, ming.qian@oss.nxp.com wrote:
> From: Yunke Cao <yunkec@google.com>
> 
> Tested with VIVID
> 
>  ./v4l2-ctl -C rect -d 0
> rect: 300x400@200x100
> 
>  ./v4l2-ctl -c rect=1000x2000@0x0
>  ./v4l2-ctl -C rect -d 0
> rect: 1000x2000@0x0
> 
> Signed-off-by: Yunke Cao <yunkec@google.com>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  utils/v4l2-ctl/v4l2-ctl-common.cpp | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> index 40667575fcc7..538e1951cf81 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> @@ -614,6 +614,10 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
>  		case V4L2_CTRL_TYPE_AREA:
>  			printf("%dx%d", ctrl.p_area->width, ctrl.p_area->height);
>  			break;
> +		case V4L2_CTRL_TYPE_RECT:
> +			printf("%ux%u@%dx%d", ctrl.p_rect->width, ctrl.p_rect->height,

I find this notation ambiguous, it's not immediately clear when reading
10x10@20x20 if we're looking at a 10x10 rectangle positioned at (20,20)
or the other way around. media-ctl use (20,20)/10x10 which I think would
be a better notation.

> +			       ctrl.p_rect->left, ctrl.p_rect->top);
> +			break;
>  		default:
>  			printf("unsupported payload type");
>  			break;
> @@ -702,6 +706,9 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
>  	case V4L2_CTRL_TYPE_AREA:
>  		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
>  		break;
> +	case V4L2_CTRL_TYPE_RECT:
> +		printf("%31s %#8.8x (rect)   :", s.c_str(), qc.id);
> +		break;
>  	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>  		printf("%31s %#8.8x (hdr10-cll-info):", s.c_str(), qc.id);
>  		break;
> @@ -1279,6 +1286,11 @@ void common_set(cv4l_fd &_fd)
>  					sscanf(set_ctrl.second.c_str(), "%ux%u",
>  					       &ctrl.p_area->width, &ctrl.p_area->height);
>  					break;
> +				case V4L2_CTRL_TYPE_RECT:
> +					sscanf(set_ctrl.second.c_str(), "%ux%u@%dx%d",
> +					       &ctrl.p_rect->width, &ctrl.p_rect->height,
> +					       &ctrl.p_rect->left, &ctrl.p_rect->top);
> +					break;
>  				default:
>  					fprintf(stderr, "%s: unsupported payload type\n",
>  							qc.name);

-- 
Regards,

Laurent Pinchart

