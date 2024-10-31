Return-Path: <linux-media+bounces-20634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D602D9B786B
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 11:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51B05B252FB
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2024 10:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6EAC1991B9;
	Thu, 31 Oct 2024 10:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hv1pVJVI"
X-Original-To: linux-media@vger.Kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE9F12C478
	for <linux-media@vger.Kernel.org>; Thu, 31 Oct 2024 10:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730369372; cv=none; b=nnroQEV1LgA6D+WuMtx4i9EcZBbTwyiu6U5CqZydmxQEAe5hQhNYEpzH/Fz9XpNlA/TbGUY/lESKHpmoBAX9+Tc0fCDHIUaA9537x3fIonTrExfbzORvsmqRRfB0AUlfzYHGaoYz3Vg++DuWin3dc7f5I8ad1yGb5wx+zbO8D/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730369372; c=relaxed/simple;
	bh=wiuo6XNgp31Z/RtQJLbznxvxux19ZMNnViF9n+aj5Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mqz8/vAbcmBTDfiEZp9AGEBAu+tEgDQHKxYhzOZPRKmEF7RVEPcP8gljJFxM2p9yumbj8INFyj544KPggarktAjgy3ER8HXv3ac0OwSPe7InHUE1qOt65lgjtUTQK2Yi2wDEcfnC+WTCozQ+VJbLYQnIfgi+7LB+gMLDROf6rMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hv1pVJVI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8EB89EC;
	Thu, 31 Oct 2024 11:09:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730369364;
	bh=wiuo6XNgp31Z/RtQJLbznxvxux19ZMNnViF9n+aj5Cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hv1pVJVIzOp7A4VrsSG8W4mXf3uvrJ1eYxQ7L3fpnACsnA3wSQxfincsABA6f3lgE
	 xPTgR90sDDAJ/tw5mA40IAf1jmkk9uj3T+krMNjbBL3xKnytJckZegFBGw5gq439wE
	 YQhy/BiCWkt+zA+5mVj7cvaOvZeQ3wAFP73tuSQs=
Date: Thu, 31 Oct 2024 12:09:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.Kernel.org,
	tfiga@chromium.org, ribalda@chromium.org, yunkec@google.com,
	xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com, ming.qian@nxp.com
Subject: Re: [PATCH v2 2/3] v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
Message-ID: <20241031100920.GC2473@pendragon.ideasonboard.com>
References: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
 <20241030024307.1114787-3-ming.qian@oss.nxp.com>
 <20241030090330.GS22600@pendragon.ideasonboard.com>
 <12913e54-9343-42ab-ab1e-a33656e640af@xs4all.nl>
 <81b3dcb1-3c3a-41bc-895b-05657191b980@oss.nxp.com>
 <20241031093403.GA2473@pendragon.ideasonboard.com>
 <aeff111c-caac-425a-8152-a90ae04980ae@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aeff111c-caac-425a-8152-a90ae04980ae@oss.nxp.com>

