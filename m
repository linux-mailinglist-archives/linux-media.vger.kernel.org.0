Return-Path: <linux-media+bounces-26165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12123A3634C
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 17:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1194188329F
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 16:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3EC2676DF;
	Fri, 14 Feb 2025 16:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cm2p9J7C"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F568635A
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 16:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739551235; cv=none; b=EXvnafQP07GxzlN1/gScA0LwObSwKCFgvmLl1sH8pRFw6lqM1/lqSNeXtnUq6cXnYcHQgAUqh2USQrlPtWf+wmkZ0V4Fj4/37rJpxNhxVNJuj1ie5TmoUmRXZH9lTToF5V29piFWjP+93pJQYwkKWIBG7fLqbhu8ju8NzkrRZ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739551235; c=relaxed/simple;
	bh=ojfXuqrVh2/vkRa1YABKxHOuESSubf2/Gs5UGK2Rl5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2mDUSxAIb4gXEjmnM7+aztMb9Cur6rflpVBnKSG4OSaNDs4iNwKucWJysNUR3q1bWy6dIJKK5rtpcWybc/k3FTLuorQmeHzv3Pkpejan/seNfwb66l04/VIqQ1ftekp0Vr8WvE4flZXrB5N6HmnYoDTuqp9ENEZNR61a7QbBG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cm2p9J7C; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2ABE710;
	Fri, 14 Feb 2025 17:39:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739551152;
	bh=ojfXuqrVh2/vkRa1YABKxHOuESSubf2/Gs5UGK2Rl5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cm2p9J7C8l9X5rcKfnIYSegyyDV1O7YH2FKfF1/D5qCGrtFSJKl/ma8nSL/P4JxSg
	 rGATbBPI9P5aPv8MhPqQe2OrsBPYRdg+nIQxNzIdnPv1Zqk3wXWCNHsO2UxJ59avAA
	 ZZk6T9MiP2q0PgVuTpobyCzN11iOM/FI1hSy/QOY=
Date: Fri, 14 Feb 2025 18:40:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Zhaoxuan Zhai <zhai.zhaoxuan@canonical.com>,
	linux-media@vger.kernel.org,
	Ethan Hsieh <ethan.hsieh@canonical.com>, jianhui.lee@canonical.com,
	guoqing.jiang@canonical.com, hverkuil@xs4all.nl
Subject: Re: Questions about image size listed in VIDIOC_ENUM_FMT
Message-ID: <20250214164019.GB19466@pendragon.ideasonboard.com>
References: <96f6dff1-f5c7-4fab-94e1-47004dd916a6@canonical.com>
 <3bd7482f-e41d-41df-9d25-08cb62d5d0db@canonical.com>
 <Z67r76Fg-SOEbOJf@valkosipuli.retiisi.eu>
 <4ab514ea0a365c758bbbc46382ad97ebc487d150.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ab514ea0a365c758bbbc46382ad97ebc487d150.camel@ndufresne.ca>

On Fri, Feb 14, 2025 at 09:57:08AM -0500, Nicolas Dufresne wrote:
> Le vendredi 14 février 2025 à 07:08 +0000, Sakari Ailus a écrit :
> > Hi Zhaoxuan,
> > 
> > On Fri, Feb 14, 2025 at 12:19:23PM +0800, Zhaoxuan Zhai wrote:
> > > Hi all,
> > > 
> > > Sorry I made a mistake. It should be VIDIOC_ENUM_FRAMESIZES instead of
> > > VIDIOC_ENUM_FMT. I'm sorry for the mistake.
> > > 
> > > 在 2025/2/14 12:08, Zhaoxuan Zhai 写道:
> > > > Hi all,
> > > > 
> > > > We are working on a camera driver. We plan to use v4l2 interface to send
> > > > image data to users. We have a question we'd like to ask.
> > > > 
> > > > The situation we are facing is as follows.
> > > > 
> > > > We have an image processing unit that can process raw data collected by
> > > > the sensor into the V4L2_PIX_FMT_NV12M format and send it to the user.
> > > > 
> > > > However, due to the requirements of the V4L2_PIX_FMT_NV12M format, the
> > > > width and height of the image must be divisible by 16.
> > > > 
> > > > For example, when the sensor provides an image size of 2104x1560, after
> > > > NV12M encoding, it should be pading to  2112x1566. But the additional 8
> > > > rows and 8 columns are padded with 0s and contain no actual content.
> > > > 
> > > > So, we would like to ask, in this case, what size should we list in
> > > > VIDIOC_ENUM_FMT? Should it be the actual image size with content,
> > > > 2104x1560, or the padded size, 2112x1566?"
> > 
> > I'd say the actual image size (i.e. where you have pixel data). The
> > sizeimage field needs to reflect the padding and the user needs to be aware
> > how the data is laid out in memory.
> 
> I'd be happy to see spec clarification in this regard. I also think
> that image size is best.

Which part of the spec do you think should be clarified ? I've always
thought that ENUM_FMT should report the image dimensions, with padding
being reported through bytesperline and sizeimage. Is there a place
where we say something else ? If so that should indeed be fixed.

> For NV12M, you can absorb the padding in per plane bytesperline /
> sizeimage of the v4l2_format structure. That means the enumerated size
> will match the format. Though, for NV12 (single plane) you'd have to
> set at least the padded height and implement the SELECTION API to
> return the cropping area.

NV12 is indeed ambiguous, as vertical padding reported by sizeimage
could be just at the end of the image, or split between planes.

> In practice, for application point of view, it would all have been
> easier if the v4l2_format was always padded width/height, with the
> display dimension explicitly provided. But I'm pretty sure upstream
> drivers implement a mix.
> 
> > Also cc Hans.

-- 
Regards,

Laurent Pinchart

