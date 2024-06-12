Return-Path: <linux-media+bounces-13114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FAB905D2C
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 22:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8786F1F22304
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 20:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DED084E16;
	Wed, 12 Jun 2024 20:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DxsBvOM7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9608D55C3E
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 20:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718225592; cv=none; b=XbTVphDFaFEpWVsQwfSm7MSsGtQE1ePkCO5nOYUVCu2OXlrBs0aVAtBndJQGw12hZu147+j+tJkBM21wh2WAd9/zr3AeEUDSw9qNBJDOZfxFWL5Gk2iDGHYUnUgkRIMsZPrY/2NnsAKEm8chO9AgHxLnFuObR0sENO+b+r/LI4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718225592; c=relaxed/simple;
	bh=NaxZVQJehRTITyTSdMpSPNI5GgMIyG2Jfi5riUT+7Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1s0+dH7QMPTwlr17DQYu+fSS/iNNaLrd37+NSovvR8TFdZHWCxvRanVmRrBZZEG/f+VBQ1wRmGMWJVNuWk2Sjyg9+HpdVa69CTnamvQ15cfNeVn5hyBtDt0SmKnawvRiIr99xuKk0BxtceHXqkmvtEJeyHUz+s17VNubwSVeH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DxsBvOM7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E2A915B5;
	Wed, 12 Jun 2024 22:52:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718225575;
	bh=NaxZVQJehRTITyTSdMpSPNI5GgMIyG2Jfi5riUT+7Ks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DxsBvOM7W3DKHxGQWwdOtePFWipIUg9mtMivECFUYNErXDtQm7d5AbFGKcveKDDtq
	 BWOV1hyQujJhCjoYnQL51liDi+tgydtTWbCGA0edQpWi92ceUk9CkmBFVzkgFJfOdd
	 8KOqwTkfJq5dkYeAgHq0IgsJDm3s6FPoy++0ECWE=
Date: Wed, 12 Jun 2024 23:52:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Tomasz Figa <tfiga@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
Message-ID: <20240612205249.GB11102@pendragon.ideasonboard.com>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
 <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com>
 <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
 <2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl>
 <20240612095448.1e99b751@coco.lan>
 <CAAFQd5BRJt7HB+=Xc8sq+xj1eLOoeUGnFp=Ndv6WJzcw_39wEg@mail.gmail.com>
 <20240612083430.GE28989@pendragon.ideasonboard.com>
 <20240612224406.41dd88fc@coco.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240612224406.41dd88fc@coco.lan>

Hi Mauro,

On Wed, Jun 12, 2024 at 10:44:06PM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 12 Jun 2024 11:34:30 +0300 Laurent Pinchart escreveu:
> 
> > Focussing on this topic, if we're brainstorming memory management for
> > media devices, I'd like to throw in a controversial idea. In addition to
> > being clearer on the fact that USERPTR is deprecated, I would like to
> > deprecate MMAP too and only focus on DMABUF. I believe Linux needs a
> > centralized buffer allocator, instead of having multiple allocation APIs
> > scattered in different places. There are design ideas in gralloc that we
> > could benefit from.
> 
> Deprecating USERPTR is doable, as not many apps use it, and they're
> mostly focused on complex camera/ARM scenario. Now, deprecating MMAP at 
> V4L2 core is a different history: lots of different userspace programs,
> including browsers and proprietary apps like zoom, etc. rely on MMAP
> support. We can only consider deprecating MMAP once applications switch 
> to DMABUF.

Deprecating doesn't mean dropping it right away, it means telling
application developers that DMABUF is the recommended way. We will still
have to support MMAP for a long time, including fixing bugs in it, as
that will be a long transition. And it first requires solving the
problem of centralizing allocation for DMABUF. It won't happen
overnight, but I'm trying to gather support for the idea, and get people
to collaborate on solving the technical problems that are currently
blocking this long term evolution. If the media subsystem endorsed the
effort, basically saying publicly that we are fine deprecating MMAP in
principle once a good replacement will be available, it may help. I
don't expect the deprecation to happen before at least two years, and
the removal from the kernel would probably take another 10 to 15 years
:-)

-- 
Regards,

Laurent Pinchart

