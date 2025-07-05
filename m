Return-Path: <linux-media+bounces-36884-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3A4AF9FF2
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 14:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACE185802E7
	for <lists+linux-media@lfdr.de>; Sat,  5 Jul 2025 12:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4828E254854;
	Sat,  5 Jul 2025 12:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AdqQL7Xh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C214E231845;
	Sat,  5 Jul 2025 12:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751717438; cv=none; b=LuGhfVl1xiuT7xDIhhkmKNWRDB78NsD4RajJQH5lOrT9G68XK4L3fsXbi1HIVbiryy+ZxNY/9K/sDfwVFpHzd9Shtuupj5u0qcnHpO3E52PhSAMbMzmTF+dUQW9w8lzsOwg953+0MWbaqnyuMKnsn7ihJSPtfmQhzSWoSJOxNkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751717438; c=relaxed/simple;
	bh=NstjxlBy9MNLPLgGJ8aLC/DH2Z6Z6ZEgfM7odRukTeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gliy9kn22SbtXYySRaZplhQqAzXiKvnKYkZJwujiw5IOhF1zeE4CKcmhr9lGM10VdLmdMklSKF0W6OpLQrdMzDR60ytrcllh96KftzwGGfBinoEzjlMDKcjNMJWLWhrVs2Rkvo4xARm8ZV/HXz7PWaibkEkVbuHn0QXL6gg1Kpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AdqQL7Xh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B3268A98;
	Sat,  5 Jul 2025 14:10:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751717403;
	bh=NstjxlBy9MNLPLgGJ8aLC/DH2Z6Z6ZEgfM7odRukTeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AdqQL7XhdTucIugj7CskDKXjaTo1+n1dntRBFL0pzJ27p8EedRY/6HUD+6rm0U6Wr
	 luzrJWgA+Lt5GUVzY9LI42JzW757lIKzR+BgaE0JPGuwzZ6qBS/G4CrBcjMJt8ZKXF
	 kLyNk0PA1OL1HsTIvY54SX5J3nwL/uYHxxQAbSzg=
Date: Sat, 5 Jul 2025 15:10:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] media: Remove remains of
 v4l2_subdev_video_ops.g_pixelaspect
Message-ID: <20250705121000.GD30285@pendragon.ideasonboard.com>
References: <20250705083741.77517-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250705083741.77517-1-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patches.

On Sat, Jul 05, 2025 at 10:37:38AM +0200, Niklas Söderlund wrote:
> Hello,
> 
> With the recent cleanup of the R-Car VIN driver the last user of the 
> subdevice operation .g_pixelaspect have been addressed. We can now 
> remove the two last implementations in adv7180 and adv748x, and then 
> remove the operation from the internal API.
> 
> The operation where kept in adv7180 and adv748x to support to R-Car VIN 
> as these devices are used on some of the evaluation platforms.
> 
> Patch 1/3 and 2/3 removes the implementations while patch 3/3 removes 
> the operation from the internal API.
> 
> Niklas Söderlund (3):
>   media: adv7180: Remove g_pixelaspect implementation
>   media: adv748x: Remove g_pixelaspect implementation
>   media: v4l2-subdev: Remove g_pixelaspect operation

For the whole series,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  drivers/media/i2c/adv7180.c              | 16 ----------------
>  drivers/media/i2c/adv748x/adv748x-afe.c  | 17 -----------------
>  drivers/media/i2c/adv748x/adv748x-hdmi.c | 10 ----------
>  include/media/v4l2-subdev.h              |  3 ---
>  4 files changed, 46 deletions(-)

-- 
Regards,

Laurent Pinchart

