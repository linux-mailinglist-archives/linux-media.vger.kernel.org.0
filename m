Return-Path: <linux-media+bounces-20630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C42F29B7793
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 10:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A4C31C226D8
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 09:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C90194A7C;
	Thu, 31 Oct 2024 09:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s52W9emS"
X-Original-To: linux-media@vger.Kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F376F194C65
	for <linux-media@vger.Kernel.org>; Thu, 31 Oct 2024 09:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730367255; cv=none; b=GNj9Cl0sv+1ORuAgYYHVkZRQsvP2QqqKfeGai9OwfyNSO9MRFswPxH/ySfILTsMqfr2eAuFI1NluGxgRn3BPrlVpJAqj5jUBNR5MIH44wT30h5BPwjO19D82baKww8GGRU8iJURMGJLZNffI9A1QqE3bUxb4V/325GXu4Al3C1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730367255; c=relaxed/simple;
	bh=GfcS5213tS0F2T861daHigkHzrIAYwGRD7C+X+X1lbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=urCNGRjrZsSxe69OvR2qCSTQJE5w4EkyuYueV5T3pXh+5qL3awacTb8twXfJHvI4PwxNhxMTFO/lBFGMBkZQqeh+VpfUI4l+tL/l9dSk+rQldwrXq9ZSHmr4gBIlNvK84sEY8bc3C4rbaGUw+lUjo6aOoXoUk0CeHukF1RUd+pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s52W9emS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23DE3842;
	Thu, 31 Oct 2024 10:34:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730367247;
	bh=GfcS5213tS0F2T861daHigkHzrIAYwGRD7C+X+X1lbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s52W9emSjhpjiqyXaDHzkWqYsYdcw8IMLvuz8V6yhdLYZY286Zp5qOqVk7OfBfEr1
	 oiAwlrQrDCX9OUHd+lGkucUPa1jU4hMQnByT4LVB3bxA3D2LpMOAgf0E6U4qKeUYNa
	 mkx66GQ4VZE8rCK1xsPwhQoMA0/prOuZXPubT7uo=
Date: Thu, 31 Oct 2024 11:34:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.Kernel.org,
	tfiga@chromium.org, ribalda@chromium.org, yunkec@google.com,
	xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com, ming.qian@nxp.com
Subject: Re: [PATCH v2 2/3] v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
Message-ID: <20241031093403.GA2473@pendragon.ideasonboard.com>
References: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
 <20241030024307.1114787-3-ming.qian@oss.nxp.com>
 <20241030090330.GS22600@pendragon.ideasonboard.com>
 <12913e54-9343-42ab-ab1e-a33656e640af@xs4all.nl>
 <81b3dcb1-3c3a-41bc-895b-05657191b980@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <81b3dcb1-3c3a-41bc-895b-05657191b980@oss.nxp.com>

On Thu, Oct 31, 2024 at 05:19:02PM +0800, Ming Qian(OSS) wrote:
> On 2024/10/30 17:19, Hans Verkuil wrote:
> > On 30/10/2024 10:03, Laurent Pinchart wrote:
> >> On Wed, Oct 30, 2024 at 11:43:06AM +0900, ming.qian@oss.nxp.com wrote:
> >>> From: Yunke Cao <yunkec@google.com>
> >>>
> >>> Tested with VIVID
> >>>
> >>>   ./v4l2-ctl -C rect -d 0
> >>> rect: 300x400@200x100
> >>>
> >>>   ./v4l2-ctl -c rect=1000x2000@0x0
> >>>   ./v4l2-ctl -C rect -d 0
> >>> rect: 1000x2000@0x0
> >>>
> >>> Signed-off-by: Yunke Cao <yunkec@google.com>
> >>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> >>> ---
> >>>   utils/v4l2-ctl/v4l2-ctl-common.cpp | 12 ++++++++++++
> >>>   1 file changed, 12 insertions(+)
> >>>
> >>> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> >>> index 40667575fcc7..538e1951cf81 100644
> >>> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> >>> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> >>> @@ -614,6 +614,10 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
> >>>   		case V4L2_CTRL_TYPE_AREA:
> >>>   			printf("%dx%d", ctrl.p_area->width, ctrl.p_area->height);
> >>>   			break;
> >>> +		case V4L2_CTRL_TYPE_RECT:
> >>> +			printf("%ux%u@%dx%d", ctrl.p_rect->width, ctrl.p_rect->height,
> >>
> >> I find this notation ambiguous, it's not immediately clear when reading
> >> 10x10@20x20 if we're looking at a 10x10 rectangle positioned at (20,20)
> >> or the other way around. media-ctl use (20,20)/10x10 which I think would
> >> be a better notation.
> > 
> > Good point, I agree.
> > 
> > Ming Qian, can you also update patch 1/4 of the kernel patch series to
> > use the same formatting when logging the V4L2_CTRL_TYPE_RECT value?
> > 
> > Regards,
> > 
> > 	Hans
> 
> There is a issue in v4l2-utils, that ',' is the ending flag in 
> v4l_getsubopt(), then I can't set the rect control,
> for example:
> 
> $v4l2-ctl -d 0 -c rect="(0,0)/1000x2000"
> control '0)/1000x2000' without '='

The should be fixable in v4l_getsubopt().

> >>> +			       ctrl.p_rect->left, ctrl.p_rect->top);
> >>> +			break;
> >>>   		default:
> >>>   			printf("unsupported payload type");
> >>>   			break;
> >>> @@ -702,6 +706,9 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
> >>>   	case V4L2_CTRL_TYPE_AREA:
> >>>   		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
> >>>   		break;
> >>> +	case V4L2_CTRL_TYPE_RECT:
> >>> +		printf("%31s %#8.8x (rect)   :", s.c_str(), qc.id);
> >>> +		break;
> >>>   	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
> >>>   		printf("%31s %#8.8x (hdr10-cll-info):", s.c_str(), qc.id);
> >>>   		break;
> >>> @@ -1279,6 +1286,11 @@ void common_set(cv4l_fd &_fd)
> >>>   					sscanf(set_ctrl.second.c_str(), "%ux%u",
> >>>   					       &ctrl.p_area->width, &ctrl.p_area->height);
> >>>   					break;
> >>> +				case V4L2_CTRL_TYPE_RECT:
> >>> +					sscanf(set_ctrl.second.c_str(), "%ux%u@%dx%d",
> >>> +					       &ctrl.p_rect->width, &ctrl.p_rect->height,
> >>> +					       &ctrl.p_rect->left, &ctrl.p_rect->top);
> >>> +					break;
> >>>   				default:
> >>>   					fprintf(stderr, "%s: unsupported payload type\n",
> >>>   							qc.name);

-- 
Regards,

Laurent Pinchart

