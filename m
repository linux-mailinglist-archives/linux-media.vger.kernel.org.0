Return-Path: <linux-media+bounces-36701-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A9CAF7F84
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B98A8163E2C
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 18:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D542F235D;
	Thu,  3 Jul 2025 18:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f2fywMU4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB3F1DDA0C;
	Thu,  3 Jul 2025 18:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751565779; cv=none; b=Z7EoK8l5MXouJA/QbgdRT3xzPkYzJnDMyR54ZQI5+yiB9EhXtAYherVZV1iKhKEkAak0qXGFsmLYrK38JA5iZihPP5v8DS3dEXosXvvCxTzhO0ZIYBSYBrGcr5ypwQngIjBuvuMYmIFgoUcxJRw/Crl8gizjKYtl/hCkMVj3qpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751565779; c=relaxed/simple;
	bh=v/I1dsSqNAw4VzACte/moRciziTu8q9oyU6gnYg2cn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EpeJNyYJKCsHoQqlkMHgdRm4rLgau2DC6uPer2t7JRgtkVBTmFaV+uA4w+0QNPwOnkIuMVUpWDgG91DJJWPB/+AZHTelEtCwzI+VRfJIGABepLMnbOVjsp7hsEh+KfBKhDSi1111reseQJWE2vRtqFlPbZAmHDO32haYurYpkn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f2fywMU4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E251B6BE;
	Thu,  3 Jul 2025 20:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751565752;
	bh=v/I1dsSqNAw4VzACte/moRciziTu8q9oyU6gnYg2cn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f2fywMU4DxaOoTEgWphDg4lYFBbac0Ssp82ncoEWY/W3JdJcmm8LxZJHXBDS2g9bH
	 lOCv8LSb0nbLoRSLfDdCc5PHKbZSm7j1I6WnP/d1aLC++oZAhNxKNO7nXwIZJJzu0t
	 uUiYvF2kUgXEF5iwg48rMzd0jRtE91bPhscobw7o=
Date: Thu, 3 Jul 2025 21:02:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
Message-ID: <20250703180228.GA20240@pendragon.ideasonboard.com>
References: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
 <20250626002053.GA12213@pendragon.ideasonboard.com>
 <473ad0ce-5180-40e9-b159-a6cfe77f792f@suswa.mountain>
 <20250626083018.GB8738@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626083018.GB8738@pendragon.ideasonboard.com>

On Thu, Jun 26, 2025 at 11:30:18AM +0300, Laurent Pinchart wrote:
> On Thu, Jun 26, 2025 at 03:32:50AM +0300, Dan Carpenter wrote:
> > On Thu, Jun 26, 2025 at 03:20:53AM +0300, Laurent Pinchart wrote:
> > > On Wed, Jun 25, 2025 at 10:22:32AM -0500, Dan Carpenter wrote:
> > > > This was returning IS_ERR() where PTR_ERR() was intended.
> > > > 
> > > > Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")
> > > 
> > > I'll add a
> > > 
> > > Cc: stable@vger.kernel.org
> > > 
> > > to obey the media subsystem CI rules.
> > 
> > Wait, what?  The original commit hasn't hit Linus's tree and it's
> > not marked for stable either.
> 
> I'm personally not in favour of adding Cc: stable on all patches that
> have a Fixes: line. I'll let Mauro defend the rule, and I'm happy to
> drop the Cc line and fix the CI.

Mauro, could you please tell what would be your preference ?

-- 
Regards,

Laurent Pinchart

