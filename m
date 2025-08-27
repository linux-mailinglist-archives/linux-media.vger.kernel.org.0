Return-Path: <linux-media+bounces-41198-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAF2B387BB
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 18:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD4E5362348
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 16:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DC125B1DC;
	Wed, 27 Aug 2025 16:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DavaZsGL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9011E225795;
	Wed, 27 Aug 2025 16:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756311876; cv=none; b=dASHO29XAMguUATNfppZyIImmLXCgBM4zlap7sVUUa9LROYbiRncASUUleCOXnIrEiu5VvaSolhAhZBPg36vT3N0m7ALY6Bct0pZuDENFjqIItDuE5GNmGHoGEDRIiYnsaFQs45zBwGOq1Ka3iyHTw6HSZsHh+PkxRJr1lNw5OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756311876; c=relaxed/simple;
	bh=xQ2+M+8xJ29JQ0MSY2oJxEjDqy96jcPkiT0ZE/wDkd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWd/8Jd13sIBGGZ9fNaE9nHNQGdD2hHO0gk7rv8iHKQbzboFYFi9FxOtbaiI1JCaf/C9MqxX9P4QFuzD0rAfzMVy7efMFVdl97HVhCSWCb9MWwkJouzHdRPLsGMaO+vC7B7O//EJsC7ugJ2wh49LIJ7oIj0cQl2tlEJh3FvRCc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DavaZsGL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-54-205.net.vodafone.it [5.90.54.205])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3ECB93484;
	Wed, 27 Aug 2025 18:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756311807;
	bh=xQ2+M+8xJ29JQ0MSY2oJxEjDqy96jcPkiT0ZE/wDkd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DavaZsGLoLp991eHqEjP3sZEwyHISQJtN7KDKUZ6ozpi9Dzmqqq7FkMutQMMoKeQJ
	 a6yVxXjFqIymPWBSt4q9zN+syjZR8B6UGEa0xF9/RF9y3TFP/L7Znw/F8iAdgkZlUp
	 lvEdSXD4oS2YoRTSVlnXEEyZC+fopCPrz0n4K6lc=
Date: Wed, 27 Aug 2025 18:24:26 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"open list:MT9V111 APTINA CAMERA SENSOR" <linux-media@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] media: i2c: mt9v111: fix incorrect type for ret
Message-ID: <x3wogjf6vgpkisdhg3abzrx7v7zktmdnfmqeih5kosszmagqfs@oh3qxrgzkikf>
References: <20250827123916.504189-1-rongqianfeng@vivo.com>
 <20250827123916.504189-3-rongqianfeng@vivo.com>
 <xbmwlnflzhfhapyt5dinqqsdurxgu5imlqixudopb7z32eteth@cs7hulza54e3>
 <411e9db5-5339-4527-bb3d-473b339a6572@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <411e9db5-5339-4527-bb3d-473b339a6572@vivo.com>

Hi Qianfeng

On Wed, Aug 27, 2025 at 11:41:26PM +0800, Qianfeng Rong wrote:
>
> 在 2025/8/27 20:58, Jacopo Mondi 写道:
> > [You don't often get email from jacopo.mondi@ideasonboard.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Hi Qianfeng
> >
> > On Wed, Aug 27, 2025 at 08:39:10PM +0800, Qianfeng Rong wrote:
> > > Change "ret" from unsigned int to int type in mt9v111_calc_frame_rate()
> > > to store negative error codes or zero returned by __mt9v111_hw_reset()
> > > and other functions.
> > >
> > > Storing the negative error codes in unsigned type, doesn't cause an issue
> > > at runtime but it's ugly as pants.
> > >
> > > No effect on runtime.
> > well, I'm not sure that's true.
> >
> > The code goes as
> >
> >          ret = __mt9v111_hw_reset(mt9v111);
> >          if (ret == -EINVAL)
> >                  ret = __mt9v111_sw_reset(mt9v111);
> >          if (ret)
> >                  return ret;
> >
> > And if ret is unsigned the condition ret == -EINVAL will never be met.
> >
> > I guess this actually fixes a bug, doesn't it ?
> > You can add:
> >
> > Cc: stable@vger.kernel.org
> > Fixes: aab7ed1c3927 ("media: i2c: Add driver for Aptina MT9V111")
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > Thanks
> >    j
>
> I have written a test program on the arm64 platform:
>
> unsigned int ret = -ENOMEM;
>
> if (ret == -ENOMEM)
>     pr_info("unsigned int ret(%u) == -ENOMEM\n", ret);
> else
>     pr_info("unsigned int ret(%u) != -ENOMEM\n", ret);
>
> Output log is: unsigned int ret(4294967284) == -ENOMEM

Indeed, I was very wrong and ignoring the C integer promotion rules.

If I read right the "6.3.1.8 Usual arithmetic conversions" section of
the C11 specs I found freely available online (ISO/IEC 9899:201x), in
particular:

if the operand that has unsigned integer type has rank greater or
equal to the rank of the type of the other operand, then the operand with
signed integer type is converted to the type of the operand with unsigned
integer type.

Indeed the above doesn't introduce any functional change (as the
'rank' of an unsigned int is the same as the one of an int [1])

I would anyway consider it at least a "logical" fix, as comparing an
unsigned int to a negative error code is misleading for the reader at
the least.

Thanks anyway for testing.

[1] Section "6.3.1.1"
The rank of any unsigned integer type shall equal the rank of the corresponding
signed integer type, if any.

>
> I suspect that -ENOMEM is forcibly converted to an unsigned type during the
> comparison, but I am not sure if this behavior is consistent across all
> platforms and compilers. Therefore, I agree that your suggestion and will
> submit the v2 version.
>
> Best regards,
> Qianfeng
>

