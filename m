Return-Path: <linux-media+bounces-20945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA249BD062
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 16:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E1571C21C6D
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 15:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59D61DA602;
	Tue,  5 Nov 2024 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vYxMX9kl"
X-Original-To: linux-media@vger.Kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D03D1D89E2
	for <linux-media@vger.Kernel.org>; Tue,  5 Nov 2024 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730820562; cv=none; b=ig3EeHYealZOwSdV86l9zH9EgLYHCiZb43VurZFMJ7NqBj8e8rF71a9PdKhDvT3f1X5YrOY2/p7Z+HpGt37Su5QBxZro8EVAA2GXyp/RUrt+SU2uIqlcqkuQd+qezAgYGi5l5fNSXvuyV1frNHKa7T/L8FbvaUzaqCI2AyCkgls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730820562; c=relaxed/simple;
	bh=m8xMb8RcdnLdQcXvXVeXJ5vaFOsfPwyYnBZFEyZgk+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFMB/h3L+lKBFiVyp9ysZX3kt33Q1y9UuuqWH5FgeNXEGwQavq4guySE3phisj/EWotkheylmvTtq7aaFdzJ+6/UejHuuf5nR2R23CAxr/RvdUFc1mJopDXA5/PCT+e1UFmPT7vA9ja1J/JLg1RUuI7OotRvy02YVMInLAEK7fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vYxMX9kl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 943B1874;
	Tue,  5 Nov 2024 16:29:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730820548;
	bh=m8xMb8RcdnLdQcXvXVeXJ5vaFOsfPwyYnBZFEyZgk+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vYxMX9kl2Fb29ppKmaOhBbfc9c7OXqEGU6rb11quD8BdN4d8xGOS3xj5drhtYQVB5
	 kgDupG8iye1GzrVPADJfzKZWhiBTAxwVCry/Hf7h/xD5pMR+q1GAZsTBRQpS7uXoqd
	 lqKLVILLe0lcJfxal/Wctn/5eAdaz5bujEBFJMZI=
Date: Tue, 5 Nov 2024 17:29:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, linux-media@vger.Kernel.org,
	tfiga@chromium.org, ribalda@chromium.org, yunkec@google.com,
	xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com, ming.qian@nxp.com
Subject: Re: [PATCH v2 2/3] v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
Message-ID: <20241105152908.GA14762@pendragon.ideasonboard.com>
References: <20241030090330.GS22600@pendragon.ideasonboard.com>
 <12913e54-9343-42ab-ab1e-a33656e640af@xs4all.nl>
 <81b3dcb1-3c3a-41bc-895b-05657191b980@oss.nxp.com>
 <20241031093403.GA2473@pendragon.ideasonboard.com>
 <aeff111c-caac-425a-8152-a90ae04980ae@oss.nxp.com>
 <20241031100920.GC2473@pendragon.ideasonboard.com>
 <8c5f9e10-538d-4dd8-a9ad-f81a5bb08185@oss.nxp.com>
 <d7818bb6-ffd8-41a7-bb2b-90ed20b44e40@xs4all.nl>
 <20241105085125.GH27775@pendragon.ideasonboard.com>
 <d2d2d4c0-1fdd-41d4-a4ad-b5a1f0673b23@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d2d2d4c0-1fdd-41d4-a4ad-b5a1f0673b23@xs4all.nl>