On Thu, Oct 31, 2024 at 05:46:49PM +0800, Ming Qian(OSS) wrote:
> On 2024/10/31 17:34, Laurent Pinchart wrote:
> > On Thu, Oct 31, 2024 at 05:19:02PM +0800, Ming Qian(OSS) wrote:
> >> On 2024/10/30 17:19, Hans Verkuil wrote:
> >>> On 30/10/2024 10:03, Laurent Pinchart wrote:
> >>>> On Wed, Oct 30, 2024 at 11:43:06AM +0900, ming.qian@oss.nxp.com wrote:
> >>>>> From: Yunke Cao <yunkec@google.com>
> >>>>>
> >>>>> Tested with VIVID
> >>>>>
> >>>>>    ./v4l2-ctl -C rect -d 0
> >>>>> rect: 300x400@200x100
> >>>>>
> >>>>>    ./v4l2-ctl -c rect=1000x2000@0x0
> >>>>>    ./v4l2-ctl -C rect -d 0
> >>>>> rect: 1000x2000@0x0
> >>>>>
> >>>>> Signed-off-by: Yunke Cao <yunkec@google.com>
> >>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> >>>>> ---
> >>>>>    utils/v4l2-ctl/v4l2-ctl-common.cpp | 12 ++++++++++++
> >>>>>    1 file changed, 12 insertions(+)
> >>>>>
> >>>>> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> >>>>> index 40667575fcc7..538e1951cf81 100644
> >>>>> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> >>>>> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> >>>>> @@ -614,6 +614,10 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
> >>>>>    		case V4L2_CTRL_TYPE_AREA:
> >>>>>    			printf("%dx%d", ctrl.p_area->width, ctrl.p_area->height);
> >>>>>    			break;
> >>>>> +		case V4L2_CTRL_TYPE_RECT:
> >>>>> +			printf("%ux%u@%dx%d", ctrl.p_rect->width, ctrl.p_rect->height,
> >>>>
> >>>> I find this notation ambiguous, it's not immediately clear when reading
> >>>> 10x10@20x20 if we're looking at a 10x10 rectangle positioned at (20,20)
> >>>> or the other way around. media-ctl use (20,20)/10x10 which I think would
> >>>> be a better notation.
> >>>
> >>> Good point, I agree.
> >>>
> >>> Ming Qian, can you also update patch 1/4 of the kernel patch series to
> >>> use the same formatting when logging the V4L2_CTRL_TYPE_RECT value?
> >>>
> >>> Regards,
> >>>
> >>> 	Hans
> >>
> >> There is a issue in v4l2-utils, that ',' is the ending flag in
> >> v4l_getsubopt(), then I can't set the rect control,
> >> for example:
> >>
> >> $v4l2-ctl -d 0 -c rect="(0,0)/1000x2000"
> >> control '0)/1000x2000' without '='
> > 
> > The should be fixable in v4l_getsubopt().
> > 
> 
> I can see the following comments of v4l_getsubopt(),
> 
>     Parse comma separated suboption from *OPTIONP and match against
>     strings in TOKENS.
> 
> I am not sure if we can change it.

I think we can improve quotes handling by considering quoted substrings
as a single value, ignoring commas. Hans any opinion ?

> >>>>> +			       ctrl.p_rect->left, ctrl.p_rect->top);
> >>>>> +			break;
> >>>>>    		default:
> >>>>>    			printf("unsupported payload type");
> >>>>>    			break;
> >>>>> @@ -702,6 +706,9 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
> >>>>>    	case V4L2_CTRL_TYPE_AREA:
> >>>>>    		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
> >>>>>    		break;
> >>>>> +	case V4L2_CTRL_TYPE_RECT:
> >>>>> +		printf("%31s %#8.8x (rect)   :", s.c_str(), qc.id);
> >>>>> +		break;
> >>>>>    	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
> >>>>>    		printf("%31s %#8.8x (hdr10-cll-info):", s.c_str(), qc.id);
> >>>>>    		break;
> >>>>> @@ -1279,6 +1286,11 @@ void common_set(cv4l_fd &_fd)
> >>>>>    					sscanf(set_ctrl.second.c_str(), "%ux%u",
> >>>>>    					       &ctrl.p_area->width, &ctrl.p_area->height);
> >>>>>    					break;
> >>>>> +				case V4L2_CTRL_TYPE_RECT:
> >>>>> +					sscanf(set_ctrl.second.c_str(), "%ux%u@%dx%d",
> >>>>> +					       &ctrl.p_rect->width, &ctrl.p_rect->height,
> >>>>> +					       &ctrl.p_rect->left, &ctrl.p_rect->top);
> >>>>> +					break;
> >>>>>    				default:
> >>>>>    					fprintf(stderr, "%s: unsupported payload type\n",
> >>>>>    							qc.name);

-- 
Regards,

Laurent Pinchart

