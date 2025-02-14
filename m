Return-Path: <linux-media+bounces-26164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29758A36343
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 17:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76D9C1894BEC
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 16:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0E92673AA;
	Fri, 14 Feb 2025 16:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qXTcCHuT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA647E0ED
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 16:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739551044; cv=none; b=T2H1+N5oZJxLergZ0YvEKsL6XGq8Ym2NdQXGIJPxiixJOR2WIxuRPQKd5V7juMwcVmuDca67ggVWbugcYC2Skixlygg40S79cXf9wI96CpQ4mnQ6iSWZdl8B5mjxopBYh+kP8CRrm8Rjj1CRG/hNOqeQDzkQ9S0C4woJWWnrmTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739551044; c=relaxed/simple;
	bh=M1R4YS0Ji2DK04CJTpc+qETvSQHh7JKI2cxciNcFAFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQrvODRmM/WCRE9OCSPw671VmWqLvCPpWMXQwxxBFSQUwEBkIZseXITxXx8DI2w9sn71tvbhtKky7GUx8HiM+9QeknzygZsm0RXb6+o6yiHFpvq765MCmZvBkrW2d0v+9HbQQzzrJidvp9LTVtM7UI0KGZcau2SM+hRW5Ftaubg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qXTcCHuT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71B0D1419;
	Fri, 14 Feb 2025 17:36:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739550961;
	bh=M1R4YS0Ji2DK04CJTpc+qETvSQHh7JKI2cxciNcFAFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qXTcCHuTBDyitdKzeCgOHf17uMAZ4BCcdv42FK5BTDQMNzbEKEll369OKxyl1Tuo2
	 AfG9yRfAQ5kFLInn24b0QdkoIs6qGlDSjGs0ODd6n9Rf5TKUfAhRf8rlXqWpQwgBZY
	 dAKL3pLkX2d0xtydU4LnaXxn+Jslb48ZBZvi/gL8=
Date: Fri, 14 Feb 2025 18:37:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Zhaoxuan Zhai <zhai.zhaoxuan@canonical.com>,
	linux-media@vger.kernel.org,
	Ethan Hsieh <ethan.hsieh@canonical.com>, jianhui.lee@canonical.com,
	guoqing.jiang@canonical.com, hverkuil@xs4all.nl
Subject: Re: Questions about image size listed in VIDIOC_ENUM_FMT
Message-ID: <20250214163708.GA19466@pendragon.ideasonboard.com>
References: <96f6dff1-f5c7-4fab-94e1-47004dd916a6@canonical.com>
 <3bd7482f-e41d-41df-9d25-08cb62d5d0db@canonical.com>
 <Z67r76Fg-SOEbOJf@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z67r76Fg-SOEbOJf@valkosipuli.retiisi.eu>

On Fri, Feb 14, 2025 at 07:08:31AM +0000, Sakari Ailus wrote:
> On Fri, Feb 14, 2025 at 12:19:23PM +0800, Zhaoxuan Zhai wrote:
> > Hi all,
> > 
> > Sorry I made a mistake. It should be VIDIOC_ENUM_FRAMESIZES instead of
> > VIDIOC_ENUM_FMT. I'm sorry for the mistake.
> > 
> > 在 2025/2/14 12:08, Zhaoxuan Zhai 写道:
> > > Hi all,
> > > 
> > > We are working on a camera driver. We plan to use v4l2 interface to send
> > > image data to users. We have a question we'd like to ask.
> > > 
> > > The situation we are facing is as follows.
> > > 
> > > We have an image processing unit that can process raw data collected by
> > > the sensor into the V4L2_PIX_FMT_NV12M format and send it to the user.
> > > 
> > > However, due to the requirements of the V4L2_PIX_FMT_NV12M format, the
> > > width and height of the image must be divisible by 16.

I assume this is a requirement of your hardware (can you tell what
hardware you're running on ?) when outputting NV12. The NV12 format
itself doesn't require a 16 pixels alignment.

> > > For example, when the sensor provides an image size of 2104x1560, after
> > > NV12M encoding, it should be pading to  2112x1566. But the additional 8
> > > rows and 8 columns are padded with 0s and contain no actual content.
> > > 
> > > So, we would like to ask, in this case, what size should we list in
> > > VIDIOC_ENUM_FMT? Should it be the actual image size with content,
> > > 2104x1560, or the padded size, 2112x1566?"
> 
> I'd say the actual image size (i.e. where you have pixel data). The
> sizeimage field needs to reflect the padding and the user needs to be aware
> how the data is laid out in memory.

And of course the bytesperline field should report the total line
stride, including the padding.

-- 
Regards,

Laurent Pinchart