On Tue, Nov 05, 2024 at 10:01:32AM +0100, Hans Verkuil wrote:
> On 05/11/2024 09:51, Laurent Pinchart wrote:
> > On Tue, Nov 05, 2024 at 09:30:43AM +0100, Hans Verkuil wrote:
> >> On 04/11/2024 02:24, Ming Qian(OSS) wrote:
> >>> On 2024/10/31 18:09, Laurent Pinchart wrote:
> >>>> On Thu, Oct 31, 2024 at 05:46:49PM +0800, Ming Qian(OSS) wrote:
> >>>>> On 2024/10/31 17:34, Laurent Pinchart wrote:
> >>>>>> On Thu, Oct 31, 2024 at 05:19:02PM +0800, Ming Qian(OSS) wrote:
> >>>>>>> On 2024/10/30 17:19, Hans Verkuil wrote:
> >>>>>>>> On 30/10/2024 10:03, Laurent Pinchart wrote:
> >>>>>>>>> On Wed, Oct 30, 2024 at 11:43:06AM +0900, ming.qian@oss.nxp.com wrote:
> >>>>>>>>>> From: Yunke Cao <yunkec@google.com>
> >>>>>>>>>>
> >>>>>>>>>> Tested with VIVID
> >>>>>>>>>>
> >>>>>>>>>>     ./v4l2-ctl -C rect -d 0
> >>>>>>>>>> rect: 300x400@200x100
> >>>>>>>>>>
> >>>>>>>>>>     ./v4l2-ctl -c rect=1000x2000@0x0
> >>>>>>>>>>     ./v4l2-ctl -C rect -d 0
> >>>>>>>>>> rect: 1000x2000@0x0
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Yunke Cao <yunkec@google.com>
> >>>>>>>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> >>>>>>>>>> ---
> >>>>>>>>>>     utils/v4l2-ctl/v4l2-ctl-common.cpp | 12 ++++++++++++
> >>>>>>>>>>     1 file changed, 12 insertions(+)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> >>>>>>>>>> index 40667575fcc7..538e1951cf81 100644
> >>>>>>>>>> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> >>>>>>>>>> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> >>>>>>>>>> @@ -614,6 +614,10 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
> >>>>>>>>>>     		case V4L2_CTRL_TYPE_AREA:
> >>>>>>>>>>     			printf("%dx%d", ctrl.p_area->width, ctrl.p_area->height);
> >>>>>>>>>>     			break;
> >>>>>>>>>> +		case V4L2_CTRL_TYPE_RECT:
> >>>>>>>>>> +			printf("%ux%u@%dx%d", ctrl.p_rect->width, ctrl.p_rect->height,
> >>>>>>>>>
> >>>>>>>>> I find this notation ambiguous, it's not immediately clear when reading
> >>>>>>>>> 10x10@20x20 if we're looking at a 10x10 rectangle positioned at (20,20)
> >>>>>>>>> or the other way around. media-ctl use (20,20)/10x10 which I think would
> >>>>>>>>> be a better notation.
> >>>>>>>>
> >>>>>>>> Good point, I agree.
> >>>>>>>>
> >>>>>>>> Ming Qian, can you also update patch 1/4 of the kernel patch series to
> >>>>>>>> use the same formatting when logging the V4L2_CTRL_TYPE_RECT value?
> >>>>>>>>
> >>>>>>>> Regards,
> >>>>>>>>
> >>>>>>>> 	Hans
> >>>>>>>
> >>>>>>> There is a issue in v4l2-utils, that ',' is the ending flag in
> >>>>>>> v4l_getsubopt(), then I can't set the rect control,
> >>>>>>> for example:
> >>>>>>>
> >>>>>>> $v4l2-ctl -d 0 -c rect="(0,0)/1000x2000"
> >>>>>>> control '0)/1000x2000' without '='
> >>>>>>
> >>>>>> The should be fixable in v4l_getsubopt().
> >>>>>>
> >>>>>
> >>>>> I can see the following comments of v4l_getsubopt(),
> >>>>>
> >>>>>      Parse comma separated suboption from *OPTIONP and match against
> >>>>>      strings in TOKENS.
> >>>>>
> >>>>> I am not sure if we can change it.
> >>>>
> >>>> I think we can improve quotes handling by considering quoted substrings
> >>>> as a single value, ignoring commas. Hans any opinion ?
> >>
> >> I think commas are hard to parse. Note that v4l_getsubopt is normally a
> >> #define for getsubopt from glibc. So you can't change the behavior of
> >> that function.
> > 
> > Can't we ? Isn't it an internal function ?
> 
> No. It's there when it is compiled for systems without glibc.
> 
> But I guess we can just use our copy all the time.
> 
> >> I propose this format for parsing instead:
> >>
> >> widthxheight@(top;left)
> >>
> >> e.g.: 1000x2000@(0;0)
> >>
> >> According to this:
> >> https://www.dr-aart.nl/Geometry-coordinates.html
> >>
> >> the ';' is the separator in countries where a decimal comma is used
> >> instead of a decimal point.
> >>
> >> I prefer to have the position after the size of the rectangle, for two
> >> reasons: it feels more natural to talk about a 'rectangle of size S at position
> >> P', and it also makes it possible to allow a variant where only the size
> >> is given and the position will default to (0;0). I.e., we can support
> >> parsing either "widthxheight" or "widthxheight@(top;left)".
> >>
> >> However, logging rectangles in the kernel should use a comma instead of a
> >> semicolon. Inside v4l-utils just consistently use the semicolon.
> >>
> >> What do you think, Laurent?
> > 
> > We have a precedent of using (x,y)/WxH , both in the kernel and in
> > media-ctl. Breaking that with another syntax would cause trouble,
> > especially having different syntaxes between media-ctl and v4l2-ctl.
> > Think about the shell scripts that would need to convert from one syntax
> > to another for instance. I would very strongly like to avoid that.
> 
> Have we used that notation in the kernel? Where?

In kernel log message. We have quite a few occurences of "(%d,%d)/%ux%u"
(or the less correct "(%d,%d)/%dx%d"). That's not an ABI, but it's still
used.

For what it's worth, we're also using the same notation in libcamera
(not necessarily as a result of a careful design decision, but likely
more because it was already used by media-ctl and nobody thought twice).

> I will admit that I am not a fan of the media-ctl notation, I think it is
> weird. I think WxH@(x,y) is much more natural. But if v4l_getsubopt can be
> adapted for this, then I'm fine with it.

I don't have anything against WxH@(x,y) per-se, but having different
notations in different tools is in my opinion a big enough annoyance
that a new notation shouldn't be introduced without very compeling
reasons.

> >>> How about omitting the commas between the brackets when parsing subopt?
> >>>
> >>>
> >>>>>>>>>> +			       ctrl.p_rect->left, ctrl.p_rect->top);
> >>>>>>>>>> +			break;
> >>>>>>>>>>     		default:
> >>>>>>>>>>     			printf("unsupported payload type");
> >>>>>>>>>>     			break;
> >>>>>>>>>> @@ -702,6 +706,9 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
> >>>>>>>>>>     	case V4L2_CTRL_TYPE_AREA:
> >>>>>>>>>>     		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
> >>>>>>>>>>     		break;
> >>>>>>>>>> +	case V4L2_CTRL_TYPE_RECT:
> >>>>>>>>>> +		printf("%31s %#8.8x (rect)   :", s.c_str(), qc.id);
> >>>>>>>>>> +		break;
> >>>>>>>>>>     	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
> >>>>>>>>>>     		printf("%31s %#8.8x (hdr10-cll-info):", s.c_str(), qc.id);
> >>>>>>>>>>     		break;
> >>>>>>>>>> @@ -1279,6 +1286,11 @@ void common_set(cv4l_fd &_fd)
> >>>>>>>>>>     					sscanf(set_ctrl.second.c_str(), "%ux%u",
> >>>>>>>>>>     					       &ctrl.p_area->width, &ctrl.p_area->height);
> >>>>>>>>>>     					break;
> >>>>>>>>>> +				case V4L2_CTRL_TYPE_RECT:
> >>>>>>>>>> +					sscanf(set_ctrl.second.c_str(), "%ux%u@%dx%d",
> >>>>>>>>>> +					       &ctrl.p_rect->width, &ctrl.p_rect->height,
> >>>>>>>>>> +					       &ctrl.p_rect->left, &ctrl.p_rect->top);
> >>>>>>>>>> +					break;
> >>>>>>>>>>     				default:
> >>>>>>>>>>     					fprintf(stderr, "%s: unsupported payload type\n",
> >>>>>>>>>>     							qc.name);

-- 
Regards,

Laurent Pinchart

