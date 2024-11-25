Return-Path: <linux-media+bounces-21989-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC309D85B4
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 13:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3501287219
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 12:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A115B1A724C;
	Mon, 25 Nov 2024 12:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GU70/2Cs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B541714AC;
	Mon, 25 Nov 2024 12:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732539402; cv=none; b=O5vyZ3XgPhx0wvor8pN+2BYFPNcjAmHjkuFfXVaFnYjzYYJ8OKb41xleeIDXZO2ZAatkLEBC/Q7VzErpwd5sih1CuC6u1OTpFjM7/si0Pdqdh5cJ85xxTdAJq+5Jp8J25l/yDEyKW9eN/iTZyqhHo4EaB8SBRtxibtTAtRwNNZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732539402; c=relaxed/simple;
	bh=xGiMg80bGNBrz6+/g1/qSVQHRAxmonKsOc2Lz3uatjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSzK2+EYTpU0gCQBo4H0Dy0WgcKg09ZWw7+b3s6Vb+LNStp/vtthkHy1YjTupYv2MNAjbfn5PgfSMjeuIp0Gu1ocpnxxSaiqNcr4WoiqHL/p3r737rQx7bE/OjZXsFL45Qs0CLwLLqsOdNadjn7XxQX86MjXtX4LBMWBfO2FRqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GU70/2Cs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2499A2F;
	Mon, 25 Nov 2024 13:56:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732539377;
	bh=xGiMg80bGNBrz6+/g1/qSVQHRAxmonKsOc2Lz3uatjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GU70/2CsBjK0UFKmlbEJMBlNqm250ISezFp3wVWprbgKmOpqeNaDDCaJfZe8sCkYg
	 YOw2AIwOP4DYV8WTNhRpA4G4rVkpcVKQPgWV8iG/C9lTOkdMtYy0hZH9IWJinEv+u9
	 aFFE1N/SFki5b2+HfRw2KKcpVXNESPHw0ryLp/ao=
Date: Mon, 25 Nov 2024 14:56:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
Message-ID: <20241125125629.GB32280@pendragon.ideasonboard.com>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com>
 <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
 <20241110151426.GD6002@pendragon.ideasonboard.com>
 <CANiDSCuRbOEhWi8WtJpJSm5SOjzTRzpk=OTOV_jwbhUQMoXszw@mail.gmail.com>
 <f2638853-6c0a-49ee-9a80-28fb774cc678@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2638853-6c0a-49ee-9a80-28fb774cc678@redhat.com>

On Mon, Nov 25, 2024 at 01:31:49PM +0100, Hans de Goede wrote:
> Hi Ricardo,
> 
> On 10-Nov-24 5:04 PM, Ricardo Ribalda wrote:
> > On Sun, 10 Nov 2024 at 16:14, Laurent Pinchart wrote:
> 
> <snip>
> 
> >>> Can we start powering up the device during try/set fmt and then
> >>> implement the format caching as an improvement?
> >>
> >> This sounds worth trying. We'll need to test it on a wide range of
> >> devices though, both internal and external.
> 
> Ack, as mentioned in the other mail which I just send I think
> this is worth trying.
> 
> > We still need a plan for asynchronous controls.
> 
> As I mentioned in that other email I think we can do the same there.
> 
> So basically delay powering up the camera from /dev/video# open till
> the first moment we actually need to communicate to the camera and
> track per file-handle if we did a usb_autopm_get_interface() for
> that file-handle and if yes, then do the put-interface on file-handle
> close.
> 
> > And we have to decide if we stop supporting the uvc button (maybe we
> > can start by moving USB_VIDEO_CLASS_INPUT_EVDEV to staging and see
> > what happens?)
> 
> As I mentioned in other threads I do not think that the button
> only working changing from:
> 
> "only works when /dev/video# is open"
> 
> to:
> 
> "only works when streaming from /dev/video#"
> 
> (or actually only works when some action on the camera which
> requires it to be powered-on has been done).
> 
> is a big deal, since most apps which open /dev/video# for
> a longer time will almost always do so to actually do something
> with the camera, at which point the button will work just as
> before.
> 
> And for apps which only do a short-lived open of /dev/video#
> the button does not work with the current code either.
> 
> TL;DR: IMHO it is fine if the button only works when streaming.

I'm fine with that, we can reconsider if people complain. It would be
painful though, as it could mean reverting everything we'll build
related to power management from now on until someone notices the new
behaviour, which could easily take a year. The risk is low, but the
consequences serious.

-- 
Regards,

Laurent Pinchart

